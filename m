Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 043D379C9B8
	for <lists+dri-devel@lfdr.de>; Tue, 12 Sep 2023 10:22:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEF9910E3B6;
	Tue, 12 Sep 2023 08:22:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8585B10E3BA
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Sep 2023 08:22:02 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-52bd9ddb741so6825846a12.0
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Sep 2023 01:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694506921; x=1695111721; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=134sTkyIYJwq60odkndkVX6XDM2LNYnyGhf+IscYT2k=;
 b=yIezNcBulqrsrZMdkZVPjBHaTMLRt9MEyFXsnRyPKYyusYchLFQzNCvAQEc+Da72Lu
 vMqAZwvZ+DyYfHg0w1yrWGl3Sc6ssFNsUfkDEjPbUwG0uTl/WrP5EWiz9ibGFsy4ZYuT
 tNxibb5M17i0ojWC7mrsmOBqhUZqYKIgMQYSpIfhlUSv5Sz/34SL/SH3D/Z8hQUnhnir
 7nBhDu5Y4NxoyxJTuQjQ9i9SzbXqT7XrEA48SEYFSo0JUyZU7u3cw8gBSrWR49T21VnZ
 qkBStSp0Tv3aBJqfED0i86tCos7BoMKqlY6JA3qCHovzzcoJfOzkxrcybMWMi/7sc9Ie
 T1tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694506921; x=1695111721;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=134sTkyIYJwq60odkndkVX6XDM2LNYnyGhf+IscYT2k=;
 b=jcugdbIGjiiYEdfJ2BjzfyK1u3dSzty7G4iIDgHt6IYsxU9R6AadrHKR/VxbNihQXM
 HTFPfCE47AKgGSPP3LwGG1LO5M9UPK9veb4oiM8DqKJIwKtFkiRCwXCMpl2mqqPbE/qU
 yq1v0Fiz1X/JEpOIXE18qXrxDI0u6OKB0y40K1c9x4csRU5TGV2xSPuvpUC0Yj+8vjb9
 6CgXVMeD4usTquue7rgRYF5dgYJGMuPX9sSw5+LBweGI3WhwPoDCxopjiSgYe6aszP7i
 hp3DTLJWqM9RzXJcraPhG8yrL5YELiiN+MhQqbrbv3CKhvODHXMTx0k2LKkWQ/xVNyD8
 LBDg==
X-Gm-Message-State: AOJu0YyCh6qDcjBldUzgPhkS0vDRAGfDK8GPsr0a+jdi+Vc7keJ9FJ6f
 0/qRrr8g96q6SayLNTtISnjqiA==
X-Google-Smtp-Source: AGHT+IGYjGp3CXvM/xYQNS9e1ApRDKROqociEYndRpvvCGZhoBavvvSx1h696r7SBp0u74hDwV9oCQ==
X-Received: by 2002:aa7:d8d0:0:b0:52d:212d:78e8 with SMTP id
 k16-20020aa7d8d0000000b0052d212d78e8mr9546980eds.34.1694506920920; 
 Tue, 12 Sep 2023 01:22:00 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.214.188])
 by smtp.gmail.com with ESMTPSA id
 j2-20020aa7ca42000000b0052a401d8ef6sm5611858edt.71.2023.09.12.01.21.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Sep 2023 01:22:00 -0700 (PDT)
Message-ID: <6b7a229d-54c9-2450-4b37-9acc659cbd12@linaro.org>
Date: Tue, 12 Sep 2023 10:21:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v5 11/14] media: platform: mtk-mdp3: add mt8195 platform
 configuration
Content-Language: en-US
To: Moudy Ho <moudy.ho@mediatek.com>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
References: <20230912075805.11432-1-moudy.ho@mediatek.com>
 <20230912075805.11432-12-moudy.ho@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230912075805.11432-12-moudy.ho@mediatek.com>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/09/2023 09:58, Moudy Ho wrote:
> Add MT8195 MDP3 basic configuration in file "mdp_cfg_data.c"
> and corresponding driver data.
> 
> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>

...

>  	{}
>  };
> diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
> index 06b7d2b0b814..8b69bd8b91c6 100644
> --- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
> +++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
> @@ -21,6 +21,9 @@ static const struct of_device_id mdp_of_ids[] = {
>  	{ .compatible = "mediatek,mt8183-mdp3-rdma",
>  	  .data = &mt8183_mdp_driver_data,
>  	},
> +	{ .compatible = "mediatek,mt8195-mdp3-rdma",

You keep adding undocumented compatibles. Your way of organizing patches
does not have any sense. DTS should not be mixed with media subsystem -
they *CANNOT* go via one subsystem. In the same time bindings are always
going via subsystem, so why are they missing here?

This does not make any sense and such mess at v5 is confusing.

Best regards,
Krzysztof

