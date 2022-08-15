Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B4A17592A71
	for <lists+dri-devel@lfdr.de>; Mon, 15 Aug 2022 09:47:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D194AE67F;
	Mon, 15 Aug 2022 07:47:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EF9F11BF2C
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Aug 2022 07:47:20 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 71C745C00B4;
 Mon, 15 Aug 2022 03:47:19 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Mon, 15 Aug 2022 03:47:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1660549639; x=
 1660636039; bh=khmr8My1/aYtGWoyc1tu0pnFYFeZzQHpVSJzTcR8GWc=; b=l
 hv2dMSxbgNyYg+5kzn7scng8/sD8mR1YIAT42WGkQLmdEd+/I26aKgp3iW5tU0UK
 /OPloBRT0KQq6VdvkgOonbXByKBzTn7JRxY0WHbW2GemTEvI4ssjU/5l9OCZMCe2
 sv/XubdZdrCOEXN/gluaGP1A8DYawbsbmd6GxAZSi878j4Q4t6r8ENxl0caE8emX
 fKfHdj28NOG8EYPQ/cxlWaUC0BZpeN/jyodroHHllcHjltxy9Fs2z1hQZ7nBZb/s
 ljU5irohL+FSoW9OnsH7xZ+evh045J1xG2GpJRCfcrj2Zg/aLpHZMcNFs0tyMJBd
 odkoAt7K25oTJhi5yBIZw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1660549639; x=
 1660636039; bh=khmr8My1/aYtGWoyc1tu0pnFYFeZzQHpVSJzTcR8GWc=; b=W
 J726LH8dCVK/IiKs88VCwZbwbqIf51A1YKauLzBmfpMZtTIMz2lkcXg/hOXZnrVk
 OWrQN4Y38CkJSJ48jG59fwJ4c1iQ7wqdS+UOKEZ3QcijMJ1Q+D/EyPGoaufZTQnA
 IPT9lGgsMe6KLI17pIztTtFJjj/WayQb3CCtJMZER2dQsodLqnVzuPGrFZFOJN+e
 C9UDmHPorR6dfFmsQSWDr3UacvBZsfy/gtqJGsguBIyOslM1iOer80ThSPnhSuGL
 bmf2arvAJyoK8SerOJ9vGfdIR4XESosHwFituz9tYS6M+r4fBCjVqQ1AJJ2Rvs0d
 1ks+e7y4Ja9As3jQi4VPQ==
X-ME-Sender: <xms:B_r5YkrDBIW_EjmJuqR-3fvbb_dAuoPWhGByabUAkTRZkzSippV0RA>
 <xme:B_r5Yqq-qWad0PSINUNTlCjt-ghpSMen9KxF0GJM00LQKm92_LFqDvBDMx6e_jFV_
 YX3zRRl0hROxLYxgTU>
X-ME-Received: <xmr:B_r5YpNCq1-9CQzyZ8isH8CplhuIhEZSMtUTAjVjPGFaqhTu2NfXA9cWsNM1>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdehuddguddvjecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgjfhggtgfgse
 htkeertdertdejnecuhfhrohhmpeforgigihhmvgcutfhiphgrrhguuceomhgrgihimhgv
 segtvghrnhhordhtvggthheqnecuggftrfgrthhtvghrnhepueeigefghfffffeifeehud
 eiuedvteegueefffevgfetvdffheehkeffvedufeeinecuvehluhhsthgvrhfuihiivgep
 tdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:B_r5Yr7WIriCAAvZP4-pzXbDltTmsUO_d_I1bSWwA8YWsevXOux4cw>
 <xmx:B_r5Yj7nL6vttUJ4MCWMM7yLAqcAq6oiE5SWEyVqXsoRDu778RHYZQ>
 <xmx:B_r5YrjFNV8yZ_HLg2uTCyNtS378VnB-y0SxZ3gf0IFzJuhKrM8-gQ>
 <xmx:B_r5YgEjs7Htgfnr0w-A7G_eKGuMCyjJyVRYKnJCLQIgaaJzwlcWlQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 15 Aug 2022 03:47:18 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: jernej.skrabec@gmail.com, wens@csie.org, samuel@sholland.org,
 mripard@kernel.org
Subject: Re: [PATCH] drm/sun4i: dsi: Prevent underflow when computing packet
 sizes
Date: Mon, 15 Aug 2022 09:47:14 +0200
Message-Id: <166054963291.173470.13302885096018416390.b4-ty@cerno.tech>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220812031623.34057-1-samuel@sholland.org>
References: <20220812031623.34057-1-samuel@sholland.org>
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
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 11 Aug 2022 22:16:23 -0500, Samuel Holland wrote:
> Currently, the packet overhead is subtracted using unsigned arithmetic.
> With a short sync pulse, this could underflow and wrap around to near
> the maximal u16 value. Fix this by using signed subtraction. The call to
> max() will correctly handle any negative numbers that are produced.
> 
> Apply the same fix to the other timings, even though those subtractions
> are less likely to underflow.
> 
> [...]

Applied to drm/drm-misc (drm-misc-fixes).

Thanks!
Maxime
