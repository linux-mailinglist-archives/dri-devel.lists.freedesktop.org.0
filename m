Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A5744127F6
	for <lists+dri-devel@lfdr.de>; Mon, 20 Sep 2021 23:25:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 422AD6E888;
	Mon, 20 Sep 2021 21:25:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew1-smtp.messagingengine.com (wnew1-smtp.messagingengine.com
 [64.147.123.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39C256E87C;
 Mon, 20 Sep 2021 21:25:35 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.west.internal (Postfix) with ESMTP id EECA82B012E5;
 Mon, 20 Sep 2021 17:25:31 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Mon, 20 Sep 2021 17:25:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=u92.eu; h=date
 :from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=AWImI2KGSpvCbthaTGpOCk4QbRl
 8dZEEYq4SHjBTZJE=; b=USXGjuU+4R2n9u+CDG6f9J49IGnM33Ay4XL+MlmTPNv
 zeb26cRTrDZymp/Wy0xOKrb0j7P0vB55p2h5DS5Co/L1vAGjJoI0JQcZh93opH11
 4hsuQsFzDJ4FhOR4s7lTtgsnMNm+7OJWq8pl9qVcXWJF1hr9RNClUgeMfBLC8kcb
 WyhUfNH8fNniw9f56QJwijgyaUFVFtXVm0bLLG/NskWpOyT6fINV5jlub6v5TEPQ
 VsBBXzNvOEzK+lONgNf2QcFjqJvJG3T8ipYXGF4VfGvx8NtLjS2OlTOKVN/Oy1pT
 LUKfj8RyH4XVxQ7OUFm/X8+0xVYdgIpKJSzQ0okyh3g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=AWImI2
 KGSpvCbthaTGpOCk4QbRl8dZEEYq4SHjBTZJE=; b=Aaj6hUmY/KPtF72LH13Yrv
 mhXLRAym+vY8SVlWlLweQ7NtjfFgQ8vEjItH8b++bypf/hy2iQn7jXeRszrOQgwP
 bXw8UJGlZzVijGiBljQD7wCXpJriQ+UJnLTQq0TINKW2ITc6xyX1sxYD3uohAlQu
 6NXwJfYejUwBe4HT5zuWM3MzCB5nfIJSe2ywV7rnVQevRT4FOiZsdm/CiUuvY9Ur
 +w/vhof0UnA4w+UPfcdCYlDEWSOhnSlYH+YUv0M8vfe3CCycZx+YQprmNbDIjPC5
 Cm8RaSUQGSODp8Y/5sbZydYQDDu4pZLzEq8bUfLwBEXWTYEB65RxOuAwkjZCPNrw
 ==
X-ME-Sender: <xms:SvxIYb_SD3L6GKZGVyKR7v3MeCFNcaciiz1aAknxnzN1mAygQkqBOw>
 <xme:SvxIYXtxHvokL16p3vxzx4LR9djf0dxSIuc0NrHJnrHy5ApNkIX81_FKyP9MujcT9
 HkykA1gYSfghYEL1Q>
X-ME-Received: <xmr:SvxIYZArrxeoKSowR3xIM7iucgEBrsqP3y96noTubNXQwy3MMLQSSHnoIGnz94lvXMXyUj08>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudeivddgudehlecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhepfffhvffukfhfgggtuggjsehttd
 ertddttdejnecuhfhrohhmpefhvghrnhgrnhguohcutfgrmhhoshcuoehgrhgvvghnfhho
 ohesuhelvddrvghuqeenucggtffrrghtthgvrhhnpedvjeeifeelhfetiefhhfdthfefke
 fhhfeutdetvdfgvefgveefheffgfekjeefheenucevlhhushhtvghrufhiiigvpedtnecu
 rfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvvghnfhhoohesuhelvddrvghu
X-ME-Proxy: <xmx:SvxIYXdYXMRZ0FKBeMVhN17WTZvhEpWL2Yj5nRDic3kSBqDeyY_H4g>
 <xmx:SvxIYQNZxI6Eiljl_BP_kv2DzxGV3Hrcbf9AGmdTrdbaPqAM5R83Zw>
 <xmx:SvxIYZk0PVsalhpoyFR0uPrwJJnzF_M7F_mQGyC2mlSLjujPt_T2Ug>
 <xmx:S_xIYREyT86uoIjKzNQk2NcGSP8U-MKgIMOwk712MBk4AtGVUt2psHpZW2g>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 20 Sep 2021 17:25:27 -0400 (EDT)
Date: Mon, 20 Sep 2021 23:25:24 +0200
From: Fernando Ramos <greenfoo@u92.eu>
To: kernel test robot <lkp@intel.com>
Cc: dri-devel@lists.freedesktop.org, kbuild-all@lists.01.org,
 linux-kernel@vger.kernel.org, sean@poorly.run,
 linux-doc@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 03/15] dmr/msm: cleanup: drm_modeset_lock_all_ctx() -->
 DRM_MODESET_LOCK_ALL_BEGIN()
Message-ID: <YUj8RHdl7aIONPa0@zacax395.localdomain>
References: <20210916211552.33490-4-greenfoo@u92.eu>
 <202109200942.M3etmn3s-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <202109200942.M3etmn3s-lkp@intel.com>
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

On 21/09/20 09:54AM, kernel test robot wrote:
> 
> [auto build test ERROR on drm-exynos/exynos-drm-next]
> [also build test ERROR on tegra-drm/drm/tegra/for-next linus/master v5.15-rc2 next-20210917]

I forgot to #include <drm/drm_drv.h> for those platforms and didn't notice
because I only tried to build for X86. I'll fix it.


> [cannot apply to drm-intel/for-linux-next tegra/for-next drm-tip/drm-tip airlied/drm-next]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base'.

I built this patch against drm-next, which currently points to v5.15-rc1.

Should I be targeting a different branch? In any case, as suggested, I'll
remember to use "--base" in the future to make it easier to apply. Thanks for
the hint.


> All errors (new ones prefixed by >>):
> 
>    In file included from include/drm/drm_crtc.h:36,
>                     from include/drm/drm_atomic_helper.h:31,
>                     from drivers/gpu/drm/msm/disp/msm_disp_snapshot.h:9,
>                     from drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c:8:
>    drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c: In function 'msm_disp_capture_atomic_state':
> >> include/drm/drm_modeset_lock.h:167:14: error: implicit declaration of function 'drm_drv_uses_atomic_modeset' [-Werror=implicit-function-declaration]
>      167 |         if (!drm_drv_uses_atomic_modeset(dev))                          \
>          |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>    drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c:108:9: note: in expansion of macro 'DRM_MODESET_LOCK_ALL_BEGIN'
>      108 |         DRM_MODESET_LOCK_ALL_BEGIN(ddev, ctx, 0, ret);
>          |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
>    cc1: some warnings being treated as errors

Out of curiosity: The top comment says there were two build errors (one on
exynos and another one on tegra), but there is only one reported bug (on msm).

Is this because the bot only reports the first error found? Is there a link to
a report with each of the build errors on each of the platforms?

Thanks.
