Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C14A7330B6
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jun 2023 14:04:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0249810E603;
	Fri, 16 Jun 2023 12:04:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8627D10E603
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jun 2023 12:04:29 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B551963B54;
 Fri, 16 Jun 2023 12:04:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 700ACC433C0;
 Fri, 16 Jun 2023 12:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686917067;
 bh=5s3elOAGSGhT9IyLGB7mLzm0gZ1Um63QIwJbFLh/Iq4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=tvscA4rnKOd+JSKCtbtI5TV/pnuUaEmrF7rT9pna6bexYyAPJZvBFLPaj2luWINVa
 Ac8YBPvXirvFuY5YZGfOpXG0VU2amDX8ZkpCn2kOVIeGPfk8x70tBhvfHQ/uq/LkQv
 eG/ogRy2oI6zjsUtH14X9n91u9/IY4IlMgldK6ytu0MODvhq+ygJTHx97rNtyduMNM
 pXdaohqzTmdwCqybSZHC1nJcUCEpzjRZPvV1xE0WLTpI6V35s5ynVtjR5/wUU4Av9f
 EJ+C8Cypqc5n4WU9OmiNX/dQddbxgah797dbeO8K0CLpyjVMJu+sFpfJugpSepmCcK
 FZ9oNvWwQYd5Q==
From: rfoss@kernel.org
To: Marek Vasut <marex@denx.de>,
	dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/bridge: tc358764: Fix debug print parameter order
Date: Fri, 16 Jun 2023 14:04:21 +0200
Message-Id: <168691701496.1279232.8698165894865930633.b4-ty@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230615152817.359420-1-marex@denx.de>
References: <20230615152817.359420-1-marex@denx.de>
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

On Thu, 15 Jun 2023 17:28:17 +0200, Marek Vasut wrote:
> The debug print parameters were swapped in the output and they were
> printed as decimal values, both the hardware address and the value.
> Update the debug print to print the parameters in correct order, and
> use hexadecimal print for both address and value.
> 
> 

Reviewed-by: Robert Foss <rfoss@kernel.org>

Applied, thanks!

[1/1] drm/bridge: tc358764: Fix debug print parameter order
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=7f947be02aab



Rob

