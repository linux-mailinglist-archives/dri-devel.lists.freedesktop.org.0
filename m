Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 686997AC455
	for <lists+dri-devel@lfdr.de>; Sat, 23 Sep 2023 20:09:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A387710E098;
	Sat, 23 Sep 2023 18:09:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AEEE10E098
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Sep 2023 18:09:47 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-3ff1c397405so44414165e9.3
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Sep 2023 11:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1695492586; x=1696097386; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=l0OmVT82kVRhT6V7fBBibLFNJi2iRMus/lOyy9oKOW0=;
 b=YMhrPGhvC/afcjSJNLTY9+HyEh6qLPkym6ryTFTyHl91YhqxPvpiQUACiuTBwoV8SR
 LsHwOhXTyy8XGO+sRtk3A2Pvvae5ke0oUN/AgPjbvz+TGBlaBIMDgDS8IXWdbiNEdRHd
 pz7Ju2LLT0jTJjA4WuirFmoTywth6QuZUDWSLVI0ukb2Ks+0/oqJW9Pl/eG0cnUEruA8
 l38pE4bYOE38ivsS74ehh/jao0abLYTTafB3EfL3c2oCnpASMwRavKgVRNGJf+RZqAiX
 IQftxUpdTa+umH3X/PWJuoq31ZhbBDwbMaGiBTJC59lQK8jKRjVHNlLLWzr3av5IbpO8
 mb2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695492586; x=1696097386;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=l0OmVT82kVRhT6V7fBBibLFNJi2iRMus/lOyy9oKOW0=;
 b=w6XSgEgUNYUgTvVz4BTr4m68QmlmDk+14TBiCk+nKQlRhWL4TaFQguqaAIt2qZcJdk
 Q+u9hWItTSLNdGhn1tbDq0FvCavUOr0qy+bhm0q5xvXaA6t7uS27+PpZe4+Wy9n7L1/y
 pvE3UvYXipFJa56Nr14oUUKQGSMcHT6tJkEELP9uBGpoe0QTV0AJtwoPSH48PKy1s5m3
 j1JQvsa0RkTD+HjIfD781PFe+io8RV7ss4L7ZN0xjOER7UfBytGIdVGKBjG0xiCXUjBt
 hcIYpKakLW8w/GeHEvSSPEuHcMJ3RGQW465WB96qGylsA7tPOC3TRNXHyK22is+jXmrd
 8kiw==
X-Gm-Message-State: AOJu0YxKkg1iFnRGF3bjDoQIllcdQ76lsQfFa/kwBguSYw9fDqef+V0W
 9/WNW7wIg/g/DCyhDCrc9ELHkQ==
X-Google-Smtp-Source: AGHT+IGbEDdCor3uAVvI6RHkOnvfxXv6QO0vC7iRLExeI+9NeOdG9D895dHQs60CsZTG3e2Zoj0+KA==
X-Received: by 2002:a5d:4c85:0:b0:321:5d87:5f7c with SMTP id
 z5-20020a5d4c85000000b003215d875f7cmr2665873wrs.30.1695492586036; 
 Sat, 23 Sep 2023 11:09:46 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.100])
 by smtp.gmail.com with ESMTPSA id
 z12-20020a5d654c000000b0032148618cc4sm7447722wrv.29.2023.09.23.11.09.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Sep 2023 11:09:45 -0700 (PDT)
Message-ID: <87ae80c0-a09b-3642-e3e9-c753cd330bca@linaro.org>
Date: Sat, 23 Sep 2023 20:09:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 13/15] mailbox: mediatek: Add mt8188 support for CMDQ
 secure driver
Content-Language: en-US
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Jassi Brar <jassisinghbrar@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
References: <20230918192204.32263-1-jason-jh.lin@mediatek.com>
 <20230918192204.32263-14-jason-jh.lin@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230918192204.32263-14-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Elvis Wang <Elvis.Wang@mediatek.com>, Singo Chang <singo.chang@mediatek.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Jason-ch Chen <jason-ch.chen@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 Johnson Wang <johnson.wang@mediatek.com>, Shawn Sung <shawn.sung@mediatek.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 18/09/2023 21:22, Jason-JH.Lin wrote:
> Add mt8188 support for CMDQ secure driver.
> 
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> ---
>  drivers/mailbox/mtk-cmdq-mailbox.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmdq-mailbox.c
> index 3940b9f8e774..4e047dc916b9 100644
> --- a/drivers/mailbox/mtk-cmdq-mailbox.c
> +++ b/drivers/mailbox/mtk-cmdq-mailbox.c
> @@ -750,6 +750,7 @@ static const struct gce_plat gce_plat_v8 = {
>  	.thread_nr = 32,
>  	.shift = 3,
>  	.control_by_sw = true,
> +	.has_sec = true,

No, you just added it patch ago. Do not add broken code and fix it. Are
there some KPIs in Mediatek to have patch count?

Best regards,
Krzysztof

