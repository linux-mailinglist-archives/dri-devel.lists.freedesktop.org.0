Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 829B815A34E
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2020 09:26:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3B156F496;
	Wed, 12 Feb 2020 08:25:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com
 [IPv6:2607:f8b0:4864:20::d44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 576A16E5B6;
 Wed, 12 Feb 2020 04:05:24 +0000 (UTC)
Received: by mail-io1-xd44.google.com with SMTP id z193so680314iof.1;
 Tue, 11 Feb 2020 20:05:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Y56nAJIiZ+uAireBhRTGWvQxGWmhvKQLDXIXjtVT5qc=;
 b=btedfg0CVADkEXOTQtcBBZceMQ0wFLGxJgZBVU5li97qjEePaciiefJvdqULLnA/49
 zMpC5uAhdfTlJiSaJN66mnx2yTr/SbCO7ZB+gGOfzgw3TWrS3DIYJ914YDeNLbBE4nml
 tP8/CmLp6BEGTQfO7tpkVVdTnx8LPJdfKtrsss8NR5NBcbtjZOd8MGySAcH9R7N/DemB
 uRsmHktaR+dJEhnLRRYEv1wzCEC1OhvlxLsCqESF4fXDlRALAngz/mXIn1WIWn8YfPYB
 TE2QfHeZSmVbFlJDvb6ayDhyvHSDsewScBKLd18k1Ow2sYeSwDq3w8sBQSZXtqG0+Fsl
 rNKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Y56nAJIiZ+uAireBhRTGWvQxGWmhvKQLDXIXjtVT5qc=;
 b=gpfKvBMN3c4IkoDTvTiG3h9rXs07XUA/SjNslypo67XZpiEb/W/kmBDeFUKYIqMbYu
 4Onwa4Idx9YN1zYEaiTNDiPMf5z5GjwbLxLzpA8J5escO2gCiAZJDEklY1IZzo1/ofkp
 MWlqHPXxxbXQX5qDLwAO0prkcEtRE14GjacMZ+mRl5KdtP9iPwiU5GkuXlSxXeTrj+fu
 G+Qx6zxL/sJEtHyPsF1nKTuhNEurAjj5RXhfbyfWRYXmdm4p7AG5uFCUVQAoPZyt1X+B
 wlih4VuMHzbV3yK8dWnNirvkxwto4fkRiJpmQsNF2/pf2JNiWpTyA0SM3bVe7HYduyU3
 Dk7w==
X-Gm-Message-State: APjAAAWg9oeKscPjcQAdPdRyHYcS2sf9uk/dO3oAz6WxJtJK9RdJXLBw
 8WT6lfpvhEZrp6Za9mbK/nIi2r7XJBsPtW2jDI4=
X-Google-Smtp-Source: APXvYqxQ0rPC9j2U/jPbaaP/bDv1y9+TQflRxmG+XDXwohv+nLmHusAQF2PA7ecGEs6d59JFIScunvpyDxS2IxIWxPA=
X-Received: by 2002:a5d:8c89:: with SMTP id g9mr16096170ion.178.1581480323635; 
 Tue, 11 Feb 2020 20:05:23 -0800 (PST)
MIME-Version: 1.0
References: <1580980321-19256-1-git-send-email-harigovi@codeaurora.org>
 <CAOCk7Nr9n-xLtWq=LEM-QFhJcY+QOuzazsoi-yjErA9od2Jwmw@mail.gmail.com>
 <2f5abc857910f70faa119fea5bda81d7@codeaurora.org>
 <CAOCk7NoCH9p9gOd7as=ty-EMeerAAhQtKZa8f2wZrDeV2LtGrw@mail.gmail.com>
 <1d201377996e16ce25acb640867e1214@codeaurora.org>
 <CAF6AEGu8265DWN-XABwR1N-124m1j=EkgeNDEWZ16TVpSCZSZw@mail.gmail.com>
 <CAOCk7NrH6hWiHL29_DozXcXrXhkCaZ6LTCtJUrvqtXc=nQuLrg@mail.gmail.com>
 <CAF6AEGvLOWKVCjjmqranEi9TKOpMM+BPK199wQ7f=Ez491uhcA@mail.gmail.com>
In-Reply-To: <CAF6AEGvLOWKVCjjmqranEi9TKOpMM+BPK199wQ7f=Ez491uhcA@mail.gmail.com>
From: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date: Tue, 11 Feb 2020 21:05:12 -0700
Message-ID: <CAOCk7NrifMkwartV4rj_v_V4=EHeSkmb28tdBUrxoPHVSX5G5Q@mail.gmail.com>
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

On Tue, Feb 11, 2020 at 5:28 PM Rob Clark <robdclark@gmail.com> wrote:
>
> On Tue, Feb 11, 2020 at 7:59 AM Jeffrey Hugo <jeffrey.l.hugo@gmail.com> wrote:
> >
> > On Tue, Feb 11, 2020 at 8:44 AM Rob Clark <robdclark@gmail.com> wrote:
> > >
> > > On Mon, Feb 10, 2020 at 9:58 PM <harigovi@codeaurora.org> wrote:
> > > >
> > > > On 2020-02-07 19:40, Jeffrey Hugo wrote:
> > > > > On Fri, Feb 7, 2020 at 5:38 AM <harigovi@codeaurora.org> wrote:
> > > > >>
> > > > >> On 2020-02-06 20:29, Jeffrey Hugo wrote:
> > > > >> > On Thu, Feb 6, 2020 at 2:13 AM Harigovindan P <harigovi@codeaurora.org>
> > > > >> > wrote:
> > > > >> >>
> > > > >> >> For a given byte clock, if VCO recalc value is exactly same as
> > > > >> >> vco set rate value, vco_set_rate does not get called assuming
> > > > >> >> VCO is already set to required value. But Due to GDSC toggle,
> > > > >> >> VCO values are erased in the HW. To make sure VCO is programmed
> > > > >> >> correctly, we forcefully call set_rate from vco_prepare.
> > > > >> >
> > > > >> > Is this specific to certain SoCs? I don't think I've observed this.
> > > > >>
> > > > >> As far as Qualcomm SOCs are concerned, since pll is analog and the
> > > > >> value
> > > > >> is directly read from hardware if we get recalc value same as set rate
> > > > >> value, the vco_set_rate will not be invoked. We checked in our idp
> > > > >> device which has the same SOC but it works there since the rates are
> > > > >> different.
> > > > >
> > > > > This doesn't seem to be an answer to my question.  What Qualcomm SoCs
> > > > > does this issue apply to?  Everything implementing the 10nm pll?  One
> > > > > specific SoC?  I don't believe I've seen this on MSM8998, nor SDM845,
> > > > > so I'm interested to know what is the actual impact here.  I don't see
> > > > > an "IDP" SoC in the IP catalog, so I really have no idea what you are
> > > > > referring to.
> > > >
> > > >
> > > > This is not 10nm specific. It is applicable for other nms also.
> > > > Its specific to the frequency being set. If vco_recalc returns the same
> > > > value as being set by vco_set_rate,
> > > > vco_set_rate will not be invoked second time onwards.
> > > >
> > > > For example: Lets take below devices:
> > > >
> > > > Cheza is based on SDM845 which is 10nm only.
> > > > Clk frequency:206016
> > > > dsi_pll_10nm_vco_set_rate - DSI PLL0 rate=1236096000
> > > > dsi_pll_10nm_vco_recalc_rate - DSI PLL0 returning vco rate = 1236095947
> > > >
> > > > Trogdor is based on sc7180 which is also 10nm.
> > > > Clk frequency:69300
> > > > dsi_pll_10nm_vco_set_rate - DSI PLL0 rate=1663200000
> > > > dsi_pll_10nm_vco_recalc_rate - DSI PLL0 returning vco rate = 1663200000
> > > >
> > > > In same trogdor device, we slightly changed the clock frequency and the
> > > > values actually differ which will not cause any issue.
> > > > Clk frequency:69310
> > > > dsi_pll_10nm_vco_set_rate - DSI PLL0 rate=1663440000
> > > > dsi_pll_10nm_vco_recalc_rate - DSI PLL0 returning vco rate = 1663439941
> > >
> > >
> > > tbh, loosing state when power is off is kind of the behavior that I'd
> > > expect.  It kinda makes me wonder if things are not getting powered
> > > off all the way on some SoCs?
> > >
> > > jhugo, are you worried that this patch will cause problems on other
> > > users of the 10nm pll?
> >
> > Essentially yes.  Conceptually it doesn't seem like this change should
> > cause any harm, however -
> >
> > This sounds like we are trying to work around the clk framework, which
> > seems wrong.  It feels like we should be able to set a clk flag for
> > this and make the framework deal with it.
> >
> > Also, this fix is 10nm specific, yet this issue affects all
> > implementations?  Seems like this should perhaps be in common code so
> > that we don't need to play whack-a-mole by fixing every implementation
> > piecemeal.
> >
> > Finally, the PLLs are notorious for not taking a configuration unless
> > they are running.  I admit, I haven't looked at this patch in detail
> > to determine if that is the case here, but there doesn't seem to be
> > any indication from the commit test or a comment that doing so is
> > actually valid in all cases.
>
> I'm not obviously seeing a clk-provider flag for this.. although I
> won't claim to be a clk expert so maybe I'm looking for the wrong
> thing..
>
> On a more practical level, I'd kinda like to get some sort of fix for
> v5.6, as currently suspend/resume doesn't work (or at least the
> display does not survive) on trogdor, which is a bit annoying.  It
> sounds a bit like cheza was just getting lucky (because of rate
> rounding?)  I'm not sure if it is the same situation on other sdm850
> devices (yoga c630) or sdm835 devices (are they using the 10mm pll as
> well?).

