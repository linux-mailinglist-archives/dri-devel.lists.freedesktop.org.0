Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E26073AC75
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jun 2023 00:20:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BB8B10E5B8;
	Thu, 22 Jun 2023 22:20:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BA3210E37B;
 Thu, 22 Jun 2023 22:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687472439; x=1719008439;
 h=from:to:subject:date:message-id:references:in-reply-to:
 mime-version; bh=5RAKYAgPCyNVwCUA0aEqVktcaevqs7f68XOjD7qYUCQ=;
 b=S/Yo2SYjU20EP1hHZemruIsfzBjOpOLkYQjE+s/F5k9UvQpNBf2wGDWu
 U8wE/8zRbdFsQUsbGJHP6/AG/y7fHCJ2dxyL2cOx5o546bt+UVYRaEuiL
 I7q3b50AJ1FQ6Us9fJr+WjK9pW4Na3Ei3KxLEgs0Cs1lgYupVH0rv2Dd4
 I9Jsa6z0TTkZfxHPlx78RTnAjxA28eJ5hATvZpxqpOnSqS+3OQDJJxYl3
 1c3ASSPvUink4GwFGC/fTI7rsRLy/3EKF1SY+1EXRgVhXSFIebtihB8lx
 KpxSqCTMdL2zuOqOsdAbKSXkcKNPjWyzMjLEO9ysttMvie7cHAPxUfLm3 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="364073923"
X-IronPort-AV: E=Sophos;i="6.01,150,1684825200"; 
 d="scan'208,217";a="364073923"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2023 15:20:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="780405723"
