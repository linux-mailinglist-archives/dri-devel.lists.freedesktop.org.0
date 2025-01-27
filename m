Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E1DBA1D58E
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jan 2025 12:43:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 303A710E2F9;
	Mon, 27 Jan 2025 11:42:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="q1mF9B1t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53A8B10E2F9
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jan 2025 11:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1737978175;
 bh=9G+YS0b0P5Svr4O3FxFoYaA6+V4p7P1jy6ZHHTJzxyQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=q1mF9B1tMDcxxpj6CFhhTI01tKbwKJW9YDaeOTB78/kcGg7nKWCmLiFZl8VIyg3MK
 DI4Hea4qNMPVjinNITHaJ6Y3xOB380/UsLLAsmDKUfXZRXJHjU+o53nNYidiMEVDhd
 FSFLWdq919a8YLa53DLjZof65aT9O+WTjWvGKtKq8qFIuKh4ytxZDPK9RUcrd79yCO
 Vcd0rv3uxkwvjGOGIuHR3eVaFE4Hlfy+dVP2G/1c/BCFMunQJe/6HFD9jMx8aO3JJZ
 rprkYKvhb3cWQNrl24QxM/pZQLYjNhW0iRklJ2CGQsm2CyXjt1QTiaBXlmheCJvzCv
 8hh79BpCEhTIA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id AA98B17E0FC7;
 Mon, 27 Jan 2025 12:42:53 +0100 (CET)
Message-ID: <cf030cb3-81c1-4ff8-9ad6-c82f743241da@collabora.com>
Date: Mon, 27 Jan 2025 12:42:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 20/34] drm/mediatek: mtk_hdmi: Use dev_err_probe() in
 mtk_hdmi_dt_parse_pdata()
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
 <20250113145232.227674-21-angelogioacchino.delregno@collabora.com>
 <cbbdc53ea47f0e7ea02fc7d197664819958ea2cd.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <cbbdc53ea47f0e7ea02fc7d197664819958ea2cd.camel@mediatek.com>
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

Il 24/01/25 09:24, CK Hu (胡俊光) ha scritto:
> Hi, Angelo:
> 
> On Mon, 2025-01-13 at 15:52 +0100, AngeloGioacchino Del Regno wrote:
>> External email : Please do not click links or open attachments until you have verified the sender or the content.
>>
>>
>> Change error prints to use dev_err_probe() instead of dev_err()
>> where possible in function mtk_hdmi_dt_parse_pdata(), used only
>> during device probe.
>> While at it, also beautify some prints.
> 
> I think you have do two things.
> The first one is "Use dev_err_probe() in mtk_hdmi_dt_parse_pdata()" as the title says.
> The second one is "beautify some prints".
> 
> The title does not mention the second one, so I think the second one is not related to this patch.

The beautification is a consequence of changing to dev_err_probe() - and this is
because dev_err_probe auto-formats the error code into the print, so all of the
": %d" was removed *because* of the migration to that.

The only string that had changes that are not consequence of that is
"Failed to find ddc-i2c-bus node in %pOF -> No ddc-i2c-bus in connector"

Besides, 99.99% of the change here is using dev_err_probe() instead of dev_err(),
I'm not sure that mentioning that one string out of five changed in the commit
description is actually worth it.

I've mentioned that in the commit description though, and looks enough to me, so
I'm not sure why you think that the one string change should go to the title.
That is also because ddc-i2c-bus can only be defined in one node, so the print
was actually stating the obvious.

> You think some refinement is not worth to be a patch.

Correct, and that's because it's one single string out of five.
One commit to change one string simply clutters the log without bringing any
commit readability benefits at all.

> If it's not worth, maybe we should keep them as they are.
> Or you could collect all refinement into one refinement patch, and this would looks worth.

That's what I've done in one of the previous versions.

You rightfully wanted me to split (and yeah I agree it's better), so that's the
split patches. I really don't think that splitting more is any beneficial, as
much as I don't think that reverting back to the non-split version is.

That ... unless I've misunderstood what you're saying here? :-)

Cheers,
Angelo

