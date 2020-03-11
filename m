Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41E461813D8
	for <lists+dri-devel@lfdr.de>; Wed, 11 Mar 2020 10:00:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 433526E93A;
	Wed, 11 Mar 2020 09:00:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A08526E93A
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Mar 2020 09:00:48 +0000 (UTC)
Received: from p5b127c69.dip0.t-ipconnect.de ([91.18.124.105]
 helo=phil.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.89) (envelope-from <heiko@sntech.de>)
 id 1jBxEM-0000VE-HA; Wed, 11 Mar 2020 10:00:46 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: hjc@rock-chips.com
Subject: Re: [PATCH] drm/rockchip: rgb: don't count non-existent devices when
 determining subdrivers
Date: Wed, 11 Mar 2020 10:00:45 +0100
Message-ID: <2624804.tm1DkxDElZ@phil>
In-Reply-To: <20200121224828.4070067-1-heiko@sntech.de>
References: <20200121224828.4070067-1-heiko@sntech.de>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, miquel.raynal@bootlin.com,
 linux-arm-kernel@lists.infradead.org, christoph.muellner@theobroma-systems.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Dienstag, 21. Januar 2020, 23:48:28 CET schrieb Heiko Stuebner:
> From: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
> 
> rockchip_drm_endpoint_is_subdriver() may also return error codes.
> For example if the target-node is in the disabled state, so no
> platform-device is getting created for it.
> 
> In that case current code would count that as external rgb device,
> which in turn would make probing the rockchip-drm device fail.
> 
> So only count the target as rgb device if the function actually
> returns 0.
> 
> Signed-off-by: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>

applied to drm-misc-next


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
