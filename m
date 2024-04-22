Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 119D08ACDBB
	for <lists+dri-devel@lfdr.de>; Mon, 22 Apr 2024 15:04:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E39E1112AB9;
	Mon, 22 Apr 2024 13:04:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jBln0LAB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 254B0112AAD
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Apr 2024 13:04:38 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id
 98e67ed59e1d1-2adce8f7814so823397a91.0
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Apr 2024 06:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1713791077; x=1714395877; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rssIs5Z4PDRLHwlKnxXtcDFwbhBTkpedIgqO4pjxlBA=;
 b=jBln0LAB+DzhtUG/OL8cVNYRiHj0OSyRYB2mslCMrcJQ0Vtz7DatlR8VunZY8dQkb+
 PJcdcGsZLA5F1wLoLTI7Vuk3TlZyTQKMpCE9RWJA/5uTrZK2nLOg1S1WSunSXwKMqv9I
 FHB0rQh1HMRCoxjY3JPMadVpPpSB2sckf0ynmJl+UA+wQaK2GbANtdG/huMuB6oaJsmb
 4GZjwoRs+zDKw0/cxVLCDFRmZLfSvZJAReL/JopHcknn7pIYTjO7ZkM7axOdNd4Yg7Dt
 uXzNLjcrfT7MxtVZmjSAMbguO9mpJz73eSiBnapHuLHtwQ0uCAEA7oJVLkYSeIGqGUqH
 sIQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713791077; x=1714395877;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rssIs5Z4PDRLHwlKnxXtcDFwbhBTkpedIgqO4pjxlBA=;
 b=La9mqpBXZqflsL+l2yLBuVAcu7MJ7ESDznnfGVxg4nMNzLMUoRXGFeoEgS2WX9c9KU
 6dVyA1XyJetHPlgZVKh0mBs3dcBmxpILnrr3Gci/+yt8GkpNwjRiATBTWkcsKSNxewJu
 8YUKGe5sIwRdbOM8patlxuqPxvH4Ei2WcQ4pPwJeMF5W2u87qUj8QY0z8uNAo+1lW01q
 ZMw70u/jnvU8v24ISkCgaZG9dLwlp76IRd4/Y8dOLc0rOwOQVB2tdnoqm6Ac9gjFMxvV
 3D6UMojmdoe+Jeo6wqHUu9zIj+U5MB3G7LLX6ybgKXLBVZwj8GpdxwimZNq2Zu0E/GV1
 ZUTA==
X-Gm-Message-State: AOJu0YwSvpdX5RBQEVMn/GnUpxi99AJ6BqTsBOLiE/H6U9qXLpIweBPV
 uaqGD/5REbK0NzWPVjvzya6bBt+9xkB6uzcnEmFvr+5BcHJ9drJ6NR+PsuhAUoqO5IND/uVggkw
 Zem2+HHHyIYvWK173xj3SeTSpurs=
X-Google-Smtp-Source: AGHT+IF1ksQignCW8zAnmCOI9fglM8+zEJqk8wCkLDa2hG4T31IAsm25alnnLSKjWG2VHZKc0xg72Ht8S/v613xvPiI=
X-Received: by 2002:a17:90a:cc15:b0:2a4:7133:7e02 with SMTP id
 b21-20020a17090acc1500b002a471337e02mr8467438pju.35.1713791077126; Mon, 22
 Apr 2024 06:04:37 -0700 (PDT)
MIME-Version: 1.0
References: <20240211230931.188194-1-aford173@gmail.com>
 <20240211230931.188194-2-aford173@gmail.com>
 <6111fe04-4ecb-428e-9a0c-dc02cadfe3e7@denx.de>
 <CAHCN7x+DwSSabhGYZ1dnZzwRe+BJfz2H-AXbxjUQWytrq3OMpQ@mail.gmail.com>
 <47b26a19-9aba-4380-9d05-f06bd8bc20b1@denx.de>
