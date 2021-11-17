Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E689F454CC5
	for <lists+dri-devel@lfdr.de>; Wed, 17 Nov 2021 19:05:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86A8D6E4B5;
	Wed, 17 Nov 2021 18:05:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F8506E4C5
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Nov 2021 18:05:37 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id t26so12488957lfk.9
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Nov 2021 10:05:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=goPjarRaFDhR5RKzDZXMFKr9KKxmBjam0CLChkgNBPk=;
 b=la62jfOG5N0u9pLWKDbxj+bMTXQgU5GnVosWOnM1Orb3DcUpao+LlY+8MOaD/fIkrz
 ub++EVJQ/byA1YDFNU0tWpK4zvUplKSQkJtkZrU7u/Yt+KFO8FDTrSsTy5LVdk8ItYtb
 oIfasY1g0BRFF6u1YkQn1dEU9/QoSSSoYNxF6uB7RMXOaabgzV2Wiy2HnTraNRgbvzs4
 y+qptb0hqmJwp8WxUW5USJHD4/VxUhnsck5A6CYRNQpe+Xud2MKtga9QdDm3h3kvK8v/
 Qnd9mfVSjy6L/GfuXfoMbSKyEBtmYeMF+ILF33nKGSTnvl/ZhjfbCM146pWCNm39tiYI
 4hWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=goPjarRaFDhR5RKzDZXMFKr9KKxmBjam0CLChkgNBPk=;
 b=orfF1Asq2Y8sqRime9hcCyiUadWR5CKZ/bx9JdKPQ2TusytUabImAxcEuyEKwuS/rz
 uf77er4aIjuOb+w3KL9WQNGGKfPwrq7ouniXGIi1VMaAmKzm1G9PjkNd9yA+227oAALA
 RJol8RYzDfE25mmhgEXNP1aWfRHElwcjSFP1laMudcS0LfruWLGZWZexaLH7hOnoz6JJ
 sPEXxv+UCeAkr2S9Ksl92EGWEuH3yQAr0+7EF5O1xHwT4AtmQGk13YbIJy4jVjQWQMmj
 8iI6ff4eRChYuGwOoUsEqF3JfY+oLG+niBZGFrDvFLQo+Q7TMn+GICx/MGXN4Glf3dmw
 akBg==
X-Gm-Message-State: AOAM533EfuqvOceb47vZmtBjhfEVpnvl/sxZq8vWgQaQZOFt42sZsyla
 wPB1VIrRZ/mfy6xGFUeuLcI7vJIo0/U=
X-Google-Smtp-Source: ABdhPJx6+4q0npbUXEfpAcmjPMhq1fVBLVq2/D1U5rYLTr1eorQjxaKaz34IrXxQROiPzcdC5BTpTw==
X-Received: by 2002:a2e:a378:: with SMTP id i24mr10122647ljn.290.1637172335571; 
 Wed, 17 Nov 2021 10:05:35 -0800 (PST)
Received: from archbook.localnet (84-72-105-84.dclient.hispeed.ch.
 [84.72.105.84])
 by smtp.gmail.com with ESMTPSA id p10sm65212lja.0.2021.11.17.10.05.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Nov 2021 10:05:35 -0800 (PST)
From: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>
To: dri-devel@lists.freedesktop.org, Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH 12/12] drm: rockchip: Add VOP2 driver
Date: Wed, 17 Nov 2021 19:05:33 +0100
Message-ID: <7182753.rMVL1d3Icj@archbook>
In-Reply-To: <20211117143347.314294-13-s.hauer@pengutronix.de>
References: <20211117143347.314294-1-s.hauer@pengutronix.de>
 <20211117143347.314294-13-s.hauer@pengutronix.de>
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
 Sandy Huang <hjc@rock-chips.com>, linux-rockchip@lists.infradead.org,
 Michael Riesch <michael.riesch@wolfvision.net>, kernel@pengutronix.de,
 Peter Geis <pgwipeout@gmail.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mittwoch, 17. November 2021 15:33:47 CET Sascha Hauer wrote:
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
> 
> The driver is tested with HDMI and MIPI-DSI display on a RK3568-EVB
> board. Overlay support is tested with the modetest utility. AFBC support
> is still present in the driver, but currently untested due to the lack
> of suitable image sources. Also the driver has been tested with weston
> using pixman and (yet to be upstreamed) panfrost driver support.
> 
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> ---

Hi Sascha,

thank you very much for your work on this! I gave it a try tonight,
and unfortunately it appears to currently always attempt to use
1920x1080p60 as the mode regardless of the monitor. For example,
on an old 720p monitor I had laying around:

	[  225.732342] rockchip-drm display-subsystem: [drm] Update mode to 1920x1080p60, type: 11 for vp0, output 0x00000800  HDMI0

This results in a broken picture (all white with occasional glitches).
Somebody else observed the same behaviour on a 1440p monitor.

Thanks,
Nicolas Frattaroli


