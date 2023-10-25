Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 387F47D6294
	for <lists+dri-devel@lfdr.de>; Wed, 25 Oct 2023 09:28:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4427A10E567;
	Wed, 25 Oct 2023 07:28:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E75D10E567;
 Wed, 25 Oct 2023 07:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698218912; x=1729754912;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=u1YvquSBgw+IXV/Yn1QBuQSkrJZ7ypWOJ2njJ+nGnCg=;
 b=SB+VDwcufxaWG7+nWscW5IpfwtMujpQ+irPA/o1hpL9irU5ww2DHGeId
 vviw0ZnZ2pZPYOmQlPCiQWg9XuTQjLNXzpNrxGYNR16hDOTatCwcEj0ao
 4T1EQ28GG7fd0Y29qar5y/6oOQjf1wd+QNJZyHI2HsZJMhQpp6ZtwBgSd
 6Z0X5wzC5geP5ieEKZUA2oUgRl+WofPrTM4f+Ezc8tj2c7eaxr00l5HBY
 /IRCZAJ1H18qE8jYjucuFBVBa0Hid+xqF2+KEVXxP6DSSjXPW+g2ABePO
 7nnp/Ecyzq4h9+ICpJytB1rKMwPaOi0HgIuqeunKvW0miWxJlfY4vHAAv g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="377622958"
X-IronPort-AV: E=Sophos;i="6.03,249,1694761200"; d="scan'208";a="377622958"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2023 00:28:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,249,1694761200"; 
   d="scan'208";a="15632"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Oct 2023 00:28:22 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 25 Oct 2023 00:28:30 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 25 Oct 2023 00:28:30 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 25 Oct 2023 00:28:30 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 25 Oct 2023 00:28:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YSNyjYzc+FFEPfkJA4ZYvXgc+aTsob4bTctt9cB5DS+fwJAA+ZtP+OG9mgrhNiC+EbvJBM7Vt9NsRFEDVBf38tAdl1wCWQoubafKbWL++LaBi46ZgKbCsOUZR1MTlzlAaj43I3TAhUtdqPnSYX7Nm+gurpUIS7pmBhmzF2Yx0lGhb8/xUqKvtsnDNDbXL/f3c47iBqzkhHX1oItbf9Y4EFjgyoMG4rNLOlsdcGmRWe/B/UPuTbJs35VQC8PPtxz3iTSaGmDxb2oW7CfHpTQKIB5p+exwRTS3P1UNqaYleFWmVQVM5Au/3ZEURt7ho4bmKpJrLK8KiEj88H4w1xGwCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u1YvquSBgw+IXV/Yn1QBuQSkrJZ7ypWOJ2njJ+nGnCg=;
 b=JZcXNjtt1JI6tf42i/Kcmn7lvbUl/9d/Eb3is28AZNejLV63YPblASrKdDADBbMHVowB2JcgFmQq2CtCZC49+KI+13+chj7654XSg89zv+cgtyK5PBTh3ZGETz7oBybg18MhM5RVUKjlSbpCiDJKqLeP2V4RFo542yFdGX6y5v9JKPbTPOIX4kTzrLnNuAZEQGh7UybnONy6G+6F6cXuMwydYyPADpYe40GFAFn7HO1ttyUOroOXdJCUtURBY2JWZGrLRUhZ1s1efQPmxx4nl4w2Yk90e/xt+1Pg+K2S6gCwG1OXUkSqRylAImRSX1xoCw3u4LfRSrp6H0vZVqBpWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 SN7PR11MB7440.namprd11.prod.outlook.com (2603:10b6:806:340::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.33; Wed, 25 Oct
 2023 07:28:24 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::ea97:f0a2:fffc:b892]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::ea97:f0a2:fffc:b892%3]) with mapi id 15.20.6907.028; Wed, 25 Oct 2023
 07:28:24 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>, "tzimmermann@suse.de"
 <tzimmermann@suse.de>, "ville.syrjala@linux.intel.com"
 <ville.syrjala@linux.intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>,
 "javierm@redhat.com" <javierm@redhat.com>, "tvrtko.ursulin@linux.intel.com"
 <tvrtko.ursulin@linux.intel.com>, "Deak, Imre" <imre.deak@intel.com>,
 "airlied@gmail.com" <airlied@gmail.com>, "jani.nikula@linux.intel.com"
 <jani.nikula@linux.intel.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>
