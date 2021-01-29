Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C1783089E8
	for <lists+dri-devel@lfdr.de>; Fri, 29 Jan 2021 16:35:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00FB86EB63;
	Fri, 29 Jan 2021 15:35:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E60786EB62
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Jan 2021 15:35:15 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id f16so7150242wmq.5
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Jan 2021 07:35:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:cc:references:from:subject:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=zJKPfLg9CbrFKcrfXcPwVaS5yYgtqXVyVVsTJlqlX4M=;
 b=TpJsaM553Z5sN2tw6JHA4rBp7AZ3urCsJe496/3LIXaxlNgT7AlzYcAR3BZu0a0IsV
 e1V1giq4HJ2isMUA6j7v7FRvo9hR4f97CW786UPZ0RGMaCsNKkNFBv3S2dkPPfHi1Ky8
 MxKnr9oKYyItvAjzAvG+KQAPPVMUcEfmKvyDRKLpy9vDPyDOn2A6N8Rf9ORoVTjw49YQ
 NLjQC2ZyTFEOrUeHjSBpO5Z65NJTaNe0Ti3jC78G5QADrkBoksJw1XLvJbj1VPKyS4UA
 ifUH1hsM+snAhKpBRo9Sut0YlfUKC6Ylf1SwJc5dBy3V56a1UYsffGEjPDUnFr2NpZt+
 QuKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zJKPfLg9CbrFKcrfXcPwVaS5yYgtqXVyVVsTJlqlX4M=;
 b=Cayt8Y1kEYKnOplY53Wp438etM7XwBoGcZrXsBZ37bOocIAgZ65ExfDztUO4jdoPb6
 Z9XH45n8VrvRGUm9NRCrIkProGpbg1lKL3OYmO433Fr4vTHxhsEnj+AKozm63o3orvNb
 wloyMIbXnh6ipvHOU5aUJP6NA64svY/bVSBUGuOkiM2AHF0GeEhHOv3aSLdkCSKf1WnP
 vTgt04dfzfxpYyNIqiDcdJxTVO+PJF8pWEcvf8JO10k7lSVbMq6JylbjiH17P0DPpFrE
 OqZwDBnixS+Jp7pEZZEqG890tEN+tdynU8dSOirLet6rQzUI+PAbCvpj5P7scm5SelYz
 JKNA==
X-Gm-Message-State: AOAM531TbqZhabFJ08ebmV159GF6VWTYWlxOzZT/1QRRejiQdZv9Ehea
 x7q5ZB9Jt/Nonhmz0hPQIrg=
X-Google-Smtp-Source: ABdhPJwSoqXFZnqDJP2NbG4s6pXAwkMPlQxrU3Z/S1Hld3EUcL95E9cSdTUyMu2wAN6XpPMtRQdwVw==
X-Received: by 2002:a05:600c:414b:: with SMTP id
 h11mr4489482wmm.4.1611934514434; 
 Fri, 29 Jan 2021 07:35:14 -0800 (PST)
Received: from ziggy.stardust ([213.195.126.134])
 by smtp.gmail.com with ESMTPSA id z4sm12922519wrw.38.2021.01.29.07.35.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Jan 2021 07:35:13 -0800 (PST)
To: Yongqiang Niu <yongqiang.niu@mediatek.com>,
 Matthias Brugger <matthias.bgg@kernel.org>
References: <1609815993-22744-1-git-send-email-yongqiang.niu@mediatek.com>
 <1609815993-22744-4-git-send-email-yongqiang.niu@mediatek.com>
 <YAiG0UIfZPCRhMYd@ziggy.stardust> <1611190616.22801.6.camel@mhfsdcap03>
From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH v4, 03/10] soc: mediatek: mmsys: move register operation
 into mmsys path select function
