Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D5BF622A17
	for <lists+dri-devel@lfdr.de>; Wed,  9 Nov 2022 12:17:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25CB510E5A7;
	Wed,  9 Nov 2022 11:17:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 815C410E5A7
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Nov 2022 11:17:26 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id a14so25256709wru.5
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Nov 2022 03:17:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7TZMakybPbFpJRwcj0rnyGA7xSqmp4zgniSRZniIZK4=;
 b=LRilL4EzGUCsJsnSGNtname1ZH8ux5mPJ4lajTQNHrRYgpNwgqJkahrTdoidPpPYLm
 6audM/v7q3gRxeD/LG4GhKbK5K1m/tVJqIlEi5sitI3hWO792xHbEA4rMtIRdOw1isIT
 V9nG1+0zGrEayoWgbDOtw0mPldsATOnLk+t5hSKElDdTIS0uWKJYAUi/K9a+6iFREIBF
 krx3OvjTVEpEORdBTSdUA+eSm5MlfE2tN5pbvaZB8Mx4hBZCJCX5uRIHkO9iPpNTx1wR
 dzrEpM9XWI9wZAKQJBvTmESoQtMvfgFfoIoZqTGnWO0aW3a8QZ3PkMWjQgoGAAt5pNE+
 iMsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7TZMakybPbFpJRwcj0rnyGA7xSqmp4zgniSRZniIZK4=;
 b=I1piE6OBPtuyQFA9GzmoFa9goEIrU5ZPiNeDcfVfEhTqe9n0+WnY5+Gj4qvJ77qo+P
 e9jNn+b21zKJx0YoaklnHikr0Wt17SB9GEWEyJusXQe7rCvVqaZ7pywb8memaw2fCHSd
 nnqStcC+19iA1ZUMinL871ROeqVGl9tuHvXooXrQemLxa8fA35RBh51Zy3wYH1asAk6K
 myJvBAAC/YHrko8boBrQqgwoDY/SnoqEpO6IJn47ToHP05+oMNTVBGLaGY8fp3eL7HZ8
 xJx3CT2qp0UdQMp4rY8Y2dX1Sse4bImQNM+hNIXGJg7Sn+5JYaMVsAWRyms7HXF/S6sF
 2FZA==
X-Gm-Message-State: ACrzQf1XwTxlZmSRs9GZc+OHtRrGPwaHtJog7/QHk/iJ6jmbXni4Msk9
 sGUPJFtuBYTh9AUrLjo4Id0=
X-Google-Smtp-Source: AMsMyM5bEoKB4dIgSpobvcGXsYW/wLVEIpxJASmQ2OWpQrS8ziAUG9I39ARZMJ8PEfcr9AZ7ecv+Pw==
X-Received: by 2002:a5d:5710:0:b0:236:cdd4:4cf4 with SMTP id
 a16-20020a5d5710000000b00236cdd44cf4mr33946566wrv.376.1667992644821; 
 Wed, 09 Nov 2022 03:17:24 -0800 (PST)
Received: from [192.168.1.131] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 bp4-20020a5d5a84000000b0023677081f3asm12946407wrb.42.2022.11.09.03.17.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Nov 2022 03:17:23 -0800 (PST)
Message-ID: <8502e61e-7040-0f73-9f27-60985fb2283d@gmail.com>
Date: Wed, 9 Nov 2022 12:17:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v13,0/3] Add dpi output format control for MT8186
To: =?UTF-8?B?WGlubGVpIExlZSAo5p2O5piV56OKKQ==?= <Xinlei.Lee@mediatek.com>,
 =?UTF-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "airlied@linux.ie" <airlied@linux.ie>,
 =?UTF-8?B?UmV4LUJDIENoZW4gKOmZs+afj+i+sCk=?= <Rex-BC.Chen@mediatek.com>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>,
 "nfraprado@collabora.com" <nfraprado@collabora.com>
References: <1666577099-3859-1-git-send-email-xinlei.lee@mediatek.com>
 <c9228b64-c786-fa24-ff96-376eacfb1816@gmail.com>
 <b69311d4d39eae54d1120760532a83bb62213277.camel@mediatek.com>
Content-Language: en-US
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <b69311d4d39eae54d1120760532a83bb62213277.camel@mediatek.com>
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
Cc: Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Xinlei,

