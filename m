Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 764AE4F5021
	for <lists+dri-devel@lfdr.de>; Wed,  6 Apr 2022 04:15:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93C3A10E41C;
	Wed,  6 Apr 2022 02:15:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B41B210E41C
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Apr 2022 02:15:32 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 12D3360B15;
 Wed,  6 Apr 2022 02:15:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A4C4C385A1;
 Wed,  6 Apr 2022 02:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649211331;
 bh=aiGeeVTGnN8zGL5U5c5Yc8F67GA9MLx7+zRzZUbqfWw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TZ1Sh5SobwI1WfmoEINwRldz9HBH8Zzrs1hWiTrmg/h2kja/2rPhecWSLUhwD0Pry
 zPCNv+TOGm9OjGUxWd8bORtuqDc00NybEboBvQgHTa/5OqqYSQMJ+tPhPdawrLK9hl
 WEFQzduKC8o7JV+opAyYA3DUnHpCQMzKMQJ7/EUN+KlY/ViVKmZCej9DtXM++i0kYi
 vZjMy9VPx1XFKBVfeZzhqEH/r9lWL/jZ+KnGui0arUFAp+Jk6g89j0Ff7j26GwDvZ1
 z241MhZZfj7IfDLYoY3kPSX/0F44T7tKv94ZMSnvGNUQcKQ0vLPHBy9oiV+CNX6roc
 M53qoh0wN6w+w==
Date: Wed, 6 Apr 2022 10:15:24 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Oleksij Rempel <o.rempel@pengutronix.de>
Subject: Re: [PATCH v1 4/8] ARM: dts: imx6qdl-vicut1: update gpio-line-names
 for some GPIOs
Message-ID: <20220406021524.GJ129381@dragon>
References: <20220221095312.3692669-1-o.rempel@pengutronix.de>
 <20220221095312.3692669-4-o.rempel@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220221095312.3692669-4-o.rempel@pengutronix.de>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Robin van der Gracht <robin@protonic.nl>, David Airlie <airlied@linux.ie>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 David Jander <david@protonic.nl>, Sam Ravnborg <sam@ravnborg.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 21, 2022 at 10:53:08AM +0100, Oleksij Rempel wrote:
> From: David Jander <david@protonic.nl>
> 
> countedX lines have different board names (YACO_x). And REV_ and BOARD_ pins
> have multiple functions. So, use names exposed to the OS.
> 
> Signed-off-by: David Jander <david@protonic.nl>
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>

Applied, thanks!
