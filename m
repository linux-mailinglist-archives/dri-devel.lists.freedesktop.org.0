Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1357A445148
	for <lists+dri-devel@lfdr.de>; Thu,  4 Nov 2021 10:44:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AD316EAAD;
	Thu,  4 Nov 2021 09:44:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 557A96EAAD
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Nov 2021 09:44:05 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id 9342F2B011C7;
 Thu,  4 Nov 2021 05:44:03 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Thu, 04 Nov 2021 05:44:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-type:content-transfer-encoding; s=fm1; bh=
 q/9iXf3ciu+VeUFm5cUHAnh7DoJwxpfRzI/3c5qqS9g=; b=fF6Blyy7r8z2gmts
 wETVIusgFJ5tynfFW9BwteYSb8L1vHxtQRm06Srd7RzmZCfmNQBZarvy+mWjjZnt
 NzlweCx/25Sl5BNFWEAaKew93/f7nOIUsbwnG6OZVjOJmHYbVoOzHN0vdbWh0/HZ
 BdsZ4G5VN5G+WAy3a8ChXximTZKTXGqtFh82XeEqcRqLVr+MhC5ykMopfzXCdh/2
 FEOx3m+85uiU56HHGmigxh30MwM7EOSterGs4H8QVDDOpQ1hkzcTkfV1zidYNTnn
 2VnlMz4xmFnZkodkHm7XFTdng8RCX2dYuA/dnTTAlY0ZamtiEAUSw0eF/yRUfi6S
 qLII5w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=q/9iXf3ciu+VeUFm5cUHAnh7DoJwxpfRzI/3c5qqS
 9g=; b=SXy3HQ1Ez+8mHUVQSyregBXb9+wzJqMTGoKZUEujweJAtUqAR2z8HRQd/
 l1HdH3ZJVSoNpF1cLyQFf8GhU0oWCCHUJwxOY2wvogjp3rEMoJjMsQAWYduhxWkz
 5vdvYOQ1GNvCtQyrGxZVCckGClcaNQVoVaewIgz0b0QnqCW2X7hQYvLUNo6cObvQ
 orHvqXUsvRrT69XMs0h74PcFFFS0MewjVqUxQwJFVltOgDXP0BwK0G4c0un23zGN
 PXnPFEh3sAwy/VFpeL0EgAP3D+2H37KTw01HzYMg4k+AuFFQvnRiNS+EwULPAd0O
 vdsAS9wB7Fzu330f2o7iGjEyLKrLA==
X-ME-Sender: <xms:YquDYZ1jf2pFF0SHV8Tnbbhlju5hY5cIpmtaQtwl93V0JIQCQN_Mfw>
 <xme:YquDYQGUbg6lgL_ABvXigY78DgtlUjxzNFTbxlqXM0GyVfS_cfnfiaYX6xgMjo6w_
 J60ZntZ_Mu3U6fD46Q>
X-ME-Received: <xmr:YquDYZ5CWsT5wmE8iYr05LfSdpvbMvZuDYXJZtnzZpg8dxVK1-52DjvEmpwAS0J2HbDyzj9o972tHQ6a-EgmPwT0F2GPCadWWaRbgKI_>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrtdeggddtfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepjeeugfegkeffgfeuvedtvddufffhjeffjeejvddvudduteehhfefhfefgeei
 keeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:YquDYW2902SOQjwRWGRtyVfyWGuNrEYVAPYxGF5Npn7vvxci3owYsA>
 <xmx:YquDYcFZF43BKffCCr1YxbcXw_m17FnwBgAy6IJ3gDEqw6ZiUVeBxw>
 <xmx:YquDYX85Z6rh-Q8GFC8wtfzUQG5rVFS-83e6ReDkOAxGXRY0KzlSng>
 <xmx:Y6uDYZe3fzVtDEY7F2BDhAfj_x7DWR_vC1naAg8M-aYYTSHM--z-dFYHmdw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 4 Nov 2021 05:44:02 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Daniel Vetter <daniel.vetter@intel.com>
Subject: Re: [PATCH v8 00/10] drm/vc4: hdmi: Support the 4k @ 60Hz modes
Date: Thu,  4 Nov 2021 10:43:58 +0100
Message-Id: <163601902673.143658.11078290700352959058.b4-ty@cerno.tech>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211025152903.1088803-1-maxime@cerno.tech>
References: <20211025152903.1088803-1-maxime@cerno.tech>
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
Cc: Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Dom Cobley <dom@raspberrypi.com>, Emma Anholt <emma@anholt.net>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Tim Gover <tim.gover@raspberrypi.com>, Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 25 Oct 2021 17:28:53 +0200, Maxime Ripard wrote:
> Here is a series that enables the higher resolutions on the HDMI0 Controller
> found in the BCM2711 (RPi4).
> 
> In order to work it needs a few adjustments to config.txt, most notably to
> enable the enable_hdmi_4kp60 option.
> 
> Let me know what you think,
> Maxime
> 
> [...]

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime
