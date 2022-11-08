Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 10E66621EE5
	for <lists+dri-devel@lfdr.de>; Tue,  8 Nov 2022 23:14:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C29EF10E061;
	Tue,  8 Nov 2022 22:13:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2d.google.com (mail-oa1-x2d.google.com
 [IPv6:2001:4860:4864:20::2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 750F310E2E0
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Nov 2022 22:13:49 +0000 (UTC)
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-13ba86b5ac0so17825324fac.1
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Nov 2022 14:13:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3inWEp32raCanb95NHICYuk6LeUI70UmWiUcVtx1Q6Q=;
 b=YMaJPs6+P9K3kMaGBA6eY7Ds//U4U/wIZfX5ZdQcq0lFw6FL5ptonQKMV3mDDbpmXm
 tw1KNdSWkL+VqRuySN7swl3r5k3jDlrr+LinAdUAO6YXcfZED5KXOpJ2TXvq7gGGRVPs
 C/Q/VqiD+4iHNCds7nIIWOTJusIhZl1HhmqRRXqMEBWB9Tj/oX02MYrmrE6D05o0rXZe
 MjSPKf2Kei6ses53gTCTjBT/USiAhHCRulYWrqzsjs3t64Vbi6dtn2+5uLQBg243pQM+
 2ggNVeKPTIsxxN08Ev9zexP8R73fIx/bsnSTS2zb/Kfhvqzwvvi5OkZ8ERutiLuwDaKD
 BjEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3inWEp32raCanb95NHICYuk6LeUI70UmWiUcVtx1Q6Q=;
 b=nV2IpPY6ggoDamqXR2/UXuNOaL3l451yCD5Cz7efBjGCKuxqpvbghctvt16sQy02rv
 CqfWAPKPSOHSwH2gbkNY2L2imbUo0bEITvkxQnWkSvvFe38IAV5nwXoqvpXcPPkwYLjE
 x9I49TRhN2ro8LvDBglLrMToe/77BPqzlHbLbHo+d7+5QcMjyiS+KuVhSu1seCszHOYF
 wN3u1mjIWL73uJsqC7kIlHxhEAS5t7gAhmjgBNotcPDW+1SP4bGtcFRqUIWEeUPfeXtt
 VPQF2DTzJwXRDDw1d+VNux00ABo6IH2u+zTIvACH2MvIs7k0r81zvFTAoThCYKtRhoQG
 Mkwg==
X-Gm-Message-State: ACrzQf2fIWiW6Eu0c6J1VS4ntEGLo+UbBVKYcHPeQv5BkTiONF0kUBvJ
 Y67hFJ6/JliP+dR7raMA3D+d7oUY+09jyjqtL5E=
X-Google-Smtp-Source: AMsMyM50Utsc0YnpjJIcIci7MV1MXWs3tfJzUKdyKQ4QztwwKs4MyahEBqkpV0fIOtE7HrI2xNJEOoMKmHvsfqjaWhw=
X-Received: by 2002:a05:6870:a7a4:b0:136:7c39:979e with SMTP id
 x36-20020a056870a7a400b001367c39979emr34776653oao.96.1667945628583; Tue, 08
 Nov 2022 14:13:48 -0800 (PST)
MIME-Version: 1.0
References: <20221107192545.9896-1-ville.syrjala@linux.intel.com>
 <Y2p7l/6hy8NxO2rP@phenom.ffwll.local>
In-Reply-To: <Y2p7l/6hy8NxO2rP@phenom.ffwll.local>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 8 Nov 2022 17:13:37 -0500
Message-ID: <CADnq5_MA1CxFi6ySwsLKVmaZmh9KrB9m83OKiT00xYRdzjpuog@mail.gmail.com>
Subject: Re: [PATCH v2 0/7] drm: Review of mode copies
To: Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Tue, Nov 8, 2022 at 10:54 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Mon, Nov 07, 2022 at 09:25:38PM +0200, Ville Syrjala wrote:
> > From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> >
> > Repost of the stragglers from
> > https://patchwork.freedesktop.org/series/100393/
> >
> > Note that I didn't rerun the cocci stuff, nor have I had
> > time to come up with something to inluce the cocci scripts
> > in the tree. So it's possible this is missing some new
> > things that have snuck in the meantime.
> >
> > Ville Syrj=C3=A4l=C3=A4 (7):
> >   drm/amdgpu: Use drm_mode_init() for on-stack modes
> >   drm/hisilicon: Use drm_mode_init() for on-stack modes
> >   drm/msm: Use drm_mode_init() for on-stack modes
> >   drm/msm: Use drm_mode_copy()
> >   drm/mtk: Use drm_mode_init() for on-stack modes
> >   drm/rockchip: Use drm_mode_copy()
> >   drm/sti: Use drm_mode_copy()
>
> On the series:
>
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>
> Imo ping Alex/Rob and stuff everything left into drm-misc-next.

Acked-by: Alex Deucher <alexander.deucher@amd.com>
Feel free to take this series through whatever tree makes sense.  If
you want me to pick up the amdgpu change directly, I can do that too.

Alex

> -Daniel
>
> >
> >  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c    | 3 ++-
> >  drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c         | 2 +-
> >  drivers/gpu/drm/mediatek/mtk_hdmi.c                  | 2 +-
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 7 +++++--
> >  drivers/gpu/drm/msm/dp/dp_display.c                  | 2 +-
> >  drivers/gpu/drm/rockchip/cdn-dp-core.c               | 2 +-
> >  drivers/gpu/drm/rockchip/inno_hdmi.c                 | 2 +-
> >  drivers/gpu/drm/rockchip/rk3066_hdmi.c               | 2 +-
> >  drivers/gpu/drm/sti/sti_dvo.c                        | 2 +-
> >  drivers/gpu/drm/sti/sti_hda.c                        | 2 +-
> >  drivers/gpu/drm/sti/sti_hdmi.c                       | 2 +-
> >  11 files changed, 16 insertions(+), 12 deletions(-)
> >
> > --
> > 2.37.4
> >
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
