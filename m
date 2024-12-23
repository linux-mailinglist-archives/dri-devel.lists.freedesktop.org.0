Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B21B9FADAA
	for <lists+dri-devel@lfdr.de>; Mon, 23 Dec 2024 12:27:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1312110E516;
	Mon, 23 Dec 2024 11:27:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="M9qvnOV9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [IPv6:2a01:4f8:201:9162::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 547BE10E516
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Dec 2024 11:27:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1734953245;
 bh=iT8rP9qGXx/56h5Esz0UpqUy+cj0ktj8OxMn+u16KYA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=M9qvnOV9hOQF6VVJlCDo058mU472XkLN5yGMwRs/juFTgEwtqIGz8ZZQQISQygSjb
 mwO0yDmvBdwF3O0llrHY9t3z0iUqxUcRcmHipJPEf/b1gu/h6l08ppkMzj1tJiToHC
 HymUXL35r5Tz3nypDM0uZXupv+o+wgghRspAJGpSQYvI58srGBxOXdbBrz+GLAlw8a
 Y6jghHEnbHDIxaShbhohMbsfMrxB2kgA/aayLHraP0pI3/+cTNkcihy7c7bqhnRMLL
 I3LjNBGVdoeQLApQFYtQmOyopS82PsSj5PtAEy8oY32j04enrA18edN+KIVeQ20n9z
 E2sB/IZamKKbQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id B392D17E12AC;
 Mon, 23 Dec 2024 12:27:24 +0100 (CET)
Message-ID: <c3ebdefc-0a02-4f89-8469-8584529230a8@collabora.com>
Date: Mon, 23 Dec 2024 12:27:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 24/33] drm/mediatek: mtk_hdmi: Remove ifdef for
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
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "junzhi.zhao@mediatek.com" <junzhi.zhao@mediatek.com>
References: <20241217154345.276919-1-angelogioacchino.delregno@collabora.com>
 <20241217154345.276919-25-angelogioacchino.delregno@collabora.com>
 <498667e57b24c754d87742854bfbedfc821931cf.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <498667e57b24c754d87742854bfbedfc821931cf.camel@mediatek.com>
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

Il 23/12/24 07:35, CK Hu (胡俊光) ha scritto:
> Hi, Angelo:
> 
> On Tue, 2024-12-17 at 16:43 +0100, AngeloGioacchino Del Regno wrote:
>> External email : Please do not click links or open attachments until you have verified the sender or the content.
>>
>>
>> Since the SIMPLE_DEV_PM_OPS macro and the pm pointer are anyway
>> defined when CONFIG_PM_SLEEP is not set, remove the ifdef for it
>> and indicate that the mtk_hdmi_{remove,suspend} functions may be
>> unused (as they are, in case PM support is not built-in).
> 
> I see many driver use CONFIG_PM_SLEEP,
> and SIMPLE_DEV_PM_OPS() is defined to support suspend/resume function is not exist when CONFIG_PM_SLEEP is not defined,
> so there is no strong purpose to apply this patch.
> 
>>
>> While at it, to improve readability, also compress the
>> SIMPLE_DEV_PM_OPS declaration as it even fits in less
>> than 80 columns.
> 
> You have many typesetting in some patches.
> But I think typesetting is not related to the main purpose of that patch.
> I would like you to gather these typesetting modification to a readability patch.
> 

It's a cleanup per-se, and I think that pushing a commit for one line would be
cluttering the commit history way too much... and it's the same for the other
drivers anyway.

Also, backporting (if needed) is easier when those very small changes are in
tandem with the actual bigger change.

Cheers,
Angelo

> Regards,
> CK
> 
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>   drivers/gpu/drm/mediatek/mtk_hdmi.c | 10 ++++------
>>   1 file changed, 4 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
>> index 5d46d486c68f..7e4536391cfb 100644
>> --- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
>> +++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
>> @@ -1694,8 +1694,7 @@ static void mtk_hdmi_remove(struct platform_device *pdev)
>>          mtk_hdmi_clk_disable_audio(hdmi);
>>   }
>>
>> -#ifdef CONFIG_PM_SLEEP
>> -static int mtk_hdmi_suspend(struct device *dev)
>> +static __maybe_unused int mtk_hdmi_suspend(struct device *dev)
>>   {
>>          struct mtk_hdmi *hdmi = dev_get_drvdata(dev);
>>
>> @@ -1704,7 +1703,7 @@ static int mtk_hdmi_suspend(struct device *dev)
>>          return 0;
>>   }
>>
>> -static int mtk_hdmi_resume(struct device *dev)
>> +static __maybe_unused int mtk_hdmi_resume(struct device *dev)
>>   {
>>          struct mtk_hdmi *hdmi = dev_get_drvdata(dev);
>>          int ret = 0;
>> @@ -1717,9 +1716,8 @@ static int mtk_hdmi_resume(struct device *dev)
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

