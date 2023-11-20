Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13A9A7F0BC9
	for <lists+dri-devel@lfdr.de>; Mon, 20 Nov 2023 07:13:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7980710E118;
	Mon, 20 Nov 2023 06:13:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAD8E10E116;
 Mon, 20 Nov 2023 06:13:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700460800; x=1731996800;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=1rLR9WqUAjkYIzgBK6vypzexPOwiiQY+WNq9/FPuruc=;
 b=i4PpxtHXHRhsvHPVCO33EjtsFfDvLA+Ydac4QziTtg5aJXdPxeSuliV2
 iEpq381TJdoPrXlPWxSctsm0ISSCmiXTFRS4P4e8ESsOzjJCZJY0yS7sN
 qBiFSC810LlXyPRUP6P6cMbVbde9CO3FKnR2G8837e9x3BOHS1Z/xYqgm
 ZiI1Be3mVctl2JfkswTxktdIs2PmEZbJJUXComBN2RGi6IzfM55YnmCeh
 c5LgP2JYPOG3NpGdFZBs/XlDmI+SevzLk07ALJ7GN+QZqlTL8Hfwej6kB
 Iq1gbTucz6W+GhtmG4EvG9qBHqlpz+btR0LY892n0QZlBi8CZrkYa9T/t A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10899"; a="381949437"
X-IronPort-AV: E=Sophos;i="6.04,212,1695711600"; d="scan'208";a="381949437"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2023 22:13:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10899"; a="856895609"
X-IronPort-AV: E=Sophos;i="6.04,212,1695711600"; d="scan'208";a="856895609"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Nov 2023 22:13:18 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Sun, 19 Nov 2023 22:13:18 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Sun, 19 Nov 2023 22:13:18 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Sun, 19 Nov 2023 22:13:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GmO/eOcD24cw5W4rWTTkc7tKtfmka5QHlJixP2kuDV+u/i4slG/NbwgT1EzkiRzih7WWf0Qk4Yab89w5A24flmahYT9UTYZfWvDJh6ltPblnYqm3RGQOjSKIH6LpSoxk9wgfzh0mRpC+0qlQEnw/ElHlVtcTAQqI2eaJHdfVsR2oFLf8REMpbgCODdCA51p8C2t2QuVAb5zA22qg9bChlmznjOVRlr5VNh3Q5wU7sjL1ggRT8xANXSmtQ5vEXYz3z5Nkd2hhwvL9aDoBew9870oAWHOLZp0GPJ7Vy4OJ15cnCCrc7F39wkUWWd5wI0e4PTu9CrREKaJjQr4kTrEoAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1rLR9WqUAjkYIzgBK6vypzexPOwiiQY+WNq9/FPuruc=;
 b=cocHbcYBLsVFKhnfV5415UM5RggxQmSXNhwktzvVEo9GWH5sZCmlY1++NxiCQ/z6hqrXCjLn5WrgS+GpuX5VRnXMI7tfTb/wsGi0zwqD9Hgvp/FELq3cbzI8zfMdypjR5hNWCl0EcuVtwMaaxm8tKiXaTFEvShHbwHZpmWbMN2OkX1Tdudgla633ocQA2lrQSCk4v3KqSagQ31okmrJqmGJeCT0fBgXexPNTjYDz9q7GMi0m9PXjVV2KszF2KvJvOXkUYFUAvyIKHrWipl7rufR5ywzaFS/mlpohaN40w8Sgj5XBFTexAiof93AOadSW3cpJCZDCG7nqUnSrpbxlRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by DS0PR11MB6520.namprd11.prod.outlook.com (2603:10b6:8:d0::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.27; Mon, 20 Nov
 2023 06:13:16 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::b5bf:a968:5f25:945]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::b5bf:a968:5f25:945%6]) with mapi id 15.20.7002.026; Mon, 20 Nov 2023
 06:13:16 +0000
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 4/4] drm/i915: Fix glk+ degamma LUT conversions
Thread-Topic: [PATCH 4/4] drm/i915: Fix glk+ degamma LUT conversions
Thread-Index: AQHZ/ddSXQnextkSNkGhGz1gwWnwqLCC9X3Q
Date: Mon, 20 Nov 2023 06:13:16 +0000
Message-ID: <SJ1PR11MB61293462A3DC30BC5823AB92B9B4A@SJ1PR11MB6129.namprd11.prod.outlook.com>
References: <20231013131402.24072-1-ville.syrjala@linux.intel.com>
 <20231013131402.24072-5-ville.syrjala@linux.intel.com>
