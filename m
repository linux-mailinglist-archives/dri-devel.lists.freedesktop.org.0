Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FEDD7DD48B
	for <lists+dri-devel@lfdr.de>; Tue, 31 Oct 2023 18:20:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B9C310E138;
	Tue, 31 Oct 2023 17:20:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com
 [209.85.167.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F93F10E138
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Oct 2023 17:20:44 +0000 (UTC)
Received: by mail-oi1-f181.google.com with SMTP id
 5614622812f47-3b2ea7cc821so4039687b6e.1
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Oct 2023 10:20:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698772844; x=1699377644;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=s8+3OvEfjQ1ZOh8i5uNro/eWl301+Vobeupuf3v4yaM=;
 b=LFeC1JmCHW1H1XJb3woXvuA+tpTFOyUwiufLnaJwfZcXmzGJDm74oCiKMLm0c1BdwZ
 8g4AoeDDD/R3Lb8gkojDhE/Y79ta0EehN0JoZOyFYoCbieuLDM8Do9LQWdOULodP36VF
 E+RKJfA8+q8aW++tBjTPNA+V4U4UssmBGIENDNyTJIwZzF3Jqz44TjxnEub9D3b4+WTI
 WkukDXaE1HUZnwgsqDuoTdw5ssSgBEReeJGJA9J9hCoz5Q6nHx3uc42olQgJRwSZ2wdG
 unHLk/3GltOXORka4d3Q690U8EDfTJ/h7J/S0gBcH4IT7zsq+R4k6t7EpR1lJahuxIfE
 q5ng==
X-Gm-Message-State: AOJu0Yyuh6+bOPQVGMfgAw7uWGHwliul/rznkhC81awLgnTViJ5fh3A/
 g3HrFIRgGDNKN4VhQoFv2w==
X-Google-Smtp-Source: AGHT+IGz/RjS0dxuITvu3VVAWhlbRHi/yN8c+EsRazfPmzlB0JHyujRyURQ9PYb8VuqE36ZzsnxseQ==
X-Received: by 2002:a05:6808:218b:b0:3ae:16b6:6346 with SMTP id
 be11-20020a056808218b00b003ae16b66346mr16940183oib.7.1698772843765; 
 Tue, 31 Oct 2023 10:20:43 -0700 (PDT)
Received: from herring.priv ([4.31.143.193]) by smtp.gmail.com with ESMTPSA id
 dn3-20020a056808618300b003b274008e46sm331948oib.0.2023.10.31.10.20.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Oct 2023 10:20:43 -0700 (PDT)
Received: (nullmailer pid 1762172 invoked by uid 1000);
 Tue, 31 Oct 2023 17:20:42 -0000
Date: Tue, 31 Oct 2023 12:20:42 -0500
From: Rob Herring <robh@kernel.org>
To: Moudy Ho <moudy.ho@mediatek.com>
Subject: Re: [PATCH v9 16/16] dt-bindings: display: mediatek: padding: add
 compatible for MT8195
Message-ID: <169877278691.1760720.771717804140685552.robh@kernel.org>
References: <20231031083357.13775-1-moudy.ho@mediatek.com>
 <20231031083357.13775-17-moudy.ho@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231031083357.13775-17-moudy.ho@mediatek.com>
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
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 devicetree@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Tue, 31 Oct 2023 16:33:57 +0800, Moudy Ho wrote:
> Add a compatible string for the PADDING block in MediaTek MT8195 that
> is controlled by MDP3.
> 
> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
> ---
>  .../bindings/display/mediatek/mediatek,padding.yaml           | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 


Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

If a tag was not added on purpose, please state why and what changed.

Missing tags:

Acked-by: Rob Herring <robh@kernel.org>



