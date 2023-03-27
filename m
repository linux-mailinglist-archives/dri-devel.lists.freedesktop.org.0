Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BE8066CAB15
	for <lists+dri-devel@lfdr.de>; Mon, 27 Mar 2023 18:52:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C59410E650;
	Mon, 27 Mar 2023 16:52:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [IPv6:2607:f8b0:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3296710E650
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Mar 2023 16:52:43 +0000 (UTC)
Received: by mail-ot1-x32b.google.com with SMTP id
 61-20020a9d02c3000000b0069fe8de3139so4896373otl.1
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Mar 2023 09:52:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1679935962;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=q1qWTShqBaYxV3xaj+I2aKT/emWe4vFrxFvJqYnKTHM=;
 b=gEQ2DMylLmcJYM0V68Q35myKOeuEsz9k2bl0j7j5pmDTPkeNQRioxQnwCfTo0ew/jb
 RmU1LOVT2Fb5YBqegsuOekQHSAEOGivXOodKzi/Ld/JarlOG5sDsai9ZapNnzmggppuX
 UOZn1YD5Hm3IDzriwg4fIUr/nXMWoz+GJmgLo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679935962;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=q1qWTShqBaYxV3xaj+I2aKT/emWe4vFrxFvJqYnKTHM=;
 b=RiUrVO3G/kAftEUVWfHRG0GtkMmJbOXsSejHRxufddhqah12qxcKR2bjvvfZBMZRZp
 YIM1JIZezeUzmcP5/8RJ1Vij8ZGN2mZKeeRaGmQC7a3l6vElCw/nm1GlyD8tdJbkMG9H
 XFbq7lxdmL/GLkiqmmU9oyj0UZd45YqA2J1jVyN6TGlCNKv0wCGYBwUSks64izsSkyHn
 kNBinDDmXtjtkWYJRvTQwhvyT5pA9twIK8rj+Nbm0qi0UCPgiCH/o8S20U47smIGZNos
 Nij/MTVQVM5uz4EQd2KkrIYWEELy2naPe/buyUSH8h7eSTSm5SUDAlbDeZZED7XuNDZT
 vlsQ==
X-Gm-Message-State: AO0yUKWK7RjS3kQL1l2MMib46oYM1DAu/nBQKUF+kux2Pkd10EcfjpeW
 7n8ID26nOb94Fou0/klPVT83S9ps0p+opSZ2yOILRw==
X-Google-Smtp-Source: AKy350bd0jD+yAbtcLCmHrO2H263R0T1ICEdtn0rpjT7I5LO5AUumJo49hQLAx/TYMroVzE1hxKbi+r0T4gbi3pnrCI=
X-Received: by 2002:a05:6830:1bfc:b0:69d:3794:b863 with SMTP id
 k28-20020a0568301bfc00b0069d3794b863mr4240271otb.6.1679935962420; Mon, 27 Mar
 2023 09:52:42 -0700 (PDT)
MIME-Version: 1.0
References: <20230325204922.GD19335@pendragon.ideasonboard.com>
In-Reply-To: <20230325204922.GD19335@pendragon.ideasonboard.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Mon, 27 Mar 2023 18:52:31 +0200
Message-ID: <CAKMK7uFTg1OyaujDDnCwrHno8LgKbHvEmgx=G1UkA9B=fpnHiw@mail.gmail.com>
Subject: Re: [GIT PULL FOR v6.4] drm: rcar-du: Miscellaneous fixes and
 improvements
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 25 Mar 2023 at 21:49, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hello,
>
> The following changes since commit 7ed34927254ae9eac0f6b0ad7e7c2bceb96fcdfc:
>
>   Merge tag 'drm-intel-next-2023-03-23' of git://anongit.freedesktop.org/drm/drm-intel into drm-next (2023-03-24 20:22:03 +0100)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git tags/drm-rcar-next-20230325

Pulled, thanks

>
> for you to fetch changes up to 40f43730f43699ce8557e4fe59622d4f4b69f44a:
>
>   drm: rcar-du: Fix a NULL vs IS_ERR() bug (2023-03-25 22:38:10 +0200)
>
> ----------------------------------------------------------------
> drm: rcar-du: Miscellaneous fixes and improvements
>
> ----------------------------------------------------------------
> Dan Carpenter (1):
>       drm: rcar-du: Fix a NULL vs IS_ERR() bug
>
> Laurent Pinchart (7):
>       drm: rcar-du: lvds: Call function directly instead of through pointer
>       drm: rcar-du: lvds: Move LVDS enable code to separate code section
>       drm: rcar-du: lvds: Fix LVDS PLL disable on D3/E3
>       drm: rcar-du: Don't write unimplemented ESCR and OTAR registers on Gen3
>       drm: rcar-du: Disable alpha blending for DU planes used with VSP
>       drm: rcar-du: Rename DORCR fields to make them 0-based
>       drm: rcar-du: Write correct values in DORCR reserved fields
>
>  drivers/gpu/drm/rcar-du/rcar_du_crtc.c    |  38 +++++--
>  drivers/gpu/drm/rcar-du/rcar_du_encoder.c |   4 +-
>  drivers/gpu/drm/rcar-du/rcar_du_group.c   |  16 ++-
>  drivers/gpu/drm/rcar-du/rcar_du_regs.h    |  26 ++---
>  drivers/gpu/drm/rcar-du/rcar_du_vsp.c     |   2 +-
>  drivers/gpu/drm/rcar-du/rcar_lvds.c       | 176 +++++++++++++++++-------------
>  drivers/gpu/drm/rcar-du/rcar_lvds.h       |  12 +-
>  7 files changed, 163 insertions(+), 111 deletions(-)
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
