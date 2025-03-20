Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BAF9A6A7C2
	for <lists+dri-devel@lfdr.de>; Thu, 20 Mar 2025 14:58:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D846610E3A6;
	Thu, 20 Mar 2025 13:58:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="BDxILjp3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 518 seconds by postgrey-1.36 at gabe;
 Thu, 20 Mar 2025 13:58:53 UTC
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4248A10E3A6
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Mar 2025 13:58:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 955B7437CB;
 Thu, 20 Mar 2025 13:50:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9706BC4CEDD;
 Thu, 20 Mar 2025 13:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1742478613;
 bh=BJPegLawj4uPq+KzjweLJYu58/cHqaWL/lpgD3gMquo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=BDxILjp3k0HiTKJciXKC2aQN7EIyH0hg7Jre1+L3SpC/OF2DZAukNh7VskYqMifPy
 aAIcq7DWEBJM4gCTApBQGRmIcCzn/x5viuuXjnuQr6LVSntEFic7eH+D2pRrBZo9VZ
 8sS7+KJoTfUjuIbmKT+zsmTVTHz7+YTbqk+h64+Vrce30DLwj5uNvAIvDx4mliuZl7
 HyB95ZQ3XzMQmvXFLImSX37nmw5zhZolVhnkGXiL0aKbpJoN9AD1WP9ykooMnc4Pkg
 XC8j1qVVrztmWOz8wOvmgS4cOPsfgIunbDHntvc5vTOegx/wN4KKgtD7T5OLU82dEW
 F73pA7ehgXAwA==
From: Maxime Ripard <mripard@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Douglas Anderson <dianders@chromium.org>,
 Maxime Ripard <mripard@kernel.org>
Cc: Herve Codina <herve.codina@bootlin.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Simona Vetter <simona.vetter@ffwll.ch>,
 Simona Vetter <simona.vetter@intel.com>
Subject: Re: [PATCH v6 00/16] drm/bridge: Various quality of life improvements
Date: Thu, 20 Mar 2025 14:50:07 +0100
Message-ID: <174247860591.84994.742849930325234742.b4-ty@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250313-bridge-connector-v6-0-511c54a604fb@kernel.org>
References: <20250313-bridge-connector-v6-0-511c54a604fb@kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 13 Mar 2025 12:59:54 +0100, Maxime Ripard wrote:
> Here's a series of changes after to the KMS helpers and bridge API
> following a bunch of reviews I did.
> 
> It's mostly centered across providing an easier time to deal with bridge
> states, and a somewhat consistent with the other entities API.
> 
> It's build tested only, with arm64 allmodconfig.
> 
> [...]

Applied to misc/kernel.git (drm-misc-next).

Thanks!
Maxime
