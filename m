Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5650727FB57
	for <lists+dri-devel@lfdr.de>; Thu,  1 Oct 2020 10:17:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 737386E880;
	Thu,  1 Oct 2020 08:17:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C30466E84E
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Oct 2020 06:48:50 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 4AD475802D5;
 Thu,  1 Oct 2020 02:48:48 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Thu, 01 Oct 2020 02:48:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:content-transfer-encoding:in-reply-to; s=fm1; bh=0
 3y1LiXg1NxtfKztmvM8LbH/TEW6ApaxXsj4nZFsU/Y=; b=Y6aYG549ji3R5bqFH
 9av9nW2HMSCqOW8ILmPQ9DO9PADhouU+HCosxcRyU1HWnwE3jH9j4rtqPQwTbi4N
 XMOYj3HX+92mR8FcGFPnSwyRuGmllsY20Ino3Db+yU4OK1kX7Xr67RMTPjOpoiT6
 GOPTELpikQukLTrUiHH9SSAU6cUv9Sf0a0cYsf3noCf9alBTxkQ+qnthn2LskoZ9
 phrovTvomvmxoxycrbqvAxw0pILcbOrFeadpS4HXF5j67yW5bjs4tWaZFnKMP5n3
 IQIPkCcM6cT1eNFz8KD1iFzMIrDlIEDbRpSSWCwVcNdUHkpnCdyZEODrp+njtsqE
 vc4Mg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=03y1LiXg1NxtfKztmvM8LbH/TEW6ApaxXsj4nZFsU
 /Y=; b=pB8oDVlpmy+POTenpKlW1uN3BO1+4klcZcOMsK4VzOVTzE49rektbmX9o
 VOVLN0aBHQ2bzK156gbjSmLLOfTkR9CZAsih8Gt1HHYcejVQVlLMlXw+C4zfHUvS
 Ra74bqBvdHOzsYwAjPkptfInPbhd36IP3yD6TiHGZA4uuf2WU9HQLoIqMy264crW
 3tv6x3CjwQ8FP+pld68MQ3gQV54/Yt6yIaUAwNpocyA0z6h9+VHxJagqwZ9wyGiQ
 6En6BQo3Qj2zfyHq/Na/gBQG66EzkET2jGhnrSg5ieogPRDJeH6ZrMMra3IXEnin
 bY+zC68/smGmvPtiFmUiFWwC2m8GA==
X-ME-Sender: <xms:znt1X5-KnSvepcmMSA1PDMGZ4DvKkWQ84zppi5zRrhPPzA7EwbqgFw>
 <xme:znt1X9v7KBFbtkmPfwzbdoqadCasdNUC8TOZPd_ZacQcM4WmeLlo_zYK2vK7UiWrQ
 1hrCTNDL35BgxTdnco>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrfeefgdduudehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtugfgjgesthhqredttddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpefgjeettdejgffgffdvteeutdehtdehgeehueetkeefgefhtdetjeekledu
 gedvudenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:znt1X3BW_i-B-1QSTk70n9pad11-gqVBl3goZGzxSFGEUIylbUq71w>
 <xmx:znt1X9fZFgXAvPY9nkJHMLsMOIGD-bn72-Dye8ToCKOmPUuN9br2Bg>
 <xmx:znt1X-Ou6TIR-BESGifaLpzKaRpgjbD1X7OTeSHDgmMKuKWtYmQcyg>
 <xmx:0Ht1X_lHv9osxByeCbMa85d4DE7t5SbK28952YbKXm2DmmKA4m4ytA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 5D2D43280063;
 Thu,  1 Oct 2020 02:48:46 -0400 (EDT)
