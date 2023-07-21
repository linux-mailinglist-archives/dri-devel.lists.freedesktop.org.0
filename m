Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F323575C60E
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jul 2023 13:48:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2382010E660;
	Fri, 21 Jul 2023 11:48:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08E0A10E660
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jul 2023 11:48:28 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2A187618E5;
 Fri, 21 Jul 2023 11:48:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5639EC433C8;
 Fri, 21 Jul 2023 11:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689940106;
 bh=H+sKgxyNGnvM5K489kh0RE4m6WTc+wgydknPQcu1qTE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=mOm1AF7eX9P/YEDy0MqLLVkFeG3N1+96TdvY10pma8DF/j5O7DNehz33yaBvOqoLs
 1hBtiBJ3H1ET8DZSV2O7/pqVueCMaLp33BVNdrr6LNX8eVz0nL8mp0/0wOibS00/nr
 JPnWLJEtRb1tPPRXKbXvgcM8TPL2dWBxOoHCjJFnPc5VLNtY+ZyBqV8U+KvuJke9sS
 EXYr0wpMUvvuj1UcKRWIRLZKaO88XyfJ58qsmaeGoRdA1ApoTLr0bNEh8uCfzlC55f
 zu+lsd09fIANynnEhUOFfK+X1r4OuLVQ/+U7lUrFpISCc4z67QA1HA40VAkV44/eHn
 iB65MJuNLZgww==
From: Robert Foss <rfoss@kernel.org>
To: linux-kernel@vger.kernel.org, Alexandru Ardelean <alex@shruggie.ro>,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v4] drm: adv7511: Fix low refresh rate register for
 ADV7533/5
Date: Fri, 21 Jul 2023 13:48:15 +0200
Message-ID: <168994007362.139428.5966908041649234142.b4-ty@kernel.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230719060143.63649-1-alex@shruggie.ro>
References: <20190716131005.761-1-bogdan.togorean@analog.com>
 <20230719060143.63649-1-alex@shruggie.ro>
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
Cc: neil.armstrong@linaro.org, Robert Foss <rfoss@kernel.org>,
 andrzej.hajda@intel.com, jonas@kwiboo.se, nuno.sa@analog.com,
 bogdan.togorean@analog.com, Laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 19 Jul 2023 09:01:43 +0300, Alexandru Ardelean wrote:
> From: Bogdan Togorean <bogdan.togorean@analog.com>
> 
> For ADV7533 and ADV7535 low refresh rate is selected using
> bits [3:2] of 0x4a main register.
> So depending on ADV model write 0xfb or 0x4a register.
> 
> 
> [...]

Applied, thanks!

[1/1] drm: adv7511: Fix low refresh rate register for ADV7533/5
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=d281eeaa4de2



Rob

