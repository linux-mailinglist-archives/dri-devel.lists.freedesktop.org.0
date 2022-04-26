Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E09FE50FD56
	for <lists+dri-devel@lfdr.de>; Tue, 26 Apr 2022 14:42:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7646010E6E3;
	Tue, 26 Apr 2022 12:41:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A228B10E6DE
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Apr 2022 12:41:51 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id F3B995C0074;
 Tue, 26 Apr 2022 08:41:50 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 26 Apr 2022 08:41:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1650976910; x=
 1651063310; bh=SgI0L/1WlWgshKXX27UtUUvssrv2YQvwIA+VNKXKllA=; b=w
 cfv6dP/e+RxvqAtKVyrLaeVrUDKYdZuo3xtGvwK0d0fNQOGfoYNgfMjrKglV5WTy
 /P5gGh2eUI8ReAk3jF+kROFdTVAHKnkH42pr4uyPHF1zBriOz5WwLvWcdJIt/ESY
 8F5uUyC0YE9uwPJRzkbr4AojXLTocHBjrSbEB0SX2D/pB5wYPPtOeoWZwGsHLzDr
 9wV5JSrD2Hh4QKl/3ZmG8+ckOAzwka0QDKZHulP40E7fYnRYh6IlgfIcI6rZt81q
 tvZLKyoGCFimPskraYs7VsOMffZ8QCJmi8+ieLZd4xcqieQh+H0Kdomwr8YMJwhu
 hDInhCm3EYvwPszccPsWw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1650976910; x=1651063310; bh=SgI0L/1WlWgsh
 KXX27UtUUvssrv2YQvwIA+VNKXKllA=; b=cx3HRloJBuB08s8rREExdCU6YfzvK
 vvrpWPi+lZkdEYlYr0Lke42/1cF6nYvJ14wLr2Yo6UyQcmIJB7OD2uPwL3D+QneR
 yz4N1RZRwdmpG9xXCfd85fdspOlXgvFyXQn/Qd9dYhI2PlmliUhIPAALi91+M2Cn
 pMCMEs6/nCbJBti/I4VvJRhY+SCmGpAOmxkFUG0JSPSCNBNdQZ3Kv6E5/gJSaTpu
 VHIUXfy80IqijTzBOarLeGjSP50CGiK6ISvDLH40/qqt3H0cj25wzjZIA8CEcZS5
 ina1W/Evd2u6SddXbkyijQlKV9ad/MgH0NIPRxPIqt9ZIEA7Tes6byDnQ==
X-ME-Sender: <xms:juhnYrum9ofuAVOWoI4dnecTSyJuYDi3cYkJrpBog2AOQwSgtg8i8w>
 <xme:juhnYscbK6RkAXrZ6hgMM0Fih1KWl5WCTmPnRFLwEmC0-e0K3HHezGzIamL7xxfN5
 Ea7SCqJLrbK8scxmZU>
X-ME-Received: <xmr:juhnYuz1I8ZdNRgW8vAbaltv6tJarwgiVHi_jH4AlZlW8FfFttuBidNNiDPTjdMmSlCmF3PIWeAdMWcMw8pvpa-OhiKR9oheKIi8kWs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudefgdehvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeeuieeggffhffffieefheduieeuvdetgeeufeffvefgtedvffehheekffev
 udefieenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:juhnYqMptU7adTxfUEVCcb20Hry4TkDJ2FdgDSwtsinNkEo6leWb3g>
 <xmx:juhnYr_wEj8rONu7D0m5HnUUm-9--TvlY-GALkAv9mBynNbduBVYzg>
 <xmx:juhnYqW3VvLOzBuJehU-NbyrwEthlifmePZmzIBuQXaTEVR-aJ9fBw>
 <xmx:juhnYhdbVir_tQPX1k9Fa8K-lbvamQPkSLKpXGaNBnx5jLEeYRBbsw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 26 Apr 2022 08:41:50 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <mripard@kernel.org>,
 Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: Re: (subset) [PATCH v3 04/14] drm/sun4i: hdmi: Use more portable I/O
 helpers
Date: Tue, 26 Apr 2022 14:41:33 +0200
Message-Id: <165097689885.514433.12561665113826982347.b4-ty@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220424162633.12369-5-samuel@sholland.org>
References: <20220424162633.12369-1-samuel@sholland.org>
 <20220424162633.12369-5-samuel@sholland.org>
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
Cc: devicetree@vger.kernel.org, kernel test robot <lkp@intel.com>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Maxime Ripard <maxime@cerno.tech>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 24 Apr 2022 11:26:22 -0500, Samuel Holland wrote:
> readsb/writesb are unavailable on some architectures. In preparation for
> removing the Kconfig architecture dependency, switch to the equivalent
> but more portable ioread/write8_rep helpers.
> 
> 

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime
