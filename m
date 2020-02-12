Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D706159DF1
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2020 01:29:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C5F06F45A;
	Wed, 12 Feb 2020 00:29:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAF1D6E479;
 Wed, 12 Feb 2020 00:28:57 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id m13so308564edb.6;
 Tue, 11 Feb 2020 16:28:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5ZyotboeQnfX3ApYlhv3hcCNZzz6LIMW24tRirhDBC0=;
 b=d3m3P7+n6hZ/F+wWRU4iSoQ7U+slq7kc2DjtKnBbPjHXqtqpexttbO+qNbBGXcYIqS
 Lt7V8pxV3Xsyuaaze8GFVU58KSHkywNs1GKN/xfeNAaTypvB1U7PPkeajJVbJTGKCfkQ
 vs3KvfwFFqQPJfZvaUVlZxj5iP5cVAbOVazipcWALqEjyUWXRwaTgGqqsFnJtQdnvdzQ
 OFYfs5A/tkmNCNDu0jgqIjJXdcgxOrDGoycIUjfvKUUZ9d9g0mnP2qbol2Cd6PJEG4hC
 W729TZPC1+czKg4orgiGtcGmf0+t9+Vfvl0ZJa244PgEdEVXwmK15lVg2S8NnqtLXe6H
 Ms8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5ZyotboeQnfX3ApYlhv3hcCNZzz6LIMW24tRirhDBC0=;
 b=Gc4Shv+z222MgHw1hpF2E3g53yn1rnQYEPQjTNH58mq5rhlAik8lXM0y0gZASKhtiu
 9pPqmKJ0zRV1o7EwwpCe3wchCAtuiHNPwfPGaw7QvU8e6vZFsiWVDkBh2vumhfvO8z+H
 R76qrnomlxCBVxT2rvaHTI165MKf0Wh2dkZA83WmLuhIuJRTAjNOEUu/N4s9CzqEIpxK
 5CmwZ9EKHq0NLm5R5ecFonkbaicUJAhT8FBqbdC9tSleA1qsHnN02K50CQ4oJHCn/gvc
 Bq4IvsqI2f4rKM09W69EVxZuyMO91jMCZ+Z5jaSnb9Pijl6/LL3DmIBa9sYA7yXRzZLp
 vXwg==
X-Gm-Message-State: APjAAAX9XIQXxFNJ2b8W+iJacOcr3/+WAOZLOebYzqzAtQoMYSbQAvBK
 V5VHQWzCrD8sDIvVrLp4nJkfJEq8zlU953OKjG8=
X-Google-Smtp-Source: APXvYqw4KdNzAga+QI5x4feq8a96q/btCz8UFtzDxNFineH4PDvzVI6XTkyhJS3cLENwNxpu8RtGsiznYmoCFsb05Ks=
X-Received: by 2002:a05:6402:298:: with SMTP id
 l24mr8284606edv.70.1581467336302; 
 Tue, 11 Feb 2020 16:28:56 -0800 (PST)
MIME-Version: 1.0
References: <1580980321-19256-1-git-send-email-harigovi@codeaurora.org>
 <CAOCk7Nr9n-xLtWq=LEM-QFhJcY+QOuzazsoi-yjErA9od2Jwmw@mail.gmail.com>
 <2f5abc857910f70faa119fea5bda81d7@codeaurora.org>
 <CAOCk7NoCH9p9gOd7as=ty-EMeerAAhQtKZa8f2wZrDeV2LtGrw@mail.gmail.com>
 <1d201377996e16ce25acb640867e1214@codeaurora.org>
 <CAF6AEGu8265DWN-XABwR1N-124m1j=EkgeNDEWZ16TVpSCZSZw@mail.gmail.com>
 <CAOCk7NrH6hWiHL29_DozXcXrXhkCaZ6LTCtJUrvqtXc=nQuLrg@mail.gmail.com>
In-Reply-To: <CAOCk7NrH6hWiHL29_DozXcXrXhkCaZ6LTCtJUrvqtXc=nQuLrg@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 11 Feb 2020 16:28:45 -0800
Message-ID: <CAF6AEGvLOWKVCjjmqranEi9TKOpMM+BPK199wQ7f=Ez491uhcA@mail.gmail.com>
Subject: Re: [Freedreno] [v1] drm/msm/dsi/pll: call vco set rate explicitly
To: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
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
Cc: DTML <devicetree@vger.kernel.org>, MSM <linux-arm-msm@vger.kernel.org>,
 lkml <linux-kernel@vger.kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Harigovindan P <harigovi@codeaurora.org>, Sean Paul <seanpaul@chromium.org>,
 Kalyan Thota <kalyan_t@codeaurora.org>,
 "Kristian H. Kristensen" <hoegsberg@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 11, 2020 at 7:59 AM Jeffrey Hugo <jeffrey.l.hugo@gmail.com> wrote:
>
> On Tue, Feb 11, 2020 at 8:44 AM Rob Clark <robdclark@gmail.com> wrote:
> >
> > On Mon, Feb 10, 2020 at 9:58 PM <harigovi@codeaurora.org> wrote:
> > >
> > > On 2020-02-07 19:40, Jeffrey Hugo wrote:
> > > > On Fri, Feb 7, 2020 at 5:38 AM <harigovi@codeaurora.org> wrote:
> > > >>
> > > >> On 2020-02-06 20:29, Jeffrey Hugo wrote:
> > > >> > On Thu, Feb 6, 2020 at 2:13 AM Harigovindan P <harigovi@codeaurora.org>
> > > >> > wrote:
> > > >> >>
> > > >> >> For a given byte clock, if VCO recalc value is exactly same as
> > > >> >> vco set rate value, vco_set_rate does not get called assuming
> > > >> >> VCO is already set to required value. But Due to GDSC toggle,
> > > >> >> VCO values are erased in the HW. To make sure VCO is programmed
> > > >> >> correctly, we forcefully call set_rate from vco_prepare.
> > > >> >
> > > >> > Is this specific to certain SoCs? I don't think I've observed this.
> > > >>
> > > >> As far as Qualcomm SOCs are concerned, since pll is analog and the
> > > >> value
> > > >> is directly read from hardware if we get recalc value same as set rate
> > > >> value, the vco_set_rate will not be invoked. We checked in our idp
> > > >> device which has the same SOC but it works there since the rates are
> > > >> different.
> > > >
> > > > This doesn't seem to be an answer to my question.  What Qualcomm SoCs
> > > > does this issue apply to?  Everything implementing the 10nm pll?  One
> > > > specific SoC?  I don't believe I've seen this on MSM8998, nor SDM845,
> > > > so I'm interested to know what is the actual impact here.  I don't see
> > > > an "IDP" SoC in the IP catalog, so I really have no idea what you are
> > > > referring to.
> > >
> > >
> > > This is not 10nm specific. It is applicable for other nms also.
> > > Its specific to the frequency being set. If vco_recalc returns the same
> > > value as being set by vco_set_rate,
> > > vco_set_rate will not be invoked second time onwards.
> > >
> > > For example: Lets take below devices:
> > >
> > > Cheza is based on SDM845 which is 10nm only.
> > > Clk frequency:206016
> > > dsi_pll_10nm_vco_set_rate - DSI PLL0 rate=1236096000
> > > dsi_pll_10nm_vco_recalc_rate - DSI PLL0 returning vco rate = 1236095947
> > >
> > > Trogdor is based on sc7180 which is also 10nm.
> > > Clk frequency:69300
> > > dsi_pll_10nm_vco_set_rate - DSI PLL0 rate=1663200000
> > > dsi_pll_10nm_vco_recalc_rate - DSI PLL0 returning vco rate = 1663200000
> > >
> > > In same trogdor device, we slightly changed the clock frequency and the
> > > values actually differ which will not cause any issue.
> > > Clk frequency:69310
> > > dsi_pll_10nm_vco_set_rate - DSI PLL0 rate=1663440000
> > > dsi_pll_10nm_vco_recalc_rate - DSI PLL0 returning vco rate = 1663439941
> >
> >
> > tbh, loosing state when power is off is kind of the behavior that I'd
> > expect.  It kinda makes me wonder if things are not getting powered
> > off all the way on some SoCs?
> >
> > jhugo, are you worried that this patch will cause problems on other
> > users of the 10nm pll?
>
> Essentially yes.  Conceptually it doesn't seem like this change should
> cause any harm, however -
>
> This sounds like we are trying to work around the clk framework, which
> seems wrong.  It feels like we should be able to set a clk flag for
> this and make the framework deal with it.
>
> Also, this fix is 10nm specific, yet this issue affects all
> implementations?  Seems like this should perhaps be in common code so
> that we don't need to play whack-a-mole by fixing every implementation
> piecemeal.
>
> Finally, the PLLs are notorious for not taking a configuration unless
> they are running.  I admit, I haven't looked at this patch in detail
> to determine if that is the case here, but there doesn't seem to be
> any indication from the commit test or a comment that doing so is
> actually valid in all cases.

I'm not obviously seeing a clk-provider flag for this.. although I
won't claim to be a clk expert so maybe I'm looking for the wrong
thing..

On a more practical level, I'd kinda like to get some sort of fix for
v5.6, as currently suspend/resume doesn't work (or at least the
display does not survive) on trogdor, which is a bit annoying.  It
sounds a bit like cheza was just getting lucky (because of rate
rounding?)  I'm not sure if it is the same situation on other sdm850
devices (yoga c630) or sdm835 devices (are they using the 10mm pll as
well?).  I will confess to not really testing s/r on the yoga c630,
although maybe someone else has (Bjorn?).

Possibly this should be pushed up to the clk framework, although not
sure if it has a good way to realize the clk provider has lost power?
But that sounds like a better thing for v5.7 than v5.6-rc fixes.. ofc
if there is a better way that I'm not seeing, I'm all ears.

BR,
-R
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
