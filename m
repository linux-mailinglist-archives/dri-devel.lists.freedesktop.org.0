Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6B14D3C4EC
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 11:18:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 092E010E121;
	Tue, 20 Jan 2026 10:18:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="IGiJBjx9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D06D10E121
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jan 2026 10:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
 bh=KvGx6Or8ias90RT455/oVqLcS68YBnWBSqTrvMmBBH8=; b=IGiJBjx9sLG1WDZtn7YEIixkM1
 WCWdCS8CjvAWaMalOOIcRQx5jbsYzorENUfhKdBtS7FP/82fQIsosNCMWbgMKU3GPqSsGFbbhRTbe
 enswYEj63x/zI0OYzVnvGeIGwrDDtnMlOhUG2V/Ow3z+Fz/kexlGrKg2Q0zOqLWdLSwHb/ZK8vi74
 xIYc+CLyG+epmbUf26U6Ncg8M+hKl664fSt6Fzp1TpCcrto4cZVMcBCyySMT8mL/aDy49oKGbb42g
 h79OtZ0qsK26Vbe3esjmdn7nteAX4hwm58B4OupJmVSiX6OPgbNMYS+sBFSHvAwEsgSGNxPFMHuL2
 hn0AAe9A==;
Received: from [192.76.154.238] (helo=phil.dip.tu-dresden.de)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1vi8oq-003MG3-T8; Tue, 20 Jan 2026 11:18:41 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Sandy Huang <hjc@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Heiko Stuebner <heiko@sntech.de>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] Hotplug detection fixup on Rockchip DW HDMI QP
Date: Tue, 20 Jan 2026 11:18:37 +0100
Message-ID: <176890429962.373062.7112333256096366430.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20260115-dw-hdmi-qp-hpd-v1-0-e59c166eaa65@collabora.com>
References: <20260115-dw-hdmi-qp-hpd-v1-0-e59c166eaa65@collabora.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Thu, 15 Jan 2026 18:24:42 +0200, Cristian Ciocaltea wrote:
> The threaded interrupt handler on RK3576 responsible for providing the
> HDMI HPD capability is currently unreliable, since it's affected by a
> bug leading to a broken hotplug detection in some cases.
> 
> RK3588 is affected by a similar implementation deficiency, however it
> doesn't seem to cause any functional breakage.
> 
> [...]

Applied, thanks!

[1/2] drm/rockchip: dw_hdmi_qp: Fix RK3576 HPD interrupt handling
      commit: 5f7be8afc40c5ccf1be0410514703e50a49532c0
[2/2] drm/rockchip: dw_hdmi_qp: Optimize RK3588 HPD interrupt handling
      commit: aa156ad92523b21b12bfa5bb261d6affb4b1597f

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
