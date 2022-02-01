Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DC614A585F
	for <lists+dri-devel@lfdr.de>; Tue,  1 Feb 2022 09:17:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A918610E664;
	Tue,  1 Feb 2022 08:17:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5CDC10E3F7;
 Tue,  1 Feb 2022 08:17:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643703427; x=1675239427;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=iqhdZVh6uZFq7XPDlrunPhgGdM19077fYIJDUWkCetM=;
 b=Fd0Tlf0DT2mF5hKvC1StU8w8IREUZrzaw/fqFOmS5kngnqGRu5LDwEKa
 gqvrGm23PR/f2lg3RRYoAeicml3mkVYWF0n78nFaeI3odDSUQPr9ffff9
 6o/VWC1MApBY41Y7ZLaxjEiWyE2O9Mzw7XzbmmtaLH8aV+KmQMf8DDjlC
 +ibu1/jPOqlFAVI/C3UaKf7ZQjfiyx3XiZnWMjKcRILM1U6QNNHRBFzK+
 QY9uDqKtdNjo0w1TS12Kcv/n0Dl1pBURJlbYpBBa1EXWcxMgmvOO3jiGt
 lFjEKwHqYVVfq8lVBPXLZfsUqn7+cE7/6jR4t51LKJCuv118LJBM+fUUE w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10244"; a="235035104"
X-IronPort-AV: E=Sophos;i="5.88,333,1635231600"; d="scan'208";a="235035104"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2022 00:17:07 -0800
X-IronPort-AV: E=Sophos;i="5.88,333,1635231600"; d="scan'208";a="537710487"
Received: from tveit-mobl1.ger.corp.intel.com (HELO [10.252.37.11])
 ([10.252.37.11])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2022 00:17:04 -0800
Message-ID: <5f628861-1969-f313-f931-cf8608ef6acf@linux.intel.com>
Date: Tue, 1 Feb 2022 09:17:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.1
Subject: Re: [PULL] drm-misc-next
Content-Language: en-US
To: Dave Airlie <airlied@gmail.com>
References: <456a23c6-7324-7543-0c45-751f30ef83f7@linux.intel.com>
 <CAPM=9twqNAQ0+O40SPJOZk=RHkBo5sdHUSWdbaga25Xh8gLs3A@mail.gmail.com>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <CAPM=9twqNAQ0+O40SPJOZk=RHkBo5sdHUSWdbaga25Xh8gLs3A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 "DRM maintainer tools announcements, discussion,
 and development" <dim-tools@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Op 01-02-2022 om 07:38 schreef Dave Airlie:
> On Thu, 27 Jan 2022 at 21:57, Maarten Lankhorst
> <maarten.lankhorst@linux.intel.com> wrote:
>> Hi Dave & Daniel,
>>
>> First pull for v5.18
> I was trying to be all efficient and get this pulled in time for once.
>
>
> However it broke building on my arm test build.
>
> The new DP helper Kconfig is wrong somewhere.
>
> I've attached the .config, but it appears I get DRM_DP_HELPER set to M
> but ANALOGIX_DP set to Y and it fails to link because the dp helper
> should be Y.
>
> Regards,
> Dave.
Below should likely fix it?

diff --git a/drivers/gpu/drm/exynos/Kconfig b/drivers/gpu/drm/exynos/Kconfig
index 6a251e3aa779..f27cfd2a9726 100644
--- a/drivers/gpu/drm/exynos/Kconfig
+++ b/drivers/gpu/drm/exynos/Kconfig
@@ -66,6 +66,7 @@ config DRM_EXYNOS_DP
 	bool "Exynos specific extensions for Analogix DP driver"
 	depends on DRM_EXYNOS_FIMD || DRM_EXYNOS7_DECON
 	select DRM_ANALOGIX_DP
+	select DRM_DP_HELPER
 	default DRM_EXYNOS
 	select DRM_PANEL
 	help
diff --git a/drivers/gpu/drm/rockchip/Kconfig b/drivers/gpu/drm/rockchip/Kconfig
index d59dca5efb52..fa5cfda4e90e 100644
--- a/drivers/gpu/drm/rockchip/Kconfig
+++ b/drivers/gpu/drm/rockchip/Kconfig
@@ -8,6 +8,7 @@ config DRM_ROCKCHIP
 	select DRM_PANEL
 	select VIDEOMODE_HELPERS
 	select DRM_ANALOGIX_DP if ROCKCHIP_ANALOGIX_DP
+	select DRM_DP_HELPER if ROCKCHIP_ANALOGIX_DP
 	select DRM_DW_HDMI if ROCKCHIP_DW_HDMI
 	select DRM_DW_MIPI_DSI if ROCKCHIP_DW_MIPI_DSI
 	select GENERIC_PHY if ROCKCHIP_DW_MIPI_DSI

