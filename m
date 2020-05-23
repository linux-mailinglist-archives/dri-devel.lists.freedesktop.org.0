Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 911A01E07B1
	for <lists+dri-devel@lfdr.de>; Mon, 25 May 2020 09:21:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1A6489D3E;
	Mon, 25 May 2020 07:21:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x141.google.com (mail-il1-x141.google.com
 [IPv6:2607:f8b0:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A935A6EA45
 for <dri-devel@lists.freedesktop.org>; Sat, 23 May 2020 09:38:43 +0000 (UTC)
Received: by mail-il1-x141.google.com with SMTP id c20so13250198ilk.6
 for <dri-devel@lists.freedesktop.org>; Sat, 23 May 2020 02:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ySOv5RFCOhNktqRnSUecG+h4XEMSSgtZIHTThacyrl4=;
 b=ZXyua9PiZh0B75CZ+wJJFbfRSHWNfEdmJG5gqb7VI4LU8BqFGnO8YgcvZZ0GAqcGjE
 KX+7b/V+awdlA48iOHjoSHYEiSgeqyhJVm9gaxlql1bRKv8Oz5DRsnTXZ43I65wYqPLK
 uWfkCx8oLLmUTWwYp6k8iCRtST2/u1tPVai3/4A1wyZBozQ0VNpEz99/9QjjcQVXM2QR
 P2+pYH4LqpepHkBrWOU+EzHTPfW42I+705YQv/OXS1POu52dVPCOQFN7btxk8VOkckse
 qCIXdqbsJuxDTw1PBbV6S3chJbH1DoEPjZGJzUkSr4As3rhhvWx+HcNkR6xmSO1tVCtq
 J8Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ySOv5RFCOhNktqRnSUecG+h4XEMSSgtZIHTThacyrl4=;
 b=ShTsYxBG3qMKysj+Ig6BCQSjSu9jEYXUWfWWnJDzqV39zqRQVwlUFZs1Ec5RHvKYFg
 2HOu2y5pCo+rwYw4EUyKv91NUGNlaH402vDt9zsDjY1QjKhGlAH0pHREBB/z6mfSMy1n
 9kfB3Jl4ZyFEtKjSlKPBmdNXpIIPKPmoLIGt6HwjIpUPlpRvXQQ8dUZtx/cE2tIC38UC
 vtaQEYft2c/VtAUtMXnfLOWiMDoTFpMsWgKLoZ6CM/ni3ib9hzFFN3BnW/2XgTRi4TVM
 gQ2Gd0HxtFGsC191oWKy2yCNQ9zb2LFH/Ksv1n/SoFTJ7lBt9Ad7c2xUfXFI3Gyt3N6H
 ymxA==
X-Gm-Message-State: AOAM530vOMFmwFNBHjQzrFn5KeIKc8TqR8rif5cj4fEqwAKW71qDP0Oh
 6yKgbcz97ICYG3I8PKfqTxOOrXkGWjzSGUlb9sc=
X-Google-Smtp-Source: ABdhPJxgpTkyq+JCvO/9xevE2z4ZZX7u3mZjbSC4yXtpeOEmIaWlllSlL5fpKL/h6v2R/KBjV/68cLBWj/+cHclL77w=
X-Received: by 2002:a92:5dd2:: with SMTP id e79mr15635058ilg.94.1590226723047; 
 Sat, 23 May 2020 02:38:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200518201646.48312-1-dagmcr@gmail.com>
 <20200522202349.GF5824@pendragon.ideasonboard.com>
In-Reply-To: <20200522202349.GF5824@pendragon.ideasonboard.com>
From: Daniel G <dagmcr@gmail.com>
Date: Sat, 23 May 2020 11:38:32 +0200
Message-ID: <CAPsT6hmddjW3m3OMkkAT1djTTtijepTu_N22eCgOGhGHxPQcaA@mail.gmail.com>
Subject: Re: [PATCH] drm: rcar-du: Fix build error
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
X-Mailman-Approved-At: Mon, 25 May 2020 07:21:04 +0000
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
Cc: airlied@linux.ie, open list <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 kieran.bingham+renesas@ideasonboard.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent,

On Fri, 22 May 2020 at 22:24, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Daniel,
>
> Thank you for the patch.
>
> On Mon, May 18, 2020 at 10:16:46PM +0200, Daniel Gomez wrote:
> > Select DRM_KMS_HELPER dependency.
> >
> > Build error when DRM_KMS_HELPER is not selected:
> >
> > drivers/gpu/drm/rcar-du/rcar_lvds.o:(.rodata+0xd48): undefined reference to `drm_atomic_helper_bridge_duplicate_state'
> > drivers/gpu/drm/rcar-du/rcar_lvds.o:(.rodata+0xd50): undefined reference to `drm_atomic_helper_bridge_destroy_state'
> > drivers/gpu/drm/rcar-du/rcar_lvds.o:(.rodata+0xd70): undefined reference to `drm_atomic_helper_bridge_reset'
> > drivers/gpu/drm/rcar-du/rcar_lvds.o:(.rodata+0xdc8): undefined reference to `drm_atomic_helper_connector_reset'
> > drivers/gpu/drm/rcar-du/rcar_lvds.o:(.rodata+0xde0): undefined reference to `drm_helper_probe_single_connector_modes'
> > drivers/gpu/drm/rcar-du/rcar_lvds.o:(.rodata+0xe08): undefined reference to `drm_atomic_helper_connector_duplicate_state'
> > drivers/gpu/drm/rcar-du/rcar_lvds.o:(.rodata+0xe10): undefined reference to `drm_atomic_helper_connector_destroy_state'
> >
Fixes: c6a27fa41fab ("drm: rcar-du: Convert LVDS encoder code to bridge driver")
> > Signed-off-by: Daniel Gomez <dagmcr@gmail.com>
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>
> and taken in my tree for v5.9. If you think it should get in v5.8 as a
> fix, I can do so as well, could you then provide a Fixes: tag ?
That would be fine. You can find above the fixes tag.
Thanks!

>
> > ---
> >  drivers/gpu/drm/rcar-du/Kconfig | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/gpu/drm/rcar-du/Kconfig b/drivers/gpu/drm/rcar-du/Kconfig
> > index 0919f1f159a4..f65d1489dc50 100644
> > --- a/drivers/gpu/drm/rcar-du/Kconfig
> > +++ b/drivers/gpu/drm/rcar-du/Kconfig
> > @@ -31,6 +31,7 @@ config DRM_RCAR_DW_HDMI
> >  config DRM_RCAR_LVDS
> >       tristate "R-Car DU LVDS Encoder Support"
> >       depends on DRM && DRM_BRIDGE && OF
> > +     select DRM_KMS_HELPER
> >       select DRM_PANEL
> >       select OF_FLATTREE
> >       select OF_OVERLAY
>
> --
> Regards,
>
> Laurent Pinchart
Daniel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
