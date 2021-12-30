Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E6726481C0F
	for <lists+dri-devel@lfdr.de>; Thu, 30 Dec 2021 13:30:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B03510E482;
	Thu, 30 Dec 2021 12:29:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFEF510E482
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Dec 2021 12:29:57 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id d9so50249169wrb.0
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Dec 2021 04:29:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=O0+J3hfYi+tJOX87FRscUIQ71ohxgIJHCX2HAI7b8Uk=;
 b=WMadPGKQYElHu5jMUqicwQrvbZw0wasy3D2dwh6uxHrjnJIKPJU2olLLJiUHlD3145
 plls98wtenzGF2fKfmdY+zgaoa+jfm1UcyH2wkz5HwMtk+9/Qh9TIqO85tG2dg+DB6lC
 +3e+sFx8vK+EaZzrlOQ4oMNMl7NxCcMoBoZJDv9wivx7eB6ftjYEV3iYCqcuggnraFTV
 AG6lYgy2JNYCSPoWhUz1P8FK3E5ws6ZBZTMb1uJZTczp3CiqAHm9U46gHeH3dcpnqQIH
 1tS9OsNRcHYpfa4tH+NupuN9/QJu3+dM2VWCPAjJH1oxL2Qu9yUuX6I/dXc6pxLQ1KOy
 0KTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=O0+J3hfYi+tJOX87FRscUIQ71ohxgIJHCX2HAI7b8Uk=;
 b=8QEkB53mSZYSz8gkeJHc23v/SFwKs8g1bJp4sWRZ/E5FZhMY1duwKUok7SVQlbW5X3
 VZZxGjrSLpIbvJhYujqbIeWWD0yQT/3gCgvCV5TBDwGI/0pqhSQqQoMBisYYqT4Wib96
 zwIAR+EVa+vmtGPpAjUrrtgYSg24CgmErJ25RV7eJIY+y0pw6QVF3iCLj7EndqFt/8ER
 mF/QKtCF1DyYDrXH0ev9/N2UybT4XicNcy7+sGWOWS7Sw/HbKRwFilphSnadsVU/DXqY
 MjvTGVPTgdNWIiKuB2Q7y3hnSnfRwa9lC6kJVBYslk48tlNcTCz5G+gnKZalfcz3SviC
 F/8g==
X-Gm-Message-State: AOAM531p2PQiM+9QgFPUAJY5pmFk1Kk11gK6K7Qm+n5aa2ZhZeLdIiV3
 wAH4aYiX7b/k51Yp7s4Aw74=
X-Google-Smtp-Source: ABdhPJyeMdqRs+cOsnbASw7H4TcBciKWFlGxLhfRAl5VE2g8s7FE8D4hxsDXVPloniZ7EO3XL58Fpg==
X-Received: by 2002:a5d:4385:: with SMTP id i5mr24410955wrq.178.1640867396353; 
 Thu, 30 Dec 2021 04:29:56 -0800 (PST)
Received: from [192.168.2.177] ([207.188.161.251])
 by smtp.gmail.com with ESMTPSA id o12sm23945584wrv.76.2021.12.30.04.29.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Dec 2021 04:29:55 -0800 (PST)
Message-ID: <d784e170-a115-bd0a-a87c-07aed0fb73fc@gmail.com>
Date: Thu, 30 Dec 2021 13:29:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v3] drm/mediatek: Fix unused-but-set variable warning
Content-Language: en-US
To: Miles Chen <miles.chen@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Jie Qiu <jie.qiu@mediatek.com>,
 Junzhi Zhao <junzhi.zhao@mediatek.com>
References: <20211230093610.28012-1-miles.chen@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20211230093610.28012-1-miles.chen@mediatek.com>
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
Cc: llvm@lists.linux.dev, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Zhiqiang Lin <zhiqiang.lin@mediatek.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 30/12/2021 10:36, Miles Chen wrote:
> clang reports a unused-but-set variable warning:
> drivers/gpu/drm/mediatek/mtk_cec.c:85:6: warning: variable 'tmp' set but not used [-Wunused-but-set-variable]
> 
> In current implementation, mtk_cec_mask() writes val into target register
> and ignores the mask. After talking to our hdmi experts, mtk_cec_mask()
> should read a register, clean only mask bits, and update (val | mask) bits
> to the register.
> 
> Fixes: 8f83f26891e1 ("drm/mediatek: Add HDMI support")
> 
> Cc: Zhiqiang Lin <zhiqiang.lin@mediatek.com>
> Cc: CK Hu <ck.hu@mediatek.com>
> Cc: Matthias Brugger <matthias.bgg@gmail.com>
> 
> Signed-off-by: Miles Chen <miles.chen@mediatek.com>

I'm still not happy with the commit subject, I think it is misleading. Clang 
only helped to find the bug, but the we are fixing something else, that's not 
just a clang warning. But I don't want to nit-pick too much so:

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> 
> ---
> 
> Change since v1:
> add Fixes tag
> 
> Change since v2:
> add explanation of mtk_cec_mask()
> 
> Change-Id: Iec6402b0532942f4d0e8bc56817eb87b95c03fad
> ---
>   drivers/gpu/drm/mediatek/mtk_cec.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_cec.c b/drivers/gpu/drm/mediatek/mtk_cec.c
> index e9cef5c0c8f7..cdfa648910b2 100644
> --- a/drivers/gpu/drm/mediatek/mtk_cec.c
> +++ b/drivers/gpu/drm/mediatek/mtk_cec.c
> @@ -85,7 +85,7 @@ static void mtk_cec_mask(struct mtk_cec *cec, unsigned int offset,
>   	u32 tmp = readl(cec->regs + offset) & ~mask;
>   
>   	tmp |= val & mask;
> -	writel(val, cec->regs + offset);
> +	writel(tmp, cec->regs + offset);
>   }
>   
>   void mtk_cec_set_hpd_event(struct device *dev,
> 
