Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56B648C1F66
	for <lists+dri-devel@lfdr.de>; Fri, 10 May 2024 10:04:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8F1F10E4CB;
	Fri, 10 May 2024 08:04:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Rc8csvL0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3239D10E4CB
 for <dri-devel@lists.freedesktop.org>; Fri, 10 May 2024 08:04:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 86A1E601C0;
 Fri, 10 May 2024 08:04:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3533EC2BD11;
 Fri, 10 May 2024 08:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1715328292;
 bh=NTWQV8utlMEfCOAQgZ2Ys4MM0viNvXW7Auv8Tvj/nrw=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=Rc8csvL0dZJCS87H7IBNkVQKO5bBSDn1ygDnEoc9nTNpbj1fp7OTerzVnq4T0bCPK
 TM+nuNRREc1zshzbL6pSWQtAQ4Ns0qHNQKCGWsPB3f3xujdj9gKCq0sgnQSk74zkDo
 ElwGAs/u79UqnaK54UgZvsK3gE92ZbGKo7QnSVP/UqNoRtpHRiUEboX3vUusA8Owou
 tLRzJMnTkLAOoEfFZ8nwUZRUlzMWRngjSP8EqzYtW9rLpo2nGtVIl2Lhc8gesrWLKn
 U1Hrc657g8n3msWlOuesIYrpEXkVB5a+7DpgSTUUgycrK4LeqK/t0eyzAd/ligPZd1
 x0dDuZRhU0ybw==
From: Robert Foss <rfoss@kernel.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Sui Jingfeng <sui.jingfeng@linux.dev>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Neil Armstrong <neil.armstrong@linaro.org>, David Airlie <airlied@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
In-Reply-To: <20240507180001.1358816-1-sui.jingfeng@linux.dev>
References: <20240507180001.1358816-1-sui.jingfeng@linux.dev>
Subject: Re: [PATCH] drm/drm-bridge.c: Drop conditionals around of_node
 pointers
Message-Id: <171532828886.1578080.11788819313522587297.b4-ty@kernel.org>
Date: Fri, 10 May 2024 10:04:48 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.1
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 8 May 2024 02:00:00 +0800, Sui Jingfeng wrote:
> Having conditional around the of_node pointer of the drm_bridge structure
> is not necessary, since drm_bridge structure always has the of_node as its
> member.
> 
> Let's drop the conditional to get a better looks, please also note that
> this is following the already accepted commitments. see commit d8dfccde2709
> ("drm/bridge: Drop conditionals around of_node pointers") for reference.
> 
> [...]

Applied, thanks!

[1/1] drm/drm-bridge.c: Drop conditionals around of_node pointers
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=ad3323a6ccb7



Rob