> 
> Regards,
> CK
> 
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>   drivers/gpu/drm/mediatek/mtk_hdmi.c | 34 ++++++++++-------------------
>>   1 file changed, 11 insertions(+), 23 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
>> index 65e9629b6b77..48c37294dcbb 100644
>> --- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
>> +++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
>> @@ -1372,30 +1372,23 @@ static int mtk_hdmi_dt_parse_pdata(struct mtk_hdmi *hdmi,
>>   {
>>          struct device *dev = &pdev->dev;
>>          struct device_node *np = dev->of_node;
>> -       struct device_node *cec_np, *remote, *i2c_np;
>> +       struct device_node *remote, *i2c_np;
>>          struct platform_device *cec_pdev;
>>          struct regmap *regmap;
>>          int ret;
>>
>>          ret = mtk_hdmi_get_all_clk(hdmi, np);
>> -       if (ret) {
>> -               if (ret != -EPROBE_DEFER)
>> -                       dev_err(dev, "Failed to get clocks: %d\n", ret);
>> -
>> -               return ret;
>> -       }
>> +       if (ret)
>> +               return dev_err_probe(dev, ret, "Failed to get clocks\n");
>>
>>          /* The CEC module handles HDMI hotplug detection */
>>          cec_np = of_get_compatible_child(np->parent, "mediatek,mt8173-cec");
>> -       if (!cec_np) {
>> -               dev_err(dev, "Failed to find CEC node\n");
>> -               return -EINVAL;
>> -       }
>> +       if (!cec_np)
>> +               return dev_err_probe(dev, -EINVAL, "Failed to find CEC node\n");
>>
>>          cec_pdev = of_find_device_by_node(cec_np);
>>          if (!cec_pdev) {
>> -               dev_err(hdmi->dev, "Waiting for CEC device %pOF\n",
>> -                       cec_np);
>> +               dev_err(hdmi->dev, "Waiting for CEC device %pOF\n", cec_np);
>>                  of_node_put(cec_np);
>>                  return -EPROBE_DEFER;
>>          }
>> @@ -1413,9 +1406,8 @@ static int mtk_hdmi_dt_parse_pdata(struct mtk_hdmi *hdmi,
>>          if (IS_ERR(regmap))
>>                  ret = PTR_ERR(regmap);
>>          if (ret) {
>> -               dev_err(dev,
>> -                       "Failed to get system configuration registers: %d\n",
>> -                       ret);
>> +               dev_err_probe(dev, ret,
>> +                             "Failed to get system configuration registers\n");
>>                  goto put_device;
>>          }
>>          hdmi->sys_regmap = regmap;
>> @@ -1443,20 +1435,16 @@ static int mtk_hdmi_dt_parse_pdata(struct mtk_hdmi *hdmi,
>>          }
>>
>>          i2c_np = of_parse_phandle(remote, "ddc-i2c-bus", 0);
>> +       of_node_put(remote);
>>          if (!i2c_np) {
>> -               dev_err(dev, "Failed to find ddc-i2c-bus node in %pOF\n",
>> -                       remote);
>> -               of_node_put(remote);
>> -               ret = -EINVAL;
>> +               ret = dev_err_probe(dev, -EINVAL, "No ddc-i2c-bus in connector\n");
>>                  goto put_device;
>>          }
>> -       of_node_put(remote);
>>
>>          hdmi->ddc_adpt = of_find_i2c_adapter_by_node(i2c_np);
>>          of_node_put(i2c_np);
>>          if (!hdmi->ddc_adpt) {
>> -               dev_err(dev, "Failed to get ddc i2c adapter by node\n");
>> -               ret = -EINVAL;
>> +               ret = dev_err_probe(dev, -EINVAL, "Failed to get ddc i2c adapter by node\n");
>>                  goto put_device;
>>          }
>>
>> --
>> 2.47.0
>>
> 


-- 
AngeloGioacchino Del Regno
Senior Software Engineer

Collabora Ltd.
Platinum Building, St John's Innovation Park, Cambridge CB4 0DS, UK
Registered in England & Wales, no. 5513718
