Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EE643271B3
	for <lists+dri-devel@lfdr.de>; Sun, 28 Feb 2021 10:20:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9A926E154;
	Sun, 28 Feb 2021 09:20:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from muru.com (muru.com [72.249.23.125])
 by gabe.freedesktop.org (Postfix) with ESMTP id D69226E154
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Feb 2021 09:20:15 +0000 (UTC)
Received: from atomide.com (localhost [127.0.0.1])
 by muru.com (Postfix) with ESMTPS id 5B2A68057;
 Sun, 28 Feb 2021 09:20:48 +0000 (UTC)
Date: Sun, 28 Feb 2021 11:20:06 +0200
From: Tony Lindgren <tony@atomide.com>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: Re: [PATCH] drm/panel: panel-dsi-cm: disable TE for now
Message-ID: <YDtgRnq27wLViPu9@atomide.com>
References: <YDnyVV/O78sQjtWb@atomide.com>
 <20210227214542.99961-1-sebastian.reichel@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210227214542.99961-1-sebastian.reichel@collabora.com>
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
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Sekhar Nori <nsekhar@ti.com>, Sebastian Reichel <sre@kernel.org>,
 dri-devel@lists.freedesktop.org, Sam Ravnborg <sam@ravnborg.org>,
 Nikhil Devshatwar <nikhil.nd@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

* Sebastian Reichel <sebastian.reichel@collabora.com> [210227 21:51]:
> From: Sebastian Reichel <sre@kernel.org>
> 
> Disable TE for Droid 4 panel, since implementation is currently
> broken. Also disable it for N950 panel, which is untested.
> 
> Reported-by: Tony Lindgren <tony@atomide.com>
> Reported-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> Fixes: 4c1b935fea54 ("drm/omap: dsi: move TE GPIO handling into core")
> Signed-off-by: Sebastian Reichel <sre@kernel.org>
> ---
> I suggest to start by fix the regression like this and look into
> proper Droid 4 TE support separatly. Assumption is, that Tomi
> tested taal panel, droid4 panel is 'broken' and N950 (himalaya)
> is untested [*], so choosing safe default. Patch is compile-tested
> only.

Makes sense to me and fixes the regression:

Tested-by: Tony Lindgren <tony@atomide.com>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
