Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC63350FD5F
	for <lists+dri-devel@lfdr.de>; Tue, 26 Apr 2022 14:42:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F047110E8CF;
	Tue, 26 Apr 2022 12:42:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71A2010E6C9
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Apr 2022 12:41:53 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id C1EDB5C0181;
 Tue, 26 Apr 2022 08:41:52 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Tue, 26 Apr 2022 08:41:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1650976912; x=
 1651063312; bh=oRWZWBSDnSSkUoo07sboRF+kzsesUviO3asAK3ko1d4=; b=W
 u4rxTt/ucwRvMpRlQghB2CzuYUdchC9bNiLl6k9mTJ+te8N+4eDFKgnHEkcek+gS
 shQunxx01zdB25HS7v8aphLGzYSkSDET1dxt/1YFEAUz6NLtms2R/CRxmizWyXoC
 aB37AsKbKnb74TuKITTezlPnnLJR2YOvl4Jw/MtWuG78kVhWcdaU39IaNq/w6f1v
 2jBQtX5bBR9R9XYQfzhf5WstskcEwnnLR/9mmoLOSfGzRKsgdLQJahEoMjWMPbNX
 uQxQX0GpMZLewYpMey8Z5oKTUoro57VNSxTVlApzTtZS8f7jf7dqBPAAqcWTSKQ2
 0cyjkbIzB0zs4MT8gEOmg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1650976912; x=1651063312; bh=oRWZWBSDnSSkU
 oo07sboRF+kzsesUviO3asAK3ko1d4=; b=qD72JznDaPnl6zQAntQ5fkM5nSOGm
 rBb3Q+cFDGRyZgReKG1GWgLPpt9Eu10hurPGC7FV/ploPGWahehxIvPbKOlttBUg
 efkNFpxhTlH/aCpSzthwZeiBuNNqpVlwCYrG14u9EZgu7mRRTktxo9qWEjiWWf8P
 AGS6f4e0uesdT1VS09OrRsit/LqH13/rliS78e2Eq+PfEBChj1aK596V470k4qBe
 9x1kPyE8M4azLAMrpOgQ9OqS83PbmadvlGFNjr5GZQZYfl0Qfbqm9cYICwwsM1lC
 MFpk/KTnsfabmXwIN2Wcj4SJa88LILjpO0HcFpmEkhIKomWAyyxiEStfA==
X-ME-Sender: <xms:kOhnYktS2KxYpcMgLL9aadE-2PVLurVgXSJSk_dA_n5d-oapsUEVug>
 <xme:kOhnYheIJCHM691StZ2Ane-ymET0S_co-WwCWY-40rZyUxHv-jkLsjMj9wag8wMfl
 ftTcILWFFiKRbpehh8>
X-ME-Received: <xmr:kOhnYvzzZk339wOkMMy2UghhW6dsSc2YKSPIdlr32OQzsM1U4dGw6HRxe7nMtPtmNM2ECk0qrzW4N6h6pb4whkswz_iaykMyUMP5cWI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudefgdehudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeeuieeggffhffffieefheduieeuvdetgeeufeffvefgtedvffehheekffev
 udefieenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:kOhnYnO2PS0Ey3hsclGX9QwbpdlxSTUpZj3tEhMI8RETIC8xmY05ew>
 <xmx:kOhnYk_Fed0CrAEC3QEfYfS-LoUvvUSoUBsGWN-Y0X48fb6m5EbiSQ>
 <xmx:kOhnYvWY2JsxnJP5sKTfDgkKnOHQajX-jvN3QGTQzZqVyafNofTyXw>
 <xmx:kOhnYvVzilgTphkkE1te8YnYHIDKuz_GQhAMlK-yRyBaMFyIqB7ZVA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 26 Apr 2022 08:41:52 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <mripard@kernel.org>,
 Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: Re: (subset) [PATCH v3 05/14] drm/sun4i: Allow building the driver on
 RISC-V
Date: Tue, 26 Apr 2022 14:41:34 +0200
Message-Id: <165097689885.514433.10051703759938429783.b4-ty@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220424162633.12369-6-samuel@sholland.org>
References: <20220424162633.12369-1-samuel@sholland.org>
 <20220424162633.12369-6-samuel@sholland.org>
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
 Rob Herring <robh+dt@kernel.org>, Maxime Ripard <maxime@cerno.tech>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 24 Apr 2022 11:26:23 -0500, Samuel Holland wrote:
> Allwinner D1 is a RISC-V SoC which contains a DE 2.0 engine. Let's
> remove the dependency on a specific CPU architecture, so the driver can
> be built wherever ARCH_SUNXI is selected.
> 
> 

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime
