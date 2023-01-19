Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0346C674626
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jan 2023 23:33:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5C4310E281;
	Thu, 19 Jan 2023 22:33:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 489D410E27D;
 Thu, 19 Jan 2023 22:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674167610; x=1705703610;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=FdgIQ/9goFQFTeUJEjRVLQbErUM28+yxb2OZComi8KA=;
 b=MBxbEKcEgvRkB6KWG2xVigmOa0N/RdBgIo94AOJKo+5ARmdvJk2FcvZm
 mXbDy6jl5gEEftcEZzrmaQAq/kFdtC1/8fu8h0wRNvnHQ2BtDzKr+UXhu
 Dv5bh4ryk1PToq+S5No4h8cfxpRZ7krRmywlc6oqk8vs8g7i0XQVs8H1w
 eUQOFsMrTdASB5djAZbHeq/N+En9AzYiVJO5eDom9mi5IJgBEe8MY6wil
 SdUVjCeDD+fe2Mo7+g8sT4eWkJU9BjPTn+il8nJSBkz/2yCKcGMiV63yi
 vduciSFp9+sNYKIWNepc3MbsOgfPTZGLVZWbg7DEqWqW1LmSLqhzFyHEb w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="327540856"
X-IronPort-AV: E=Sophos;i="5.97,230,1669104000"; d="scan'208";a="327540856"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2023 14:31:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="728868620"
X-IronPort-AV: E=Sophos;i="5.97,230,1669104000"; d="scan'208";a="728868620"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga004.fm.intel.com with ESMTP; 19 Jan 2023 14:31:30 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 19 Jan 2023 14:31:30 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Thu, 19 Jan 2023 14:31:30 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Thu, 19 Jan 2023 14:31:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=La3o7GZCTENaJmuHeNwU23cVlkscpX28nRpEckTOblYECO9CNbvjLJovVlM5NB0XLbo5kqgHyrNtarrecaMXKRyil72A3m4oUO3RAmwl4zI8sJ24WQ3D5neY/nhz5nJLdtpLX2nYwh7M95f2e3b+CJmUO8F0503KX6psxlOD89BMM+/9MVPxQHkFE0q/9p4umT2vUbbfA0Q0tRspyBRxu1BjBz4sMemUTmCKkCFrsin1KdGnV0jw3iDaRlqUOpl2pQd/CURBPCXPt3niYc9k3lRs95H49d1x2aqvx3LuOMPxc3uxbBeIyglm6AE22E7oB6WF/KLdzYio+xMnu4mweQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FdgIQ/9goFQFTeUJEjRVLQbErUM28+yxb2OZComi8KA=;
 b=eWjE07alxtPFYjoATOzNhHM/LTVjKAuGLQX0ZUco0RU6C5Q+hVO5I5o5oGaZ4XJp5rYVeDj7qje8VDzF3S0qrusLfeozrX//kJ1lg1HC1iLcV1b7LZNdrg1jIm8BijPlChWGE3ovrRZTKGebsBrHX18VM309WVwCzwFQ4sd1vVi3LOv9t37kxp7SkFKePlQIGjN2Xk6cX2Rh/3ZCvO1HTgSyVYbaN7/+goKEpJZvuPJEprYZA/zR9VuEv4i0RxiI9qLsch0GroH8qIRlTSRvpTwxn6ugAu2QIp1i0Kld3hWyE+SK9nYfaDaVzVzcC9swPXTdVtfUAvKwA/Nxgbf56w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 MN0PR11MB6232.namprd11.prod.outlook.com (2603:10b6:208:3c3::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.26; Thu, 19 Jan 2023 22:31:22 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::8901:2af2:6e02:c95c]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::8901:2af2:6e02:c95c%4]) with mapi id 15.20.6002.025; Thu, 19 Jan 2023
 22:31:22 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v5 5/6] drm/i915/pxp: Trigger the global teardown for
 before suspending
Thread-Topic: [PATCH v5 5/6] drm/i915/pxp: Trigger the global teardown for
 before suspending
