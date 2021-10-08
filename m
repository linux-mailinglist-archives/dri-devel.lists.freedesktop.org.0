Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 14D8D42697A
	for <lists+dri-devel@lfdr.de>; Fri,  8 Oct 2021 13:37:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E49BB6E055;
	Fri,  8 Oct 2021 11:37:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCED16E055
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Oct 2021 11:37:24 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id t8so29045683wri.1
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Oct 2021 04:37:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=nhVv3Nu8L78RD8tuH9ekjolQi0/WLnSIsU3PjboDD2E=;
 b=cyG5X880niFfEcC+hw3EYtl11pMrvkr/xcfUgwlo2MDTSIFyu0/rBR6x0eaCFvTYbx
 YJXuPIHqh8x7zwEC8NaEN5Pu/0lvQ/kerYIDsHWNqKtv2/qAiIAeLfkVcTsA/CVnc5gy
 1ovf3PmLXqteGvQmeJff/Bf4clkKNoxIHkOjEAZX6Kx5aF41hxN2b61RXcU7PuV+Sw/K
 3v32ot+h2DkQJFm1pH4jeV2r/96PsTFkiyZovKXT+TRhbclkNVhvJaeI0pTCFJn6P6Dy
 Pr1IRn4Lts9Q0ozAU8NKc70PsyZkKEpSQrGlS9NosYAT+EWClUbg5ZxZRjvAc+eqfUaL
 DTcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=nhVv3Nu8L78RD8tuH9ekjolQi0/WLnSIsU3PjboDD2E=;
 b=14md6uQEqpbRXw45HkN0JnmbBQE/yhDhecppmQfyquoU4cvoQ3WXiDlEGYuJeiglr4
 gKwjssCbM4xCaqtMxA15rdRvkQQIfZ2PO6eAe67TOhDudf/LOZCH76oOS+n+Ft9501hw
 W/LGcFx9IUCYCk/64AJXxwB3jfocdxqVZGlLLII/i5DjEGFcICCtItolJ/AT4WLXdvr1
 0xMqMcpxsrW9vIs3lsXtBF/odVcwjWsV2vyB+nDh5ENAmlkgsT7gwiHuOqvIDUSIJlnv
 +a2ENFO5ItfyYodL7POjZm2m9GRskEaIaijvO1QTkl162S0NapidhBLQdF8CYQ58YJry
 lqiw==
X-Gm-Message-State: AOAM533XWAErS89AcrFNXamhMGVCxeoPzufr2fOr8KEUoI8VY1jVhWOj
 1Ivo4fLkUhKLkrKJdSN6rlA=
X-Google-Smtp-Source: ABdhPJwVR2YF8maIX6p9K/HHX630G689zHLSPVI6jT9XLKwM0kaDfCSBSWfXXwV+O5bt5doVm72EZQ==
X-Received: by 2002:a7b:cbc2:: with SMTP id n2mr2925803wmi.2.1633693043342;
 Fri, 08 Oct 2021 04:37:23 -0700 (PDT)
Received: from [192.168.2.177] ([206.204.146.29])
 by smtp.gmail.com with ESMTPSA id z17sm2280277wml.24.2021.10.08.04.37.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Oct 2021 04:37:22 -0700 (PDT)
Message-ID: <e3f30009-31ae-f37d-5016-bc8677d8d364@gmail.com>
Date: Fri, 8 Oct 2021 13:37:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.2
Subject: Re: [PATCH v11, 0/2] soc: mediatek: mmsys: add mt8192 mmsys support
Content-Language: en-US
To: Yongqiang Niu <yongqiang.niu@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Jassi Brar <jassisinghbrar@gmail.com>, Fabien Parent <fparent@baylibre.com>,
 Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Hsin-Yi Wang <hsinyi@chromium.org>
References: <20211008020504.1678-1-yongqiang.niu@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20211008020504.1678-1-yongqiang.niu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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



On 08/10/2021 04:05, Yongqiang Niu wrote:
> base v5.15
> 
> Yongqiang Niu (2):
>    soc: mediatek: mmsys: add comp OVL_2L2/POSTMASK/RDMA4
>    soc: mediatek: mmsys: Add mt8192 mmsys routing table

I'm a bit puzzled that you keep on sending this series while I accepted an older 
one long time ago:
https://lore.kernel.org/lkml/e4afa712-9936-15fc-ad43-576948758f6c@gmail.com/

As you don't provide a changelog I'm not able to find out what has changed. I 
also asked you to double check if the fixup I did was correct, but you never 
answered.

If there are anything to fix for this series that's not in my tree yet, please 
send a follow-up patch.

Regards,
Matthias

> 
>   drivers/soc/mediatek/mt8192-mmsys.h    | 77 ++++++++++++++++++++++++++
>   drivers/soc/mediatek/mtk-mmsys.c       | 11 ++++
>   include/linux/soc/mediatek/mtk-mmsys.h |  3 +
>   3 files changed, 91 insertions(+)
>   create mode 100644 drivers/soc/mediatek/mt8192-mmsys.h
> 
