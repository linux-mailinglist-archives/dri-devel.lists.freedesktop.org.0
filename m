Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDCE074D20B
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jul 2023 11:48:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D33F10E251;
	Mon, 10 Jul 2023 09:48:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D427C10E24F
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jul 2023 09:48:10 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DEEC060F79;
 Mon, 10 Jul 2023 09:48:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABEB5C433C8;
 Mon, 10 Jul 2023 09:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1688982489;
 bh=PnEAbXpDkS/2DQfknA13T3c/Xhi5kSmvuGgopFlpfSs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=hMyjk8BPbQPAZeekXCM9QGCSkOmYufC5Kz4eRl+JqNXld+HVoT3vIQmV6gQegS3xc
 Xf90C5kC8Z9/BPfe67aoRDY5IJSC4rMMsDrrpZH0+sRIo4TzLNu/km+NAXS/BNYy8d
 ah6ZlZqnmK8rnmjM/IRNEN0MFD1123nEhzbDEFmJT6fBRM7Mgx4DfD+x1/t1+Dw6Nn
 8SjYXvpvMGtGT8n5+59votu043HaMFg/0P3ibfuq8IW+gTpsUDWu7ruvzunGs882Dt
 X7yY29/50WXR9C31E3zE8/sQFtZCq6tpcip9paUnZSF2WrZT3Gp5mmDu48HnO4w2pY
 nf5qH2vuO95yg==
From: Robert Foss <rfoss@kernel.org>
To: Jonas Karlman <jonas@kwiboo.se>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v3] drm/bridge: tc358767: Use devm_clk_get_enabled() helper
Date: Mon, 10 Jul 2023 11:48:01 +0200
Message-ID: <168898247567.1224956.8670900854330995667.b4-ty@kernel.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <208a15ce4e01973daf039ad7bc0f9241f650b3af.1672415956.git.christophe.jaillet@wanadoo.fr>
References: <208a15ce4e01973daf039ad7bc0f9241f650b3af.1672415956.git.christophe.jaillet@wanadoo.fr>
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
Cc: kernel-janitors@vger.kernel.org, Robert Foss <rfoss@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 8 Jul 2023 08:05:35 +0200, Christophe JAILLET wrote:
> The devm_clk_get_enabled() helper:
>    - calls devm_clk_get()
>    - calls clk_prepare_enable() and registers what is needed in order to
>      call clk_disable_unprepare() when needed, as a managed resource.
> 
> This simplifies the code and avoids the need of a dedicated function used
> with devm_add_action_or_reset().
> 
> [...]

Applied, thanks!

[1/1] drm/bridge: tc358767: Use devm_clk_get_enabled() helper
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=70d3c92d852f



Rob

