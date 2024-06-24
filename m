Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44984914732
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2024 12:17:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12F8C10E3E8;
	Mon, 24 Jun 2024 10:17:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="SJY2ZEiH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com
 [209.85.219.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAABB10E3EC
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 10:17:38 +0000 (UTC)
Received: by mail-yb1-f170.google.com with SMTP id
 3f1490d57ef6-dfecd065b0aso3333096276.1
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 03:17:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719224258; x=1719829058; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=vUnYL6350uvLvpXQOz7TGB6F6PC3tYw8CCvE8SQ6B6w=;
 b=SJY2ZEiHEmT5LiknV7BxcgiSnwCtqA1i04H1/t2CuiHB3Ma8gzIBtSkMP9EV82vcUO
 1myVYu3xybF/Tz7JBrgaU5pZlH1n8IyhrlZ1FeZwCP8j54qkkf73YB1sQ8fJgXAgvQNh
 0V4u+kf1xs35ed+/bZwurrM0SMVJOxVDJv5nkxMp/GUGSjXjO+/BdSm9Zwa7/NLubHi+
 RpeTWWOXgJNVSS7m9T0TNawcKckCBBDxwR2t7di83bFTZuEvKx7gTa9KxBNrCXQY5pd+
 tFFxs1kXoZkuqay1t+gq+UximplbZiqRZnYXmN5dypwmGaGKL9B+SFZph6EH04gypPG0
 YMYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719224258; x=1719829058;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vUnYL6350uvLvpXQOz7TGB6F6PC3tYw8CCvE8SQ6B6w=;
 b=llSMjA4ZP0EUAHQnsnflPNje9ISyeMBKDe7vYzvnzShq1tR8n414kJRWs545XtvQZG
 sCYkhGXGUBxMmXTQ/3e2Vz5mDdvL3gZn8BoCa8yD1h/sGZ08CVqIRf4VGH7aYkPOKnkj
 RuDfoP6lliPLVmkoSmBoT2rHdoteSyd3zXYfQKLv5TBL9D06yOk+CLZKNlFpIdCUCM2A
 PNhmdRj3gg+UHlNBdE8qBDsjDQOlc6LIdHxURbHHBM2cd5Jf/o9kltq9JKmvlB5Mwztg
 Jy3YMfNSHLSvNOcBk49cfTsOwy4Rh4tKacWEAvPhljdGj+oxA6XSSh7h8e/fRq2VwYK3
 Y2HQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX/1uqYmpsVfn5/OB4pNQQFsnbFaqo0x2633Ylg00/HENLZxJAOLnqLt062rxeMHopVKF7Fu8F6RKycvmvIb1tEtTABjskNSRnDqPVAJRp2
X-Gm-Message-State: AOJu0YwmBmSVtTxsAQU+qALB+xc4MTRkVkOygu8+4Tfl9mmhxGtSGndu
 HR+NehW+DKcEnMuFARXYTpEC7jLGn8k67T1FG0tLboABskR4jiQwyhvKyf1a5vYYqu9yGu5JG3n
 AM++tVTqyaIUtwRNKLqETJYbjHNTmu/lnow2FsA==
X-Google-Smtp-Source: AGHT+IGHCrsaJn4UJSwOAywZ6sIOs5EfneQ7TVv2PZFVPwWMgY8MyAP5KeyCgl4NOrBBkLjhx4ku/+cii2XWsg663dQ=
X-Received: by 2002:a25:2104:0:b0:e02:6efa:a434 with SMTP id
 3f1490d57ef6-e02fc34f31dmr4025494276.43.1719224257573; Mon, 24 Jun 2024
 03:17:37 -0700 (PDT)
MIME-Version: 1.0
References: <f6af46e0-aadb-450a-9349-eec1337ea870@ti.com>
 <b221c978-2ce0-4d31-8146-ab43a9f86a1f@ti.com>
 <st6vgd2k6dxo4vd3pmqmqlc5haofhbym2jeb2eeh2pa2n6zcca@tradpzxrzexl>
 <2469374.jE0xQCEvom@steina-w>
In-Reply-To: <2469374.jE0xQCEvom@steina-w>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 24 Jun 2024 13:17:25 +0300
Message-ID: <CAA8EJpraKjBZRLL5U+BVQRf98_EBa5b=nSPxZATU+yvvq9Kfmw@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] drm/bridge: tc358767: Fix
 DRM_BRIDGE_ATTACH_NO_CONNECTOR case
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Aradhya Bhatia <a-bhatia1@ti.com>, dri-devel@lists.freedesktop.org, 
 Jan Kiszka <jan.kiszka@siemens.com>, Marek Vasut <marex@denx.de>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 24 Jun 2024 at 13:07, Alexander Stein