On 09/11/2022 03:40, Xinlei Lee (李昕磊) wrote:
> On Tue, 2022-11-08 at 19:27 +0100, Matthias Brugger wrote:
>> Hi Xinlei,
>> 
>> Somehow b4 broke with your thread but I was able to apply patch 1 and
>> 2 by hand.
>> 
>> Thanks
>> Matthias
>> 
>> On 24/10/2022 04:04, xinlei.lee@mediatek.com wrote:
>> > From: Xinlei Lee <xinlei.lee@mediatek.com>
>> > 
>> > Base on the branch of linus/master v6.1 rc1.
>> > 
>> > Change since v12:
>> > 1. Add MT8186_ prefix to variables added in mt8186-mmsys.h file.
>> > 
>> > Change since v11:
>> > 1. Rebase on v6.1-rc1. Change nothing.
>> > 
>> > Change since v10:
>> > 1. Modify patch title and add review tag.
>> > 
>> > Change since v9:
>> > 1. Modify the location of the mmsys_dev member variable.
>> > 
>> > Change since v8:
>> > 1. Modified the title and some description information.
>> > 
>> > Changes since v7:
>> > 1. This series is based on the following patch:
>> >     [1] soc: mediatek: Add mmsys func to adapt to dpi output for
>> > MT8186
>> >     
>> > https://urldefense.com/v3/__https://patchwork.kernel.org/project/linux-mediatek/patch/1663161662-1598-2-git-send-email-xinlei.lee@mediatek.com/__;!!CTRNKA9wMg0ARbw!3tXTL3P6SgcP8Q_rcyCro64dxIXE6VuVbcNftU0ZnX6TNtU1akXwd96YfnoJs_fEig$
>> >  
>> > 2. Modify the DPI_FORMAT_MASK macro definition to GENMASK(1, 0);
>> > 3. Add all settings to mtk_mmsys_ddp_dpi_fmt_config;
>> > 4. Modify the commit title to Add mt8186 dpi compatibles and
>> > platform
>> > data.
>> > 
>> > Changes since v6:
>> > 1. Different from other ICs, when mt8186 DPI changes the output
>> > format,
>> > the mmsys_base+400 register needs to be set to be valid at the same
>> > time.
>> >     In this series, all the situations that mmsys need to be set up
>> > are
>> > perfected (not necessarily used in practice).
>> > 2. Put the value that controls the mmsys function in mtk-mmsys.h.
>> > 3. Encountered the sink ic switched between dual edge and single
>> > edge,
>> > perfected setting and clearing mmsys bit operations in mtk_dpi.c.
>> > 
>> > Changes since v5:
>> > 1. Separate the patch that adds edge_cfg_in_mmsys from the patch
>> > that
>> > adds mt8186 dpi support.
>> > 2. Move the mmsys register definition to mmsys driver.
>> >   
>> > Changes since v4:
>> > 1. This series of cancellations is based on the following patches:
>> >     [1] Add MediaTek SoC(vdosys1) support for mt8195
>> >     
>> > https://urldefense.com/v3/__https://patchwork.kernel.org/project/linux-mediatek/cover/20220711075245.10492-1-nancy.lin@mediatek.com/__;!!CTRNKA9wMg0ARbw!3tXTL3P6SgcP8Q_rcyCro64dxIXE6VuVbcNftU0ZnX6TNtU1akXwd96Yfnqv0_QYpg$
>> >  
>> >     [2] Add MediaTek SoC DRM (vdosys1) support for mt8195
>> >     
>> > https://urldefense.com/v3/__https://patchwork.kernel.org/project/linux-mediatek/cover/20220804072827.22383-1-nancy.lin@mediatek.com/__;!!CTRNKA9wMg0ARbw!3tXTL3P6SgcP8Q_rcyCro64dxIXE6VuVbcNftU0ZnX6TNtU1akXwd96YfnoZMZ_peA$
>> >  
>> > 2. Added mtk_mmsys_update_bits function in mtk-mmsys.c;
>> > 3. MMSYS 0x400 register is modified to
>> > MT8186_MMSYS_DPI_OUTPUT_FORMAT;
>> > 4. Fix formatting issues.
>> > 
>> > Changes since v3:
>> > 1. Fix formatting issues;
>> > 2. Modify the edge output control name & description;
>> > 3. Fix the threading problem.
>> > 
>> > Changes since v2:
>> > 1. Modify key nouns in the description;
>> > 2. Add the label of jitao to Co-developed-by;
>> > 3. Macro definition address lowercase problem and function naming;
>> > 4. Add missing a description of this property in the mtk_dpi_conf.
>> > 
>> > Change since v1:
>> > 1. Modify mt8186 compatiable location.
>> > 2. Modify MT8186_DPI_OUTPUT_FORMAT name.
>> > 
>> > When MT8186 outputs dpi signal, it is necessary to add dual edge
>> > output
>> > format control in mmsys.
>> > 
>> > Xinlei Lee (3):
>> >    soc: mediatek: Add all settings to mtk_mmsys_ddp_dpi_fmt_config
>> > func
>> >    drm: mediatek: Set dpi format in mmsys
>> >    drm: mediatek: Add mt8186 dpi compatibles and platform data
>> > 
>> >   drivers/gpu/drm/mediatek/mtk_dpi.c     | 32
>> > ++++++++++++++++++++++++++
>> >   drivers/gpu/drm/mediatek/mtk_drm_drv.c |  2 ++
>> >   drivers/soc/mediatek/mt8186-mmsys.h    |  8 ++++---
>> >   drivers/soc/mediatek/mtk-mmsys.c       | 27 +++++++++++++++++--
>> > ---
>> >   include/linux/soc/mediatek/mtk-mmsys.h |  7 ++++++
>> >   5 files changed, 67 insertions(+), 9 deletions(-)
>> > 
> 
> Hi Matthias:
> 
> Is your problem solved?
> 
> I tried to pull the series in link[1] to the kernel 6.1-rc1 version,
> the patches are all successfully applied, and the patch in link[1]
> looks complete.
> 
> If you still think there is something wrong, please let me know and I
> can send a new version to try to fix it.

Everything is fine, no worries.

Thanks for asking.
Matthias

> 
> [1]:
> https://patchwork.kernel.org/project/linux-mediatek/cover/1666577099-3859-1-git-send-email-xinlei.lee@mediatek.com/
> 
> Best Regards!
> xinlei
> 
> ************* MEDIATEK Confidentiality Notice
>   ********************
> The information contained in this e-mail message (including any
> attachments) may be confidential, proprietary, privileged, or otherwise
> exempt from disclosure under applicable laws. It is intended to be
> conveyed only to the designated recipient(s). Any use, dissemination,
> distribution, printing, retaining or copying of this e-mail (including its
> attachments) by unintended recipient(s) is strictly prohibited and may
> be unlawful. If you are not an intended recipient of this e-mail, or believe
>   
> that you have received this e-mail in error, please notify the sender
> immediately (by replying to this e-mail), delete any and all copies of
> this e-mail (including any attachments) from your system, and do not
> disclose the content of this e-mail to any other person. Thank you!
