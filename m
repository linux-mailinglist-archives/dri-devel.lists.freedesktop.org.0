Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1675E5098A4
	for <lists+dri-devel@lfdr.de>; Thu, 21 Apr 2022 09:08:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9F6010F35D;
	Thu, 21 Apr 2022 07:08:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D268B10F371
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Apr 2022 07:08:05 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 3B75532021D6;
 Thu, 21 Apr 2022 03:08:04 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Thu, 21 Apr 2022 03:08:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1650524883; x=
 1650611283; bh=zhGTdnMvjNdHi/Qi+FIiOX0v5nYystuMU+uYF/3P5yU=; b=B
 up/ZQGMP83L6AX8iC753ijdFUmJM09LMiKUCSTzv+jKpsKaLVznWGyCr2N/f8lEc
 zCtqoTcspCVfquvS9gM4pAtVxNlpf8yv5bJhNOht5kCu78hh7yIXW7BfF9M5IS0d
 cNXagBhT7EhtJln7OSoiEMDwbFzIzhIc9UzUmZeKmM4ZrD48QeUybxhzXhVYhEXq
 UGdIJa9UdDLr9SimTJkakcINdIVZpGk5lm4zbu8HfpUSSHBl/rDDxzUvo3o3jed1
 crCVLLkb9dOqDFzarfgk7yLVyXbsp/tY3TIJwBbRbYg1sB3VwnFh+g0xPUn52166
 0kV8vFVvtoWCZK6SaAkaw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1650524883; x=1650611283; bh=zhGTdnMvjNdHi
 /Qi+FIiOX0v5nYystuMU+uYF/3P5yU=; b=GgI3LTN3TxwYahkVUVGzXbiviNkpn
 cZykYzSuSc0+Fj9IVxXj7/aaPwTLzeaBNWmHfqAjOCU1EuZHbsIUKEWIX+cc7Ek9
 4ZSi2/Ez4S/ptgdLMm2QMYjNBf0NRq0sLEzFl027ETAfNzOVvtqVwQJ7lmulVsQ8
 hTdPLa8rQ/wutpPF9UfRhEoJ65R8cZB07mWg1HiqTrN1yjXZOfJVajlPxQ8iG+fM
 uOvuDHRveFQOx12TkLpOVjNuyw1jKQR0Zf/K6gCAcK86ONBaMweWGLYSnlJtgNP9
 K0FJPvNOrx56awGr+oOE6eqnpzfWT4XTQUKAPyqWN5ey/msPF7ekyDOtg==
X-ME-Sender: <xms:0wJhYlATUauD7u3xytbIjLolYqEDdnEP_996XF2V72szHKicUMd3rw>
 <xme:0wJhYjg1lT7BuiHXsJ4e8nhPEqfbpVB3lUwlhsdg2xPHy4g1-1W2opqusy8BzlZCQ
 Ns_otvQDl2gL9iq-E0>
X-ME-Received: <xmr:0wJhYglRWEpyvF4OeHUuPI2ybq-ysICZTQC-f8hLUQmyBxinNWSO6cJePd9X-or6fYHVCTjv-GrO39UMH_Dw1mxxsDEzFnSgoBKbOvo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrtddugdduudejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepueeigefghfffffeifeehudeiuedvteegueefffevgfetvdffheehkeff
 vedufeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:0wJhYvwCmMfl4yqvP0zXellwN96IubMZrKLb3ufHJpcN8bac-ZqaMw>
 <xmx:0wJhYqRx-xJdQRWD3li8O40QKWMVUHcdmVPEv-g2qMGmp3KmUcZ-Nw>
 <xmx:0wJhYiZXP3mjLP6-il1_tPgeMabPiq32EMq6q46ifLsC7U_iEVgzjA>
 <xmx:0wJhYtGN0eBWZBtdhalqd5OZjE0Da2Lw7MI68ne5kdqJBbSCJ-nWuw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 21 Apr 2022 03:08:02 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: emma@anholt.net,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: Re: (subset) [PATCH v3 1/2] drm/vc4: hdmi: Replace
 drm_detect_hdmi_monitor() with is_hdmi
Date: Thu, 21 Apr 2022 09:07:58 +0200
Message-Id: <165052487605.604528.10032986476902176653.b4-ty@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220420114500.187664-2-jose.exposito89@gmail.com>
References: <20220420114500.187664-1-jose.exposito89@gmail.com>
 <20220420114500.187664-2-jose.exposito89@gmail.com>
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Maxime Ripard <maxime@cerno.tech>,
 laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 20 Apr 2022 13:44:59 +0200, José Expósito wrote:
> Once EDID is parsed, the monitor HDMI support information is cached in
> drm_display_info.is_hdmi by drm_parse_hdmi_vsdb_video().
> 
> This driver calls drm_detect_hdmi_monitor() to receive the same
> information and stores its own cached value in
> vc4_hdmi_encoder.hdmi_monitor, which is less efficient.
> 
> [...]

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime
