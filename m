Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0712A507119
	for <lists+dri-devel@lfdr.de>; Tue, 19 Apr 2022 16:57:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6AF310EF13;
	Tue, 19 Apr 2022 14:57:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A93D10EF08
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Apr 2022 14:57:54 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 c190-20020a1c35c7000000b0038e37907b5bso1776353wma.0
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Apr 2022 07:57:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=VSfNNxCMPbot3TUeMFQDYDmYhnDExeycdgTmMkPBSiw=;
 b=K89+PXfaCFu09OY7bsgh+7qQX9SHhTwwKvG8GnMvsy4nm507xqyK3sHZ67MuOBouWK
 4rkUK91/51WwE/E/BbtbqNlYpk2W+/m+3Chgf1DgQ/4ZxSP0s1wqpSXNl7+UdgoWj+Xs
 DJy4bCzYn6/vlOL+ZNY9yNQOs/kv50OdjLzRncPuI5wSrw+ftTvwxvHd1FHSO3Lksu+l
 gBhsZjxwGFJya6sN2Lt1XOMX7olBrNleXGG5RLgiKeUMjp6130k6KNYzjV95UMRI84s7
 H+NLnzuto2Whpp86h7jTvQ96wMZQqVnrQDa2fWzSRA2L9LVCV6/K5Tlwf7tuM/Cl+x+g
 jazw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=VSfNNxCMPbot3TUeMFQDYDmYhnDExeycdgTmMkPBSiw=;
 b=aziWO+nKvRaPLCMDv0vQcLfK6wdKi4NmauZ+RHLZY9p6Je/1USGM3t5rBzhaUtIM6f
 xsr1GmmCGbJy3pdMOdYVVOxc8cGIGNcZnNOiRbEJqrHkBXWjREDbC1WUWmeU1FlIZuiy
 9BeLqV8yRcApfq7XHZpaw3EK0CQV7b0iDdM4W0xrnNPCp+vfa/QEOy+ApXshWNTd19z0
 zscyA8mICDwysGos4xs/MIbDMikUooXeboGX9qxnfkl5uPHZFm5ZmUEZa/Xnc2B9OCfP
 fYjvWxE+m1q2xfmpwztK3qG/TX6NCZ7FtbPDTrPPoXTmZVsW1reOL0IToboyIonmYq1e
 Q6Qw==
X-Gm-Message-State: AOAM531NKOLIL6+5K+9H3Ek2WfC4VDCG7kKnVwxa6nyYFcM0kQlnTHvt
 CtTjgUvWXd9asOXko/jINgI=
X-Google-Smtp-Source: ABdhPJwGtnkzLvabPxjsO/IdFw1I83x6czWqIQw5VNsuYzxUmENRbL2f1OWVQ5C8fTTybXwA29UdQg==
X-Received: by 2002:a05:600c:2197:b0:38e:b80c:526a with SMTP id
 e23-20020a05600c219700b0038eb80c526amr19889290wme.76.1650380272642; 
 Tue, 19 Apr 2022 07:57:52 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 o10-20020a5d47ca000000b0020a992ce36esm4933973wrc.1.2022.04.19.07.57.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Apr 2022 07:57:51 -0700 (PDT)
Message-ID: <db521557-09ea-2c34-24e5-3bf71961b4fe@gmail.com>
Date: Tue, 19 Apr 2022 16:57:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 2/5] dt-bindings: arm: mediatek: mmsys: add mt8195 SoC
 binding
Content-Language: en-US
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de
References: <20220419033237.23405-1-rex-bc.chen@mediatek.com>
 <20220419033237.23405-3-rex-bc.chen@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220419033237.23405-3-rex-bc.chen@mediatek.com>
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
Cc: devicetree@vger.kernel.org, airlied@linux.ie, jason-jh.lin@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, nancy.lin@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 19/04/2022 05:32, Rex-BC Chen wrote:
> From: "jason-jh.lin" <jason-jh.lin@mediatek.com>
> 
> In the SoC before, such as mt8173, it has 2 pipelines binding to one
> mmsys with the same clock driver and the same power domain.
> 
> In mt8195, there are 4 pipelines binding to 4 different mmsys, such as
> vdosys0, vdosys1, vppsys0 and vppsys1.
> Each mmsys uses different clock drivers and different power domain.
> 
> Since each mmsys has its own mmio base address, they could be identified
> by their different address during probe time.
> 
> Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Applied, thanks

> ---
>   .../devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml         | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
> index 6c2c3edcd443..6ad023eec193 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
> @@ -31,6 +31,7 @@ properties:
>                 - mediatek,mt8183-mmsys
>                 - mediatek,mt8186-mmsys
>                 - mediatek,mt8192-mmsys
> +              - mediatek,mt8195-mmsys
>                 - mediatek,mt8365-mmsys
>             - const: syscon
>         - items:
