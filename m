Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B761D60E54A
	for <lists+dri-devel@lfdr.de>; Wed, 26 Oct 2022 18:11:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 307ED10E590;
	Wed, 26 Oct 2022 16:10:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23C1210E565
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Oct 2022 16:10:52 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id 49416580171;
 Wed, 26 Oct 2022 12:10:52 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Wed, 26 Oct 2022 12:10:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1666800652; x=
 1666807852; bh=SU+Ad1TB02X4bG+6rU4go6fxe2AOrcCnpEjbJ7vBIl4=; b=v
 HMmuduII+52zoJL58dXTsski1Sb9SHoH0YIX5V7C5e9wJWAIuv9pqKwe7fdgDn9F
 OsuXtsXflGGOx1yN7cARkoy3H90OeFupSPKJMOu5sVRMO2EpZ9XXxxhesPaSAZp/
 hvilY8j9DYap4s8nfD2KO8vXJkjZKK5h0lWNZPdT6KCXQaQN/WcdVSZBAl/Qq1Xr
 iMxo8gpiuyndMIRRRvXfP1Sxe6NTUvpspg19puqMsO6M5IO4brBDuwypn/+vmmCF
 6i3bD/ffk1qA10SbNAaMBqZvmdJlH1mpnxKPKjejzvXDJLVBzu72oCLlgONCYigc
 pK2Zm/wH9RFV9fiFhfVhw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1666800652; x=
 1666807852; bh=SU+Ad1TB02X4bG+6rU4go6fxe2AOrcCnpEjbJ7vBIl4=; b=O
 dyM38VdrcZz1OsekiaWmYVLhadIFPmGInB5UwGG+8sNBE6t64NEN381s1GMJb36O
 Idix6UgV/gTq6+q75A/k6s5wpc3+z/WgvzXu8SH6PG6uOObCkxk8u5q6Gljy11N2
 rvV1uOghHa9caq7grs6hzm0ZeTBJVwtLkdiNcv94PG8v3xkXJmMxss20w3J8pmdB
 91JDdCpfvtYLrc1AA+cDpPXITKnR3ld40cKd+9wvHdmhlP8oVovi7UleQqA4ons+
 Qq43S/NDBoxEf+/N9QiB2ISWycntcKfOuxbxJC7V9cIOLy2ROeN6SLbrurTSYoIz
 94QBGXekrMy4otn2H5V0Q==
X-ME-Sender: <xms:C1xZY3_uEulB4q7JHSRfGf4stctGdbOsrizs7P52E5LaC1cewVsVFw>
 <xme:C1xZYzvCX4Y0dqi5hxQtFmGw5GEdilNNdzM9-rCCffgehXWEQFbdjxo57poNJ5-9L
 c96P27jVGnuh02H-oc>
X-ME-Received: <xmr:C1xZY1ANC2-HoDK60coJRvGUQc_a5eauCgblIvlcaYUA-nUJqyNd3yPW0jCBBGHSqKm7Ht7PVbNeoliYB1y_9L3xWBzz9jN7tdpzWxsd-T4csg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrtddvgdeljecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffvvefukfhfgggtugfgjgesthhqredttddtvdenucfhrhhomhepmhgrgihi
 mhgvsegtvghrnhhordhtvggthhenucggtffrrghtthgvrhhnpedvtefggeffuefhkedufe
 ffgffhgfehheetheeghfffkeduhfegffeukeelvdejgfenucevlhhushhtvghrufhiiigv
 pedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtg
 hh
X-ME-Proxy: <xmx:DFxZYzf3TSCvwdV5f-Oj4tjHrloJYurGNY29cUxLBybrh-k4Pt8DnA>
 <xmx:DFxZY8NwRaKtlzqh_kkBQgZENjJC9NZb4svm52tSsfKL6iRxQNS_yQ>
 <xmx:DFxZY1nRigln7vJD_MxIzhlRzTFFiJVVttJ1dls3DFZb2hkT-LRluw>
 <xmx:DFxZY7GA54BjlNJZHs0cqeSAeINGD_B95WKWEsgJaIN2psxXwvK19g>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 26 Oct 2022 12:10:51 -0400 (EDT)
