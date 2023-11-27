Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5546F7FAE40
	for <lists+dri-devel@lfdr.de>; Tue, 28 Nov 2023 00:25:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8496310E408;
	Mon, 27 Nov 2023 23:25:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC69C10E408
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Nov 2023 23:25:37 +0000 (UTC)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi
 [213.243.189.158])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 62AF5BEB;
 Tue, 28 Nov 2023 00:25:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1701127501;
 bh=eYzEt54XedbWvcie9HCtLUP/JQBIRk0S3APgSRa99MI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=wA1FCCLvY53qwglw0AogEo8cFStGYy2XqjIMPJjoNY5nIZgm4qqXkYTXVkNuuaUQ+
 xi/qAlTBGS8kkboLk+GqDAs5gHPOLHxAknZ98Ppk26hrVm2itx6XhP9X2kAVdXlR/8
 6G/wdvSX/2jYUAraO65BY5GvT+b+duHofaWiGWEg=
Date: Tue, 28 Nov 2023 01:25:42 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 0/3] Revert panel fixes and original buggy patch
Message-ID: <20231127232542.GB25590@pendragon.ideasonboard.com>
References: <20231128-revert-panel-fix-v1-0-69bb05048dae@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231128-revert-panel-fix-v1-0-69bb05048dae@linaro.org>
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
 Thomas Zimmermann <tzimmermann@suse.de>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Liu Ying <victor.liu@nxp.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 dri-devel@lists.freedesktop.org, Jonas Karlman <jonas@kwiboo.se>,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Linus,

On Tue, Nov 28, 2023 at 12:10:18AM +0100, Linus Walleij wrote:
> This series reverts the attempts to fix the bug that went
> into v6.7-rc1 in commit 199cf07ebd2b
> "drm/bridge: panel: Add a device link between drm device and panel device"
> and then it reverts that patch as well.
> 
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> Linus Walleij (3):
>       Revert "driver core: Export device_is_dependent() to modules"
>       Revert "drm/bridge: panel: Check device dependency before managing device link"
>       Revert "drm/bridge: panel: Add a device link between drm device and panel device"

To preserve bisectability, you should revert in the opposite order.

> 
>  drivers/base/core.c            |  1 -
>  drivers/gpu/drm/bridge/panel.c | 26 --------------------------
>  2 files changed, 27 deletions(-)
> ---
> base-commit: 95ba893c9f4feb836ddce627efd0bb6af6667031
> change-id: 20231127-revert-panel-fix-e4da3e11e7a4

-- 
Regards,

Laurent Pinchart
