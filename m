Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FEDA4BA605
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 17:34:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E2FC10E39E;
	Thu, 17 Feb 2022 16:34:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EF6E10E39E
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 16:34:28 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 38F423201E4F;
 Thu, 17 Feb 2022 11:34:27 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Thu, 17 Feb 2022 11:34:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; bh=3aqriiCF9dmqOK
 SI5cL4T2h5jbnJfVMtZ36jb4nvn0M=; b=mK8z9ZXAmtHCyTD0FxRXzEiWkDdJAi
 WOS+PvBtlnSnu0L1IiCrxNMnpqtNb93qcMSH6LGIqTyuwabLRmnXeUG8I6nfYCeh
 J4QUiEVzNjyaiC1Yhsgg9ZYyanDrCAyD1g9qTjgRb+3d3LBz8C63VJbPgXP1efPb
 317ngtrh5asten2Lk7YxX0avK/sJTAq+n7FgyZ/S9NmqiaH7L6NcC2QDOYA4xuTb
 tnO/nV7Id9WvcjCsELIYyr6RW0XibuGBeognLzwleKO3OJr0Na08NIcRTB6S2xzl
 b+fowtdZGWXsdG/3e6rkmeZJ6nC8MWvq70RJDFgWyXPdL1XTySL1wymg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=3aqriiCF9dmqOKSI5cL4T2h5jbnJfVMtZ36jb4nvn
 0M=; b=aGw4gl+LCVnTgyxWf8rGCfYmHIT7gtJEGdeNLmeq2JWWkTuvoDE8zYiC+
 7dPN5vStquoVtuc3PpQgMJ2IRS8tj7S/J16CMGV4B6nANJIC0I+9duXHnlq2iL7u
 6NB8EiC0I712eHMXaRsCsCskI8coC3EEj+OuvBoT4Eamu4uGNrhmQZ9tTThiC72O
 VzHBBM+nOLuoqOk9HGGe10B3ECldQoy0j9+f9xKXVWNkEjY5843l7UPI1adqUByo
 473PxUEXiqK5iov6JgCSHWtXNTcIRj6zeWNpQiLFKzEQSnCzTcTAaTlf82KUUc8O
 zQmvsL77GpHFHwgwCRXUc/WRCGxmg==
X-ME-Sender: <xms:EnkOYvrJm1-toxaqQfx0fXJjVMjWqAZGZqvdCexZFw03Ixy6iFN3Iw>
 <xme:EnkOYpq3OfMzzQ5v1Eq5Coq25gHVC6CDHoAsWnR0jxFKwdxIIlT2C8cFNBK7ixPrh
 6n3DtW2dPuYityBXrI>
X-ME-Received: <xmr:EnkOYsPg3y9x1kG_d4VTuHf7aG2qcSK4NshwlqBkky4LlZgQbafistSz6PbCzOpEMblcerDY2Yy-hKIlP5jOFsZpGTlHABI87AE9v1k>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrjeekgdeklecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepjeeugfegkeffgfeuvedtvddufffhjeffjeejvddvudduteehhfefhfefgeei
 keeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:EnkOYi5R6RgRy8xRVGF21JgImYhMe3sveAUP8516mUa45hSCXtWw0w>
 <xmx:EnkOYu6o8jDC83_p_v3Jy19PxxXPhk_6Ab-LGsshVAlVCV837P-YVQ>
 <xmx:EnkOYqhdZntZr_W1SRoPFA4caVOXBJOLfRxr0RtIk2_7OaUnXpznYw>
 <xmx:EnkOYlZcSBnGx4Mvrxb5dgzPTbEVevqWqj7V_cuVBuqC0m5Rc5TjaA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 17 Feb 2022 11:34:25 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Maxime Ripard <maxime@cerno.tech>,
	dri-devel@lists.freedesktop.org
Subject: Re: (subset) [PATCH] drm/vc4: crtc: Fix runtime_pm reference counting
Date: Thu, 17 Feb 2022 17:34:22 +0100
Message-Id: <164511565828.1144757.10227650719967114526.b4-ty@cerno.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220203102003.1114673-1-maxime@cerno.tech>
References: <20220203102003.1114673-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
Cc: Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@linux.ie>, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 3 Feb 2022 11:20:03 +0100, Maxime Ripard wrote:
> At boot on the BCM2711, if the HDMI controllers are running, the CRTC
> driver will disable itself and its associated HDMI controller to work
> around a hardware bug that would leave some pixels stuck in a FIFO.
> 
> In order to avoid that issue, we need to run some operations in lockstep
> between the CRTC and HDMI controller, and we need to make sure the HDMI
> controller will be powered properly.
> 
> [...]

Applied to drm/drm-misc (drm-misc-fixes).

Thanks!
Maxime
