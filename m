Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B22C80B175
	for <lists+dri-devel@lfdr.de>; Sat,  9 Dec 2023 02:35:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71F9810E175;
	Sat,  9 Dec 2023 01:35:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 371 seconds by postgrey-1.36 at gabe;
 Sat, 09 Dec 2023 01:35:12 UTC
Received: from mail-m25498.xmail.ntesmail.com (mail-m25498.xmail.ntesmail.com
 [103.129.254.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57D6510E175
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Dec 2023 01:35:12 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=WZL9Qf7nBhlJXS+J4P/19lIGNWFFvmhrmiX0sT5kFHH7bXcfzghvQ3SXcaCix5VUwJFycuvS0ZBG6LtoaBpbYEkuDao9WOl7iVcEXJqM9+ntYAvLj2FIs0sB9qibSpqgWPVyD2JeRyhTcQwSr0KVK51ilKsckwZG9NSf9ndsvOw=;
 s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
 bh=HV2z/Dcq1u/NQro4ECOCLl8zo8h8Oih7gNKDIKTVpnI=;
 h=date:mime-version:subject:message-id:from;
Received: from [172.16.12.141] (unknown [58.22.7.114])
 by mail-m12779.qiye.163.com (Hmail) with ESMTPA id 3F245780176;
 Sat,  9 Dec 2023 09:28:56 +0800 (CST)
Message-ID: <d45b1a26-3ea3-4699-b86f-cc7d38718721@rock-chips.com>
Date: Sat, 9 Dec 2023 09:28:55 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 16/17] arm64: dts: rockchip: Add vop on rk3588
Content-Language: en-US
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andyshrk@163.com>
References: <20231207075906.651771-1-andyshrk@163.com>
 <20231207080247.652780-1-andyshrk@163.com> <4730849.ejJDZkT8p0@diego>
From: Andy Yan <andy.yan@rock-chips.com>
In-Reply-To: <4730849.ejJDZkT8p0@diego>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQkNMSVYaTkxDQk1CTUIZTkxVEwETFh
 oSFyQUDg9ZV1kYEgtZQVlOQ1VJSVVMVUpKT1lXWRYaDxIVHRRZQVlPS0hVSk1PSU5JVUpLS1VKQl
 kG
X-HM-Tid: 0a8c4c311dfbb24fkuuu3f245780176
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Ohg6Hww5Qjw2Fk5LFh8iSxZW
 MhMaCy9VSlVKTEtJS0NOSEhMS0JOVTMWGhIXVRoVHwJVAhoVOwkUGBBWGBMSCwhVGBQWRVlXWRIL
 WUFZTkNVSUlVTFVKSk9ZV1kIAVlBT0JLSzcG
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
Cc: devicetree@vger.kernel.org, chris.obbard@collabora.com, hjc@rock-chips.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kever.yang@rock-chips.com, linux-rockchip@lists.infradead.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 sebastian.reichel@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Heiko:

On 12/9/23 00:26, Heiko Stübner wrote:
> Hi Andy,
> 
> Am Donnerstag, 7. Dezember 2023, 09:02:47 CET schrieb Andy Yan:
>> From: Andy Yan <andy.yan@rock-chips.com>
>>
>> Add vop dt node for rk3588.
>>
>> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
>> ---
>>
>> (no changes since v1)
>>
>>   arch/arm64/boot/dts/rockchip/rk3588s.dtsi | 96 +++++++++++++++++++++++
>>   1 file changed, 96 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/rockchip/rk3588s.dtsi b/arch/arm64/boot/dts/rockchip/rk3588s.dtsi
>> index 7064c0e9179f..a9810ca78dc4 100644
>> --- a/arch/arm64/boot/dts/rockchip/rk3588s.dtsi
>> +++ b/arch/arm64/boot/dts/rockchip/rk3588s.dtsi
>> @@ -593,6 +608,87 @@ i2c0: i2c@fd880000 {
>>   		status = "disabled";
>>   	};
>>   
>> +	vop: vop@fdd90000 {
>> +		compatible = "rockchip,rk3588-vop";
>> +		reg = <0x0 0xfdd90000 0x0 0x4200>, <0x0 0xfdd95000 0x0 0x1000>;
>> +		reg-names = "vop", "gamma_lut";
>> +		interrupts = <GIC_SPI 156 IRQ_TYPE_LEVEL_HIGH 0>;
>> +		clocks = <&cru ACLK_VOP>,
>> +			 <&cru HCLK_VOP>,
>> +			 <&cru DCLK_VOP0>,
>> +			 <&cru DCLK_VOP1>,
>> +			 <&cru DCLK_VOP2>,
>> +			 <&cru DCLK_VOP3>,
>> +			 <&cru PCLK_VOP_ROOT>;
>> +		clock-names = "aclk",
>> +			      "hclk",
>> +			      "dclk_vp0",
>> +			      "dclk_vp1",
>> +			      "dclk_vp2",
>> +			      "dclk_vp3",
>> +			      "pclk_vop";
>> +		resets = <&cru SRST_A_VOP>,
>> +			 <&cru SRST_H_VOP>,
>> +			 <&cru SRST_D_VOP0>,
>> +			 <&cru SRST_D_VOP1>,
>> +			 <&cru SRST_D_VOP2>,
>> +			 <&cru SRST_D_VOP3>;
>> +		reset-names = "axi",
>> +			      "ahb",
>> +			      "dclk_vp0",
>> +			      "dclk_vp1",
>> +			      "dclk_vp2",
>> +			      "dclk_vp3";
> 
> resets and reset-names do not seem to be part of the binding, so
> should probably be added there.

I will drop resets and reset-names in next version.
> 
> 
>> +		iommus = <&vop_mmu>;
>> +		power-domains = <&power RK3588_PD_VOP>;
>> +		rockchip,grf = <&sys_grf>;
>> +		rockchip,vop-grf = <&vop_grf>;
>> +		rockchip,vo1-grf = <&vo1_grf>;
>> +		rockchip,pmu = <&pmu>;
>> +
> 
> move this blank line _below_ the status=disabled please.

ok, will do.
> 
>> +		status = "disabled";
>> +		vop_out: ports {
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +
>> +			vp0: port@0 {
>> +				#address-cells = <1>;
>> +				#size-cells = <0>;
>> +				reg = <0>;
>> +			};
>> +
>> +			vp1: port@1 {
>> +				#address-cells = <1>;
>> +				#size-cells = <0>;
>> +				reg = <1>;
>> +			};
>> +
>> +			vp2: port@2 {
>> +				#address-cells = <1>;
>> +				#size-cells = <0>;
>> +				reg = <2>;
>> +			};
>> +
>> +			vp3: port@3 {
>> +				#address-cells = <1>;
>> +				#size-cells = <0>;
>> +				reg = <3>;
>> +			};
>> +		};
>> +	};
>> +
>> +	vop_mmu: iommu@fdd97e00 {
>> +		compatible = "rockchip,rk3588-iommu", "rockchip,rk3568-iommu";
>> +		reg = <0x0 0xfdd97e00 0x0 0x100>, <0x0 0xfdd97f00 0x0 0x100>;
>> +		interrupts = <GIC_SPI 156 IRQ_TYPE_LEVEL_HIGH 0>;
>> +		interrupt-names = "vop_mmu";
> 
> interrupt-names is not part of the mainline iommu binding, so should be dropped

will do.
> 
> 
> Thanks
> Heiko
> 
> 
