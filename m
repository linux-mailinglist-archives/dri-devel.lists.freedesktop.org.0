Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 51C59565CFE
	for <lists+dri-devel@lfdr.de>; Mon,  4 Jul 2022 19:33:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B550A53E8;
	Mon,  4 Jul 2022 17:30:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 574A110F5D8;
 Mon,  4 Jul 2022 17:05:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1656954344; x=1688490344;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=8R8KakxmgIhEdt6ys+4sjHKhm3TdFq+wVkiEW7gRTss=;
 b=JmMLTnVtWWznxuRNzK0yRkntpVdEWfyHTv1G38Aes/8wYNvVRrr3Pyzs
 ahpSPKz8jPS2re1HEDY20SoE+0dQ9KKmdXVeqJeiss4TsvaJtua3Xt22I
 n6k4WapH7ckUzvNnqrq072jbl5FyjlbX6qCkfdoCofp6WA7uZUd7mKEKC
 qndTJLrJbDiubpeSLeNNI119OWbYGXp7Ty07+IJSWuiGoyNM9xXXC9jfV
 x615XMqOjzOo66Ess4Et/hBEDg1Wkg9uIRdP8l7r1tMaP01LMjVaKQy5L
 lDBP+lEwInDA4/e50J79NOz7y79GohIbCuT9mKD9nqtCK90ULtU0vYDtV g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10398"; a="262962745"