Thread-Index: AQHZJu0FWMYZlz5nuEqSh56YyLq9eK6mLH8AgAAxJ4A=
Date: Thu, 19 Jan 2023 22:31:21 +0000
Message-ID: <c207db74fa64b14b8d041f05e027f8150577967b.camel@intel.com>
References: <20230113011850.1463965-1-alan.previn.teres.alexis@intel.com>
 <20230113011850.1463965-6-alan.previn.teres.alexis@intel.com>
 <Y8mbfA+u+xcR6dwS@intel.com>
In-Reply-To: <Y8mbfA+u+xcR6dwS@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.1-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|MN0PR11MB6232:EE_
x-ms-office365-filtering-correlation-id: bbbd5851-717c-4605-fe1e-08dafa6ce442
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Hr+DgHCnKGsmpHdsfDBiw/Rs60pWGQZllQEUtZI1cuanGc2K044P4AL9E1qCm/EzthKXZAAjnCgzVbzMrfDc5nAIDnBRtoj2FbtZnGV5tsIi3z/dV/SHmYU7st4rD0KUb1d16OhEbTi2MHR659kskznVDgE0BVPL4qoQoDvfipmwO0ZG5l0i7NmHC3cFAFZwqi3IALKXp1P/acyDkvT13i7fjfpG8oWO/VmdDTaa/KKukBdEeCkhzUcGU/JQLB+3tdnI647ix40oZCnIYlisn0T8k0TlXaObew56ggZ7AkCe1suIrqAjDCLDcX7DeztXWSiXXU4KqBCSrKUjIXIPh+WpWXoWlB5yj+66/bx6L0YF7/+nt4myjVBHMZDMb0zdR5HnQBkUGr67zuFU4AUyDndnInEvqnQEIxSuRUA1Z+StYQFQ+zditaJTJ1dqyoibuls0spHh0viqchPtsJBvntoIVyy2oASyNauV801MlCYQk+seL0+qUbZPllPhFQUdaDhtZa4xsvVwGATHfm2tfxVhMJnETLOhHPKmKCmiVajeSWJyaooJKpMp6vKpXkPuTM3dBitCD6ZH1VBwb9omafUZMs7Wn53dCJRQpyEGqZ5HDEzApxdVCAjTNaFc3NwYM5tfLopdBwfU1y8gWBG9cGdFy7NapgGQe5Kj2aUVrYh+3CLPyzhzynnsTdE1sK+l8WZn0APP8QbscC9FuqbuDA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(396003)(366004)(39860400002)(136003)(346002)(376002)(451199015)(38070700005)(107886003)(6486002)(6506007)(71200400001)(478600001)(86362001)(2906002)(37006003)(316002)(54906003)(4326008)(82960400001)(5660300002)(2616005)(122000001)(6636002)(15650500001)(91956017)(76116006)(66946007)(64756008)(66476007)(66446008)(83380400001)(38100700002)(8936002)(6862004)(41300700001)(8676002)(66556008)(186003)(26005)(6512007)(36756003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QjhXcnM3SnVOM1pPNU1FTHpxYS81OElORW02YklPbGdubTZzcTgwL2VTN3Fu?=
 =?utf-8?B?Z3MxRGR6SitGOCtpeE5qbDBuQXZzU2JVcHRSRnA2NTlCN095Z0kvZ2I1bDVj?=
 =?utf-8?B?ZkRoVGxWSjJjS0hLTVBTNnk5ZUpCVVM2L1BDeUdIbTN0dm5NS1hmRmtlWWk0?=
 =?utf-8?B?dGlaVVdHMSt1c3pnemdVSGZCTWc0WE45ejQrQ254V3dhcjFwTy9RWmpMWjND?=
 =?utf-8?B?UkY1ZDQ3S1dIWjYxNERmZm5qZXhUZEZWcEd1TkR1ZzhnR2J2Q2VCYmo5elF0?=
 =?utf-8?B?OW96Wll5QXRHaWRaSVVldXhKUEw3bCtMRmRvbFR5eEhIeFEwaEJCckhQVjhv?=
 =?utf-8?B?Y0t6aG1tdFZDRnQ4a3ZzMHFyTEJVV2tSU05DT3NMclUrSlpPejgwZEhxOUVJ?=
 =?utf-8?B?cWtncXhDUVNyZFdheEtPaDhUbHFwbG9SdngvSXJ6bXBkYml4VXRSaSswUG1s?=
 =?utf-8?B?MkFVMUx6Umc5bE9kK3NGcUVLNFd3d2lMQXdaSktiSEtzNlVPeWJ1TEJZTlI3?=
 =?utf-8?B?Q1BhaWRpeVA2TE1NbVgzTk9CRzA3dzFNSzNCa3dtTUE2YUUxblVrNWVXanZx?=
 =?utf-8?B?VGhQUEFNQ2V4VlVTTUx0eXpPcjNWQmJRQjdTOGZDZytMWktZcld5MUpYY2d1?=
 =?utf-8?B?bFNiZEFLWmlGRkllYWpGUnBid2pjdk5LalhVY3RYNU0xbXNubHZVWkJYSGQx?=
 =?utf-8?B?bG1nVDY3UER5b3FzOTU3bU05TmwzY3RYR0xheWVXbDNEcU85WVhpaXZGdDlK?=
 =?utf-8?B?eDRPazdWQVpSQjBUeERLZ2lhVGZtS2tqbHRpcXdNSzNmSjR3Snc4ZVp3RWNt?=
 =?utf-8?B?L3E5N3g5NEtSOUpiZXQxQ1hmSUhGdnp2K1c1eTY0NS9aMVZuMlZwZUNtdVh0?=
 =?utf-8?B?emRlekY2cVBVbkovbHM0NzNFQllhSEZlcWo0U3l2ZlM5YnY3RHQ0VVJ2UE9u?=
 =?utf-8?B?SkwzYmxJVkl0NUNlTk81TGhlT0VSQThaaDR6Y05qaVdLNlJFdk9rUkRDTlpB?=
 =?utf-8?B?aU01aFZaS01SMzM0dlBYdm1Qc1BpNmIxbUU3VzZZRGsxVjZvUFJTWUFUT09m?=
 =?utf-8?B?RXNWMTFOUjJrZTNFY2FFMzQ3UUxnbmQ5dGlLRllnQWNva2pPY050YkFEM0dq?=
 =?utf-8?B?QUxJSU0yYjBUT0tVSVRmZHE2ek5ObVl4aEdySnY4cTQzRXI4eWVtOVpKakhD?=
 =?utf-8?B?NDA5V1RTbTFRajJEdlEvVnJKYnBpQTZ6ejl2ZEI2WGJFdklzOGtORFhJVmF2?=
 =?utf-8?B?N3ozTnRCNnNTalI3VUZ2cW9GMlhkakRVNDc2WW5pa3RRTi81blB5MUZSUkI0?=
 =?utf-8?B?RldMRFhndnB2bzdsaUlhbWN6S2RxOTN4V094VHd6c0wzWWd1MW9UNWszQldk?=
 =?utf-8?B?NFhNL0ZJWmlGRmdoeEJ1YXc3SmpDdGJvWFFDZEhGdXV6MmQ3Vkl2NjJFdXdU?=
 =?utf-8?B?a3RzRDZndnI2ZWtxbVB5TCtEaFptU3A1MHBQZUZENUJXSHJUb0tNanAwbldC?=
 =?utf-8?B?Z3Y5YXNIOVlIc0V6OVBiT295dEdzRlhIZHAvN2MxejJjZyt3OGZubWQ3VC9E?=
 =?utf-8?B?dHM2MFZqQTg0amtXV1JVU0RuOXI0ZkFzemR5bENhTmZUVVhYY0pxVVVSWjBj?=
 =?utf-8?B?b2Y2MG5nY1pEYklXeElIVWgyUE9FT3U1eVY2ZWlnOTR5b2V4NDlaUTFqcDFP?=
 =?utf-8?B?K2p0U3hITVJTanVRRkdVcWZpQ1hhbTdSQnkwQWgrcnlnOWd3WEJGd0N5YnpG?=
 =?utf-8?B?VlgzZExENEJ6RjV0VFR2T3dadGxFWjlCbEFIbllnU3IxL3dCWkYzOWx5bitp?=
 =?utf-8?B?NUtRZjV2ZWZ4R2xXdGFuM0FZS3ZlNExtOTFQTVFYaU0vWmJZSlNMaU4xUzZS?=
 =?utf-8?B?U2IrRCsxV2FzOVVPWFRtZmZhM0pxM3NUVklaV0RaZW1PYkd5SXFjYkRBZTk5?=
 =?utf-8?B?QXZ4R1ZlbGdCa2lnWWg0dWdoU041NndWSDZUNDRuYmZxbnlmT3Z4Lzh4S2Nn?=
 =?utf-8?B?V2d6RnZ6M2hWRzd1VUtVRHlFaFUxaXhrT09vWWxuaFZ1Yms4NUx1Rlk2UFU0?=
 =?utf-8?B?NHREVFlRVThZQUVEdkhMV0V0dmQ4UGx5b2NEQkZsNG40QnhyaXpkZUc5QmQv?=
 =?utf-8?B?T1lEZkMwUU9nZEE3OS9BaWlJK0U1VXNOYWkxMldBcG1ONWZKRW5Hek9Xc2Zl?=
 =?utf-8?Q?Ykt6F08k6GBv/VTwobcYuFhPeGVAokHQrPANfu9fQYhy?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <37F0F996185A654DA3F8BC82C74BF0C9@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bbbd5851-717c-4605-fe1e-08dafa6ce442
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jan 2023 22:31:21.9041 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zY2AZXr/3Z05DuvTEnxJeMFdNkTfTY4O12pErk1maeAO7gFQAnwwBQyZiWh3iSo5EtZcaSFN5SZJNJQNgCeMFBqnQ7z+G6DJGJbiRSDXzaU+143fAfiJxrQWHbmj77nR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6232
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
Cc: "justonli@chromium.org" <justonli@chromium.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "Usyskin,
 Alexander" <alexander.usyskin@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "Vivi@freedesktop.org" <Vivi@freedesktop.org>, "Winkler,
 Tomas" <tomas.winkler@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhhbmtzIGZvciByZXZpZXdpbmcgLSByZXNwb25zZXMgYmVsb3cuDQoNCk9uIFRodSwgMjAyMy0w
MS0xOSBhdCAxNDozNSAtMDUwMCwgVml2aSwgUm9kcmlnbyB3cm90ZToNCj4gT24gVGh1LCBKYW4g
MTIsIDIwMjMgYXQgMDU6MTg6NDlQTSAtMDgwMCwgQWxhbiBQcmV2aW4gd3JvdGU6DQo+ID4gQSBk
cml2ZXIgYnVnIHdhcyByZWNlbnRseSBkaXNjb3ZlcmVkIHdoZXJlIHRoZSBzZWN1cml0eSBmaXJt
d2FyZSB3YXMNCj4gPiByZWNlaXZpbmcgaW50ZXJuYWwgSFcgc2lnbmFscyBpbmRpY2F0aW5nIHRo
YXQgc2Vzc2lvbiBrZXkgZXhwaXJhdGlvbnMNCj4gPiBoYWQgb2NjdXJyZWQuIEFyY2hpdGVjdHVy
YWxseSwgdGhlIGZpcm13YXJlIHdhcyBleHBlY3RpbmcgYSByZXNwb25zZQ0KPiA+IGZyb20gdGhl
IEd1QyB0byBhY2tub3dsZWRnZSB0aGUgZXZlbnQgd2l0aCB0aGUgZmlybXdhcmUgc2lkZS4NCj4g
PiBIb3dldmVyIHRoZSBPUyB3YXMgaW4gYSBzdXNwZW5kZWQgc3RhdGUgYW5kIEd1QyBoYWQgYmVl
biByZXNldC4NCj4gPiANCj4gPiBJbnRlcm5hbCBzcGVjaWZpY2F0aW9ucyBhY3R1YWxseSByZXF1
aXJlZCB0aGUgZHJpdmVyIHRvIGVuc3VyZQ0KPiA+IHRoYXQgYWxsIGFjdGl2ZSBzZXNzaW9ucyBi
ZSBwcm9wZXJseSBjbGVhbmVkIHVwIGluIHN1Y2ggY2FzZXMgd2hlcmUNCj4gPiB0aGUgc3lzdGVt
IGlzIHN1c3BlbmRlZCBhbmQgdGhlIEd1QyBwb3RlbnRpYWxseSB1bmFibGUgdG8gcmVzcG9uZC4N
Cj4gPiANCj4gPiBUaGlzIHBhdGNoIGFkZHMgdGhlIGdsb2JhbCB0ZWFyZG93biBjb2RlIGluIGk5
MTUncyBzdXNwZW5kX3ByZXBhcmUNCj4gPiBjb2RlIHBhdGguDQo+ID4gDQo+ID4gU2lnbmVkLW9m
Zi1ieTogQWxhbiBQcmV2aW4gPGFsYW4ucHJldmluLnRlcmVzLmFsZXhpc0BpbnRlbC5jb20+DQo+
ID4gUmV2aWV3ZWQtYnk6IEp1c3RvbiBMaSA8anVzdG9ubGlAY2hyb21pdW0ub3JnPg0KPiA+IA0K
QWxhbjogW3NuaXBdDQo+ID4gwqANCj4gPiArc3RhdGljIGludCBfX3B4cF9nbG9iYWxfdGVhcmRv
d25fbG9ja2VkKHN0cnVjdCBpbnRlbF9weHAgKnB4cCwgYm9vbCB0ZXJtaW5hdGVfZm9yX2NsZWFu
dXApDQo+ID4gK3sNCj4gPiArwqDCoMKgwqDCoMKgwqBpZiAodGVybWluYXRlX2Zvcl9jbGVhbnVw
KSB7DQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGlmICghcHhwLT5hcmJfaXNf
dmFsaWQpDQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqByZXR1cm4gMDsNCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgLyoNCj4gPiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICogVG8gZW5zdXJlIHN5bmNocm9ub3VzIGFu
ZCBjb2hlcmVudCBzZXNzaW9uIHRlYXJkb3duIGNvbXBsZXRpb24NCj4gPiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgICogaW4gcmVzcG9uc2UgdG8gc3VzcGVuZCBvciBzaHV0ZG93biB0
cmlnZ2VycywgZG9uJ3QgdXNlIGEgd29ya2VyLg0KPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgKi8NCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaW50ZWxfcHhw
X21hcmtfdGVybWluYXRpb25faW5fcHJvZ3Jlc3MocHhwKTsNCj4gPiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgaW50ZWxfcHhwX3Rlcm1pbmF0ZShweHAsIGZhbHNlKTsNCj4gPiArwqDC
oMKgwqDCoMKgwqB9IGVsc2Ugew0KPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBp
ZiAocHhwLT5hcmJfaXNfdmFsaWQpDQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gMDsNCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgLyoNCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICogSWYgd2UgYXJl
IG5vdCBpbiBmaW5hbCB0ZXJtaW5hdGlvbiwgYW5kIHRoZSBhcmItc2Vzc2lvbiBpcyBjdXJyZW50
bHkNCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICogaW5hY3RpdmUsIHdlIGFy
ZSBkb2luZyBhIHJlc2V0IGFuZCByZXN0YXJ0IGR1ZSB0byBzb21lIHJ1bnRpbWUgZXZlbnQuDQo+
ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqIFVzZSB0aGUgd29ya2VyIHRoYXQg
d2FzIGRlc2lnbmVkIGZvciB0aGlzLg0KPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgKi8NCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcHhwX3F1ZXVlX3Rlcm1p
bmF0aW9uKHB4cCk7DQo+ID4gK8KgwqDCoMKgwqDCoMKgfQ0KPiANCj4gSSByZWFsbHkgZG9uJ3Qg
c2VlIHdoeSB5b3UgbmVlZCAxIGZ1bmN0aW9uIGZvciB0b3RhbGx5IDIgZGlmZmVyZW50IGNhc2Vz
Lg0KPiBXaHkgbm90IDIgZnVuY3Rpb25zIHRoZW4/DQo+IA0KDQpBbGFuOiBJIGRvbid0IHNlZSB3
aHkgbm90IDspIE15IGdvYWwgd2l0aCBhYm92ZSBtZXRob2Qgd2FzIHdhcyB0byBjb25jZW50cmF0
ZSB0aGUgdGVhcmRvd24gc3RlcHMgaW4gYSBzaW5nbGUgZnVuY3Rpb24gc28gaWYgZnV0dXJlIGNo
YW5nZXMgYXJlIHJlcXVpcmVkLCB3ZSBjYW4ga2VlcCBpdCBpbiB0aGlzIHNpbmdsZSBmdW5jdGlv
biBlbnRyeSBwb2ludC4gRm9yIG5vdyBpIHdpbGwgYXNzdW1lIHRoYXQgd2FzIGEgbmFjayBzbyBp
IHNoYWxsIHNwbGl0IGl0IG9uIG5leHQgcmV2Lg0KDQo+ID4gKw0KPiA+ICvCoMKgwqDCoMKgwqDC
oGlmICghd2FpdF9mb3JfY29tcGxldGlvbl90aW1lb3V0KCZweHAtPnRlcm1pbmF0aW9uLCBtc2Vj
c190b19qaWZmaWVzKDI1MCkpKQ0KPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBy
ZXR1cm4gLUVUSU1FRE9VVDsNCj4gPiArDQo+ID4gK8KgwqDCoMKgwqDCoMKgcmV0dXJuIDA7DQo+
ID4gK30NCj4gPiArDQo+ID4gDQpBbGFuOiBbc25pcF0NCg0KPiA+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vaTkxNS9weHAvaW50ZWxfcHhwLmggYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9w
eHAvaW50ZWxfcHhwLmgNCj4gPiBpbmRleCA5NjU4ZDMwMDUyMjIuLjNkZWQwODkwY2QyNyAxMDA2
NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9weHAvaW50ZWxfcHhwLmgNCj4gPiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9weHAvaW50ZWxfcHhwLmgNCj4gPiBAQCAtMjcsNiAr
MjcsNyBAQCB2b2lkIGludGVsX3B4cF9tYXJrX3Rlcm1pbmF0aW9uX2luX3Byb2dyZXNzKHN0cnVj
dCBpbnRlbF9weHAgKnB4cCk7DQo+ID4gwqB2b2lkIGludGVsX3B4cF90ZWVfZW5kX2FyYl9md19z
ZXNzaW9uKHN0cnVjdCBpbnRlbF9weHAgKnB4cCwgdTMyIGFyYl9zZXNzaW9uX2lkKTsNCj4gPiDC
oA0KPiA+IMKgaW50IGludGVsX3B4cF9zdGFydChzdHJ1Y3QgaW50ZWxfcHhwICpweHApOw0KPiA+
ICt2b2lkIGludGVsX3B4cF9lbmQoc3RydWN0IGludGVsX3B4cCAqcHhwKTsNCj4gPiDCoA0KPiA+
IMKgaW50IGludGVsX3B4cF9rZXlfY2hlY2soc3RydWN0IGludGVsX3B4cCAqcHhwLA0KPiA+IMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHN0cnVjdCBkcm1f
aTkxNV9nZW1fb2JqZWN0ICpvYmosDQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9p
OTE1L3B4cC9pbnRlbF9weHBfcG0uYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L3B4cC9pbnRlbF9w
eHBfcG0uYw0KPiA+IGluZGV4IDg5MmQzOWNjNjFjMS4uZTQyNzQ2NGFhMTMxIDEwMDY0NA0KPiA+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L3B4cC9pbnRlbF9weHBfcG0uYw0KPiA+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS9pOTE1L3B4cC9pbnRlbF9weHBfcG0uYw0KPiA+IEBAIC0xNiw3ICsx
Niw3IEBAIHZvaWQgaW50ZWxfcHhwX3N1c3BlbmRfcHJlcGFyZShzdHJ1Y3QgaW50ZWxfcHhwICpw
eHApDQo+ID4gwqDCoMKgwqDCoMKgwqDCoGlmICghaW50ZWxfcHhwX2lzX2VuYWJsZWQocHhwKSkN
Cj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldHVybjsNCj4gPiDCoA0KPiA+
IC3CoMKgwqDCoMKgwqDCoHB4cC0+YXJiX2lzX3ZhbGlkID0gZmFsc2U7DQo+ID4gK8KgwqDCoMKg
wqDCoMKgaW50ZWxfcHhwX2VuZChweHApOw0KPiA+IMKgDQo+ID4gwqDCoMKgwqDCoMKgwqDCoGlu
dGVsX3B4cF9pbnZhbGlkYXRlKHB4cCk7DQo+ID4gwqB9DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9pOTE1L3B4cC9pbnRlbF9weHBfc2Vzc2lvbi5jIGIvZHJpdmVycy9ncHUvZHJt
L2k5MTUvcHhwL2ludGVsX3B4cF9zZXNzaW9uLmMNCj4gPiBpbmRleCA3NGVkN2UxNmU0ODEuLmQ4
Mjc4YzQwMDJlMyAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9weHAvaW50
ZWxfcHhwX3Nlc3Npb24uYw0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L3B4cC9pbnRl
bF9weHBfc2Vzc2lvbi5jDQo+ID4gQEAgLTExNSwxMSArMTE1LDE0IEBAIHN0YXRpYyBpbnQgcHhw
X3Rlcm1pbmF0ZV9hcmJfc2Vzc2lvbl9hbmRfZ2xvYmFsKHN0cnVjdCBpbnRlbF9weHAgKnB4cCkN
Cj4gPiDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIHJldDsNCj4gPiDCoH0NCj4gPiDCoA0KPiA+IC1z
dGF0aWMgdm9pZCBweHBfdGVybWluYXRlKHN0cnVjdCBpbnRlbF9weHAgKnB4cCkNCj4gPiArdm9p
ZCBpbnRlbF9weHBfdGVybWluYXRlKHN0cnVjdCBpbnRlbF9weHAgKnB4cCwgYm9vbCByZXN0YXJ0
X2FyYikNCj4gPiDCoHsNCj4gPiDCoMKgwqDCoMKgwqDCoMKgaW50IHJldDsNCj4gPiDCoA0KPiA+
IC3CoMKgwqDCoMKgwqDCoHB4cC0+aHdfc3RhdGVfaW52YWxpZGF0ZWQgPSB0cnVlOw0KPiA+ICvC
oMKgwqDCoMKgwqDCoGlmIChyZXN0YXJ0X2FyYikNCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgcHhwLT5od19zdGF0ZV9pbnZhbGlkYXRlZCA9IHRydWU7DQo+ID4gK8KgwqDCoMKg
wqDCoMKgZWxzZQ0KPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBweHAtPmh3X3N0
YXRlX2ludmFsaWRhdGVkID0gZmFsc2U7DQo+IA0KPiBvLk8NCj4gDQo+IHB4cC0+aHdfc3RhdGVf
aW52YWxpZGF0ZSA9IHJlc3RhcnRfYXJiOw0KQWxhbjogZHVoaGhoLi4uIChteSBiYWQpDQo+IA0K
PiA/DQo+IA0KPiBvciBldmVuIGEgYmV0dGVyIG5hbWUgZm9yIHRoZSByZXN0YXJ0X2FyYiB0byBh
bHJlYWR5IGluZGljYXRlIHRoYXQgaXMNCj4gdGhlIGh3X3N0YXRlX2ludmFsaWRhdGUgPw0KPiAN
CkFsYW46IGhtbW0uLi4geW91IHNvbWV0aGluZyBtZWFuIGxpa2U6DQoNCiAgICBod19zdGF0ZV9p
bnZhbGlkYXRlZCA9IHBvc3RfaW52YWxpZGF0aW9uX25lZWRzX3Jlc3RhcnQ7DQoNCg0KQWxhbjog
YWN0dWFsbHkgaSB3aXNoIHdlIGNvdW9sZCByZWRvICJod19zdGF0ZV9pbnZhbGlkYXRlIiB3aGlj
aCBpcyBjdXJyZW50bHkgZGVmaW5lZA0KYXMgYSBib29sZWFuIHRoYXQgb25seSBtZWFucyBvbmUg
dGhpbmcgLT4gdGVhcmRvd24gYW5kIHJlc3RhcnQuIEl0IHdvdWxkIGJlIG1vcmUgc2NhbGFibGUN
CmlmIHdlIGNhbiByZXBsYWNlIGl0IHdpdGggYSBiaXRtYXNrIG9mICJjdXJyZW50ICsgKGluZmVy
ZWQpcGVuZGluZyBzdGF0ZSIgd2l0aCBhIGRvY3VtZW50ZWQNCnN0YXRlLW1hY2hpbmUgd2l0aCBh
IGZpeGVkIHNldCBvZiBzdGF0ZS10cmFuc2l0aW9uIHBhdGhzLiANCg0KSU5BQ1RJVkUtLS0tPiBT
VEFSVElORy0tLS0+IEFDVElWRSAtLS0tPiBURUFSRE9XTl9SRVNUQVJULS0tPnwNCiAgICAgIF4g
ICAgICAgICAgIF4gICAgICAgICAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICB8DQog
ICAgICB8ICAgICAgICAgICB8ICAgICAgICAgICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAg
ICAgVg0KICAgICAgfCAgICAgICAgICAgfDwtLS0tLS0tLS0tLS0tLSktLS0tLS0tLS0tPC0tLS0t
LS0tLS0tLS0tLXwNCiAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgIMKgfA0KICAgICAg
fCAgICAgICAgICAgICAgICAgICAgICAgICAgwqB8LS0tLS0+IFRFQVJET1dOX0VORC0tLS0+LS18
DQogICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgVg0KICAgICAgfDwtLS0tLS0tLS0tLS0tLS0tLTwtLS0tLS0tLS0tLS0tLS0tPC0tLS0t
LS0tLS0tLS0tLS0tLXwNCg0KDQpIb3dldmVyLCBJIGRpZG4ndCBkbyB0aGlzIGluaXRpYWxseSBi
ZWNhdXNlIGl0IHdvdWxkIG1lYW4gYSB3aWRlciBzZXQgb2YgY2hhbmdlcyB0aGF0IG1pZ2h0DQp0
YWtlIG1vcmUgdGltZSB0byB0ZXN0IGFuZCByZXZpZXcgKGRvd25zdHJlYW0gY3VzdG9tZXJzIGlt
cGFjdHMpIGJ1dCBmb3Igb25seSA1IHN0YXRlcyBidXQNCndoZXJlIG9ubHkgMiBvZiBlbSBhcmUg
aW1wYWN0ZWQgYnkgdGhpcyBjaGFuZ2UuIEZvciBub3cgaSBzaGFsbCBnbyB3aXRoIHRoZSBzaW1w
bGVyIG5hbWUgY2hhbmdlDQphcyB5b3UgaGludCBhYm92ZSAtIHVubGVzcyB5b3UgcmVxdWVzdCB0
aGlzIGluc3RlYWQuDQoNCkFsYW46IFtzbmlwXQ0K
