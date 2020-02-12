Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BE0115A062
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2020 06:11:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 118EA6E81D;
	Wed, 12 Feb 2020 05:11:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91CB06E819;
 Wed, 12 Feb 2020 05:11:14 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id c26so922411eds.8;
 Tue, 11 Feb 2020 21:11:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VAHsM7ERRWf6VvA2d+qJije/DfRWmaudBVFG5XXrd2k=;
 b=crulFNRxzQjKaFZ+O112GMemS/O3G1o1WhM264cFQ6NvJmYQcSVZ6O260i8ql5lIYD
 1sc/cDEU0Xs03tQhY05wDISZIFkIrOjPvDhtprZDk1fY3V8rL4y3ZIUz3EaxHUFpniYP
 XuUhThKbDw0xAvoQ0JDLrqXXNSki1TxEmTSYSUArWRq+xiphm1OGcy8Ma5leefrcah0A
 lAR2BJDI59CR10f6FQnDoADzEvdz6E+DEaosSBv//hU2gf1pTFmnoGyrp5ZKwE6Y3HGF
 8+NG2HX/F54m1ekcpBgFaOv2dfklQxQvTuNhLsvkFtb/hT1tHwGig2B/E3MLGQMkOrOR
 0FoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VAHsM7ERRWf6VvA2d+qJije/DfRWmaudBVFG5XXrd2k=;
 b=o+WqCD66qcfzeprVxaTYFRKSFVPrxsE2woJHYiia1ooYsAbmjPqTNPSid5ry/vuxC0
 IRw6Mv0AIL+8D4x39qRbAbtHBG14HTL5Es5td/TPh2bxW9vPFWpvQzKs45wDkI4PvKVt
 dsTO7RP8nv2Tk3fAfIzErrIGXVfzZ5pLmtd2ZGah6rkL8ZHVUJfelIHT61/uK2Ym05D9
 //XK3wyDtrrZPY/FgK+gES0xfpFYSHI5+HzSz1FBq8OqhvlBbyaBUpBysJlDjSTgFqqv
 YyTrcnkHrZ98SOypmCAsAj0CVD+Xam5Kfrsdbt0ldAcOBNH3LIbbm1ndQDV2KCnE6Bxl
 cZDQ==
X-Gm-Message-State: APjAAAXaGGbcL0yClQOzA6QoXV3rTs9lgFpUsU5oP/beLVivgFjSINkp
 +zDMQqK7a+mfxhhewGSAgjME5m+xB0uKyCk0NT0=
X-Google-Smtp-Source: APXvYqxZtiQgcAOlN6AM+xiGfDaNNUSvPUiUDKseZhwzCbWU94qzlZmjKTiMQDWFRDgL/c/3Voan9QCB+OYt8M7V3Yc=
X-Received: by 2002:a17:906:3195:: with SMTP id
 21mr9583601ejy.207.1581484272427; 
 Tue, 11 Feb 2020 21:11:12 -0800 (PST)
MIME-Version: 1.0
References: <1580980321-19256-1-git-send-email-harigovi@codeaurora.org>
 <CAOCk7Nr9n-xLtWq=LEM-QFhJcY+QOuzazsoi-yjErA9od2Jwmw@mail.gmail.com>
 <2f5abc857910f70faa119fea5bda81d7@codeaurora.org>
 <CAOCk7NoCH9p9gOd7as=ty-EMeerAAhQtKZa8f2wZrDeV2LtGrw@mail.gmail.com>
 <1d201377996e16ce25acb640867e1214@codeaurora.org>
 <CAF6AEGu8265DWN-XABwR1N-124m1j=EkgeNDEWZ16TVpSCZSZw@mail.gmail.com>
 <CAOCk7NrH6hWiHL29_DozXcXrXhkCaZ6LTCtJUrvqtXc=nQuLrg@mail.gmail.com>
 <CAF6AEGvLOWKVCjjmqranEi9TKOpMM+BPK199wQ7f=Ez491uhcA@mail.gmail.com>
 <CAOCk7NrifMkwartV4rj_v_V4=EHeSkmb28tdBUrxoPHVSX5G5Q@mail.gmail.com>
