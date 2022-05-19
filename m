Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8247652D5BA
	for <lists+dri-devel@lfdr.de>; Thu, 19 May 2022 16:16:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4176A10EB58;
	Thu, 19 May 2022 14:16:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DD1D10EB58;
 Thu, 19 May 2022 14:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652969763; x=1684505763;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=sAhVQHrPDyjB2ow8CBU3PMazDWEf25oCuYjKF6HdM1w=;
 b=nOWhX/JhtODomV7MMcBJsTDgs3dI4GPk/69zTA2tml9LoGkMcX4uO2BL
 +YQcGI1nzWeLxKE9i2qLPOnHqasxnqO5PYuZvGqe8eqO85GLOTu3AG2LZ
 f28GstQJphk0OCngdbWaILWG7Ebgz10gEM8G/VcmeFM7NShg62ekpbq5R
 DQhNVehWMOFr7/mER1Q7HvXAZNY71p+/EwHIeLIPkR+f6+2DzmDSmc/b9
 rl2uHL4glQP/N+nQVyi0T+KN0Pfagtd1I+Se2zqaNewYxd+klM+HhzZVy
 uOQX/wNMxlgbiApXl4Os+tlYXCEGhGxsQEXOCgkEc0xETcHndmVRSylb8 g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10352"; a="272180693"
X-IronPort-AV: E=Sophos;i="5.91,237,1647327600"; d="scan'208";a="272180693"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2022 07:16:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,237,1647327600"; d="scan'208";a="898782202"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by fmsmga005.fm.intel.com with ESMTP; 19 May 2022 07:16:01 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 19 May 2022 07:16:01 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Thu, 19 May 2022 07:16:01 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Thu, 19 May 2022 07:16:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jnR0Aw3EsMStJtuTH/KT2VWQSwb2695y9MMIKBB0GWXz7t3I8QzlRnHOLu8uBJmP/bAFRW23yHlvU8U5x29hhYq/9wToxV0NeAduoLGkZc0yGyJWtdB2uIeNngdd9zp9GG7JycGDQlaUsiLkf+I++JlxtNk0frztiYha3hMwf9LltMpCQQ9XxK3agVZ4yumxtCX30VmTrCuS0NjFx9SZIv/Mc9fyC3qrniwDDEhGI9SOFl2K4PqVK80UmWtzy5/TVyK3JbGMKG3tzJqVVFUSXG0GglgcApomaIK0XyQ3OWMFRNFesS6HDQi/hI3nzdA+ZlP5PsRvyyVVr3iBIDNplg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sAhVQHrPDyjB2ow8CBU3PMazDWEf25oCuYjKF6HdM1w=;
 b=eZKFBj4IA0mSMEMcTmGiPdgPXpr9Kr0T/kPvtKKnSQZy/1nRYE5FUCEFjWwz0tgZMuouCUUuwonGXi3D8iJTFfuq17X/YZQTaUC5r4vziJFoi/Lhhe1mXzaAAUJPT3zTxgsW+uP6mgIyn778lfZXxsvKWIcXrs0vrZ5SGFYXxOHVoXGM7PfmmwG+tZUTsbU2QMt4TebR+zGGUtDn7Tdb9pLgoM5ttyYxgUGsw1hRtU6uzMl5EQu054NZ34MTFdJUDyCbO7ys6X4MZWH93F7s5tYUMcL/fyHI4CYczgeTKnSbEqD6xs72H74JowuGh1yBv0hmIvu274G155ZqGSbHbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM5PR11MB1324.namprd11.prod.outlook.com (2603:10b6:3:15::14) by
 BYAPR11MB3480.namprd11.prod.outlook.com (2603:10b6:a03:79::27) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5250.18; Thu, 19 May 2022 14:15:54 +0000
Received: from DM5PR11MB1324.namprd11.prod.outlook.com
 ([fe80::2df3:4862:e431:2f20]) by DM5PR11MB1324.namprd11.prod.outlook.com
 ([fe80::2df3:4862:e431:2f20%5]) with mapi id 15.20.5250.020; Thu, 19 May 2022
 14:15:54 +0000
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <ckoenig.leichtzumerken@gmail.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 09/11] drm/ttm: audit bo->resource usage
Thread-Topic: [PATCH 09/11] drm/ttm: audit bo->resource usage
Thread-Index: AQHYa2aVqSO0ePN1+EyRUYzEGvyXQq0l9jsAgABIZpA=
Date: Thu, 19 May 2022 14:15:54 +0000
Message-ID: <DM5PR11MB1324B6CC2A401FDE291EDFD7C1D09@DM5PR11MB1324.namprd11.prod.outlook.com>
References: <20220519095508.115203-1-christian.koenig@amd.com>
 <20220519095508.115203-10-christian.koenig@amd.com>
