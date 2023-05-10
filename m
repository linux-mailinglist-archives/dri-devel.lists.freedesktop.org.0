Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8DCC6FE245
	for <lists+dri-devel@lfdr.de>; Wed, 10 May 2023 18:22:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D9FE10E266;
	Wed, 10 May 2023 16:22:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4068910E266
 for <dri-devel@lists.freedesktop.org>; Wed, 10 May 2023 16:22:00 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 08E0E85D1E;
 Wed, 10 May 2023 18:21:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1683735717;
 bh=Dk/OU7wmaNZMLcevPTKhSodBVPmPPaEdH0F0dmzNl2M=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=ZSkl1dXoZsDv1eX3hF75wsrkCvp7b4/rkOSTIjabE6uuoC7CLLQQQ8iCNJPnF2ASq
 Iir6mJpGphckwT24UkqmYcoKfzsxWTH0NpLPU8nNKII7od7uiPMaZzS79TIYApMb/5
 6bFLCKg9EQznt86htrJTKdxELxWX07SKYnHN1okVOXlnZmXxeSXE3KjNl2zlELE/K9
 83eEAAAwfOBlFoftCYEsg+KjOxmh/gpOKZRR9z9QrwWwCg4SGO0vMCzDVop5xYB+0e
 8f8SReLFliXL5HedAEEGByhAEE2+z7l7pZ+grUHftMTuT9otgoynEkHcNPr1K5DWXh
 CiwG+azR4dAag==
Message-ID: <e26ab6fa-a273-81a6-bb28-356deca07563@denx.de>
Date: Wed, 10 May 2023 18:21:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v6 2/6] drm: lcdif: Drop unnecessary NULL pointer check on
 lcdif->bridge
Content-Language: en-US
To: Liu Ying <victor.liu@nxp.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20230510092450.4024730-1-victor.liu@nxp.com>
 <20230510092450.4024730-3-victor.liu@nxp.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20230510092450.4024730-3-victor.liu@nxp.com>
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

On 5/10/23 11:24, Liu Ying wrote:
> A valid bridge is already found in lcdif_attach_bridge() and set
> to lcdif->bridge, so lcdif->bridge cannot be a NULL pointer. Drop
> the unnecessary NULL pointer check in KMS stage.
> 
> Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> Signed-off-by: Liu Ying <victor.liu@nxp.com>

Reviewed-by: Marek Vasut <marex@denx.de>
