Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9C1164D776
	for <lists+dri-devel@lfdr.de>; Thu, 15 Dec 2022 08:59:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B37710E31F;
	Thu, 15 Dec 2022 07:59:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21E0210E31F
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Dec 2022 07:59:33 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 75E3A5C0113;
 Thu, 15 Dec 2022 02:59:32 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Thu, 15 Dec 2022 02:59:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1671091172; x=
 1671177572; bh=XxJENoxJPrXK6VoYTo12KmgD5xuHGRhCp9WC7SZ3Alc=; b=F
 Jg8ivcguRZ/JH+HYpXq/tCX+KiubFOjIBhC4WTazoovo9UK9MAMwFlHO9MvUAzRR
 fF9D6eTN+i2NWyelGFQhZdjIk8W7Crxi/b2YQAqQ+qtPt/sxyXR+KNeIoc8ZxU25
 sGTditnTqW4XCFn71zDD6g40dAaUcclcN00XRVo1K/DLfYL/7bFM8EW9DRVHjOTr
 EALzOaHUPn1ChSlM2ZjfbDycOtmiYKNJap+qot+hjfX9eaJQm4zq8tJKyBHVCnTy
 BokGI/9CynhDZKMqZAhvGFQo3ssr7INg3DnICw3LigaZPcb6LvGYHk6LUHmFlkDk
 h8+hBdbFUBBtnsQvVUrmg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1671091172; x=
 1671177572; bh=XxJENoxJPrXK6VoYTo12KmgD5xuHGRhCp9WC7SZ3Alc=; b=w
 R+ib27vINEcyCsvvOSa2brfa6mVwUf8CYjYesI+D6l3GWo1X2rIFAGX6g9xCKpy2
 kDoM6E8EHCuRySeXyO4WDF6vYJsTmetLVJtf0voU/uvDHPdZxRKG9rKeMe6DntPk
 c6bWt4LQfIP2Brnbuylw1gV7Cu/p8aepk5ldA86+pcgtg1JhdkDBV8HzytVgustT
 UX6/EsImpXoJXlzaKgBEDCzqmGEOQkl/PghlkQqJX267j9ZxvVhYv6Oj5yp26xWJ
 bxBV2AL+yLVwm2l2qA7m2GhAzSWDi7hLVS9n2dpp2mwTJ/zmUQjm85hf4Uvg7rfd
 SPUh9mcPVkxQJp92jg3LQ==
X-ME-Sender: <xms:5NOaY09jpx9EBtAJ0xIyMIn10X7CcQ6QL7URfwmgvlBbPS6JvrNzFw>
 <xme:5NOaY8teSDTKYOpZveRjqBR5rms8jpGzZzwTPlr-dob7JwuQ8-U2jtCY7GwGYvQJM
 adw50TmCE6XLj9hNoM>
X-ME-Received: <xmr:5NOaY6AWf6wrSCowE4UcTJGHp1IFBNKvfk0Zlh9VHFCJMof30hEYOFAvyOxMglV-bsOtvQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeeggdduuddtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepueeigefghfffffeifeehudeiuedvteegueefffevgfetvdffheehkeff
 vedufeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:5NOaY0fO04C0BiSNMiaw4Nu7D5xZOwarzh_fT5oaFay1dypgI2Fx5A>
 <xmx:5NOaY5NiOh0DT5T9htsDLLxk-vDtcxc6rqtzYIUMQm3bMReEgIej2A>
 <xmx:5NOaY-mm1sCsktaJgB9CA84vW4LZG0VXYmBJshv1U0zFb-9NZPol8Q>
 <xmx:5NOaYwkcQgMwEdyiVn7gCtgPsC7dTKwqCwteZNPwLzF6tszWmBM5dA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 15 Dec 2022 02:59:31 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Maxime Ripard <maxime@cerno.tech>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Emma Anholt <emma@anholt.net>
Subject: Re: [PATCH 0/6] drm/vc4: dsi: Conversion to bridge
Date: Thu, 15 Dec 2022 08:59:29 +0100
Message-Id: <167109115427.120387.17469145550626590243.b4-ty@cerno.tech>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221207-rpi-dsi-bridge-v1-0-8f68ee0b0adb@cerno.tech>
References: <20221207-rpi-dsi-bridge-v1-0-8f68ee0b0adb@cerno.tech>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 07 Dec 2022 11:22:43 +0100, Maxime Ripard wrote:
> This series converts the vc4 DSI driver to a bridge. It's been in use for a
> while on the downstream tree.
> 
> Let me know what you think,
> Maxime
> 
> 
> [...]

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime
