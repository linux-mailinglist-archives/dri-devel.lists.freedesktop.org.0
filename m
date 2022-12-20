Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 449BA651CE3
	for <lists+dri-devel@lfdr.de>; Tue, 20 Dec 2022 10:10:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB3DB10E0B8;
	Tue, 20 Dec 2022 09:10:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com
 [209.85.219.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CA5310E0B8
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Dec 2022 09:10:01 +0000 (UTC)
Received: by mail-qv1-f52.google.com with SMTP id u10so7920155qvp.4
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Dec 2022 01:10:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2ZhjR6xVXhmmNThDy/2WcduVvAA5lIhOxqbWgZts2YU=;
 b=lNNVvMBcIoFmz4H8E8r3c4U+auYTHnFVGOfXqricHVHWtWCA8sel4xpHghHkB0kDq5
 JfOhJ92zF3dmf4F2eloQUaEs/cR+NE1lrc63GYP/gOdw+yrNoozzu1cJegqUpcUl+pbn
 kqoCLfTW/poFm567V72jHf6O99xJxYhcSOrZy/cFS/PLwuNmKwTSPEeLjatssPYCf8k3
 YxtYaIdUN7f92bnojtftoKYB62MiSXg78/FIfhdjSMTP2mDJSADy00SpzoEkvUG/izWy
 kJOKykpn2/cxgbg+UvHYcg5Np45m5/cZTt1dsBB5iUk8AVy4KzaDXoMQsji2OfOzzfEt
 S8UA==
X-Gm-Message-State: ANoB5pmaKRXkcZy1sMGnamVomTij4ESFkxKI7lUAkh0g71VDdoZ7h/Vy
 rpnJ9u53mCmI6q6PCEzA7iqZMVgMuJLy/g==
X-Google-Smtp-Source: AA0mqf5XLHyljY+/R61sORjwAM8AOjejSh8uDHY3NqDFTXPqrQ7R/P2Lygtv1j4K8UYhVdu70FbCuA==
X-Received: by 2002:ad4:42a9:0:b0:4c7:5f25:83fc with SMTP id
 e9-20020ad442a9000000b004c75f2583fcmr60446766qvr.6.1671527400509; 
 Tue, 20 Dec 2022 01:10:00 -0800 (PST)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com.
 [209.85.219.181]) by smtp.gmail.com with ESMTPSA id
 br12-20020a05620a460c00b006faf76e7c9asm8565837qkb.115.2022.12.20.01.10.00
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Dec 2022 01:10:00 -0800 (PST)
Received: by mail-yb1-f181.google.com with SMTP id j206so12277095ybj.1
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Dec 2022 01:09:59 -0800 (PST)
X-Received: by 2002:a25:7a02:0:b0:6f7:952d:b145 with SMTP id
 v2-20020a257a02000000b006f7952db145mr45769325ybc.604.1671527399695; Tue, 20
 Dec 2022 01:09:59 -0800 (PST)
MIME-Version: 1.0
References: <20221219140139.294245-1-tomi.valkeinen+renesas@ideasonboard.com>
 <20221219140139.294245-8-tomi.valkeinen+renesas@ideasonboard.com>
 <Y6Db2C+JehUPYSQp@pendragon.ideasonboard.com>
 <2f252958-1bb1-006a-b450-1315be8a3c9f@xs4all.nl>
In-Reply-To: <2f252958-1bb1-006a-b450-1315be8a3c9f@xs4all.nl>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 20 Dec 2022 10:09:46 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXd7Q1WWdo-rwfad1-BwuuH5vxt9Kx2Zv2Ok2rQLvh_wA@mail.gmail.com>
Message-ID: <CAMuHMdXd7Q1WWdo-rwfad1-BwuuH5vxt9Kx2Zv2Ok2rQLvh_wA@mail.gmail.com>
Subject: Re: [PATCH v2 7/7] drm: rcar-du: Add new formats (2-10-10-10 ARGB,
 Y210)
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
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
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, Nicolas Dufresne <nicolas@ndufresne.ca>,
 linux-renesas-soc@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Hans,

On Tue, Dec 20, 2022 at 10:01 AM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
> On 19/12/2022 22:47, Laurent Pinchart wrote:
> > (CC'ing Sakari and Hans)
> >
> > Thank you for the patch.
> >
> > On Mon, Dec 19, 2022 at 04:01:39PM +0200, Tomi Valkeinen wrote:
> >> Add new pixel formats: RGBX1010102, RGBA1010102, ARGB2101010 and Y210.
> >>
> >> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> >> ---
> >>  drivers/gpu/drm/rcar-du/rcar_du_kms.c | 24 +++++++++++++
> >>  drivers/gpu/drm/rcar-du/rcar_du_vsp.c | 49 +++++++++++++++++++++++++--
> >>  2 files changed, 71 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> >> index 8c2719efda2a..8ccabf5a30c4 100644
> >> --- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> >> +++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> >> @@ -259,6 +259,24 @@ static const struct rcar_du_format_info rcar_du_format_infos[] = {
> >>              .bpp = 32,
> >>              .planes = 1,
> >>              .hsub = 1,
> >> +    }, {
> >> +            .fourcc = DRM_FORMAT_RGBX1010102,
> >
> > Ah, here the format makes sense.
> >
> >> +            .v4l2 = V4L2_PIX_FMT_XBGR2101010,
> >
> > But this is horrible :-( Could we use the same names as DRM for new
> > formats, when there is no conflict with existing V4L2 formats ?
> >
> > Sakari, Hans, what do you think ? Please see patch 1/7 in the series for
> > the format definitions.
>
> V4L2 describes pixel formats based on how they appear in memory from the
> lowest to highest memory address.

So that means big endian?

> If I am not mistaken, DRM uses the CPU order. So that explains the difference
> in naming. I don't think we should hide that difference. And V4L2 has been
> quite consistent in following memory ordering in the naming (except possibly
> for some of the really old pixelformats).

DRM uses little endian.

> Departing from that would be more of a hindrance than a help, IMHO.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
