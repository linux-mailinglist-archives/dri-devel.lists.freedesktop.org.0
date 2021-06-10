Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB5953A2D1D
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jun 2021 15:33:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1D7F6ED88;
	Thu, 10 Jun 2021 13:32:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF7CA6ED25
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jun 2021 13:32:56 +0000 (UTC)
Received: by mail-ot1-x334.google.com with SMTP id
 i12-20020a05683033ecb02903346fa0f74dso27475799otu.10
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jun 2021 06:32:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=HaTKjzpEYE9f/Zgjpq7w9l+zU6jPSmwwxyy38bU8mvc=;
 b=eMN9KN5OsCnPgwoztJUbq9mE84+FaD2dXDaqh+S9zwq409A4UjOf195PUeXISwuJNl
 wgeYu3DSPOc9QmHjEyPw0x4DipwXa5rvID2IaBY6bQc3uDg0YzUdwQhDkDI7E/87jPl3
 Z8gzYJS3V8qgVjrjcHu1liX9HUtKhFKtRrtEU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=HaTKjzpEYE9f/Zgjpq7w9l+zU6jPSmwwxyy38bU8mvc=;
 b=svNxOBSTvJo194iWFzLBMid988nGIrBa1o36G3Hm7g8KymjuwUX79CiWLEOKRiARj5
 P8VlZah64MgVP34hXbv1/mh8VcfRG/cPHkzulTCWzYdGS/4mR+lEkBOik5qGZcwb90l3
 jfkz7rNiUw7qLjao3zLkwpVhoutaL+gE/Qwdn8Ka7aoat5gUAL9eMcAmhyqQpZ7imVuA
 yoX904t3WcfVP0ZZWbiym1ShCC4vhsdkeOQU1jdisIT76trYAk9BFHu+cuysrwFbOwgH
 /pyoXp5OdMXZuWU61XIt0qOeLx3PaTxfG3CPGYKq8MEFxBFMpNBasTGoOSlwRRa71BtW
 OgTw==
X-Gm-Message-State: AOAM530Sf6KDwzpMq2U6y8TtLcupB6d0/VsjXDpfWG56GcREbDYa0Xol
 EBT7DxZFGSSLznqHDtqeX6HETZP2wt1Kv7Qu6Ku7QA==
X-Google-Smtp-Source: ABdhPJyHqbrb9MP+6FKVqqkNGWFzNGvVasUtKGknrcukhdSK3wAko57UQzmCT0TKCzkaCEqNputHMBWxhxyw7VN5HZU=
X-Received: by 2002:a9d:12eb:: with SMTP id g98mr2436395otg.303.1623331976142; 
 Thu, 10 Jun 2021 06:32:56 -0700 (PDT)
MIME-Version: 1.0
References: <YMH0ad8qoREx9YZK@linux-uq9g>
In-Reply-To: <YMH0ad8qoREx9YZK@linux-uq9g>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Thu, 10 Jun 2021 15:32:44 +0200
Message-ID: <CAKMK7uEtDw_OTgyTDHH6LhyccqsKWdrbwxQSztJdp=YefGWpeg@mail.gmail.com>
Subject: Re: [PULL] drm-misc-next
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: "DRM maintainer tools announcements, discussion,
 and development" <dim-tools@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 intel-gfx <intel-gfx@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 10, 2021 at 1:15 PM Thomas Zimmermann <tzimmermann@suse.de> wro=
te:
>
> Hi Dave and Daniel,
>
> here's the second PR for drm-misc-next for this week, and the final one
> for 5.14. I backmerged drm-next for the TTM changes. As for highlights
> nouveau now has eDP backlight support and udmabuf supports huge pages.

Why did you do this backmerge? It's done now so nothing to fix, but
I'm not really seeing the reason - the backmerge is the last patch
right before you've done the pull request.
-Daniel

>
> Best regards
> Thomas
>
> drm-misc-next-2021-06-10:
> drm-misc-next for 5.14:
>
> UAPI Changes:
>
> Cross-subsystem Changes:
>
>  * dma-buf: Support huge pages in udmabuf
>
> Core Changes:
>
>  * Backmerge of drm/drm-next
>
>  * drm/dp: Import eDP backlight code from i915
>
> Driver Changes:
>
>  * drm/bridge: TI SN65DSI83: Fix sparse warnings
>
>  * drm/i915: Cleanup eDP backlight code before moving it into helper
>
>  * drm/nouveau: Support DPCD backlights; Fix GEM init for internal BOs
> The following changes since commit c707b73f0cfb1acc94a20389aecde65e638534=
9b:
>
>   Merge tag 'amd-drm-next-5.14-2021-06-09' of https://gitlab.freedesktop.=
org/agd5f/linux into drm-next (2021-06-10 13:47:13 +1000)
>
> are available in the Git repository at:
>
>   git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-next-2021-06-1=
0
>
> for you to fetch changes up to 86441fa29e57940eeb00f35fefb1853c1fbe67bb:
>
>   Merge drm/drm-next into drm-misc-next (2021-06-10 12:18:54 +0200)
>
> ----------------------------------------------------------------
> drm-misc-next for 5.14:
>
> UAPI Changes:
>
> Cross-subsystem Changes:
>
>  * dma-buf: Support huge pages in udmabuf
>
> Core Changes:
>
>  * Backmerge of drm/drm-next
>
>  * drm/dp: Import eDP backlight code from i915
>
> Driver Changes:
>
>  * drm/bridge: TI SN65DSI83: Fix sparse warnings
>
>  * drm/i915: Cleanup eDP backlight code before moving it into helper
>
>  * drm/nouveau: Support DPCD backlights; Fix GEM init for internal BOs
>
> ----------------------------------------------------------------
> Christian K=C3=B6nig (1):
>       drm/nouveau: init the base GEM fields for internal BOs
>
> Lyude Paul (9):
>       drm/i915/dpcd_bl: Remove redundant AUX backlight frequency calculat=
ions
>       drm/i915/dpcd_bl: Handle drm_dpcd_read/write() return values correc=
tly
>       drm/i915/dpcd_bl: Cleanup intel_dp_aux_vesa_enable_backlight() a bi=
t
>       drm/i915/dpcd_bl: Cache some backlight capabilities in intel_panel.=
backlight
>       drm/i915/dpcd_bl: Move VESA backlight enabling code closer together
>       drm/i915/dpcd_bl: Return early in vesa_calc_max_backlight if we can=
't read PWMGEN_BIT_COUNT
>       drm/i915/dpcd_bl: Print return codes for VESA backlight failures
>       drm/dp: Extract i915's eDP backlight code into DRM helpers
>       drm/nouveau/kms/nv50-: Add basic DPCD backlight support for nouveau
>
> Marek Vasut (1):
>       drm/bridge: ti-sn65dsi83: Fix sparse warnings
>
> Thomas Zimmermann (1):
>       Merge drm/drm-next into drm-misc-next
>
> Vivek Kasireddy (1):
>       udmabuf: Add support for mapping hugepages (v4)
>
>  drivers/dma-buf/udmabuf.c                          |  50 ++-
>  drivers/gpu/drm/bridge/ti-sn65dsi83.c              |  21 +-
>  drivers/gpu/drm/drm_dp_helper.c                    | 347 +++++++++++++++=
++++++
>  drivers/gpu/drm/i915/display/intel_display_types.h |   2 +-
>  .../gpu/drm/i915/display/intel_dp_aux_backlight.c  | 329 +++------------=
----
>  drivers/gpu/drm/nouveau/dispnv50/disp.c            |  28 ++
>  drivers/gpu/drm/nouveau/nouveau_backlight.c        | 166 +++++++++-
>  drivers/gpu/drm/nouveau/nouveau_bo.c               |   6 +
>  drivers/gpu/drm/nouveau/nouveau_connector.h        |   9 +-
>  drivers/gpu/drm/nouveau/nouveau_encoder.h          |   1 +
>  include/drm/drm_dp_helper.h                        |  48 +++
>  11 files changed, 682 insertions(+), 325 deletions(-)
>
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
> (HRB 36809, AG N=C3=BCrnberg)
> Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer



--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
