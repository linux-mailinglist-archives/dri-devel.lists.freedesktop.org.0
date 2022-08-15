Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 788CE5928E3
	for <lists+dri-devel@lfdr.de>; Mon, 15 Aug 2022 06:56:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 028AAA7F54;
	Mon, 15 Aug 2022 04:56:03 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A94AA7F54;
 Mon, 15 Aug 2022 04:55:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660539352; x=1692075352;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=tIZV6CEGPVP69yLAzhGougGfjGYoWoHl0LglTmykxq0=;
 b=EOwbxxLCj/jwBYnBvRhdah8KOtC3s+Zzj9z4gGkmNUlSVFH21MpozsHR
 yj3g6OFwwAjHs6g3h1ifeF7itrOTD4YyEdJpUCp+Y4bYOEO+a+IW/yQSE
 OAIo9L719Oxkcu+R97Olkjq0KR3uQNEmZGJh/08HaxxjxG7wI92b+EfxV
 72pI2LX8af61LEhZvXdpSF1O/2nFyHN8tIfJetE/AwdsOyNvfyvEd2yhj
 E6C/5LufnVFEc5/e8STuxpvHEnikHPJojLA3h4LzbF3E7deg+nPBFuIGx
 S5+V8M0fi3D87tHRIFT8qocaD2WJB2LBDewQEyoGelJXW2NWAAr1FmCPH A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10439"; a="289459284"
X-IronPort-AV: E=Sophos;i="5.93,237,1654585200"; d="scan'208";a="289459284"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2022 21:55:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,237,1654585200"; d="scan'208";a="695864335"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by FMSMGA003.fm.intel.com with ESMTP; 14 Aug 2022 21:55:51 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Sun, 14 Aug 2022 21:55:51 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Sun, 14 Aug 2022 21:55:50 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Sun, 14 Aug 2022 21:55:50 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.45) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.28; Sun, 14 Aug 2022 21:55:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g5yShTZlYWCrmGSPNXMktoYKJpXoJxVvVO5P+7H/ReFDr30YNQVmz8ASFFnQLE/g2gTN5nVHJEXLT3kV7zH+NOq0/+qWYoPjxqMVu/97xeUVRzYh/Ix9ABROQezwl/fpc+8w+knS68UYJcuKqIrAoxB8MW7LzNZWzeC+8O9RyYGctIKdZxSvKooes0lKGbHBVLiOcR6BLWK3tMIJreLUXQr/WSdqIgWK9zRkWPSKlPa7Z3CZVv8tdptRjZFIv8AulVE8bV+/K3EnUJL4kd5XEGDzvQWqqN9nfCxDDk37FAX0N/c+egns5aA7TyuGSs9PCI+OT+h5qdoiY36xge5JwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tIZV6CEGPVP69yLAzhGougGfjGYoWoHl0LglTmykxq0=;
 b=dff5b6PMzN8g9mqSwPl+Q9uhwHScQCkh3btzu/xvSoRzVKmpLoDcq5iKCttPRl+nWTK0gXKJaVxFn81tDcrSu4edX6d2C9c5qDtEq/mmr7ng+I4l6Mq4pyatAzrwYDq8ZIKWKYJIzTdwiG10Vc4orR6wNQ53PM8NnAXi+P5jTQwmyrLLcd2HHbwQbejo1bj6HqGG1mQMHxaZodeNQNMXK0VfRfCntsjE2YFQ2IMnJEmzA8scqJivEUIBT2flClMqfDj6mKDLGBY4qtv8kHErG4sjQCD5sKC2Ap5Nub4C7GVgJba3JN61i501OTpOn88mMTgswZoFo0cqlSIIzPfnTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 MN2PR11MB4413.namprd11.prod.outlook.com (2603:10b6:208:191::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.11; Mon, 15 Aug
 2022 04:55:48 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::fdd1:18b1:3e9c:b03e]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::fdd1:18b1:3e9c:b03e%5]) with mapi id 15.20.5525.011; Mon, 15 Aug 2022
 04:55:48 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "Harrison, John C" <john.c.harrison@intel.com>,
 "Intel-GFX@Lists.FreeDesktop.Org" <Intel-GFX@Lists.FreeDesktop.Org>
Subject: Re: [Intel-gfx] [PATCH 3/7] drm/i915/guc: Add GuC <-> kernel time
 stamp translation information
Thread-Topic: [Intel-gfx] [PATCH 3/7] drm/i915/guc: Add GuC <-> kernel time
 stamp translation information