Message-ID: <4cadc9f0-0761-7609-abac-d2211b097bda@gmail.com>
Date: Fri, 29 Jan 2021 16:35:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <1611190616.22801.6.camel@mhfsdcap03>
Content-Language: en-US
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 21/01/2021 01:56, Yongqiang Niu wrote:
> On Wed, 2021-01-20 at 20:38 +0100, Matthias Brugger wrote:
>> On Tue, Jan 05, 2021 at 11:06:26AM +0800, Yongqiang Niu wrote:
>>> move register operation into mmsys path select function
>>
>> Why do you want to do that. It seems the register access pattern is the
>> same for all SoCs so far supported, so I don't see the need to duplicate
>> the code in every SoC.
>>
>> Regards,
>> Matthias
> 
> mt2701 and mt8173 ovl mout en already different.
> mt2701 ovl mout en register offset is 0x30
> mt8173 olv mout en register offset is 0x40
> 
> only the use case is different;
> mt2701 ovl->color0
> mt8173 ovl->rmda0
> there make different define for this different.
> 
> #define DISP_REG_CONFIG_DISP_OVL0_MOUT_EN	0x040
> 
> #define DISP_REG_CONFIG_DISP_OVL_MOUT_EN	0x030
> 
> for the future mt8183, ovl mout en register offset will change to
> 0xf00
> 
> this is only one different sample, there will be more and more
> different, so we add this patch for different soc
> 
> 

That does not explain why you want to put the read and write calls in a per SoC
part, they are the same for all supported SoCs.

Anyway after having a second thought, I don't like this approach at all. I think
splitting up the code in several SoCs to not bloat the driver is a good thing,
but not as it is done in this series.

I'd prefer to use a lookup table as Enric did in his first approach [1]. We
could then add this table in a per SoC header file.

Regards,
Matthias


https://patchwork.kernel.org/project/linux-mediatek/patch/20201006193320.405529-5-enric.balletbo@collabora.com/

>>
>>>
>>> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
>>> ---
>>>  drivers/soc/mediatek/mmsys/mtk-mmsys.c | 140 +++++++++++++++++----------------
>>>  1 file changed, 71 insertions(+), 69 deletions(-)
>>>
>>> diff --git a/drivers/soc/mediatek/mmsys/mtk-mmsys.c b/drivers/soc/mediatek/mmsys/mtk-mmsys.c
>>> index 6c03282..64c8030 100644
>>> --- a/drivers/soc/mediatek/mmsys/mtk-mmsys.c
>>> +++ b/drivers/soc/mediatek/mmsys/mtk-mmsys.c
>>> @@ -106,141 +106,161 @@ struct mtk_mmsys {
>>>  	.clk_driver = "clk-mt8183-mm",
>>>  };
>>>  
>>> -static unsigned int mtk_mmsys_ddp_mout_en(enum mtk_ddp_comp_id cur,
>>> -					  enum mtk_ddp_comp_id next,
>>> -					  unsigned int *addr)
>>> +static void mtk_mmsys_ddp_mout_en(void __iomem *config_regs,
>>> +				  enum mtk_ddp_comp_id cur,
>>> +				  enum mtk_ddp_comp_id next,
>>> +				  bool enable)
>>>  {
>>> -	unsigned int value;
>>> +	unsigned int addr, value, reg;
>>>  
>>>  	if (cur == DDP_COMPONENT_OVL0 && next == DDP_COMPONENT_COLOR0) {
>>> -		*addr = DISP_REG_CONFIG_DISP_OVL0_MOUT_EN;
>>> +		addr = DISP_REG_CONFIG_DISP_OVL0_MOUT_EN;
>>>  		value = OVL0_MOUT_EN_COLOR0;
>>>  	} else if (cur == DDP_COMPONENT_OVL0 && next == DDP_COMPONENT_RDMA0) {
>>> -		*addr = DISP_REG_CONFIG_DISP_OVL_MOUT_EN;
>>> +		addr = DISP_REG_CONFIG_DISP_OVL_MOUT_EN;
>>>  		value = OVL_MOUT_EN_RDMA;
>>>  	} else if (cur == DDP_COMPONENT_OD0 && next == DDP_COMPONENT_RDMA0) {
>>> -		*addr = DISP_REG_CONFIG_DISP_OD_MOUT_EN;
>>> +		addr = DISP_REG_CONFIG_DISP_OD_MOUT_EN;
>>>  		value = OD_MOUT_EN_RDMA0;
>>>  	} else if (cur == DDP_COMPONENT_UFOE && next == DDP_COMPONENT_DSI0) {
>>> -		*addr = DISP_REG_CONFIG_DISP_UFOE_MOUT_EN;
>>> +		addr = DISP_REG_CONFIG_DISP_UFOE_MOUT_EN;
>>>  		value = UFOE_MOUT_EN_DSI0;
>>>  	} else if (cur == DDP_COMPONENT_OVL1 && next == DDP_COMPONENT_COLOR1) {
>>> -		*addr = DISP_REG_CONFIG_DISP_OVL1_MOUT_EN;
>>> +		addr = DISP_REG_CONFIG_DISP_OVL1_MOUT_EN;
>>>  		value = OVL1_MOUT_EN_COLOR1;
>>>  	} else if (cur == DDP_COMPONENT_GAMMA && next == DDP_COMPONENT_RDMA1) {
>>> -		*addr = DISP_REG_CONFIG_DISP_GAMMA_MOUT_EN;
>>> +		addr = DISP_REG_CONFIG_DISP_GAMMA_MOUT_EN;
>>>  		value = GAMMA_MOUT_EN_RDMA1;
>>>  	} else if (cur == DDP_COMPONENT_OD1 && next == DDP_COMPONENT_RDMA1) {
>>> -		*addr = DISP_REG_CONFIG_DISP_OD_MOUT_EN;
>>> +		addr = DISP_REG_CONFIG_DISP_OD_MOUT_EN;
>>>  		value = OD1_MOUT_EN_RDMA1;
>>>  	} else if (cur == DDP_COMPONENT_RDMA0 && next == DDP_COMPONENT_DPI0) {
>>> -		*addr = DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN;
>>> +		addr = DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN;
>>>  		value = RDMA0_SOUT_DPI0;
>>>  	} else if (cur == DDP_COMPONENT_RDMA0 && next == DDP_COMPONENT_DPI1) {
>>> -		*addr = DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN;
>>> +		addr = DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN;
>>>  		value = RDMA0_SOUT_DPI1;
>>>  	} else if (cur == DDP_COMPONENT_RDMA0 && next == DDP_COMPONENT_DSI1) {
>>> -		*addr = DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN;
>>> +		addr = DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN;
>>>  		value = RDMA0_SOUT_DSI1;
>>>  	} else if (cur == DDP_COMPONENT_RDMA0 && next == DDP_COMPONENT_DSI2) {
>>> -		*addr = DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN;
>>> +		addr = DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN;
>>>  		value = RDMA0_SOUT_DSI2;
>>>  	} else if (cur == DDP_COMPONENT_RDMA0 && next == DDP_COMPONENT_DSI3) {
>>> -		*addr = DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN;
>>> +		addr = DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN;
>>>  		value = RDMA0_SOUT_DSI3;
>>>  	} else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DSI1) {
>>> -		*addr = DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN;
>>> +		addr = DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN;
>>>  		value = RDMA1_SOUT_DSI1;
>>>  	} else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DSI2) {
>>> -		*addr = DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN;
>>> +		addr = DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN;
>>>  		value = RDMA1_SOUT_DSI2;
>>>  	} else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DSI3) {
>>> -		*addr = DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN;
>>> +		addr = DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN;
>>>  		value = RDMA1_SOUT_DSI3;
>>>  	} else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DPI0) {
>>> -		*addr = DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN;
>>> +		addr = DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN;
>>>  		value = RDMA1_SOUT_DPI0;
>>>  	} else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DPI1) {
>>> -		*addr = DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN;
>>> +		addr = DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN;
>>>  		value = RDMA1_SOUT_DPI1;
>>>  	} else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DPI0) {
>>> -		*addr = DISP_REG_CONFIG_DISP_RDMA2_SOUT;
>>> +		addr = DISP_REG_CONFIG_DISP_RDMA2_SOUT;
>>>  		value = RDMA2_SOUT_DPI0;
>>>  	} else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DPI1) {
>>> -		*addr = DISP_REG_CONFIG_DISP_RDMA2_SOUT;
>>> +		addr = DISP_REG_CONFIG_DISP_RDMA2_SOUT;
>>>  		value = RDMA2_SOUT_DPI1;
>>>  	} else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DSI1) {
>>> -		*addr = DISP_REG_CONFIG_DISP_RDMA2_SOUT;
>>> +		addr = DISP_REG_CONFIG_DISP_RDMA2_SOUT;
>>>  		value = RDMA2_SOUT_DSI1;
>>>  	} else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DSI2) {
>>> -		*addr = DISP_REG_CONFIG_DISP_RDMA2_SOUT;
>>> +		addr = DISP_REG_CONFIG_DISP_RDMA2_SOUT;
>>>  		value = RDMA2_SOUT_DSI2;
>>>  	} else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DSI3) {
>>> -		*addr = DISP_REG_CONFIG_DISP_RDMA2_SOUT;
>>> +		addr = DISP_REG_CONFIG_DISP_RDMA2_SOUT;
>>>  		value = RDMA2_SOUT_DSI3;
>>>  	} else {
>>>  		value = 0;
>>>  	}
>>>  
>>> -	return value;
>>> +	if (value) {
>>> +		reg = readl_relaxed(config_regs + addr);
>>> +
>>> +		if (enable)
>>> +			reg |= value;
>>> +		else
>>> +			reg &= ~value;
>>> +
>>> +		writel_relaxed(reg, config_regs + addr);
>>> +	}
>>>  }
>>>  
>>> -static unsigned int mtk_mmsys_ddp_sel_in(enum mtk_ddp_comp_id cur,
>>> -					 enum mtk_ddp_comp_id next,
>>> -					 unsigned int *addr)
>>> +static void mtk_mmsys_ddp_sel_in(void __iomem *config_regs,
>>> +				 enum mtk_ddp_comp_id cur,
>>> +				 enum mtk_ddp_comp_id next,
>>> +				 bool enable)
>>>  {
>>> -	unsigned int value;
>>> +	unsigned int addr, value, reg;
>>>  
>>>  	if (cur == DDP_COMPONENT_OVL0 && next == DDP_COMPONENT_COLOR0) {
>>> -		*addr = DISP_REG_CONFIG_DISP_COLOR0_SEL_IN;
>>> +		addr = DISP_REG_CONFIG_DISP_COLOR0_SEL_IN;
>>>  		value = COLOR0_SEL_IN_OVL0;
>>>  	} else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DPI0) {
>>> -		*addr = DISP_REG_CONFIG_DPI_SEL_IN;
>>> +		addr = DISP_REG_CONFIG_DPI_SEL_IN;
>>>  		value = DPI0_SEL_IN_RDMA1;
>>>  	} else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DPI1) {
>>> -		*addr = DISP_REG_CONFIG_DPI_SEL_IN;
>>> +		addr = DISP_REG_CONFIG_DPI_SEL_IN;
>>>  		value = DPI1_SEL_IN_RDMA1;
>>>  	} else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DSI0) {
>>> -		*addr = DISP_REG_CONFIG_DSIE_SEL_IN;
>>> +		addr = DISP_REG_CONFIG_DSIE_SEL_IN;
>>>  		value = DSI0_SEL_IN_RDMA1;
>>>  	} else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DSI1) {
>>> -		*addr = DISP_REG_CONFIG_DSIO_SEL_IN;
>>> +		addr = DISP_REG_CONFIG_DSIO_SEL_IN;
>>>  		value = DSI1_SEL_IN_RDMA1;
>>>  	} else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DSI2) {
>>> -		*addr = DISP_REG_CONFIG_DSIE_SEL_IN;
>>> +		addr = DISP_REG_CONFIG_DSIE_SEL_IN;
>>>  		value = DSI2_SEL_IN_RDMA1;
>>>  	} else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DSI3) {
>>> -		*addr = DISP_REG_CONFIG_DSIO_SEL_IN;
>>> +		addr = DISP_REG_CONFIG_DSIO_SEL_IN;
>>>  		value = DSI3_SEL_IN_RDMA1;
>>>  	} else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DPI0) {
>>> -		*addr = DISP_REG_CONFIG_DPI_SEL_IN;
>>> +		addr = DISP_REG_CONFIG_DPI_SEL_IN;
>>>  		value = DPI0_SEL_IN_RDMA2;
>>>  	} else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DPI1) {
>>> -		*addr = DISP_REG_CONFIG_DPI_SEL_IN;
>>> +		addr = DISP_REG_CONFIG_DPI_SEL_IN;
>>>  		value = DPI1_SEL_IN_RDMA2;
>>>  	} else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DSI0) {
>>> -		*addr = DISP_REG_CONFIG_DSIE_SEL_IN;
>>> +		addr = DISP_REG_CONFIG_DSIE_SEL_IN;
>>>  		value = DSI0_SEL_IN_RDMA2;
>>>  	} else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DSI1) {
>>> -		*addr = DISP_REG_CONFIG_DSIO_SEL_IN;
>>> +		addr = DISP_REG_CONFIG_DSIO_SEL_IN;
>>>  		value = DSI1_SEL_IN_RDMA2;
>>>  	} else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DSI2) {
>>> -		*addr = DISP_REG_CONFIG_DSIE_SEL_IN;
>>> +		addr = DISP_REG_CONFIG_DSIE_SEL_IN;
>>>  		value = DSI2_SEL_IN_RDMA2;
>>>  	} else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DSI3) {
>>> -		*addr = DISP_REG_CONFIG_DSIE_SEL_IN;
>>> +		addr = DISP_REG_CONFIG_DSIE_SEL_IN;
>>>  		value = DSI3_SEL_IN_RDMA2;
>>>  	} else if (cur == DDP_COMPONENT_OVL1 && next == DDP_COMPONENT_COLOR1) {
>>> -		*addr = DISP_REG_CONFIG_DISP_COLOR1_SEL_IN;
>>> +		addr = DISP_REG_CONFIG_DISP_COLOR1_SEL_IN;
>>>  		value = COLOR1_SEL_IN_OVL1;
>>>  	} else if (cur == DDP_COMPONENT_BLS && next == DDP_COMPONENT_DSI0) {
>>> -		*addr = DISP_REG_CONFIG_DSI_SEL;
>>> +		addr = DISP_REG_CONFIG_DSI_SEL;
>>>  		value = DSI_SEL_IN_BLS;
>>>  	} else {
>>>  		value = 0;
>>>  	}
>>>  
>>> -	return value;
>>> +	if (value) {
>>> +		reg = readl_relaxed(config_regs + addr);
>>> +
>>> +		if (enable)
>>> +			reg |= value;
>>> +		else
>>> +			reg &= ~value;
>>> +
>>> +		writel_relaxed(reg, config_regs + addr);
>>> +	}
>>>  }
>>>  
>>>  static void mtk_mmsys_ddp_sout_sel(void __iomem *config_regs,
>>> @@ -265,21 +285,12 @@ void mtk_mmsys_ddp_connect(struct device *dev,
>>>  			   enum mtk_ddp_comp_id next)
>>>  {
>>>  	struct mtk_mmsys *mmsys = dev_get_drvdata(dev);
>>> -	unsigned int addr, value, reg;
>>>  
>>> -	value = mtk_mmsys_ddp_mout_en(cur, next, &addr);
>>> -	if (value) {
>>> -		reg = readl_relaxed(mmsys->regs + addr) | value;
>>> -		writel_relaxed(reg, mmsys->regs + addr);
>>> -	}
>>> +	mtk_mmsys_ddp_mout_en(mmsys->regs, cur, next, true);
>>>  
>>>  	mtk_mmsys_ddp_sout_sel(mmsys->regs, cur, next);
>>>  
>>> -	value = mtk_mmsys_ddp_sel_in(cur, next, &addr);
>>> -	if (value) {
>>> -		reg = readl_relaxed(mmsys->regs + addr) | value;
>>> -		writel_relaxed(reg, mmsys->regs + addr);
>>> -	}
>>> +	mtk_mmsys_ddp_sel_in(mmsys->regs, cur, next, true);
>>>  }
>>>  EXPORT_SYMBOL_GPL(mtk_mmsys_ddp_connect);
>>>  
>>> @@ -288,19 +299,10 @@ void mtk_mmsys_ddp_disconnect(struct device *dev,
>>>  			      enum mtk_ddp_comp_id next)
>>>  {
>>>  	struct mtk_mmsys *mmsys = dev_get_drvdata(dev);
>>> -	unsigned int addr, value, reg;
>>>  
>>> -	value = mtk_mmsys_ddp_mout_en(cur, next, &addr);
>>> -	if (value) {
>>> -		reg = readl_relaxed(mmsys->regs + addr) & ~value;
>>> -		writel_relaxed(reg, mmsys->regs + addr);
>>> -	}
>>> +	mtk_mmsys_ddp_mout_en(mmsys->regs, cur, next, false);
>>>  
>>> -	value = mtk_mmsys_ddp_sel_in(cur, next, &addr);
>>> -	if (value) {
>>> -		reg = readl_relaxed(mmsys->regs + addr) & ~value;
>>> -		writel_relaxed(reg, mmsys->regs + addr);
>>> -	}
>>> +	mtk_mmsys_ddp_sel_in(mmsys->regs, cur, next, false);
>>>  }
>>>  EXPORT_SYMBOL_GPL(mtk_mmsys_ddp_disconnect);
>>>  
>>> -- 
>>> 1.8.1.1.dirty
>>> _______________________________________________
>>> Linux-mediatek mailing list
>>> Linux-mediatek@lists.infradead.org
>>> http://lists.infradead.org/mailman/listinfo/linux-mediatek
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
