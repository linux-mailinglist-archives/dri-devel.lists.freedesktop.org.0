Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 872307DC62C
	for <lists+dri-devel@lfdr.de>; Tue, 31 Oct 2023 07:01:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 483FA10E404;
	Tue, 31 Oct 2023 06:01:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25BC210E404;
 Tue, 31 Oct 2023 06:00:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698732059; x=1730268059;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=n9lWu2hQvVKZ++3I1jvjuqX4cIpFefKLadSO3gdrmPA=;
 b=P54VTyvMtvHyigf+8qE2b1DoiDbPnNMFNL8HFOrojFjs3gj4vDe3B9jI
 Sv0SU3G4kR8G/Y2+aIABd2NSKRBb5IJ/W+7lj+3tyzNpr3GzMmJvdc7rS
 5BNomJ7owQ0p0UB9V99MMURToSrWOdozDos8NjQkzeHlYP4YZyndE4gYe
 kNXtHB/WHjBhb8jxkazNVXrtmh3ukBLnr8mMlBlRI4WtYrwfUFHQSbfqH
 rnlxKmPao6sx7l/P7y7mu7woGe8BmazTtaXgvKG0PHHLoMR1osDF+yipw
 7yRfxtbdCCdKzEAqGNxr7k0AS2oMQc28dLIGC52D7Rei+erw9EJ77edh+ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10879"; a="385411219"
X-IronPort-AV: E=Sophos;i="6.03,265,1694761200"; d="scan'208";a="385411219"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2023 23:00:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10879"; a="1091888734"
X-IronPort-AV: E=Sophos;i="6.03,265,1694761200"; d="scan'208";a="1091888734"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Oct 2023 23:00:58 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 30 Oct 2023 23:00:54 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Mon, 30 Oct 2023 23:00:54 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Mon, 30 Oct 2023 23:00:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CbRWlF1yMjZzOHTyurz49NHsbQhc3/iVty6GvEni4Us+AeQw7wnMJR/jsYCpWSMn476odQPDp/zIW+L8Un2+q2M7CSNcW5RfO5lf9rvnrI7AHwmvBg/TKzL3MqeH2hODNCL+VfAlpsyzt2d2XVd6kF/5sAB0f18KaOsOdoDBjPAL5bKYjXlMz7E8G5JGrWHa/rxuv10JDIBQqVkSH1vkVv/+eS1uF67trCvkK0E7nXRwFQ8lSJLMZX8ZqAEMTSk8OPaZVv3hELlLYsFBRBKXKoFcPRqdhj+nreTH3vaA+TwjdGSJBHJS3Dk7+7Q58EoDchXKKUg3LBFTGJizSdYjlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n9lWu2hQvVKZ++3I1jvjuqX4cIpFefKLadSO3gdrmPA=;
 b=nfm/fpZqzUnud/tRXO1PHZPeP8inn3qs9fPh996sOxG5kLKcQNYBN+8VDVB6idPpbFQT49C0sF1nAaeDKb2qMuaMLUSNHM7Obb5iGPP4kUEgWZVaetcf8m98SykgMGqPieaD22lp2hWWDgphxPwUByVTwCZ1qK9NNqJxExJ++TELvUASwsxb0QiHMc4PWXTJZyNT0Fx0QO7paBKLBXQVH7mBZV+vt/XpH3nkACUQfbf1Hk71DTfx3V/A+KqjgFceMgWAzd053/VsenbdUEChDIRqsmPMyubgmUaLsNv7GmKi5twLbNvg4PlvQGZ2Y/p0L+BVy1N9ihl0BjjMK4CJWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by MN2PR11MB4661.namprd11.prod.outlook.com (2603:10b6:208:26b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.29; Tue, 31 Oct
 2023 06:00:52 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::9bdd:1d20:1b4e:3e92]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::9bdd:1d20:1b4e:3e92%7]) with mapi id 15.20.6933.028; Tue, 31 Oct 2023
 06:00:52 +0000
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
To: Dave Airlie <airlied@gmail.com>
Subject: RE: Build broken in drm-tip
Thread-Topic: Build broken in drm-tip
Thread-Index: AdoLt162ne2GlDzsQMCYNHkLIkPwDwAAvNiAAAEEeYAAAEChkA==
Date: Tue, 31 Oct 2023 06:00:51 +0000
Message-ID: <SJ1PR11MB6129B080791C13146FC0EB8DB9A0A@SJ1PR11MB6129.namprd11.prod.outlook.com>
References: <SJ1PR11MB61297BF7764AF1207571A872B9A0A@SJ1PR11MB6129.namprd11.prod.outlook.com>
 <CAPM=9txw6gYP+GoBvMBCWAP_W6_LSYg6SnHXQ9w1EjxA0UoOvQ@mail.gmail.com>
 <CAPM=9tzRY_UbddDSmfFP_Bi54HkB3m0F7xwNcO8J5pibuyZBhQ@mail.gmail.com>
