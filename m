Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 804042C7A05
	for <lists+dri-devel@lfdr.de>; Sun, 29 Nov 2020 17:38:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B358A6E1EC;
	Sun, 29 Nov 2020 16:38:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81D276E1EC
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Nov 2020 16:38:33 +0000 (UTC)
Received: from ip5f5aa64a.dynamic.kabel-deutschland.de ([95.90.166.74]
 helo=phil.lan)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1kjPiS-0004tM-O4; Sun, 29 Nov 2020 17:38:24 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: Re: [PATCH] drm/rockchip: Avoid uninitialized use of endpoint id in
 LVDS
Date: Sun, 29 Nov 2020 17:38:22 +0100
Message-Id: <160666788608.935311.17420179487951916810.b4-ty@sntech.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201110200430.1713467-1-paul.kocialkowski@bootlin.com>
References: <20201110200430.1713467-1-paul.kocialkowski@bootlin.com>
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
Cc: David Airlie <airlied@linux.ie>, Sandy Huang <hjc@rock-chips.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Mark Yao <markyao0591@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 10 Nov 2020 21:04:30 +0100, Paul Kocialkowski wrote:
> In the Rockchip DRM LVDS component driver, the endpoint id provided to
> drm_of_find_panel_or_bridge is grabbed from the endpoint's reg property.
> 
> However, the property may be missing in the case of a single endpoint.
> Initialize the endpoint_id variable to 0 to avoid using an
> uninitialized variable in that case.

Applied, thanks!

[1/1] drm/rockchip: Avoid uninitialized use of endpoint id in LVDS
      commit: aec9fe892812ed10d0bffcf309d2a8fc380d8ce6

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
