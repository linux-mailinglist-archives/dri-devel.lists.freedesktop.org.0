Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F25D482D6B3
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jan 2024 11:06:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6ECD510E0D2;
	Mon, 15 Jan 2024 10:06:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 917 seconds by postgrey-1.36 at gabe;
 Mon, 15 Jan 2024 10:06:16 UTC
Received: from mail.andi.de1.cc (mail.andi.de1.cc
 [IPv6:2a02:c205:3004:2154::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49FA210E0D2
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jan 2024 10:06:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=kemnade.info; s=20220719; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Q+8/IEjFJ6FaUC9Is4EXtyjT3oDpArt5eWtCr0Ef22I=; b=JJNov7xMP1eeUqF57OqkVV0Nd8
 CG4eDIjLaLjDGy6lnktp+/oCd1AapYBTwa0aVcSRDn6eMl+ozeWKaxL2EvkduGLpeSJ+D2PcfkoK3
 1q9HRivJr99rsTBVN3y6SG1Ght43y31YvvRoLrwFitMGQajaTin7lqJTrCb1iUSMKcU2+kClKYNH2
 THPlLOupz6L9+vqzRqp12TOTK1wKnM5RFpXVYPdRR7NFMf5W9OW4fJZq4dJaBQQ2dR6NCmpWqpBjZ
 X1h7cPV9HwWu6dqwaZyVjTXIBRGDE0h4rWcVj9Z/gf6yT3BX5UzIeFKABGYKjJYaUBUsf+V7oyKyA
 w/rwAJJg==;
Received: from p200301077700f3001a3da2fffebfd33a.dip0.t-ipconnect.de
 ([2003:107:7700:f300:1a3d:a2ff:febf:d33a] helo=aktux)
 by mail.andi.de1.cc with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <andreas@kemnade.info>)
 id 1rPJc6-008P8Q-Iv; Mon, 15 Jan 2024 10:50:38 +0100
Date: Mon, 15 Jan 2024 10:50:35 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: [PATCH RFC v2 04/11] ARM: dts: omap4: Add device tree entry for
 SGX GPU
Message-ID: <20240115105035.06e6af86@aktux>
In-Reply-To: <7BC64F03-A4DF-411F-9B6F-6BCA436D9B50@goldelico.com>
References: <20240108183302.255055-1-afd@ti.com>
 <20240108183302.255055-5-afd@ti.com>
 <122DC5ED-2AA7-46A0-845F-083922458385@goldelico.com>
 <vpcgccul53oibwoqb3barj3rjxoyskoldjyfvjdzmytic3tonm@wq4aqsenk7rp>
 <7BC64F03-A4DF-411F-9B6F-6BCA436D9B50@goldelico.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tony Lindgren <tony@atomide.com>, dri-devel@lists.freedesktop.org,
 linux-mips@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Donald Robson <donald.robson@imgtec.com>, linux-sunxi@lists.linux.dev,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 =?UTF-8?B?QmVub8OudA==?= Cousson <bcousson@baylibre.com>,
 Maxime Ripard <mripard@kernel.org>, Matt Coster <matt.coster@imgtec.com>,
 Rob Herring <robh+dt@kernel.org>, linux-omap@vger.kernel.org,
 Adam Ford <aford173@gmail.com>, linux-arm-kernel@lists.infradead.org,
 Tero Kristo <kristo@kernel.org>, linux-kernel@vger.kernel.org,
 Andrew Davis <afd@ti.com>, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, 

On Mon, 15 Jan 2024 09:55:00 +0100
"H. Nikolaus Schaller" <hns@goldelico.com> wrote:

> > There's no reason to disable it in the DT: the hardware block would
> > still be there and it's rendering to memory so it still could be useful.  
> 
> Well, if you know that the board does not have a dm3730 but a dm3725 without
> GPU it is better to disable the GPU completely instead of loading the driver
> and make it detect by some internal bits that it has no GPU on the SoC.
> 
That is at least some valid reason.

> > If there's no display on the board and you really don't want the GPU
> > driver, then you can disable the driver or block the module loading, but
> > it should be a distro / package / user decision, not a DT / kernel one
> > still.  
> 
> The same holds for aes: dss: dsi: hdmi: etc. If they are not used by some
> board file, they don't change a single bit of the DTB [1] which IMHO would
> be of reasonable concern to question additional labels.

There is some difference here, some hardware can just not be used without
wired external pins, the gpu can be used even if no display is connected
either to accelerate some remote access or you could use the gpu for something
completely else...
Maybe mining bitcoins if temperate gets too low to warm you pocket ;-)

But as these labels do not harm, I have no strong opinion against it.

Regards,
Andreas
