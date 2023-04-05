Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BE2D6D777A
	for <lists+dri-devel@lfdr.de>; Wed,  5 Apr 2023 10:57:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DDBB10E887;
	Wed,  5 Apr 2023 08:57:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E02F210E887
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Apr 2023 08:57:37 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4E99A62263;
 Wed,  5 Apr 2023 08:57:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 141D2C433D2;
 Wed,  5 Apr 2023 08:57:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1680685056;
 bh=hAgEyHmI2WKeNF5QQltAKysLTCRvtM1XMhx72uLyH/4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=trOjXr1di4iFhhlDoRUi3HpYL/Y9xHiV2kt0d/wYe59djxLWSI9NCydsxQmdR0d6F
 KGQkjSk8aFG6GgBVnAkofUXQIoDZZwR8+j1OJmujwBqQ4E3p1b+UtFA4rL8cXAsC7f
 oJ7SUGkITrC2YFBcjTYgHPkXiLefbKbhdRd9DZxG5WyGOaxs9uGU+vvIEr6Z6LPwZu
 NmFDOXgJ7YKRe+iJbednMzi/yTL7iQTCu/EpYMU2bCWSg5MvK1igckqVzYjPRNZQTc
 YpMt/IPBaKa2W1Fp3uPLARxbOikpz4HNREpuYwpvk1RhKVbrhWaGsV5WkaK9FqrYWZ
 sIsiLDpmc2HTg==
From: rfoss@kernel.org
To: Jernej Skrabec <jernej.skrabec@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, David Airlie <airlied@gmail.com>,
 Jonas Karlman <jonas@kwiboo.se>
Subject: Re: [PATCH 1/1] drm/bridge: ti-sn65dsi83: use dev_err_probe if host
 attach failed
Date: Wed,  5 Apr 2023 10:57:29 +0200
Message-Id: <168068501685.3813702.2519146648839759017.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230405075223.579461-1-alexander.stein@ew.tq-group.com>
References: <20230405075223.579461-1-alexander.stein@ew.tq-group.com>
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
Cc: Robert Foss <rfoss@kernel.org>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Robert Foss <rfoss@kernel.org>

On Wed, 5 Apr 2023 09:52:23 +0200, Alexander Stein wrote:
> There might be cases where the host attach is deferred, use dev_err_probe
> to add more detailed information to /sys/kernel/debug/devices_deferred.
> 
> 

Applied, thanks!

[1/1] drm/bridge: ti-sn65dsi83: use dev_err_probe if host attach failed
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=ce7498acaa88



Rob

