Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3B859E3D0C
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2024 15:44:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA29210E1C0;
	Wed,  4 Dec 2024 14:44:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="aN2bDnH5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49E6110E1C0
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Dec 2024 14:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1733323490;
 bh=NZbhLNGj94fIzTT5df4O2rJPrluFBHWpQhHhEfIxwhg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=aN2bDnH5vbcXNAqGycKY+bKNa4aoLURt8zZOMxLXlUZHDOGsNfz/oX0Mrm3hiWQZZ
 /8lhBZZ5kx1Oh7A0ZDAUcBMqR0I0pKrSx4umMXINYcxUqst2R4kXaYg5BsP7goIO0Q
 UK6s2IF3K6ZUcCHvR69f2or38sT+hitX22uBb+rTccxiqxRAxgiiUzHuPVzNx7d/73
 TW2RtJ7lTmupGQdl9cLsk3QOEBWH2JhpyBK8SBpfDBTn+/OCOxVvkgSImThXZQMXii
 cLogFTiURiF1imUVd/0v+bZAMC1NEVd/rPPoS30E9xfhW+29jgC83iECMhzAzJfTuK
 9F5d33mEqMS1A==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id A5C2217E376C;
 Wed,  4 Dec 2024 15:44:49 +0100 (CET)
Message-ID: <716b8630-66ef-4497-8cba-d5d20da2382a@collabora.com>
Date: Wed, 4 Dec 2024 15:44:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 7/7] drm/mediatek: Introduce HDMI/DDC v2 for
 MT8195/MT8188
To: =?UTF-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>
Cc: "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "simona@ffwll.ch" <simona@ffwll.ch>, "mripard@kernel.org"
 <mripard@kernel.org>, "kernel@collabora.com" <kernel@collabora.com>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "robh@kernel.org" <robh@kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>
References: <20241120124512.134278-1-angelogioacchino.delregno@collabora.com>
 <20241120124512.134278-8-angelogioacchino.delregno@collabora.com>
 <559ac08df6614e47c3e8d9d8160b35c9e683c503.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <559ac08df6614e47c3e8d9d8160b35c9e683c503.camel@mediatek.com>
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

Il 02/12/24 08:27, CK Hu (胡俊光) ha scritto:
> Hi, Angelo:
> 
> On Wed, 2024-11-20 at 13:45 +0100, AngeloGioacchino Del Regno wrote:
>> External email : Please do not click links or open attachments until you have verified the sender or the content.
>>
>>
>> Add support for the newer HDMI-TX (Encoder) v2 and DDC v2 IPs
>> found in MediaTek's MT8195, MT8188 SoC and their variants, and
>> including support for display modes up to 4k60 and for HDMI
>> Audio, as per the HDMI 2.0 spec.
>>
>> HDCP and CEC functionalities are also supported by this hardware,
>> but are not included in this commit.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
> 
> [snip]
> 
>> +static int mtk_hdmi_v2_enable(struct mtk_hdmi *hdmi)
>> +{
>> +       int ret;
>> +
>> +       ret = pm_runtime_resume_and_get(hdmi->dev);
> 
> Why turn on power when attach?
> Should hot-plug detection be always on so power on when attach?
> If so, maybe we need to use CEC to detect hot-plug because CEC has lower power and HDMI power would not be always on.
> As you describe previously, CEC just need some hack to support both HDMI Tx and HDMI Rx.
> So there is a software solution to use CEC to detect hot-plug in a lower power mode.
> And v1 use CEC to detect hot-plug, so it's worth to make v1 and v2 has the same behavior.
> 

As I said, we can't use CEC to detect hotplug, because the same CEC controller
can be used for both HDMI TX and RX at the same time.

If you use CEC to detect cable attach and you have both HDMI RX and HDMI TX drivers
probed and ready, if you attach the cable to HDMI RX port, HDMI TX will try to get
enabled and will error out.
Same happens if you attach a cable to HDMI TX: HDMI RX will try to get enabled and
will error out.

The only way to use CEC for hotplug detection is to detect twice: CEC for HDMI
TX/RX controllers wakeup, then reset both, wait for autodetect in both controllers,
suppress errors, and start signal transmit or receive.

While it is technically possible to do so, it's very complicated and hacky.

Please keep in mind that on the new SoCs (8188/8195) the CEC block is different
from the one in the old SoCs (6795, 8173, etc) and requires an entirely new driver
to get it working.

Using CEC for hotplug detection would mean that we need 3 full drivers:
1. HDMI TX
2. HDMI RX
3. CEC

This is because the CEC is shared, so we need to have all three to properly test
the functionality - and this is not possible to do all at once.

To save some power (not much, though!), we can eventually go for your proposed
CEC detection *in the future*, but really not right now - and we can do that only
after upstreaming both HDMI TX and HDMI RX drivers.

The plan (time/effort pemitting!) would look like this:

Series 1 - Upstream HDMIv2 TX (HPD through HDMIv2 TX controller) - drivers/gpu/drm
Series 2 - Upstream HDMIv2 RX (HPD through HDMIv2 RX controller) - drivers/media
Series 3 - Upstream CEC driver (No HPD in CEC)                   - drivers/media
Series 4 - Implement HPD in CEC and use it in HDMIv2 TX and HDMIv2 RX - media,drm

You can see how complicated this is - and I'm sure that you understand why that
cannot be done all at once.

Adding up some: the HDMI driver is used only on IoT boards for now, which typically
run off AC and not battery - so the (again) very little power consumption raise is
not critical for now.

Cheers,
Angelo

> Regards,
> CK
> 
> 
>> +       if (ret) {
>> +               dev_err(hdmi->dev, "Cannot resume HDMI\n");
>> +               return ret;
>> +       }
>> +
>> +       mtk_hdmi_v2_clk_enable(hdmi);
>> +       mtk_hdmi_hw_reset(hdmi);
>> +       mtk_hdmi_set_sw_hpd(hdmi, true);
>> +
>> +       return 0;
>> +}
>> +
> 