In-Reply-To: <CAOCk7NrifMkwartV4rj_v_V4=EHeSkmb28tdBUrxoPHVSX5G5Q@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 11 Feb 2020 21:10:59 -0800
Message-ID: <CAF6AEGv2Ymn+4uDXsO2-P+HR9dpOotB=NRMSEsBu8_uOCJ2vBQ@mail.gmail.com>
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

On Tue, Feb 11, 2020 at 8:05 PM Jeffrey Hugo <jeffrey.l.hugo@gmail.com> wrote:
>
> On Tue, Feb 11, 2020 at 5:28 PM Rob Clark <robdclark@gmail.com> wrote:
> >
> > On Tue, Feb 11, 2020 at 7:59 AM Jeffrey Hugo <jeffrey.l.hugo@gmail.com> wrote:
> > >
> > > On Tue, Feb 11, 2020 at 8:44 AM Rob Clark <robdclark@gmail.com> wrote:
> > > >
> > > > On Mon, Feb 10, 2020 at 9:58 PM <harigovi@codeaurora.org> wrote:
> > > > >
> > > > > On 2020-02-07 19:40, Jeffrey Hugo wrote:
> > > > > > On Fri, Feb 7, 2020 at 5:38 AM <harigovi@codeaurora.org> wrote:
> > > > > >>
> > > > > >> On 2020-02-06 20:29, Jeffrey Hugo wrote:
> > > > > >> > On Thu, Feb 6, 2020 at 2:13 AM Harigovindan P <harigovi@codeaurora.org>
> > > > > >> > wrote:
> > > > > >> >>
> > > > > >> >> For a given byte clock, if VCO recalc value is exactly same as
> > > > > >> >> vco set rate value, vco_set_rate does not get called assuming
> > > > > >> >> VCO is already set to required value. But Due to GDSC toggle,
> > > > > >> >> VCO values are erased in the HW. To make sure VCO is programmed
> > > > > >> >> correctly, we forcefully call set_rate from vco_prepare.
> > > > > >> >
> > > > > >> > Is this specific to certain SoCs? I don't think I've observed this.
> > > > > >>
> > > > > >> As far as Qualcomm SOCs are concerned, since pll is analog and the
> > > > > >> value
> > > > > >> is directly read from hardware if we get recalc value same as set rate
> > > > > >> value, the vco_set_rate will not be invoked. We checked in our idp
> > > > > >> device which has the same SOC but it works there since the rates are
> > > > > >> different.
> > > > > >
> > > > > > This doesn't seem to be an answer to my question.  What Qualcomm SoCs
> > > > > > does this issue apply to?  Everything implementing the 10nm pll?  One
> > > > > > specific SoC?  I don't believe I've seen this on MSM8998, nor SDM845,
> > > > > > so I'm interested to know what is the actual impact here.  I don't see
> > > > > > an "IDP" SoC in the IP catalog, so I really have no idea what you are
> > > > > > referring to.
> > > > >
> > > > >
> > > > > This is not 10nm specific. It is applicable for other nms also.
> > > > > Its specific to the frequency being set. If vco_recalc returns the same
> > > > > value as being set by vco_set_rate,
> > > > > vco_set_rate will not be invoked second time onwards.
> > > > >
> > > > > For example: Lets take below devices:
> > > > >
> > > > > Cheza is based on SDM845 which is 10nm only.
> > > > > Clk frequency:206016
> > > > > dsi_pll_10nm_vco_set_rate - DSI PLL0 rate=1236096000
> > > > > dsi_pll_10nm_vco_recalc_rate - DSI PLL0 returning vco rate = 1236095947
> > > > >
> > > > > Trogdor is based on sc7180 which is also 10nm.
> > > > > Clk frequency:69300
> > > > > dsi_pll_10nm_vco_set_rate - DSI PLL0 rate=1663200000
> > > > > dsi_pll_10nm_vco_recalc_rate - DSI PLL0 returning vco rate = 1663200000
> > > > >
> > > > > In same trogdor device, we slightly changed the clock frequency and the
> > > > > values actually differ which will not cause any issue.
> > > > > Clk frequency:69310
> > > > > dsi_pll_10nm_vco_set_rate - DSI PLL0 rate=1663440000
> > > > > dsi_pll_10nm_vco_recalc_rate - DSI PLL0 returning vco rate = 1663439941
> > > >
> > > >
> > > > tbh, loosing state when power is off is kind of the behavior that I'd
> > > > expect.  It kinda makes me wonder if things are not getting powered
> > > > off all the way on some SoCs?
> > > >
> > > > jhugo, are you worried that this patch will cause problems on other
> > > > users of the 10nm pll?
> > >
> > > Essentially yes.  Conceptually it doesn't seem like this change should
> > > cause any harm, however -
> > >
> > > This sounds like we are trying to work around the clk framework, which
> > > seems wrong.  It feels like we should be able to set a clk flag for
> > > this and make the framework deal with it.
> > >
> > > Also, this fix is 10nm specific, yet this issue affects all
> > > implementations?  Seems like this should perhaps be in common code so
> > > that we don't need to play whack-a-mole by fixing every implementation
> > > piecemeal.
> > >
> > > Finally, the PLLs are notorious for not taking a configuration unless
> > > they are running.  I admit, I haven't looked at this patch in detail
> > > to determine if that is the case here, but there doesn't seem to be
> > > any indication from the commit test or a comment that doing so is
> > > actually valid in all cases.
> >
> > I'm not obviously seeing a clk-provider flag for this.. although I
> > won't claim to be a clk expert so maybe I'm looking for the wrong
> > thing..
> >
> > On a more practical level, I'd kinda like to get some sort of fix for
> > v5.6, as currently suspend/resume doesn't work (or at least the
> > display does not survive) on trogdor, which is a bit annoying.  It
> > sounds a bit like cheza was just getting lucky (because of rate
> > rounding?)  I'm not sure if it is the same situation on other sdm850
> > devices (yoga c630) or sdm835 devices (are they using the 10mm pll as
> > well?).
>
> sdm835 is the first implementation of the 10nm PLL.  Pretty much
> everything after (including sdm845/850) also uses the 10nm PLL.
>
> >  I will confess to not really testing s/r on the yoga c630,
> > although maybe someone else has (Bjorn?).
> >
> > Possibly this should be pushed up to the clk framework, although not
> > sure if it has a good way to realize the clk provider has lost power?
> > But that sounds like a better thing for v5.7 than v5.6-rc fixes.. ofc
> > if there is a better way that I'm not seeing, I'm all ears.
>
> There is a suspend/resume sequence in the HPG where VCO isn't lost,
> but that assumes the GDSC isn't turned off.  If GDSC is turned off,
> then we need to go through the entire power-up sequence again.  Feels
> like this should be plumbed into runtime PM based on the
> suspend/resume usecase, but that's probably more complicated then this
> change.

