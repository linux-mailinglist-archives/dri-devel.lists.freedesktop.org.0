Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F3A048060A9
	for <lists+dri-devel@lfdr.de>; Tue,  5 Dec 2023 22:25:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BB6310E61F;
	Tue,  5 Dec 2023 21:24:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C32A10E61F
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Dec 2023 21:24:57 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id E17AB8719C;
 Tue,  5 Dec 2023 22:24:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1701811495;
 bh=UDWcFcksNDSZ3bnIJtlYDj3W8lT3fK2OZ5ULG/P8BJM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=hd8V46PA+/yicfPo79+VHRyHMC+qFvQ400uSImK92b7FhoTcG0JOv/22yL1y0zgV4
 XpooMzB2XsmDKQrpHPO0d4qtUom936q60uToJ57/baGi08swVgHyp37QKeklKo3KLG
 cKLZIfhOV3LkidB9wxJtbjy8HpGMaFIDWyc33MbtJfhwFxv41H3G80Bo12fUyiGwAJ
 DsKiiPBEvbQSoEm8KrNBgl/FM60XPRP9bQ3uqHtKWQh+PHfh38O6SULXPTY4lr7lO+
 Exw0CKtPfV4DIfqDnhKVEVJ6jBF7RZpKwDtOy2xWgBCooyRI/lXAJ2Htk7XAcjTnij
 U3thh4NF8UBFw==
Message-ID: <4a3e4dd5-f393-4668-95a3-d30a8889b419@denx.de>
Date: Tue, 5 Dec 2023 22:24:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dt-bindings: lcdif: Properly describe the i.MX23
 interrupts
Content-Language: en-US
To: Fabio Estevam <festevam@gmail.com>
References: <20231205184748.2103321-1-festevam@gmail.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20231205184748.2103321-1-festevam@gmail.com>
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org,
 Fabio Estevam <festevam@denx.de>, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/5/23 19:47, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
> 
> i.MX23 has two LCDIF interrupts instead of a single one like other
> i.MX devices.
> 
> Take this into account for properly describing the i.MX23 LCDIF
> interrupts.
> 
> This fixes the following dt-schema warning:
> 
> imx23-olinuxino.dtb: lcdif@80030000: interrupts: [[46], [45]] is too long
> 	from schema $id: http://devicetree.org/schemas/display/fsl,lcdif.yaml#
> 
> Signed-off-by: Fabio Estevam <festevam@denx.de>

Indeed

Reviewed-by: Marek Vasut <marex@denx.de>
