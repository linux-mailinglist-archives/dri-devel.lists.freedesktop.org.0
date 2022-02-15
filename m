Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 37F204B82D9
	for <lists+dri-devel@lfdr.de>; Wed, 16 Feb 2022 09:23:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6E6610E8DF;
	Wed, 16 Feb 2022 08:23:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FD1D10E540
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Feb 2022 19:47:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: dmitry.osipenko) with ESMTPSA id 2C4B91F413B3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1644954471;
 bh=BCTFBXRXvRz6slrOppBSCzuCpNgtXgHw8VTvEi/F91c=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=jd/M6U2Sj9jRmq/fvlQsMiylkbMa9eLtc8Kszpl55iTbO2tXfEASLtBXx2oDKnWU4
 R/YXNWjLIzS5CBeOKxoT7rjJHsadCfb+r0I40csrAijVEtZUix5P10CuVrK68iAdbt
 8IGfd3ZFJZac67E6St0NYmZ35Gm4osSaQxEDrcH7jGkBRs131Ht80zpRv4bOQBAi2p
 mFrBKbYunk6hzOPo91qLTUr7mVHM1bdoEv/PsH3RQWoD9DyYKlg+pwFn1xsha8e+7N
 wbxE3ihAj+J6oQ0VWUFdgeZmmsyBMxmlkygvGyYr6MJEpISZ4CsKlps1AJZQj3/SUN
 kSfGMEclwF4ew==
Message-ID: <f0d9ae21-1cce-8ce2-c81d-595a639ac490@collabora.com>
Date: Tue, 15 Feb 2022 22:47:49 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v5 22/23] drm: rockchip: Add VOP2 driver
Content-Language: en-US
To: Sascha Hauer <s.hauer@pengutronix.de>, dri-devel@lists.freedesktop.org
References: <20220209095350.2104049-1-s.hauer@pengutronix.de>
 <20220209095350.2104049-23-s.hauer@pengutronix.de>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20220209095350.2104049-23-s.hauer@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 16 Feb 2022 08:23:45 +0000
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

09.02.2022 12:53, Sascha Hauer пишет:
> @@ -31,6 +31,9 @@ struct rockchip_crtc_state {
>  	int output_bpc;
>  	int output_flags;
>  	bool enable_afbc;
> +	uint32_t bus_format;
> +	u32 bus_flags;
> +	int color_space;

The variable types could be cleaned up like s/uint32_t/u32/ all over
this patch.

I'd also remove signes from all variables that should be unsigned.
