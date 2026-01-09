Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13458D0C1CD
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 20:52:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C4A610E36E;
	Fri,  9 Jan 2026 19:52:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="cTWK5hdO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 475C910E36E
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jan 2026 19:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
 bh=UXv5SDgabeUxHI5NH+8KwOclEnx72hBve7UveRrT45E=; b=cTWK5hdONnvZF3ymA/s+bPw93s
 KaXA7CIhUQ3bqsbO/2o2LN6q6njDpZ6iDqvUVtYIcFWwh5VvfnsQXQSqCpt6mjaUS3vvuvXJEjuFG
 NHRl0pshWfay9dv614AdsHV+biFqKrCbCdeaQo5yXtQdLckjU1m0DEpZHbd6LcT/fd8Vg+Z2fWqaq
 mlJAx2xSWv5owGZuNWoNuHfxuxKPOff9ylHglBIaK0waUmCoQKHNewjuAk4OoeXjb9AnB0hSCKPrL
 +dC4lYM60P/bppB8w3N6zrUFulgPM/0dy2tUE+PonVkMOzvSPDk82Kd2nZTd+zuT390fqAvmIjO9x
 GqPPv4AA==;
Received: from [192.76.154.238] (helo=phil.dip.tu-dresden.de)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1veIWi-001fth-ER; Fri, 09 Jan 2026 20:52:05 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: linux-rockchip@lists.infradead.org, Chris Morgan <macroalpha82@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>, mripard@kernel.org,
 devicetree@vger.kernel.org, conor+dt@kernel.org, rfoss@kernel.org,
 tzimmermann@suse.de, jonas@kwiboo.se, neil.armstrong@linaro.org,
 sebastian.reichel@collabora.com, jernej.skrabec@gmail.com,
 dri-devel@lists.freedesktop.org, andrzej.hajda@intel.com,
 andy.yan@rock-chips.com, krzk+dt@kernel.org, robh@kernel.org,
 Laurent.pinchart@ideasonboard.com, cristian.ciocaltea@collabora.com,
 Chris Morgan <macromorgan@hotmail.com>
Subject: Re: (subset) [PATCH V3 0/3] Add HDMI for Gameforce Ace
Date: Fri,  9 Jan 2026 20:51:53 +0100
Message-ID: <176798831388.3446147.13187044565812566559.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20251119225526.70588-1-macroalpha82@gmail.com>
References: <20251119225526.70588-1-macroalpha82@gmail.com>
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


On Wed, 19 Nov 2025 16:55:23 -0600, Chris Morgan wrote:
> Add support for the micro HDMI port for the Gameforce Ace. This port does
> not have a HPD pin so it requires making changes to the HDMI controller
> to support this configuration.
> 
> Changes since v1:
>  - Simplified checking of no-hpd parameter and changed to
>    device_property_read_bool() function.
> 
> [...]

Applied, thanks!

[3/3] arm64: dts: rockchip: Add HDMI to Gameforce Ace
      commit: 97a9b5edcdd4179063773f17a00904a464b8aa7c

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
