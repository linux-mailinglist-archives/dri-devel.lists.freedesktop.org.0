Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA079B09DFA
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jul 2025 10:30:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA90910E922;
	Fri, 18 Jul 2025 08:30:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.b="f4elrr2y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m1973187.qiye.163.com (mail-m1973187.qiye.163.com
 [220.197.31.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A6C110E922
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jul 2025 08:30:36 +0000 (UTC)
Received: from [172.16.12.153]
 (gy-adaptive-ssl-proxy-2-entmail-virt205.gy.ntes [58.22.7.114])
 by smtp.qiye.163.com (Hmail) with ESMTP id 1c79131e1;
 Fri, 18 Jul 2025 16:30:22 +0800 (GMT+08:00)
Message-ID: <71251cf5-edf9-489f-94db-9eb74791ea54@rock-chips.com>
Date: Fri, 18 Jul 2025 16:29:42 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] arm64: dts: rockchip: rk3399-evb-ind: Add support
 for DisplayPort
To: Krzysztof Kozlowski <krzk@kernel.org>, Chaoyi Chen <kernel@airkyi.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Heiko Stuebner
 <heiko@sntech.de>, Sandy Huang <hjc@rock-chips.com>,
 Andy Yan <andy.yan@rock-chips.com>,
 Yubing Zhang <yubing.zhang@rock-chips.com>,
 Frank Wang <frank.wang@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Amit Sunil Dhamne <amitsd@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dragan Simic <dsimic@manjaro.org>, Johan Jonker <jbx6244@gmail.com>,
 Diederik de Haas <didi.debian@cknow.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org
References: <20250718062619.99-1-kernel@airkyi.com>
 <20250718062619.99-6-kernel@airkyi.com>
 <2691a1ca-7325-4129-999d-61d883d1bac4@kernel.org>
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <2691a1ca-7325-4129-999d-61d883d1bac4@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0a981ca7e66903abkunmc03baa52123841
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQ08eQlYaHUoZHkNKGkIfSE5WFRQJFh
 oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpPSE
 xVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
 b=f4elrr2yrukBrG0T2pA0xg2Zn1ijyeEtt36iL+JwKtzWgjhTbohQ23NYc1T1ISuHDdevrv8P9aJ3mpWCaVJoFWB7OQROrbmrnQL4wZlgOFRUZWKj+O1waTPK+7R2e25Wvg5cVr54ZTu5LSLmbzlhMbczTTFaqdZiBsqUs8mHr9o=;
 s=default; c=relaxed/relaxed; d=rock-chips.com; v=1; 
 bh=3qLZheDap41+YH7RXHcCPq8E9eTIuAxIIHxzGTMVwQE=;
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

On 2025/7/18 16:14, Krzysztof Kozlowski wrote:
> On 18/07/2025 08:26, Chaoyi Chen wrote:
>> +			altmodes {
>> +				displayport {
>> +					svid = /bits/ 16 <0xff01>;
>> +					vdo = <0xffffffff>;
>> +				};
>> +			};
>> +
>> +			ports {
>> +				#address-cells = <1>;
>> +				#size-cells = <0>;
>> +
>> +				port@0 {
>> +					reg = <0>;
>> +
>> +					usbc0_orien_sw: endpoint {
>> +						remote-endpoint = <&tcphy0_orientation_switch>;
> How did you address feedback given here? I don't see any replies.

Sorry, I miss it. The port@0 should be used for USB HS. Will fix in v3.


>
>> +					};
>> +				};
>> +
>> +				port@1 {
>> +					reg = <1>;
>> +
>> +					dp_mode_sw: endpoint {
>> +						remote-endpoint = <&tcphy_dp_altmode_switch>;
>> +					};
>> +				};
>
>
> Best regards,
> Krzysztof
>
>
