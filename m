Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C09EA1B366
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jan 2025 11:20:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 463ED10E04D;
	Fri, 24 Jan 2025 10:20:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.b="R9P1b2tY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m1973188.qiye.163.com (mail-m1973188.qiye.163.com
 [220.197.31.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1AB410E04D
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jan 2025 10:20:27 +0000 (UTC)
Received: from [172.16.12.26] (unknown [58.22.7.114])
 by smtp.qiye.163.com (Hmail) with ESMTP id 999d7bbb;
 Fri, 24 Jan 2025 18:20:21 +0800 (GMT+08:00)
Message-ID: <9199671c-f647-4c39-8618-f2d7fa28f081@rock-chips.com>
Date: Fri, 24 Jan 2025 18:20:21 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 09/14] dt-bindings: display: rockchip: analogix-dp: Add
 support for RK3588
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: devicetree@vger.kernel.org, kever.yang@rock-chips.com,
 l.stach@pengutronix.de, linux-phy@lists.infradead.org, vkoul@kernel.org,
 linux-kernel@vger.kernel.org, cristian.ciocaltea@collabora.com,
 hjc@rock-chips.com, sebastian.reichel@collabora.com,
 dmitry.baryshkov@linaro.org, rfoss@kernel.org, krzk+dt@kernel.org,
 heiko@sntech.de, andy.yan@rock-chips.com,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 algea.cao@rock-chips.com, linux-rockchip@lists.infradead.org,
 conor+dt@kernel.org
References: <20250123100747.1841357-1-damon.ding@rock-chips.com>
 <20250123100747.1841357-10-damon.ding@rock-chips.com>
 <173763136187.3345079.11905359473404124812.robh@kernel.org>
Content-Language: en-US
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <173763136187.3345079.11905359473404124812.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQk8dTFZLShpKTRgdGkhMTExWFRQJFh
 oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpOTE
 5VSktLVUpCS0tZBg++
X-HM-Tid: 0a9497d3b59d03a3kunm999d7bbb
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NBg6Lyo5AzIKCho4Az0aKBw4
 MC8KCh1VSlVKTEhMTEpPS0lIT01DVTMWGhIXVR8aFhQVVR8SFRw7CRQYEFYYExILCFUYFBZFWVdZ
 EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFIS0lCNwY+
DKIM-Signature: a=rsa-sha256;
 b=R9P1b2tY3AWKf5ZQ/2+nyS6ZvqpAcjzV+V0ScfM8eTSa/i9Jm7OY1vqqONpq6+DgOfkt6gctdO2lSxQme3D9eMmucV/8kGVoor85I9KlWdAqTsNwPPTY2EezB9MMB0cHYdCBnaRleqMhTFQriClr29J69Y0S/jfwE5Fq1TFS1S0=;
 s=default; c=relaxed/relaxed; d=rock-chips.com; v=1; 
 bh=u0BM50TZK/HIu82bsqWrUkagwGNI0D2aUJbSTJdHkTw=;
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

Hi Rob,

On 2025/1/23 19:22, Rob Herring (Arm) wrote:
> 
> On Thu, 23 Jan 2025 18:07:42 +0800, Damon Ding wrote:
>> Compared with RK3288/RK3399, the HBR2 link rate support is the main
>> improvement of RK3588 eDP TX controller, and there are also two
>> independent eDP display interfaces on RK3588 Soc.
>>
>> The newly added 'apb' reset is to ensure the APB bus of eDP controller
>> works well on the RK3588 SoC.
>>
>> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
>>
>> ---
>>
>> Changes in v2:
>> - Add the main defferences of the RK3588 eDP and the previous versions
>>    in commit message
>>
>> Changes in v3:
>> - Expand the property clock-names, resets and reset-names
>>
>> Changes in v4:
>> - Remove 'spdif' clock which added in v3
>> - Add the comment of newly added 'apb' reset in commit message
>>
>> Changes in v5:
>> - Put the differences between RK3288/RK3399 and RK3588 into 'allOf'
>>
>> Changes in v6:
>> - Keep the widest constraints and add only RK3588 related constraints
>>    into 'allOf'
>> ---
>>   .../rockchip/rockchip,analogix-dp.yaml        | 22 ++++++++++++++++++-
>>   1 file changed, 21 insertions(+), 1 deletion(-)
>>
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml: properties:reset-names: 'const' should not be valid under {'enum': ['const', 'enum', 'exclusiveMaximum', 'exclusiveMinimum', 'minimum', 'maximum', 'multipleOf', 'pattern']}
> 	hint: Scalar and array keywords cannot be mixed
> 	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml: properties:reset-names: 'const' should not be valid under {'enum': ['const', 'enum', 'exclusiveMaximum', 'exclusiveMinimum', 'minimum', 'maximum', 'multipleOf', 'pattern']}
> 	hint: Scalar and array keywords cannot be mixed
> 	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
> 
> doc reference errors (make refcheckdocs):
> 
> See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250123100747.1841357-10-damon.ding@rock-chips.com
> 
> The base for the series is generally the latest rc1. A different dependency
> should be noted in *this* patch.
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
> 
> pip3 install dtschema --upgrade
> 
> Please check and re-submit after running the above command yourself. Note
> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> your schema. However, it must be unset to test all examples with your schema.
> 
> 
> 

I have found these errors using dt_binding_check and will fix them in 
the next version.

Best regards
Damon