sdm835 is the first implementation of the 10nm PLL.  Pretty much
everything after (including sdm845/850) also uses the 10nm PLL.

>  I will confess to not really testing s/r on the yoga c630,
> although maybe someone else has (Bjorn?).
>
> Possibly this should be pushed up to the clk framework, although not
> sure if it has a good way to realize the clk provider has lost power?
> But that sounds like a better thing for v5.7 than v5.6-rc fixes.. ofc
> if there is a better way that I'm not seeing, I'm all ears.

There is a suspend/resume sequence in the HPG where VCO isn't lost,
but that assumes the GDSC isn't turned off.  If GDSC is turned off,
then we need to go through the entire power-up sequence again.  Feels
like this should be plumbed into runtime PM based on the
suspend/resume usecase, but that's probably more complicated then this
change.

Looking at the HPG for the power up sequence, it seems like we should
be setting the bias in the middle of the dsi_pll_commit(), so the
order of operations is slight off, however I somewhat doubt that will
have a meaningful impact and it does seem like this change is in line
with the spirit of the HPG.

It wasn't clear to me from the commit message what usecase triggered
this.  You've made it clear that its suspend/resume (it would be good
if that was mentioned) and that its impacting an actual target.  To
me, the current description seemed more theoretical and didn't
describe the impact that was being addressed.  Overall, it really
didn't answer the "why should I care if I have this change" question.

Right now, I think my concerns are cosmetic, therefore I don't have
reservations about it being picked up.  If you like:

Reviewed-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
