Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC0C7739C05
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jun 2023 11:09:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E776410E153;
	Thu, 22 Jun 2023 09:08:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8409C893DB
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jun 2023 09:08:57 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E0F04616CB;
 Thu, 22 Jun 2023 09:08:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 234ECC433C8;
 Thu, 22 Jun 2023 09:08:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1687424935;
 bh=nwFEdUYkQi1q/7waLJTOD+qevE56ApSro5TSulnMifk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=iWqAuWi5+DGmdT44ovXhtz64QlQTHtvgYCNo/TyZbfPHH+HtrQcPfvr4IUjuuMTQf
 0AZG2/TssmzCa1kS6bVSsPDUexiqng5L3yLUfp/6qWXdW7nIOgNksWuTgwRCeol8CS
 m6qnQwhNMDno6NcVlPmbcSICmazl1Ht3qfmlyPrbUpuI3m17b8cHYkQfeN1Z1hNdTq
 EyF6FcvX9CuntdNpQ/08sOLlf06KOLhVq8rpEFtR+iuIW86qhT4xGMLAzedKF4qEhA
 F8eUaR6tXnYaq+JZHd8tKdfio66TDiCDXijPSCl5e2fIFqCN71vmMS/oMbZThManqp
 yZLd06VdyIQlQ==
From: rfoss@kernel.org
To: Marek Vasut <marex@denx.de>,
	dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/bridge: tc358764: Use BIT() macro for actual bits
Date: Thu, 22 Jun 2023 11:08:49 +0200
Message-Id: <168742491457.792727.6118746713723055740.b4-ty@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230615201635.565973-1-marex@denx.de>
References: <20230615201635.565973-1-marex@denx.de>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Robert Foss <rfoss@kernel.org>

On Thu, 15 Jun 2023 22:16:35 +0200, Marek Vasut wrote:
> None of these four bits are bitfields, use BIT() macro and treat
> them as bits. No functional change.
> 
> 

Applied, thanks!

[1/1] drm/bridge: tc358764: Use BIT() macro for actual bits
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=a4c253d4f39d



Rob

