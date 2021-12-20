Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE1A147AB24
	for <lists+dri-devel@lfdr.de>; Mon, 20 Dec 2021 15:17:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B73D210E89D;
	Mon, 20 Dec 2021 14:16:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7678D10E89D
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Dec 2021 14:16:58 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id v7so13106522wrv.12
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Dec 2021 06:16:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=a/dzY1YCMEV94GDlHxnTZ/IoYWB5Rh81LbeOowMZqGM=;
 b=DbTR8CjGEPLkZcPfOQ2bSAJfI05BlsSyq32/NLepId3eolkmcS9Pto2grXsGk3QGf0
 WygF/ZVVBR2pExvvl31kqs/EhMfpcXJg054Zc3Pkt6YPi6pMIlIYrbwcxSKy1zRYp2DG
 RKgJF/mIc/ZF0ylL6/eoJKaRBK2mGsGxs6cDe9KVV1bvfuaRn6BxtlEiGtqIPHTlo+bI
 lds8ckISUoa9lG2rpVEtXsdFQXu9QN9fxNJZp0TjDDNBS2IXd7htik8Z8+9TEttAw7Kv
 ABzpkLqOhAO/WCR7u5zTzqouc5awXRDaG8AfabSJYD7JjvOu2sAU/LnMc9Pjv1WRd3fT
 C2eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=a/dzY1YCMEV94GDlHxnTZ/IoYWB5Rh81LbeOowMZqGM=;
 b=yy2yuh/lTE0c8dck4LrdlHt9zVE64WW0Plq8c/PCYLKDUSdo5791XlEj6JmfumjIFl
 r3lZ+y+vYT0uJup89fesPS9RRt5Gcp3vH3Rvh6qB/ng0YtPC1wsVB18tGTqmBZaRgF7j
 18LknT1Gmdmg3/J/lcptLOeIbqEUzpdrwQaYedMEJVA6HUC8eyyqhLNV0BPOXsIdtdtB
 +hwwpz6QdI+GIjuiXKp8h3L/PYQ9Qqi+3S703wmyjluWOFpjGKdbp53/xpHawbYqUGzb
 NMZ8g5d1b7PUVKDQJtcQ4ytpvfepjAOQ3JtfR5ukDG3ewfYOcn21Lu+UdLQLdiLfL2hR
 lKRg==
X-Gm-Message-State: AOAM533XgdSxQXl/pexEnNInJ8GwcsrlJUrHbuYlzirdDLq87fsz3iyF
 hRY0lcpltYX/SBJ7/ZVWINHguLLZi+Q=
X-Google-Smtp-Source: ABdhPJwT5z75o2wjTM0/dL1UWGRH+dib+dAm4J1nut2+VYcXmQnUNw+lNsC3i2A1+u6HPPElJU1/yw==
X-Received: by 2002:a05:6000:1a8c:: with SMTP id
 f12mr7072124wry.644.1640009816983; 
 Mon, 20 Dec 2021 06:16:56 -0800 (PST)
Received: from archbook.localnet ([217.151.114.10])
 by smtp.gmail.com with ESMTPSA id f13sm11754555wri.51.2021.12.20.06.16.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Dec 2021 06:16:56 -0800 (PST)
From: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>
To: dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 22/22] drm: rockchip: Add VOP2 driver
Date: Mon, 20 Dec 2021 15:16:55 +0100
Message-ID: <5637649.G3HFo5JPcS@archbook>
In-Reply-To: <20211220110630.3521121-23-s.hauer@pengutronix.de>
References: <20211220110630.3521121-1-s.hauer@pengutronix.de>
 <20211220110630.3521121-23-s.hauer@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
Cc: devicetree@vger.kernel.org,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Peter Geis <pgwipeout@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Sandy Huang <hjc@rock-chips.com>, linux-rockchip@lists.infradead.org,
 Michael Riesch <michael.riesch@wolfvision.net>, kernel@pengutronix.de,
 Andy Yan <andy.yan@rock-chips.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Montag, 20. Dezember 2021 12:06:30 CET Sascha Hauer wrote:
> From: Andy Yan <andy.yan@rock-chips.com>
> 
> The VOP2 unit is found on Rockchip SoCs beginning with rk3566/rk3568.
> It replaces the VOP unit found in the older Rockchip SoCs.
> 
> This driver has been derived from the downstream Rockchip Kernel and
> heavily modified:
> 
> - All nonstandard DRM properties have been removed
> - dropped struct vop2_plane_state and pass around less data between
>   functions
> - Dropped all DRM_FORMAT_* not known on upstream
> - rework register access to get rid of excessively used macros
> - Drop all waiting for framesyncs
> 
> The driver is tested with HDMI and MIPI-DSI display on a RK3568-EVB
> board. Overlay support is tested with the modetest utility. AFBC support
> on the cluster windows is tested with weston-simple-dmabuf-egl on
> weston using the (yet to be upstreamed) panfrost driver support.
> 
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> ---

Hi Sascha,

sadly I'm getting

[    1.668856] rockchip-drm display-subsystem: [drm] *ERROR* failed to get vop2 register byname
[    1.669621] rockchip-drm display-subsystem: failed to bind fe040000.vop (ops vop2_component_ops): -22
[    1.670584] rockchip-drm display-subsystem: master bind failed: -22
[    1.671164] dwhdmi-rockchip: probe of fe0a0000.hdmi failed with error -22

on a Quartz64 Model A.


> +	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "regs");
> +	if (!res) {
> +		drm_err(vop2->drm, "failed to get vop2 register byname\n");
> +		return -EINVAL;
> +	}

This seems to be the code that triggers it.

Any ideas as to what could be causing this?

Regards,
Nicolas Frattaroli



