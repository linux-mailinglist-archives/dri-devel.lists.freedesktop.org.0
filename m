Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D3D115A33F
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2020 09:25:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6555A6F484;
	Wed, 12 Feb 2020 08:25:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com
 [IPv6:2607:f8b0:4864:20::d42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0B4588F93;
 Tue, 11 Feb 2020 15:59:57 +0000 (UTC)
Received: by mail-io1-xd42.google.com with SMTP id s6so12276557iol.9;
 Tue, 11 Feb 2020 07:59:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9yyotndcLhvUKHC5GDiLNlYrWJmGfmUU1jrbauqKqrw=;
 b=bRMRCR8oY9RFO5yYVwxFSVaEFSLu7eMobI6WkVrdMWmn1fF8mC2oPP75BDVReMKHqO
 gOvFHPKRuWxVGzMpbjPO51vL3zSa9cEcp7Ee8VO6wdUEnmQEFzeHboPSV8H9e0zTJyA1
 dDtUnOLnqTac3hlWF0mQTuuvRrgT9AdhG3ac0Nm6oi9FS6C/Hkd4N0/lisIHAXHz0CM5
 hhKN8NCyUijGCoarBqU6EDfcDs+aqYuxXP55PX2TJHSBqxawBE7l5pqd2Ag+cYxxRdug
 pkHH2hk1S8foGsylqyDjG/ITdVfSI4bKw8CuAbD9eLi/+BJmRgqz8N9zb2Y8I6wPBdm7
 5XJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9yyotndcLhvUKHC5GDiLNlYrWJmGfmUU1jrbauqKqrw=;
 b=QqfYuKKWxj8PPFOXZqynkP8licgHHzBekiOC1eQ8I2DxP0Z/7ZZxvaTruIVhOLK1qi
 CGOFUkR1OOhmLfCN8PjubW1GCSlAlulNjiaTiHBIhOevwkRrekrqXAX91ycBiAb1CW/+
 RX65GVEQKi5yCX8gsR5rUFD9CzzpraZuV3iXqAoZeRLp1pCxAMizy2g45vIFhuPp7xhP
 u4vl9eFeTi1y6odQ4UfjY08WLp7koI4NlpaOkM8hOVtWFTYJ29SCU27T4s8q/mRN6eqx
 kaCMVZwXWQPbPXK85uJpJXc9mfU1zfERn/e6ydhdfydE8SZDiZtP+flB4yq2H9vFIO7Q
 phKQ==
X-Gm-Message-State: APjAAAUIFwn2+mRPv75L27bYP7lzZfVQciw9JxN+nQG96KKZZCrVoWJm
 yu/h2lzqP+3jDK0q1NfKomPg2ekHFeqz2kKJkJ4=
X-Google-Smtp-Source: APXvYqzRgDSxtpGoPVVkFNDjDpnOEbay2M89fpnAYpRCiHPDQf41hjNJcWT+m5zGf6F3a1WQILXy8TFaYzj1gZKv58U=
X-Received: by 2002:a6b:6205:: with SMTP id f5mr14270198iog.42.1581436797145; 
 Tue, 11 Feb 2020 07:59:57 -0800 (PST)
MIME-Version: 1.0
References: <1580980321-19256-1-git-send-email-harigovi@codeaurora.org>
 <CAOCk7Nr9n-xLtWq=LEM-QFhJcY+QOuzazsoi-yjErA9od2Jwmw@mail.gmail.com>
 <2f5abc857910f70faa119fea5bda81d7@codeaurora.org>
 <CAOCk7NoCH9p9gOd7as=ty-EMeerAAhQtKZa8f2wZrDeV2LtGrw@mail.gmail.com>
 <1d201377996e16ce25acb640867e1214@codeaurora.org>
 <CAF6AEGu8265DWN-XABwR1N-124m1j=EkgeNDEWZ16TVpSCZSZw@mail.gmail.com>
In-Reply-To: <CAF6AEGu8265DWN-XABwR1N-124m1j=EkgeNDEWZ16TVpSCZSZw@mail.gmail.com>
From: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date: Tue, 11 Feb 2020 08:59:46 -0700
Message-ID: <CAOCk7NrH6hWiHL29_DozXcXrXhkCaZ6LTCtJUrvqtXc=nQuLrg@mail.gmail.com>
Subject: Re: [Freedreno] [v1] drm/msm/dsi/pll: call vco set rate explicitly
To: Rob Clark <robdclark@gmail.com>
X-Mailman-Approved-At: Wed, 12 Feb 2020 08:25:13 +0000
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
 Harigovindan P <harigovi@codeaurora.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 lkml <linux-kernel@vger.kernel.org>, Sean Paul <seanpaul@chromium.org>,
 Kalyan Thota <kalyan_t@codeaurora.org>,
 "Kristian H. Kristensen" <hoegsberg@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 11, 2020 at 8:44 AM Rob Clark <robdclark@gmail.com> wrote:
>
> On Mon, Feb 10, 2020 at 9:58 PM <harigovi@codeaurora.org> wrote:
> >
> > On 2020-02-07 19:40, Jeffrey Hugo wrote:
> > > On Fri, Feb 7, 2020 at 5:38 AM <harigovi@codeaurora.org> wrote:
> > >>
> > >> On 2020-02-06 20:29, Jeffrey Hugo wrote:
> > >> > On Thu, Feb 6, 2020 at 2:13 AM Harigovindan P <harigovi@codeaurora.org>
> > >> > wrote:
> > >> >>
> > >> >> For a given byte clock, if VCO recalc value is exactly same as
> > >> >> vco set rate value, vco_set_rate does not get called assuming
> > >> >> VCO is already set to required value. But Due to GDSC toggle,
> > >> >> VCO values are erased in the HW. To make sure VCO is programmed
> > >> >> correctly, we forcefully call set_rate from vco_prepare.
> > >> >
> > >> > Is this specific to certain SoCs? I don't think I've observed this.
> > >>
> > >> As far as Qualcomm SOCs are concerned, since pll is analog and the
> > >> value
> > >> is directly read from hardware if we get recalc value same as set rate
> > >> value, the vco_set_rate will not be invoked. We checked in our idp
> > >> device which has the same SOC but it works there since the rates are
> > >> different.
> > >
> > > This doesn't seem to be an answer to my question.  What Qualcomm SoCs
> > > does this issue apply to?  Everything implementing the 10nm pll?  One
> > > specific SoC?  I don't believe I've seen this on MSM8998, nor SDM845,
> > > so I'm interested to know what is the actual impact here.  I don't see
> > > an "IDP" SoC in the IP catalog, so I really have no idea what you are
> > > referring to.
> >
> >
> > This is not 10nm specific. It is applicable for other nms also.
> > Its specific to the frequency being set. If vco_recalc returns the same
> > value as being set by vco_set_rate,
> > vco_set_rate will not be invoked second time onwards.
> >
> > For example: Lets take below devices:
> >
> > Cheza is based on SDM845 which is 10nm only.
> > Clk frequency:206016
> > dsi_pll_10nm_vco_set_rate - DSI PLL0 rate=1236096000
> > dsi_pll_10nm_vco_recalc_rate - DSI PLL0 returning vco rate = 1236095947
> >
> > Trogdor is based on sc7180 which is also 10nm.
> > Clk frequency:69300
> > dsi_pll_10nm_vco_set_rate - DSI PLL0 rate=1663200000
> > dsi_pll_10nm_vco_recalc_rate - DSI PLL0 returning vco rate = 1663200000
> >
> > In same trogdor device, we slightly changed the clock frequency and the
> > values actually differ which will not cause any issue.
> > Clk frequency:69310
> > dsi_pll_10nm_vco_set_rate - DSI PLL0 rate=1663440000
> > dsi_pll_10nm_vco_recalc_rate - DSI PLL0 returning vco rate = 1663439941
>
>
> tbh, loosing state when power is off is kind of the behavior that I'd
> expect.  It kinda makes me wonder if things are not getting powered
> off all the way on some SoCs?
>
> jhugo, are you worried that this patch will cause problems on other
> users of the 10nm pll?

Essentially yes.  Conceptually it doesn't seem like this change should
cause any harm, however -

This sounds like we are trying to work around the clk framework, which
seems wrong.  It feels like we should be able to set a clk flag for
this and make the framework deal with it.

Also, this fix is 10nm specific, yet this issue affects all
implementations?  Seems like this should perhaps be in common code so
that we don't need to play whack-a-mole by fixing every implementation
piecemeal.

Finally, the PLLs are notorious for not taking a configuration unless
they are running.  I admit, I haven't looked at this patch in detail
to determine if that is the case here, but there doesn't seem to be
any indication from the commit test or a comment that doing so is
actually valid in all cases.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
