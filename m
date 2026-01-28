Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QKzeIJvueWm41AEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 12:10:19 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3575DA016C
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 12:10:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 706E310E670;
	Wed, 28 Jan 2026 11:10:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="e7TIY0mV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31FFD10E670
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jan 2026 11:10:14 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20260128111012euoutp016d2a09809bf77a1875a912ce6ce12348~O4I-t_EPk3202032020euoutp01S
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jan 2026 11:10:12 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20260128111012euoutp016d2a09809bf77a1875a912ce6ce12348~O4I-t_EPk3202032020euoutp01S
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1769598612;
 bh=45jaImfVH7kr/nS0FqB71oJKgUEPUgwMAJFDZ02gS2I=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=e7TIY0mVVbHRZJQwi+WMMav97sC49+KwDu2GGaWW+C4sNN0zeUrKZUzpkRdRKQvkw
 pHI9z2tl4ich1br8bHnxz0ndvvkghRdfemCwwnPSD6jHa2qm4m+aRTMOnow5zvN4O0
 mdJv583zDVUIh3mIu+McfZ/J0GXG6r57pO1WsQn0=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20260128111011eucas1p2b98d9b06481ae6d47968b83ec0ed491c~O4I-SdpCE2976529765eucas1p2U;
 Wed, 28 Jan 2026 11:10:11 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20260128111011eusmtip1807cf713c50c74db811a812a02bdb2e4~O4I_kWAQE1268412684eusmtip1Y;
 Wed, 28 Jan 2026 11:10:11 +0000 (GMT)
Message-ID: <b05f6b30-04b7-4b88-b0b0-40dfdea4944b@samsung.com>
Date: Wed, 28 Jan 2026 12:10:10 +0100
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH 0/3] Fixes and enhancements for Exynos (7870) DSIM
 bridge driver
To: Kaustabh Chakraborty <kauschluss@disroot.org>, Inki Dae
 <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>, Andrzej
 Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20260124-exynos-dsim-fixes-v1-0-122d047a23d1@disroot.org>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20260128111011eucas1p2b98d9b06481ae6d47968b83ec0ed491c
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260124172131eucas1p2bd0fa9cde2981c87238deb67cf5f0554
X-EPHeader: CA
X-CMS-RootMailID: 20260124172131eucas1p2bd0fa9cde2981c87238deb67cf5f0554
References: <CGME20260124172131eucas1p2bd0fa9cde2981c87238deb67cf5f0554@eucas1p2.samsung.com>
 <20260124-exynos-dsim-fixes-v1-0-122d047a23d1@disroot.org>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.20 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[samsung.com,none];
	R_DKIM_ALLOW(-0.20)[samsung.com:s=mail20170921];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:kauschluss@disroot.org,m:inki.dae@samsung.com,m:jagan@amarulasolutions.com,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[disroot.org,samsung.com,amarulasolutions.com,intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[m.szyprowski@samsung.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[m.szyprowski@samsung.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[samsung.com:+];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[samsung.com:email,samsung.com:dkim,samsung.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 3575DA016C
X-Rspamd-Action: no action

On 24.01.2026 18:20, Kaustabh Chakraborty wrote:
> Since v6.17, there were a few regressive changes for the Exynos 7870
> DSIM driver. These changes resulted in weird artifacts on the display,
> such as random RGB channel swaps and random aberration (the occurrences
> of both were mutually exclusive).
>
> The first two commits of this patch series address the aforementioned
> changes.
>
> The third patch replaces an implicit loop for waiting for PLL
> stabilization with an interrupt-based solution, which should be more
> reliable. This solution was suggested by Inki Dae in a discussion of an
> earlier patch series sent by me. For further details, refer to its
> commit description.
>
> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>

Works fine on legacy Exynos based boards in my test lab.

Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>

> ---
> Kaustabh Chakraborty (3):
>        drm/bridge: samsung-dsim: move bridge init sequence to atomic_enable
>        drm/bridge: samsung-dsim: enable MFLUSH_VS for Exynos 7870 DSIM
>        drm/bridge: samsung-dsim: use DSIM interrupt to wait for PLL stability
>
>   drivers/gpu/drm/bridge/samsung-dsim.c | 61 +++++++++++++++++++++++------------
>   include/drm/bridge/samsung-dsim.h     |  1 +
>   2 files changed, 42 insertions(+), 20 deletions(-)
> ---
> base-commit: ca3a02fda4da8e2c1cb6baee5d72352e9e2cfaea
> change-id: 20260124-exynos-dsim-fixes-5383d6a6f073
>
> Best regards,

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