Date: Thu, 1 Oct 2020 08:48:43 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Stefan Wahren <stefan.wahren@i2se.com>
Subject: Re: [PATCH v5 80/80] ARM: dts: bcm2711: Enable the display pipeline
Message-ID: <20201001064843.dlewcu3b7dvqanyy@gilmour.lan>
References: <cover.dddc064d8bb83e46744336af67dcb13139e5747d.1599120059.git-series.maxime@cerno.tech>
 <cfce2276d172d3d9c4d34d966b58fd47f77c4e46.1599120059.git-series.maxime@cerno.tech>
 <20200929221526.GA1370981@ubuntu-m3-large-x86>
 <20200930140758.gummt3umouva3wyu@gilmour.lan>
 <20200930163823.GA237050@ubuntu-m3-large-x86>
 <cacbaef2-4221-50d8-3c5d-efab9f1a9c04@i2se.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cacbaef2-4221-50d8-3c5d-efab9f1a9c04@i2se.com>
X-Mailman-Approved-At: Thu, 01 Oct 2020 08:15:43 +0000
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
Cc: linux-arm-kernel@lists.infradead.org, Chanwoo Choi <cw00.choi@samsung.com>,
 Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Phil Elwell <phil@raspberrypi.com>,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Nathan Chancellor <natechancellor@gmail.com>,
 Hoegeun Kwon <hoegeun.kwon@samsung.com>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Stefan,

On Wed, Sep 30, 2020 at 06:52:13PM +0200, Stefan Wahren wrote:
> Am 30.09.20 um 18:38 schrieb Nathan Chancellor:
> > On Wed, Sep 30, 2020 at 04:07:58PM +0200, Maxime Ripard wrote:
> >> Hi Nathan,
> >>
> >> On Tue, Sep 29, 2020 at 03:15:26PM -0700, Nathan Chancellor wrote:
> >>> On Thu, Sep 03, 2020 at 10:01:52AM +0200, Maxime Ripard wrote:
> >>>> Now that all the drivers have been adjusted for it, let's bring in the
> >>>> necessary device tree changes.
> >>>>
> >>>> The VEC and PV3 are left out for now, since it will require a more specific
> >>>> clock setup.
> >>>>
> >>>> Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> >>>> Tested-by: Chanwoo Choi <cw00.choi@samsung.com>
> >>>> Tested-by: Hoegeun Kwon <hoegeun.kwon@samsung.com>
> >>>> Tested-by: Stefan Wahren <stefan.wahren@i2se.com>
> >>>> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> >>> Apologies if this has already been reported or have a solution but this
> >>> patch (and presumably series) breaks output to the serial console after
> >>> a certain point during init. On Raspbian, I see systemd startup messages
> >>> then the output just turns into complete garbage. It looks like this
> >>> patch is merged first in linux-next, which is why my bisect fell on the
> >>> DRM merge. I am happy to provide whatever information could be helpful
> >>> for debugging this. I am on the latest version of the firmware
> >>> (currently 26620cc9a63c6cb9965374d509479b4ee2c30241).
> >> Unfortunately, the miniUART is in the same clock tree than the core
> >> clock and will thus have those kind of issues when the core clock is
> >> changed (which is also something that one should expect when using the
> >> DRM or other drivers).
> >>
> >> The only real workaround there would be to switch to one of the PL011
> >> UARTs. I guess we can also somehow make the UART react to the core clock
> >> frequency changes, but that's going to require some effort
> >>
> >> Maxime
> > Ack, thank you for the reply! There does not really seem to be a whole
> > ton of documentation around using one of the other PL011 UARTs so for
> > now, I will just revert this commit locally.
> 
> there was a patch series & discussion about this topic, but we finally
> didn't find a rock solid solution.
> 
> You can have a look at "[RFC 5/5] serial: 8250: bcm2835aux: add notifier
> to follow clock changes" from 3.4.2019 on linux-rpi-kernel.

I couldn't find that discussion on the archive, but based on the title I
guess there's some patches that have been merged this cycle for the 8250
driver to do just that (868f3ee6e452 ("serial: 8250: Add 8250 port clock
update method") and cc816969d7b5 ("serial: 8250_dw: Fix common clocks
usage race condition")).

However, I'm not entirely sure the clock notifier works in our case with
the firmware / MMIO clocks duality

Maxime
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
