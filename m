Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BE2263ED77
	for <lists+dri-devel@lfdr.de>; Thu,  1 Dec 2022 11:18:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF2B010E5A6;
	Thu,  1 Dec 2022 10:18:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2256810E065
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Dec 2022 10:18:21 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 74ED15C0187;
 Thu,  1 Dec 2022 05:18:20 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Thu, 01 Dec 2022 05:18:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1669889900; x=
 1669976300; bh=SQDPbuBrjKSSl9BTe/dmiBNvmgZm3jOOEi7z1W5nu7A=; b=F
 FK6+4M7WrL/93flav3ziB+H7ncsO+tipMyQRej8ghmhi14l5pvB5Fn2h5AAwt4Jk
 0vQZ4ZaVnmGh1PrQbVI6P8pDPJZPsv3sznYs7XG9pHr/2CHg0Jp75Ut2q/QfzmE3
 6T0Wl//KBFmjNb/X3ewJCRDVcF2vJJlrkoY1wgahIzFKsZE0Hs0z17Zm+3j3AJzm
 afZSdHcs/rqUmNcX66lFAxkgZexPWGT/p7zA9PJK+9rnW+l4UJyX76QR0dOSZJbI
 lcCAYadsKhospBhJgdW0Xtrz4uGX7F7dP2Of2HwprTZ1doqimBakQz3Al7qHbiCR
 ck85SXftoocGaT+JruA/w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1669889900; x=
 1669976300; bh=SQDPbuBrjKSSl9BTe/dmiBNvmgZm3jOOEi7z1W5nu7A=; b=J
 tVINV7aOOP7O3SzjKfHh4mlAGi0jS3VGEJD9rZGsi5zu2mYfI7wndBf1Tk+PVz7d
 DM9BTIBoSxwKembXyXo2hFrrPMzCI6F4zEmV9DlEoEEWGIy8Tk8mDn//6cIY1qYK
 3vX5t509MTzDgzuT6KPyp04UgvbdCgC/moB9IyZ+ho+4xrkAqU41wChSolCw9IoD
 fmpAI51lVq8aBCg+ZLaw7BD0hKyCSwB4sVHQE58WkUknv9dPXqctH0+8UWPxi3wS
 E2QJkVFoC/Y7efrC5AX9KySWpXKkfPY9xGRf+nUf/2HU1wiL18y/QlkDqkMGIwkE
 Fr/IbOCKFXNRV3ebnqt4g==
X-ME-Sender: <xms:bH-IY_nefTlgKl44-rArxUDOTATtxXlbA4d9RFmaSiSUuWpbwHAUlA>
 <xme:bH-IYy3CbVRi9EIada97ekrtOYtP0kDPIjmSWmeZpEYPjYc8ENkZv_I1lvQsXI5dA
 VYOXQeuBNqalAuRke8>
X-ME-Received: <xmr:bH-IY1pzDI7nagQpT7splvm2mKwh2Pjc-YCYMtwl0uesRLmezo6yAa1xZZaRd8B6sVKlhnyiZAxExSpjEY0cg_z2eej3uNSLsDUQkoyhN0-o9Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrtdehgddugecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeeuieeggffhffffieefheduieeuvdetgeeufeffvefgtedvffehheekffev
 udefieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:bH-IY3lly1LFekQGEET9Yt9KfaoS-nRFriSq9L9jL2UXvZXghD7Mpw>
 <xmx:bH-IY92ulLP4KsuycHZWGfUxuuV3iO5YI10fV8KEE3FX1v0je8vR5A>
 <xmx:bH-IY2ueC2adYzdHSKbElMvnpLg42zfkvcxuab_KOqgbDLD9Z7V0Mw>
 <xmx:bH-IYxLFnfGdcthYMrHDiSmCymw9n5HC6V7bphhPawLUy5XJ-RVRuQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 1 Dec 2022 05:18:19 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: David Airlie <airlied@linux.ie>, Maxime Ripard <maxime@cerno.tech>,
 Maxime Ripard <mripard@kernel.org>, Emma Anholt <emma@anholt.net>,
 Eric Anholt <eric@anholt.net>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 0/7] drm/vc4: dpi: Various improvements
Date: Thu,  1 Dec 2022 11:18:11 +0100
Message-Id: <166988985776.410916.3768232487459584873.b4-ty@cerno.tech>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221013-rpi-dpi-improvements-v3-0-eb76e26a772d@cerno.tech>
References: <20221013-rpi-dpi-improvements-v3-0-eb76e26a772d@cerno.tech>
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
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Joerg Quinten <aBUGSworstnightmare@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Chris Morgan <macromorgan@hotmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 01 Dec 2022 09:42:45 +0100, Maxime Ripard wrote:
> Those patches have been in the downstream RaspberryPi tree for a while and help
> to support more DPI displays.
> 
> Let me know what you think,
> Maxime
> 
> 
> [...]

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime
