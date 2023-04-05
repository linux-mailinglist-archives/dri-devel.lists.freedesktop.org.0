Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F37C46D7CDF
	for <lists+dri-devel@lfdr.de>; Wed,  5 Apr 2023 14:44:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 461A010E933;
	Wed,  5 Apr 2023 12:44:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7A8510E933
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Apr 2023 12:44:37 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B7D91638A3;
 Wed,  5 Apr 2023 12:44:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27DB1C433EF;
 Wed,  5 Apr 2023 12:44:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1680698676;
 bh=T8/RXs3yXPQqX3RzNRz5sLD+ny4FJMMc6afxAEiRi/4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=GFzZBYmREyn4y0ESQunHejKqMvoQMlsw06ozZIOFVnz5KvqR6Skl48sqrYQpuWw9S
 Qh6xB5E4tvl/pF+rkIUyCXXzLVR8M+IBld+loZ0OeaTyhWsS1TPg0MLtRj2wXmux1w
 /DGrm1o3qk8FBJIxd049FG1JY1XwTaY3CoqWVf46HPlQaxfNJ/+TBOHmVyembtLuY9
 C8DaMfhJuqrs3zj233ztYg7+fs7gfkpr0QB5zHM1tsmzAe+ygxSt71E8wWpwl1JpBQ
 WmpesN6ddje/7NmstnlqaIGwWLYWq5IERGHdLu6oeam+6BRF4rBKHLCtsCM722v3C0
 70BC962BNxCwA==
From: rfoss@kernel.org
To: Douglas Anderson <dianders@chromium.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Pin-yen Lin <treapking@chromium.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Subject: Re: [PATCH] drm/bridge: ps8640: Use constant sleep time for polling
 hpd
Date: Wed,  5 Apr 2023 14:44:29 +0200
Message-Id: <168069863327.3876648.15304782439765709083.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230331030204.1179524-1-treapking@chromium.org>
References: <20230331030204.1179524-1-treapking@chromium.org>
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
Cc: Robert Foss <rfoss@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Robert Foss <rfoss@kernel.org>

On Fri, 31 Mar 2023 11:02:04 +0800, Pin-yen Lin wrote:
> The default hpd_wait_us in panel_edp.c is 2 seconds. This makes the
> sleep time in the polling of _ps8640_wait_hpd_asserted become 200ms.
> Change it to a constant 20ms to speed up the function.
> 
> 

Applied, thanks!

[1/1] drm/bridge: ps8640: Use constant sleep time for polling hpd
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=4224011374d1



Rob

