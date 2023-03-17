Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FA986BDFB9
	for <lists+dri-devel@lfdr.de>; Fri, 17 Mar 2023 04:43:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6ABB10E04A;
	Fri, 17 Mar 2023 03:43:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B89C10E04A;
 Fri, 17 Mar 2023 03:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679024631; x=1710560631;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=UMPldH5OwKOyKkbskiG513YZi64nma4GowweLge5kwY=;
 b=evyHhdF+FhPIBWssM7Xu8Sxbb3Jx6g6m5M1IKdgzyMj6NrHflcZUWiTT
 +jGX1EFxhVNGw1owCwwwg0kl6VHo3xkiQgPFzxUZlDoMcXdTz8g9a5zgB
 XpM8iV8rOffjlmZgZSyGvPVIF+YhovRVXErbxJyX5USemlPAPNY43ms4Q
 GYkYKAaBp78b3u2Igt9HgSr3Glx8Mr+n8T8jUdkB+IXVYT7apP1azZXTv
 Unm6hihs6XijYnz/9o3zbdsTtutypwW+FGQ2azzU/xzzzceb4ewVfYkeB
 WTpAfYp63s9SPk9pQO4wa9z2I7/NEXIBT8+DghMtz4NSvF+54iOYoWX/x A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="318568292"
X-IronPort-AV: E=Sophos;i="5.98,267,1673942400"; d="scan'208";a="318568292"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2023 20:43:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="712599580"
X-IronPort-AV: E=Sophos;i="5.98,267,1673942400"; d="scan'208";a="712599580"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga001.jf.intel.com with ESMTP; 16 Mar 2023 20:43:49 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 16 Mar 2023 20:43:49 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 16 Mar 2023 20:43:48 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Thu, 16 Mar 2023 20:43:48 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.174)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Thu, 16 Mar 2023 20:43:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b0uOfbXGnLEtbhEBrIcx8Kg4UZE+mz0wOqTZ7mrbjiKGwP7Zn/QNYVm26vyEcESo2t9ff/4pC6BET6/Mkfjw5HYlsGgSJ+XwoQh0J2RElvhaQDHUG/1+eiFkcRgvCdQp57/3ik0oK/1Pqsto+ryJMr6FlhLBGPmK2nbJSfQrIJOpFBZmwmVqGPdyOLnFNUyUntWAkricLxJ0lqfxxNLm/H1HJjtXuwsWy+E1gXDn5r57kqFFUoD+Tj/ySKLOVq+D8gxjGFN5Hq+BWvA2NHj6YEX+TUvg5x9OPtcvCWkSA2b4eSdOcgCAioPxdyV79vzymtw1MBLXR2ywF32SuPxX3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tDJXhCfKtcJ6UBVYm1GozacSNXRq/OLhxVvH1bt/uuY=;
 b=UI7D5gx6gI37QLmILuYB9sLCJ0cNKfhDik7OjpU9/bkfLwmOAoqf3xEgXUubi9JLkDnBQPIes59IquIUCRCKoH8U0A8rNx8WEirYMfPu6+T0He1NxAj2Jwllc+tQLoNz9aV1MfmY4NsmBm/KlV3nZEz2TMC2M+XE2udkWEaoi+FLx7SqFq81kOJmb7uCuqyrpQ/1wL/syaeJNcVE+e36PuldB3uOEcRi5n7hAdIJoeibTyQGgvsj7Ddwns1658u1YMX55T9hhCq50fM0LhCUMbVcp18PuSz+5GE3Gyg0QLTjW3Ti9vlf0+qDy9AEIJM4yBGo8yG37CdVtp+5VoB6Uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN6PR11MB2574.namprd11.prod.outlook.com (2603:10b6:805:59::14)
 by BY1PR11MB8077.namprd11.prod.outlook.com (2603:10b6:a03:527::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.35; Fri, 17 Mar
 2023 03:43:47 +0000
Received: from SN6PR11MB2574.namprd11.prod.outlook.com
 ([fe80::4c4a:f037:6980:1a94]) by SN6PR11MB2574.namprd11.prod.outlook.com
 ([fe80::4c4a:f037:6980:1a94%5]) with mapi id 15.20.6178.031; Fri, 17 Mar 2023
 03:43:47 +0000
From: "Yang, Fei" <fei.yang@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>
Subject: RE: [PATCH] drm/i915/selftests: keep same cache settings as timeline
Thread-Topic: [PATCH] drm/i915/selftests: keep same cache settings as timeline
Thread-Index: AQHZV2jpkQQe9pGZukSTiCVorAtQSa7+Hh6AgAA3qwA=
Date: Fri, 17 Mar 2023 03:43:46 +0000
Message-ID: <SN6PR11MB2574A0A41A0DB74E1DD38F4B9ABD9@SN6PR11MB2574.namprd11.prod.outlook.com>
References: <20230315180800.2632766-1-fei.yang@intel.com>
 <20230317002151.GF4085390@mdroper-desk1.amr.corp.intel.com>
In-Reply-To: <20230317002151.GF4085390@mdroper-desk1.amr.corp.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN6PR11MB2574:EE_|BY1PR11MB8077:EE_
x-ms-office365-filtering-correlation-id: bc860380-fed8-429f-5204-08db2699cfff
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6Z7FEuo51Gla3bwMWC+kuiRSp/3QPamIYJRq9tgLypH79zqFvDBa4yvezGFgHIQP103QgMz28apBgDu2UUi1xBhCqVJFvqQcAD6sIIoR4jE/rRBT565FNTO+W76JfY3OO10Z/nSXZ4BaEsdOyYDyE3+du6LlZfb59ThDa1mF7bIRpkofccxxCLNDK19i1+H/GcqDcBptLwT1XTKdw6PNySFIUO4sAQQhilzKAyj8/gT9TttZk/lI2MKLU1pNKucS/aVEcc0xaFANkEnFLFse2E66xcYk2p2h9GKq3Led6PWvWLGoNZYe9pYsZDdwFSsaOd2xy7qK/aNIWMQqF9NV/FtcXeQMhAElF8o1QqvRNTTdmfQ2R0RPCL9oBoMpDfKUSgBszHSvD10pHsqKOjK5wGmOH2LZJ5p2vSyS1jsPMwYh5IMDVhbTTLeVQpQ4UWB5hs6YMxKyjwNBAQ6StkbDeIHMpMLQPX9g03PYRW35RDDXMLCG8EdXz6wZ7Yn62ojWkYf5PxlWtq4xbC3/xEXYeCunaYdbJ+Nhz3Tm8IU7j/x6eWwD62qoJ+yjqBrcnq5ZIoDkC+h6+K/yjC9npw/9j7Ii/9U7YJbZ9iU1Zr5e7kNhZhChvyHbgLhs63T1r6OlQcamium+wB1w4N8E+95nV2XS6Jgbts6XUsJ+caUUXFJsNSLcZMMiMjJhy7M8IEBzOoDKfamM44dSyTQOzTtXmA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR11MB2574.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(39860400002)(376002)(346002)(396003)(366004)(136003)(451199018)(86362001)(38100700002)(38070700005)(122000001)(82960400001)(33656002)(2906002)(52536014)(41300700001)(6862004)(8936002)(5660300002)(55016003)(4326008)(26005)(9686003)(6506007)(186003)(83380400001)(316002)(54906003)(6636002)(66946007)(66556008)(66476007)(66446008)(64756008)(76116006)(8676002)(478600001)(71200400001)(7696005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?0s3CNCKvNy7PKwX0kOvIsaa9gfc641l76h17YXc+1IN4BgZT3wEM+QGfnfpA?=
 =?us-ascii?Q?HALy039e99t37H5IhyeujUTTB7H9JS4ruvkiZ+I+q7Absx12o10JIGGJMLHU?=
 =?us-ascii?Q?BTMahJfzs2mD9T7TxMLt8sxXHdsosNnmGfELTwLb6YhT4+H/tQcsNbMMny/1?=
 =?us-ascii?Q?U9rx0vfInmtGPmDPf4dvrrjNjch6zyifSKCHyw5e1doVRUZfXN+XN2vMyQcy?=
 =?us-ascii?Q?2RsfrAg4/z64dCa8BaZBLWQr0z93Vtu5T44+37nDKj/SWcPnfmXTVdaPmI9D?=
 =?us-ascii?Q?iTJjh6Kfvw9xTeSfwmrGillfdjLSb1Sv2LoYCp3pnxi/euFO0nAdjUziu5+C?=
 =?us-ascii?Q?OgrOCeghTi2Jqpa3M03eruj1gS8rESYu1PdXaDepBydQHVPBpxPHhijiWmpE?=
 =?us-ascii?Q?HL9+PjO8smkhtN19BB6dZEei4XVgJJcHi4GYOuR5jSkipotAT5MM/ZV95+Ti?=
 =?us-ascii?Q?qeUfFgjrpN2GErAWtgmN/5Q2xdsqDYRFpCMAogG7faGvmGeqRnGNyXdRF8Le?=
 =?us-ascii?Q?KVsMyij25aBzRxCy99CTBeGvYW1OCtWS9QcBIX0LQuiUdI2yHM5jzhgoQrYS?=
 =?us-ascii?Q?/SQMUMgvFUZdYk3XEyVMu9016jdDQQaUzntgfVwRVxM5+d1OdLmv+PBQPrWq?=
 =?us-ascii?Q?K4f1jrsfFaumtjUB5z2PnIUOc0TdqYyVbpE9GOWObkNUhX2IIsYfOyfOVwav?=
 =?us-ascii?Q?jDu1OR3UlIYNsFsqm0PL7WOMBGeEUw3JKECVGbyypIigSuy3Rex0lHNlm8sn?=
 =?us-ascii?Q?u8JI+I9gTSPgc/rq07rEhQfXPJeJPz+XdUck2pY4wqe6EwaspHzm+kLizFw5?=
 =?us-ascii?Q?BoHJj8tsCwR+XuBJ3S8G4/I18U8s1GzF/G9ppRtoiIzNpubIFPf99FhWYDZa?=
 =?us-ascii?Q?zA9Z1D5n5f6L8IcXflfiRt4TYgoOeV+kcs909H6O7RZBsUsBomIhfkSnJHYj?=
 =?us-ascii?Q?VvN6vtmCCAdCbVIg8Dvb87g8PpROJG9r597MDb+sGon7zm4dUDLZas302gPy?=
 =?us-ascii?Q?Vm5vBNP0utBI+hAjISqrvwSbjDl7WeFkBSav9RLUwl9RloJjqc81303p69TV?=
 =?us-ascii?Q?+aF6Lxwr40tzcq2NryFoAV5J9UeSt188hYkJIh081GJHuxtf6BMU/iftoC9A?=
 =?us-ascii?Q?aJVM6/DYbRXPkurvuqQCBCKdoVGwb9plFQuR/VTz/Zr+6ptc75potHuNKnEK?=
 =?us-ascii?Q?m7UP7CYKPgRFPxAI+0588jnjVxQ55jVHs4L5sPHS7FYnAGTSLz5/YD6+M0/p?=
 =?us-ascii?Q?V++mMU62/IMB09COGWabRe7cNm/UYEux+KhH1+7b4dOgYju2PSnduO5sdkPg?=
 =?us-ascii?Q?zx8U10BQx2rfkeX14SzEDWYsBKNMGKEWec/ltwyR0eQ1wcZQqn5dvL2i00Vc?=
 =?us-ascii?Q?AIUTHBqNIg544pkTRdfJwzuqbNKcjHd3jUT2F/L0rOrMpTk0aZs/x22lUei7?=
 =?us-ascii?Q?6h6na0atIpWTvUPwzZAe9dxo135N9TcCspEl5LQt6fTlEaX7YS6Qqc4cbxkb?=
 =?us-ascii?Q?4gG6jhF5861XG6XYlIS+jNKTRuqaloJXTnj0p+RaJiAPkGtQeEhrAGPiJ7Y8?=
 =?us-ascii?Q?rBw3ZkUMzsiXM3i6+2ZuZvS9dk00tXGK8I3AwNat?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2574.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc860380-fed8-429f-5204-08db2699cfff
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Mar 2023 03:43:46.4056 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: i/+NP2v/DvCBJK0Xe1hlIxTSdj8jTSB1yK2qUgxaDJyl7uopn+kngK/noe94Aan/zAi0ZDvnSdbi3dxS8PXBrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB8077
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, Chris
 Wilson <chris.p.wilson@linux.intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

>> From: Fei Yang <fei.yang@intel.com>
>>
>> On MTL, objects allocated through i915_gem_object_create_internal() are
>> mapped as uncached in GPU by default because HAS_LLC is false. However
>> in the live_hwsp_read selftest these watcher objects are mapped as WB
>> on CPU side. The conseqence is that the updates done by the GPU are not
>> immediately visible to CPU, thus the selftest is randomly failing due to
>> the stale data in CPU cache. Solution can be either setting WC for CPU +
>> UC for GPU, or WB for CPU + 1-way coherent WB for GPU.
>> To keep the consistency, let's simply inherit the same cache settings
>> from the timeline, which is WB for CPU + 1-way coherent WB for GPU,
>> because this test is supposed to emulate the behavior of the timeline
>> anyway.
>>
>> Signed-off-by: Fei Yang <fei.yang@intel.com>
>
> It looks like there might be an indentation mistake on the second line
> of the i915_gem_object_pin_map_unlocked() call, but we can fix that up
> while applying; no need to re-send.
>
> Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

Thanks for reviewing.

> Is there an FDO issue # for the random failures thar were being seen?
> If so, we should add a Closes: or References: tag here.

I'm not aware of a FDO filed for this failure. That might be because the
issue is reproduced on MTL which might not be widely available to the
community yet.

> Matt
>> ---
>>  drivers/gpu/drm/i915/gt/selftest_timeline.c | 14 +++++++++++---
>>  1 file changed, 11 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/selftest_timeline.c b/drivers/gpu/d=
rm/i915/gt/selftest_timeline.c
>> index 522d0190509c..631aaed9bc3d 100644
>> --- a/drivers/gpu/drm/i915/gt/selftest_timeline.c
>> +++ b/drivers/gpu/drm/i915/gt/selftest_timeline.c
>> @@ -825,7 +825,8 @@ static bool cmp_gte(u32 a, u32 b)
>>        return a >=3D b;
>>  }
>>
>> -static int setup_watcher(struct hwsp_watcher *w, struct intel_gt *gt)
>> +static int setup_watcher(struct hwsp_watcher *w, struct intel_gt *gt,
>> +                      struct intel_timeline *tl)
>>  {
>>        struct drm_i915_gem_object *obj;
>>        struct i915_vma *vma;
>> @@ -834,7 +835,10 @@ static int setup_watcher(struct hwsp_watcher *w, st=
ruct intel_gt *gt)
>>        if (IS_ERR(obj))
>>                return PTR_ERR(obj);
>>
>> -     w->map =3D i915_gem_object_pin_map_unlocked(obj, I915_MAP_WB);
>> +     /* keep the same cache settings as timeline */
>> +     i915_gem_object_set_cache_coherency(obj, tl->hwsp_ggtt->obj->cache=
_level);
>> +     w->map =3D i915_gem_object_pin_map_unlocked(obj,
>> +                     page_unmask_bits(tl->hwsp_ggtt->obj->mm.mapping));
>>        if (IS_ERR(w->map)) {
>>                i915_gem_object_put(obj);
>>                return PTR_ERR(w->map);
>> @@ -1004,8 +1008,10 @@ static int live_hwsp_read(void *arg)
>>        if (!tl->has_initial_breadcrumb)
>>                goto out_free;
>>
>> +     selftest_tl_pin(tl);
>> +
>>        for (i =3D 0; i < ARRAY_SIZE(watcher); i++) {
>> -             err =3D setup_watcher(&watcher[i], gt);
>> +             err =3D setup_watcher(&watcher[i], gt, tl);
>>                if (err)
>>                        goto out;
>>        }
>> @@ -1160,6 +1166,8 @@ static int live_hwsp_read(void *arg)
>>        for (i =3D 0; i < ARRAY_SIZE(watcher); i++)
>>                cleanup_watcher(&watcher[i]);
>>
>> +     intel_timeline_unpin(tl);
>> +
>>        if (igt_flush_test(gt->i915))
>>                err =3D -EIO;
>>
>> --
>> 2.25.1
