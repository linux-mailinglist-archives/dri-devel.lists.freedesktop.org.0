Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D3D034C8659
	for <lists+dri-devel@lfdr.de>; Tue,  1 Mar 2022 09:21:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5009510E7EE;
	Tue,  1 Mar 2022 08:21:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A55F710E7EE
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Mar 2022 08:20:59 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 k29-20020a05600c1c9d00b003817fdc0f00so869988wms.4
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Mar 2022 00:20:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=WRV1hdzmbVPmI+jsxWeBooUP3dqnp9gF+cD+vHx37cg=;
 b=lEGyrOVqShVwDCrP9OwQ1wqH3cNhSwBY/RA3nyTHSWosd9CKRn65WtXZkGQIxXOoV2
 3tKXfWL+tYQeBRGzTUeyTWlNqgQsYWUO5hM/p15NNlT7RHT5fJEZfw1k0R7squ4rzMLq
 oLGc7DkzAZ9e1MGlYGb5lkZMcrBTF3ggW7O4mMeZk2FoLk8CVkGWPQ8e8bgUFghAfwYc
 x0LucXz0ANCrW27dz0uKocFaL8UAd0CMQ78/kutKJz9cRPz6Xvq+9XHA2WWiOfYNh0v1
 58rCuFQmNC6WpBqMFTXBPXKPnow9bFSGJ6lRb465rGuqL5lS3Jqd++IYHGNeOQ3t3Bw3
 fELw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=WRV1hdzmbVPmI+jsxWeBooUP3dqnp9gF+cD+vHx37cg=;
 b=jbnWD2WOnQvyhzRiNACoHHr8L1dzXiYpWcUxuwx9IlY2KdlUPiANnoLvajmcPbdksA
 M53l1DxaGRiId0/YG2a/KAf0HAm83KmSYr0FWOqmZAjokrHJUfrKRxXFS2RqgCWHoaHi
 vkPtkJ5e/KmEy7fp+qiVxjGqsQ6wHALdg7ImT2GBCE9yHbr+e1m2cAFiOfx25RSzKDYZ
 LHe5AUvXygO0pK6sQWI4O92f41FfTwYtozN8oQuvsLJaku8iuEhbOEvCnkpWJlYypMOI
 2znbTlXOStUvC/QtQG195rkwGndxTKDFcCih4/APS0nPPR1EW0Z89NdAkCyDKirHSmac
 w4JQ==
X-Gm-Message-State: AOAM532Z95apB4yzXRKGxq9js7CUXgp/W1Vl9E6gpQQpBIzIelvPWqS8
 PVO/6YruyUxUkeaq2IJ3528=
X-Google-Smtp-Source: ABdhPJyCpmc78vN+pezWK67t1FYNLGkgoN6qM29kWj+87E3PvpdqVAibBMsy8mhmLh6JcdkxKJsYfA==
X-Received: by 2002:a05:600c:1c1c:b0:381:45b4:3f69 with SMTP id
 j28-20020a05600c1c1c00b0038145b43f69mr11293245wms.86.1646122858205; 
 Tue, 01 Mar 2022 00:20:58 -0800 (PST)
Received: from [192.168.2.177] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 a8-20020a056000100800b001e30ef6f9basm18395498wrx.18.2022.03.01.00.20.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Mar 2022 00:20:57 -0800 (PST)
Message-ID: <ea9ce41d-df1e-bec9-1c1d-e132698684ec@gmail.com>
Date: Tue, 1 Mar 2022 09:20:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH V5 1/6] dt-bindings: arm: mediatek: mmsys: add support for
 MT8186
Content-Language: en-US
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, chunkuang.hu@kernel.org,
 robh+dt@kernel.org
References: <20220301080105.31323-1-rex-bc.chen@mediatek.com>
 <20220301080105.31323-2-rex-bc.chen@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220301080105.31323-2-rex-bc.chen@mediatek.com>
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
Cc: devicetree@vger.kernel.org, airlied@linux.ie, jassisinghbrar@gmail.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 yongqiang.niu@mediatek.com, Project_Global_Chrome_Upstream_Group@mediatek.com,
 fparent@baylibre.com, linux-mediatek@lists.infradead.org, hsinyi@chromium.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 01/03/2022 09:01, Rex-BC Chen wrote:
> Add "mediatek,mt8186-mmsys" to binding document.
> 
> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> Acked-by: Rob Herring <robh@kernel.org>

Applied, thanks!

> ---
>   .../devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml         | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
> index 763c62323a74..b31d90dc9eb4 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
> @@ -29,6 +29,7 @@ properties:
>                 - mediatek,mt8167-mmsys
>                 - mediatek,mt8173-mmsys
>                 - mediatek,mt8183-mmsys
> +              - mediatek,mt8186-mmsys
>                 - mediatek,mt8192-mmsys
>                 - mediatek,mt8365-mmsys
>             - const: syscon
