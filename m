Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D1D325BDCC
	for <lists+dri-devel@lfdr.de>; Thu,  3 Sep 2020 10:50:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E34A6E5A2;
	Thu,  3 Sep 2020 08:50:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26AE56E4F8
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Sep 2020 17:59:56 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id B8318E79;
 Wed,  2 Sep 2020 13:59:55 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 02 Sep 2020 13:59:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:content-transfer-encoding:in-reply-to; s=fm3; bh=x
 U/XjSIfk+mtw7xME/AR1cpDo57ZqRYe/6NoAfYzO+c=; b=i03AgT4ivAfJ/jHS3
 GMUbbu/yP1GleoS4P/wqklP2VoMsZcfaJmMdf1j5b9s1sH0k+iU8KjVZFOFIOSvn
 hyo2Updc1Xl94j+4VgzOmC24jpHrHgZNcV53hQNCPrc/M2143wsbwwUR49cMyaq2
 KoniiwbL9xDdITzqznx8d7MGRaCjPdD/FqhhaCCsGYJ4zZav46mdrjk/+L7iQ/7M
 I3ZHeKoYB/XVgn9KortRulwY6Gi8KRM8BojaDBB6nmFfs0jOnhRZYJGmXvMG3/ov
 QiU/vtFs8NNRLMNcWa+Uvku9+xyUNvHI4weiMj8L0HzP7xjjCKiHmcxSLzpaE41a
 8X+SA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=xU/XjSIfk+mtw7xME/AR1cpDo57ZqRYe/6NoAfYzO
 +c=; b=QuIkt6sZfykgPlDBvKbjxdL4TgQ4PM9x4J5c0aSk901p0JIwlf3n93LvW
 rRH197HTjiOmGgJABeKObWgfhgxZqpF+Bu02DkTuRWWQndCTZ/fRBJmCB46n1O53
 UaQpJLjZn1h4d1fOP5CsjoEJcSgm0kjSIJZwaFNvYfYSAn6CwUbydSB+GcxVIDg2
 yIhMnAM82KO7T/7U8kn29wBG+hsFGQnojN2DKJSs5MbR29PPO9Nd3hCHlp7TfeSE
 jWUf5QqeUzzFv7/qE/70rX2OPbsmCJHuS6vy3KBqRZ8/bikeAAJU/9dTZ0jEHPpe
 JsCxi3GGN5Z4ROeEL3e8VB/8dqWHA==
X-ME-Sender: <xms:mt1PX0gllKYCfl7bTCHswNA5pr1hOwjE8sMgvBY1D1fDJ9LySIbyXQ>
 <xme:mt1PX9Cr6Bz5o-WOsvOdpQtLlgZ9geQ6rrkLwV2iNA2jWNLRuYXrQMuB_9mN89zpK
 zGHjXHLuB8-FNS6bOo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudefledguddvtdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggugfgjsehtqhertddttddvnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepveehueehkeekffdtudevveehteffhfdugefhveekgeekheeigffgvdek
 heehieehnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppeeltddrkeelrd
 eikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhho
 mhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:mt1PX8FfjhS6w8XkwJQfmtbB3Xy0no_riPN_ExgEigUJG65yLGJEuQ>
 <xmx:mt1PX1SXdZOzQwqdCayhTgUiGPNz6NGw2W5TyPUdAaH2VQ_Mdr-9JQ>
 <xmx:mt1PXxyrugSqTDuhAvYXSr2WvY2urqYg58JUFfbjiKajr5CoLNFibA>
 <xmx:m91PXwzKFPVztg6niNWMxwydz_8vLjpvNCQ15sNm8jw8Z-DlR6MtVg>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 7A6EC3280059;
 Wed,  2 Sep 2020 13:59:54 -0400 (EDT)
Date: Wed, 2 Sep 2020 19:59:52 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH v4 13/78] drm/vc4: kms: Convert to for_each_new_crtc_state
Message-ID: <20200902175952.gf6siofkw7vgjkj3@gilmour.lan>
References: <CAPY8ntBpGsak=s8tOmmDA-2kE5mp6+TrqyK3930Ypm7Q9gcUJw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPY8ntBpGsak=s8tOmmDA-2kE5mp6+TrqyK3930Ypm7Q9gcUJw@mail.gmail.com>
X-Mailman-Approved-At: Thu, 03 Sep 2020 08:50:07 +0000
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
Cc: Tim Gover <tim.gover@raspberrypi.com>, LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 bcm-kernel-feedback-list@broadcom.com,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi!

On Wed, Jul 29, 2020 at 04:02:06PM +0100, Dave Stevenson wrote:
> Hi Maxime
> 
> On Wed, 8 Jul 2020 at 18:42, Maxime Ripard <maxime@cerno.tech> wrote:
> >
> > The vc4 atomic commit loop has an handrolled loop that is basically
> > identical to for_each_new_crtc_state, let's convert it to that helper.
> >
> > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> > ---
> >  drivers/gpu/drm/vc4/vc4_kms.c |  9 ++++-----
> >  1 file changed, 4 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/vc4/vc4_kms.c b/drivers/gpu/drm/vc4/vc4_kms.c
> > index 210cc2408087..717673b18132 100644
> > --- a/drivers/gpu/drm/vc4/vc4_kms.c
> > +++ b/drivers/gpu/drm/vc4/vc4_kms.c
> > @@ -152,14 +152,13 @@ vc4_atomic_complete_commit(struct drm_atomic_state *state)
> >         struct drm_device *dev = state->dev;
> >         struct vc4_dev *vc4 = to_vc4_dev(dev);
> >         struct vc4_hvs *hvs = vc4->hvs;
> > -       struct vc4_crtc *vc4_crtc;
> > +       struct drm_crtc_state *new_crtc_state;
> > +       struct drm_crtc *crtc;
> >         int i;
> >
> > -       for (i = 0; i < dev->mode_config.num_crtc; i++) {
> > -               if (!state->crtcs[i].ptr || !state->crtcs[i].commit)
> > -                       continue;
> > +       for_each_new_crtc_in_state(state, crtc, new_crtc_state, i) {
> > +               struct vc4_crtc *vc4_crtc = to_vc4_crtc(crtc);
> 
> for_each_new_crtc_in_state doesn't check !state->crtcs[i].commit as
> the hand rolled loop did. Sorry, this is my lack of knowledge, but
> does that actually make any real difference?
> 
> I see nothing wrong in calling vc4_hvs_mask_underrun multiple times
> anyway, so it's most likely going to be harmless anyway, but wanted to
> query it.

Sorry for not getting back to this earlier.

I don't really know :)

It looks like the commit pointer is always going to be !NULL in our case:
https://elixir.bootlin.com/linux/latest/source/include/drm/drm_crtc.h#L385

The only case where it seems to be checked is when using
for_each_old_crtc_in_state, and when the commit pointer is being
accessed, and we're in neither of those cases.

Since I don't really know though, I guess we can remain on the safe side
and keep it for now.

Maxime
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