In-Reply-To: <20231013131402.24072-5-ville.syrjala@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6129:EE_|DS0PR11MB6520:EE_
x-ms-office365-filtering-correlation-id: 910e5716-2bd8-49fa-dbef-08dbe98fc8e8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: OcxnQ9wUxdzhQ9TLZVFjPDKq8ZGLZzrYMCrizUozzuuY/Dr7ob/u2uYGblFPLTGNDCjghY8HtRD6t967Q6y53Bpv0GVyaIW15xJp3ezGyEnoewf1hLcVdHcrgwftMBZ6i+s2EFsM+8dzdad5mLk00FNmXN4CU9EQ2MSElULxPct+qFpGDp9L7FqdUZSqJ6H0d6Eq1dbei6ciaE9P+UiwWVy+Vdk+uUkKPzXtRBbB1kpAzoT51tDV9iZraYIzZhnL+9phTU512bMpcgDnRYUf4tE2JseeOoVmoS5AH42mF+GlTDxZ9SoTX/mS3PKYxGs4Sfy9CvK79nY7oxGzn3jhKBPllwTxH/VgGgQ0DyUWdFWVJwHW2Yuf1jr/VXnjo1ZDjW+AfxGXY0giZlJHyIifYFX3hh8Fhjx4p0w6BtPkRWbSPMOk83Y7bVSEp4oqraGhK74fPUM7wqq4/E79iHWRA1iQPH4LjPZQnh3U6d+eQleUwEmMaP4fsQn3MnB/EMO8xabafPDbjToWpbBIXXLvMtkmZlcidBeES0VhvkGrONXC4f974dvbxhzdcvmXcfi7/fUQpgsK4uB4DFgfA3dkTptfa4EZnezNiTYuL/BI4YrDjtJw9ONpDbWbFDYj+d8m
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6129.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(376002)(346002)(396003)(366004)(39860400002)(230922051799003)(186009)(64100799003)(1800799012)(451199024)(316002)(110136005)(66446008)(64756008)(66556008)(66476007)(76116006)(6506007)(7696005)(53546011)(9686003)(71200400001)(26005)(38070700009)(478600001)(38100700002)(82960400001)(122000001)(83380400001)(33656002)(66946007)(86362001)(52536014)(5660300002)(55016003)(2906002)(8936002)(4326008)(41300700001)(8676002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?c2VZYjR5bFc1SmdPVmMvUStKSXpNSzJlTkU3WSs1RjZFZGkvL0IyV2ZQOUZZ?=
 =?utf-8?B?M0ZEaVBVZ0l3OGErK1J4dXpCQlZzaC9iZW1lYWtWY3gvc2xMU2pINGhiVENv?=
 =?utf-8?B?K2xvR0JSOXFidmdrQW8wYjNrS1B6bUdGbUYyS3VTMHJXMmJxbmdjQXlQb1JB?=
 =?utf-8?B?cmhiREtLb0NlTUxwdzl4ZUhVdGxwTkNUaWowRFJuVEJjL0FVOHhlR2VRQ3JF?=
 =?utf-8?B?My83bjBCS2VXSVI2NTBkQk04eGtZbjA1Sm5PVFJEdkRQMmNrNTdJdm01Znly?=
 =?utf-8?B?UHA4MGNqM3pSNGp0ODQ2MkRJVE54VS9qNFgwU3NPRmkvOUd1cVB2RDViUXBJ?=
 =?utf-8?B?TGJnaDRMWXptZkM3MmYybzhINVhiSklrYkdobjR4QlFPZ2pwK0gwTVZGeHhR?=
 =?utf-8?B?THNoRXVJbllFbnBlUGg5Q0Mra3dJZ0M0UkNVU29yMDNWc3NlemZNT3Q1cW9J?=
 =?utf-8?B?YWV3TW9wZDRxMS9qdGpqQzR1MDlqWHZ3a2xjbTRjZDFYT0drMFB5cklLdW1l?=
 =?utf-8?B?VFdlV3pOK0VLKy96YnIwMkpKNTRKSWFqSnU4ZU5YaEw0LzFxWmNWZzZENU9k?=
 =?utf-8?B?R0dVZVUzNG5WcnptVStrVVV2Y3NUY202QkpHanZZWnNvK3FDaDAzLy9ocnFy?=
 =?utf-8?B?S2gvMWh4VW4vcWFxZXNxTUkwaHl0ckJaV1gzQnZEZDl4aUxRZUZ4dVhnb2dZ?=
 =?utf-8?B?U3lhUm5VcXY5S0VIR0Y2UmQ5N3l4NmpTSnVSSlVFZWdMYmNRblZoTHVEUXFY?=
 =?utf-8?B?emY4OE1NaEFPbnZPTDFzZk13OVBNMmU1SFdWbDNROTFoVmRNbnJCbHlxSmxr?=
 =?utf-8?B?RnI4NTRTcHcxSnZQRW9OaHVIaGFKcUx6RjdldG1QZ1pIMmR6akVWZlpSampq?=
 =?utf-8?B?QUwwWC9HWTA1amdWanVrZDQvVSt2UUFUZ0d2K1dhV251N0hKUGw0QzNhSGJn?=
 =?utf-8?B?WllYSytma1hLNUEvRjFqbm94bDFwVGkwN1hHMjRxRGg0Y09PbW5PSjNXWHFX?=
 =?utf-8?B?eVZJQnI0QXNUMi9BY09YWUp3aWIyakEzZHAvdDhQUlk2aDladjdabWw3SjIx?=
 =?utf-8?B?djJTbDRsbHZJNkhERDJxM2cvUlJ5U09ja1ZrYlFwdUpoOXRHbUlEcjYzcnUz?=
 =?utf-8?B?Si9CTHNCeGV3LzQ3b2s5TzdMU3BYSlNJdVlnUlFET2RxYXBvc1ZFM3piOTY2?=
 =?utf-8?B?ZFRTbFVJang5cFdpNENQVittL3dmNXBOaFpEMWVuMVRxN0NMMVhaelNUYllt?=
 =?utf-8?B?anFsU2NBNXJ4d3F2Y1NFaUJJMTRxUHVLNHBENzBzRTExQ1p1aDgwd0x6MGl4?=
 =?utf-8?B?bGRzU1FiaS91YmxlMjFoSzJCNWFqa1lrT0hxMmhzK05aSFdzN0w1Tnl2emVW?=
 =?utf-8?B?UnhQV2lkUnkwMGNvSDY1aks0Vlo2Rm41VjBZRzRYYW9LNzJIK2c4OUppbzgw?=
 =?utf-8?B?VGEwMURQV2p2KzAvSzIzN0cvcGRLd3JETzFWSi85c2lzS3pHSksvUldSUmdj?=
 =?utf-8?B?MkZ0aitqSVNhUzNGZ25Rd1JIVkcwT0ZyYTBwdll2V2pXdGhjMFA3VU9mUU5O?=
 =?utf-8?B?T3ZWY3VKOHp0c3BmeUdNRGJ0eXREQmJiV2FYdCtSMXF6RCtXZk5yanNISENP?=
 =?utf-8?B?WjA3WTRnZDVCK1lPd2dYYjJYWVJBa0dMVFFydkVqK2podUFlRzgxSVBDc094?=
 =?utf-8?B?VWx5ZGpGUktjTFVYSy9TalU4M09hNkE2SnQ1bGxxdkZzajhpRCtmZFdCS1NB?=
 =?utf-8?B?cGtvYXNlRVVMTWdoVHlZUmdDbjYzWStvV0x4cDBBRi8reENiZjBsWWdmRjdU?=
 =?utf-8?B?ZHhXanlzcWIva1pxbi9oS01KS3FvcWdGR0JJM3M4QkFLcFJ3K0lYOE5mQmJh?=
 =?utf-8?B?L05jYjF1bWx1aGNHRzFtVkpBdTNYTkM1WDlQZzRqdHI1d1Nib3B4NjZNOXBk?=
 =?utf-8?B?V3hEMDhhSEVjZHRDeU1XT2M1dEo5c0xxZXBoc014Ykg3U3R5TkJhV2t1NTI2?=
 =?utf-8?B?emFmTUZGQm9kVjI0bE0yUklkczZCYTk4Y0pPTGRQT2NEaEtuWmdFNE1zMnVi?=
 =?utf-8?B?OGZVWkUzaDBSd0duazlMRXlxYXY2eG1kSVp1RUNza3BoSUhGZ08xSk1nRVFP?=
 =?utf-8?B?V2EvL1VKTGwrdTEwYVd5VEhFRFM0dnZXRUF1WkRPTXNqSGpRYnVRbjRiMDFS?=
 =?utf-8?B?TWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 910e5716-2bd8-49fa-dbef-08dbe98fc8e8
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2023 06:13:16.3185 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: q9xllQEUlbqdMSmvN7ftcQHnufdhurg+lXfs0C8nCLZXIng2gzO7aSCL0In8QSifxqIlKAh1p+ZKCv4/IJo6MELbF42/4QhwsH59OmxM9os=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6520
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBkcmktZGV2ZWwgPGRyaS1kZXZl
bC1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mIFZpbGxlDQo+IFN5
cmphbGENCj4gU2VudDogRnJpZGF5LCBPY3RvYmVyIDEzLCAyMDIzIDY6NDQgUE0NCj4gVG86IGlu
dGVsLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcNCj4gU3ViamVjdDogW1BBVENIIDQvNF0gZHJtL2k5MTU6IEZpeCBnbGsrIGRl
Z2FtbWEgTFVUIGNvbnZlcnNpb25zDQo+IA0KPiBGcm9tOiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxl
LnN5cmphbGFAbGludXguaW50ZWwuY29tPg0KPiANCj4gVGhlIGN1cnJlbnQgaW1wbGVtZW50YXRp
b24gb2YgY2hhbmdlX2x1dF92YWxfcHJlY2lzaW9uKCkgaXMganVzdCBhIGNvbnZvbHV0ZWQNCj4g
d2F5IG9mIHNoaWZ0aW5nIGJ5IDguIEltcGxlbWVudCB0aGUgcHJvcGVyIHJvdW5kaW5nIGJ5IGp1
c3QgdXNpbmcNCj4gZHJtX2NvbG9yX2x1dF9leHRyYWN0KCkgYW5kIGludGVsX2NvbG9yX2x1dF9w
YWNrKCkgbGlrZSBldmVyeW9uZSBlbHNlIGRvZXMuDQo+IA0KPiBBbmQgYXMgdGhlIHVhcGkgY2Fu
J3QgaGFuZGxlID49MS4wIHZhbHVlcyBidXQgdGhlIGhhcmR3YXJlIGNhbiB3ZSBuZWVkIHRvDQo+
IGNsYW1wIHRoZSByZXN1bHRzIGFwcHJvcHJpYXRlbHkgaW4gdGhlIHJlYWRvdXQgcGF0aC4NCj4g
DQo+IFNpZ25lZC1vZmYtYnk6IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5p
bnRlbC5jb20+DQoNCkxHVE0uDQoNClJldmlld2VkLWJ5OiBDaGFpdGFueWEgS3VtYXIgQm9yYWgg
PGNoYWl0YW55YS5rdW1hci5ib3JhaEBpbnRlbC5jb20+DQoNCg0KPiAtLS0NCj4gIGRyaXZlcnMv
Z3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfY29sb3IuYyB8IDU0ICsrKysrKysrKysrLS0tLS0t
LS0tLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAyOCBpbnNlcnRpb25zKCspLCAyNiBkZWxldGlvbnMo
LSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVs
X2NvbG9yLmMNCj4gYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2NvbG9yLmMN
Cj4gaW5kZXggYTRiMzA2MTRiZDYzLi4xY2ZiYjM2NTAzMDQgMTAwNjQ0DQo+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfY29sb3IuYw0KPiArKysgYi9kcml2ZXJzL2dw
dS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2NvbG9yLmMNCj4gQEAgLTE1MjYsMTQgKzE1MjYsMjcg
QEAgc3RhdGljIGludCBnbGtfZGVnYW1tYV9sdXRfc2l6ZShzdHJ1Y3QNCj4gZHJtX2k5MTVfcHJp
dmF0ZSAqaTkxNSkNCj4gIAkJcmV0dXJuIDM1Ow0KPiAgfQ0KPiANCj4gLS8qDQo+IC0gKiBjaGFu
Z2VfbHV0X3ZhbF9wcmVjaXNpb246IGhlbHBlciBmdW5jdGlvbiB0byB1cHNjYWxlIG9yIGRvd25z
Y2FsZSBsdXQNCj4gdmFsdWVzLg0KPiAtICogUGFyYW1ldGVycyAndG8nIGFuZCAnZnJvbScgbmVl
ZHMgdG8gYmUgbGVzcyB0aGFuIDMyLiBUaGlzIHNob3VsZCBiZQ0KPiBzdWZmaWNpZW50DQo+IC0g
KiBhcyBjdXJyZW50bHkgdGhlcmUgYXJlIG5vIGx1dCB2YWx1ZXMgZXhjZWVkaW5nIDMyIGJpdC4N
Cj4gLSAqLw0KPiAtc3RhdGljIHUzMiBjaGFuZ2VfbHV0X3ZhbF9wcmVjaXNpb24odTMyIGx1dF92
YWwsIGludCB0bywgaW50IGZyb20pDQo+ICtzdGF0aWMgdTMyIGdsa19kZWdhbW1hX2x1dChjb25z
dCBzdHJ1Y3QgZHJtX2NvbG9yX2x1dCAqY29sb3IpIHsNCj4gKwlyZXR1cm4gY29sb3ItPmdyZWVu
Ow0KPiArfQ0KPiArDQo+ICtzdGF0aWMgdm9pZCBnbGtfZGVnYW1tYV9sdXRfcGFjayhzdHJ1Y3Qg
ZHJtX2NvbG9yX2x1dCAqZW50cnksIHUzMiB2YWwpDQo+ICt7DQo+ICsJLyogUFJFX0NTQ19HQU1D
X0RBVEEgaXMgMy4xNiwgY2xhbXAgdG8gMC4xNiAqLw0KPiArCWVudHJ5LT5yZWQgPSBlbnRyeS0+
Z3JlZW4gPSBlbnRyeS0+Ymx1ZSA9IG1pbih2YWwsIDB4ZmZmZnUpOyB9DQo+ICsNCj4gK3N0YXRp
YyB1MzIgbXRsX2RlZ2FtbWFfbHV0KGNvbnN0IHN0cnVjdCBkcm1fY29sb3JfbHV0ICpjb2xvcikg
ew0KPiArCXJldHVybiBkcm1fY29sb3JfbHV0X2V4dHJhY3QoY29sb3ItPmdyZWVuLCAyNCk7IH0N
Cj4gKw0KPiArc3RhdGljIHZvaWQgbXRsX2RlZ2FtbWFfbHV0X3BhY2soc3RydWN0IGRybV9jb2xv
cl9sdXQgKmVudHJ5LCB1MzIgdmFsKQ0KPiAgew0KPiAtCXJldHVybiBtdWxfdTMyX3UzMihsdXRf
dmFsLCAoMSA8PCB0bykpIC8gKDEgPDwgZnJvbSk7DQo+ICsJLyogUFJFX0NTQ19HQU1DX0RBVEEg
aXMgMy4yNCwgY2xhbXAgdG8gMC4xNiAqLw0KPiArCWVudHJ5LT5yZWQgPSBlbnRyeS0+Z3JlZW4g
PSBlbnRyeS0+Ymx1ZSA9DQo+ICsJCWludGVsX2NvbG9yX2x1dF9wYWNrKG1pbih2YWwsIDB4ZmZm
ZmZmdSksIDI0KTsNCj4gIH0NCj4gDQo+ICBzdGF0aWMgdm9pZCBnbGtfbG9hZF9kZWdhbW1hX2x1
dChjb25zdCBzdHJ1Y3QgaW50ZWxfY3J0Y19zdGF0ZSAqY3J0Y19zdGF0ZSwNCj4gQEAgLTE1NzAs
MjAgKzE1ODMsMTYgQEAgc3RhdGljIHZvaWQgZ2xrX2xvYWRfZGVnYW1tYV9sdXQoY29uc3Qgc3Ry
dWN0DQo+IGludGVsX2NydGNfc3RhdGUgKmNydGNfc3RhdGUsDQo+ICAJCSAqIFRvRG86IEV4dGVu
ZCB0byBtYXggNy4wLiBFbmFibGUgMzIgYml0IGlucHV0IHZhbHVlDQo+ICAJCSAqIGFzIGNvbXBh
cmVkIHRvIGp1c3QgMTYgdG8gYWNoaWV2ZSB0aGlzLg0KPiAgCQkgKi8NCj4gLQkJdTMyIGx1dF92
YWw7DQo+IC0NCj4gLQkJaWYgKERJU1BMQVlfVkVSKGk5MTUpID49IDE0KQ0KPiAtCQkJbHV0X3Zh
bCA9IGNoYW5nZV9sdXRfdmFsX3ByZWNpc2lvbihsdXRbaV0uZ3JlZW4sIDI0LA0KPiAxNik7DQo+
IC0JCWVsc2UNCj4gLQkJCWx1dF92YWwgPSBsdXRbaV0uZ3JlZW47DQo+IC0NCj4gIAkJaWxrX2x1
dF93cml0ZShjcnRjX3N0YXRlLCBQUkVfQ1NDX0dBTUNfREFUQShwaXBlKSwNCj4gLQkJCSAgICAg
IGx1dF92YWwpOw0KPiArCQkJICAgICAgRElTUExBWV9WRVIoaTkxNSkgPj0gMTQgPw0KPiArCQkJ
ICAgICAgbXRsX2RlZ2FtbWFfbHV0KCZsdXRbaV0pIDoNCj4gZ2xrX2RlZ2FtbWFfbHV0KCZsdXRb
aV0pKTsNCj4gIAl9DQo+IA0KPiAgCS8qIENsYW1wIHZhbHVlcyA+IDEuMC4gKi8NCj4gIAl3aGls
ZSAoaSsrIDwgZ2xrX2RlZ2FtbWFfbHV0X3NpemUoaTkxNSkpDQo+IC0JCWlsa19sdXRfd3JpdGUo
Y3J0Y19zdGF0ZSwgUFJFX0NTQ19HQU1DX0RBVEEocGlwZSksIDEgPDwNCj4gMTYpOw0KPiArCQlp
bGtfbHV0X3dyaXRlKGNydGNfc3RhdGUsIFBSRV9DU0NfR0FNQ19EQVRBKHBpcGUpLA0KPiArCQkJ
ICAgICAgRElTUExBWV9WRVIoaTkxNSkgPj0gMTQgPw0KPiArCQkJICAgICAgMSA8PCAyNCA6IDEg
PDwgMTYpOw0KPiANCj4gIAlpbGtfbHV0X3dyaXRlKGNydGNfc3RhdGUsIFBSRV9DU0NfR0FNQ19J
TkRFWChwaXBlKSwgMCk7ICB9IEBAIC0NCj4gMzU3MywxNyArMzU4MiwxMCBAQCBzdGF0aWMgc3Ry
dWN0IGRybV9wcm9wZXJ0eV9ibG9iDQo+ICpnbGtfcmVhZF9kZWdhbW1hX2x1dChzdHJ1Y3QgaW50
ZWxfY3J0YyAqY3J0YykNCj4gIAlmb3IgKGkgPSAwOyBpIDwgbHV0X3NpemU7IGkrKykgew0KPiAg
CQl1MzIgdmFsID0gaW50ZWxfZGVfcmVhZF9mdyhkZXZfcHJpdiwNCj4gUFJFX0NTQ19HQU1DX0RB
VEEocGlwZSkpOw0KPiANCj4gLQkJLyoNCj4gLQkJICogRm9yIE1UTCBhbmQgYmV5b25kLCBjb252
ZXJ0IGJhY2sgdGhlIDI0IGJpdCBsdXQgdmFsdWVzDQo+IC0JCSAqIHJlYWQgZnJvbSBIVyB0byAx
NiBiaXQgdmFsdWVzIHRvIG1haW50YWluIHBhcml0eSB3aXRoDQo+IC0JCSAqIHVzZXJzcGFjZSB2
YWx1ZXMNCj4gLQkJICovDQo+ICAJCWlmIChESVNQTEFZX1ZFUihkZXZfcHJpdikgPj0gMTQpDQo+
IC0JCQl2YWwgPSBjaGFuZ2VfbHV0X3ZhbF9wcmVjaXNpb24odmFsLCAxNiwgMjQpOw0KPiAtDQo+
IC0JCWx1dFtpXS5yZWQgPSB2YWw7DQo+IC0JCWx1dFtpXS5ncmVlbiA9IHZhbDsNCj4gLQkJbHV0
W2ldLmJsdWUgPSB2YWw7DQo+ICsJCQltdGxfZGVnYW1tYV9sdXRfcGFjaygmbHV0W2ldLCB2YWwp
Ow0KPiArCQllbHNlDQo+ICsJCQlnbGtfZGVnYW1tYV9sdXRfcGFjaygmbHV0W2ldLCB2YWwpOw0K
PiAgCX0NCj4gDQo+ICAJaW50ZWxfZGVfd3JpdGVfZncoZGV2X3ByaXYsIFBSRV9DU0NfR0FNQ19J
TkRFWChwaXBlKSwNCj4gLS0NCj4gMi40MS4wDQoNCg==
