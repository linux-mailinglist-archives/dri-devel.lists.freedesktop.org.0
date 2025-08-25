Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADB6DB34397
	for <lists+dri-devel@lfdr.de>; Mon, 25 Aug 2025 16:26:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2FC510E4AC;
	Mon, 25 Aug 2025 14:25:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="QkKS3Urm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB03510E4AC
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 14:25:52 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20250825142551euoutp017ea00bf4bd9c2fd9c7275a78d579cfaf~fCLSJCc-T1794817948euoutp01Y
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 14:25:51 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20250825142551euoutp017ea00bf4bd9c2fd9c7275a78d579cfaf~fCLSJCc-T1794817948euoutp01Y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1756131951;
 bh=g3XJAjkAnzmoOp83cZ+/QTzl+YqbNa+8BJauT66leBE=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=QkKS3UrmhpcD7fFMVhrCCHevrHqDbSbdEKM13h/uKfWCrmqZ3csjBPCt9AVs+COOU
 hLaE25Hoq8Zbdv/Jkxv++kPM6aadXAV3AKIbABOE5NFNsgQbkY5DF5XXJR87Tdm4Ts
 6UUUIC8MYdbf3A3F9UqM3ITrTU660NbrslIYHcGE=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20250825142550eucas1p2a783ce9d7b9c9b3cc276a567c09d53bd~fCLRke9wg0835608356eucas1p2s;
 Mon, 25 Aug 2025 14:25:50 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20250825142548eusmtip19c6a58beda39ce7e243556a6f67cfe22~fCLP0ynBY2717327173eusmtip1-;
 Mon, 25 Aug 2025 14:25:48 +0000 (GMT)
Message-ID: <a9ae1238-e95d-46d8-9bc4-0ef5ec7c34bb@samsung.com>
Date: Mon, 25 Aug 2025 16:25:47 +0200
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH v1 0/4] Apply DP helper APIs to do link train
To: Damon Ding <damon.ding@rock-chips.com>, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org
Cc: Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 dmitry.baryshkov@oss.qualcomm.com, dianders@chromium.org,
 andy.yan@rock-chips.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20250824084529.3317985-1-damon.ding@rock-chips.com>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20250825142550eucas1p2a783ce9d7b9c9b3cc276a567c09d53bd
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250824084543eucas1p10fcc1e6656f3cc3909d457ae9e0199f2
X-EPHeader: CA
X-CMS-RootMailID: 20250824084543eucas1p10fcc1e6656f3cc3909d457ae9e0199f2
References: <CGME20250824084543eucas1p10fcc1e6656f3cc3909d457ae9e0199f2@eucas1p1.samsung.com>
 <20250824084529.3317985-1-damon.ding@rock-chips.com>
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

On 24.08.2025 10:45, Damon Ding wrote:
> Use the existing DP helper APIs instead of repeated self-defined
> interfaces with the same functions. It can help make codes more
> concise.
>
> Damon Ding (4):
>    drm/bridge: analogix_dp: Apply DP helper API
>      drm_dp_dpcd_read_link_status()
>    drm/bridge: analogix_dp: Apply DP helper API
>      drm_dp_clock_recovery_ok()
>    drm/bridge: analogix_dp: Apply DP helper API drm_dp_channel_eq_ok()
>    drm/bridge: analogix_dp: Apply DP helper APIs to get adjusted voltages
>      and pre-emphasises
>
>   .../drm/bridge/analogix/analogix_dp_core.c    | 123 +++---------------
>   1 file changed, 18 insertions(+), 105 deletions(-)

Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