Subject: Re: [Intel-gfx] [PATCH v5 1/7] drm/i915: Unregister in-kernel clients
Thread-Topic: [Intel-gfx] [PATCH v5 1/7] drm/i915: Unregister in-kernel clients
Thread-Index: AQHZ8S1rW7RfwiFVQU2uKCiKnjyCjLBaR08A
Date: Wed, 25 Oct 2023 07:28:23 +0000
Message-ID: <17c530ab9316a331439d02ac33f48858cfe456db.camel@intel.com>
References: <20230927102808.18650-1-tzimmermann@suse.de>
 <20230927102808.18650-2-tzimmermann@suse.de>
In-Reply-To: <20230927102808.18650-2-tzimmermann@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|SN7PR11MB7440:EE_
x-ms-office365-filtering-correlation-id: 422fb3d6-91ed-4c96-7754-08dbd52bf8f3
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qjV9/S0OkegjmPHKm+9+iZJ4k+K7Nq4euB9WmJt9H3MW0NAIrHwL+BEQ6o7yH/JOCxLaDEgh63eczu5BnbJYs15m9TlVJjD+Qk/IYADO/CyaDbxVLqM2icErSCbaTVg/36PWcUmKygUCmqat2fuUhet2fVFBITTNjB/scay3NGxJBJrSk6sRGXF6N2shj8f3FagyXeQCBzxEuV3+nDZsQdL3hWFDs2jPbgstLZk7jozjGvQexgcmeOi8rNPWOQYV02ABuYbQkueAL4pqHLziW6k1dGyd0YWgj6yHgqZrTsm7Ag1JT3L2luNhkXQnqhS8ybsc6vBNPvGTd3niC9JvAPNYSVYCxBMqMdfGSBylri4XfGGEYdoRN6yfJOsJeQar2Pz3WqoeCFtMH6oqOBGcDBzDbFdBNfZzk7SMqIeWnUf63wGAxmNE8qO0m9GFfm9W8xGsZKNfa/A+305vHnKTcBd85ULxEih/vES0b9CiH1RTuEB/LNIfzbp0kJ1+pI6393rEwJn2dLYpPnwatN2bsKZ2g/P5No1MSoImDoNDFi/24tCOY3PNf7asfSnsUtPh+SftQdMkg8V28MfhnXN3zytlKxrx4BjW3zZB7m+yo2KNcvMWt9KCMVoCj/x3Qxa9
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(366004)(396003)(136003)(39860400002)(346002)(230922051799003)(64100799003)(186009)(1800799009)(451199024)(38070700009)(921008)(71200400001)(83380400001)(8936002)(7416002)(36756003)(2906002)(26005)(66574015)(82960400001)(8676002)(2616005)(122000001)(38100700002)(4326008)(76116006)(6512007)(6506007)(316002)(478600001)(6486002)(5660300002)(66556008)(66946007)(110136005)(86362001)(54906003)(64756008)(41300700001)(66476007)(91956017)(66446008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?emJ1ZVhoMWhYeVlldGZxWEJPVFRQbVR3SGlrUVNYVmphNFFSc3JYWVRnMTZR?=
 =?utf-8?B?ckhxcG9TWTBLczV2dzJ6YXA5VFRWUG14TmdKMGhQTTZETmxTYmZlSWgvbFY2?=
 =?utf-8?B?MGM2NXZEY3d4R0FDaHVnR0ZHQ2ZoRHEzMkZKOUZwZ09rNlhySld1M3lVUjFj?=
 =?utf-8?B?Q243dUppK1hlWlNuU0d6OFpPd1BTTkZjcUk5SDJ2cTAzWlFXZjFKMTU4M2dl?=
 =?utf-8?B?dUxSanM2dzdIVWtVSU0rMVNSUjRTL0pzeFBubm94bG5rRDRDdXdiL2RPOGhP?=
 =?utf-8?B?bGR0c2ozSHYvdFlPckdsZzdmRWtKSUZyek5yV1BGK0JIemRhU3Zyak5ZRHhQ?=
 =?utf-8?B?dnJKUDRKOEkySEUvM3RIVm1rQWIvQ3JmaTZaRkdiZFhFVXhRbzlEWWhwT2Z2?=
 =?utf-8?B?eGVtZUFPUTVNNGNHZ1JaTkpZWlZVbkJIcmxZb3BRSXpWOHZrb0p2R21NNEI5?=
 =?utf-8?B?NkNORTFVaUs1bkNHNHdyMGJNeHRkNTF0dHJNeE8zZ2JEUU42WEFYSzBaWU5D?=
 =?utf-8?B?K0NjOXVyZS96MDYzNjN6UnE3Skh0YkNySE5IQ2lUMW9sTW9Ob25YV2pBVjJ6?=
 =?utf-8?B?Y1NUQjNaODYrUldzWVdGMmtCeWhzWjJkS0M5NUlNWjdKSzNwS2tKYXBXQlNp?=
 =?utf-8?B?elhtNUlKNnRONGxJVHNHU0NXdW15aVVxcStNb291WXpCL2hRMkViaVhKN0hw?=
 =?utf-8?B?NzZFZDZKWTRFSmxEZVdPUEsxd1N0Rlh4SXAzL3RTelhHeUg3bFJ1YlM3WUtW?=
 =?utf-8?B?SDJHSnViRjdhbXQ5Nm15dUlaMFpRamNTb1B0d0loZ3pON0VlaHQ4ZWxlMHJ1?=
 =?utf-8?B?dVh2azJzbVAvNnlsV3dlaXJCNS9MdElCUG54cEJQSzJRWmpmU21ybjQrUDI1?=
 =?utf-8?B?REgrZTlNOXcwYkF2cTdMZWgwSFpqekVhQnVWNHd0R1BLb0xpbC9XbUZSV2pw?=
 =?utf-8?B?SFdIWnNIMTIrRlN4R2t4ZkJsUnQxVWY2S0VQeFRYdHRiQkc1VVRvckNmdzFr?=
 =?utf-8?B?NnlxVGRMUGRGeFZUMDdzclBOTHN3MkJRZmZhckdPWlhVWis4SlJHdWVzMmx0?=
 =?utf-8?B?RFRBMWhpcnhtWWEzeE5uZzd3L1ZSWWdjQ1FkZ2pWYjJ5blR6QWo3NVVFK1RD?=
 =?utf-8?B?eXlsY3JNSkt4VTN4VS9GeStBckp5L3U4MEdQYVNHeFJMU3V6aXFrVHNITE9j?=
 =?utf-8?B?YmpWcXBPMjlrTGQ2Lzhkd1VmZ1QvSHBub3MrSTh6bkM5N1p2UVYrdE1nVGhL?=
 =?utf-8?B?R2VvU3g5MHRKNlZvMnJKeUw4bFFSQ20xd09RNi9uczRPeUZjK2RndGk0RWcy?=
 =?utf-8?B?ZjRmUHE2bHgrMVBIZUQwbXY1VFZCelVRSkdhN1BldEZFU0k1UzZNYXdOSEhx?=
 =?utf-8?B?SlQyMWNnbnBsRGlKaE4yWDViN0xGTlJrL3hKRXhpQ2xaY2k4TGtCemppSThW?=
 =?utf-8?B?cERCUlJ5ZkVJRlBtZC92TWMvVjk5bThZM3pnOXZWM0FsMWZLa3h1dmZnZThv?=
 =?utf-8?B?a3lOQ0dXWHcvUFpQclhRTnIvY0hpQmZWVjhOMjRZNnkxK1BSZzRMcmtmb2FZ?=
 =?utf-8?B?QW85ZklMYWFVb1lyd1ZQbzU3N1RlbjE2RHpONFh3bXFibjQ5alo4azZtOExU?=
 =?utf-8?B?V01XdUJJdU41b1labHZ5MXZEc1Nqa285dFlRNGtKOUhqbnE5cU9STHM5ODB2?=
 =?utf-8?B?ZFA5NmtMaDVjR0FXU1NDS1ovN0c5U3U2T0pjTHpXcDNtMW5rSXdYTEFIZE5y?=
 =?utf-8?B?TzhoRnEzSXpBcHVXbFJyZ3UzN040VklNRHNEODAyMUZnclBZbXJKV3B0Mk1q?=
 =?utf-8?B?bkpXOHZQZ0xBWEp1c1F0eitqRjFkSGhBa0d3NnR4dWVzVHM1SUs3RUtRam9s?=
 =?utf-8?B?dGhzWVh2ZzRvMlR1ZzErUU5tdVhPYkZvQitrbGZrU1EzcVBYRmV4eHVINnNH?=
 =?utf-8?B?R3FuNHV2VURQQmRscjl6T1NlOHJYS2lobE5ZWEN1MDhZenMxNFk5VVpTdEhO?=
 =?utf-8?B?VXJiZVV1Q2ZGUXlQdjl1K2k2Z0JyOWNnR1ROanV1bG1SalJCZGd3RVZtWDls?=
 =?utf-8?B?YVYzZUMrWkgwRXhpREo3NzVGdlJjRjI5RWxCQStNRCtlMWpQeEE2RW9sTjJq?=
 =?utf-8?B?TjEvSkJKSmdTWUZqYjhGMHZSTHFBUWkycEFSbE5KbGkxN3IybjVKY3hGUmxX?=
 =?utf-8?B?dFE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F0286E592A9EAB4CA0FBD3D1419692DC@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 422fb3d6-91ed-4c96-7754-08dbd52bf8f3
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Oct 2023 07:28:23.9859 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4GbDBpU3AOv/QLWj8rbX7vq9Wlz7UUaECtuMcMS1CXHOVcMj1nQZpueyFaunJ0gW1K6S0riX2Bd8MrFuksvwuTBosqlqd/dN6/CYmUt7FcE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7440
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
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAyMDIzLTA5LTI3IGF0IDEyOjI2ICswMjAwLCBUaG9tYXMgWmltbWVybWFubiB3cm90
ZToNCj4gVW5yZWdpc3RlciBhbGwgaW4ta2VybmVsIGNsaWVudHMgYmVmb3JlIHVubG9hZGluZyB0
aGUgaTkxNSBkcml2ZXIuDQo+IEZvcg0KPiBvdGhlciBkcml2ZXJzLCBkcm1fZGV2X3VucmVnaXN0
ZXIoKSBkb2VzIHRoaXMgYXV0b21hdGljYWxseS4gQXMgaTkxNQ0KPiBkb2VzIG5vdCB1c2UgdGhp
cyBoZWxwZXIsIGl0IGhhcyB0byBwZXJmb3JtIHRoZSBjYWxsIGJ5IGl0c2VsZi4NCj4gDQo+IE5v
dGUgdGhhdCB0aGVyZSBhcmUgY3VycmVudGx5IG5vIGluLWtlcm5lbCBjbGllbnRzIGluIGk5MTUu
IFRoZSBwYXRjaA0KPiBwcmVwYXJlcyB0aGUgZHJpdmVyIGZvciBhIHJlbGF0ZWQgdXBkYXRlIG9m
IGl0cyBmYmRldiBzdXBwb3J0Lg0KDQpIaSBUaG9tYXMuIFlvdSBuZWVkIHRvIG1vdmUgcGF0Y2gg
My83IGJlZm9yZSB0aGlzIG9uZS4gT3RoZXJ3aXNlIHRoaXMNCmRvZXNuJ3QgYnVpbGQuDQoNCkJS
LA0KDQpKb3VuaSBIw7ZnYW5kZXINCg0KPiANCj4gU2lnbmVkLW9mZi1ieTogVGhvbWFzIFppbW1l
cm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+DQo+IC0tLQ0KPiDCoGRyaXZlcnMvZ3B1L2RybS9p
OTE1L2k5MTVfZHJpdmVyLmMgfCAzICsrKw0KPiDCoDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlv
bnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X2RyaXZl
ci5jDQo+IGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9kcml2ZXIuYw0KPiBpbmRleCBkNTAz
NDdlNTc3M2EzLi5kZTE5MTk3ZDJlMDUyIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
aTkxNS9pOTE1X2RyaXZlci5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfZHJp
dmVyLmMNCj4gQEAgLTQxLDYgKzQxLDcgQEANCj4gwqANCj4gwqAjaW5jbHVkZSA8ZHJtL2RybV9h
cGVydHVyZS5oPg0KPiDCoCNpbmNsdWRlIDxkcm0vZHJtX2F0b21pY19oZWxwZXIuaD4NCj4gKyNp
bmNsdWRlIDxkcm0vZHJtX2NsaWVudC5oPg0KPiDCoCNpbmNsdWRlIDxkcm0vZHJtX2lvY3RsLmg+
DQo+IMKgI2luY2x1ZGUgPGRybS9kcm1fbWFuYWdlZC5oPg0KPiDCoCNpbmNsdWRlIDxkcm0vZHJt
X3Byb2JlX2hlbHBlci5oPg0KPiBAQCAtODU1LDYgKzg1Niw4IEBAIHZvaWQgaTkxNV9kcml2ZXJf
cmVtb3ZlKHN0cnVjdCBkcm1faTkxNV9wcml2YXRlDQo+ICppOTE1KQ0KPiDCoHsNCj4gwqDCoMKg
wqDCoMKgwqDCoGludGVsX3dha2VyZWZfdCB3YWtlcmVmOw0KPiDCoA0KPiArwqDCoMKgwqDCoMKg
wqBkcm1fY2xpZW50X2Rldl91bnJlZ2lzdGVyKCZpOTE1LT5kcm0pOw0KPiArDQo+IMKgwqDCoMKg
wqDCoMKgwqB3YWtlcmVmID0gaW50ZWxfcnVudGltZV9wbV9nZXQoJmk5MTUtPnJ1bnRpbWVfcG0p
Ow0KPiDCoA0KPiDCoMKgwqDCoMKgwqDCoMKgaTkxNV9kcml2ZXJfdW5yZWdpc3RlcihpOTE1KTsN
Cg0K