X-IronPort-AV: E=Sophos;i="6.01,150,1684825200"; 
 d="scan'208,217";a="780405723"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga008.fm.intel.com with ESMTP; 22 Jun 2023 15:20:37 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 22 Jun 2023 15:20:37 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 22 Jun 2023 15:20:37 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.109)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 22 Jun 2023 15:20:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XdAWBDDRq7TFCjj95seUvCQ8d91MNHBUzAutJF8AdLIZHFj6AhWxBhT1Z/VHyZ7fe6wIRMRvPbm4mjRhZ1YPvUPgiMlrzPCFa8nhPpxVhJOlqHJIrG5ncM4Avin5Ib8NjeN7e+mf10tcnURqn0fCNgQxPKTYS/NIMiJxDvX48/bpCPbwxNU68QMKqxL2bxlF6rC3kdzl53UntMVRgLl/wsnwXlLv/kgJj5KpOQtr3y+DXlbiTrFte7chbMlrLJiylyy2MFmeYh9Z+izNJwi4QvTf2HoGqEoy9rVy5Pe2Q3H5IfssxVXt3KjiusjDqkIs+D3OtHvEKOV+4Xd9A2wqiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x+MAUSCeuNCNB8r5JpuR07PwftbNyrd5s8PONycyTNA=;
 b=e70HOLS03rygC/CuBTACJgQBoms645ikzp5i3tFMcgcUB98xe9rotON2a9jIntjWRr/9ztZkthEZXfEVpBfZI/7j9zDb1F1O19UYV6ETQjaduklUE7d4FmYi7vxm8hzfkjvmMeljx6DXU9T8xXk9l6RygJ2bR+1V2DK/IWp50X/0iHTyxGvI0cY1aAa+wrorj+8KBHazSuSI0fY9mr9iwB8yeFmj16N+/5OUXQXLZ+ireQXv4EsM14MbIPsYHmBY9J1VrbsxBBTiOpyyuxQn+9NCX91D0xnRqwF/GXoWuqAMGTRg+KcS9OtZXej338EcCYYGoFOq6NlRJ/WQOdJtpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BYAPR11MB2567.namprd11.prod.outlook.com (2603:10b6:a02:c5::32)
 by MW6PR11MB8438.namprd11.prod.outlook.com (2603:10b6:303:241::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Thu, 22 Jun
 2023 22:20:35 +0000
Received: from BYAPR11MB2567.namprd11.prod.outlook.com
 ([fe80::28b4:ae85:a4f0:3f46]) by BYAPR11MB2567.namprd11.prod.outlook.com
 ([fe80::28b4:ae85:a4f0:3f46%4]) with mapi id 15.20.6521.020; Thu, 22 Jun 2023
 22:20:35 +0000
From: "Yang, Fei" <fei.yang@intel.com>
To: "Dong, Zhanjun" <zhanjun.dong@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Re: [Intel-gfx] [PATCH] drm/i915/gt: Remove incorrect hard coded
 cache coherrency setting
Thread-Topic: [Intel-gfx] [PATCH] drm/i915/gt: Remove incorrect hard coded
 cache coherrency setting
Thread-Index: AQHZpR4Cacq0e8isXEyNeScfx6YBBa+XY4um
Date: Thu, 22 Jun 2023 22:20:35 +0000
Message-ID: <BYAPR11MB2567EBC3DA33B7D1D4DABD599A22A@BYAPR11MB2567.namprd11.prod.outlook.com>
References: <20230622152644.169400-1-zhanjun.dong@intel.com>
In-Reply-To: <20230622152644.169400-1-zhanjun.dong@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR11MB2567:EE_|MW6PR11MB8438:EE_
x-ms-office365-filtering-correlation-id: d55c5840-7a75-4611-73fc-08db736ee6b5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: yIvdh08Lr96wJf/ECPepTUsj+nI4PFax4wlC8sof+eGNMysMFXz9nOivIoxbHzHVe8OIqJMn1b/QYr7NsY7LsGNp+p2/d0KP0ft4XEVCUUjC48o3Bg+l5AiWMxf4SpzSu823UO08h5gcmSIWwD8z9bwKVnVZ/7VsMtImQPM3bW7/XgQHJ+jJGeU3wTZoYQoW1NvhIyxISPGoqHwzqqmqnKxT5frg6CZRuDkhiBpJqz1swsbBt0v4PSOaoBf+DxY7R9jqyc0cdEp2mLwSzBTYEgdZePrRxoTxpkNAFCvN9Rv79FjpKiylBFdAumJZ/HVdA+Vk8zsSTazx2nXZ/Lg8I9aSrrjfnAumwtiO1Sm0WZhn6mkT+vXP3JxP44JWn0gprM4BCn7qAZw7NfNdB9waDHpHDLjR39aKg3ERC1jTaFpc14FbvpchUF7VeSGBTC4jRkpds5HmrpHUsByXPo7VMOiMoJQOgYIMLJt9icLYz+uavJP52F6Rk0URf+ube0/Hjdnr/P82UEYpLiC7rjBhRXNU+AIoK0qmVjhRZKvVdFHMgfVqcHs5tOdbD52h/RdpzObPzq7gEpnXEXW91Yc1B4FqX3txLKNz4o2h/iGSwl0Flg61FFbPavTmdc3UkPBc
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2567.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(346002)(136003)(366004)(39860400002)(376002)(451199021)(52536014)(8676002)(8936002)(5660300002)(122000001)(82960400001)(38100700002)(38070700005)(2906002)(478600001)(55016003)(71200400001)(186003)(110136005)(86362001)(33656002)(7696005)(19627405001)(6506007)(26005)(9686003)(83380400001)(91956017)(450100002)(66476007)(66556008)(66446008)(66946007)(76116006)(64756008)(41300700001)(316002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?tyOcUXHksP7u61gyEtNwPovxvPXFpXvauJo/ENRamBdkPkDDsPG3FYoYua?=
 =?iso-8859-1?Q?hSE2O2/ZH9rHh7L7iocwptGe3AUVujP6tlKN08ZWIJXF02PRdohuXrpJ4K?=
 =?iso-8859-1?Q?njKeUoOLuQT8EAEkBvJ4jpif0gzufYEyKJ+B272Ooqwkn1qCK1xKVp0DCo?=
 =?iso-8859-1?Q?XHLUdTR3cujLDX2QXnnU6Ks83C8CAzY0/wh8gO7eC+Ux3Q+hQjmxKxmCWI?=
 =?iso-8859-1?Q?c9PsJoafxTAUR6l6YWlDu1y/bmYfk6+1l5bJFZ1Te/GRZ8Td9ZX9WLqLVx?=
 =?iso-8859-1?Q?gAs5jRyRtmtYenlifIIUMTLjojAr4euz2UL5EVTx0iQ8kwSIqYLJVlqL0f?=
 =?iso-8859-1?Q?EcWCgwj1uRi0n8c56Itt2oQ7MGpcPd+YP+mrrR0kio9AO9T6wUHCMrnoBn?=
 =?iso-8859-1?Q?GvdSQfpx/ooj40tZWCxxWsYmU1ux48YO/mamUq8CVhCpEz+FdgemeTADH9?=
 =?iso-8859-1?Q?xMSWAAAmqbXspybOWOdnC+rfjzuWTnEnic1fwPKLsiTQrHXv1Mfkj3M53o?=
 =?iso-8859-1?Q?itOXhGilYHt2hpeOcPFbagXMln8lhtSzGu1R/q5nKNKfY5Bjy5Ogz6VL0u?=
 =?iso-8859-1?Q?PJ6HM6DnUwYVhGxyt5Y0hKVDaTvf/Zy9NQFPuVS8ieyFpLX6x1iJnxnM7x?=
 =?iso-8859-1?Q?l40gaUJ6QTPSroYP6rl8gmAlhXTGfbtd74RWIvPHaFDEb1C+hUOnOxHseA?=
 =?iso-8859-1?Q?ggg1+TSlpzfWCxYrNWhaX1RQgo9UKu80hpJ5PU2ooyMIyQYcXb4JtkEGkl?=
 =?iso-8859-1?Q?n0COj/BkXHfmviYJFhwQPp0trVxNpe4crSd2DXJpC6A1IfF/tTFlbFU6nB?=
 =?iso-8859-1?Q?vOq298KT076UDqdd790/bggf1oIq00uQcju4n+imuDuNfd0bAXwyVjq1cI?=
 =?iso-8859-1?Q?03h3/PgToA0jasn9U66uIR/vTDB/5pzdRWZ4GYUDEVGHZou/xbN7fnKjKl?=
 =?iso-8859-1?Q?Hj6yo//1TV4pqgAcHaM+rM9HhT/qTou7O3J6h/aqPzcTzdMMpB7GFzGPfh?=
 =?iso-8859-1?Q?XJO3yossUjwtj5s++f4LfmkAzA1cTVUYd/ckoEIHp34qVBtNC8OxWpXOor?=
 =?iso-8859-1?Q?8+pAdtUs2wuGLfjIXoJPLd9QMuseHyRy97BimM6A47Ii0qUZnBGrxa29df?=
 =?iso-8859-1?Q?HOasLqIqx18pdqSy4XqYTZu7ikA/e9jKC2ujaY+74bTZL+QjTiXem96Vy+?=
 =?iso-8859-1?Q?p+/6nJHYWSswQNh5XB/1glUtN5LTS861lyhS9BQ/LmWhO1gU0fVuIjkGNe?=
 =?iso-8859-1?Q?FDsmEDv3kI/hOzYTMNIhNQsSWBXq3bUUTNRtdo3W7X5I7QuGEZuT6yy6DC?=
 =?iso-8859-1?Q?WNa6zZiwajXQgpPlstxupmSF1wa7q97pVy8Ajq2bevJDke6iDqX/XzB+BZ?=
 =?iso-8859-1?Q?twdLUuTCS5cy2CUgX6hzY2XPy1OzLYDbpvz8uE5WJmicPvh50gL6eoqLyz?=
 =?iso-8859-1?Q?GzA2m8am7wzh0OMoGYaZavQo17+vJ2bXWgo+NXIQaybt5YOIKbgXh1eKVi?=
 =?iso-8859-1?Q?9ubsFtN0S0N1QnnlbWyHS700rBUBALJH3FcEedRpxZF7tQGPrQC6FjYsrh?=
 =?iso-8859-1?Q?ryLP+tJ0voHrU9c9PzAP6UfWYPvoOx0XlgbAyJDpTVHDEghJGrZeh6nVjJ?=
 =?iso-8859-1?Q?aKHc8sVexrQG4=3D?=
Content-Type: multipart/alternative;
 boundary="_000_BYAPR11MB2567EBC3DA33B7D1D4DABD599A22ABYAPR11MB2567namp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2567.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d55c5840-7a75-4611-73fc-08db736ee6b5
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jun 2023 22:20:35.7130 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: N7iev8yDxG1YQbCeenb4mnEVv0KP5gotCUqgR6jnJ4E4kap7bHRJKibOLPYzCUtIzMtBuh71F5n3OOLRTFRw4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8438
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

--_000_BYAPR11MB2567EBC3DA33B7D1D4DABD599A22ABYAPR11MB2567namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

> The previouse i915_gem_object_create_internal already set it with proper
> value before function return. This hard coded setting is incorrect for
> platforms like MTL, thus need to be removed.
>
> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_timeline.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_timeline.c b/drivers/gpu/drm/i=
915/gt/intel_timeline.c
> index b9640212d659..693d18e14b00 100644
> --- a/drivers/gpu/drm/i915/gt/intel_timeline.c
> +++ b/drivers/gpu/drm/i915/gt/intel_timeline.c
> @@ -26,8 +26,6 @@ static struct i915_vma *hwsp_alloc(struct intel_gt *gt)
>          if (IS_ERR(obj))
>                  return ERR_CAST(obj);
>
> -       i915_gem_object_set_cache_coherency(obj, I915_CACHE_LLC);
> -

Does this change really fix the coherency issue?
I consulted with Chris and he said that the hwsp is purposely set to be
cacheable. The mapping on CPU side also indicates it's cacheable,

        intel_timeline_pin_map(struct intel_timeline *timeline)
        {
                struct drm_i915_gem_object *obj =3D timeline->hwsp_ggtt->ob=
j;
                u32 ofs =3D offset_in_page(timeline->hwsp_offset);
                void *vaddr;

                vaddr =3D i915_gem_object_pin_map(obj, I915_MAP_WB);
                ...
        }

>          vma =3D i915_vma_instance(obj, &gt->ggtt->vm, NULL);
>          if (IS_ERR(vma))
>                  i915_gem_object_put(obj);
> --
> 2.34.1


--_000_BYAPR11MB2567EBC3DA33B7D1D4DABD599A22ABYAPR11MB2567namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof ContentPasted0">
&gt; The previouse i915_gem_object_create_internal already set it with prop=
er
<div class=3D"ContentPasted0">&gt; value before function return. This hard =
coded setting is incorrect for</div>
<div class=3D"ContentPasted0">&gt; platforms like MTL, thus need to be remo=
ved.</div>
<div class=3D"ContentPasted0">&gt;</div>
<div class=3D"ContentPasted0">&gt; Signed-off-by: Zhanjun Dong &lt;zhanjun.=
dong@intel.com&gt;</div>
<div class=3D"ContentPasted0">&gt; ---</div>
<div class=3D"ContentPasted0">&gt; &nbsp;drivers/gpu/drm/i915/gt/intel_time=
line.c | 2 --</div>
<div class=3D"ContentPasted0">&gt; &nbsp;1 file changed, 2 deletions(-)</di=
v>
<div class=3D"ContentPasted0">&gt;</div>
<div class=3D"ContentPasted0">&gt; diff --git a/drivers/gpu/drm/i915/gt/int=
el_timeline.c b/drivers/gpu/drm/i915/gt/intel_timeline.c</div>
<div class=3D"ContentPasted0">&gt; index b9640212d659..693d18e14b00 100644<=
/div>
<div class=3D"ContentPasted0">&gt; --- a/drivers/gpu/drm/i915/gt/intel_time=
line.c</div>
<div class=3D"ContentPasted0">&gt; +++ b/drivers/gpu/drm/i915/gt/intel_time=
line.c</div>
<div class=3D"ContentPasted0">&gt; @@ -26,8 +26,6 @@ static struct i915_vma=
 *hwsp_alloc(struct intel_gt *gt)</div>
<div class=3D"ContentPasted0">&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (IS=
_ERR(obj))</div>
<div class=3D"ContentPasted0">&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp;return ERR_CAST(obj);</div>
<div class=3D"ContentPasted0">&gt;</div>
<div class=3D"ContentPasted0">&gt; - &nbsp; &nbsp; &nbsp; i915_gem_object_s=
et_cache_coherency(obj, I915_CACHE_LLC);</div>
<div class=3D"ContentPasted0">&gt; -</div>
<div><br class=3D"ContentPasted0">
</div>
<div class=3D"ContentPasted0">Does this change really fix the coherency iss=
ue?</div>
<div class=3D"ContentPasted0">I consulted with Chris and he said that the h=
wsp is purposely set to be</div>
<div class=3D"ContentPasted0">cacheable. The mapping on CPU side also indic=
ates it's cacheable,</div>
<div><br class=3D"ContentPasted0">
</div>
<div class=3D"ContentPasted0">&nbsp; &nbsp; &nbsp; &nbsp; intel_timeline_pi=
n_map(struct intel_timeline *timeline)</div>
<div class=3D"ContentPasted0">&nbsp; &nbsp; &nbsp; &nbsp; {</div>
<div class=3D"ContentPasted0">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; struct drm_i915_gem_object *obj =3D timeline-&gt;hwsp_ggtt-&gt;o=
bj;</div>
<div class=3D"ContentPasted0">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; u32 ofs =3D offset_in_page(timeline-&gt;hwsp_offset);</div>
<div class=3D"ContentPasted0">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; void *vaddr;</div>
<div><br class=3D"ContentPasted0">
</div>
<div class=3D"ContentPasted0">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; vaddr =3D i915_gem_object_pin_map(obj, I915_MAP_WB);</div>
<div class=3D"ContentPasted0">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; ...</div>
<div class=3D"ContentPasted0">&nbsp; &nbsp; &nbsp; &nbsp; }</div>
<div><br class=3D"ContentPasted0">
</div>
<div class=3D"ContentPasted0">&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;vma =
=3D i915_vma_instance(obj, &amp;gt-&gt;ggtt-&gt;vm, NULL);</div>
<div class=3D"ContentPasted0">&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (IS=
_ERR(vma))</div>
<div class=3D"ContentPasted0">&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp;i915_gem_object_put(obj);</div>
<div class=3D"ContentPasted0">&gt; --</div>
<div class=3D"ContentPasted0">&gt; 2.34.1</div>
<br>
</div>
</body>
</html>

--_000_BYAPR11MB2567EBC3DA33B7D1D4DABD599A22ABYAPR11MB2567namp_--
