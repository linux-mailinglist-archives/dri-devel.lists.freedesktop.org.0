Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 189E67DC069
	for <lists+dri-devel@lfdr.de>; Mon, 30 Oct 2023 20:26:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 388BC10E35F;
	Mon, 30 Oct 2023 19:26:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com
 [209.85.160.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B008710E35F
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Oct 2023 19:26:32 +0000 (UTC)
Received: by mail-oa1-f44.google.com with SMTP id
 586e51a60fabf-1dc9c2b2b79so2113556fac.0
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Oct 2023 12:26:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698693992; x=1699298792;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Q/Mg5F6La/20y5nY7HjoLsNGzq3KbPcPoL2CAQLIaos=;
 b=RJaquFVx3o15hmABhZo1AbsqAzcaqQoUldVpd5Utie5G7kBZZ31ny/8agsdVPLngD/
 pnaFkXkS1cw3kX9Gst4XMfAdB83+0VnHvLyxYLkopYpLeE42mfehGA7r2QjDUJcTbSmb
 T6x1LiKnwKMbvkH+yqfZHkHmnU6vVxqExjL1Mkll9GcewV8ySMH2PCTQpqP3BbCclxNx
 3jbJTxzJeXM2jiqGrVBQSl0np4Q6KJQ2B+Whvzg5JfvpVVmtIBvihpgNnQntOsMOoUbY
 I8zuGGyHtxc32pVLEFmgTtfgg7SM332I6/fv0Im0MdkPxXB9sK6ZesQOd4H1FkTLZ2V/
 fETA==
X-Gm-Message-State: AOJu0YxiMQdATiflP6JrOkmhLHQitYIImfdP1TT2JdS6jE17tWhWENQT
 /P31xebSc1iwJFcrqjxS0g==
X-Google-Smtp-Source: AGHT+IGjMO5D8Ov5wU38v/9/dkRYq9nZFsMu08o0lQAqpCGW3B8LLDEUaF6w7sann/7TDndLmBvhpA==
X-Received: by 2002:a05:6870:35d0:b0:1ea:2447:5181 with SMTP id
 c16-20020a05687035d000b001ea24475181mr9546452oak.9.1698693991826; 
 Mon, 30 Oct 2023 12:26:31 -0700 (PDT)
Received: from herring.priv ([2607:fb91:e6c7:c3eb:a6fd:69b4:aba3:6929])
 by smtp.gmail.com with ESMTPSA id
 lh5-20020a05687c350500b001eace5491c8sm1694876oac.18.2023.10.30.12.26.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Oct 2023 12:26:31 -0700 (PDT)
Received: (nullmailer pid 1991165 invoked by uid 1000);
 Mon, 30 Oct 2023 19:26:29 -0000
Date: Mon, 30 Oct 2023 14:26:29 -0500
From: Rob Herring <robh@kernel.org>
To: Moudy Ho <moudy.ho@mediatek.com>
Subject: Re: [PATCH v8 03/16] dt-bindings: media: mediatek: mdp3: add config
 for MT8195 RDMA
Message-ID: <20231030192629.GA1979065-robh@kernel.org>
References: <20231030100022.9262-1-moudy.ho@mediatek.com>
 <20231030100022.9262-4-moudy.ho@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231030100022.9262-4-moudy.ho@mediatek.com>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, linux-media@vger.kernel.org,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-mediatek@lists.infradead.org,
 dri-devel@lists.freedesktop.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Oct 30, 2023 at 06:00:09PM +0800, Moudy Ho wrote:
> Added the configuration for MT8195 RDMA. In comparison to MT8183, it
> no longer shares SRAM with RSZ, and there are now preconfigured 5 mbox.
> 
> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../bindings/media/mediatek,mdp3-rdma.yaml    | 26 ++++++++++++++++++-
>  1 file changed, 25 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml b/Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml
> index c043204cf210..504334a76fb3 100644
> --- a/Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml
> +++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml
> @@ -22,6 +22,7 @@ properties:
>    compatible:
>      enum:
>        - mediatek,mt8183-mdp3-rdma
> +      - mediatek,mt8195-mdp3-rdma
>        - mediatek,mt8195-vdo1-rdma
>  
>    reg:
> @@ -58,7 +59,7 @@ properties:
>  
>    mboxes:
>      minItems: 1
> -    maxItems: 2
> +    maxItems: 5
>  
>    interrupts:
>      maxItems: 1
> @@ -98,6 +99,29 @@ allOf:
>          - mboxes
>          - mediatek,gce-events
>  
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: mediatek,mt8195-mdp3-rdma
> +
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: RDMA clock
> +
> +        mboxes:
> +          items:
> +            - description: used for 1st data pipe from RDMA
> +            - description: used for 2nd data pipe from RDMA
> +            - description: used for 3rd data pipe from RDMA
> +            - description: used for 4th data pipe from RDMA
> +            - description: used for the data pipe from SPLIT

Following the prior comments, add these entries to the top-level 
'mboxes' and then here just put 'minItems: 5'.

Rob
