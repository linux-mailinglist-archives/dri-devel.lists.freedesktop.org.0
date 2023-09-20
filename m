Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC1EC7A8AF9
	for <lists+dri-devel@lfdr.de>; Wed, 20 Sep 2023 19:56:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AE3710E525;
	Wed, 20 Sep 2023 17:56:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD6AD10E530
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Sep 2023 17:56:37 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 657B686BE0;
 Wed, 20 Sep 2023 19:56:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1695232595;
 bh=IQU/pjpE8XiZMafwq8+dqq9uAZX+Oe9s7YWttAXyCnM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=zqkvgrY6QLzGzB4yOfULxkgdaT7xOsegXJgJoO2MllRgKj6wJhn1DoI40Vlx/fEyb
 taxOwq88L6y+570m+rGB/2y+Rk4F6JlwXAi0Kl6Mc2Y5UkLUFyNBMZ6snBgnIiR72M
 Zxou+zFH9MaOGJ5egqUD6OIL7PrPoMycO2xw69WaH34y08BkDNpmjpudx3RNNQLahB
 uXfWFiPFHKtZoQNNP1d1rrMythqvZ6zQfcyWO81FdZM91YNqgdagq1K54WM34fXter
 z5SmyOWjXDEnl9WkaTv766wIZFD8oTcVfDBxfk1OwxzxW6Xgq/ZHHzGafQdTiENZga
 Xav0YNbws89wg==
Message-ID: <597842de-2066-1dd5-bf8a-972bcc635c7b@denx.de>
Date: Wed, 20 Sep 2023 19:30:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 1/5] drm: lcdif: improve burst size configuration comment
Content-Language: en-US
To: Lucas Stach <l.stach@pengutronix.de>, Liu Ying <victor.liu@nxp.com>
References: <20230920103126.2759601-1-l.stach@pengutronix.de>
 <20230920103126.2759601-2-l.stach@pengutronix.de>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20230920103126.2759601-2-l.stach@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, patchwork-lst@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 9/20/23 12:31, Lucas Stach wrote:
> The comment regarding AXI bust size configuration is a bit hard
> to read. Improve the wording somewhat.
> 
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> ---
>   drivers/gpu/drm/mxsfb/lcdif_kms.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mxsfb/lcdif_kms.c b/drivers/gpu/drm/mxsfb/lcdif_kms.c
> index 2541d2de4e45..f5bfe8b52920 100644
> --- a/drivers/gpu/drm/mxsfb/lcdif_kms.c
> +++ b/drivers/gpu/drm/mxsfb/lcdif_kms.c
> @@ -329,12 +329,12 @@ static void lcdif_set_mode(struct lcdif_drm_private *lcdif, u32 bus_flags)
>   	       lcdif->base + LCDC_V8_CTRLDESCL0_1);
>   
>   	/*
> -	 * Undocumented P_SIZE and T_SIZE register but those written in the
> -	 * downstream kernel those registers control the AXI burst size. As of
> -	 * now there are two known values:
> +	 * Undocumented P_SIZE and T_SIZE bitfields written in the downstream

s@written@documented only@ or so, since yeah, those fields are only used 
in the downstream driver and miss in the TRM .

> +	 * driver. Those bitfields control the AXI burst size. As of now there
> +	 * are two known values:
>   	 *  1 - 128Byte
>   	 *  2 - 256Byte
> -	 * Downstream set it to 256B burst size to improve the memory
> +	 * Downstream sets this to 256B burst size to improve the memory access
>   	 * efficiency so set it here too.

With that fixed:

Reviewed-by: Marek Vasut <marex@denx.de>
