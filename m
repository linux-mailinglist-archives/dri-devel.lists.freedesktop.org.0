Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80B21A1C08A
	for <lists+dri-devel@lfdr.de>; Sat, 25 Jan 2025 03:59:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14C5710E07A;
	Sat, 25 Jan 2025 02:59:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.b="NAllTc4I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m49246.qiye.163.com (mail-m49246.qiye.163.com
 [45.254.49.246])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3943910E07A
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Jan 2025 02:59:13 +0000 (UTC)
Received: from [172.16.12.26] (unknown [58.22.7.114])
 by smtp.qiye.163.com (Hmail) with ESMTP id 9a3da8cf;
 Sat, 25 Jan 2025 10:59:09 +0800 (GMT+08:00)
Message-ID: <860384d5-cc7d-485b-be1b-1bbfe27535f8@rock-chips.com>
Date: Sat, 25 Jan 2025 10:59:08 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 12/14] drm/edp-panel: Add LG Display panel model
 LP079QX1-SP0V
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Douglas Anderson <dianders@chromium.org>
Cc: heiko@sntech.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, rfoss@kernel.org, vkoul@kernel.org,
 sebastian.reichel@collabora.com, cristian.ciocaltea@collabora.com,
 l.stach@pengutronix.de, andy.yan@rock-chips.com, hjc@rock-chips.com,
 algea.cao@rock-chips.com, kever.yang@rock-chips.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
References: <20250123100747.1841357-1-damon.ding@rock-chips.com>
 <20250123100747.1841357-13-damon.ding@rock-chips.com>
 <rwn3g7tqgjnc525cjqtivgfgedhooiayn5nujng7bdzazgqhle@wfpuvoyr2tii>
Content-Language: en-US
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <rwn3g7tqgjnc525cjqtivgfgedhooiayn5nujng7bdzazgqhle@wfpuvoyr2tii>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGRgZQ1ZJTBpDQ0IdTB4dGE9WFRQJFh
 oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
 hVSktLVUpCS0tZBg++
X-HM-Tid: 0a949b6620f703a3kunm9a3da8cf
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Ojo6Fhw5NTIVDhkPAxQ2DSkc
 VkowCjdVSlVKTEhMTExIQk5LTENPVTMWGhIXVR8aFhQVVR8SFRw7CRQYEFYYExILCFUYFBZFWVdZ
 EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFJSU5ONwY+
DKIM-Signature: a=rsa-sha256;
 b=NAllTc4IrhdZemINSJnIARwR6+qpPHvdRgMGW5ODEWzhYxQ20JdxOfBlhUUCuQglebhICW5Rj3EWmhHZUkQMqLJGvaVqgoQfSC/y5/dTF7hgEC1IVPDf8jPLXQc9g98Zo1W7BdjBtqnFn+pKHK9J88P4xkEbjuNHaPFAk5w/HnE=;
 s=default; c=relaxed/relaxed; d=rock-chips.com; v=1; 
 bh=PJ4vEGRebVfmD62DO8JbYjz0HrXPBA+KlX27omCmNMw=;
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

Hi Dmitry,

On 2025/1/23 19:31, Dmitry Baryshkov wrote:
> On Thu, Jan 23, 2025 at 06:07:45PM +0800, Damon Ding wrote:
>> The raw edid for LP079QX1-SP0V panel model is:
>>
>> 00 ff ff ff ff ff ff 00 16 83 00 00 00 00 00 00
>> 04 17 01 00 a5 10 0c 78 06 ef 05 a3 54 4c 99 26
>> 0f 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
>> 01 01 01 01 01 01 ea 4e 00 4c 60 00 14 80 0c 10
>> 84 00 78 a0 00 00 00 18 00 00 00 10 00 00 00 00
>> 00 00 00 00 00 00 00 00 00 00 00 00 00 fe 00 4c
>> 50 30 37 39 51 58 31 2d 53 50 30 56 00 00 00 fc
>> 00 43 6f 6c 6f 72 20 4c 43 44 0a 20 20 20 00 3f
>>
>> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
>> ---
>>   drivers/gpu/drm/panel/panel-edp.c | 8 ++++++++
>>   1 file changed, 8 insertions(+)
> 
> Please use get_maintainers.pl when compiling To/Cc lists. Added Douglas
> to CC manually.
> 
> Or, better, split irrelevant patches to separate series.
> 

I will split the panel related patch into a separate series in the next 
version.

>>
>> diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
>> index f8511fe5fb0d..77e3fd3ed160 100644
>> --- a/drivers/gpu/drm/panel/panel-edp.c
>> +++ b/drivers/gpu/drm/panel/panel-edp.c
>> @@ -1808,6 +1808,12 @@ static const struct panel_delay delay_200_150_e50 = {
>>   	.enable = 50,
>>   };
>>   
>> +static const struct panel_delay delay_50_500_e200 = {
>> +	.hpd_absent = 50,
>> +	.unprepare = 500,
>> +	.enable = 200,
>> +};
>> +
>>   #define EDP_PANEL_ENTRY(vend_chr_0, vend_chr_1, vend_chr_2, product_id, _delay, _name) \
>>   { \
>>   	.ident = { \
>> @@ -1955,6 +1961,8 @@ static const struct edp_panel_entry edp_panels[] = {
>>   	EDP_PANEL_ENTRY('C', 'S', 'W', 0x1100, &delay_200_500_e80_d50, "MNB601LS1-1"),
>>   	EDP_PANEL_ENTRY('C', 'S', 'W', 0x1104, &delay_200_500_e50, "MNB601LS1-4"),
>>   
>> +	EDP_PANEL_ENTRY('E', 'T', 'C', 0x0000, &delay_50_500_e200, "LP079QX1-SP0V"),
>> +
>>   	EDP_PANEL_ENTRY('H', 'K', 'C', 0x2d51, &delay_200_500_e200, "Unknown"),
>>   	EDP_PANEL_ENTRY('H', 'K', 'C', 0x2d5b, &delay_200_500_e200, "MB116AN01"),
>>   	EDP_PANEL_ENTRY('H', 'K', 'C', 0x2d5c, &delay_200_500_e200, "MB116AN01-2"),
>> -- 
>> 2.34.1
>>
> 

Best regards,
Damon

