Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8DB7D11803
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jan 2026 10:31:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2A4F10E2ED;
	Mon, 12 Jan 2026 09:31:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=dolcini.it header.i=@dolcini.it header.b="0Fh48Bkc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30F0810E0CB
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 09:31:33 +0000 (UTC)
Received: from francesco-nb
 (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch [83.173.201.248])
 by mail11.truemail.it (Postfix) with ESMTPA id 39D001FAEB;
 Mon, 12 Jan 2026 10:31:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
 s=default; t=1768210291;
 bh=s3LRU1JMOrxpverMraSdvoJOfwQ2d8WQFmbgP0Dj6GY=; h=From:To:Subject;
 b=0Fh48BkctmxJDE4uLjJyY2eSpFTGZXrrj32Td53w2GYyWjPve4k6tyrJgoPN+t0FX
 7QJQporLkHabZaE/w6Bvz+MSmM5z//l7+qw9kiDFUx2qC6GETaT/UUJrEB66otMWqh
 Kq5oTKt3RckFBEDFV9kw5lmkzC836/VmJcNZk9F1xe95WzN6Wb6pHPCN+Qw1aYzoPN
 ZIvEONosaEuiQ0BtijjeZCey8ZQb0gbqgNL0okUB3ASbx8GfuuvxnGp6QjtfvgUYEu
 W3GxcbBucgHWXPg7befFqSSyAjVlK0d3rVKTOMj4cqCXjy7ckqeuQV2n9+OhE0o291
 EAWgDIKe+mnXg==
Date: Mon, 12 Jan 2026 10:31:27 +0100
From: Francesco Dolcini <francesco@dolcini.it>
To: Liu Ying <victor.liu@nxp.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch
Subject: Re: [PATCH 0/5] drm/bridge: simple-bridge: Add DPI color encoder
 support
Message-ID: <20260112093127.GA121274@francesco-nb>
References: <20250304101530.969920-1-victor.liu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250304101530.969920-1-victor.liu@nxp.com>
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

Hello Liu,

On Tue, Mar 04, 2025 at 06:15:25PM +0800, Liu Ying wrote:
> This patch series aims to add DPI color encoder support as a simple DRM
> bridge.  A DPI color encoder simply converts input DPI color coding to
> output DPI color coding, like Adafruit Kippah DPI hat[1] which converts
> input 18-bit pixel data to 24-bit pixel data(with 2 low padding bits in
> every color component though).  A real use case is that NXP i.MX93 11x11
> EVK[2] and i.MX93 9x9 QSB[3] boards may connect a 24-bit DPI panel through
> the Adafruit Kippah DPI hat.  The display pipeline is
> 
> i.MX93 LCDIF display controller(RGB888) ->
> i.MX93 parallel display format configuration(RGB666) ->
> on-board Raspiberry Pi compatible interface(RPi)(RGB666) ->
> Adafruit Kippah DPI hat(RGB888 with 2 low padding bits in color components) ->
> 24-bit "ontat,kd50g21-40nt-a1" DPI panel


Any update/progress/plan on this patch series?

Thanks,
Francesco

