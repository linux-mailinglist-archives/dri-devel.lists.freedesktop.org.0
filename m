Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BD1F131BCB
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jan 2020 23:47:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52EA66E57A;
	Mon,  6 Jan 2020 22:47:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x943.google.com (mail-ua1-x943.google.com
 [IPv6:2607:f8b0:4864:20::943])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5F606E57A
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jan 2020 22:47:44 +0000 (UTC)
Received: by mail-ua1-x943.google.com with SMTP id c7so14791440uaf.5
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Jan 2020 14:47:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZPggc09q4vWJiJGeYG2oFAf7yiWFDoQ0/X6ZL5GufYM=;
 b=Zeer5njnwbkguXoF6hj9BDKR7cWv0XXG74CAaacH7WKsGO03WBsYRwluZBRHBpvvl2
 H/heif5uK3dpnbuoo/D716BiPU2db9TuATf45AU3B62xB0SoXTxJ/+1mw9azz4wcfunY
 ZuxQna/HjAooa79p2+5STVdQv68ck77vE3Xmo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZPggc09q4vWJiJGeYG2oFAf7yiWFDoQ0/X6ZL5GufYM=;
 b=UXKwvDWuL1P6f776b3AGZb2qfmfIf95thazr7qgKn6kwWbEQbwJTixcADHnK8rOfy0
 3aHYPjoGU/KGt9faVB/j47aAioP+3TSl/DBQQqHcLCSerPUcgOTaXVkw15bMnYqcTrqm
 WdJHiujH0kpSR/4JoRCazzLxsEonPfUvN4P/BULkG8k8AJd4+5adsI5AidxDR+swJtcq
 +ua+pzdpw5aiClTrZv9n6ecxUi1LRZICUgd1m7mSQILErt7gdbzdgimoNN2MV+J8Xm1p
 rzOiFl00nExyIBPj1N8pSNW3aJDrqm+/olEJLfC3vmX2hpopCU98NqUYbjN74dFFc5AL
 wpxQ==
X-Gm-Message-State: APjAAAUdgafjwWb7hKVwRDJZmBHai0ohBRGqePqklgJrtiOIuN+XUH82
 TUQHx0Gd5UE3D8ii+vSfCbmrMgJLr24=
X-Google-Smtp-Source: APXvYqyCv22pfAd5/7EPkCARr0hcmoymZtTRzBaDftRkV7Zrz0b8BAe7GqZUnRt1agoQ1wklTx0qRg==
X-Received: by 2002:ab0:b94:: with SMTP id c20mr4400233uak.67.1578350863419;
 Mon, 06 Jan 2020 14:47:43 -0800 (PST)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com.
 [209.85.222.52])
 by smtp.gmail.com with ESMTPSA id g22sm16757229vsr.24.2020.01.06.14.47.42
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Jan 2020 14:47:42 -0800 (PST)
Received: by mail-ua1-f52.google.com with SMTP id c7so14791418uaf.5
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Jan 2020 14:47:42 -0800 (PST)
X-Received: by 2002:ab0:5c8:: with SMTP id e66mr62195504uae.120.1578350861775; 
 Mon, 06 Jan 2020 14:47:41 -0800 (PST)
MIME-Version: 1.0
References: <20191218223530.253106-1-dianders@chromium.org>
In-Reply-To: <20191218223530.253106-1-dianders@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 6 Jan 2020 14:47:30 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VcO=5O-sS7eD+b5tbv8cgsP=XKqSuFWE3q5kzgSLedfQ@mail.gmail.com>
Message-ID: <CAD=FV=VcO=5O-sS7eD+b5tbv8cgsP=XKqSuFWE3q5kzgSLedfQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/9] drm/bridge: ti-sn65dsi86: Improve support for AUO
 B116XAK01 + other DP
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Sean Paul <seanpaul@chromium.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, Dec 18, 2019 at 2:36 PM Douglas Anderson <dianders@chromium.org> wrote:
>
> This series contains a pile of patches that was created to support
> hooking up the AUO B116XAK01 panel to the eDP side of the bridge.  In
> general it should be useful for hooking up a wider variety of DP
> panels to the bridge, especially those with lower resolution and lower
> bits per pixel.
>
> The overall result of this series:
> * Allows panels with fewer than 4 DP lanes hooked up to work.
> * Optimizes the link rate for panels with 6 bpp.
> * Supports trying more than one link rate when training if the main
>   link rate didn't work.
> * Avoids invalid link rates.
>
> It's not expected that this series will break any existing users but
> testing is always good.
>
> To support the AUO B116XAK01, we could actually stop at the ("Use
> 18-bit DP if we can") patch since that causes the panel to run at a
> link rate of 1.62 which works.  The patches to try more than one link
> rate were all developed prior to realizing that I could just use
> 18-bit mode and were validated with that patch reverted.
>
> These patches were tested on sdm845-cheza atop mainline as of
> 2019-12-13 and also on another board (the one with AUO B116XAK01) atop
> a downstream kernel tree.
>
> This patch series doesn't do anything to optimize the MIPI link and
> only focuses on the DP link.  For instance, it's left as an exercise
> to the reader to see if we can use the 666-packed mode on the MIPI
> link and save some power (because we could lower the clock rate).
>
> I am nowhere near a display expert and my knowledge of DP and MIPI is
> pretty much zero.  If something about this patch series smells wrong,
> it probably is.  Please let know and I'll try to fix it.
>
> Changes in v3:
> - Init rate_valid table, don't rely on stack being 0 (oops).
> - Rename rate_times_200khz to rate_per_200khz.
> - Loop over the ti_sn_bridge_dp_rate_lut table, making code smaller.
> - Use 'true' instead of 1 for bools.
> - Added note to commit message noting DP 1.4+ isn't well tested.
>
> Changes in v2:
> - Squash in maybe-uninitialized fix from Rob Clark.
> - Patch ("Avoid invalid rates") replaces ("Skip non-standard DP rates")
>
> Douglas Anderson (9):
>   drm/bridge: ti-sn65dsi86: Split the setting of the dp and dsi rates
>   drm/bridge: ti-sn65dsi86: zero is never greater than an unsigned int
>   drm/bridge: ti-sn65dsi86: Don't use MIPI variables for DP link
>   drm/bridge: ti-sn65dsi86: Config number of DP lanes Mo' Betta
>   drm/bridge: ti-sn65dsi86: Read num lanes from the DP sink
>   drm/bridge: ti-sn65dsi86: Use 18-bit DP if we can
>   drm/bridge: ti-sn65dsi86: Group DP link training bits in a function
>   drm/bridge: ti-sn65dsi86: Train at faster rates if slower ones fail
>   drm/bridge: ti-sn65dsi86: Avoid invalid rates
>
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 259 +++++++++++++++++++++-----
>  1 file changed, 216 insertions(+), 43 deletions(-)

Happy New Year everyone!

I know people probably were busy during the last few weeks (I know I
was offline) and are now probably swamped with full Inboxes.  ...but
I'd be super interested if folks had any comments on this series.
Notably it'd be peachy-keen if Bjorn / Jeffrey had a chance to see if
this is happy for any users of sn65dsi86 that they were aware of.

Thanks much!  :-)

-Doug
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
