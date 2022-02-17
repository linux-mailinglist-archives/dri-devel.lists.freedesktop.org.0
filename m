Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E5AC14BC76F
	for <lists+dri-devel@lfdr.de>; Sat, 19 Feb 2022 11:03:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E609C10F6A9;
	Sat, 19 Feb 2022 10:03:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DA9E10E8E4
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 13:18:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: dmitry.osipenko) with ESMTPSA id 48BA71F45BBB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1645103926;
 bh=wxrjZyYHBBx6bMd1iTzODLfhd7VNtutE1D1YpDU9LAo=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=fiwU6yQ2mwVDRQi6CN3nOx5Xnty57YwZ9f5Wugus5Zij9pb3SBxWVXBHRW+hdg7no
 fq6MIvMEA4fyi9LoEpDu8N825SRVVdZ/kFKxup3Wv1FfgkeTdTwahfY+MqOm3vTV0F
 hj7kqZeBHPvED6abRYlDo2uuTQ9zRlfKcYKq1J0GYXQB/9ctEH1uvPYnOvH+5043bN
 1OhGBUDGFTLt8Nx+x6zleeD/Oa9mtXmEnyN5ffxCNm/Y/Q0gRwN+f0tqowH2UCfCVU
 h7IluhCJZkwUEh1d43ZWjFP4mCyJ+7B8i46RkppGMITwrxUMS5pnrjalwC/bHsQf/Y
 G6EwcCVR+fVLA==
Message-ID: <f63f7616-9fea-48fd-4e5d-97751640b5ad@collabora.com>
Date: Thu, 17 Feb 2022 16:18:42 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v6 07/23] drm/rockchip: dw_hdmi: add regulator support
Content-Language: en-US
To: Sascha Hauer <s.hauer@pengutronix.de>, dri-devel@lists.freedesktop.org
References: <20220217082954.2967889-1-s.hauer@pengutronix.de>
 <20220217082954.2967889-8-s.hauer@pengutronix.de>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20220217082954.2967889-8-s.hauer@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 19 Feb 2022 10:01:55 +0000
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
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, kernel@pengutronix.de,
 Sandy Huang <hjc@rock-chips.com>, linux-rockchip@lists.infradead.org,
 Michael Riesch <michael.riesch@wolfvision.net>,
 Peter Geis <pgwipeout@gmail.com>, Andy Yan <andy.yan@rock-chips.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


17.02.2022 11:29, Sascha Hauer пишет:
> The RK3568 has HDMI_TX_AVDD0V9 and HDMI_TX_AVDD_1V8 supply inputs needed
> for the HDMI port. add support for these to the driver for boards which
> have them supplied by switchable regulators.
> 
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> ---
>  drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c | 41 +++++++++++++++++++--
>  1 file changed, 38 insertions(+), 3 deletions(-)

Reviewed-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
