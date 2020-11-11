Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C3732B00FB
	for <lists+dri-devel@lfdr.de>; Thu, 12 Nov 2020 09:16:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62E726E192;
	Thu, 12 Nov 2020 08:15:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 919A06E053
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Nov 2020 08:00:05 +0000 (UTC)
Received: by mail-pj1-x1041.google.com with SMTP id g19so275825pji.0
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Nov 2020 00:00:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=d02g+zhQMhpaDvTn0zDbRhRDWrRC5B6qJJz7rxHmhvk=;
 b=l5NnLaP9K1JapsaAQXaB8IUPWmIzvVVjxOPXTnY4LAqfJpynKxsQ6wRuVs4BGucwEm
 aJ/ngYVDWQAtA8Rq2D/hfXXkXPJZ+uo1BctGZDFkjngmYPuMN6XIO80nHLEJ0fdzI0t+
 W1XOaDqKDIU9ubq52Ej0H6b96FVSgLmVTPEfEbOu9fCBcTq4+AfG2/WC+vzLq5b+G6Oa
 HgngwLyIdV0hoh+lq32G0nGS9sohC4aZCzV1oSrdT/gC0oNsyZIQ7JLCqzWI3WfVln0I
 5Ru+8iA12FIn8Q+AkEOsNACkUKEEl67indYrhif1z4ZlrHNitQLSGo4mlqXqZ+pAPW1F
 pnnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=d02g+zhQMhpaDvTn0zDbRhRDWrRC5B6qJJz7rxHmhvk=;
 b=sxdd44JK5wRxjf5LESn5Nqm8b5KSg49qj0sbz2VrgS2DKIbLj5cLnOiFxmzIewv+tf
 bBGOchgkPN0RAbVM9nvAjV47dhLxb7/DFVaRKDj5zFtbrxznvINeQ34OSARcFU10hNHg
 GZpIC0BRDeBv3Tdm6T0hypzNneczWjZHu9r5k8dN+xEDe0NGcDQjiA2sAqUgq5DCNywY
 szLiTEiwCk7QDHziAADXKSZOx1zaxU5hw7Fn4NmqI9+PZIlIqZB8EsjEwdcDS43+LcvF
 +JRgTsSO4/xQLkYPTrSgxVprLrTQEM2+dey0k0OF0ky7FnM3w+uIazV5rGGvrxMF+uHe
 lK6g==
X-Gm-Message-State: AOAM531Rw05vX7BW9DP3Kuv80DheXVe43WupMa5R9DKiZrAles2gLgdc
 TpVYXwJOirBE1I2r2eVtmsbdoH+aQXw9ugylZHk=
X-Google-Smtp-Source: ABdhPJwaR2ZBgrMvFOCxPmERr/GODcyDwdLR8u4nldVHHcxLvDF36BYKAQef57Eysm+cYSwP4/y/Y/h+8VIhT0McGss=
X-Received: by 2002:a17:902:d3ca:b029:d7:e0f9:b9c with SMTP id
 w10-20020a170902d3cab02900d7e0f90b9cmr11696040plb.2.1605081605125; Wed, 11
 Nov 2020 00:00:05 -0800 (PST)
MIME-Version: 1.0
References: <20201031081747.372599-1-net147@gmail.com>
 <20201108095322.GA1129714@ravnborg.org>
 <20201108095724.GW1551@shell.armlinux.org.uk>
 <20201108104742.GA1161483@ravnborg.org>
In-Reply-To: <20201108104742.GA1161483@ravnborg.org>
From: Jonathan Liu <net147@gmail.com>
Date: Wed, 11 Nov 2020 18:59:49 +1100
Message-ID: <CANwerB0NGbtGna2c4+XNeGPUvNL1vfpAeiNTQEyEo-u+wM+Piw@mail.gmail.com>
Subject: Re: [PATCH] drm: bridge: dw-hdmi: Avoid resetting force in the detect
 function
To: Sam Ravnborg <sam@ravnborg.org>
X-Mailman-Approved-At: Thu, 12 Nov 2020 08:15:51 +0000
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
Cc: Fabio Estevam <fabio.estevam@freescale.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Jonas Karlman <jonas@kwiboo.se>,
 Russell King - ARM Linux admin <linux@armlinux.org.uk>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 linux-rockchip@lists.infradead.org, Liu Ying <victor.liu@nxp.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sam,

On Sun, 8 Nov 2020 at 21:47, Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Hi Russell,
>
> On Sun, Nov 08, 2020 at 09:57:25AM +0000, Russell King - ARM Linux admin wrote:
> > On Sun, Nov 08, 2020 at 10:53:22AM +0100, Sam Ravnborg wrote:
> > > Russell,
> > >
> > > On Sat, Oct 31, 2020 at 07:17:47PM +1100, Jonathan Liu wrote:
> > > > It has been observed that resetting force in the detect function can
> > > > result in the PHY being powered down in response to hot-plug detect
> > > > being asserted, even when the HDMI connector is forced on.
> > > >
> > > > Enabling debug messages and adding a call to dump_stack() in
> > > > dw_hdmi_phy_power_off() shows the following in dmesg:
> > > > [  160.637413] dwhdmi-rockchip ff940000.hdmi: EVENT=plugin
> > > > [  160.637433] dwhdmi-rockchip ff940000.hdmi: PHY powered down in 0 iterations
> > > >
> > > > Call trace:
> > > > dw_hdmi_phy_power_off
> > > > dw_hdmi_phy_disable
> > > > dw_hdmi_update_power
> > > > dw_hdmi_detect
> > > > dw_hdmi_connector_detect
> > > > drm_helper_probe_detect_ctx
> > > > drm_helper_hpd_irq_event
> > > > dw_hdmi_irq
> > > > irq_thread_fn
> > > > irq_thread
> > > > kthread
> > > > ret_from_fork
> > > >
> > > > Fixes: 381f05a7a842 ("drm: bridge/dw_hdmi: add connector mode forcing")
> > > > Signed-off-by: Jonathan Liu <net147@gmail.com>
> > >
> > > you are the original author of this code - any comments on this patch?
> >
> > No further comments beyond what has already been discussed, and the
> > long and short of it is it's been so long that I don't remember why
> > that code was there. Given that, I'm not even in a position to ack
> > the change. Sorry.
> Thanks for the quick reply.
>
> Given that this fixes a problem for Jonathan I will apply this to -fixes
> if there is no other feedback the next couple of days.
> If it introduces regression we can take it from there.
>
> Jonathan - please ping me if I forget.
>
>         Sam

Ping.

Regards,
Jonathan
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
