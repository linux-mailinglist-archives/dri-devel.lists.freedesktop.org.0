Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F075BA01F61
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jan 2025 07:50:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8C1710E596;
	Mon,  6 Jan 2025 06:50:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.b="ZyCJMtVl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m3278.qiye.163.com (mail-m3278.qiye.163.com
 [220.197.32.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B96AD10E593
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jan 2025 06:50:20 +0000 (UTC)
Received: from [172.16.12.26] (unknown [58.22.7.114])
 by smtp.qiye.163.com (Hmail) with ESMTP id 7cf4282a;
 Mon, 6 Jan 2025 14:50:14 +0800 (GMT+08:00)
Message-ID: <ca29c6a5-8a9f-4a1f-8a14-bf7b616f4cb5@rock-chips.com>
Date: Mon, 6 Jan 2025 14:50:14 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 10/17] dt-bindings: display: rockchip: analogix-dp: Add
 support to get panel from the DP AUX bus
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: heiko@sntech.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, rfoss@kernel.org, vkoul@kernel.org,
 sebastian.reichel@collabora.com, cristian.ciocaltea@collabora.com,
 l.stach@pengutronix.de, andy.yan@rock-chips.com, hjc@rock-chips.com,
 algea.cao@rock-chips.com, kever.yang@rock-chips.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
References: <20241226063313.3267515-1-damon.ding@rock-chips.com>
 <20241226063313.3267515-11-damon.ding@rock-chips.com>
 <uwzrv4jgqqx6ge3lh3if37qvb6w7ubkusohunbn7ukmq5tt6du@e5fwoik4tex2>
Content-Language: en-US
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <uwzrv4jgqqx6ge3lh3if37qvb6w7ubkusohunbn7ukmq5tt6du@e5fwoik4tex2>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGR4dSVZNQktOSR1JH0tDTx5WFRQJFh
 oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSUhCSE
 NVSktLVUpCS0tZBg++
X-HM-Tid: 0a943a60defd03a3kunm7cf4282a
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PSI6Qgw5KTIQTBgyHQssLhNJ
 KjZPCSNVSlVKTEhNSk9NSUpNSE9IVTMWGhIXVR8aFhQVVR8SFRw7CRQYEFYYExILCFUYFBZFWVdZ
 EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFCS003Bg++
DKIM-Signature: a=rsa-sha256;
 b=ZyCJMtVlZB9Q7i8XqHl0UHJInDef0l+BnirMPajG7a1HWOhuK+MkTaFhHOEGFgVWRdnS4utJvJPuPajqGYWUwfwKmbNwEqVzE2njnuvLBxHPiFbVTmDUFKhpZxu48vs7P5VQ6EzM7j+Oa3aeh8UY0za8edyrIP0eM/dVCtBDWNA=;
 c=relaxed/relaxed; s=default; d=rock-chips.com; v=1; 
 bh=4SFMXBZq9vYc3ofpJpCPeqvivyBEabL0OOJJZkXDUg8=;
 h=date:mime-version:subject:message-id:from;
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Krzysztof,

On 2024/12/27 15:53, Krzysztof Kozlowski wrote:
> On Thu, Dec 26, 2024 at 02:33:06PM +0800, Damon Ding wrote:
>> According to Documentation/devicetree/bindings/display/dp-aux-bus.yaml,
>> it is a good way to get panel through the DP AUX bus.
>>
>> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
>>
>> Changes in v4:
>> - Move the dt-bindings commit before related driver commits
> 
> 
> Changelog does not go to commit msg.
> 
> Please run scripts/checkpatch.pl and fix reported warnings. After that,
> run also and (probably) fix more warnings. Some warnings can be
> ignored, especially from --strict run, but the code here looks like it
> needs a fix. Feel free to get in touch if the warning is not clear.
> 

Indeed, the commit msg will be fixed in next version.

Best regards
Damon