<alexander.stein@ew.tq-group.com> wrote:
>
> Hi,
>
> Am Montag, 24. Juni 2024, 11:49:04 CEST schrieb Dmitry Baryshkov:
> > On Mon, Jun 24, 2024 at 03:07:10PM GMT, Aradhya Bhatia wrote:
> > >
> > >
> > > On 22/06/24 17:49, Dmitry Baryshkov wrote:
> > > > On Sat, Jun 22, 2024 at 05:16:58PM GMT, Aradhya Bhatia wrote:
> > > >>
> > > >>
> > > >> On 17-Jun-24 13:41, Dmitry Baryshkov wrote:
> > > >>> On Mon, Jun 17, 2024 at 07:40:32AM GMT, Jan Kiszka wrote:
> > > >>>> On 16.02.24 15:57, Marek Vasut wrote:
> > > >>>>> On 2/16/24 10:10, Tomi Valkeinen wrote:
> > > >>>>>> Ok. Does anyone have a worry that these patches make the situation
> > > >>>>>> worse for the DSI case than it was before? Afaics, if the DSI lanes
> > > >>>>>> are not set up early enough by the DSI host, the driver would break
> > > >>>>>> with and without these patches.
> > > >>>>>>
> > > >>>>>> These do fix the driver for DRM_BRIDGE_ATTACH_NO_CONNECTOR and DPI, so
> > > >>>>>> I'd like to merge these unless these cause a regression with the DSI
> > > >>>>>> case.
> > > >>>>>
> > > >>>>> 1/2 looks good to me, go ahead and apply .
> > > >>
> > > >> Isn't there any way for the second patch to move forward as well though?
> > > >> The bridge device (under DPI to (e)DP mode) cannot really work without
> > > >> it, and the patches have been pending idle for a long time. =)
> > > >>
> > > >>>>
> > > >>>> My local patches still apply on top of 6.10-rc4, so I don't think this
> > > >>>> ever happened. What's still holding up this long-pending fix (at least
> > > >>>> for our devices)?
> > > >>>
> > > >>> Neither of the patches contains Fixes tags. If the first patch fixes an
> > > >>> issue in previous kernels, please consider following the stable process.
> > > >>>
> > > >>> If we are unsure about the second patch, please send the first patch
> > > >>> separately, adding proper tags.
> > > >>>
> > > >>
> > > >> Thanks Dmitry! I can send the patches again with the required fixes
> > > >> tags (or just patch-1 if we cannot do anything about patch-2).
> > > >
> > > > The problem with the second patch is that it get mixed reviews. I can
> > > > ack the first patch, but for the second one I'd need a confirmation from
> > > > somebody else. I'll go on and apply the first patch later today.
> > > >
> > >
> > > Thanks Dmitry!
> > >
> > > However, would it be okay if I instead add another patch that makes 2
> > > versions of the "tc_edp_bridge_funcs", say "tc_dpi_edp_bridge_funcs" and
> > > "tc_dsi_edp_bridge_funcs", that have all the same function hooks except
> > > for the .edid_read()?
> > >
> > > The dsi edid_read() will remain the same, and Tomi's patch - patch 2/2 -
> > > will only fix the dpi version of the edid_read()?
> > >
> > > The bridge already has the capability to distinguish a DSI input from a
> > > DPI input. This can be leveraged to decide which set of functions need
> > > to be used without any major changes.
> >
> > I'd prefer if somebody with the DSI setup can ack / test the second
> > patch.
> >
> >
>
> Now that my DSI-DP setup works apparently without issue I could test patch 2.
> Since my setup does not use DRM_BRIDGE_ATTACH_NO_CONNECTOR (running on
> drivers/gpu/drm/mxsfb/lcdif_drv.c), I can only say
> there is no regression.

Let me send a (non-tested) patch, switching to drm_bridge_connector,
then you can probably test both of them


-- 
With best wishes
Dmitry
