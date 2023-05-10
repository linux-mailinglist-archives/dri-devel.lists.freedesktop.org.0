Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ED7186FDF8A
	for <lists+dri-devel@lfdr.de>; Wed, 10 May 2023 16:04:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 861EB10E4A4;
	Wed, 10 May 2023 14:04:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DD1910E49B
 for <dri-devel@lists.freedesktop.org>; Wed, 10 May 2023 14:04:09 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 766A65C04A1;
 Wed, 10 May 2023 10:04:08 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 10 May 2023 10:04:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to; s=fm2; t=
 1683727448; x=1683813848; bh=1vkXoQOVpZfLm+0x+fnePhDMrxGxnvxny4c
 1AdhaksE=; b=qio+JIlj+Rcb/jBMxvWW9acmaPaR0YUOprEcLqK1S8tXm1GHjjH
 sCsYMbgMrShqpuNKg57hMtu3ie/Vj61EgE3WL6VnIt7yClSqR/ADgwPPFX2yf/8r
 O0ihMEBUSK9cQ/0A8qal4qjw+1/4nqDQ0QDJUJWZ5VF0kVaGvY8vq4TAy5YFNsF4
 h0+6Sn0WNfiJQLc8/ImIbuRyDGnUQXNlrVYq9F6XRv1DZHidrpQIQ06eip/oZ/Ni
 eqt9B83uAfSUE1PY/E5oSkiGq2lLJD9yMaOjecshIqmX+HvQpV565wliJNsSETnM
 YOp015hWHNrOkNoIchQlNVxFsqkibYWl6oA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
 1683727448; x=1683813848; bh=1vkXoQOVpZfLm+0x+fnePhDMrxGxnvxny4c
 1AdhaksE=; b=ErhfQ+ftvGYB156iaveyp2fezZa2Rjc/bOZaF+le5vYAIXoY9Tt
 02yjdhG+HxdwZPGMARl6QbH4vfky7N8TiJwggcFeXd6nzq0xIqeJrnM6PaVhTNyr
 7EhvEA6vjp5Yo+0O/E9ghBPZnI810cB/4adG0K4jB7wCSatSgoq0y4MvAl0+G6gW
 VJ8uJVlv9HXgvMYTaWe2s0ozQBQKmcPaxozudo/JXQXQg81dx9g02rtIYIFjMFg3
 CskTjLKd7WXjVL0QSTth1+xuvK0Rfd1a9Tu01CHthuJZEFYo15tm3vlw+zVUSCyZ
 91wq+JeRfqucd+cqCvOze2TY2tCSlBEcCAQ==
X-ME-Sender: <xms:V6RbZER0lYrwuEyG6WGp_K3bMuAy08DdYYDy7ZAod64fYGjLCoo0Sw>
 <xme:V6RbZBy1vbYAFcuZkrh2yEuGtbRcLR3wSVp8FOUM4WK1xCvslaHLL-mO0-wvGOWDb
 ap1umodeE59MnNHaGU>
X-ME-Received: <xmr:V6RbZB2drXRfnBcZcaSX2tAaD4aSIwy8ovSnZ0MtXTynBIvc_rhS4QD2TyxZV9rV-yaba_pr2crxg1zo-GHzUQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeegiedgheduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvegjfhfukfffgggtgffosehtjeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepleeifffgvdetjeejueejieehuedvteeigeehtefhhfeifeegleekudek
 teegueffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:V6RbZIBfs-oCMdp73CYqgMvzaRHX4E7YY7Xm6pVYw1Qm_S1WxGzk5g>
 <xmx:V6RbZNhtcFxxnWsvUI-UEELtNof0B-zk-4MwFIiikmvJqNzzFHCFHg>
 <xmx:V6RbZEpxlXKIecDTXlI5M2RKq-PEwsZG0j8OV5tWhSRZYu0pG9N_Yg>
 <xmx:WKRbZGZ2Z01U423awBb-bVaM2XmWeyna-D0LTOzWswKMGt0oi-Ospg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 10 May 2023 10:04:06 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Roman Beranek <me@crly.cz>
In-Reply-To: <20230505052110.67514-5-me@crly.cz>
References: <20230505052110.67514-1-me@crly.cz>
 <20230505052110.67514-5-me@crly.cz>
Subject: Re: (subset) [PATCH v4 4/4] drm: sun4i: calculate proper DCLK rate
 for DSI
Message-Id: <168372744561.19948.16842431708867540871.b4-ty@cerno.tech>
Date: Wed, 10 May 2023 16:04:05 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.2
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Frank Oltmanns <frank@oltmanns.dev>, dri-devel@lists.freedesktop.org,
 linux-clk@vger.kernel.org, Ondrej Jirman <megi@xff.cz>,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 Icenowy Zheng <icenowy@aosc.io>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 05 May 2023 07:21:10 +0200, Roman Beranek wrote:
> In DSI mode, TCON0's data clock is required to run at 1/4 the per-lane
> bit rate.
> 
> 

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime

