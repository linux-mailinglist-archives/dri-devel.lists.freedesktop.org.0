Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E03FB3721BD
	for <lists+dri-devel@lfdr.de>; Mon,  3 May 2021 22:41:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 929BC6E17F;
	Mon,  3 May 2021 20:41:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe32.google.com (mail-vs1-xe32.google.com
 [IPv6:2607:f8b0:4864:20::e32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 690436E17F
 for <dri-devel@lists.freedesktop.org>; Mon,  3 May 2021 20:41:18 +0000 (UTC)
Received: by mail-vs1-xe32.google.com with SMTP id o192so3633644vsd.7
 for <dri-devel@lists.freedesktop.org>; Mon, 03 May 2021 13:41:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BVEWhYBD+xtNsbo3lAuegOEINH/TnK8x6KkSQvrHSkc=;
 b=maWCCqkx0oH1zSZ/q/GRT9vao0fkAFsVj063WxGPB1qM8s/UjGnuJdKNRT6bMP4kiw
 L4+J9CU69hnWD+bOSoUADl1jrTF4/psQ7Di/8qRinh3NO5KHgbf6pU9EjtVGOwIETAec
 L/cXPywRZw9M6rUEbphDnPpsXBS7J0droG0iU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BVEWhYBD+xtNsbo3lAuegOEINH/TnK8x6KkSQvrHSkc=;
 b=Cz2zqpo7iZABJ6/+t9XBGP3EP0dPx5hQ6OJfJT47teWvsNuH01iVZ+27wci6cKFbnK
 YppczDh9EzocaBEFzlaF9qguS5VbQmS81b7mLSHhXTQap+fwTEyLlc/RO87QLF6X8Ppb
 PqSDIhY7IPUczBhQZ6Z+4PkeUfbbwdOFwkpWAjJI+LLs8wusY6Q89oq36NrA7GCxDyue
 yAgF1GxlSxCvW2rpEjKsmhdDJgdrwrnW6KjPSYyaOTPw11VUjuF/VOl/hrN8XQfdmOaF
 6U4I9W/rPN0sYSv4rQzcurMdOm3ulihbpLQn9naSsjixRHvN0Y3IbXV+yCuf7DQAcvm+
 4gIw==
X-Gm-Message-State: AOAM532WlBi6Q8vsaK8XLZ3+1TlQNzFZQbrnIAuyYSLobMBLtbapK7qG
 LkCGb2VFgSjFIUxDTA21EpyrAzQFzIrqAw==
X-Google-Smtp-Source: ABdhPJyVD0WNj3hNQDTKH4u11Zk4u8OcfixRYtyrtRHTkK1GmsdH0VvKfgHNfrzaPiD8HJUNDulVug==
X-Received: by 2002:a67:7c3:: with SMTP id 186mr18642402vsh.16.1620074476986; 
 Mon, 03 May 2021 13:41:16 -0700 (PDT)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com.
 [209.85.222.52])
 by smtp.gmail.com with ESMTPSA id s84sm1716480vke.52.2021.05.03.13.41.15
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 May 2021 13:41:15 -0700 (PDT)
Received: by mail-ua1-f52.google.com with SMTP id v8so2344022uau.12
 for <dri-devel@lists.freedesktop.org>; Mon, 03 May 2021 13:41:15 -0700 (PDT)
X-Received: by 2002:a9f:2183:: with SMTP id 3mr17021447uac.0.1620074475074;
 Mon, 03 May 2021 13:41:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210423165906.2504169-1-dianders@chromium.org>
 <20210423095743.v5.1.I9e6af2529d6c61e5daf86a15a1211121c5223b9a@changeid>
 <CACRpkdYkRFLvCRPSYNzYQG58QgPfhvjtHb+FBQZadyrnjC8=1A@mail.gmail.com>
 <CAD=FV=UX683grZ=poTwKXxSqYBCLdLAOCxOPhE_xVVgKbe36Mw@mail.gmail.com>
 <CACRpkdYfugrJ4WGn=w+viGXE6s5cdHjLC++jHPLVy_QH09KA8Q@mail.gmail.com>
 <CAD=FV=XXxTz8hi92y6p3hX7iVEHuqKHsrKPSnX_a__WCEQRAKw@mail.gmail.com>
 <CACRpkdZVH=h37hSjvjcNmRwV-RoBB-nvUbrOT80DoLr7n81R3Q@mail.gmail.com>
In-Reply-To: <CACRpkdZVH=h37hSjvjcNmRwV-RoBB-nvUbrOT80DoLr7n81R3Q@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 3 May 2021 13:41:03 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Vzn0ih_RqR_ySJzFtq0B0x_4a-Uwjk56GeLyUZtTEXrQ@mail.gmail.com>
Message-ID: <CAD=FV=Vzn0ih_RqR_ySJzFtq0B0x_4a-Uwjk56GeLyUZtTEXrQ@mail.gmail.com>
Subject: Re: [PATCH v5 01/20] drm/panel: panel-simple: Add missing
 pm_runtime_disable() calls
To: Linus Walleij <linus.walleij@linaro.org>
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
 Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, MSM <linux-arm-msm@vger.kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Steev Klimaszewski <steev@kali.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Wolfram Sang <wsa@kernel.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Stephen Boyd <swboyd@chromium.org>, Sam Ravnborg <sam@ravnborg.org>,
 linux-i2c <linux-i2c@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Sat, May 1, 2021 at 5:07 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> Hi Doug,
>
> On Fri, Apr 30, 2021 at 11:04 PM Doug Anderson <dianders@chromium.org> wrote:
>
> > Pushed this one patch. Rest of the series is pending adult
> > supervision. Overall summary:
> >
> > 1. I could probably push some of the early sn65dsi86 cleanup patches
> > in this series since they have Bjorn's review and are pretty much
> > no-ops / simple cleanups, but there's probably not tons gained for
> > shoving those in early.
>
> Those look good to me as well. I'd say just apply them.
>
> To me it looks like up until and including patch 18?
> Feel free to add my
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
>
> On these.

OK, thanks! I've just pushed these patches to drm-misc-next with your Ack:

63358e24ee79 drm/panel: panel-simple: Cache the EDID as long as we retain power
31e25395d8b7 drm/panel: panel-simple: Power the panel when reading the EDID
4318ea406e02 drm/panel: panel-simple: Remove extra call:
drm_connector_update_edid_property()
b137406d9679 drm/bridge: ti-sn65dsi86: If refclk, DP AUX can happen
w/out pre-enable
f7a5ee2cd3e2 drm/bridge: ti-sn65dsi86: Code motion of refclk
management functions
9bede63127c6 drm/bridge: ti-sn65dsi86: Use pm_runtime autosuspend
5c4381eeb709 drm/panel: panel-simple: Get rid of hacky HPD chicken-and-egg code
bf73537f411b drm/bridge: ti-sn65dsi86: Break GPIO and MIPI-to-eDP
bridge into sub-drivers
bef236a5206c drm/bridge: ti-sn65dsi86: Move all the chip-related init
to the start
f94eb8a32863 drm/bridge: ti-sn65dsi86: Cleanup managing of drvdata
3636fc25f760 drm/bridge: ti-sn65dsi86: Add local var for "dev" to simplify probe
52d54819c8ae drm/bridge: ti-sn65dsi86: Clean debugfs code
dea2500a820c drm/bridge: ti-sn65dsi86: Use devm to do our runtime_disable
905d66d08d0f drm/bridge: ti-sn65dsi86: More renames in prep for sub-devices
db0036db4851 drm/bridge: ti-sn65dsi86: Rename the main driver data structure

Things not pushed:

[v5,15/20] i2c: i2c-core-of: Fix corner case of finding adapter by node
-> Can't push i2c things

[v5,14/20] drm/bridge: ti-sn65dsi86: Promote the AUX channel to its own sub-dev
-> Won't work without rework. See [1]

[v5,19/20] drm/bridge: ti-sn65dsi86: Don't read EDID blob over DDC
-> Needs Laurent and also patch 14/20 to be resolved.

[v5,20/20] arm64: dts: qcom: Link the panel to the bridge's DDC bus
-> Needs all the rest resolved.

Let me see if I can find a way to work around the AUX channel stuff
and then I'll push a v6 of just what's left.

> Just to keep you busy and make sure you don't run out of work
> (haha) I noticed that the gpio_chip in this driver can use
> the new GPIO_REGMAP helper library with the fixes just
> landed in Torvald's tree.
>
> At your convenience and when you think there is too little
> stuff in your sn65dsi86 TODO, check out
> pinctrl-bcm63xx.c for an example of select GPIO_REGMAP
> made very simple (this works fine as long as they are bit
> offsets starting from 0).

I seem to recall you mentioning something like this. When I looked at
it in the past I wasn't convinced it would be easy. See my response
[2]. The rough summary is that I didn't think the helpers were happy
with the pm_runtime() model that I'm using. Did I get that wrong?

[1] https://lore.kernel.org/dri-devel/CAD=FV=UTmOP8LDaf-Tyx17OORQK6pJH6O_w3cP0Bu-KRYaHkYw@mail.gmail.com/
[2] https://lore.kernel.org/r/CAD=FV=VqD-dY=v23KYuTqy8aRNQJJzJ7h_UOcdEBYuK9X51MQQ@mail.gmail.com

-Doug
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
