Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A7FEF4DAA11
	for <lists+dri-devel@lfdr.de>; Wed, 16 Mar 2022 06:54:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4ECA10E2A8;
	Wed, 16 Mar 2022 05:54:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C77E10E2A8;
 Wed, 16 Mar 2022 05:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647410087; x=1678946087;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=l2XDTMnhJea2leCQH0rEjvfZoO8Zw1N262jgloXtcYA=;
 b=aW63DHQRb8cqSrcx5aTLokeJNIXlQyglyfMTtBlp5J7AYxP/CfAKgoXu
 xGunYDnQdbYX0PKFAXGPifO3ZLqchTrq9w4G/BKZUkBcfIvQz30FG2eB/
 YGBV+TOpTTHPHaPhvVJTvtX4u65XruTiRGdw72oySJclYP/B+SuqFkof6
 14pDWDtJJSxQNn8LZnyCWVUSA2iDzEPdlxMjAWE9TWZt+rFXhrd5FsTX/
 KoI8P9hdym0OPWQCypGCa6m4lBsAz2Z3rgOhmOuTpFiPBcA1KuVdJQ77n
 MKPNAJTLNrfuQhJ74zN2buZMOOfnhwbpZIR24eMKTJnjQZTjWzdXi4R4m w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10286"; a="236445148"
