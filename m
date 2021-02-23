Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A4C13323371
	for <lists+dri-devel@lfdr.de>; Tue, 23 Feb 2021 22:49:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FFB56E864;
	Tue, 23 Feb 2021 21:49:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE9166E864
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Feb 2021 21:49:39 +0000 (UTC)
Received: from ip5f5aa64a.dynamic.kabel-deutschland.de ([95.90.166.74]
 helo=phil.lan)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1lEfYm-0004jo-2o; Tue, 23 Feb 2021 22:49:36 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: thierry.reding@gmail.com, sam@ravnborg.org,
 Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH] drm/panel: kd35t133: allow using non-continuous dsi clock
Date: Tue, 23 Feb 2021 22:49:32 +0100
Message-Id: <161411675671.3338515.6891041836727195011.b4-ty@sntech.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210206135020.1991820-1-heiko@sntech.de>
References: <20210206135020.1991820-1-heiko@sntech.de>
MIME-Version: 1.0
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 6 Feb 2021 14:50:20 +0100, Heiko Stuebner wrote:
> The panel is able to work when dsi clock is non-continuous, thus
> the system power consumption can be reduced using such feature.
> 
> Add MIPI_DSI_CLOCK_NON_CONTINUOUS to panel's mode_flags.
> 
> Also the flag actually becomes necessary after
> commit c6d94e37bdbb ("drm/bridge/synopsys: dsi: add support for non-continuous HS clock")
> and without it the panel only emits stripes instead of output.

Applied, thanks!

[1/1] drm/panel: kd35t133: allow using non-continuous dsi clock
      commit: 54dab3a718f7094532daf7d25cd14121a0e00e34

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
