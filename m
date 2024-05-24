Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EA388CE45B
	for <lists+dri-devel@lfdr.de>; Fri, 24 May 2024 12:42:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54AAB10EF17;
	Fri, 24 May 2024 10:42:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.b="GkfVqmOe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m49243.qiye.163.com (mail-m49243.qiye.163.com
 [45.254.49.243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FD1710EF1A
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2024 10:42:05 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=GkfVqmOeodjSsHUIq7QZo9oKtwtbKwTt1qnHgCTG7/yWGhv2yHi+u/CK66SOf+nx56G2fHNn+AAnB5zgRSEuWjsTBo7MLRQ4oNxI3lq9VLlgWAJc6ywdMRjS2vUfXHuxgqyIoQ9fOYEhpFMhZiu+gSqQmlvfR259P0J6HSLXrSY=;
 c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
 bh=vlYy6kfDRcuOHsQw1Qcrcg0CgVRI1V2ODtI9AvFKsJ4=;
 h=date:mime-version:subject:message-id:from;
Received: from [172.16.12.141] (unknown [58.22.7.114])
 by smtp.qiye.163.com (Hmail) with ESMTPA id ADE8E840B0B;
 Fri, 24 May 2024 18:41:51 +0800 (CST)
Message-ID: <5dec9bd2-88ed-46e6-bb8d-fa899b563fd3@rock-chips.com>
Date: Fri, 24 May 2024 18:41:51 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: (subset) [PATCH v5 00/16] Add VOP2 support on rk3588
From: Andy Yan <andy.yan@rock-chips.com>
To: Heiko Stuebner <heiko@sntech.de>, Andy Yan <andyshrk@163.com>
Cc: sebastian.reichel@collabora.com, krzysztof.kozlowski+dt@linaro.org,
 chris.obbard@collabora.com, robh+dt@kernel.org, devicetree@vger.kernel.org,
 kever.yang@rock-chips.com, linux-rockchip@lists.infradead.org,
 hjc@rock-chips.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20231211115547.1784587-1-andyshrk@163.com>
 <170247871959.753029.11166929824242336708.b4-ty@sntech.de>
 <7a20761b-4cec-4b65-b9fa-efce73ac4c83@rock-chips.com>
Content-Language: en-US
In-Reply-To: <7a20761b-4cec-4b65-b9fa-efce73ac4c83@rock-chips.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGkJOS1YdTExOHUoeTRlOTkhVEwETFh
 oSFyQUDg9ZV1kYEgtZQVlOQ1VJSVVMVUpKT1lXWRYaDxIVHRRZQVlPS0hVSk1PSU5JVUpLS1VKQl
 kG
X-HM-Tid: 0a8faa315ab403a4kunmade8e840b0b
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6MRw6Kxw6QzNDMRcDFi5ISUMR
 Gj8KCi5VSlVKTEpNTk9MSEpJTU5OVTMWGhIXVRoVHwJVAhoVOwkUGBBWGBMSCwhVGBQWRVlXWRIL
 WUFZTkNVSUlVTFVKSk9ZV1kIAVlBSEhCTTcG
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

Hi Heiko,

On 12/14/23 14:46, Andy Yan wrote:
> Hi Heiko:
> 
> On 12/13/23 22:46, Heiko Stuebner wrote:
>> On Mon, 11 Dec 2023 19:55:47 +0800, Andy Yan wrote:
>>> From: Andy Yan <andy.yan@rock-chips.com>
>>>
>>> This patch sets aims at enable the VOP2 support on rk3588.
>>>
>>> Main feature of VOP2 on rk3588:
>>> Four video ports:
>>> VP0 Max 4096x2160
>>> VP1 Max 4096x2160
>>> VP2 Max 4096x2160
>>> VP3 Max 2048x1080
>>>
>>> [...]
>>
>> Applied, thanks!
>>
>> [10/16] dt-bindings: display: vop2: Add rk3588 support
>>          commit: 4ccdc92c1fea732fac8f3438d6288719055fa141
>> [11/16] dt-bindings: rockchip,vop2: Add more endpoint definition
>>          commit: dc7226acacc6502291446f9e33cf96246ec49a30
>> [12/16] drm/rockchip: vop2: Add support for rk3588
>>          commit: 5a028e8f062fc862f051f8e62a0d5a1abac91955
>> [13/16] drm/rockchip: vop2: rename VOP_FEATURE_OUTPUT_10BIT to VOP2_VP_FEATURE_OUTPUT_10BIT
>>          commit: 9d7fe7704d534c2d043aff2987f10671a8b4373d
>> [16/16] MAINTAINERS: Add myself as a reviewer for rockchip drm
>>          commit: 6c3ab21f37a97a868193ccbeb8a492e51210ff31
>>
>>
>> I skipped the debugfs patch for now, as I need to look at that separately
>> and of course the dts patch as that needs to wait for iommu maintainers
>> to pick up the binding addition.
> 
> That's fine. Thanks for picking these series.

Would you please take a look at the debugfs patch when it's convenient for you?
It's really useful for development and bug hunting.

> 
>>
>>
>> Best regards,
