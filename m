Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A15974AAD9
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jul 2023 07:58:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F6F910E50C;
	Fri,  7 Jul 2023 05:58:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay1-1.pub.mailoutpod2-cph3.one.com
 (mailrelay1-1.pub.mailoutpod2-cph3.one.com [IPv6:2a02:2350:5:400::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2527E10E50C
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jul 2023 05:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-transfer-encoding:content-type:mime-version:references:
 message-id:subject:cc:to:from:date:from;
 bh=q20VHodHGZT4fdRhC09BV38PMmJx8QS1c7nciSKkwLY=;
 b=llxEnqN0N+hSG1nTxErtIkueh0kZy0toErFEMYQu3fQKHzYpt5b2VLtD+5o3h/ktfRHfVdFLG+OPA
 YmlexpgUCZMPpMEpAuVDUI4e5y/S0NpZISH70y3QhgXviwDXT8bP2s/DlZ9ITz7Cg+6D1sPG593PNX
 txe1pt6a5hER60MmWxQ6dKKyvEgKaDEI52bywhbdz78C9Ie9UIQiGDH2aSIavVWJB1u/g+Qe4/l2I6
 XvfpoZjcYeHY4W0oMN234RnjQ1uebnRjKsJ0rwW/IIcP5AOw1oP4BgA4KAhvxCnsv/a3+zbGq5NTFU
 GCdl/dpVwXKDD40cpGpL+gdHbYHTSCA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-transfer-encoding:content-type:mime-version:references:
 message-id:subject:cc:to:from:date:from;
 bh=q20VHodHGZT4fdRhC09BV38PMmJx8QS1c7nciSKkwLY=;
 b=B4vI4XJlvHFbmBXLLhbqwy9jE3K8NFS/2kt/gg0ek8JUphip5J02cHk4JQ5WpAyXA4A78DhF6IHkn
 UDKLsHEAA==
X-HalOne-ID: 51151cb4-1c8b-11ee-ad7a-99461c6a3fe8
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay1 (Halon) with ESMTPSA
 id 51151cb4-1c8b-11ee-ad7a-99461c6a3fe8;
 Fri, 07 Jul 2023 05:58:40 +0000 (UTC)
Date: Fri, 7 Jul 2023 07:58:38 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Doug Anderson <dianders@google.com>
Subject: Re: [v4 4/4] drm/panel: Support for Starry-ili9882t TDDI MIPI-DSI
 panel
Message-ID: <20230707055838.GA288750@ravnborg.org>
References: <1adda828-cf35-fb2c-6db5-f9ca91b5b62a@linaro.org>
 <20230525093151.2338370-1-yangcong5@huaqin.corp-partner.google.com>
 <20230525093151.2338370-5-yangcong5@huaqin.corp-partner.google.com>
 <CAD=FV=W_Vw=WTuap60PtzU8Jc58T1PsEhJfY96NmFFgmC1DB9w@mail.gmail.com>
 <CACRpkdZkNio99zS+ttEXncOtS1TcYbfunKSKddErRDV1gTY43w@mail.gmail.com>
 <CAD=FV=Xx_Bf=Fr1aCmmcjXAv1CyMYwEFba7C6k_HRE1VPtTtHQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD=FV=Xx_Bf=Fr1aCmmcjXAv1CyMYwEFba7C6k_HRE1VPtTtHQ@mail.gmail.com>
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
Cc: neil.armstrong@linaro.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, hsinyi@google.com,
 Cong Yang <yangcong5@huaqin.corp-partner.google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi all,
On Thu, Jul 06, 2023 at 02:25:16PM -0700, Doug Anderson wrote:
> Hi,
> 
> On Tue, Jul 4, 2023 at 12:47 AM Linus Walleij <linus.walleij@linaro.org> wrote:
> >
> > On Thu, Jun 1, 2023 at 5:55 PM Doug Anderson <dianders@google.com> wrote:
> > > On Thu, May 25, 2023 at 2:32 AM Cong Yang
> > > <yangcong5@huaqin.corp-partner.google.com> wrote:
> > > >
> > > > The Starry-ili9882 is a 10.51" WUXGA TFT panel. which fits in nicely with
> > > > the existing panel-boe-tv101wum-nl6 driver. From the datasheet,MIPI need
> > > > to keep the LP11 state before the lcm_reset pin is pulled high. So add
> > > > lp11_before_reset flag.
> > > >
> > > > Signed-off-by: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
> > > > Reviewed-by: Douglas Anderson <dianders@chromium.org>
> > > > ---
> > > >  .../gpu/drm/panel/panel-boe-tv101wum-nl6.c    | 371 ++++++++++++++++++
> > > >  1 file changed, 371 insertions(+)
> > >
> > > Applied to drm-misc-next:
> > >
> > > 8716a6473e6c drm/panel: Support for Starry-ili9882t TDDI MIPI-DSI panel
> >
> > Sorry for noticing too late and coming after the fact and complaining.
> >
> > We must stop using the panel-boe-tv101wum-nl6.c driver as a
> > one-stop-shop for Chromium panels. The Starry panel in particular
> > hardware-wise has nothing in common with the other panels in this
> > driver and I'm suspicious about patch 3/4 as well.
> >
> > Please check my patch breaking it out to a separate driver, and
> > if you could check internally if you have a datasheet for Ilitek
> > ILI9882t or can use your vendor leverage to get one to improve
> > on the driver (such as define the DCS commands...) that would
> > be great.
> >
> > There are good reasons for grouping the panel drivers into
> > respective display controller such as fixing bugs in one place
> > and if we ever want to properly support things such as
> > gamma correction it will provide the proper per-display-controller
> > approach.
> 
> I mentioned in response to your patch #3 also [1], but closing the
> loop here as well. The original reason several panels all ended up in
> one driver was in response to Sam's feedback [2]. That was even
> documented when the first of the "Chromium" panels landed in commit
> 93ee1a2c0f08 ("drm/panel: support for BOE and INX video mode panel").

If we should go with any sort of guideline then one-driver-per-controller.
So we do not mix display controllers in one driver, but we can have
different panels in one driver.

Then there may be two almost identical controllers that can share the
same driver, or there can be controllers used in two different ways so
they warrant independent drivers. In other words this should be used
with common sense.

And if someone can help naming all the magic constant that would be
super.

	Sam
