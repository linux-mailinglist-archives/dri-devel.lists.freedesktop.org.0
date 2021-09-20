Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 74A7D4123F2
	for <lists+dri-devel@lfdr.de>; Mon, 20 Sep 2021 20:27:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 126F76E5BE;
	Mon, 20 Sep 2021 18:27:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 567BF6E5BE;
 Mon, 20 Sep 2021 18:27:32 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id d21so32294608wra.12;
 Mon, 20 Sep 2021 11:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=y9zwU5sYqKQSmloO/YdgRLqeETN2yQaV2Mq9YoCcAeI=;
 b=SyirlfFaRyUdz9gloQTpR5LDjfVwEkVbGAKz3rA4+raBnbaIk7GgLE3cRNSVmNsJ2T
 JkAkx5J15BZqvGTnXpSAtMhcW8GIpbkKYz2o/fjKqnI7nvBKVq2Jtz7IbC8Fxfend/aT
 cCRjbtW6tlCL62XP7oma8j5FxslfQyutluSRo3uL68wvPMjUlYshaafTq0nWn7rc+/K0
 X23Cy/6Zd2aJ/yV5Bd1gNBmWM7UE1ZhKunrY3CvgiHOnnJEeBbf3dekuSIuwb6Q/2klJ
 ROAo5Rgkac0ZG3z2/sAy1GbRbPopzBsEH3+I1VBUbmtoYuVc/qLJlZm084MYYLGUrKoK
 +CPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=y9zwU5sYqKQSmloO/YdgRLqeETN2yQaV2Mq9YoCcAeI=;
 b=QSHGjVKeQaf7Et0xh/372SwaU1yUkqdqGuEkuwK8InOLb+E4DiH+J3kKUbuD3y5Ii/
 AQNuzs2Jr5z5pOUX650jfuU1gYWxurbKoEE/zUWfiAIo0JOFmYdzCPgkxt8IgnyFUqiH
 00VVPtcGdIZT5DIcjoRM16lk0uhtfXP0vi+ZGBAoMYif21aORIX0r9qmlAOL0H0DvOex
 m1XLhjq2Qi8rlR9nESVqRwn3r5QPXBNdj07qOTu4H82UScJIUC9NzGwryi3nkp3lvdeF
 uFElBaOaEJd7IG8jiCqFE4FBkclWlhHAU3v7t7OD5ddjGrj+Jue7gD0aOngEMPOTP5pN
 Af6A==
X-Gm-Message-State: AOAM530zVOGwFWoh3GATZCe1Io9G91TCWUpmch+EOXBTnpBUH5TYmXlG
 11OGjQN60BluODY32RI4W4SSUdZBkrmNB4qxbAU=
X-Google-Smtp-Source: ABdhPJw/EQD0n+XxVEqlN0NQvPPWtr7hnSNfLxBFHmeACTGd4fEURr8HGGl7QADWcofo1LfgcxwBHTMNCADEDP4umVY=
X-Received: by 2002:adf:e5c2:: with SMTP id a2mr29789784wrn.251.1632162450723; 
 Mon, 20 Sep 2021 11:27:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210811235253.924867-1-robdclark@gmail.com>
 <20210811235253.924867-5-robdclark@gmail.com>
 <YRV10ew/Lr8GPzEv@pendragon.ideasonboard.com>
 <CAD=FV=Xd9fizYdxfXYOkpJ_1fZcHp3-ROJ7k4iPg0g0RQ_+A3Q@mail.gmail.com>
In-Reply-To: <CAD=FV=Xd9fizYdxfXYOkpJ_1fZcHp3-ROJ7k4iPg0g0RQ_+A3Q@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 20 Sep 2021 11:32:02 -0700
Message-ID: <CAF6AEGt8K=iy8=dn+GJxt7ybfPtGDPy9w3StqWDwyOv_CKLNVg@mail.gmail.com>
Subject: Re: [PATCH 4/4] drm/bridge: ti-sn65dsi86: Add NO_CONNECTOR support
To: Doug Anderson <dianders@chromium.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 dri-devel <dri-devel@lists.freedesktop.org>, 
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 freedreno <freedreno@lists.freedesktop.org>, 
 Stephen Boyd <swboyd@chromium.org>, Rob Clark <robdclark@chromium.org>, 
 Andrzej Hajda <a.hajda@samsung.com>, Neil Armstrong <narmstrong@baylibre.com>, 
 Robert Foss <robert.foss@linaro.org>, Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@linux.ie>, 
 Daniel Vetter <daniel@ffwll.ch>, open list <linux-kernel@vger.kernel.org>
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

On Thu, Aug 12, 2021 at 1:08 PM Doug Anderson <dianders@chromium.org> wrote:
>
> Laurent,
>
> On Thu, Aug 12, 2021 at 12:26 PM Laurent Pinchart
> <laurent.pinchart@ideasonboard.com> wrote:
> >
> > Hi Rob,
> >
> > Thank you for the patch.
> >
> > On Wed, Aug 11, 2021 at 04:52:50PM -0700, Rob Clark wrote:
> > > From: Rob Clark <robdclark@chromium.org>
> > >
> > > Slightly awkward to fish out the display_info when we aren't creating
> > > own connector.  But I don't see an obvious better way.
> >
> > We need a bit more than this, to support the NO_CONNECTOR case, the
> > bridge has to implement a few extra operations, and set the bridge .ops
> > field. I've submitted two patches to do so a while ago:
> >
> > - [RFC PATCH 08/11] drm/bridge: ti-sn65dsi86: Implement bridge connector operations ([1])
>
> Rob asked me about this over IRC, so if he left it out and it's needed
> then it's my fault. However, I don't believe it's needed until your
> series making this bridge chip support full DP. For the the eDP case
> the bridge chip driver in ToT no longer queries the EDID itself. It
> simply provides an AUX bus to the panel driver and the panel driver
> queries the EDID. I think that means we don't need to add
> DRM_BRIDGE_OP_EDID, right?
>
> I was also wondering if in the full DP case we should actually model
> the physical DP jack as a drm_bridge and have it work the same way. It
> would get probed via the DP AUX bus just like a panel. I seem to
> remember Stephen Boyd was talking about modeling the DP connector as a
> drm_bridge because it would allow us to handle the fact that some TCPC
> chips could only support HBR2 whereas others could support HBR3. Maybe
> it would end up being a fairly elegant solution?
>
> > - [RFC PATCH 09/11] drm/bridge: ti-sn65dsi86: Make connector creation optional ([2])
> >
> > The second patch is similar to the first half of this patch, but misses
> > the cleanup code. I'll try to rebase this and resubmit, but it may take
> > a bit of time.
>
> Whoops! You're right that Rob's patch won't work at all because we'll
> just hit the "Fix bridge driver to make connector optional!" case. I
> should have noticed that. :(

Yes, indeed.. once I fix that, I get no display..

Not sure if Laurent is still working on his series, otherwise I can
try to figure out what bridge ops are missing

BR,
-R
