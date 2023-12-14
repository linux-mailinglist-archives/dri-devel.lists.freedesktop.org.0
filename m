Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06A2681286A
	for <lists+dri-devel@lfdr.de>; Thu, 14 Dec 2023 07:46:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E7EF10E192;
	Thu, 14 Dec 2023 06:46:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m49222.qiye.163.com (mail-m49222.qiye.163.com
 [45.254.49.222])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9649310E192
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Dec 2023 06:46:46 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=CnvD0IrkRnp+DmnzfgfteCXPBAsutHSVsMWQK1rzFcAblJYEkSweXgFANYqw3U88pMYtkO79l9NPInFWXnD8hXVCLdT/uGfcSOpoRB/rdY8p5rmXE/4TQuVE+Lx8BOFMINbrY+owqdLEaBAqVf9sYElyHBXbfm1pT585TwgcNJU=;
 s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
 bh=KlkoaA5PsGnM9dQhcrREu3MkNeyqWVDoqb2DLKgU9rM=;
 h=date:mime-version:subject:message-id:from;
Received: from [172.16.12.141] (unknown [58.22.7.114])
 by mail-m12779.qiye.163.com (Hmail) with ESMTPA id 5272778019C;
 Thu, 14 Dec 2023 14:46:38 +0800 (CST)
Message-ID: <7a20761b-4cec-4b65-b9fa-efce73ac4c83@rock-chips.com>
Date: Thu, 14 Dec 2023 14:46:37 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: (subset) [PATCH v5 00/16] Add VOP2 support on rk3588
To: Heiko Stuebner <heiko@sntech.de>, Andy Yan <andyshrk@163.com>
References: <20231211115547.1784587-1-andyshrk@163.com>
 <170247871959.753029.11166929824242336708.b4-ty@sntech.de>
Content-Language: en-US
From: Andy Yan <andy.yan@rock-chips.com>
In-Reply-To: <170247871959.753029.11166929824242336708.b4-ty@sntech.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGUhOH1ZOHhhPHhpOThhPTkxVEwETFh
 oSFyQUDg9ZV1kYEgtZQVlOQ1VJSVVMVUpKT1lXWRYaDxIVHRRZQVlPS0hVSk1PSU5JVUpLS1VKQl
 kG
X-HM-Tid: 0a8c6713c726b24fkuuu5272778019c
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PD46GRw*FDw#MzJDAhI6HA4S
 LEwaFApVSlVKTEtJTkhNSEJCSU1NVTMWGhIXVRoVHwJVAhoVOwkUGBBWGBMSCwhVGBQWRVlXWRIL
 WUFZTkNVSUlVTFVKSk9ZV1kIAVlBSEtJQjcG
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
Cc: devicetree@vger.kernel.org, hjc@rock-chips.com,
 linux-kernel@vger.kernel.org, kever.yang@rock-chips.com,
 dri-devel@lists.freedesktop.org, sebastian.reichel@collabora.com,
 linux-rockchip@lists.infradead.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, chris.obbard@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Heiko:

On 12/13/23 22:46, Heiko Stuebner wrote:
> On Mon, 11 Dec 2023 19:55:47 +0800, Andy Yan wrote:
>> From: Andy Yan <andy.yan@rock-chips.com>
>>
>> This patch sets aims at enable the VOP2 support on rk3588.
>>
>> Main feature of VOP2 on rk3588:
>> Four video ports:
>> VP0 Max 4096x2160
>> VP1 Max 4096x2160
>> VP2 Max 4096x2160
>> VP3 Max 2048x1080
>>
>> [...]
> 
> Applied, thanks!
> 
> [10/16] dt-bindings: display: vop2: Add rk3588 support
>          commit: 4ccdc92c1fea732fac8f3438d6288719055fa141
> [11/16] dt-bindings: rockchip,vop2: Add more endpoint definition
>          commit: dc7226acacc6502291446f9e33cf96246ec49a30
> [12/16] drm/rockchip: vop2: Add support for rk3588
>          commit: 5a028e8f062fc862f051f8e62a0d5a1abac91955
> [13/16] drm/rockchip: vop2: rename VOP_FEATURE_OUTPUT_10BIT to VOP2_VP_FEATURE_OUTPUT_10BIT
>          commit: 9d7fe7704d534c2d043aff2987f10671a8b4373d
> [16/16] MAINTAINERS: Add myself as a reviewer for rockchip drm
>          commit: 6c3ab21f37a97a868193ccbeb8a492e51210ff31
> 
> 
> I skipped the debugfs patch for now, as I need to look at that separately
> and of course the dts patch as that needs to wait for iommu maintainers
> to pick up the binding addition.

That's fine. Thanks for picking these series.

> 
> 
> Best regards,
