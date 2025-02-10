Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68890A2EB91
	for <lists+dri-devel@lfdr.de>; Mon, 10 Feb 2025 12:43:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 608A610E1A3;
	Mon, 10 Feb 2025 11:43:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="oJpamBIH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5480E10E1A3
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2025 11:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1739187810;
 bh=tycYPKLg38RvdhS16xCjIBsLq91Al6Z9Y/oCR8632u8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=oJpamBIHuqr2lATsB2etB4kCzp90Y+I5bwWiqGPCEEWBmKStjWRpJ+UjXYo5pb/78
 UcqmscYvy0CTTo526+PavoEmea5E5a5mhdPzxBQkKDnh4ZLaWVHipRTYXqPETTfk90
 aWAq3dmeNuQxn8as3m/h1eQcFF4yz/8ArwY4IGAhsXoaT29EGca39sSooGuPc2cB+f
 Uy2nTS9Jllxxm3tG3QaGkMbDcmjanyV8mX+aTpDP9tcsBQMd6bLWnrMxBi/jZtld8S
 CuFPSwlA5Nxtl2oYj9/l+czapoAY9TA4WLEgcRCT/S910IdnW6tmQEXlL60iRLpEcb
 n4Fchmar65ODA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 4023F17E0B59;
 Mon, 10 Feb 2025 12:43:29 +0100 (CET)
Message-ID: <dabbf4a7-1856-458a-b88d-2a16bc80bff0@collabora.com>
Date: Mon, 10 Feb 2025 12:43:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 25/34] drm/mediatek: mtk_hdmi: Remove ifdef for
 CONFIG_PM_SLEEP
To: =?UTF-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>
Cc: "robh@kernel.org" <robh@kernel.org>,
 "jie.qiu@mediatek.com" <jie.qiu@mediatek.com>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "simona@ffwll.ch" <simona@ffwll.ch>, "mripard@kernel.org"
 <mripard@kernel.org>, =?UTF-8?B?Sml0YW8gU2hpICjnn7PorrDmtpsp?=
 <jitao.shi@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "kernel@collabora.com" <kernel@collabora.com>,
 "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 =?UTF-8?B?TGV3aXMgTGlhbyAo5buW5p+P6YieKQ==?= <Lewis.Liao@mediatek.com>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 =?UTF-8?B?VG9tbXlZTCBDaGVuICjpmbPlvaXoia8p?= <TommyYL.Chen@mediatek.com>,
 =?UTF-8?B?SXZlcyBDaGVuamggKOmZs+S/iuW8mCk=?= <Ives.Chenjh@mediatek.com>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 =?UTF-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
 "junzhi.zhao@mediatek.com" <junzhi.zhao@mediatek.com>
References: <20250113145232.227674-1-angelogioacchino.delregno@collabora.com>
 <20250113145232.227674-26-angelogioacchino.delregno@collabora.com>
 <a9c0027b1d02365389624c5cb9b42b5bf39dac85.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <a9c0027b1d02365389624c5cb9b42b5bf39dac85.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

Il 07/02/25 07:10, CK Hu (胡俊光) ha scritto:
> Hi, Angelo:
> 
> On Mon, 2025-01-13 at 15:52 +0100, AngeloGioacchino Del Regno wrote:
>> External email : Please do not click links or open attachments until you have verified the sender or the content.
>>
>>
>> Since the SIMPLE_DEV_PM_OPS macro and the pm pointer are anyway
>> defined when CONFIG_PM_SLEEP is not set, remove the ifdef for it
>> and indicate that the mtk_hdmi_{remove,suspend} functions may be
>> unused (as they are, in case PM support is not built-in).
>>
>> While at it, to improve readability, also compress the
>> SIMPLE_DEV_PM_OPS declaration as it even fits in less
>> than 80 columns.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>   drivers/gpu/drm/mediatek/mtk_hdmi.c | 10 ++++------
>>   1 file changed, 4 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
>> index 0ec3bfe528f8..f6b463aaba47 100644
>> --- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
>> +++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
>> @@ -1692,8 +1692,7 @@ static void mtk_hdmi_remove(struct platform_device *pdev)
>>          mtk_hdmi_clk_disable_audio(hdmi);
>>   }
>>
>> -#ifdef CONFIG_PM_SLEEP
>> -static int mtk_hdmi_suspend(struct device *dev)
>> +static __maybe_unused int mtk_hdmi_suspend(struct device *dev)
> 
> I see many driver use CONFIG_PM_SLEEP,
> and SIMPLE_DEV_PM_OPS() is defined to support suspend/resume function is not exist when CONFIG_PM_SLEEP is not defined,
> so there is no strong purpose to apply this patch.
> 

This allows to improve the compile time coverage and at the same, this will not
increase the binary size of this driver, because the compiler (or, all of the
linkers associated to the compilers that can be used to build the kernel, anyway!)
will drop the two functions when CONFIG_PM_SLEEP is *not* defined.

Also:
  * This ifdef is redundant, as it's already handled by SIMPLE_DEV_PM_OPS
  * Removing ugly ifdeffery increases human readability while also slightly
    reducing the number of lines

Regards,
Angelo

> Regards,
> CK
> 
>>   {
>>          struct mtk_hdmi *hdmi = dev_get_drvdata(dev);
>>
>> @@ -1702,7 +1701,7 @@ static int mtk_hdmi_suspend(struct device *dev)
>>          return 0;
>>   }
>>
>> -static int mtk_hdmi_resume(struct device *dev)
>> +static __maybe_unused int mtk_hdmi_resume(struct device *dev)
>>   {
>>          struct mtk_hdmi *hdmi = dev_get_drvdata(dev);
>>          int ret = 0;
>> @@ -1715,9 +1714,8 @@ static int mtk_hdmi_resume(struct device *dev)
>>
>>          return 0;
>>   }
>> -#endif
>> -static SIMPLE_DEV_PM_OPS(mtk_hdmi_pm_ops,
>> -                        mtk_hdmi_suspend, mtk_hdmi_resume);
>> +
>> +static SIMPLE_DEV_PM_OPS(mtk_hdmi_pm_ops, mtk_hdmi_suspend, mtk_hdmi_resume);
>>
>>   static const struct mtk_hdmi_conf mtk_hdmi_conf_mt2701 = {
>>          .tz_disabled = true,
>> --
>> 2.47.0
>>
> 