In-Reply-To: <47b26a19-9aba-4380-9d05-f06bd8bc20b1@denx.de>
From: Adam Ford <aford173@gmail.com>
Date: Mon, 22 Apr 2024 08:04:25 -0500
Message-ID: <CAHCN7x+R5t5o13tFrQ1trH1LTPshSOOvuerDpUTY++Umqwr=WA@mail.gmail.com>
Subject: Re: [PATCH V2 2/2] drm/bridge: samsung-dsim: Fix porch calcalcuation
 rounding
To: Marek Vasut <marex@denx.de>
Cc: dri-devel@lists.freedesktop.org, aford@beaconembedded.com, 
 Frieder Schrempf <frieder.schrempf@kontron.de>, Inki Dae <inki.dae@samsung.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Marco Felsch <m.felsch@pengutronix.de>,
 Michael Tretter <m.tretter@pengutronix.de>, linux-kernel@vger.kernel.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Apr 22, 2024 at 8:01=E2=80=AFAM Marek Vasut <marex@denx.de> wrote:
>
> On 4/22/24 2:09 PM, Adam Ford wrote:
> > On Sun, Apr 21, 2024 at 9:36=E2=80=AFAM Marek Vasut <marex@denx.de> wro=
te:
> >>
> >> On 2/12/24 12:09 AM, Adam Ford wrote:
> >>> When using video sync pulses, the HFP, HBP, and HSA are divided betwe=
en
> >>> the available lanes if there is more than one lane.  For certain
> >>> timings and lane configurations, the HFP may not be evenly divisible.
> >>> If the HFP is rounded down, it ends up being too small which can caus=
e
> >>> some monitors to not sync properly. In these instances, adjust htotal
> >>> and hsync to round the HFP up, and recalculate the htotal.
> >>>
> >>> Tested-by: Frieder Schrempf <frieder.schrempf@kontron.de> # Kontron B=
L i.MX8MM with HDMI monitor
> >>> Signed-off-by: Adam Ford <aford173@gmail.com>
> >>> ---
> >>> V2:  No changes
> >>>
> >>> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/=
bridge/samsung-dsim.c
> >>> index 8476650c477c..52939211fe93 100644
> >>> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> >>> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> >>> @@ -1606,6 +1606,27 @@ static int samsung_dsim_atomic_check(struct dr=
m_bridge *bridge,
> >>>                adjusted_mode->flags |=3D (DRM_MODE_FLAG_PHSYNC | DRM_=
MODE_FLAG_PVSYNC);
> >>>        }
> >>>
> >>> +     /*
> >>> +      * When using video sync pulses, the HFP, HBP, and HSA are divi=
ded between
> >>> +      * the available lanes if there is more than one lane.  For cer=
tain
> >>> +      * timings and lane configurations, the HFP may not be evenly d=
ivisible.
> >>> +      * If the HFP is rounded down, it ends up being too small which=
 can cause
> >>> +      * some monitors to not sync properly. In these instances, adju=
st htotal
> >>> +      * and hsync to round the HFP up, and recalculate the htotal. T=
hrough trial
> >>> +      * and error, it appears that the HBP and HSA do not appearto n=
eed the same
> >>> +      * correction that HFP does.
> >>> +      */
> >>> +     if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_SYNC_PULSE && dsi->la=
nes > 1) {
> >>
> >> Does this also apply to mode with sync events (I suspect it does), so
> >> the condition here should likely be if (!...burst mode) , right ?
> >
> > Thanks for the review!
> >
> > I was only able to test it with the DSI->ADV6535 bridge, and I'll
> > admit I don't know a lot about DSI interface since I don't have a copy
> > of the spec to read.
> >
> > Are you proposing this should be:
> >
> >   if (!(dsi->mode_flags & MIPI_DSI_MODE_VIDEO_BURST) && dsi->lanes > 1)=
 {
> >
> > I just want to make sure I understand what you're requesting.
>
> Yes, exactly this.

Do you think it should also include checks for
MIPI_DSI_MODE_VIDEO_NO_HFP, MIPI_DSI_MODE_VIDEO_NO_HBP or
MIPI_DSI_MODE_VIDEO_NO_HSA?

It seems like if any of these are set, we should skip this rounding stuff.

adam