From: maxime@cerno.tech
Date: Wed, 26 Oct 2022 18:10:48 +0200
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH v4 4/7] drm/vc4: hdmi: Fix hdmi_enable_4kp60 detection
Message-ID: <20221026161048.qsiurbhlova4ndud@houat>
References: <20220815-rpi-fix-4k-60-v4-0-a1b40526df3e@cerno.tech>
 <20220815-rpi-fix-4k-60-v4-4-a1b40526df3e@cerno.tech>
 <CAPY8ntAkzWOy0fk4ojtKW9k7asH1zOYygoU8B_=yJjm7Ni7isw@mail.gmail.com>
 <CAPY8ntB1bgHVFMAYP62oGXPUwL4YkGMkxWJaoHLeNW=G1rj+Hw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAPY8ntB1bgHVFMAYP62oGXPUwL4YkGMkxWJaoHLeNW=G1rj+Hw@mail.gmail.com>
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
Cc: Stefan Wahren <stefan.wahren@i2se.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Scott Branden <sbranden@broadcom.com>,
 Emma Anholt <emma@anholt.net>, Stephen Boyd <sboyd@kernel.org>,
 Ray Jui <rjui@broadcom.com>, Michael Turquette <mturquette@baylibre.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 linux-rpi-kernel@lists.infradead.org, Dom Cobley <popcornmix@gmail.com>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave,

Thanks for your review

On Wed, Oct 26, 2022 at 04:36:04PM +0100, Dave Stevenson wrote:
> On Wed, 26 Oct 2022 at 16:27, Dave Stevenson
> <dave.stevenson@raspberrypi.com> wrote:
> >
> > On Thu, 20 Oct 2022 at 10:14, <maxime@cerno.tech> wrote:
> > >
> > > In order to support higher HDMI frequencies, users have to set the
> > > hdmi_enable_4kp60 parameter in their config.txt file.
> > >
> > > We were detecting this so far by calling clk_round_rate() on the core
> > > clock with the frequency we're supposed to run at when one of those
> > > modes is enabled. Whether or not the parameter was enabled could then=
 be
> > > inferred by the returned rate since the maximum clock rate reported by
> > > the firmware was one of the side effect of setting that parameter.
> > >
> > > However, the recent clock rework we did changed what clk_round_rate()
> > > was returning to always return the minimum allowed, and thus this test
> > > wasn't reliable anymore.
> > >
> > > Let's use the new clk_get_max_rate() function to reliably determine t=
he
> > > maximum rate allowed on that clock and fix the 4k@60Hz output.
> > >
> > > Fixes: e9d6cea2af1c ("clk: bcm: rpi: Run some clocks at the minimum r=
ate allowed")
> > > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> >
> > Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> >
> > > ---
> > >  drivers/gpu/drm/vc4/vc4_hdmi.c | 3 ++-
> > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4=
_hdmi.c
> > > index 64f9feabf43e..87961d4de5aa 100644
> > > --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> > > +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> > > @@ -46,6 +46,7 @@
> > >  #include <linux/pm_runtime.h>
> > >  #include <linux/rational.h>
> > >  #include <linux/reset.h>
> > > +#include <soc/bcm2835/raspberrypi-clocks.h>
> > >  #include <sound/dmaengine_pcm.h>
> > >  #include <sound/hdmi-codec.h>
> > >  #include <sound/pcm_drm_eld.h>
> > > @@ -3429,7 +3430,7 @@ static int vc4_hdmi_bind(struct device *dev, st=
ruct device *master, void *data)
> > >
> > >         if (variant->max_pixel_clock =3D=3D 600000000) {
> > >                 struct vc4_dev *vc4 =3D to_vc4_dev(drm);
> > > -               long max_rate =3D clk_round_rate(vc4->hvs->core_clk, =
550000000);
> > > +               unsigned long max_rate =3D rpi_firmware_clk_get_max_r=
ate(vc4->hvs->core_clk);
>=20
> Actually minor nit:
> rpi_firmware_clk_get_max_rate returns an unsigned int.
> AFAICT we don't need the range of unsigned long in any subsequent
> code, so I think it could just be unsigned int here.
>=20
> clk_round_rate returned a long, and therefore previously it did have to b=
e that.

Yeah, I was actually two-minded about this.
rpi_firmware_clk_get_max_rate() indeed returns an unsigned long, because
that's what the firmware returns.

But the clock framework uses unsigned long to store all its frequencies,
and in our case here in clk_set_min_rate().

I don't mind changing it to unsigned int here if you prefer to, and if
you're fine with the rest of the patches I can fix it up while applying
the patches.

Maxime
