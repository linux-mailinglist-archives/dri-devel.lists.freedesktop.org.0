Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A2A39DF8AD
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2024 03:03:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A74010E0BC;
	Mon,  2 Dec 2024 02:03:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.b="YmCCzhv7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m32107.qiye.163.com (mail-m32107.qiye.163.com
 [220.197.32.107])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91E4D10E0BC
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Dec 2024 02:03:50 +0000 (UTC)
Received: from [172.16.12.26] (unknown [58.22.7.114])
 by smtp.qiye.163.com (Hmail) with ESMTP id 461506be;
 Mon, 2 Dec 2024 10:03:42 +0800 (GMT+08:00)
Message-ID: <79421ac4-ffb5-4763-8ba7-cb7bd25c1c80@rock-chips.com>
Date: Mon, 2 Dec 2024 10:03:42 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 02/10] dt-bindings: display: rockchip: analogix-dp: Add
 support for RK3588
To: Krzysztof Kozlowski <krzk@kernel.org>, heiko@sntech.de
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 rfoss@kernel.org, vkoul@kernel.org, sebastian.reichel@collabora.com,
 cristian.ciocaltea@collabora.com, l.stach@pengutronix.de,
 andy.yan@rock-chips.com, hjc@rock-chips.com, algea.cao@rock-chips.com,
 kever.yang@rock-chips.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org
References: <20241127075157.856029-1-damon.ding@rock-chips.com>
 <20241127075157.856029-3-damon.ding@rock-chips.com>
 <5d4bebf5-7954-4739-9cd4-93d78d337738@kernel.org>
Content-Language: en-US
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <5d4bebf5-7954-4739-9cd4-93d78d337738@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGUxJGFYaHU9LSkNCTRoaSklWFRQJFh
 oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSUhCSE
 NVSktLVUpCS0tZBg++
X-HM-Tid: 0a93851bf68803a3kunm461506be
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PRg6Izo*DzIYNxwXPDMOGEs*
 DTBPFBNVSlVKTEhISktOS0lPSElJVTMWGhIXVR8aFhQVVR8SFRw7CRQYEFYYExILCFUYFBZFWVdZ
 EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFMS043Bg++
DKIM-Signature: a=rsa-sha256;
 b=YmCCzhv7vginIZyrZcj/ecu0aLKtyt+uIpxiTMR1jogyL9BG3ZBbpB6ePDvB6dYxlsc4xGs49TbcG3qacO2l4tUp+wEuyrCqlkVpLbzEzmC1kV9vMcP9F9r9RBMwOtFXL2KEfuhnrjcgbE96xO251M5eyIn0ocPEiX1XEa6jrT0=;
 s=default; c=relaxed/relaxed; d=rock-chips.com; v=1; 
 bh=Y241lptnwQ37OUoaH11vBxiTF8EY0NMjd3KnNF0LCj8=;
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

On 2024/11/27 18:23, Krzysztof Kozlowski wrote:
> On 27/11/2024 08:51, Damon Ding wrote:
>> Add the compatible "rockchip,rk3588-edp".
> 
> This we see from the diff. Say something about hardware and why it is
> not compatible with existing variants.

In response to your kind suggestion, I will add more details in next 
version, specifically:

Compared with RK3288/RK3399, the HBR2 link rate support is the main
improvement of RK3588 eDP TX controller, and there are also two
independent eDP display interfaces on RK3588 Soc.

> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> 
> 
> Best regards,
> Krzysztof
> 
> 

Best regards,
Damon

