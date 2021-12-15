Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6543A4762E1
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 21:14:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0440010EC8A;
	Wed, 15 Dec 2021 20:14:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E3EB10EC8A
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 20:14:22 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id a18so40207840wrn.6
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 12:14:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=E1VZMDNDn7cqxKxApca8uJlehdzt88dyZchiwwKVm7U=;
 b=g1YyMuTJ5GsMHrXtXUEAz4CRABMZW0S01hXe8QKWhyABEJi3BSEjuBy3EaXP0Yw2UM
 Il36LK+Tu016+3Ogmt+dKV2opDXRvH3DInp+s2ABpg92+3aVMbIIxDVNTR0x8kbtqKnX
 s5DlUfbxNhTFU7fWAbhPB9mSAi+mbLD7qYcVGGZo05cj+AlxhrTdSMZjMQ36IoS/H15U
 Ncf4K+gfKNpj5EpmlPU3POL7uLtoU643+74wvawF0qyKP0FohOPXapbgdRi7JzHJBfBX
 8H3ZNubWMsoFWlFLipISi+RUENOj5G4b4eqHp/wHzdFCwzWSMDXNOX7tDscJQ/3P98zJ
 U+Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=E1VZMDNDn7cqxKxApca8uJlehdzt88dyZchiwwKVm7U=;
 b=y8BZIXT5YqGpBAenDd/1ei4GA9pbQMCxzOzy6ONGB/v2J8yHVCgVrTZZvm7cDH3mSd
 q8j4iYf3hJDL8qIvKukJHAtc0BJHozknrFdXWBVULcqQee7QVirXQr9OodkWxtTr7rFq
 yR7JOFQJB5HVh/t6BBv8UECT66hbmERsIfyIrXeKaDNyO8MLbnr4jzQHjG11lrn6aAnN
 B1vOGQN3++pyZBaHZzl+RQTQEdhZl0cHWQ2nS//fHiioQgPVhvL7c7OYLWfdxrSF3G2H
 0YcfDuRSzyBxc5qczUTw/w0gRAI1CxBC/cuqCm4DFUjhYJUcQL0YUZzB0X61/IFkA0wn
 6qEw==
X-Gm-Message-State: AOAM5300/WzS2LlsMrZK+hrXu1KNPdfqeYLZq4yfxOrG855zasBSeeYw
 nIfbo9rRo5UZ8WrWpauQjZw=
X-Google-Smtp-Source: ABdhPJxBcM7HgZAgdlpi5+nkMNlxm9PmJ9F1y1ZmeyiXC8WxsVPU+9cBAt9sxOLu46Lj9oHh7lCXAg==
X-Received: by 2002:a5d:47a1:: with SMTP id 1mr6122296wrb.436.1639599260782;
 Wed, 15 Dec 2021 12:14:20 -0800 (PST)
Received: from [192.168.0.18] (81.172.62.207.dyn.user.ono.com. [81.172.62.207])
 by smtp.gmail.com with ESMTPSA id a1sm3810907wri.89.2021.12.15.12.14.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Dec 2021 12:14:20 -0800 (PST)
Message-ID: <5b90dd50-f088-8250-7683-fe359d9679a8@gmail.com>
Date: Wed, 15 Dec 2021 21:14:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v6 5/7] drm/mediatek: dpi: Add dpintf support
Content-Language: en-US
To: Guillaume Ranquet <granquet@baylibre.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20211110130623.20553-1-granquet@baylibre.com>
 <20211110130623.20553-6-granquet@baylibre.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20211110130623.20553-6-granquet@baylibre.com>
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
Cc: linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Markus Schneider-Pargmann <msp@baylibre.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 10/11/2021 14:06, Guillaume Ranquet wrote:
> From: Markus Schneider-Pargmann <msp@baylibre.com>
> 
> dpintf is the displayport interface hardware unit. This unit is similar
> to dpi and can reuse most of the code.
> 
> This patch adds support for mt8195-dpintf to this dpi driver. Main
> differences are:
>   - Some features/functional components are not available for dpintf
>     which are now excluded from code execution once is_dpintf is set
>   - dpintf can and needs to choose between different clockdividers based
>     on the clockspeed. This is done by choosing a different clock parent.
>   - There are two additional clocks that need to be managed. These are
>     only set for dpintf and will be set to NULL if not supplied. The
>     clk_* calls handle these as normal clocks then.
>   - Some register contents differ slightly between the two components. To
>     work around this I added register bits/masks with a DPINTF_ prefix
>     and use them where different.
> 
> Based on a separate driver for dpintf created by
> Jason-JH.Lin <jason-jh.lin@mediatek.com>.
> 
> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> ---
[...]
> diff --git a/include/linux/soc/mediatek/mtk-mmsys.h b/include/linux/soc/mediatek/mtk-mmsys.h
> index 4bba275e235ac..56ed2fa5f59e8 100644
> --- a/include/linux/soc/mediatek/mtk-mmsys.h
> +++ b/include/linux/soc/mediatek/mtk-mmsys.h
> @@ -19,6 +19,8 @@ enum mtk_ddp_comp_id {
>   	DDP_COMPONENT_DITHER,
>   	DDP_COMPONENT_DPI0,
>   	DDP_COMPONENT_DPI1,
> +	DDP_COMPONENT_DP_INTF0,
> +	DDP_COMPONENT_DP_INTF1,
>   	DDP_COMPONENT_DSI0,
>   	DDP_COMPONENT_DSI1,
>   	DDP_COMPONENT_DSI2,
> 

For the mtk-mmsys.h:
Acked-by: Matthias Brugger <matthias.bgg@gmail.com>
