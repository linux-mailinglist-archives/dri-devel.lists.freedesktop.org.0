Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A86AF6FBCF3
	for <lists+dri-devel@lfdr.de>; Tue,  9 May 2023 04:14:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE38D10E323;
	Tue,  9 May 2023 02:14:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BFE010E323
 for <dri-devel@lists.freedesktop.org>; Tue,  9 May 2023 02:14:15 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 1950484788;
 Tue,  9 May 2023 04:14:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1683598454;
 bh=AOmIWWNZ6u4D37izcBljoec4+1ogUkw+ltAcx1tZMaY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=DC6SBCTzrkaYyKc9uIRLVCForCDZ1qYVt21hfy8S0m4mmjqtoGBAw7aIvNNM0jn2d
 7eN9RZdwsUNioowkwEQ++9T5wjOiZeKAdLRhb1s19I+vi57tgSsZmZ761wlP/na6C3
 MR76fxaYJFVmgin2bFaG3qKw1KcoP3aue1fWitz3A6ffSC/8t3t1TESzcgFoiTENDj
 wNG5eVI5BSOj9EgAVITyRGGtcBVD+DARLhfHYfGP5rOBuvI0gPFWDrkxMGZfh8+wxZ
 UUONc9KmUGpPK8q1ZipY66oKN4Cd9tl1KErkw/HmfCY2NqCOsOz7oG94ZVZSFuq6Lo
 WSbBFTw6bI48Q==
Message-ID: <7ceb591d-8d19-7987-209c-694cb505cbe1@denx.de>
Date: Tue, 9 May 2023 02:24:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v5 6/6] drm: lcdif: Add i.MX93 LCDIF compatible string
Content-Language: en-US
To: Liu Ying <victor.liu@nxp.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20230508055740.635256-1-victor.liu@nxp.com>
 <20230508055740.635256-7-victor.liu@nxp.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20230508055740.635256-7-victor.liu@nxp.com>
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
> With all previous preparations done to make it possible for the
> single LCDIF embedded in i.MX93 SoC to drive multiple displays
> simultaneously, add i.MX93 LCDIF compatible string as the last
> step of adding i.MX93 LCDIF support.
> 
> Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> Signed-off-by: Liu Ying <victor.liu@nxp.com>

Reviewed-by: Marek Vasut <marex@denx.de>
