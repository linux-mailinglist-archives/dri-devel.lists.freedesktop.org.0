Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FD4B93BFCB
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jul 2024 12:19:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6698B10E19C;
	Thu, 25 Jul 2024 10:18:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="gDvXdBgx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5291010E19C
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2024 10:18:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id ABB58611CB;
 Thu, 25 Jul 2024 10:18:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56FA3C116B1;
 Thu, 25 Jul 2024 10:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1721902736;
 bh=xcyUsAObjzUoWt+gYb3Nj0AXQctkIgHNhrm+t1FDpHc=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=gDvXdBgxICvZ5rwCX8u757PEZ1xtVnIDnRC06/FBhChJUE8PjgEG5ezRSDt1mnMmX
 mBLwlN2DYnRxSYudrRwn6rkwJq1E43MmnInRWP7bWXeWh+A+Tu3+ccvajCwrbKeljB
 WW8haobavU8KMOtR9vFG/8GGBX4W+7SD27DW+dIYGUVTypt+T1PTTAprK7tk7SCIz+
 DKPIYZ0BNJgXQNlH5wJckZkZ8FSsVYqRTvOa8fqIvOx1q8hZRIQT0PjQjVTJ1eTjXR
 OSaozvJtIPMgVDAiXsuXvVDBXmPd/9sspVKx4JBaQkLQabnmgLlQVVv14FhBP7Ua3l
 zIWUkL7lBiAXg==
From: Robert Foss <rfoss@kernel.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Pin-yen Lin <treapking@chromium.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>, Kuro Chung <kuro.chung@ite.com.tw>, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
In-Reply-To: <20240719110623.1850021-1-treapking@chromium.org>
References: <20240719110623.1850021-1-treapking@chromium.org>
Subject: Re: [PATCH] drm/bridge: it6505: Disable IRQ when powered off
Message-Id: <172190273302.1592998.13226934023612913257.b4-ty@kernel.org>
Date: Thu, 25 Jul 2024 12:18:53 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
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

On Fri, 19 Jul 2024 19:05:36 +0800, Pin-yen Lin wrote:
> When the bridge is powered off, disable the IRQ until the next power on
> to workaround an interrupt storm on some badly-designed hardware.
> 
> 

Applied, thanks!

[1/1] drm/bridge: it6505: Disable IRQ when powered off
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=10ba3753665f



Rob


