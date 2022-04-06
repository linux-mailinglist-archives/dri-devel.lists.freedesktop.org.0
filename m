Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47ADB4F5025
	for <lists+dri-devel@lfdr.de>; Wed,  6 Apr 2022 04:18:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 248A110E3D5;
	Wed,  6 Apr 2022 02:18:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A7AD10E3D5
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Apr 2022 02:18:20 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D0DA760B15;
 Wed,  6 Apr 2022 02:18:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 416D7C385A0;
 Wed,  6 Apr 2022 02:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649211499;
 bh=3G8zBGA3k02iW2vlIOk2MDsWENaPWSPkarGi0setVns=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DUwdtI7jWnMPOeNTRXjeO8J+M6yKUb5QuUQiDdVXN09GKgoJCM62Na7NvzGBKRHjc
 Vw07aOQzE/tXGK3qd+D8toUq7flwOiwA3AOcxCqMiFtIeZk/BpY9ihC2OPE+2k3Pnc
 /m20o96RXMu4hWmukDTa3rYlYoknHxDHMRHha0f6AunOQ3xpMkODJISmccL3A6RQZR
 ZX12u3A0vIsAORQvo2Gmep+2+3HNYq01pmmt/mzB3sUJdtk74SkoSGfNB5pMyX0SnI
 NQwiv32LMoYOnznDzaKw6slv5csAOAaan14nwKJeORd+eoYNDqDxPyty77hRFZ8O06
 JZ03yrXvHcDyQ==
Date: Wed, 6 Apr 2022 10:18:12 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Oleksij Rempel <o.rempel@pengutronix.de>
Subject: Re: [PATCH v1 8/8] ARM: dts: imx6qdl-victgo: add CAN termination
 support
Message-ID: <20220406021812.GM129381@dragon>
References: <20220221095312.3692669-1-o.rempel@pengutronix.de>
 <20220221095312.3692669-8-o.rempel@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220221095312.3692669-8-o.rempel@pengutronix.de>
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

On Mon, Feb 21, 2022 at 10:53:12AM +0100, Oleksij Rempel wrote:
> From: David Jander <david@protonic.nl>
> 
> The gpio1 0 pin is controlling CAN termination, not USB H1 VBUS. So,
> remove wrong regulator and assign this gpio to new DT CAN termination
> property.
> 
> Signed-off-by: David Jander <david@protonic.nl>
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>

Applied, thanks!
