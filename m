Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C141D1621C2
	for <lists+dri-devel@lfdr.de>; Tue, 18 Feb 2020 08:55:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF4DB6E15E;
	Tue, 18 Feb 2020 07:55:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail26.static.mailgun.info (mail26.static.mailgun.info
 [104.130.122.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 472726E916
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2020 10:42:08 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1581936128; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=9eyK9s5QcOQNlzTcBcw9+PasjfwqMuF96kLGC5PXg0c=;
 b=VNF0VxwHFohedvgV7CT3YkNq9srRKLV/hBJUZv1rhpo4M2rI5QOTkE4gxm16O32g+2r9nPya
 UqjBNX6D9pUjuIYizur4C+0NUZPFtUGDUOZnOL24V4V63Ks5XMWc0PuVhVJOSYg1VBAU0mgQ
 hx+z+J+MkB7ich1UyprRrlaQq40=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e4a6dfe.7f2d697a9928-smtp-out-n03;
 Mon, 17 Feb 2020 10:42:06 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 183CDC4479D; Mon, 17 Feb 2020 10:42:05 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: harigovi)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id D7EABC43383;
 Mon, 17 Feb 2020 10:42:03 +0000 (UTC)
MIME-Version: 1.0
Date: Mon, 17 Feb 2020 16:12:03 +0530
From: harigovi@codeaurora.org
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [Freedreno] [v1] drm/msm/dsi/pll: call vco set rate explicitly
In-Reply-To: <CAF6AEGv2Ymn+4uDXsO2-P+HR9dpOotB=NRMSEsBu8_uOCJ2vBQ@mail.gmail.com>
References: <1580980321-19256-1-git-send-email-harigovi@codeaurora.org>
 <CAOCk7Nr9n-xLtWq=LEM-QFhJcY+QOuzazsoi-yjErA9od2Jwmw@mail.gmail.com>
 <2f5abc857910f70faa119fea5bda81d7@codeaurora.org>
 <CAOCk7NoCH9p9gOd7as=ty-EMeerAAhQtKZa8f2wZrDeV2LtGrw@mail.gmail.com>
 <1d201377996e16ce25acb640867e1214@codeaurora.org>
 <CAF6AEGu8265DWN-XABwR1N-124m1j=EkgeNDEWZ16TVpSCZSZw@mail.gmail.com>
 <CAOCk7NrH6hWiHL29_DozXcXrXhkCaZ6LTCtJUrvqtXc=nQuLrg@mail.gmail.com>
 <CAF6AEGvLOWKVCjjmqranEi9TKOpMM+BPK199wQ7f=Ez491uhcA@mail.gmail.com>
 <CAOCk7NrifMkwartV4rj_v_V4=EHeSkmb28tdBUrxoPHVSX5G5Q@mail.gmail.com>
 <CAF6AEGv2Ymn+4uDXsO2-P+HR9dpOotB=NRMSEsBu8_uOCJ2vBQ@mail.gmail.com>
Message-ID: <500fec9adf6c8f8102d0e92535166007@codeaurora.org>
X-Sender: harigovi@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-Mailman-Approved-At: Tue, 18 Feb 2020 07:55:25 +0000
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
Cc: DTML <devicetree@vger.kernel.org>, Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
 MSM <linux-arm-msm@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Sean Paul <seanpaul@chromium.org>, Kalyan Thota <kalyan_t@codeaurora.org>,
 "Kristian H. Kristensen" <hoegsberg@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-02-12 10:40, Rob Clark wrote:
> On Tue, Feb 11, 2020 at 8:05 PM Jeffrey Hugo <jeffrey.l.hugo@gmail.com> 
> wrote:
>> 
>> On Tue, Feb 11, 2020 at 5:28 PM Rob Clark <robdclark@gmail.com> wrote:
>> >
>> > On Tue, Feb 11, 2020 at 7:59 AM Jeffrey Hugo <jeffrey.l.hugo@gmail.com> wrote:
>> > >
>> > > On Tue, Feb 11, 2020 at 8:44 AM Rob Clark <robdclark@gmail.com> wrote:
>> > > >
>> > > > On Mon, Feb 10, 2020 at 9:58 PM <harigovi@codeaurora.org> wrote:
>> > > > >
>> > > > > On 2020-02-07 19:40, Jeffrey Hugo wrote:
>> > > > > > On Fri, Feb 7, 2020 at 5:38 AM <harigovi@codeaurora.org> wrote:
>> > > > > >>
>> > > > > >> On 2020-02-06 20:29, Jeffrey Hugo wrote:
>> > > > > >> > On Thu, Feb 6, 2020 at 2:13 AM Harigovindan P <harigovi@codeaurora.org>
>> > > > > >> > wrote:
>> > > > > >> >>
>> > > > > >> >> For a given byte clock, if VCO recalc value is exactly same as
>> > > > > >> >> vco set rate value, vco_set_rate does not get called assuming
>> > > > > >> >> VCO is already set to required value. But Due to GDSC toggle,
>> > > > > >> >> VCO values are erased in the HW. To make sure VCO is programmed
>> > > > > >> >> correctly, we forcefully call set_rate from vco_prepare.
>> > > > > >> >
>> > > > > >> > Is this specific to certain SoCs? I don't think I've observed this.
>> > > > > >>
>> > > > > >> As far as Qualcomm SOCs are concerned, since pll is analog and the
>> > > > > >> value
>> > > > > >> is directly read from hardware if we get recalc value same as set rate
>> > > > > >> value, the vco_set_rate will not be invoked. We checked in our idp
>> > > > > >> device which has the same SOC but it works there since the rates are
>> > > > > >> different.
>> > > > > >
>> > > > > > This doesn't seem to be an answer to my question.  What Qualcomm SoCs
>> > > > > > does this issue apply to?  Everything implementing the 10nm pll?  One
>> > > > > > specific SoC?  I don't believe I've seen this on MSM8998, nor SDM845,
>> > > > > > so I'm interested to know what is the actual impact here.  I don't see
>> > > > > > an "IDP" SoC in the IP catalog, so I really have no idea what you are
>> > > > > > referring to.
>> > > > >
>> > > > >
>> > > > > This is not 10nm specific. It is applicable for other nms also.
>> > > > > Its specific to the frequency being set. If vco_recalc returns the same
>> > > > > value as being set by vco_set_rate,
>> > > > > vco_set_rate will not be invoked second time onwards.
>> > > > >
>> > > > > For example: Lets take below devices:
>> > > > >
>> > > > > Cheza is based on SDM845 which is 10nm only.
>> > > > > Clk frequency:206016
>> > > > > dsi_pll_10nm_vco_set_rate - DSI PLL0 rate=1236096000
>> > > > > dsi_pll_10nm_vco_recalc_rate - DSI PLL0 returning vco rate = 1236095947
>> > > > >
>> > > > > Trogdor is based on sc7180 which is also 10nm.
>> > > > > Clk frequency:69300
>> > > > > dsi_pll_10nm_vco_set_rate - DSI PLL0 rate=1663200000
>> > > > > dsi_pll_10nm_vco_recalc_rate - DSI PLL0 returning vco rate = 1663200000
>> > > > >
>> > > > > In same trogdor device, we slightly changed the clock frequency and the
>> > > > > values actually differ which will not cause any issue.
>> > > > > Clk frequency:69310
>> > > > > dsi_pll_10nm_vco_set_rate - DSI PLL0 rate=1663440000
>> > > > > dsi_pll_10nm_vco_recalc_rate - DSI PLL0 returning vco rate = 1663439941
>> > > >
>> > > >
>> > > > tbh, loosing state when power is off is kind of the behavior that I'd
>> > > > expect.  It kinda makes me wonder if things are not getting powered
>> > > > off all the way on some SoCs?
>> > > >
>> > > > jhugo, are you worried that this patch will cause problems on other
>> > > > users of the 10nm pll?
>> > >
>> > > Essentially yes.  Conceptually it doesn't seem like this change should
>> > > cause any harm, however -
>> > >
>> > > This sounds like we are trying to work around the clk framework, which
>> > > seems wrong.  It feels like we should be able to set a clk flag for
>> > > this and make the framework deal with it.
>> > >
>> > > Also, this fix is 10nm specific, yet this issue affects all
>> > > implementations?  Seems like this should perhaps be in common code so
>> > > that we don't need to play whack-a-mole by fixing every implementation
>> > > piecemeal.
>> > >
>> > > Finally, the PLLs are notorious for not taking a configuration unless
>> > > they are running.  I admit, I haven't looked at this patch in detail
>> > > to determine if that is the case here, but there doesn't seem to be
>> > > any indication from the commit test or a comment that doing so is
>> > > actually valid in all cases.
>> >
>> > I'm not obviously seeing a clk-provider flag for this.. although I
>> > won't claim to be a clk expert so maybe I'm looking for the wrong
>> > thing..
>> >
>> > On a more practical level, I'd kinda like to get some sort of fix for
>> > v5.6, as currently suspend/resume doesn't work (or at least the
>> > display does not survive) on trogdor, which is a bit annoying.  It
>> > sounds a bit like cheza was just getting lucky (because of rate
>> > rounding?)  I'm not sure if it is the same situation on other sdm850
>> > devices (yoga c630) or sdm835 devices (are they using the 10mm pll as
>> > well?).
>> 
>> sdm835 is the first implementation of the 10nm PLL.  Pretty much
>> everything after (including sdm845/850) also uses the 10nm PLL.
>> 
>> >  I will confess to not really testing s/r on the yoga c630,
>> > although maybe someone else has (Bjorn?).
>> >
>> > Possibly this should be pushed up to the clk framework, although not
>> > sure if it has a good way to realize the clk provider has lost power?
>> > But that sounds like a better thing for v5.7 than v5.6-rc fixes.. ofc
>> > if there is a better way that I'm not seeing, I'm all ears.
>> 
>> There is a suspend/resume sequence in the HPG where VCO isn't lost,
>> but that assumes the GDSC isn't turned off.  If GDSC is turned off,
>> then we need to go through the entire power-up sequence again.  Feels
>> like this should be plumbed into runtime PM based on the
>> suspend/resume usecase, but that's probably more complicated then this
>> change.
> 
> since gdsc is modelled as genpd, that seems to (afaict) happen all
> outside the scope of what the driver knows about.. (but I may be
> overlooking something)
> 
>> Looking at the HPG for the power up sequence, it seems like we should
>> be setting the bias in the middle of the dsi_pll_commit(), so the
>> order of operations is slight off, however I somewhat doubt that will
>> have a meaningful impact and it does seem like this change is in line
>> with the spirit of the HPG.
>> 
>> It wasn't clear to me from the commit message what usecase triggered
>> this.  You've made it clear that its suspend/resume (it would be good
>> if that was mentioned) and that its impacting an actual target.  To
>> me, the current description seemed more theoretical and didn't
>> describe the impact that was being addressed.  Overall, it really
>> didn't answer the "why should I care if I have this change" question.
>> 
>> Right now, I think my concerns are cosmetic, therefore I don't have
>> reservations about it being picked up.  If you like:
>> 
>> Reviewed-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
> 
> 
> hmm, yeah, I guess the commit msg didn't really make that clear.. at
> any rate, I want to see a clean solution pursued in the long run, but
> in the short term I also want to get things working (at least if it
> doesn't break any other users).  So I don't want to land this patch at
> the expense of follow-up for a cleaner solution.. but like I said, I
> would like to get s/r working for now.  So I guess I'd like to see
> some commitment from the display team to follow-up to improve this in
> the next cycle.  And suggestions welcome about how the clk framework
> could make this easier.
> 
> BR,
> -R

we had an initial discussion with the clock team, currently there is no 
ready made clock provider flag to help in the above scenario.
however we are planning to have further discussions for a cleaner fix, 
can we open a new issue to track the discussions and design and close 
the current one ?



_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