X-IronPort-AV: E=Sophos;i="5.92,243,1650956400"; d="scan'208";a="262962745"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2022 10:05:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,243,1650956400"; d="scan'208";a="592617639"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga002.jf.intel.com with ESMTP; 04 Jul 2022 10:05:41 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 4 Jul 2022 10:05:41 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Mon, 4 Jul 2022 10:05:41 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Mon, 4 Jul 2022 10:05:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gIP1iNQo+jBAKv+nzSqqWBPtp/V530OC7Bw3pPPr2JhcfNpfZlhQosdHipR4reyXJKA6SnFK2ygSZim0KdMNSThyd87dZHCv4/UHqMahQLpce8/Tga9sMVfjx1EyKQY/Gi94xBfuOovZlAYev2aFUOzJx8nVRXQY/WXOAgx3nDXQxeyqxyl4Sa/ie7MgX9p4aVsKWSnUINJ94B144HRJCCDp+sOoCqTiUtk1+xW2aFFJLnIG9hnBpWIkIFUCtIXxq+zrsybvohtbehX+QJrf3/wOHHSo2nol1gMWa0OGJPdB2nlyjbHnUzIw19LWtlGQN3EghW2SbvbNTOmu6085Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a03kgjrPXmTbAhFVBSiw+97PPkkjWZ2iFKzX2fVkdzc=;
 b=TyLPvHclvwSO3WZhFHFlgTj6vBe5A4jeo/Cye+ABpwiwmRog/ki+1h9panky/sg7xeRbNofO3rAyQhJrdNzAOCMTUMASEARivNAQzS+NF4zSQqs459cnwAT/6dB/RypoUQn7xKGfhrw8PyVgrMLJqk+xjeOABVYYaHSt/ebokAr08BK7aYb+JPXxPskK0egYvpHucQnSSjeC1eNmZgToHbbDJvO31I8jdQiBsLtB2NZYw1RWmfOG/32kiXN2BuwmqYK2dmChMOfVALZf6SDQ9BRqgunMBy8H7Ner3Fv5sbkqTNP4RZ/SeL/y9R0yR6HFU2pyWEWcOfL4bfwNPAGF8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN6PR11MB1633.namprd11.prod.outlook.com (2603:10b6:405:e::22)
 by IA1PR11MB6193.namprd11.prod.outlook.com (2603:10b6:208:3eb::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.19; Mon, 4 Jul
 2022 17:05:39 +0000
Received: from BN6PR11MB1633.namprd11.prod.outlook.com
 ([fe80::d04:1ded:6b5d:9257]) by BN6PR11MB1633.namprd11.prod.outlook.com
 ([fe80::d04:1ded:6b5d:9257%6]) with mapi id 15.20.5395.021; Mon, 4 Jul 2022
 17:05:39 +0000
From: "Zeng, Oak" <oak.zeng@intel.com>
To: "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [Intel-gfx] [RFC 05/10] drm/i915/vm_bind: Handle persistent vmas
Thread-Topic: [Intel-gfx] [RFC 05/10] drm/i915/vm_bind: Handle persistent vmas
Thread-Index: AQHYjZ0p/V5V/Y02PEebNFngFsxlHK1udPYw
Date: Mon, 4 Jul 2022 17:05:38 +0000
Message-ID: <BN6PR11MB1633C9D1751468194FAD212F92BE9@BN6PR11MB1633.namprd11.prod.outlook.com>
References: <20220701225055.8204-1-niranjana.vishwanathapura@intel.com>
 <20220701225055.8204-6-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20220701225055.8204-6-niranjana.vishwanathapura@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.6.500.17
dlp-reaction: no-action
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e4b1f0f5-eef7-482c-159e-08da5ddf6b87
x-ms-traffictypediagnostic: IA1PR11MB6193:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: dIiS6W8RvFOuZYaGaivvEJyH5Q/bDiaAKjhR0uj3iw39ZacOT5GBjon4nNGqJGxu4/LmnEKUvfvRPUL2ZRTNi2r7GF/e/ZnQbT9DovbeA9qkxmSiL1yfR2Q7fZNGXiY2CI1aeV/+QvLDD80oxKYL5tRb/ebjFPozAx8xX/Qn3fD0owrJ5anWdf2u226EGQ92E1kMqAjMCFqBzg3VRdr0h8rjPDbnMFDVtGqXeViROv/KVis0iYd59wcD/ApQEkYZ18V+ClmjuZ5L9ndsvnBCucI5opbtoqAb3O1AqRnXbXX32aLbqQnMtC/0AgE5+dB/+qJaOSINKniN2e6kedx4j1UZqt7zi5jmIXNekJSqoC8qJXtJJmqSrQF6B45jLxPwiE4zaN7qVey6cdkfLl4wcy/1ez+eGmM8R8YOBVQkXqJQgBhj1seoRSMPM2OPFBSOCONBArOEMpJ3rzkqlyI8ep3t4hQfolbwEvL5TMbJMLcCk13v5OY2v5/0HTP7bAGxC3NMOzqc7CHjPTM7vznZoGSbU+co9DRP2m6Rv8BG93sqoopq8x6g4Avf/YFcEgGpQZTo7tbx6r+yc4UEXsQTAuFnHAjd80lxs3P0rJiErNLYS1HYXMS23kuugqGo6K+m2jSJtCJrWMs2L3SSMjcIUg7ZGhd4eF2MRKNNJiOSQKyI1H1BZbEsfg1Zzio2hcD+mpn4706UY1J/faCsrdpgYGcSesdeXKVNWaQNncZzVDx0sQwE9cHcIdKaCLM+C2ZvSbzRr/VNO1kaSktM+/ZmcD1334aFcTpYPQNvrmQO9JGT9sEDOJu1AwNH5bMeLYbH
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN6PR11MB1633.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(136003)(366004)(396003)(376002)(346002)(39860400002)(4326008)(478600001)(30864003)(5660300002)(52536014)(66946007)(110136005)(122000001)(82960400001)(54906003)(38070700005)(8936002)(76116006)(316002)(86362001)(8676002)(71200400001)(33656002)(66556008)(64756008)(66476007)(66446008)(6506007)(26005)(83380400001)(9686003)(186003)(41300700001)(38100700002)(7696005)(2906002)(53546011)(55016003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?WR2mhX3iDmdaCLO4a2gdFKVmb2xN7oAFO0LGB0VjP6tLUFxGZbzKmq6iZkZa?=
 =?us-ascii?Q?G4Dv7W8lDEXoJTcwQmvwVc+korE9LMU1RdnJjneK3pV3ULztHddvUCxINxWE?=
 =?us-ascii?Q?Wm1PXyO4m5lY3bbjqDce/wCXIrZJd/9QEBP12V4wzaPQ5+TYYmnDZK4RsWbC?=
 =?us-ascii?Q?FWUfSfBiTuKYtDpUynkouAvcnwe3gmUzOFs69JKmX9ba4Omb9caRXceMarjv?=
 =?us-ascii?Q?TjdUKcWaKmmOpjqseD0lQnJWOegIlrNawTQPF/JDusJPRZr9oJMMZX+Tea4L?=
 =?us-ascii?Q?KMOzZSw34v/S08SpXG4Ks74XJz15Mq2tuPt6u0i++8oS3dWZ8tpOWrMwAaoR?=
 =?us-ascii?Q?Rxqucjj9/rstbEVzYk7oyYuKPp/YSKGhDu95h9GtUZngvppH/E5kdOKdAbsO?=
 =?us-ascii?Q?tzeKSCOzPw9JmrYFmubgQvHpDVUl3K5kzdP+0Ip/uKELzcVifuN34OvA722A?=
 =?us-ascii?Q?Y+eBQ6q9cjj6WmOByhgAVtf6eNdr+wiJzYlzX9dK7FIse1kHY4bBZL9ISb/7?=
 =?us-ascii?Q?135ejDk6DdXuss3kEsRDO70GRVsgd62G4ZQNbmTwGrFJuA1sNGRQzOIScBKv?=
 =?us-ascii?Q?kSo5bOXJjlXpe8YStX3o9ocHEs7xtdJT5AVP6FTcomGskm1k8oQSBry2a7WI?=
 =?us-ascii?Q?F5YS3dBaFlpgGCLgjTjhcdfZnCBgUCz4aLm03mkQpAf7F3WoZ8aVLIJypAMD?=
 =?us-ascii?Q?kiNqBCTGBMFDKns6N/XlnlQGaYAQ5CYqpcfhsn1BaA0ACus7Ndl8BE7YIZeo?=
 =?us-ascii?Q?U8AeVjf24US0FjoSK/fRLD2bLXSiQomOIYh5/epYIU/+toieSMBDYllanzRX?=
 =?us-ascii?Q?Y0mEvdo1vvA9iCxvu22CxiO8RwYgxszxgTBZEXcuiwMqgtu5Kmf9v/5/GHu5?=
 =?us-ascii?Q?2pHWQqa4KIKowjRPAR0ehrgDyzthrS3PuophEdHKi7KV/A5lmKl2YV2Sc/Mu?=
 =?us-ascii?Q?io3n0jVYhOHUxQJE1JPSnhqW0qZB7h4GI2mDttmXwKK+9ty1PkNPfxdMhjuj?=
 =?us-ascii?Q?JpnqueQSRcRTjLK2D7ZjIHSmVlv1q8huQUeeGg7BMzVjAoiq3a4hW+q6jF2q?=
 =?us-ascii?Q?AcDWiX7VSDk3TJ1KOc6hrFx1OX3lJhw7EQ5t0cSrSCfrUrsJ13ODt0A6BA/4?=
 =?us-ascii?Q?9owwQ1jfOmTk3+4SDRDKzwi7XogLnglllaDXX9k3qEiNeoBn1g0JpuG+BC1r?=
 =?us-ascii?Q?WBkddJz62ENTQvFKFx1URy6ZoNcezWMSi8qgT+HoZC4WcJFKzvDUWyy3M35C?=
 =?us-ascii?Q?GtjGyk1xvv4iKZR6n6ZciPSNokZu239pIzK86UjplxSWZGqJkoJjZTY615rv?=
 =?us-ascii?Q?IROL8jHl+wN9/VNoYeOw3/3VQ9OXU1mqQ+b9fYCjNRmwWzX3lCsmqOhsL/jS?=
 =?us-ascii?Q?usPB4Px0RTIFgR+InUld5Kcq8i+/IsSi7nl86G4BmFkdCYDIJZ2DKBPV6MYJ?=
 =?us-ascii?Q?F5P2mpDkxaRkNdzTkKBA0y2vUyds/So0RsqAgVdlJZdZr3yJYZHNaiihEF59?=
 =?us-ascii?Q?s/oeA75fbC55WjTMq0TTBtaAhDZTy4MXqI8LZBqGRtEXGpYDn0kiYN0mL70Z?=
 =?us-ascii?Q?d4J3Cn//x0hyOa023BJd+lYyzPbC7h9L+LmBpNSL?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB1633.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4b1f0f5-eef7-482c-159e-08da5ddf6b87
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jul 2022 17:05:38.9139 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CusaQTf46nvsSWr0qVC7Bm0UDo8mhYyHKe+8g4o69mPixonsiUydKACpub7SaBJ5jFRW1Rx16CZyPSFd8O/3Uw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6193
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
Cc: "Vetter, Daniel" <daniel.vetter@intel.com>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>, "Hellstrom,
 Thomas" <thomas.hellstrom@intel.com>, "Zanoni,
 Paulo R" <paulo.r.zanoni@intel.com>, "Auld, Matthew" <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Thanks,
Oak

> -----Original Message-----
> From: Intel-gfx <intel-gfx-bounces@lists.freedesktop.org> On Behalf Of
> Niranjana Vishwanathapura
> Sent: July 1, 2022 6:51 PM
> To: intel-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org
> Cc: Zanoni, Paulo R <paulo.r.zanoni@intel.com>; Hellstrom, Thomas
> <thomas.hellstrom@intel.com>; Auld, Matthew <matthew.auld@intel.com>;
> Vetter, Daniel <daniel.vetter@intel.com>; christian.koenig@amd.com
> Subject: [Intel-gfx] [RFC 05/10] drm/i915/vm_bind: Handle persistent vmas
>=20
> Treat VM_BIND vmas as persistent and handle them during the request
> submission in the execbuff path.

Hi Niranjana,

Is the meaning of "persistent" above persistent across all the subsequent e=
xecbuf ioctls?

Thanks,
Oak=20

>=20
> Support eviction by maintaining a list of evicted persistent vmas for reb=
inding
> during next submission.
>=20
> Signed-off-by: Niranjana Vishwanathapura
> <niranjana.vishwanathapura@intel.com>
> ---
>  drivers/gpu/drm/i915/gem/i915_gem_object.c    |  1 +
>  drivers/gpu/drm/i915/gem/i915_gem_vm_bind.h   |  3 +
>  .../drm/i915/gem/i915_gem_vm_bind_object.c    | 12 ++-
>  drivers/gpu/drm/i915/gt/intel_gtt.c           |  2 +
>  drivers/gpu/drm/i915/gt/intel_gtt.h           |  2 +
>  drivers/gpu/drm/i915/i915_gem_gtt.h           | 22 ++++++
>  drivers/gpu/drm/i915/i915_vma.c               | 32 +++++++-
>  drivers/gpu/drm/i915/i915_vma.h               | 78 +++++++++++++++++--
>  drivers/gpu/drm/i915/i915_vma_types.h         | 23 ++++++
>  9 files changed, 163 insertions(+), 12 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c
> b/drivers/gpu/drm/i915/gem/i915_gem_object.c
> index ccec4055fde3..5121f02ba95c 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
> @@ -38,6 +38,7 @@
>  #include "i915_gem_mman.h"
>  #include "i915_gem_object.h"
>  #include "i915_gem_ttm.h"
> +#include "i915_gem_vm_bind.h"
>  #include "i915_memcpy.h"
>  #include "i915_trace.h"
>=20
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_vm_bind.h
> b/drivers/gpu/drm/i915/gem/i915_gem_vm_bind.h
> index 849bf3c1061e..eaadf5a6ab09 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_vm_bind.h
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_vm_bind.h
> @@ -6,6 +6,7 @@
>  #ifndef __I915_GEM_VM_BIND_H
>  #define __I915_GEM_VM_BIND_H
>=20
> +#include <linux/dma-resv.h>
>  #include "i915_drv.h"
>=20
>  #define assert_vm_bind_held(vm)   lockdep_assert_held(&(vm)-
> >vm_bind_lock)
> @@ -26,6 +27,8 @@ static inline void i915_gem_vm_bind_unlock(struct
> i915_address_space *vm)
>  	mutex_unlock(&vm->vm_bind_lock);
>  }
>=20
> +#define assert_vm_priv_held(vm)   assert_object_held((vm)->root_obj)
> +
>  static inline int i915_gem_vm_priv_lock(struct i915_address_space *vm,
>  					struct i915_gem_ww_ctx *ww)
>  {
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c
> b/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c
> index 96f139cc8060..1a8efa83547f 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c
> @@ -85,6 +85,13 @@ void i915_gem_vm_bind_remove(struct i915_vma
> *vma, bool release_obj)  {
>  	assert_vm_bind_held(vma->vm);
>=20
> +	spin_lock(&vma->vm->vm_rebind_lock);
> +	if (!list_empty(&vma->vm_rebind_link))
> +		list_del_init(&vma->vm_rebind_link);
> +	i915_vma_set_purged(vma);
> +	i915_vma_set_freed(vma);
> +	spin_unlock(&vma->vm->vm_rebind_lock);
> +
>  	if (!list_empty(&vma->vm_bind_link)) {
>  		list_del_init(&vma->vm_bind_link);
>  		list_del_init(&vma->non_priv_vm_bind_link);
> @@ -220,6 +227,7 @@ static struct i915_vma *vm_bind_get_vma(struct
> i915_address_space *vm,
>=20
>  	vma->start =3D va->start;
>  	vma->last =3D va->start + va->length - 1;
> +	i915_vma_set_persistent(vma);
>=20
>  	return vma;
>  }
> @@ -304,8 +312,10 @@ int i915_gem_vm_bind_obj(struct
> i915_address_space *vm,
>=20
>  	i915_vm_bind_put_fence(vma);
>  put_vma:
> -	if (ret)
> +	if (ret) {
> +		i915_vma_set_freed(vma);
>  		i915_vma_destroy(vma);
> +	}
>=20
>  	i915_gem_ww_ctx_fini(&ww);
>  unlock_vm:
> diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.c
> b/drivers/gpu/drm/i915/gt/intel_gtt.c
> index df0a8459c3c6..55d5389b2c6c 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gtt.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gtt.c
> @@ -293,6 +293,8 @@ void i915_address_space_init(struct
> i915_address_space *vm, int subclass)
>  	INIT_LIST_HEAD(&vm->non_priv_vm_bind_list);
>  	vm->root_obj =3D i915_gem_object_create_internal(vm->i915,
> PAGE_SIZE);
>  	GEM_BUG_ON(IS_ERR(vm->root_obj));
> +	INIT_LIST_HEAD(&vm->vm_rebind_list);
> +	spin_lock_init(&vm->vm_rebind_lock);
>  }
>=20
>  void *__px_vaddr(struct drm_i915_gem_object *p) diff --git
> a/drivers/gpu/drm/i915/gt/intel_gtt.h b/drivers/gpu/drm/i915/gt/intel_gtt=
.h
> index f538ce9115c9..fe5485c4a1cd 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gtt.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gtt.h
> @@ -265,6 +265,8 @@ struct i915_address_space {
>  	struct mutex vm_bind_lock;  /* Protects vm_bind lists */
>  	struct list_head vm_bind_list;
>  	struct list_head vm_bound_list;
> +	struct list_head vm_rebind_list;
> +	spinlock_t vm_rebind_lock;   /* Protects vm_rebind_list */
>  	/* va tree of persistent vmas */
>  	struct rb_root_cached va;
>  	struct list_head non_priv_vm_bind_list; diff --git
> a/drivers/gpu/drm/i915/i915_gem_gtt.h
> b/drivers/gpu/drm/i915/i915_gem_gtt.h
> index 8c2f57eb5dda..09b89d1913fc 100644
> --- a/drivers/gpu/drm/i915/i915_gem_gtt.h
> +++ b/drivers/gpu/drm/i915/i915_gem_gtt.h
> @@ -51,4 +51,26 @@ int i915_gem_gtt_insert(struct i915_address_space
> *vm,
>=20
>  #define PIN_OFFSET_MASK		I915_GTT_PAGE_MASK
>=20
> +static inline int i915_vm_sync(struct i915_address_space *vm) {
> +	int ret;
> +
> +	/* Wait for all requests under this vm to finish */
> +	ret =3D dma_resv_wait_timeout(vm->root_obj->base.resv,
> +				    DMA_RESV_USAGE_BOOKKEEP, false,
> +				    MAX_SCHEDULE_TIMEOUT);
> +	if (ret < 0)
> +		return ret;
> +	else if (ret > 0)
> +		return 0;
> +	else
> +		return -ETIMEDOUT;
> +}
> +
> +static inline bool i915_vm_is_active(const struct i915_address_space
> +*vm) {
> +	return !dma_resv_test_signaled(vm->root_obj->base.resv,
> +				       DMA_RESV_USAGE_BOOKKEEP);
> +}
> +
>  #endif
> diff --git a/drivers/gpu/drm/i915/i915_vma.c
> b/drivers/gpu/drm/i915/i915_vma.c index 6737236b7884..6adb013579be
> 100644
> --- a/drivers/gpu/drm/i915/i915_vma.c
> +++ b/drivers/gpu/drm/i915/i915_vma.c
> @@ -237,6 +237,7 @@ vma_create(struct drm_i915_gem_object *obj,
>=20
>  	INIT_LIST_HEAD(&vma->vm_bind_link);
>  	INIT_LIST_HEAD(&vma->non_priv_vm_bind_link);
> +	INIT_LIST_HEAD(&vma->vm_rebind_link);
>  	return vma;
>=20
>  err_unlock:
> @@ -1622,7 +1623,8 @@ void i915_vma_close(struct i915_vma *vma)
>  	if (atomic_dec_and_lock_irqsave(&vma->open_count,
>  					&gt->closed_lock,
>  					flags)) {
> -		__vma_close(vma, gt);
> +		if (!i915_vma_is_persistent(vma))
> +			__vma_close(vma, gt);
>  		spin_unlock_irqrestore(&gt->closed_lock, flags);
>  	}
>  }
> @@ -1647,6 +1649,13 @@ static void force_unbind(struct i915_vma *vma)
>  	if (!drm_mm_node_allocated(&vma->node))
>  		return;
>=20
> +	/*
> +	 * Mark persistent vma as purged to avoid it waiting
> +	 * for VM to be released.
> +	 */
> +	if (i915_vma_is_persistent(vma))
> +		i915_vma_set_purged(vma);
> +
>  	atomic_and(~I915_VMA_PIN_MASK, &vma->flags);
>  	WARN_ON(__i915_vma_unbind(vma));
>  	GEM_BUG_ON(drm_mm_node_allocated(&vma->node));
> @@ -1666,9 +1675,12 @@ static void release_references(struct i915_vma
> *vma, bool vm_ddestroy)
>=20
>  	spin_unlock(&obj->vma.lock);
>=20
> -	i915_gem_vm_bind_lock(vma->vm);
> -	i915_gem_vm_bind_remove(vma, true);
> -	i915_gem_vm_bind_unlock(vma->vm);
> +	if (i915_vma_is_persistent(vma) &&
> +	    !i915_vma_is_freed(vma)) {
> +		i915_gem_vm_bind_lock(vma->vm);
> +		i915_gem_vm_bind_remove(vma, true);
> +		i915_gem_vm_bind_unlock(vma->vm);
> +	}
>=20
>  	spin_lock_irq(&gt->closed_lock);
>  	__i915_vma_remove_closed(vma);
> @@ -1839,6 +1851,8 @@ int _i915_vma_move_to_active(struct i915_vma
> *vma,
>  	int err;
>=20
>  	assert_object_held(obj);
> +	if (i915_vma_is_persistent(vma))
> +		return -EINVAL;
>=20
>  	GEM_BUG_ON(!vma->pages);
>=20
> @@ -1999,6 +2013,16 @@ int __i915_vma_unbind(struct i915_vma *vma)
>  	__i915_vma_evict(vma, false);
>=20
>  	drm_mm_remove_node(&vma->node); /* pairs with
> i915_vma_release() */
> +
> +	if (i915_vma_is_persistent(vma)) {
> +		spin_lock(&vma->vm->vm_rebind_lock);
> +		if (list_empty(&vma->vm_rebind_link) &&
> +		    !i915_vma_is_purged(vma))
> +			list_add_tail(&vma->vm_rebind_link,
> +				      &vma->vm->vm_rebind_list);
> +		spin_unlock(&vma->vm->vm_rebind_lock);
> +	}
> +
>  	return 0;
>  }
>=20
> diff --git a/drivers/gpu/drm/i915/i915_vma.h
> b/drivers/gpu/drm/i915/i915_vma.h index dcb49f79ff7e..6c1369a40e03
> 100644
> --- a/drivers/gpu/drm/i915/i915_vma.h
> +++ b/drivers/gpu/drm/i915/i915_vma.h
> @@ -47,12 +47,6 @@ i915_vma_instance(struct drm_i915_gem_object *obj,
>=20
>  void i915_vma_unpin_and_release(struct i915_vma **p_vma, unsigned int
> flags);  #define I915_VMA_RELEASE_MAP BIT(0)
> -
> -static inline bool i915_vma_is_active(const struct i915_vma *vma) -{
> -	return !i915_active_is_idle(&vma->active);
> -}
> -
>  /* do not reserve memory to prevent deadlocks */  #define
> __EXEC_OBJECT_NO_RESERVE BIT(31)
>=20
> @@ -138,6 +132,48 @@ static inline u32 i915_ggtt_pin_bias(struct i915_vma
> *vma)
>  	return i915_vm_to_ggtt(vma->vm)->pin_bias;
>  }
>=20
> +static inline bool i915_vma_is_persistent(const struct i915_vma *vma) {
> +	return test_bit(I915_VMA_PERSISTENT_BIT,
> __i915_vma_flags(vma)); }
> +
> +static inline void i915_vma_set_persistent(struct i915_vma *vma) {
> +	set_bit(I915_VMA_PERSISTENT_BIT, __i915_vma_flags(vma)); }
> +
> +static inline bool i915_vma_is_purged(const struct i915_vma *vma) {
> +	return test_bit(I915_VMA_PURGED_BIT, __i915_vma_flags(vma)); }
> +
> +static inline void i915_vma_set_purged(struct i915_vma *vma) {
> +	set_bit(I915_VMA_PURGED_BIT, __i915_vma_flags(vma)); }
> +
> +static inline bool i915_vma_is_freed(const struct i915_vma *vma) {
> +	return test_bit(I915_VMA_FREED_BIT, __i915_vma_flags(vma)); }
> +
> +static inline void i915_vma_set_freed(struct i915_vma *vma) {
> +	set_bit(I915_VMA_FREED_BIT, __i915_vma_flags(vma)); }
> +
> +static inline bool i915_vma_is_active(const struct i915_vma *vma) {
> +	if (i915_vma_is_persistent(vma)) {
> +		if (i915_vma_is_purged(vma))
> +			return false;
> +
> +		return i915_vm_is_active(vma->vm);
> +	}
> +
> +	return !i915_active_is_idle(&vma->active);
> +}
> +
>  static inline struct i915_vma *i915_vma_get(struct i915_vma *vma)  {
>  	i915_gem_object_get(vma->obj);
> @@ -408,8 +444,36 @@ int i915_vma_wait_for_bind(struct i915_vma *vma);
>=20
>  static inline int i915_vma_sync(struct i915_vma *vma)  {
> +	int ret;
> +
>  	/* Wait for the asynchronous bindings and pending GPU reads */
> -	return i915_active_wait(&vma->active);
> +	ret =3D i915_active_wait(&vma->active);
> +	if (ret || !i915_vma_is_persistent(vma) ||
> i915_vma_is_purged(vma))
> +		return ret;
> +
> +	return i915_vm_sync(vma->vm);
> +}
> +
> +static inline bool i915_vma_is_bind_complete(struct i915_vma *vma) {
> +	/* Ensure vma bind is initiated */
> +	if (!i915_vma_is_bound(vma, I915_VMA_BIND_MASK))
> +		return false;
> +
> +	/* Ensure any binding started is complete */
> +	if (rcu_access_pointer(vma->active.excl.fence)) {
> +		struct dma_fence *fence;
> +
> +		rcu_read_lock();
> +		fence =3D dma_fence_get_rcu_safe(&vma->active.excl.fence);
> +		rcu_read_unlock();
> +		if (fence) {
> +			dma_fence_put(fence);
> +			return false;
> +		}
> +	}
> +
> +	return true;
>  }
>=20
>  /**
> diff --git a/drivers/gpu/drm/i915/i915_vma_types.h
> b/drivers/gpu/drm/i915/i915_vma_types.h
> index 7d830a6a0b51..405c82e1bc30 100644
> --- a/drivers/gpu/drm/i915/i915_vma_types.h
> +++ b/drivers/gpu/drm/i915/i915_vma_types.h
> @@ -264,6 +264,28 @@ struct i915_vma {
>  #define I915_VMA_SCANOUT_BIT	17
>  #define I915_VMA_SCANOUT	((int)BIT(I915_VMA_SCANOUT_BIT))
>=20
> +  /**
> +   * I915_VMA_PERSISTENT_BIT:
> +   * The vma is persistent (created with VM_BIND call).
> +   *
> +   * I915_VMA_PURGED_BIT:
> +   * The persistent vma is force unbound either due to VM_UNBIND call
> +   * from UMD or VM is released. Do not check/wait for VM activeness
> +   * in i915_vma_is_active() and i915_vma_sync() calls.
> +   *
> +   * I915_VMA_FREED_BIT:
> +   * The persistent vma is being released by UMD via VM_UNBIND call.
> +   * While releasing the vma, do not take VM_BIND lock as VM_UNBIND call
> +   * already holds the lock.
> +   */
> +#define I915_VMA_PERSISTENT_BIT	19
> +#define I915_VMA_PURGED_BIT	20
> +#define I915_VMA_FREED_BIT	21
> +
> +#define I915_VMA_PERSISTENT
> 	((int)BIT(I915_VMA_PERSISTENT_BIT))
> +#define I915_VMA_PURGED		((int)BIT(I915_VMA_PURGED_BIT))
> +#define I915_VMA_FREED		((int)BIT(I915_VMA_FREED_BIT))
> +
>  	struct i915_active active;
>=20
>  #define I915_VMA_PAGES_BIAS 24
> @@ -292,6 +314,7 @@ struct i915_vma {
>  	struct list_head vm_bind_link; /* Link in persistent VMA list */
>  	/* Link in non-private persistent VMA list */
>  	struct list_head non_priv_vm_bind_link;
> +	struct list_head vm_rebind_link; /* Link in vm_rebind_list */
>=20
>  	/** Timeline fence for vm_bind completion notification */
>  	struct {
> --
> 2.21.0.rc0.32.g243a4c7e27

