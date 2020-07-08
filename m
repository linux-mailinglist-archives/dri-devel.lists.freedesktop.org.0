Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A11B219956
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jul 2020 09:07:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 988E26EA16;
	Thu,  9 Jul 2020 07:05:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DB466E57E
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jul 2020 16:54:11 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id s10so49699161wrw.12
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jul 2020 09:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=flowbird.group; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WOVkqwckQQd55xs9l2xekP/piuHMiACO9inQRc/624Y=;
 b=TtGG4LDilrrh105PxPZxfegeCFu329cU+BDYujVlSNPA/eV+N5rQLeSu4f9VNLv4EY
 jJXnMpeYSsY9v5ysdriB/Hdv7bPmV6ebu0WLsdR5QtuofFwIKWHA25JdHRc8aJmzbtST
 dkPMA8o+wOk1I1iqtY8N8XkkS8AY9V/RXRrRmMpZhOHeETr6llzVlatZu8t4uIRUziB/
 pZCHiO5QP8ZfoMsI13oKDv2l5Sao7jE9NVeqdVzNS8i7Sp+FU7KFZsf/qKt9IB8E1irm
 0YehjaJ5rDST1wEhuW7LtWdNQ/+HKsI9krgqqI7O7wAyVZ2Wm6XV9+9fRTczuXASdmoi
 Q0Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WOVkqwckQQd55xs9l2xekP/piuHMiACO9inQRc/624Y=;
 b=g6iG/Dtqf00qphglTBVgln2Kor3veQl9Zxp4wVB3UdbvVoUZXX1TEqXo4nn/4Fxnrf
 c+nQ18HPZ7n/AxK5LBoqNVQOLsOFBDA1P/dVzw5Ssk2WGBT2zJULMGp1QDty711JUhX6
 iW1/D2sCKQKj0C9pODsCIrMhRg1gPbLNnTHPA0+4QtPdDz3Y/2hyy7b+xMaxYfs8yJ1y
 yqWVoz+zsrBDK7j+/pjUpKOR4JtSbAAeLdK6o2ajnkcK37iw9g+0iQbZNzmf18eBOW7/
 XTiUXjk6hjqRybiDA+ZYNv5UhbNZemw397e41osLHzn1Ff3AMLtxFKwqWweYipAkDHOW
 rzeA==
X-Gm-Message-State: AOAM531ooZwvpfTy4iIgX8fFvevLGhtcpx4/yhgwSBfERLq/X9C233P/
 ej7PPw7pRmZnzjmJL9NWXztwzJWZNrd5nV6PaN1b4ZIQcsIdpg==
X-Google-Smtp-Source: ABdhPJyVCpbbKtoLOEzP8YwwHDnBfwPBOs+phqlZhXQ4uNw+YwtkN1XbsB4wVgHaAUiql5DgdP9vGzDTZQsegl1cvIg=
X-Received: by 2002:adf:9062:: with SMTP id h89mr55137959wrh.285.1594227249993; 
 Wed, 08 Jul 2020 09:54:09 -0700 (PDT)
MIME-Version: 1.0
References: <1594137527-15201-1-git-send-email-martin.fuzzey@flowbird.group>
 <a55b91f01a2e795fe2dd38d860e63a63c8c8871c.camel@pengutronix.de>
In-Reply-To: <a55b91f01a2e795fe2dd38d860e63a63c8c8871c.camel@pengutronix.de>
From: "Fuzzey, Martin" <martin.fuzzey@flowbird.group>
Date: Wed, 8 Jul 2020 18:53:59 +0200
Message-ID: <CANh8QzwEgVG5AvJ4s7ydfPMDKpK5pb0TSaz9i9dgZ+1ZMJw3vQ@mail.gmail.com>
Subject: Re: [PATCH] drm: imx: Fix occasional screen corruption on modeset.
To: Philipp Zabel <p.zabel@pengutronix.de>
X-Mailman-Approved-At: Thu, 09 Jul 2020 07:05:03 +0000
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
Cc: Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Philipp,

thanks for the quick reply.

On Wed, 8 Jul 2020 at 10:31, Philipp Zabel <p.zabel@pengutronix.de> wrote:

> Could this be just a panel getting confused because the pixel clock is
> disabled, or is there really an issue with the IPU? Have you tried just
> keeping clk_di_pixel enabled in ipu_di_disable(), but continuing
> to disable DI and DC?
>

I've  tried that now but still observed the corruption.

> > The exact reason isn't understood but it seems timing related.
> >

Also just adding a msleep(2) or a mdelay(20) at the end of
ipu_crtc_atomic_disable() makes the problem go away too.
Obviously I'm not suggesting doing that, just that it may help
understand what is going on.

>
> Just removing ipu_di_disable() leaks a clk_prepare_enable refcount on
> the di->clk_di_pixel clock.
>
> Also this is followed by an ipu_dc_disable(), which should remove the DC
> module's clock if this is the only display. So the DC should be disabled
> anyway.
>

True.

How about doing just ipu_crtc_disable_planes() and
drm_crtc_vblank_off() in the active (modeset) case.
and in ipu_crtc_atomic_enable() only doing the stuff  (which doesn't
touch the planes) if old_state->active == false ?

That will fix the clock refcount problem and seems generally better as
tearing down everything just to do a modeset
seems a bit heavy handed.

I've tested that and it works too but it's probably better to discuss
this some more before sending a new patch.

Regards,

Martin
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
