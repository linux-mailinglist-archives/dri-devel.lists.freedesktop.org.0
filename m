Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D99F1FCA7D
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jun 2020 12:07:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA1B46E973;
	Wed, 17 Jun 2020 10:07:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEE126E973
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jun 2020 10:07:27 +0000 (UTC)
Received: from ip5f5aa64a.dynamic.kabel-deutschland.de ([95.90.166.74]
 helo=phil.lan)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1jlUyb-0006xc-4j; Wed, 17 Jun 2020 12:07:25 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: linux-rockchip@lists.infradead.org,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/rockchip: Add per-pixel alpha support for the PX30 VOP
Date: Wed, 17 Jun 2020 12:07:23 +0200
Message-Id: <159238836640.1484955.4774492722376755146.b4-ty@sntech.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200416140526.262533-1-paul.kocialkowski@bootlin.com>
References: <20200416140526.262533-1-paul.kocialkowski@bootlin.com>
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
Cc: David Airlie <airlied@linux.ie>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Sandy Huang <hjc@rock-chips.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 16 Apr 2020 16:05:26 +0200, Paul Kocialkowski wrote:
> Compared to its predecessors, the PX30 VOP has a different register layout
> for enabling per-pixel alpha. Instead of src_alpha_ctl and dst_alpha_ctl,
> there is a single alpha control register. This register takes some fields
> from src_alpha_ctl, but with a different layout.
> 
> Add support for the required fields to the PX30 VOP window descriptions,
> which makes per-pixel-alpha formats behave correctly.

Applied, thanks!

[1/1] drm/rockchip: Add per-pixel alpha support for the PX30 VOP
      commit: 2aae8ed1f390a42ec752e4403ffca877fb3260e1

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