X-IronPort-AV: E=Sophos;i="5.90,185,1643702400"; d="scan'208";a="236445148"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2022 22:54:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,185,1643702400"; d="scan'208";a="540768913"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga007.jf.intel.com with ESMTP; 15 Mar 2022 22:54:46 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Tue, 15 Mar 2022 22:54:46 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Tue, 15 Mar 2022 22:54:46 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.102)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.21; Tue, 15 Mar 2022 22:54:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kb4Pj0LF5/cG0EFYduMOCoy0OV5cKWRc7hgHBro6/dY5QPtbXlGbEAaoLe5CRFUdLJ5FC5dVzrZ1/2dPIoNZPzxxAk2/HEojd8D60dHqw/Xoyu6m09/y/lvl6ZdDkwZds6wcXW1nziHcy1vOxrgLvEhyfTTeovWxVFuzSXdpGN1nqT7qM5/0ZETrrbHDNxnPDpDjMkcv6v6m+KJwmy9ZoUCRLLyyPVf/j8W5A1AEabPmYWb51gh8oPF18cYf52oXcZSjtqygVV9K+H5vrctj/7ku85eKn12kHaoUcrLqqjd8l0xkoNfeDIV9f5+wHQBerQK27DwzonZ2czfQujdeww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l2XDTMnhJea2leCQH0rEjvfZoO8Zw1N262jgloXtcYA=;
 b=Yw/MvcsLpXY4L7Fx4r8icIyI8DFzJgRxUsHKBNzqudTcMWtSRJLHPnWMp644lKdCfHRm2mu7nIubAeIB5NQM+7jz1ZwSY8kH4UK/9ryT52v+CkjKsVSkLXiNW795PxnGUq+tL3tCHItvAu3h4mYX5J+wFWa/yzjZvd2P8ThaWi9bqN2po3f77i91hodWRsFePspRqb0PeEoEW+b4PmgIEiVEBBlrWkXFPctiISGO1vM/VPH9TNhYf3zMD6z85I/OTRh6yKMTb+Qjj68dB/vGY745Ll+z9scSnPqkUlWzuPCbWjraVSvI3S6EPiyWRr7Giod39VexaPJ9/7xzupQS6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BYAPR11MB2567.namprd11.prod.outlook.com (2603:10b6:a02:c5::32)
 by CY4PR11MB1430.namprd11.prod.outlook.com (2603:10b6:910:b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.27; Wed, 16 Mar
 2022 05:54:39 +0000
Received: from BYAPR11MB2567.namprd11.prod.outlook.com
 ([fe80::f1ed:9074:5f82:150d]) by BYAPR11MB2567.namprd11.prod.outlook.com
 ([fe80::f1ed:9074:5f82:150d%7]) with mapi id 15.20.5061.028; Wed, 16 Mar 2022
 05:54:39 +0000
From: "Yang, Fei" <fei.yang@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/i915: avoid concurrent writes to aux_inv
Thread-Topic: [PATCH] drm/i915: avoid concurrent writes to aux_inv
Thread-Index: AQHYMBX99rVLU26gUU6Ga1xGmtOKgKzBgJ8AgAABUKA=
Date: Wed, 16 Mar 2022 05:54:39 +0000
Message-ID: <BYAPR11MB2567590EC2088F973025329D9A119@BYAPR11MB2567.namprd11.prod.outlook.com>
References: <20220304221407.2416898-1-fei.yang@intel.com>
 <4e16174fd51a0701004b477a825a584dccf667fb.camel@intel.com>
In-Reply-To: <4e16174fd51a0701004b477a825a584dccf667fb.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.6.401.20
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 071a4fcf-263e-4091-787b-08da0711758a
x-ms-traffictypediagnostic: CY4PR11MB1430:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <CY4PR11MB14306EF86957A426F0DA744C9A119@CY4PR11MB1430.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Pfk4RUbAYOyar1pnyYVCx3jHpWSp/QUc1bdjxWGb2qULi56YVm6i5RPYXAo6yk72u6TyTyzD7Xx04pXVlaR3zwDP8rWoPFGGjNzUbGf/4qpBz6uK2e+FcTSncpe0IltTqkvOIo42Ieo61m/YpSGNv+i9SkiW2l6zCODajxsko2ta16c2sdRahtSuMW+nJw75CtrZGd2CbAE9pcnZ4P58p88jQqgrfUsocW4UF+iQkO4CP3iyBLG4AE6vYcHV+S/M7rV7Vzm5vkulgJKcVKZe0Sh/WiRd4ygldMCCLK/o4PAUL7F7apRk6o/hzAzbIutJ0VIVhLjLNw5azRHeOpWjSxcD+4jKq/4m6KJAB3GNS3EhRYurjh/NtSlvO+sZQ1MiugUYVqS08EPBl+rrAGJc7m+LY7Fm0xVsK1Sa6AVTLYPHQRtxEiA8Z4iaFgI9kTpUF0cWzvVjGbtcZODuZCRDUlcePnFFlw5kSli3KB/zbnmX0xhT0pDMp803z9Nz4Xw72ucIcASuxhRA3bfi95rE1F0JbviR0YAarpAqGzL9nQ9NoAT9wctUjgbqAuThnFZfkM8ROr/hT691SQaw1SbQF204Bog1G6WUsPl/cdBrDFSCC5jqX40+kBH2HpZiDgrHPvEWH+9y7pgO6Tn65yXtoHOuxMtS7etpbz8ifb8L3cGlCpUEKpGJ7q5l6fraH35fgOLtiMB8UXRgm7uTPornRQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2567.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(9686003)(2906002)(4326008)(122000001)(7696005)(107886003)(66556008)(508600001)(33656002)(52536014)(5660300002)(6506007)(8936002)(86362001)(38100700002)(66946007)(83380400001)(26005)(316002)(82960400001)(71200400001)(54906003)(186003)(110136005)(76116006)(64756008)(8676002)(38070700005)(55016003)(66446008)(450100002)(66476007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?N3lHVGpweE5EZnczVHcwb2U5clhoTVpRQzJxYTBBMFZVS0JuaWJDUE9Mb0dm?=
 =?utf-8?B?dDVqY2J0ZUNwcWowTHdmczhyMHZLc3RiMzIyRm9QakViRktpdURqN1BkTHVl?=
 =?utf-8?B?MDhkZkx3MTlWU2Znc1h5b05aaUlEK3ptclJkVmQ1a1RxUCtaMklrUmN5eVdn?=
 =?utf-8?B?c0MvNTB2RUM0d2tmT3FUWlNtTVgrSWZIQ3JpVHFueGFNRnJNVlUxOU5zNlFt?=
 =?utf-8?B?UkRMQ1R5L3dIcWhjWWFONlVHbjZxdXduWit3L205VXpMVW9vVThZaGt1ODYz?=
 =?utf-8?B?OFp1azZKdkZiTHZFNy80ZmcxVDBmYmN3ZlRwU2xHNnh0d0UvNVc4cUhadGJQ?=
 =?utf-8?B?ZVcxWlNuMFFwOG5ZbHNGdmE4OHJ5dUlTOWJUUURDaWF4QVhBeGc3YlRuSVM4?=
 =?utf-8?B?WU1JWk5UVUxHU0MxbDdmTVNHTVB3NlM5aFJWS1JJdUpjMWRHbkpCUitqOERD?=
 =?utf-8?B?RExCalNDS2RjdGhPZmRRNWV0VFJHSjVEV290QXhWWTdacmY3SUNydmczcS9R?=
 =?utf-8?B?ajYwZkN6QmZGdFlFUG1QeGZJNURRc1VIZFM1U2pIR3hnWnhva3lRNFcxODN3?=
 =?utf-8?B?Yk94U2o3UlpQSGNudHk3Nk9ROEJSSzgwK1BmUVMyV0pvTnNLVGo5RmtPcCtU?=
 =?utf-8?B?ZTR3N21tZml2T2pqenNPU05pcGpGdjY2Q2NsS2szbHhYeUpsejc2MEN3aUhT?=
 =?utf-8?B?VWpVUTJFa2xVQXEzbHBlcWZSNXdrdFI0OHN1akkzZDJVMG5oVkZQMk5GOVZG?=
 =?utf-8?B?THlOYytJRU1OS2hmOVpjOGdDN1VNVVg4VU5BOUtwRTNuVStCVUMra01SYmZx?=
 =?utf-8?B?Q3d5Z0dCZi9sT1NHV1BqbXNOUlJqWUNVbVRidEdhVVNjdUZjcVhBZS9pd2tx?=
 =?utf-8?B?Wm1aQkdER090T282a1VWbU16ZHJVWDROSzFNUTFkV2RuWFlLWnVOL1JFazZv?=
 =?utf-8?B?MEdwT1pUNUZFV3d5ZXhxaW91ZFdoOEdaV29hSzZNN0RiWENwZWZ5cXZjUzZL?=
 =?utf-8?B?TlA5VzZQZlArUkwwOGo3OXZoZFViaXBBcGRSSlJ4YWpaL0F2WUxycHc3blBz?=
 =?utf-8?B?RUhvWHNlRXNOM0J0N0RjbWo4UTdoTWlZZFhQUEROUXhTVEtkMm45aGNWY0Vv?=
 =?utf-8?B?UUtqL1JmSk85aFpIVHdxRVdwemlUTkhrZ21ZajFacm53STNGUlFlb2ZQOE9w?=
 =?utf-8?B?QTc4VFY1K3pFcWl6akxJbThwU3BiRUptOHdwYWhZUW4xcVI3dUVOVGJncXlV?=
 =?utf-8?B?aDJMOXdscG5od29qcVpScENPRjM2TUx3c2FraTgrdFA2Vlp6NWhaVVJ2RndY?=
 =?utf-8?B?aHphKzNIc0lWYk1OVzhpbklxYjBOV3lHZVR1UXJaVG9QMFBBZ3ltR01uNElj?=
 =?utf-8?B?ZytSSmtxZWJhN0U3ZFdDZlB5ck5TdXZFTnhZNGJYVllJK3kyOFNZWEFlWWhJ?=
 =?utf-8?B?RDFGK1pPMVZjTWtTV0t1STF5MGVOcHh3Z3FGL2FYMlhPVlB4SHdSTmdEUFAx?=
 =?utf-8?B?ZEVWb01GUWNTYjZjQVFLNFdOc1VYbVZCRm0yZDBUdEZSMFF2QzNHSWk3WUxp?=
 =?utf-8?B?aGt0QzdlU2lud2lxb1ZualZZNUE4RUpyak5FdGNpMXA5dGthNGlHQTI4bTY4?=
 =?utf-8?B?K0hlclQreU9YUkhDT0QyZ0FBbzlzZUVVL3VYZUh6Nm02SmJBdndoNFl3MFNZ?=
 =?utf-8?B?Y1VoUGIvNVhJRktZYitLVmMzdXQxZ3o0VmZZY1dWZE9nQlpEdVlkZVB2QWgv?=
 =?utf-8?B?amhGWFJKekVsRHdQNnFPeWFKM1IwdWJSTWtwbnJBMjFJdnExUGZDLzl1S3BP?=
 =?utf-8?B?T3RLaU93aEp4OFhrUldJRUppZ21sWFFxK0VOOXlSdWcyWGpKZ2JFQmhDRHF3?=
 =?utf-8?B?bERLZUlFbkR6djc5KzJCM0w0RXA1WWNLQ2luazJxZklMa3BGSndoVFl1ZjZp?=
 =?utf-8?B?S0k3UW1CSC9ReWpHaGV0U0VCc2xsakpHVmFjczkzWWIwdnNZTUhzYXlKb0VJ?=
 =?utf-8?B?NndOR3RsZDJDaEs5Z0lhOVluYTFWV005UCsxNUtJaFZFUlhzV3dwMUQyeTdN?=
 =?utf-8?B?TTVNcDlrTWJ1ODROMWw1TXNGa3Nways1dGMrd056SFl3NTY4TVVvK1VMMHN4?=
 =?utf-8?B?bkUyZHlxcmcyZ1QvK1VTYUpMZjl6d3VUb0FPazhDOXRKTG5jRC9veWxrTWNw?=
 =?utf-8?B?VVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2567.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 071a4fcf-263e-4091-787b-08da0711758a
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Mar 2022 05:54:39.2787 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4FBUUKPvBbHrzjXyNQRLV/2KbpIqAHBNg46xxdUgX10PobiNL5rp51+HFwixV1oxm5oICLa/UHVLc+wJDfJkAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB1430
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
Cc: "Abodunrin, Akeem G" <akeem.g.abodunrin@intel.com>, "Wilson,
 Chris P" <chris.p.wilson@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Pj4gQEAgLTE1Nyw2ICsxNjMsOSBAQCBpbnQgZ2VuMTFfZW1pdF9mbHVzaF9yY3Moc3RydWN0IGk5
MTVfcmVxdWVzdCAqcnEsDQo+PiB1MzIgbW9kZSkNCj4+ICAJCWludGVsX3JpbmdfYWR2YW5jZShy
cSwgY3MpOw0KPj4gIAl9DQo+PiAgDQo+PiArCS8qIGhzZGVzOiAxODA5MTc1NzkwLiBObyBmaXh1
cCBuZWVkZWQgZm9yIGdlbjExIHJjcyAqLw0KPj4gKwlycS0+YXV4X2ludl9maXh1cCA9IE5VTEw7
DQo+DQo+IFRoaXMgaXMgYSBsaXR0bGUgdWdseSB0byBtZS4gQ2FuIHdlIGp1c3Qgc2V0IHRoaXMg
dG8gMCBvciAweGRlYWRiZWVmIGJ5IGRlZmF1bHQgbWF5YmUgYW5kIGNoZWNrIHRoYXQgdmFsdWUg
YmVsb3cgaW5zdGVhZCBvZiByZXRyb2FjdGl2ZWx5IGFkZGluZyBhbGwgb2YgdGhlc2UgYXNzaWdu
bWVudHM/DQoNClRoZSBwcm9ibGVtIGlzIHRoZXJlIGFyZSBtYW55IGNvZGUgcGF0aHMgdGhhdCBh
IGk5MTVfcmVxdWVzdCBjb3VsZCBiZSBhbGxvY2F0ZWQsIEknbSBub3QgYXdhcmUgb2YgYSB1bmlm
aWVkIHJvdXRpbmUgd2hlcmUgSSBjb3VsZCBpbml0aWFsaXplIHRoZSBwb2ludGVyIGZvciBhbGwg
aTkxNV9yZXF1ZXN0cy4NCg0KPj4gKw0KPj4gIAlyZXR1cm4gMDsNCj4+ICB9DQo+PiAgDQo+PiAr
CQkvKg0KPj4gKwkJICogV2UgZG9uJ3Qga25vdyB3aGljaCBlbmdpbmUgd2lsbCBldmVudHVhbGx5
IGNhcnJ5IG91dA0KPj4gKwkJICogdGhpcyByZXF1ZXN0LCBzbyB0aGUgbW1pbyBhdXhfaW52IHJl
Z2lzdGVyIGFkZHJlc3MNCj4+IGlzDQo+PiArCQkgKiB1bmtub3duIGF0IHRoaXMgbW9tZW50LiBX
ZSBzYXZlIHRoZSBjcyBwb2ludGVyDQo+PiBzdXBwb3NlZA0KPj4gKwkJICogdG8gaG9sZCB0aGUg
YXV4X2ludiBhZGRyZXNzIGluIHJxLT5hdXhfaW52X2ZpeHVwIGFuZA0KPj4gc2V0DQo+PiArCQkg
KiBpdCBpbiBleGVjbGlzdHNfZGVxdWV1ZSgpIHdoZW4gdGhlIGVuZ2luZSBpbnN0YW5jZQ0KPj4g
KwkJICogY2Fycnlpbmcgb3V0IHRoaXMgcmVxdWVzdCBiZWNvbWVzIGNlcnRhaW4NCj4+ICsJCSAq
Lw0KPj4gKwkJKmNzKysgPSBNSV9MT0FEX1JFR0lTVEVSX0lNTSgxKTsNCj4+ICsJCXJxLT5hdXhf
aW52X2ZpeHVwID0gY3M7IC8qIHNhdmUgdGhlIHBvaW50ZXIgdG8gYXV4X2ludg0KPj4gKi8NCj4+
ICsJCSpjcysrID0gMDsgLyogbW1pbyBhZGRyIHRvIGJlIHNldCBhdCBzdWJtaXNzaW9uIHRvIEhX
DQo+PiAqLw0KPg0KPk1heWJlIE1JX05PT1AgaW5zdGVhZD8NCg0KVGhpcyBpcyBzdXBwb3NlZCB0
byBiZSB0aGUgbW1pbyBhZGRyZXNzIGZpZWxkIGZvciB0aGUgTUlfTE9BRF9SRUdJU1RFUl9JTU0g
aW5zdHJ1Y3Rpb24sIHNldHRpbmcgaXQgdG8gMCBtYWtlcyBtb3JlIHNlbnNlPw0KDQo+PiArCQkq
Y3MrKyA9IEFVWF9JTlY7DQo+PiAgCQkqY3MrKyA9IE1JX05PT1A7DQo+PiAtCX0NCj4+ICsJfSBl
bHNlDQo+DQo+IENhbiB5b3UgYWRkIHRoZSBicmFja2V0cyBoZXJlIG9uIHRoZSBlbHNlOg0KPiB9
IGVsc2Ugew0KPiAgICBhdXhfaW52X2ZpeHVwID0gTlVMTA0KPiB9DQo+DQo+QWxzbyBnb29kIHRv
IHJ1biBjaGVja3BhdGNoLiBJIHNlZSB0aGlzIHNob3dpbmcgdXAgYXMgYSB3YXJuaW5nIGluIHRo
ZSBjaGVja3BhdGNoIHJlc3VsdHMuDQoNCkkgbm90aWNlZCB0aGUgd2FybmluZywgd2lsbCB1cGRh
dGUuDQoNCj4+ICsJCXJxLT5hdXhfaW52X2ZpeHVwID0gTlVMTDsNCj4+ICANCj4+ICAJaWYgKG1v
ZGUgJiBFTUlUX0lOVkFMSURBVEUpDQo+PiAgCQkqY3MrKyA9IHByZXBhcnNlcl9kaXNhYmxlKGZh
bHNlKTsNCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC9pbnRlbF9leGVj
bGlzdHNfc3VibWlzc2lvbi5jDQo+PiBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L2ludGVsX2V4
ZWNsaXN0c19zdWJtaXNzaW9uLmMNCj4+IGluZGV4IGUxNDcwYmI2MGYzNC4uN2U4NTUyNDE0Mjc1
IDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3QvaW50ZWxfZXhlY2xpc3Rz
X3N1Ym1pc3Npb24uYw0KPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3QvaW50ZWxfZXhl
Y2xpc3RzX3N1Ym1pc3Npb24uYw0KPj4gQEAgLTEyNTgsNiArMTI1OCwzNCBAQCBzdGF0aWMgYm9v
bCBjb21wbGV0ZWQoY29uc3Qgc3RydWN0IGk5MTVfcmVxdWVzdCANCj4+ICpycSkNCj4+ICAJcmV0
dXJuIF9faTkxNV9yZXF1ZXN0X2lzX2NvbXBsZXRlKHJxKTsgIH0NCj4+ICANCj4+ICtzdGF0aWMg
aTkxNV9yZWdfdCBhdXhfaW52X3JlZyhjb25zdCBzdHJ1Y3QgaW50ZWxfZW5naW5lX2NzICplbmdp
bmUpIHsNCj4+ICsJc3RhdGljIGNvbnN0IGk5MTVfcmVnX3QgdmRbXSA9IHsNCj4+ICsJCUdFTjEy
X1ZEMF9BVVhfTlYsDQo+PiArCQlHRU4xMl9WRDFfQVVYX05WLA0KPj4gKwkJR0VOMTJfVkQyX0FV
WF9OViwNCj4+ICsJCUdFTjEyX1ZEM19BVVhfTlYsDQo+PiArCX07DQo+PiArDQo+PiArCXN0YXRp
YyBjb25zdCBpOTE1X3JlZ190IHZlW10gPSB7DQo+PiArCQlHRU4xMl9WRTBfQVVYX05WLA0KPj4g
KwkJR0VOMTJfVkUxX0FVWF9OViwNCj4+ICsJfTsNCj4+ICsNCj4+ICsJaWYgKGVuZ2luZS0+Y2xh
c3MgPT0gVklERU9fREVDT0RFX0NMQVNTKSB7DQo+PiArCQlHRU1fQlVHX09OKGVuZ2luZS0+aW5z
dGFuY2UgPj0gQVJSQVlfU0laRSh2ZCkpOw0KPj4gKwkJcmV0dXJuIHZkW2VuZ2luZS0+aW5zdGFu
Y2VdOw0KPj4gKwl9DQo+PiArDQo+PiArCWlmIChlbmdpbmUtPmNsYXNzID09IFZJREVPX0VOSEFO
Q0VNRU5UX0NMQVNTKSB7DQo+PiArCQlHRU1fQlVHX09OKGVuZ2luZS0+aW5zdGFuY2UgPj0gQVJS
QVlfU0laRSh2ZSkpOw0KPj4gKwkJcmV0dXJuIHZlW2VuZ2luZS0+aW5zdGFuY2VdOw0KPj4gKwl9
DQo+PiArDQo+PiArCUdFTV9CVUdfT04oInVua25vd24gYXV4X2ludiByZWdcbiIpOw0KPj4gKwly
ZXR1cm4gSU5WQUxJRF9NTUlPX1JFRzsNCj4+ICt9DQo+PiArDQo+PiAgc3RhdGljIHZvaWQgZXhl
Y2xpc3RzX2RlcXVldWUoc3RydWN0IGludGVsX2VuZ2luZV9jcyAqZW5naW5lKQ0KPiANCj4gU28g
aW4gdGhlIHByZXZpb3VzIGltcGxlbWVudGF0aW9uLCB0aGlzICJ3b3JrZWQiIGZvciBib3RoIGV4
ZWNsaXN0cyBhbmQgZ3VjIHN1Ym1pc3Npb24uIEJ1dCBob3cgd2lsbCB0aGlzIHdvcmsgbm93IGZv
ciBHdUMgYmFzZWQgc3VibWlzc2lvbj8NCj4gVGhpcyBmbG93IGFuZCB0aGUgYWRkcmVzcyBvZiB0
aGUgZW5naW5lIGlzIG93bmVkIGJ5IHRoZSBHdUMuDQo+DQo+IElmIHdlIGFyZSBnb2luZyB0byBz
YXkgdGhpcyBpcyBhbiBleGVjbGlzdCBvbmx5IHJlcXVpcmVtZW50IChlLmcuDQo+IHBsYXRmb3Jt
cyB1c2luZyBHdUMgc3VibWlzc2lvbiBkb24ndCBuZWVkIHRoaXMgd29ya2Fyb3VuZCksIHlvdSBz
aG91bGQgYWRkIGFuIGlmICghdXNpbmcgZ3VjIHN1Ym1pc3Npb24pIGluIHRoZSBzZXF1ZW5jZSB5
b3UgYWRkZWQgdG8gdGhlIHZhcmlvdXMgZW1pdF9mbHVzaCgpIHJvdXRpbmVzIGFib3ZlLg0KDQpH
b29kIHBvaW50Lg0KSSBkaWRuJ3QgY29uc2lkZXIgR3VDIHN1Ym1pc3Npb24gYmVjYXVzZSBDaHJv
bWUgZG9lc24ndCBlbmFibGUgR3VDIGZvciBUR0wuIEJ1dCBpdCBpcyB0cnVlIHRoYXQgdGhlIGlt
cGxlbWVudGF0aW9uIHdpbGwgaGF2ZSBwcm9ibGVtIHdpdGggR3VDIHN1Ym1pc3Npb24uDQpJJ20g
bm90IHN1cmUgaWYgaXQncyBwb3NzaWJsZSBmb3IgaTkxNSB0byBrbm93IHdoaWNoIGVuZ2luZSB3
aWxsIGV2ZW50dWFsbHkgY2Fycnkgb3V0IHRoZSByZXF1ZXN0IGJlY2F1c2UgaXQgbWlnaHQgYmUg
c2NoZWR1bGVkIGJ5IEd1Qy4gSSB3aWxsIG5lZWQgdG8gaW52ZXN0aWdhdGUuDQoNCj4gVGhhbmtz
LA0KPiBTdHVhcnQNCg0K
