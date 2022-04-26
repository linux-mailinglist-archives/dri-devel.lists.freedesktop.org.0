Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 79A7350FD50
	for <lists+dri-devel@lfdr.de>; Tue, 26 Apr 2022 14:41:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37AB710E6DE;
	Tue, 26 Apr 2022 12:41:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC54A10E6DE
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Apr 2022 12:41:49 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 19AF25C0110;
 Tue, 26 Apr 2022 08:41:49 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Tue, 26 Apr 2022 08:41:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1650976909; x=
 1651063309; bh=rMj4LAUUoziE5o+qh37/fERJRYehAMHIKvHbFsqs2uw=; b=E
 5K9mGM42CluURh/vuE9rYPgvnCxFAqxR9FzSqtzgAQMR5FCozfKm6T9ph08DrpBs
 qGjI8xut0x0A+hev4GI7Qm+aDJfdPmzhzvZKomSyuD0bcqzoOToasSrFF3jwUnNZ
 v7M1so/Uyme7vxG7U+dxtyAgLXox82/hfFL0S99Auc2ilj57zhlbSY8YD+1EedCm
 vuee28g8mXkgUeGCmB3pbNBE/5MudKeIspBQO5SloLYpja2w2My01rLmVCryFna/
 RhcFZAkBlqaCWQDbP2mqesFsMtj9EqsbcT460usLHr0/JU0bo2qzzHiGQQGsofqR
 orELpiQyHn4f3TQeBAGmw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1650976909; x=1651063309; bh=rMj4LAUUoziE5
 o+qh37/fERJRYehAMHIKvHbFsqs2uw=; b=x0U4Qh/EAWbXJupTOyjWi5017sxkr
 pVzMzkBxiUMERrB+M8Fwt7NstAsTpJuxZmoy3WwRioMMZLYqeKXvwmQNKRG182VT
 BocTQ18NhWlfWhQuNR8rMgKI3Oe65pXrEQWS4P1mPbZsZQdIEFSY9Nre9dqVTBPI
 ejwT/4ZPjTOY9UGGHzRdWfSpOs2BUReTt+cmhq46njgdnZbuYVG3iFiZOUtR37kE
 7EyFsUoJKs8UL4ZMWAKF6hBVEs8h8/c8kO/n5C0QUUEO+yuQQcCyLQRHk7ht+OqX
 fvA2olI8ytonLAkJxVi+UBPUi9NzqQPwEJho182nvsVhhOtrfVr0fSIiA==
X-ME-Sender: <xms:jOhnYmjucyb-FO0-0AXqX_XVPHOLStjhpytvfyJQDhWKuYQyDQQLEw>
 <xme:jOhnYnAOZMf1Hx7y-ehBdbzEJkMRGOhjAwJ2w9qmoWhRi72HhW1aa04l2Wfl0Vwa6
 d9m6YxbG9bVL1Y6lqg>
X-ME-Received: <xmr:jOhnYuEdMzG414Qh67-15NDKJ34c-lFOx8gTqFaDaYBMZ2HvqJUC8coLZhyc7g0rZW6jzQukqQU7KcceFSop2DdIRcFuZxQI4LQcF6I>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudefgdehudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeeuieeggffhffffieefheduieeuvdetgeeufeffvefgtedvffehheekffev
 udefieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:jOhnYvRK680nZ4JUHzPG5rFR-gCN0OWa1TYtTI_cWUY7KL50FXEsFQ>
 <xmx:jOhnYjzmuf9uQCC1LbwI_uYvuyNgPGZeJfACAX0qiquWl2menZJX8Q>
 <xmx:jOhnYt6LN699WxcFPC1-vh7ioJ0wGqc4786HnEoyKczQ5isvUMkpWg>
 <xmx:jehnYri6Bx-LlEMl0pc9lAUJ--h9mPAWUQ7JYhNedOONhZTfU7wvYw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 26 Apr 2022 08:41:48 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <mripard@kernel.org>,
 Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: Re: (subset) [PATCH v3 02/14] dt-bindings: display: Add D1 display
 engine compatibles
Date: Tue, 26 Apr 2022 14:41:32 +0200
Message-Id: <165097689885.514433.8265569936896332430.b4-ty@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220424162633.12369-3-samuel@sholland.org>
References: <20220424162633.12369-1-samuel@sholland.org>
 <20220424162633.12369-3-samuel@sholland.org>
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Maxime Ripard <maxime@cerno.tech>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 24 Apr 2022 11:26:20 -0500, Samuel Holland wrote:
> Allwinner D1 contains a display engine 2.0. It features two mixers, a
> TCON TOP (with DSI and HDMI), one TCON LCD, and one TCON TV.
> 
> 

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime
