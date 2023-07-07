Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 57EC374B1B6
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jul 2023 15:23:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C24AF10E58C;
	Fri,  7 Jul 2023 13:23:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C56610E586;
 Fri,  7 Jul 2023 13:23:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688736217; x=1720272217;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=WHmnL3tF4yLRcc97ptxkQnwwYq5Ni9TnPW8elvdLrO0=;
 b=XezsQst/B7Nnj7+fC9TIkZlyLsOKTPp0nKkQmdT1PpK9yQGChU1r//YM
 OOWHuaKLs4gpxBipEvPI4MYwSVfKHVUpWGSfHT2cqCdq+cMyAS/PjkvhV
 EUKMiZlHRDfExYuCwPB1UAqI9BZ906gTbYbhowysqcaLH/S3hE5rr6uml
 9lYj1riKELKeUQNgtDvJhfN/jCzR06vOBXUn3lIDlV2vUexYuXDGifxet
 ucLAcLVYx69btVb4bdln7Kbw5yXUWRaOQGQ6bRaheJ3cknGUUVqmUHEdy
 XBnpnH/tCqGMqx+dTAzZeumMjxGqh/gNWqjIShhrQ2YSEBL/KmSR4DuFw w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10764"; a="429951155"
X-IronPort-AV: E=Sophos;i="6.01,187,1684825200"; d="scan'208";a="429951155"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2023 06:23:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10764"; a="749561385"
X-IronPort-AV: E=Sophos;i="6.01,187,1684825200"; d="scan'208";a="749561385"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga008.jf.intel.com with ESMTP; 07 Jul 2023 06:23:36 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 7 Jul 2023 06:23:35 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 7 Jul 2023 06:23:35 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.104)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 7 Jul 2023 06:23:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KgSPQ269kxBeBfi9tj1/hr8lcmd/ktZ5sMgI8Bs12kv7CHuUAEDZG+SX9fubJQUnedVOEaqHlckwQLGdwhvTKTMw8De7GLF9KKRLgrLXHoo3VFMWT47b9s1QRfXpkDEMn+TkR7q06o2RVt4CinEFUnMPY7u5TGqOkNN0RlvvN3Ve6QimselpGWcNMQaMZJ9ezCdpki3OVjenNqUAjbCz+gRzbEsn+xeqrw1z0lxN/2n6VYDqjtCZKet6MsBIiOa+sq5L8FhR35thEMUPTJD3pDE4hNKQSdVT17/ADWMur9UxKN/ywV89yQ1Nk2omldKEbuQHD1/JnywOXCedCX9WGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p2PWHrB3+2MyZKLESjfmD9AVoJxJ6IJRD/b8P9ysllU=;
 b=ZtCeoB+4t9Z+QZsLuLdy5IS9ILVpJUuJgKWEZz+wuYooAq/qAd7+rQ9vmlzj8sTghlecW9SRAObL8PHX4fi07pkwR6n+hUgutl4XLMJl8lKjPSHNMZyoKOS1x+sVdMeeU+ps0Iu7ZJ2BhUnWWRC5ynr/8B7p5E5v+HKFt/UZosNChBfROi7QPmjOHH6q0p76w31Jvh1tQw//uhAo81ugYuNUCcRrD/Vc98v39F20dhq9gGbETk9slP2ZiByeZ+QT4/F0z13TyhFNvkiFu6FOLqvZYvlznDdVSZHw2fXGyKvQL2clvD5W3axEcAyposhnNJ2mc3TovjlooYT+uRSZ8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by PH0PR11MB5208.namprd11.prod.outlook.com (2603:10b6:510:3b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.25; Fri, 7 Jul
 2023 13:23:33 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::2bfb:7d63:f348:1a4]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::2bfb:7d63:f348:1a4%5]) with mapi id 15.20.6544.024; Fri, 7 Jul 2023
 13:23:32 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 "Intel-gfx@lists.freedesktop.org" <Intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [Intel-gfx] [PATCH] drm/i915: Fix one wrong caching mode enum
 usage
Thread-Topic: [Intel-gfx] [PATCH] drm/i915: Fix one wrong caching mode enum
 usage
Thread-Index: AQHZsNJXirNhwKmoCEGx5uNbSMSQMa+uSPlA
Date: Fri, 7 Jul 2023 13:23:32 +0000
Message-ID: <SJ1PR11MB6204F446D83BBB894E7D53CD812DA@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20230707125503.3965817-1-tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20230707125503.3965817-1-tvrtko.ursulin@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|PH0PR11MB5208:EE_
x-ms-office365-filtering-correlation-id: 8144b9e1-e723-4014-ed71-08db7eed5c46
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JL41Q7HKQb6RPOEJVSkl1fqEmgfPk3xl2DJ4/450+mmxC1SPTkWFWDxxQ4tSfxTuJJKRYWZhumdlX2nsQH3RtcuneN4tELlF5Sg+rlhfplTC9Oc0m4du6cQpNXQrV217ideJXHrat7wUWY+6213b7rGq/FnEpFTuV+skELyrVz843CiD8FOchv17FWFoAzIX151GkFgoAMLBFZ8lgYG9kmvl54ztOnjFNXmPDOXti8FdSIXn0g/JnQwRHuwdfH4o8mMuz9iZO9swO4z17gz90wvhofq6bxBbIzhOUMZdKL34v8LYHShH37UQEM4SDji5AfdFADw9+AYTd7feP5fRQmvlBMk+XR8CO+syHrbrxG2wTkQA0mTWO42qfG7JXFRsjnYaJ/xQ25uFV14+Ogighx9HNmBgkQO1hq9rJLhUfUIns8vyJeQZ0Xq7wdGN6E8gy5Iq0eudHDqmhVIx8zuB6zLzMR9zF2xkqdRujNlsdjUkG0TNSLMY9DYjBOWr2TLdOyc/kNPD7dy3yHRg7Al/GQ2if5ob2ZbQXT5MK2MFTC9IyyLA1UTWBi1JiZlYp599hQHg4RGKz68LmuaXaEdtMGygJBMFU6I8QB2Y9o9ISRSFChoTAI155INE1zowxDMA
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(376002)(346002)(136003)(366004)(39860400002)(451199021)(71200400001)(478600001)(7696005)(110136005)(76116006)(53546011)(6506007)(9686003)(66946007)(2906002)(186003)(41300700001)(316002)(66446008)(64756008)(66556008)(66476007)(5660300002)(8936002)(8676002)(52536014)(38100700002)(122000001)(82960400001)(86362001)(33656002)(38070700005)(83380400001)(55016003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?B5ZVRshHeXRMkqGkDmSXwexxTsmFxAZ+WXt2PIsoGeUTGhfQPSO227XDFVR4?=
 =?us-ascii?Q?gaNVMVVqFRkgZ/QjL329fFeKOSEUimvKFt/7uUmMYMHXFyo1Xlga2MiE+A5D?=
 =?us-ascii?Q?nSVAicaCkJXvliueeofE0uYIPcAoR7H+N5u3Vc8Qr8IcWshaHzl4wBgZdA5v?=
 =?us-ascii?Q?egfMkTmVkZFWyoQOCY8BbXxovli8iHpubCVdftdDL2kD7v2Khc6JJPHMEhEd?=
 =?us-ascii?Q?v1Z4ySKkDdN/vNsezZsNRDxCQOI/J6u3YLEa+YaM0htwczfvYGVBjE4MEIvc?=
 =?us-ascii?Q?cMAdeHH9HWDx8VwLUIrZoKP9SzV9WYaJn5IVEwIDDbVl1e1UqRVVvBaBqdie?=
 =?us-ascii?Q?+RiHT4XidT6qmBDFa9bUhJt1UvfiuSVK68VhrN/cuA//pq7sq9PDp5FxjwKg?=
 =?us-ascii?Q?cobq5yc9BMqJ7tVgIGEMUjYGZM7pF7HQ/Wbagfkjol3KGQu2i5pDGwmGUjjD?=
 =?us-ascii?Q?9bQ7Y0QPzs7LqaRXt+JIDuZGD9orqB4GGA10yIDODNvhnCYrn5+vZkvSxowb?=
 =?us-ascii?Q?rIrTOmKyP2NWFB0s1k8FJ+XyDRktYsXHj2HXouzjawNKIi0w5osdNJHw0KHl?=
 =?us-ascii?Q?MNb0OXiREeHvvjvA8QDsQ/xhjXR7/XXxfUm0w6WmZM/MeM8+w3WjSzpuapgJ?=
 =?us-ascii?Q?VoDLyIeTeOzYd5AVEIfb/VCDyOO5pPgoF3tjYFIJZWIUymEHRYGGWyplqy7Q?=
 =?us-ascii?Q?lXGxd9c+u2PqW1sWmjpi7lthSJu0oyvBW6HhhMjjkU73cPpSWlIXRZ5vLpth?=
 =?us-ascii?Q?xIq/KMUCx8qiMXJEr/yt2oM6dzp84AYTOWT3jYnUpDrMRf9OuVuiJ89fomOR?=
 =?us-ascii?Q?Zplh++ipSS7cVOVvNhcPkKJZ55VmNjHLW5lqqIkOPjcVEvNHmlDzQLdD6SY9?=
 =?us-ascii?Q?tTfDK/6KmVpL40EVCQ/1aho2ClfDqkoG0f8P+rWx1RhKmZji6cX4q6XmrGVz?=
 =?us-ascii?Q?GT9tdeAqbskHWmivZAlXvOosagBfDHDV4TOr+RWge+NwJFQ9Xznb1n+h8Uwi?=
 =?us-ascii?Q?PZm7ajuGS1b3HfCCZwC+RbfCGwb8mqSgiPy5twucehKjZY+EI5EFp1kuRM/d?=
 =?us-ascii?Q?SOWvV8aRbmpRJY9dxOYVROGfcZGtWsAktYkb/wh1v5mrElJ7kf0XCK1UeVbN?=
 =?us-ascii?Q?1aXbTJB5UVRZrrkTrTzk9vAlVI5lM4O7crIKADJvtBnymFJ0yotbPLjVPkEW?=
 =?us-ascii?Q?v2a4GScvECgakQ2UR/OzpfQupMmAJvGYocszrTOOyqE42940HwEl7XwyzYiI?=
 =?us-ascii?Q?QoDrbDkYPZ0xBlDWOrlkosz9RZUN0OcCEdDT2uB+95PDGnj8JjoEG2KiAcbw?=
 =?us-ascii?Q?GXS7qBnrVuR386BZzXNV/Ekp7qDozYAgLynfg7TDYbABLQkPOZXIoeXVlBZE?=
 =?us-ascii?Q?dAg76rEulukGQL1Xkw0Qsr+9eHlGIxKez9usSpIddrrejAI0Dy6C12trR6cs?=
 =?us-ascii?Q?wyk80m0ASGB1e4ONMYRp0uqIwe5KWn68vSulWp+pCosUpKFBrlUe1mg700vF?=
 =?us-ascii?Q?qdD4e1IaqzerPY/jpxstx+iMmJpH669JUyFcnPnKFa86HNAFin+4z7b84VYq?=
 =?us-ascii?Q?VcI8KFBXQh8MQTru8b9rPt9vgSnEHf3howTkPMbUl8erBcXwsKDCXVAF97GP?=
 =?us-ascii?Q?DgcIVMZjmM12RzTlUPXRaN8/5E3sLXcGlIMwLrLH8Fp6?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8144b9e1-e723-4014-ed71-08db7eed5c46
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jul 2023 13:23:32.3386 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /wv9xH6qqDzyWXyWyW80JvJoyToyrAZiIq/IwgYSJpMRVRaVDHSDnfa5WPm7shjNO1o4ETlRVxTuiN5kx1Xf9exNsKmhfKsa8tzwFnwUWhs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5208
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Intel-gfx <intel-gfx-bounces@lists.freedesktop.org> On Behalf Of
> Tvrtko Ursulin
> Sent: Friday, July 7, 2023 6:25 PM
> To: Intel-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org
> Subject: [Intel-gfx] [PATCH] drm/i915: Fix one wrong caching mode enum
> usage
>=20
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>=20
> Commit a4d86249c773 ("drm/i915/gt: Provide a utility to create a scratch
> buffer") mistakenly passed in uapi I915_CACHING_CACHED as argument to
> i915_gem_object_set_cache_coherency(), which actually takes internal enum
> i915_cache_level.
>=20
> No functional issue since the value matches I915_CACHE_LLC (1 =3D=3D 1), =
which
> is the intended caching mode, but lets clean it up nevertheless.
>=20
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Fixes: a4d86249c773 ("drm/i915/gt: Provide a utility to create a scratch
> buffer")
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_gtt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.c
> b/drivers/gpu/drm/i915/gt/intel_gtt.c
> index 126269a0d728..065099362a98 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gtt.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gtt.c
> @@ -676,7 +676,7 @@ __vm_create_scratch_for_read(struct
> i915_address_space *vm, unsigned long size)
>  	if (IS_ERR(obj))
>  		return ERR_CAST(obj);
>=20
> -	i915_gem_object_set_cache_coherency(obj,
> I915_CACHING_CACHED);
> +	i915_gem_object_set_cache_coherency(obj, I915_CACHE_LLC);

Yes.
Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>

>=20
>  	vma =3D i915_vma_instance(obj, vm, NULL);
>  	if (IS_ERR(vma)) {
> --
> 2.39.2