Thread-Index: AQHYoikMsVf/doc2k0CksYIgyCdh1a2fg8YAgAXlgoCAChlWgA==
Date: Mon, 15 Aug 2022 04:55:48 +0000
Message-ID: <42b3fa4fab7657b4fcdf4933185b289ca47c6ff0.camel@intel.com>
References: <20220728022028.2190627-1-John.C.Harrison@Intel.com>
 <20220728022028.2190627-4-John.C.Harrison@Intel.com>
 <f1c122a1babf75c8fb0910ee5e2e48d9f52e9722.camel@intel.com>
 <2b8105b9-f05c-454b-c678-af1cf98f54b7@intel.com>
In-Reply-To: <2b8105b9-f05c-454b-c678-af1cf98f54b7@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.5-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8729ce23-003c-4cf2-ec18-08da7e7a6bd1
x-ms-traffictypediagnostic: MN2PR11MB4413:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: OJ3obX2Dvd0r1Xqnb6RysQpmxQp9uq1Kqkny4yfB+gs/2FFD8i/UeKbYQ+feTYcjZB2lWyRajH0fEPBdVHF4raXeZSCZl5oz3Ww9Ow9fMWZtXZazrVRGQFW3P6Ww7xfuuqp5w16dA+yKuqpFy4bbymV1arkbVCQR5QNG0JhYLvjI7WdjBrbnrXihRp0Nyxqz3dLLOAhI9zR0/eDWkrkH9cziB7vaJTv9Qto+wq+nXkcJPqvmHfiIMlFKWUN0l5XbU6861cF91cs70oRLklxhjMRiS1Po0jdUP7qy9DXDw37pP0olmlMwdvLAADUJCouLFGheItgWFbZqWC0GVKb4VTuvG4apSYo2Fr5w1mntuGwQVjjh00YeAy5nofofAUr6N6/K2OmDz8vjPYc5VSUGZ4x+I5wsm0Kr+x8ny/Xbr7/P22h2/NUtTA0uCl6l8sWHHiNUjYzeWa5Ulofna4xX5Ize6tz96j1zAMZrHrqq+0P6ZjkNTk/G+ncB2M7O0pV0gaaEn5ROA6ZKXOTW3kIC6Ju4glcTsYoKpMwOQS46zFXpKMX/gMFz95YepXV1vSie+syLquXhwHjwMSY+EKKzTt3yA25hOtJ2ZIJJZB6BpG7t07S60RDvz6FE273kUJwLgijheFeFhjUXQ4ti7Umk5zHSRjreESdq7xH6TYYnud2KBA8VtTOd+xa6Xylep1WMDkolISdzcm2dndUEG0+v/avhB93D1lpGTu4KaS4DNcPRiOg4Hs12oDSNTbTiarAC4zKJ+3V6xJZC4JCxMp3s1A2R4cNEHRcu/XwBMTu9u4PrdZni7Vt3QcE2yUwyMCB9
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(39860400002)(376002)(396003)(346002)(136003)(366004)(5660300002)(2906002)(82960400001)(86362001)(38070700005)(38100700002)(122000001)(41300700001)(6506007)(53546011)(316002)(478600001)(71200400001)(6486002)(2616005)(186003)(26005)(83380400001)(6512007)(8676002)(66556008)(76116006)(64756008)(66946007)(66476007)(450100002)(4326008)(66446008)(8936002)(91956017)(110136005)(36756003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OUQrTUVhb2wwdjRIVHhJYVVRQ1c3ZVdKRHo2OGRjVWh6Y0dNZTk5QVJJQ1lS?=
 =?utf-8?B?WkFtbk5CVnQ4ODdjclBWOGVEazZPYWpuTVpTTEs1NUlQOGVOdWVlb2ZHQ1Y4?=
 =?utf-8?B?eUg1Q0Jsd3IwaE5Od2t0SmRWRzRSWFhKNk9BV1BLMklMWTRwY0llVVBJUDFr?=
 =?utf-8?B?R2dieGZWVmtJamhTQXpoTjRENWNSSythQnhjbWJIbXdsczIxREJqeVM3RnBy?=
 =?utf-8?B?b3pIbkFFNFU1WjBuS0xhblg2MW9UMXpjZVdHSldXUmhESFhMNlRiRklGajRR?=
 =?utf-8?B?eTZZOGFHOXY2eHM5T1RnaHI1VVdtT3FYbXVDckpCS1pPYlhqRE13d2dSRkxH?=
 =?utf-8?B?eU5ZYmVHK3l0dWlDMFhBZ28zbmNzcjIzUTVNRUN2aC8yUG4zRUhpOGErWHlj?=
 =?utf-8?B?VmJZZWEva29RUkJtdHlzNi9Qa2dCbVllQlFSSVBCekVIdHlOTEhyRU9ER0p2?=
 =?utf-8?B?QjlsRlhEN0wxN3c2b25ac1FWU1N0Z2FQclJ4TXh4bHZSQjdYb2FzUjJvd2tx?=
 =?utf-8?B?WEdKLytCTFNYa0JCZDBhOTk5VTRLVVRsRHhETXhVWmdBcHhLV2hML1VNZDkx?=
 =?utf-8?B?bkRyWlVabHcxTHYrYTJVaUNtc1dwbmNYUmkrSG12cEY0QXExVEswcVFEd0dH?=
 =?utf-8?B?WFdUeklSa2p6QkU1QS9zdDhobUNXVFh6VjNYUTFDTDZBcFpBNUdwRm1iV25r?=
 =?utf-8?B?SjhJL3h6cGJCa2VUTnd6RllDc2JYaHFxWERxU1VJdzVIZWVPUlp4OTdOT0Fo?=
 =?utf-8?B?THFHV1ZnVldHcFQrN2NmNlZhNVQwcnErT3lmdjNVbzdyVmRpK2g3eHRuS2Z4?=
 =?utf-8?B?aityZ1RCdWtWM2hPL3ZRQnVWU092bjZCdnZhV2UrU3Z3UXBZcWxrQjh1d21V?=
 =?utf-8?B?aldlZUdPbXllSDdQQk5DWkJkKy9mQmN5Ti8vaUVFZUdJOG44UkIwYmRJdFdL?=
 =?utf-8?B?ckdjZEpxKy9ZUVcxVE04YzlGU09VTTFCRDh4dzIxTVlaN2dQSzRFbGE5ZElG?=
 =?utf-8?B?aE81VWIyTHpVMHBGTzN6SzFVYU9nbWIvWmU1Mzd4WDJ6cmZ1dlNZeVdWYXdm?=
 =?utf-8?B?aWtCQmhkTlM4MExva1JiUy9wT0xZT09wNDl5UXZsc2dDMTV4M24wa2JGbUFw?=
 =?utf-8?B?OTAxbjRRczVZbCtBbTkxdTFjR1dreXFrMmZVSExLNkI1U0k3QnBleTdKOFVa?=
 =?utf-8?B?ZFlSaE0rclJoS2J2NUlKcktPdE9FY2VFcTJReURTUFA2Njg5aE12RmJnSEZ6?=
 =?utf-8?B?SGczSHMvMnA2OWJtZVVVWFNqTjBxUWZmSmFKUFlVT3ludHFtWDBpbXlXZHZl?=
 =?utf-8?B?OWdpU1RhOThjTXZ0TTZEM3RVRExPUkVvdmhqZ2V1ZVBXUkZJa0FuNmNWekJW?=
 =?utf-8?B?bXM0dXRRaFd5aytZVDJYbDJ4WHBYenprT1VOaERjdTViRGdpR3lFNklmUGNN?=
 =?utf-8?B?cDhxcUVkN3lwUzNrRGxnQTVKbXJyUUVtREozRVl5TEtHYUp3Nm5QV0h6QS9H?=
 =?utf-8?B?ZU5jaWZocHVYMHAyckNWNUIyNWhZTlU2bHpnM2pGcCtiKzJZU29xWS9aREVw?=
 =?utf-8?B?ckdxTm8rZlExeHFZRFFPVHlpMzdxaXBLc0taUlF4VE5UT0dwYUViWU8xWkUw?=
 =?utf-8?B?ZDFRNGdJWTlEZ0ZSWUk1eWdtZm96Ulh6V1FEdEphbDg0WGh3VUdKVzhJL3NJ?=
 =?utf-8?B?UmNQVmpmVmszMWU4MzJuRFg0b1RXM0s4MnBUT08xMEJTemhUeDFubkZBbEJl?=
 =?utf-8?B?S000Zy9BSno0YldzNmVwaTRyZ0RyOG1uWSszQnRpMFU3SnhpUTdjYVZ6ZDhL?=
 =?utf-8?B?b0ZpbGtQN0Uza01hcExpbGszOVFYUlA0MEZGamV6c3BkbnRKaTVTckNMTDVR?=
 =?utf-8?B?TnYwbjlqdVNEVjlLa1QzaE5acEY0dExEVlpwVHpKbjVCOCsvejRWNDlUVnlY?=
 =?utf-8?B?WjdoUlgzZzZmY0JJVHVNOXRNMW1zMDI0bDJ1N0NyL3pBVjlIUXNsMVRsTEZt?=
 =?utf-8?B?dWI0dVJwRUJuWVUzeTBYYStXMURLSFJ0T0IxNTZWZVBQc29wNWhhUE1EcndD?=
 =?utf-8?B?UnhVRlljK1plRDg0clh0Ynlqd1pmdTdJWE5udTF3dmRnQ0xGelVLV1c0TkVC?=
 =?utf-8?B?VmtOMWMvWmRwdmE1TGpnOGNtc2hxM3p5WXNBWDJ4bDk1R3o5UkEyTU9XREk0?=
 =?utf-8?Q?GC6iqDeGfdAdP7EFJDTkX94=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8A684D21938B3D408517CBACE29273FB@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8729ce23-003c-4cf2-ec18-08da7e7a6bd1
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2022 04:55:48.6219 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ilMXpQOXZ6DNp4QfU9ebRqbQbPn70DM/Znd+BJ7puVpdr6am07NBIN/ODJpnof+SoFVTaLvhUCiyNG66X7FcretAwZn44awFAGR4wetdYVMxGHb4WOmtQPyVcPZmnbYR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4413
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
Cc: "DRI-Devel@Lists.FreeDesktop.Org" <DRI-Devel@Lists.FreeDesktop.Org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U291bmRzIGdvb2QgLSB0aGFua3MuIChpZ25vcmUgdGhlICJkb2luZyB0aGUgb3Bwb3NpdGUiIGNv
bW1lbnQpLg0KDQpSZXZpZXdlZC1ieTogQWxhbiBQcmV2aW4gPGFsYW4ucHJldmluLnRlcmVzLmFs
ZXhpc0BpbnRlbC5jb20+DQoNCk9uIE1vbiwgMjAyMi0wOC0wOCBhdCAxMTo0MyAtMDcwMCwgSGFy
cmlzb24sIEpvaG4gQyB3cm90ZToNCj4gT24gOC80LzIwMjIgMTc6NDAsIFRlcmVzIEFsZXhpcywg
QWxhbiBQcmV2aW4gd3JvdGU6DQo+ID4gSSBoYXZlIGEgcXVlc3Rpb24gb24gYmVsb3cgY29kZS4g
RXZlcnl0aGluZyBlbHNlIGxvb2tlZCBnb29kLg0KPiA+IFdpbGwgci1iIGFzIHNvb24gYXMgd2Ug
Y2FuIGNsb3NlIG9uIGJlbG93IHF1ZXN0aW9uDQo+ID4gLi4uYWxhbg0KPiA+IA0KPiA+IA0KPiA+
IE9uIFdlZCwgMjAyMi0wNy0yNyBhdCAxOToyMCAtMDcwMCwgSm9obi5DLkhhcnJpc29uQEludGVs
LmNvbSB3cm90ZToNCj4gPiA+IEZyb206IEpvaG4gSGFycmlzb24gPEpvaG4uQy5IYXJyaXNvbkBJ
bnRlbC5jb20+DQo+ID4gPiANCj4gPiA+IEl0IGlzIHVzZWZ1bCB0byBiZSBhYmxlIHRvIG1hdGNo
IEd1QyBldmVudHMgdG8ga2VybmVsIGV2ZW50cyB3aGVuDQo+ID4gPiBsb29raW5nIGF0IHRoZSBH
dUMgbG9nLiBUaGF0IHJlcXVpcmVzIGJlaW5nIGFibGUgdG8gY29udmVydCBHdUMNCj4gPiA+IHRp
bWVzdGFtcHMgdG8ga2VybmVsIHRpbWUuIFNvLCB3aGVuIGR1bXBpbmcgZXJyb3IgY2FwdHVyZXMg
YW5kL29yIEd1Qw0KPiA+ID4gbG9ncywgaW5jbHVkZSBhIHN0YW1wIGluIGJvdGggdGltZSB6b25l
cyBwbHVzIHRoZSBjbG9jayBmcmVxdWVuY3kuDQo+ID4gPiANCj4gPiA+IFNpZ25lZC1vZmYtYnk6
IEpvaG4gSGFycmlzb24gPEpvaG4uQy5IYXJyaXNvbkBJbnRlbC5jb20+DQo+ID4gPiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X2dwdV9lcnJvci5jDQo+ID4gPiArKysgYi9kcml2ZXJz
L2dwdS9kcm0vaTkxNS9pOTE1X2dwdV9lcnJvci5jDQo+ID4gPiBAQCAtMTY3NSw2ICsxNjc4LDEz
IEBAIGd0X3JlY29yZF91YyhzdHJ1Y3QgaW50ZWxfZ3RfY29yZWR1bXAgKmd0LA0KPiA+ID4gICAJ
ICovDQo+ID4gPiAgIAllcnJvcl91Yy0+Z3VjX2Z3LnBhdGggPSBrc3RyZHVwKHVjLT5ndWMuZncu
cGF0aCwgQUxMT1dfRkFJTCk7DQo+ID4gPiAgIAllcnJvcl91Yy0+aHVjX2Z3LnBhdGggPSBrc3Ry
ZHVwKHVjLT5odWMuZncucGF0aCwgQUxMT1dfRkFJTCk7DQo+ID4gPiArDQo+ID4gPiArCS8qDQo+
ID4gPiArCSAqIFNhdmUgdGhlIEd1QyBsb2cgYW5kIGluY2x1ZGUgYSB0aW1lc3RhbXAgcmVmZXJl
bmNlIGZvciBjb252ZXJ0aW5nIHRoZQ0KPiA+ID4gKwkgKiBsb2cgdGltZXMgdG8gc3lzdGVtIHRp
bWVzIChpbiBjb25qdW5jdGlvbiB3aXRoIHRoZSBlcnJvci0+Ym9vdHRpbWUgYW5kDQo+ID4gPiAr
CSAqIGd0LT5jbG9ja19mcmVxdWVuY3kgZmllbGRzIHNhdmVkIGVsc2V3aGVyZSkuDQo+ID4gPiAr
CSAqLw0KPiA+ID4gKwllcnJvcl91Yy0+dGltZXN0YW1wID0gaW50ZWxfdW5jb3JlX3JlYWQoZ3Qt
Pl9ndC0+dW5jb3JlLCBHVUNQTVRJTUVTVEFNUCk7DQo+ID4gQWxhbjp0aGlzIHJlZ2lzdGVyIGlz
IGluIHRoZSBHVUMtU0hJTSBkb21haW4gYW5kIHNvIHVubGVzcyBpIGFtIG1pc3Rha2VuIHUgbWln
aHQgbmVlZCB0byBlbnN1cmUgd2UgaG9sZCBhIHdha2VyZWYgc28NCj4gPiB0aGF0IGFyZSBnZXR0
aW5nIGEgbGl2ZSB2YWx1ZSBvZiB0aGUgcmVhbCB0aW1lc3RhbXAgcmVnaXN0ZXIgdGhhdCB0aGlz
IHJlZ2lzdGVyIGlzIG1pcnJvci1pbmcgYW5kIG5vdCBhIHN0YWxlIHNuYXBzaG90Lg0KPiA+IE9y
IHdhcyB0aGlzIGFscmVhZHkgZG9uZSBmYXJ0aGVyIHVwIHRoZSBzdGFjaz8gT3IgYXJlIHdlIGRv
aW5nIHRoZSBvcHBvc2l0ZSAtIGluIHdoaWNoIGNhc2Ugd2Ugc2hvdWxkIGVuc3VyZSB3ZSBkcm9w
IGFsDQo+ID4gICB3YWtlcmVmIHByaW9yIHRvIHRoaXMgcG9pbnQuICh3aGljaCBpIGFtIG5vdCBz
dXJlIGlzIGEgcmVsaWFibGUgbWV0aG9kIHNpbmNlIHdlIHdvdWxkbnQga25vdyB3aGF0IEd1QyBy
ZWYgd2FzIGF0KS4NCj4gVGhlIGludGVsX3VuY29yZV9yZWFkKCkgZG9lcyBhIGZvcmNld2FrZSBh
Y3F1aXJlIGltcGxpY2l0bHkuDQo+IA0KPiBOb3Qgc3VyZSB3aGF0IHlvdSBtZWFuIGFib3V0IGRy
b3BwaW5nIGFsbCB3YWtlcmVmcyBwcmlvciB0byB0aGlzIHBvaW50Pw0KPiANCj4gSm9obi4NCj4g
DQo+ID4gPiAgIAllcnJvcl91Yy0+Z3VjX2xvZyA9IGNyZWF0ZV92bWFfY29yZWR1bXAoZ3QtPl9n
dCwgdWMtPmd1Yy5sb2cudm1hLA0KPiA+ID4gICAJCQkJCQkiR3VDIGxvZyBidWZmZXIiLCBjb21w
cmVzcyk7DQo+ID4gPiAgIA0KDQo=