In-Reply-To: <20220519095508.115203-10-christian.koenig@amd.com>
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
x-ms-office365-filtering-correlation-id: 2ff64908-4ced-42d2-d4f3-08da39a215f6
x-ms-traffictypediagnostic: BYAPR11MB3480:EE_
x-microsoft-antispam-prvs: <BYAPR11MB34804870AA2D6DB442EECEE2C1D09@BYAPR11MB3480.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bXdFUNvdZ970SmRL7sG+tDZhsvkg1/CwcANad72WTd/CX2LRFQX395PZH/EZPxlvH2nWyz2x+YK0S7YBpQXbkHGX1mGIeUVN0mxFRDq0JJ++WmQe5URPlAD9TEsE7T+M16i18frQYxMHniva/UXUPQFk92bA6A8xRvZ/4I5E+DKk+njrzRPO+1FIYXdhuOHHGmoa9kksYMfd7nGXKaX4MopZXQ4xkRS2HKSeMsHPg8eimn5zwecorTndhO80ishj9zHXEnypDc9+I1gqRx06IAiT/k/XL6bl2kt6D931g+YYuc+uArVCju/HcoBDHb6uH0ljGt3s/lK4tPdqhaPdqsB38zCrqVj6P3zMloe0UI+p2+gF+d6jyS11wipfY91Y5FcJdZRBRhyxdLNg+ORhEvqrs8M0hQ9OHBomEZ/OiJNcfJ22cPCClm0QYA5U84Eo96gWV3yUhekDGamTHR+t1M4vF928aucNW7qMhx+0Vgq+S5wRzGc+MvbW/qB1Qc/RABFj2AegqZK1Yf6r47oA1m06uv4xBJtLEhQJ14+qdz3NEpYcSTNwutt84+7uqVM8PbI4iKyOWWR6h6EoyMyS5rPB3VAfwkFuQzMZdYb++bXJkVXMzCLPsr7PZatifP9OjZYGBOR0b6Vy9w5MLzpN0t8vyQY7de5h6lyo5BPRidYVRhUeXK6I4gEfSxXXbIZv2UmbMgZxf9uDcf/3Ld9RjA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR11MB1324.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(508600001)(66574015)(71200400001)(110136005)(7696005)(316002)(8936002)(6506007)(26005)(9686003)(83380400001)(86362001)(38070700005)(54906003)(122000001)(38100700002)(66446008)(52536014)(64756008)(66556008)(66476007)(76116006)(66946007)(55016003)(33656002)(8676002)(82960400001)(2906002)(5660300002)(186003)(4326008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?U1RUVU9tVkJEWXBWRVZoUExyNTk5bUhiV3ZFb3lMNzhWM21nM21uSW10RS9w?=
 =?utf-8?B?V0x0ZVZoMUdON1FvTklOTEYzLzl1TTR3eGZ2R0grMXZpdGs0QWkvZ09tQlpG?=
 =?utf-8?B?bEQxcnprMzJRL1h5N25LdTIvWTZFK2xBd3krK3hCU0dzNDJrWXhzZEZmK0Jl?=
 =?utf-8?B?aEJGNnl2bVIyQlZ3d25hNmxERk1MaC9iQUpKUEFwcEM4aFNqbUpCNnZFZXoy?=
 =?utf-8?B?K0pJaGMxcWRCQzVIRGZsYnY4cHgrcm5FZW5UdDVjUzcyZDZRckNVOU4wRUxN?=
 =?utf-8?B?dzhERFNjcUV4ZTlQQVJOQVVNY1o1T3N4OGxtdGxQdUhmZDJZZHQ2WmxwdXZN?=
 =?utf-8?B?bU9PTmxKQnJsZUl3Z2tsN1Nka2c2dzBnQWl6Y3JlNnp4SzlVNUkrb2IwTlhW?=
 =?utf-8?B?MndEVGFqZVFsTk1FeTVTQ0lLcVFjNFhYMER1anlscy9rdkpkTlp0MXExcnJq?=
 =?utf-8?B?TUtyNnp3dnFMQVNmR1VjZGtLTGlkQ0U3a3kxZmFJRWRrUzBiaXhhUVBISFlI?=
 =?utf-8?B?ZUhDY1l2amk1ZU14K2ZPU25DM1BPLzdUbDVSbXlOMUs3K2pPU0RML0U1dDJU?=
 =?utf-8?B?em5xMUJxa0c4dnBuTEFxZkNQdUMyMU1oUVpMT3AvbklOTVlsRGdLTXVRb0tO?=
 =?utf-8?B?dlFwR1orSTBHVEgwcTlxUGZYMGw1YjJVTU01dVBucXJjMit2YVpOU012YkIv?=
 =?utf-8?B?a2RkWG52dkNXV2Jtb0FzUXlhVVMwSklCY1Uva2xFRG4wejhBNFFBcUE1b3JR?=
 =?utf-8?B?Y0ZnZUxXbjdUamZoVDlRdnc4V252SDJaUStBa3RSeHJUWTlxVlBwdlFsN0V6?=
 =?utf-8?B?TU5VYVFWVjhYcXpwTXcxUnUxT2IxYk91dS9RK0hSTzFtM2pDQXl0MVRWR2Nh?=
 =?utf-8?B?dXBWcityWDRXUGJScGlBMVpBZWhIcmp3a1RjTzg5dXRaQk1wdWVjdVJpK2o2?=
 =?utf-8?B?M1JXdHVXUzZ2YWNPWXZoWEU3dzVEanp6NmtzWkdKbjViQ2prVGRrZDExWHlr?=
 =?utf-8?B?R3hvYlFwRVNZdzJhUVZtQ1NkRExFbjNkRG1zTVg3RFBwbWtkdkp4UzJPbVNZ?=
 =?utf-8?B?QlNVQS9hK0VFV1R3K2lPakUzWkNPN2h0NnpibDhUZFVNaHNUVGVITk5HZnBv?=
 =?utf-8?B?UGRqTGJ0MkcvZG03am41eGJqQ1NCWlh3bWNiYlllRVNaRnpGcE4yUU5UQWFG?=
 =?utf-8?B?MnpxREpqLzZIWitjbGZyeWJ3V3VubkN6S1RQUklKRUg0akV0Z0Y3VjdMYTdQ?=
 =?utf-8?B?VFJFdFFROVZYKzBmN1JPWWhMS2QwNXdncXNkMVBxRnFxVVkyU1ZkSWVMOEc2?=
 =?utf-8?B?cStzcm5DZm52STlsRVZDZFR4THo2QjIzajBaVnRMeFdmQVJKUEt5VittTThl?=
 =?utf-8?B?eWxpK3YrTGVzZkFvend6aXR0V3p4ejRoWXNxbU8wSFJLSmhJenY1Umw4QVlU?=
 =?utf-8?B?eWo3eDhRT2tKUDVaSnRvUkp4dVI2L0ZsMGFDOUVzKzRPUVVUdFk1YURicmlo?=
 =?utf-8?B?M3NwOVNLb1RObHpTV1R6MVpHcVlMdU1KUk9CM3hDMEtJaGo5bnd0ZnB1UjZv?=
 =?utf-8?B?UTVZVGQwU1QvL2p2Tkd6emViZVpWUFBwbUlYb2NHZzYxejFiejlXR2JpZTlu?=
 =?utf-8?B?ZW13MUZ4QTVRNmcvMlYrckRSbmg5VWVLVDhQZnZFdUJ4azNhbnJkMFNQaDhG?=
 =?utf-8?B?ck5ub3RWMTZicDFKK2pGdnh3dksxN1NHZG9PUXVZQUM3cDRvUjJiWmh5M2VL?=
 =?utf-8?B?N1ByTkhKWjY3QVd4dXRXWTZvWlBFOEl2RU9ENzFYY2JMMGU2QWF5anJ1ZzA3?=
 =?utf-8?B?cEZKTzdKa3ZtZ2ZrMjZsSGt6OTIwRjRKQWtnRHFrZTVpLzhOVlNkVWZ1cGhR?=
 =?utf-8?B?REZmZGsvUU5HUFlGVnhONEsvYU1valpFa3ZPSmlCVklwS1BaVGMwRHBRbVFo?=
 =?utf-8?B?WVZFd0doRnpkT2V1TmxnTHIwQ0RzUXRXdWJ3S3BEK1ArK2RUNCtFZ3grWWFG?=
 =?utf-8?B?d0NCNDIvQXNLNVNiUTloRWZhUzJ4K1RnblFYcE1FaFByTzdmNjlKSU5WVDFp?=
 =?utf-8?B?OW0zWFk0d1RUM0cyN2JzNldWbGs3a0QxbUhIT3JuMGEwSDR6RzhUREdzcnUx?=
 =?utf-8?B?c3NGeHBxZkJBUWdrRDh0a1ExSTZtVmNJazh3SEpYWVdOQmJQRDVMNlRNK000?=
 =?utf-8?B?SmY1NjNBV2tldzZXdHZ4V1pMRlNwWEJRN2Z0cG03Y0lIZnV3bmM0OFVHVkQ2?=
 =?utf-8?B?aXpqV0xTU0F4c0VPbHpLaFhWVDZDcHliVzhhdDFzR0ZlLzUwRWxYOXB3ak1o?=
 =?utf-8?B?clpVZG1BdDlWWlF3Tk96aXRNVGpkVCtGR1RMbzlyemN2Z3JDTUZxYUE5UkdH?=
 =?utf-8?Q?YlJeRyCGSd/KIiVg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB1324.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ff64908-4ced-42d2-d4f3-08da39a215f6
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 May 2022 14:15:54.2017 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OUi1vMJJ+VEi+JgCBx43lSRcPXGmCexH5SWlJKZ5uPmIeGJrU/Sk7i0AAf8xTNBBGVLRssYkYpnWgoWsdGYauU4/6Tv6H2ymm/MJnDIpNMA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3480
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
Cc: "matthew.william.auld@gmail.com" <matthew.william.auld@gmail.com>,
 =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <christian.koenig@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Pi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+RnJvbTogZHJpLWRldmVsIDxkcmktZGV2ZWwt
Ym91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBPZg0KPkNocmlzdGlhbiBL
w7ZuaWcNCj5TZW50OiBUaHVyc2RheSwgTWF5IDE5LCAyMDIyIDU6NTUgQU0NCj5UbzogaW50ZWwt
Z2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPkNjOiBtYXR0aGV3LndpbGxpYW0uYXVsZEBnbWFp
bC5jb207IENocmlzdGlhbiBLw7ZuaWcNCj48Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPjsgZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPlN1YmplY3Q6IFtQQVRDSCAwOS8xMV0gZHJt
L3R0bTogYXVkaXQgYm8tPnJlc291cmNlIHVzYWdlDQo+DQo+QWxsb3cgQk9zIHRvIGV4aXN0IHdp
dGhvdXQgYmFja2luZyBzdG9yZS4NCg0KVG9vayBtZSBhIHdoaWxlIHRvIGZpZ3VyZSBvdXQgdGhh
dCBvbmx5IHRoZSBsYXN0IGxpbmUgaXMgcmVsYXRlZCB0byB0aGlzIGNvbW1pdA0KbWVzc2FnZS4N
Cg0KQ291bGQgeW91IGFkZCBzb21ldGhpbmcgbGlrZToNCg0KUmVmYWN0b3IgdXNhZ2UgaW5mb3Jt
YXRpb24uDQoNCkFsbG93IEJPcyB0byBleGlzdCB3aXRob3V0IGJhY2tpbmcgc3RvcmUuDQoNCj8N
Cg0KV291bGQgbWFrZSB0aGlzIHBhdGNoIGEgbGl0dGxlIGVhc2llciB0byBkZWNpcGhlci4NCg0K
TQ0KDQo+U2lnbmVkLW9mZi1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0Bh
bWQuY29tPg0KPi0tLQ0KPiBkcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jIHwgMTYgKysrKysr
KystLS0tLS0tLQ0KPiAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9u
cygtKQ0KPg0KPmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jIGIvZHJp
dmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYw0KPmluZGV4IDJiMDFjYjMwNjk0YS4uYTU1NTY0Yzhi
NTdjIDEwMDY0NA0KPi0tLSBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMNCj4rKysgYi9k
cml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jDQo+QEAgLTExNywxMiArMTE3LDEzIEBAIHN0YXRp
YyBpbnQgdHRtX2JvX2hhbmRsZV9tb3ZlX21lbShzdHJ1Y3QNCj50dG1fYnVmZmVyX29iamVjdCAq
Ym8sDQo+IAkJCQkgIHN0cnVjdCB0dG1fb3BlcmF0aW9uX2N0eCAqY3R4LA0KPiAJCQkJICBzdHJ1
Y3QgdHRtX3BsYWNlICpob3ApDQo+IHsNCj4tCXN0cnVjdCB0dG1fcmVzb3VyY2VfbWFuYWdlciAq
b2xkX21hbiwgKm5ld19tYW47DQo+IAlzdHJ1Y3QgdHRtX2RldmljZSAqYmRldiA9IGJvLT5iZGV2
Ow0KPisJYm9vbCBvbGRfdXNlX3R0LCBuZXdfdXNlX3R0Ow0KPiAJaW50IHJldDsNCj4NCj4tCW9s
ZF9tYW4gPSB0dG1fbWFuYWdlcl90eXBlKGJkZXYsIGJvLT5yZXNvdXJjZS0+bWVtX3R5cGUpOw0K
Pi0JbmV3X21hbiA9IHR0bV9tYW5hZ2VyX3R5cGUoYmRldiwgbWVtLT5tZW1fdHlwZSk7DQo+Kwlv
bGRfdXNlX3R0ID0gYm8tPnJlc291cmNlICYmDQo+KwkJdHRtX21hbmFnZXJfdHlwZShiZGV2LCBi
by0+cmVzb3VyY2UtPm1lbV90eXBlKS0NCj4+dXNlX3R0Ow0KPisJbmV3X3VzZV90dCA9IHR0bV9t
YW5hZ2VyX3R5cGUoYmRldiwgbWVtLT5tZW1fdHlwZSktPnVzZV90dDsNCj4NCj4gCXR0bV9ib191
bm1hcF92aXJ0dWFsKGJvKTsNCj4NCj5AQCAtMTMwLDExICsxMzEsMTEgQEAgc3RhdGljIGludCB0
dG1fYm9faGFuZGxlX21vdmVfbWVtKHN0cnVjdA0KPnR0bV9idWZmZXJfb2JqZWN0ICpibywNCj4g
CSAqIENyZWF0ZSBhbmQgYmluZCBhIHR0bSBpZiByZXF1aXJlZC4NCj4gCSAqLw0KPg0KPi0JaWYg
KG5ld19tYW4tPnVzZV90dCkgew0KPisJaWYgKG5ld191c2VfdHQpIHsNCj4gCQkvKiBaZXJvIGlu
aXQgdGhlIG5ldyBUVE0gc3RydWN0dXJlIGlmIHRoZSBvbGQgbG9jYXRpb24gc2hvdWxkDQo+IAkJ
ICogaGF2ZSB1c2VkIG9uZSBhcyB3ZWxsLg0KPiAJCSAqLw0KPi0JCXJldCA9IHR0bV90dF9jcmVh
dGUoYm8sIG9sZF9tYW4tPnVzZV90dCk7DQo+KwkJcmV0ID0gdHRtX3R0X2NyZWF0ZShibywgb2xk
X3VzZV90dCk7DQo+IAkJaWYgKHJldCkNCj4gCQkJZ290byBvdXRfZXJyOw0KPg0KPkBAIC0xNjAs
OCArMTYxLDcgQEAgc3RhdGljIGludCB0dG1fYm9faGFuZGxlX21vdmVfbWVtKHN0cnVjdA0KPnR0
bV9idWZmZXJfb2JqZWN0ICpibywNCj4gCXJldHVybiAwOw0KPg0KPiBvdXRfZXJyOg0KPi0JbmV3
X21hbiA9IHR0bV9tYW5hZ2VyX3R5cGUoYmRldiwgYm8tPnJlc291cmNlLT5tZW1fdHlwZSk7DQo+
LQlpZiAoIW5ld19tYW4tPnVzZV90dCkNCj4rCWlmICghb2xkX3VzZV90dCkNCj4gCQl0dG1fYm9f
dHRfZGVzdHJveShibyk7DQo+DQo+IAlyZXR1cm4gcmV0Ow0KPkBAIC04OTgsNyArODk4LDcgQEAg
aW50IHR0bV9ib192YWxpZGF0ZShzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvLA0KPiAJLyoN
Cj4gCSAqIENoZWNrIHdoZXRoZXIgd2UgbmVlZCB0byBtb3ZlIGJ1ZmZlci4NCj4gCSAqLw0KPi0J
aWYgKCF0dG1fcmVzb3VyY2VfY29tcGF0KGJvLT5yZXNvdXJjZSwgcGxhY2VtZW50KSkgew0KPisJ
aWYgKCFiby0+cmVzb3VyY2UgfHwgIXR0bV9yZXNvdXJjZV9jb21wYXQoYm8tPnJlc291cmNlLA0K
PnBsYWNlbWVudCkpIHsNCj4gCQlyZXQgPSB0dG1fYm9fbW92ZV9idWZmZXIoYm8sIHBsYWNlbWVu
dCwgY3R4KTsNCj4gCQlpZiAocmV0KQ0KPiAJCQlyZXR1cm4gcmV0Ow0KPi0tDQo+Mi4yNS4xDQoN
Cg==
