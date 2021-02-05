Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44704310E07
	for <lists+dri-devel@lfdr.de>; Fri,  5 Feb 2021 17:42:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D7B66F492;
	Fri,  5 Feb 2021 16:42:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew1-smtp.messagingengine.com (wnew1-smtp.messagingengine.com
 [64.147.123.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 131996F481
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Feb 2021 16:01:39 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.west.internal (Postfix) with ESMTP id CA236A62;
 Fri,  5 Feb 2021 11:01:35 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Fri, 05 Feb 2021 11:01:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:content-transfer-encoding:in-reply-to; s=fm2; bh=Z
 Ug4YBs2NZzkbzAyFNlphluvR52IfC1jIWmo0WKohOw=; b=nxRBtTKEPua4sw3Z8
 I0u/zm1He1XiJfi2ef2lobVAa2QN6TgPTXwIYOg20BQHcix0353FjZlSEYd8MsTQ
 /iMk/ZOHCsGgBc0SHiIzrherfhIqwAwYo3rml5oMY66SgWEfSnYSZqarq0w0gunN
 PhOyW+dQ0P/ViGhWpGfw34cKymNsCpdZQoy1iRTNCJlcD5SyCqt6uo+czNjnxNB+
 ikUA5vd2ErUwsGqyleyuqynKoJOZNWGuYbJJcynWP/ER9ifWYq4RfcStecbrzApF
 m3pmFZ6HOWgbDPD40qrRqtQpIEbNLUXUNCB28Frl9SwIH5ASMy0YffKPqtDadVoe
 9HSlQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=ZUg4YBs2NZzkbzAyFNlphluvR52IfC1jIWmo0WKoh
 Ow=; b=hRplnt8x9ng0QnsOvO3i9NBNgMtWLVSZe60hMQH0bSWl0L+JVAN/QDvwT
 lmaMsbuEOqOYGd/0yIHIQPR6ICh0LLQrS/U+KhnrgRk5J8Iexnv7XsBNLpcm5MbJ
 rCke763Yu3tyZLGrRLH+xIavxaXOWl2Jg6xwRWqWJtL8kFqxD95c4LfQrHohdsvW
 p3lwjBE/+yNLwVu5HNYXFcZtf279iKGR1nrf2dLdI16n2VJepaiQFexELUMIukI3
 hTIg7oS2ZC8xjsFIoLv6yyDTihP38gJpS7BUR6GuHvq7QwOVXmvxx5fCeYwpw7vl
 Bl2O6/JJ5olR8CY/tEH8nfMzw710A==
X-ME-Sender: <xms:22sdYH6uVesoFeifE_6Eim4_m8mI1wJQHMNhWcFuU9UujeO0fs8h7w>
 <xme:22sdYM0A3rY-jZ89sLUxMJv7mFvqrt_XMp7bInrQNQ7bXeCTRyvJEHHw7-tcQi1wX
 rD47nzU1NvDRYuN5BA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrgeeigdejtdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggugfgjsehtqhertddttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepgfejtedtjefggfffvdetuedthedtheegheeuteekfeeghfdtteejkeeludeg
 vddunecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:22sdYLV6X3XqZNzrMwJ2n4Hy0dSUqRdjoh64JvXReh8gYEOnnw5dXg>
 <xmx:22sdYP7JbJikZS5zxnmcJbqM_T7xUVyS_dw46CZ5EvDC_4XtWN0_WA>
 <xmx:22sdYKI-8yxGdsM6Sc9unBBUGB2DpORZJw9RS2R5szP48uOZ2Y50rQ>
 <xmx:32sdYBnFqP1GOh1T62GmxtqopTP3B251EHdToE5EUEUmlkBEbQk6rXL-23o>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 9105624005D;
 Fri,  5 Feb 2021 11:01:31 -0500 (EST)
Date: Fri, 5 Feb 2021 17:01:30 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH 2/5] drm/sun4i: tcon: set sync polarity for tcon1 channel
Message-ID: <20210205160130.ccp7jfcaa5hgyekb@gilmour>
References: <20210204184710.1880895-1-jernej.skrabec@siol.net>
 <20210204184710.1880895-3-jernej.skrabec@siol.net>
 <CAGb2v64qww4pFwMVrY5UpHOQtM43Q0VPx=3PwJGbB5Oh0qnx=w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAGb2v64qww4pFwMVrY5UpHOQtM43Q0VPx=3PwJGbB5Oh0qnx=w@mail.gmail.com>
X-Mailman-Approved-At: Fri, 05 Feb 2021 16:42:02 +0000
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Stephen Boyd <sboyd@kernel.org>,
 Mike Turquette <mturquette@baylibre.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 linux-sunxi <linux-sunxi@googlegroups.com>,
 linux-clk <linux-clk@vger.kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 05, 2021 at 11:21:22AM +0800, Chen-Yu Tsai wrote:
> On Fri, Feb 5, 2021 at 2:48 AM Jernej Skrabec <jernej.skrabec@siol.net> wrote:
> >
> > Channel 1 has polarity bits for vsync and hsync signals but driver never
> > sets them. It turns out that with pre-HDMI2 controllers seemingly there
> > is no issue if polarity is not set. However, with HDMI2 controllers
> > (H6) there often comes to de-synchronization due to phase shift. This
> > causes flickering screen. It's safe to assume that similar issues might
> > happen also with pre-HDMI2 controllers.
> >
> > Solve issue with setting vsync and hsync polarity. Note that display
> > stacks with tcon top have polarity bits actually in tcon0 polarity
> > register.
> >
> > Fixes: 9026e0d122ac ("drm: Add Allwinner A10 Display Engine support")
> > Tested-by: Andre Heider <a.heider@gmail.com>
> > Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
> > ---
> >  drivers/gpu/drm/sun4i/sun4i_tcon.c | 24 ++++++++++++++++++++++++
> >  drivers/gpu/drm/sun4i/sun4i_tcon.h |  5 +++++
> >  2 files changed, 29 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i/sun4i_tcon.c
> > index 6b9af4c08cd6..0d132dae58c0 100644
> > --- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
> > +++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
> > @@ -672,6 +672,29 @@ static void sun4i_tcon1_mode_set(struct sun4i_tcon *tcon,
> >                      SUN4I_TCON1_BASIC5_V_SYNC(vsync) |
> >                      SUN4I_TCON1_BASIC5_H_SYNC(hsync));
> >
> > +       /* Setup the polarity of sync signals */
> > +       if (tcon->quirks->polarity_in_ch0) {
> > +               val = 0;
> > +
> > +               if (mode->flags & DRM_MODE_FLAG_PHSYNC)
> > +                       val |= SUN4I_TCON0_IO_POL_HSYNC_POSITIVE;
> > +
> > +               if (mode->flags & DRM_MODE_FLAG_PVSYNC)
> > +                       val |= SUN4I_TCON0_IO_POL_VSYNC_POSITIVE;
> > +
> > +               regmap_write(tcon->regs, SUN4I_TCON0_IO_POL_REG, val);
> > +       } else {
> > +               val = SUN4I_TCON1_IO_POL_UNKNOWN;
> 
> I think a comment for the origin of this is warranted.

If it's anything like TCON0, it's the pixel clock polarity

Maxime
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