since gdsc is modelled as genpd, that seems to (afaict) happen all
outside the scope of what the driver knows about.. (but I may be
overlooking something)

> Looking at the HPG for the power up sequence, it seems like we should
> be setting the bias in the middle of the dsi_pll_commit(), so the
> order of operations is slight off, however I somewhat doubt that will
> have a meaningful impact and it does seem like this change is in line
> with the spirit of the HPG.
>
> It wasn't clear to me from the commit message what usecase triggered
> this.  You've made it clear that its suspend/resume (it would be good
> if that was mentioned) and that its impacting an actual target.  To
> me, the current description seemed more theoretical and didn't
> describe the impact that was being addressed.  Overall, it really
> didn't answer the "why should I care if I have this change" question.
>
> Right now, I think my concerns are cosmetic, therefore I don't have
> reservations about it being picked up.  If you like:
>
> Reviewed-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>


hmm, yeah, I guess the commit msg didn't really make that clear.. at
any rate, I want to see a clean solution pursued in the long run, but
in the short term I also want to get things working (at least if it
doesn't break any other users).  So I don't want to land this patch at
the expense of follow-up for a cleaner solution.. but like I said, I
would like to get s/r working for now.  So I guess I'd like to see
some commitment from the display team to follow-up to improve this in
the next cycle.  And suggestions welcome about how the clk framework
could make this easier.

BR,
-R
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
