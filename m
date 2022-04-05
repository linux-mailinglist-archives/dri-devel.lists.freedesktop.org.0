Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A7F14F2623
	for <lists+dri-devel@lfdr.de>; Tue,  5 Apr 2022 09:52:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90C4E10EF55;
	Tue,  5 Apr 2022 07:52:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB42210EF55
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Apr 2022 07:52:44 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 565BD32019B4;
 Tue,  5 Apr 2022 03:52:41 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Tue, 05 Apr 2022 03:52:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; bh=NB2LbP1FrwX2aE
 jxzBIBvIHerPLRI4UZ+k3FQ1DQ++U=; b=r08fQ8GDXhzr6sE38pxAGjA1wV+sf6
 n88Q0if4MkGsq1iLipwxU7v2OCzUDVJI1MThBpJPZ4BqUZs7zhbhAu/Dkvuu4zF7
 e9U5WIyaUwJWei6u2exFN9fhLt0LtCmt96/TBjkZqJ89wymlhZff6eoW4m+8hH/9
 KUPVH97KIjRXE43MfP1O8KyHdIsCzmKJQX8prNiFd2Aj8EI4l3PIdCubmjaf+ygZ
 SAi6hAeF62f71OXh9OCvivnt33oylreWzlb2GCZqg4eaCLihdyJ16Fw8Gi9zJztw
 uFvT5rhXwy+xxrN0cOVJrul3y3nj6k74e0QoK+ejUaPWoc/kkueO2KhQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=NB2LbP1FrwX2aEjxzBIBvIHerPLRI4UZ+k3FQ1DQ+
 +U=; b=FvSD30clfwDk0JltxUd/u4IM1HazJIBlkDx2eE7JFn6nwAxUYZqSPPj82
 Hc6qIJ8TYxoNSm5jH0glOkJ0NfKr+cmRt+brK2e/NgBhQk1W4ryeoVbiFMQtyhzQ
 RlIXOf9FlOVyGI+o5Ng0hnCRsdGuQqlbfwu5/CrU3b+ID+bcNn2nUObwzQ5HJotz
 HzVPMnCqeOXnuYW8+8BhPKkPK4BPmsjYG4DzH+zlFbx1LMU/DJSiSuT1CTrEAuJL
 Dfyzd6FLCjTlF4J2tGsDgP6PxYlxQJbKijTKKfMR12ZmW59QsS60t2BtQ6Z3KKwE
 5jihPM41rPdz7+safiiTGf7ZMofUg==
X-ME-Sender: <xms:R_VLYjJ6epsgLoYYNqqslJpyaT-r2AxKxsVS-CJlWxT7rJRQ1CB0Dg>
 <xme:R_VLYnIP_YadvZ-x6Z8oyzrjt_gohClc-FjlFmuC932p5YgEZnXti7wqUSKuYuzDY
 oHuM-moL_19tRBF3CU>
X-ME-Received: <xmr:R_VLYrtXGObNlp_ccokaaisDcoVctjyxbW6yyYnBkuaiGGILqLOLDniOsKcjHCvp-HvuqV32BSxbwHtqFYuiBCssPalq-SHekmYs8BA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudejfedguddvhecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepjeeugfegkeffgfeuvedtvddufffhjeffjeejvddvudduteehhfefhfef
 geeikeeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:R_VLYsbIdibEyGX-AzYNoLmNSFIxDxCzcty1tUovNOaLtCtNrGWQ4A>
 <xmx:R_VLYqYkwR_XRmlKYkc10Tl1LNMdgICLQa8bwpJT6J0aoUGISN5JOg>
 <xmx:R_VLYgBbGEpewcOtJfCTT0OkugIfEBuMLTxGFXlKWZzpngwJer437w>
 <xmx:SPVLYiokYKuYHuhN6v9AQYsGfzrtHy29NV0iLHsWFeNstGvbU7wgFg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 5 Apr 2022 03:52:39 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Maxime Ripard <maxime@cerno.tech>, Frank Rowand <frowand.list@gmail.com>,
 Rob Herring <robh+dt@kernel.org>
Subject: Re: (subset) [PATCH] dt-bindings: display: bridge: Drop requirement
 on input port for DSI devices
Date: Tue,  5 Apr 2022 09:52:35 +0200
Message-Id: <164914514524.239878.12110659661404307221.b4-ty@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220323154823.839469-1-maxime@cerno.tech>
References: <20220323154823.839469-1-maxime@cerno.tech>
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
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Robert Foss <robert.foss@linaro.org>, dri-devel@lists.freedesktop.org,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 23 Mar 2022 16:48:23 +0100, Maxime Ripard wrote:
> MIPI-DSI devices, if they are controlled through the bus itself, have to
> be described as a child node of the controller they are attached to.
> 
> Thus, there's no requirement on the controller having an OF-Graph output
> port to model the data stream: it's assumed that it would go from the
> parent to the child.
> 
> [...]

Applied to drm/drm-misc (drm-misc-fixes).

Thanks!
Maxime
