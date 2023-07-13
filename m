Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 88AFA751B6B
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 10:23:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A11BC10E189;
	Thu, 13 Jul 2023 08:23:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 922C210E189
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 08:23:31 +0000 (UTC)
Received: from eldfell (unknown [194.136.85.206])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested) (Authenticated sender: pq)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 404686607048;
 Thu, 13 Jul 2023 09:23:30 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1689236610;
 bh=B9MNjPKQd47lnj+EEacT5SWWIETPN7LjyQTENu4YU9s=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=JBU971pjpQQBW3ibU0A/ttwyduL3kox2UEB+sYRJUPObtjBqIvm7BO/fqIsvIKipG
 V5CXnMYb3JjvaynAMwmqg3PJNHCrTdoBPVs2XOr3QaSs/Iom/JFXx52bEuXXu0XPND
 UzpNRttuxx9fJJCJDaNoWaiuGHYRAhefE59kn40FywJgo3jmgnK1I9ha7RuUAFaUuD
 xbsQqSZ3sHJqK9tfEjescBVB4FGE/nhJrVKBVeNuFfPci7v8/ztClLgNTVP+WdvubG
 kHtofoSdlhOFqYtJ+5zwGFBBjbCTFFp2cAyiGQ468lNJIyNRMHiaFsCEfyimgjVVvr
 V4yBPxaVNKJUg==
Date: Thu, 13 Jul 2023 11:23:27 +0300
From: Pekka Paalanen <pekka.paalanen@collabora.com>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH 4/4] drm/doc: document front-buffer rendering
Message-ID: <20230713112327.560f89e4.pekka.paalanen@collabora.com>
In-Reply-To: <20230712135723.173506-4-contact@emersion.fr>
References: <20230712135723.173506-1-contact@emersion.fr>
 <20230712135723.173506-4-contact@emersion.fr>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 12 Jul 2023 13:57:34 +0000
Simon Ser <contact@emersion.fr> wrote:

> Explain how to perform front-buffer rendering.
> 
> Signed-off-by: Simon Ser <contact@emersion.fr>
> Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> ---
>  drivers/gpu/drm/drm_blend.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_blend.c b/drivers/gpu/drm/drm_blend.c
> index 6e74de833466..6c55f1da2480 100644
> --- a/drivers/gpu/drm/drm_blend.c
> +++ b/drivers/gpu/drm/drm_blend.c
> @@ -75,6 +75,9 @@
>   * 	the currently visible vertical area of the &drm_crtc.
>   * FB_ID:
>   * 	Mode object ID of the &drm_framebuffer this plane should scan out.
> + *
> + * 	To perform front-buffer rendering, user-space should set FB_ID to the
> + * 	previous framebuffer in atomic commits.
>   * CRTC_ID:
>   * 	Mode object ID of the &drm_crtc this plane should be connected to.
>   *

It's unclear to me what "previous framebuffer" means, although I know
what you want to say. How about:

When a KMS client is front-buffer rendering, it should set FB_ID to
the same front-buffer FB on each atomic commit. This implies to the
driver that it needs to re-read the same FB again. Otherwise drivers
who do not employ continuously repeated scanout cycles might not update
the screen.


Btw. is it enough to set only FB_DAMAGE_CLIPS and not touch FB_ID?


Thanks,
pq