In-Reply-To: <CAPM=9tzRY_UbddDSmfFP_Bi54HkB3m0F7xwNcO8J5pibuyZBhQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6129:EE_|MN2PR11MB4661:EE_
x-ms-office365-filtering-correlation-id: 908a7369-387a-4d51-6caa-08dbd9d6bcfb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nGf+TrTh9Te/13cooAHC1JY8gBomrddsHcRoKvKus2K9YXhLlEDxysZ004c/LUICFkRC9DgZ/QqUbceap9o50qI/HVNUWOhvRfuLl4aFYBQlSQB/+I4yNEgBKbVZ69B3AhgNlSKh8IC47howZe2vx/p0qR4V3uTgBFux82JCE6pbHJaE5nlgtSjzeOsm6bJlqS0tH9TORKbsKOB8TGqJMkz+7LWBZ/Dms84CGr6EwCV1bBjxvbIbmr4Mnm/JRIOu5wB+eSgVV5DCKgmEFlK4lJzMwlt1nqIwG8xiJL7BCHvWRJu4Ve/j4bQJ8OJQtPXPO2gT631Q3TsyKy+R7QWEQeP42XXDpHjzNdXMP8u2xs2eRKY5FARraehIHEifSNVGfXRmaQFzqCPTZfYoARcXz5ZVEPrWFEQ78rO0xB3vDKZENWB0Ne6OoMyAReUNPK7yg9A01oGDYjSUkXlGCJCd556pmnTIeHRgeY0Z81c2C7P+qxZ9tADqkT12pabqWQgPWfX0njLCGcTQT6fIfYvN23O1VBHTN5ds9Kj142arbUvBYvBBuyp1zjMPs8ZfOl75y/6T3CeOOxnqUmsaUuh/SA43pmvG/+knoAs1rqeaYB9FGiJyf/JcyxkNg60KUY3D
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6129.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(396003)(376002)(136003)(366004)(39860400002)(230922051799003)(451199024)(186009)(1800799009)(64100799003)(316002)(38100700002)(4744005)(7696005)(2906002)(6506007)(9686003)(41300700001)(53546011)(478600001)(64756008)(54906003)(6916009)(66446008)(66476007)(66556008)(66946007)(76116006)(8936002)(8676002)(4326008)(52536014)(5660300002)(83380400001)(86362001)(26005)(71200400001)(107886003)(82960400001)(33656002)(38070700009)(122000001)(55016003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WDlDZ2g0V1dCTnh4clcyYTBFa3lCTTlkQ1pPUnFaY3lGckNadmhJSHRFQXJH?=
 =?utf-8?B?T2dFYzkwbVdDb1BwblpINXZtS0VkNG5uQ3kxaU5NZ2k0eWZpdzc0cWVJUjVw?=
 =?utf-8?B?SlBmbytFeGFSM3dhQ25JdFRHc1piNFRMclNoYTBTa1ZYQVQ5TTZjZXZiZzBx?=
 =?utf-8?B?OXB4Y0Z2eFZVaHF1OXFWMXcyci91aWNVU1B0U1hDNy9HbEJRRVVNVm56dGF4?=
 =?utf-8?B?OUxSWkZsdEFLa25hZUtQOElEcFJUN2xXOERJWFZwejFrYUpHYnRxN1hES25U?=
 =?utf-8?B?Uy9XNHZXQnhaL3BjeUVRVDZYcmxlUVlLOHdReExtZVBzMituS2k4UGY3R1Fk?=
 =?utf-8?B?Slo2eDRvcGVsMmNRV0xudmNGRXBqOHhFVXd3R25MZEhvWUswb1hINXp0d2tS?=
 =?utf-8?B?czdEQ0FCOTlGblFIaTZKQUU5RzJqL1B2RkpTUWZxejhoVEJ2cHk1dE00QXk4?=
 =?utf-8?B?TERVL3Z0TS9LWDVRZm40c0lWbFFaUFBZeERDTlVScXBHajRBVXcwTVV6bmly?=
 =?utf-8?B?cGMxdUpyL0xEeFhZV1NQZmpxUkRXc2NLeVNlK05LdkVIWDVSMzJ5WkZlUlFu?=
 =?utf-8?B?YUtkb3E5OVJMWTVlT1FuSVBHd2RHa09WY09Pc2pLeXRndFJTb0Y5T2RMdWZS?=
 =?utf-8?B?S24rV3dxL24wRDcrQ2V2MElhM3lneVVvTCtEdW8wK2gwRjBFQmxlNjRmVUd1?=
 =?utf-8?B?Wjc1RlQzVTVxLzlzWmZlNGs5UzlNcFdnN2ZrOG92Z2NrZE9FWnZsWmd6eU1B?=
 =?utf-8?B?bU1EUGNrZkZZVEdWOE9hMjJxV01MYW1NaFg4b2ZwTlh5cU5Hb2lxRDVNZGFi?=
 =?utf-8?B?S3pLM2JkeXdRS3Vtd0o0QmJ0VUtOOVFiMkxzNDRhempvT2pRSjdYbTJxbHZl?=
 =?utf-8?B?UkgyZU9jY01MWk9jVU10bzhMekFxb0pxMkRKU3BXVC9mUmJmRjFVaWNVeUNB?=
 =?utf-8?B?R0JFbWZtMi9DRE5yS0tkNlBYNHoyQWNxa2NBMDREb1F1NG9rSS8yelg3dzZz?=
 =?utf-8?B?elF6TnV2M3VGalQwbWExQWR5d2NFREVTenlaVDdTZmdWVy96V2lIV25LOG5P?=
 =?utf-8?B?K2tJOE1YakxDWHRtZWdFYjIvYVZyY1FBN2NDSXhzOXBUdUdSLzRGenIrdVla?=
 =?utf-8?B?OFpOdXMrZnQ5V1IrNkFScDB1SnRnK0Rpa3FON3BjakZ3RzNkR1V6Tzk1a1V6?=
 =?utf-8?B?YXhYY0lWNHFXNTM5bWZPMHFZR1pPMnBsb2NTTm42d1Yrc2hOYXJEUjVkUmtn?=
 =?utf-8?B?OGVIRUxUa1B6SmtoRFFyV293N05GMkY4UkdTdHdyYXFIY0w0VG9KTVB3YUI2?=
 =?utf-8?B?Qy80bkREbWN1eDZ2YmFxZHh0aWJsdWlOY2sxWE5kYWpjOHFtOFhZakNtdHJp?=
 =?utf-8?B?aEdRWEpleWFoQzdsUVZ0OURac05mOWdXUGJhUGt5QTE0aFpOek5EVEE2eGIy?=
 =?utf-8?B?NEJkSkxFZ2QyT1RINHd1NlRnVy9SNStZdE1PcnJ0cDVta1h2ZUQ2WkZTY2hx?=
 =?utf-8?B?OWNDdWFnMHlHaVJhUU0zeXdRb3l4MVhMY2JPejBxTU4vU1FWcXdWWFdaMEFu?=
 =?utf-8?B?VlRKYWNNaXZEc055MlFXTmN1TXNHMU15VW91dWNtcVB5NFFrVFNwdDcvTG0x?=
 =?utf-8?B?ai9KeFlxSUJWdjJyR0hMM1pSYTZ0TmFnc1MzaUxTNmJkSkdmUzJCc0d4RHJB?=
 =?utf-8?B?ODJONHJ0M1NnSy9tRG90OTR5bmNHTFdhdXcwTHJ5RnljVWxvKzZRamVHNGc2?=
 =?utf-8?B?MnAzVlZaUGVsd05Pa2pHQjVqYUNRZTRiTjY2VXlQamtSeGV3eGZvdEhhNnFr?=
 =?utf-8?B?NkYxNDMzT1dxb1B2QjhwNWI1THdoS3ZQNzFxODE1YzJZZ2dzLzdlaTFDd1lL?=
 =?utf-8?B?QU9wdXRJUXh2bFhWSi82Qmo0Q2NVRitISDJJV1B0VHVXeFhGYWRVbTI0cGl4?=
 =?utf-8?B?OWllRUVtVVRlVGQrZ0xlS3lVTTVId0lxTncvV04xeU5TYVRXcFYzdG0xNm1Z?=
 =?utf-8?B?bnRjUGdGYzZNZW1IYjJlZGc5ZUo0MkJmdHA2U1c0by9GWkFJZ1ZwZEhiNk9I?=
 =?utf-8?B?eG9oby9MR3NlQ3ZZZnFycWl3ZTZkbDlEeXBsQVkzK1VnZ0YxNWNvL0lCY2hI?=
 =?utf-8?B?RHBsN2JFTDdKWXFGaVFqalhYaWdubHcwZVFqU2Z3SFdKeW9vT1ZVZkpOdnd6?=
 =?utf-8?B?dVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 908a7369-387a-4d51-6caa-08dbd9d6bcfb
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Oct 2023 06:00:51.9767 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Hb0lOSLwHF0gtDhJijL9CYhoAUZ4T8G+sESBrXO02XcOVvlXLxMr2s5Pa7H4eUjwwJGy5kvpMs+aGyeccsac6tdE1D0XyQGy5FQHnT3KblE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4661
X-OriginatorOrg: intel.com
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "mario.limonciello@amd.com" <mario.limonciello@amd.com>, "Kurmi,
 Suresh Kumar" <suresh.kumar.kurmi@intel.com>, "Nautiyal,
 Ankit K" <ankit.k.nautiyal@intel.com>, "Saarinen,
 Jani" <jani.saarinen@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGVsbG8gRGF2ZSwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBEYXZl
IEFpcmxpZSA8YWlybGllZEBnbWFpbC5jb20+DQo+IFNlbnQ6IFR1ZXNkYXksIE9jdG9iZXIgMzEs
IDIwMjMgMTE6MjIgQU0NCj4gVG86IEJvcmFoLCBDaGFpdGFueWEgS3VtYXIgPGNoYWl0YW55YS5r
dW1hci5ib3JhaEBpbnRlbC5jb20+DQo+IENjOiBtYXJpby5saW1vbmNpZWxsb0BhbWQuY29tOyBp
bnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBTYWFyaW5lbiwNCj4gSmFuaSA8amFuaS5z
YWFyaW5lbkBpbnRlbC5jb20+OyBOYXV0aXlhbCwgQW5raXQgSw0KPiA8YW5raXQuay5uYXV0aXlh
bEBpbnRlbC5jb20+OyBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBLdXJtaSwgU3Vy
ZXNoDQo+IEt1bWFyIDxzdXJlc2gua3VtYXIua3VybWlAaW50ZWwuY29tPg0KPiBTdWJqZWN0OiBS
ZTogQnVpbGQgYnJva2VuIGluIGRybS10aXANCj4gDQo+IE9uIFR1ZSwgMzEgT2N0IDIwMjMgYXQg
MTU6MjMsIERhdmUgQWlybGllIDxhaXJsaWVkQGdtYWlsLmNvbT4gd3JvdGU6DQo+ID4NCj4gPiBP
biBUdWUsIDMxIE9jdCAyMDIzIGF0IDE1OjA5LCBCb3JhaCwgQ2hhaXRhbnlhIEt1bWFyDQo+ID4g
PGNoYWl0YW55YS5rdW1hci5ib3JhaEBpbnRlbC5jb20+IHdyb3RlOg0KPiA+ID4NCj4gPiA+IEhl
bGxvIE1hcmlvLA0KPiA+ID4NCj4gPiA+IFRoaXMgaXMgQ2hhaXRhbnlhIGZyb20gdGhlIExpbnV4
IGdyYXBoaWNzIHRlYW0gaW4gSW50ZWwuDQo+ID4gPg0KPiA+ID4gV2UgYXJlIHNlZWluZyBhIGJ1
aWxkIGlzc3VlIGluIGRybS10aXBbMV0NCj4gPg0KPiA+IFNvcnJ5IHRoYXQgd2FzIGEgbWlzbWVy
Z2UgZnJvbSBtZSwgbGV0IG1lIGdvIGZpeCBpdCBmb3Igc3VtbW9uIHNvbWVvbmUNCj4gZWxzZS4N
Cj4gDQo+IFNob3VsZCBiZSBmaXhlZCBub3cuDQo+IA0KDQpUaGFuayB5b3UgZm9yIHRoZSBxdWlj
ayBmaXguDQoNClJlZ2FyZHMNCg0KQ2hhaXRhbnlhDQoNCj4gc29ycnkgZm9yIG5vaXNlLA0KPiBE
YXZlLg0K
