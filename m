Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5021767B3C5
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 14:59:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A364410E6F7;
	Wed, 25 Jan 2023 13:59:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F38F210E6F7
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jan 2023 13:59:44 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id C47B085615;
 Wed, 25 Jan 2023 14:59:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1674655183;
 bh=hF1ni9xZEc4e87Ov1GWvFFjeHI102TRQGg1YSYLnp8E=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=byG9OI4FWQ0AYExjY0RLv/IETk/frOjfBpVnevRdL9TuUfuPc+MHnMEYm40mBv3TQ
 8yhtlrZvmiNoIDB01H/bnyFpS6CpqLDqlJ9xE9FQ2jHswU/ltBJToYW/TvSE7Qe+kD
 Y9lrV2SKAtOOCoZ+OKpqM6i/yctx1voRqW7kaTn3Xho0UsiwU3yyDagn+AUOZLvcSF
 fRkRzg0C/p+CC0QXvzCm4fIk0UJd6AocR2wOR298b5IsfGH10NMOE9M4eYAGSGkE8O
 haHR701P1OeAp6RK5BH2n/yphxtjtfUYAzPJ8tAWsAPorHknyOXGcOBoCECK241sOw
 Y/4ZrXLdrov9g==
Message-ID: <d035621a-33a6-ca38-1bb3-726b3dd0eab4@denx.de>
Date: Wed, 25 Jan 2023 14:56:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 2/6] drm: lcdif: Drop unnecessary NULL pointer check on
 lcdif->bridge
Content-Language: en-US
To: Liu Ying <victor.liu@nxp.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20230125064030.1222121-1-victor.liu@nxp.com>
 <20230125064030.1222121-3-victor.liu@nxp.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20230125064030.1222121-3-victor.liu@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
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
Cc: alexander.stein@ew.tq-group.com, s.hauer@pengutronix.de,
 krzysztof.kozlowski@linaro.org, robh+dt@kernel.org, linux-imx@nxp.com,
 krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org, kernel@pengutronix.de,
 LW@KARO-electronics.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/25/23 07:40, Liu Ying wrote:
> A valid bridge is already found in lcdif_attach_bridge() and set
> to lcdif->bridge, so lcdif->bridge cannot be a NULL pointer. Drop
> the unnecessary NULL pointer check in KMS stage.

Is it possible that a panel (instead of a bridge) be attached to LCDIFv3 
e.g. in case of iMXRT ?

> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
> v1->v2:
> * Split from patch 2/2 in v1. (Marek, Alexander)

Much appreciated, thanks.

[...]
