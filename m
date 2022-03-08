Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3DD84D160D
	for <lists+dri-devel@lfdr.de>; Tue,  8 Mar 2022 12:21:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2A1610E5B0;
	Tue,  8 Mar 2022 11:21:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8A4710E5B0
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Mar 2022 11:21:11 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 8C99C3200F81;
 Tue,  8 Mar 2022 06:21:10 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Tue, 08 Mar 2022 06:21:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; bh=CdZrMhODLMAY5p
 aagnkeQEyFhM0Ql5esHdKus1Ks+Yc=; b=ER3t45+fI9cauoJdFopJJ7DyXgozQf
 4Gyqn8yNQ9Zmgv0qe7gQmKw+lnQZeKWRIDj6jTz/iq7VvlaOxTqQrNb9hYhe+eAL
 gknXBTef1UTxkTrpNhl8G4JChJ7BzRNNFLj6D59+cg1kMF+YhXPubZzh7Fyz2ANL
 82dLWwl1bKIiZeFyKhMpFL9OA+zn/BttaJiXNFDM6roRe2j9secJsvrdukfJPGfl
 bjiS4bMpY0Ydt+UBufkvYNl871CQ/JgJqRUOGZTqHynzTU1webaNPUM5Sw25yHR2
 FNPaQUSYbIPXDCAUHCwrSA2q14lSIAJUtVIoapAvmzo7UnMfFmVb0h/w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=CdZrMhODLMAY5paagnkeQEyFhM0Ql5esHdKus1Ks+
 Yc=; b=Oe7MbOPKJFZBKqafQdmmjSpzzZqn9az4NfY+YyJD/8gtbn4UV3BYRUCq8
 ojYSkPDbSJiBMmdhur+CduFG1AXNUaKKKAuTI3MmozyWsgssQZMm7n+AdGNE5y/3
 tVAEPnbnsFGN0OjXLMFiDUPWLQUjliZdBum+HdXeC9THRcQKSOW0syH2JyozRyPa
 Ez+/ujfn16LdXxd3KXMnt2JQ3yt25R+9BcyPG3Wgrp00K5Or84FONTaLaiNYqBEE
 IDKgiLzRMOJXhqEMMcUr9u8zpNirlhM6YohNUXX2rUHcZx+SwPcS3X9L2O5YcEOD
 e5VtjeVTCENxf4ByW4/4aAWg0gZ9w==
X-ME-Sender: <xms:JTwnYk_7WCZRxHHZ1IHJKp4rCzM9t7XHIlTHiQ74laPyUVwJ2P6bpg>
 <xme:JTwnYssWdrxKDwbRSJYEqKaYyjhnjZJWXpevLkCPQ3YaMVDspWqncUxVixnpcG2pG
 uWLnYbVB_GQzV8d7LI>
X-ME-Received: <xmr:JTwnYqBuRlsV-bxmPCKVyRJCYg2dg0au1yjo8vHkeVL7PHJwIDkUOduPRPoJiZhmqT0LIukEDWlLrNLS5SQDt-T6ujNe-UIFUxVgH6w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudduiedgvdeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeejuefggeekfffgueevtddvudffhfejffejjedvvdduudethefhfefhfeeg
 ieekkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:JTwnYkdGxCRhefpe2ifGo0q-DBjnKNfQREJEXAM8B4CdupqKyPJpag>
 <xmx:JTwnYpN6bZb_Bg_6VP4ni1KHA0qmEig5Uci7PtrJP0E8dx5sz69AWA>
 <xmx:JTwnYuneJ2OJqr8jJVpaangkkGoNoqCHaLYzozUjiynzJKWq7HL9Jw>
 <xmx:JjwnYqHXw0fc1snHf2FbTvO8pQ0wyYIUcPx9qz5PSe7MipfWpULc2w>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 8 Mar 2022 06:21:09 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>,
 andrzej.hajda@intel.com
Subject: Re: (subset) [PATCH] drm/bridge: nxp-ptn3460: switch to
 devm_drm_of_get_bridge
Date: Tue,  8 Mar 2022 12:21:01 +0100
Message-Id: <164673846305.2436174.13416229211421085343.b4-ty@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220228182600.22463-1-jose.exposito89@gmail.com>
References: <20220228182600.22463-1-jose.exposito89@gmail.com>
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
Cc: jernej.skrabec@gmail.com, narmstrong@baylibre.com, airlied@linux.ie,
 robert.foss@linaro.org, jonas@kwiboo.se, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Maxime Ripard <maxime@cerno.tech>,
 Laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 28 Feb 2022 19:26:00 +0100, José Expósito wrote:
> The function "drm_of_find_panel_or_bridge" has been deprecated in
> favor of "devm_drm_of_get_bridge".
> 
> Switch to the new function and reduce boilerplate.
> 
> 

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime
