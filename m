Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1319AA08974
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jan 2025 08:58:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A9AD10EFFC;
	Fri, 10 Jan 2025 07:58:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.b="VWXK7s8d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m127223.xmail.ntesmail.com
 (mail-m127223.xmail.ntesmail.com [115.236.127.223])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE39210EFFC
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jan 2025 07:58:52 +0000 (UTC)
Received: from [172.16.12.67] (unknown [58.22.7.114])
 by smtp.qiye.163.com (Hmail) with ESMTP id 851e8425;
 Fri, 10 Jan 2025 15:58:45 +0800 (GMT+08:00)
Message-ID: <3460b2a3-9579-4a12-9eff-6e2f1a1cc91c@rock-chips.com>
Date: Fri, 10 Jan 2025 15:58:44 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/17] rockchip: Add rk3562 support
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: heiko@sntech.de, linux-rockchip@lists.infradead.org,
 Simon Xue <xxm@rock-chips.com>, Guenter Roeck <linux@roeck-us.net>,
 Mark Brown <broonie@kernel.org>, Chris Morgan <macromorgan@hotmail.com>,
 Frank Wang <frank.wang@rock-chips.com>, Jamie Iles <jamie@jamieiles.com>,
 Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org,
 Jonas Karlman <jonas@kwiboo.se>, Johan Jonker <jbx6244@gmail.com>,
 David Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 linux-i2c@vger.kernel.org, Shawn Lin <shawn.lin@rock-chips.com>,
 Simona Vetter <simona@ffwll.ch>, Elaine Zhang <zhangqing@rock-chips.com>,
 Conor Dooley <conor+dt@kernel.org>, Finley Xiao
 <finley.xiao@rock-chips.com>, Maxime Ripard <mripard@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
 FUKAUMI Naoki <naoki@radxa.com>, linux-pwm@vger.kernel.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Andy Yan <andyshrk@163.com>,
 linux-serial@vger.kernel.org, Michael Riesch
 <michael.riesch@wolfvision.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 devicetree@vger.kernel.org, Diederik de Haas <didi.debian@cknow.org>,
 linux-watchdog@vger.kernel.org, Rob Herring <robh@kernel.org>,
 Lee Jones <lee@kernel.org>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Shresth Prasad <shresthprasad7@gmail.com>, Tim Lunn <tim@feathertop.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org, Ulf Hansson <ulf.hansson@linaro.org>,
 Jisheng Zhang <jszhang@kernel.org>, Dragan Simic <dsimic@manjaro.org>,
 Detlev Casanova <detlev.casanova@collabora.com>, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-usb@vger.kernel.org,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
References: <20241224094920.3821861-1-kever.yang@rock-chips.com>
 <sasnc2ocxnlfp4kprsobu5gkajjb5wdxhld73bg6xocgb3foah@yjmphtvpmyff>
Content-Language: en-US
From: Kever Yang <kever.yang@rock-chips.com>
In-Reply-To: <sasnc2ocxnlfp4kprsobu5gkajjb5wdxhld73bg6xocgb3foah@yjmphtvpmyff>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGh4dTlYZGR1MSR1MTk5JGkJWFRQJFh
 oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSUhCS0
 NVSktLVUpCWQY+
X-HM-Tid: 0a944f3909e403afkunm851e8425
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6OTY6FBw4LDIQPQ8VMiJKC0lO
 K0kaCUlVSlVKTEhNT0JOQklCSkNLVTMWGhIXVRAeDR4JVQIaFRw7CRQYEFYYExILCFUYFBZFWVdZ
 EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFJQktCNwY+
DKIM-Signature: a=rsa-sha256;
 b=VWXK7s8da0RDYOHxSWhWmVquzr9JT8B4nkrF/smFefecdntF1wQ00XwWP/W6zJg+9nzjib8DolV9vW+B7e4x9e94nqGrRa3NUYOfsb8LiB93JM1o4goCzIFl5gMoV51sQZuv+O5c3/QadXRtYtLINbjhyZzW/2jq4/AD/N9qfGU=;
 s=default; c=relaxed/relaxed; d=rock-chips.com; v=1; 
 bh=jhJHF5kfM0cVe+RkIB8dEyszOtU3eaBDxOU11VNcLG4=;
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

     Thanks very much for your review.

On 2024/12/27 15:38, Krzysztof Kozlowski wrote:
> On Tue, Dec 24, 2024 at 05:49:03PM +0800, Kever Yang wrote:
>> This patch set adds rk3562 SoC and its evb support.
>>
>> Split out patches belong to different subsystem.
>>
>> Test with GMAC, USB, PCIe, EMMC, SD Card.
>>
>> This patch set is base on the patche set for rk3576 evb1 support.
>>
>> Changes in v2:
>> - Update in sort order
>> - remove grf in cru
>> - Update some properties order
>>
>> Finley Xiao (2):
>>    arm64: dts: rockchip: add core dtsi for RK3562 Soc
>>    arm64: dts: rockchip: Add RK3562 evb2 devicetree
>>
>> Kever Yang (15):
>>    dt-bindings: PCI: dwc: rockchip: Add rk3562 support
>>    dt-bindings: mmc: Add support for rk3562 eMMC
>>    dt-bindings: mmc: rockchip-dw-mshc: Add rk3562 compatible string
>>    dt-bindings: power: rockchip: Add bindings for rk3562
>>    dt-bindings: i2c: i2c-rk3x: Add rk3562 compatible
>>    dt-bindings: gpu: Add rockchip,rk3562-mali compatible
>>    dt-bindings: watchdog: Add rk3562 compatible
>>    dt-bindings: spi: Add rockchip,rk3562-spi compatible
>>    dt-bindings: serial: snps-dw-apb-uart: Add support for rk3562
>>    dt-bindings: usb: dwc3: add compatible for rk3562
>>    dt-bindings: pwm: rockchip: Add rockchip,rk3562-pwm
>>    dt-bindings: rockchip: pmu: Add rk3562 compatible
>>    dt-bindings: soc: rockchip: Add rk3562 syscon compatibles
>>    dt-bindings: arm: rockchip: Add rk3562 evb2 board
>>    dt-bindings: mfd: syscon: Add rk3562 QoS register compatible
> You squezzed here like 12 different subsystems. Some of these changes
> suggest missing drivers.
I have split out all the patches with driver change as separate patch set.
All the other dt-binding patches in this patchset is re-use the driver 
without any change,
but only add a new "rockchip, rk3562-" based compatible entry, and also 
no more info
need to explain in the commit message which I usually copy from commit 
msg already in tree
and change the soc to rk3562.
I think this patch set will be clear enough for the new soc/board 
support. So do you mean
I have to send the 1st~15th of this patchset one by one separately so 
that they can reach
to different subsystems? I believe there is no much useful change for 
the cc list is provide
by the tool automatically and the commit msg can update as Uwe's 
suggestion:

	The PWM core on Rockchip's RK3562 is the same as the one already
	included in RK3328. Extend the binding accordingly to allow

		compatible = "rockchip,rk3562-pwm", "rockchip,rk3328-pwm";

Thanks,
- Kever


>
> Please read basic upstreaming guide, some previous discussions and get
> internal rock-chips help so we want repeat basics over and over.
>
> Bindings are with drivers. Send them to respective subsystems.
>
> Best regards,
> Krzysztof
>
>
