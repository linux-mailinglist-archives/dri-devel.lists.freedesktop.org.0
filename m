Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8043B156F5
	for <lists+dri-devel@lfdr.de>; Wed, 30 Jul 2025 03:27:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8FC310E0E4;
	Wed, 30 Jul 2025 01:27:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=airkyi.com header.i=@airkyi.com header.b="L26pIwG4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bg5.exmail.qq.com (bg5.exmail.qq.com [43.154.209.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC8A810E0E4
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jul 2025 01:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
 s=altu2504; t=1753838823;
 bh=sh9+1hvv6UwRMngtc5TSXRZC1oxTpQsSSmadqfMNyiA=;
 h=Message-ID:Date:MIME-Version:Subject:To:From;
 b=L26pIwG47655UfL7hvcGbxBpv3OA4fWQOCkQ4PA8yrDL/3pnzXlQCPouSJs3mKw5z
 Tlz+FmOm7e9b8ZgJpHSdSs50r6JIhT9hVUIsN+1bEoc1afuILNFpqyqRVLCIjGifd0
 TWw9/M00Noexxh/K71u1mYkimA6DmmoTBXYLm6Xg=
X-QQ-mid: esmtpsz20t1753838814t9a57cd4b
X-QQ-Originating-IP: TJCihVAB9aallGYP7dENX5Iebrj2pvT0M2uwEcEmSfA=
Received: from [172.16.12.153] ( [58.22.7.114])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Wed, 30 Jul 2025 09:26:52 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 17714488166574995387
Message-ID: <C0B5444C2EE8051C+3877b039-f814-4f79-a9b0-44096226ce73@airkyi.com>
Date: Wed, 30 Jul 2025 09:26:51 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/5] arm64: dts: rockchip: Add missing dp_out port for
 RK3399 CDN-DP
To: Diederik de Haas <didi.debian@cknow.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
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
 Chaoyi Chen <chaoyi.chen@rock-chips.com>, Dragan Simic <dsimic@manjaro.org>,
 Johan Jonker <jbx6244@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Peter Robinson <pbrobinson@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org
References: <20250729090032.97-1-kernel@airkyi.com>
 <20250729090032.97-5-kernel@airkyi.com> <DBOSZZ7TMD2P.U0MGKUR3DXN@cknow.org>
From: Chaoyi Chen <kernel@airkyi.com>
In-Reply-To: <DBOSZZ7TMD2P.U0MGKUR3DXN@cknow.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:airkyi.com:qybglogicsvrsz:qybglogicsvrsz4a-0
X-QQ-XMAILINFO: MjA5tsjrlPcvfX57mZ+y5mvYlm08jiJwh3td6pGsoT8JuVxJNedovtcf
 FMarMhsIIoqbT0B46W+TPOI5UnI6gAoLrWO/+ymmdEH6TRBpF5iEa88kFt/9ihlSAEbfHSB
 vSCT59DpAbDRiMSCOkvpLMT6b2MsfcDCln9sK/4bUSIvseAiIgtXAwiBCIKvt5TLU4Z/OO5
 PeT1flrdF5+GOHnpacErZ47wUV0XoaRcsBxsLn74ldrPZcM7js0LmJpyLaNXWTegHagpec/
 3G1Sv96pmquyaVC+srELO+OegzsSMETCqGnIu/uiofcWWAqeBLdJf27cbacqHCkmPrQaJW6
 gb7pL1hPO4c6FavmzkXsGUvx9c3vvqbey3vPU2o8OadCOjSHvvgzm58buaN+awnOiGNc3Zu
 lVh5XeD1o/t30spIfRrKPeplIyYYELrQFKKiWciaqf6d7OvcOaAqXtchhSx2oITcG5HlIs/
 duHQ/u33KAFAqO0EcBiMsLSoxiPzeILICIEPxZvcfsnMBDEBCQXtMK2tKridh05xsbYxaSz
 ngUz3GCjsfp9Beea7AKJkK3BMtpUzHKJ562WAAyxhxzbXq+HcJ+INSQCNXUvicOrsCFVDLg
 SkEZVXVkuJQcNqtiRew4DzIndzc0Rg2an6VNgg/GLVOOC2YtlLyNa+B1I174cKeVy/Q8HaH
 pCu0XgL547tSOmZvgSpJg0Cc4/UQMaQXiVtqM7BSiWrDxckW8DsNkYtcvmdJDh1HX0VrV3S
 SrknYkMWKWsvyZBodDwMRcESduBoREcjoAiSk06XBw6lR/ThoR1fLiqhMYdOps9agZ/GcUB
 JKXoRY+3f2/CqhSnaQvYpklUw2V+il8pWi8NZUmApxnCIulCjHRcCnPMU2wHwHsCIvdOPYZ
 x+4lCCcmpMbbMvWuum0uGJ3+HHPEwZU0hcBiTZ9UrtOupGDg0hUv5iU1v1U1A2EmNW/skan
 v7cbYuzlTTnWl693BotJFrqy6aWRAe5EyY8g1kvgsMS6d2g==
X-QQ-XMRINFO: MSVp+SPm3vtS1Vd6Y4Mggwc=
X-QQ-RECHKSPAM: 0
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

On 7/30/2025 3:59 AM, Diederik de Haas wrote:

> On Tue Jul 29, 2025 at 11:00 AM CEST, Chaoyi Chen wrote:
>> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
>>
>> Let's make the ports nodes of cdn_dp in the same style as the other
>> display interface, and match the style of ports's yaml.
>>
>> Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
>> ---
>>   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi | 12 +++++++++++-
>>   1 file changed, 11 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/rockchip/rk3399-base.dtsi b/arch/arm64/boot/dts/rockchip/rk3399-base.dtsi
>> index 9d5f5b083e3c..edeb177bc433 100644
>> --- a/arch/arm64/boot/dts/rockchip/rk3399-base.dtsi
>> +++ b/arch/arm64/boot/dts/rockchip/rk3399-base.dtsi
>> @@ -618,7 +618,11 @@ cdn_dp: dp@fec00000 {
>>   		status = "disabled";
>>   
>>   		ports {
>> -			dp_in: port {
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +
>> +			dp_in: port@0 {
>> +				reg = <0>;
>>   				#address-cells = <1>;
>>   				#size-cells = <0>;
>>   
>> @@ -632,6 +636,12 @@ dp_in_vopl: endpoint@1 {
>>   					remote-endpoint = <&vopl_out_dp>;
>>   				};
>>   			};
>> +
>> +			dp_out: port@1 {
>> +				reg = <1>;
>> +				#address-cells = <1>;
>> +				#size-cells = <0>;
>> +			};
> Patch 5 adds a single endpoint to dp_out (without a reg property), so it
> seems that #address/#size-cells is not needed?
> If you run ``make CHECK_DTBS=y W=1 rockchip/rk3399-evb-ind.dtb`` it
> should spit out a warning about that.
Exactly! Will remove this in v4.
>
> Cheers,
>    Diederik
>
>>   		};
>>   	};
>>   
