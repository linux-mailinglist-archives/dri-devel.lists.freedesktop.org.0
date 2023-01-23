Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8430E67807D
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jan 2023 16:50:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5F4E10E191;
	Mon, 23 Jan 2023 15:50:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4641510E191
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 15:50:48 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 55C9280375;
 Mon, 23 Jan 2023 16:50:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1674489046;
 bh=VTlv3YsP2wm7T9L1A08tQyNMzWRUjUZ90k0GT+bcFF8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=rvq2PVwjbm9dwMsrydB/G1Eu/X2snK/6cK8A0hdqoHvHPowFKX+P8jKdYwlRGTh5E
 tVH14bwPJmxR3AXoLGcDvfKCRiUwsWW3gvdYph07ggiA6O0j+1qNL7N87XjKSvG/e3
 UE5aYLMJnLo+jgNnVu7ZJ4swq5QO2gteA0XDrnCUdowv/UYmzzxK6uuZvg8alS2zrE
 GhZCCCfJ3tirVBQaN/aoFkfp9DDe2NWrcWCFR5NqQ5JMumUKYosz42Jx0ec8Yv3mao
 wAAGI3206J70YwR4LCUAmsaEijyBHbRPtwjMiVnUeCmCkFQOM2TQ2FJ2sbqXKklbV8
 Rml3vl32reHJQ==
Message-ID: <43f3c323-4757-8fe5-415f-aa7fbea7bcab@denx.de>
Date: Mon, 23 Jan 2023 16:50:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 1/2] dt-bindings: lcdif: Add i.MX93 LCDIF support
Content-Language: en-US
To: Liu Ying <victor.liu@nxp.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20230123072358.1060670-1-victor.liu@nxp.com>
 <20230123072358.1060670-2-victor.liu@nxp.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20230123072358.1060670-2-victor.liu@nxp.com>
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
Cc: s.hauer@pengutronix.de, robh+dt@kernel.org, linux-imx@nxp.com,
 krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org, kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/23/23 08:23, Liu Ying wrote:
> There is one LCDIF embedded in i.MX93 SoC to connect with
> MIPI DSI controller through LCDIF cross line pattern(controlled
> by mediamix blk-ctrl) or connect with LVDS display bridge(LDB)
> directly or connect with a parallel display through parallel
> display format(also controlled by mediamix blk-ctrl).  i.MX93
> LCDIF IP is essentially the same to i.MX8MP LCDIF IP.  Add device
> tree binding for i.MX93 LCDIF.
> 
> Signed-off-by: Liu Ying <victor.liu@nxp.com>

Reviewed-by: Marek Vasut <marex@denx.de>
