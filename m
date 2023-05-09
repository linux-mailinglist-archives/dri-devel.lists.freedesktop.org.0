Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C98B56FBCF1
	for <lists+dri-devel@lfdr.de>; Tue,  9 May 2023 04:14:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F1B310E321;
	Tue,  9 May 2023 02:14:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEC7F10E193
 for <dri-devel@lists.freedesktop.org>; Tue,  9 May 2023 02:14:11 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 72CE085FA5;
 Tue,  9 May 2023 04:14:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1683598450;
 bh=hedHLzP32iF9mL8n7oFO9rMyCPz2zJnpSCzRuNI/nEg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=IjjADvpgR5z5kK3nZYNsQatj25M4ZOWsrhbe9nqM1z1PdTGmmDXl2ewUJ/4nDJl5I
 98R61hPIAJtoCZ5KtWJhKqCxS8hvVf1Wix88nFq89UYvCy+ppXzI/jn9XL+Gdc7MCA
 DgXk3wSnnJL1ZPHqW53UAsYMgwS+Bp1tsn1Ygcf/bxnAdI12sUIgc0QfGO+qPIeNr4
 pi5Rrm0ovXedb72sbArtDEiKAFNEVSek9xGvf5hrdW9AjTgOOp/kW2r0P5R9XutKns
 aErKgFPn3nx5CgjihmR+tLunh4rhB0N83G8iqFVE74hWv18IiKRObuip9GLiulg1n8
 viqcKqWOYN9pg==
Message-ID: <ed2a654c-68ae-43cd-a69e-79b6e467f016@denx.de>
Date: Tue, 9 May 2023 02:13:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v5 4/6] drm: lcdif: Check consistent bus format and flags
 across first bridges
Content-Language: en-US
To: Liu Ying <victor.liu@nxp.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20230508055740.635256-1-victor.liu@nxp.com>
 <20230508055740.635256-5-victor.liu@nxp.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20230508055740.635256-5-victor.liu@nxp.com>
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
Cc: conor+dt@kernel.org, alexander.stein@ew.tq-group.com, shawnguo@kernel.org,
 s.hauer@pengutronix.de, krzysztof.kozlowski@linaro.org, robh+dt@kernel.org,
 linux-imx@nxp.com, krzysztof.kozlowski+dt@linaro.org, kernel@pengutronix.de,
 LW@karo-electronics.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 5/8/23 07:57, Liu Ying wrote:
> The single LCDIF embedded in i.MX93 SoC may drive multiple displays
> simultaneously.  Check bus format and flags across first bridges in
> ->atomic_check() to ensure they are consistent.  This is a preparation
> for adding i.MX93 LCDIF support.
> 
> Acked-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> Signed-off-by: Liu Ying <victor.liu@nxp.com>

Reviewed-by: Marek Vasut <marex@denx.de>
