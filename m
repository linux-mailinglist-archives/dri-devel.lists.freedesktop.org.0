Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02EBB9F71D2
	for <lists+dri-devel@lfdr.de>; Thu, 19 Dec 2024 02:35:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D15C610E1E0;
	Thu, 19 Dec 2024 01:35:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.b="XhyWv9FB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m49225.qiye.163.com (mail-m49225.qiye.163.com
 [45.254.49.225])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A109310E1E0
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2024 01:35:16 +0000 (UTC)
Received: from [172.16.12.26] (unknown [58.22.7.114])
 by smtp.qiye.163.com (Hmail) with ESMTP id 6277199f;
 Thu, 19 Dec 2024 09:35:12 +0800 (GMT+08:00)
Message-ID: <7fa672bb-7263-468b-ad7d-f1585459dc67@rock-chips.com>
Date: Thu, 19 Dec 2024 09:35:12 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/11] phy: phy-rockchip-samsung-hdptx: Add support for
 eDP mode
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 rfoss@kernel.org, vkoul@kernel.org, sebastian.reichel@collabora.com,
 cristian.ciocaltea@collabora.com, l.stach@pengutronix.de,
 andy.yan@rock-chips.com, hjc@rock-chips.com, algea.cao@rock-chips.com,
 kever.yang@rock-chips.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org
References: <20241216031225.3746-1-damon.ding@rock-chips.com>
 <20241216031225.3746-5-damon.ding@rock-chips.com>
 <867267676.0ifERbkFSE@diego>
Content-Language: en-US
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <867267676.0ifERbkFSE@diego>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGkMZH1ZMSUpOGkNMT0gZTENWFRQJFh
 oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSUhCSE
 NVSktLVUpCS0tZBg++
X-HM-Tid: 0a93dc8dfa8a03a3kunm6277199f
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6MDI6DAw5PDIJEBc2GhccPS45
 DAkaCxxVSlVKTEhPTkxJSkpPSkpOVTMWGhIXVR8aFhQVVR8SFRw7CRQYEFYYExILCFUYFBZFWVdZ
 EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFKSENINwY+
DKIM-Signature: a=rsa-sha256;
 b=XhyWv9FByJopn3syCU++lxNWmISu60bEdehFbK8P7AGggwYo/a1h0s5S04Av3Zl1vVlfWXvSlNoMA0oNgGTx/sLizcbW9E6W/wCWrhIWOdbdVtnI8XBJaPUxahn0qXYxWxQXK6HnXmwTCVGXVtiEMPOh3/JdZ3vFkdE3C9G0O/k=;
 c=relaxed/relaxed; s=default; d=rock-chips.com; v=1; 
 bh=JfU0BRy6UxjKGOBHhFm9jV2l7Tlz/ThMRo8XbQs5bSE=;
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

Hi Heiko,

On 2024/12/18 20:35, Heiko Stübner wrote:
> Hi Damon,
> 
> Am Montag, 16. Dezember 2024, 04:12:18 CET schrieb Damon Ding:
>> Add basic support for RBR/HBR/HBR2 link rates, and the voltage swing and
>> pre-emphasis configurations of each link rate have been verified according
>> to the eDP 1.3 requirements.
>>
>> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
>>
>> ---
>>
>> Changes in v2:
>> - Add the module author
>> ---
> 
>> @@ -255,6 +364,19 @@ struct ropll_config {
>>   	u8 cd_tx_ser_rate_sel;
>>   };
>>   
>> +struct tx_drv_ctrl {
>> +	u8 tx_drv_lvl_ctrl;
>> +	u8 tx_drv_post_lvl_ctrl;
>> +	u8 ana_tx_drv_idrv_idn_ctrl;
>> +	u8 ana_tx_drv_idrv_iup_ctrl;
>> +	u8 ana_tx_drv_accdrv_en;
>> +	u8 ana_tx_drv_accdrv_ctrl;
>> +	u8 tx_drv_pre_lvl_ctrl;
>> +	u8 ana_tx_jeq_en;
>> +	u8 tx_jeq_even_ctrl;
>> +	u8 tx_jeq_odd_ctrl;
>> +};
>> +
>>   enum rk_hdptx_reset {
>>   	RST_PHY = 0,
>>   	RST_APB,
> 
> not a full review (yet), but this part conflicts with
> commit f2dbca169790 ("phy: phy-rockchip-samsung-hdptx: Don't request RST_PHY/RST_ROPLL/RST_LCPLL")
> 
> [0] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=f2dbca169790ea1e436ffdd9ef37d7c3a4401c46
> 
> 
> 
> 
I will update to the latest Kernel branch and fix this conflict in the 
next version.

Best regards,
Damon
