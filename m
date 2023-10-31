Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D66C7DD59C
	for <lists+dri-devel@lfdr.de>; Tue, 31 Oct 2023 18:55:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84ED010E5A3;
	Tue, 31 Oct 2023 17:55:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com
 [209.85.167.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0736710E5A3
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Oct 2023 17:55:29 +0000 (UTC)
Received: by mail-oi1-f179.google.com with SMTP id
 5614622812f47-3b2f2b9a176so3871890b6e.0
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Oct 2023 10:55:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698774928; x=1699379728;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cghi8HzRqMQtZYMVfq+8g/GwoACch6SchmkRjnW1zRM=;
 b=Ms3uXOyBGuOMAUI2pLSp2ESmlYlKMnDcYbi7KxSiAu+U8B+WecbliecFoArDuKBiD5
 RJZKwpsBHxJFCAjJ4tZZNHMxOY+VJlRHB/K8sjHtHa5PqigPqPY07iym/FKEVyOk2jo/
 jUsvl1nJcP8E0XrrgrvmElrTNi687dF770EhT6NAkOa3EG3k79+/gdwMvp379CCwi2GJ
 9mKRuU0wo7WyKowZoKLquauLjTFWIGexVrhk+UdiflnBpRUi2+b9ecSsK3XqMW4xbEYA
 8b03C6OrnaAfY1CBfdAKhdMxN+D/7N4+tUnZ4TE+VzwpboH0isDsD/8sl6RNDCQNUlrg
 iKRg==
X-Gm-Message-State: AOJu0YyoaIJ6e3DhbM4Fj5zeZQASpwjGdgtiD07F28h1H9a4/O8079DO
 nb3sg5GPx0pvUXp8im+N+Q==
X-Google-Smtp-Source: AGHT+IEzgDoWb29ZJLyxAQR/UtzwH60FOikEPz4ULoPEiWOeX2qzVl3h09iHl3uA/9qvyP/m3aTQpw==
X-Received: by 2002:aca:d03:0:b0:3ae:126b:8bfc with SMTP id
 3-20020aca0d03000000b003ae126b8bfcmr13403099oin.4.1698774928201; 
 Tue, 31 Oct 2023 10:55:28 -0700 (PDT)
Received: from herring.priv ([4.31.143.193]) by smtp.gmail.com with ESMTPSA id
 z3-20020a056808048300b003b2e7231faasm328109oid.28.2023.10.31.10.55.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Oct 2023 10:55:27 -0700 (PDT)
Received: (nullmailer pid 1810151 invoked by uid 1000);
 Tue, 31 Oct 2023 17:55:26 -0000
Date: Tue, 31 Oct 2023 12:55:26 -0500
From: Rob Herring <robh@kernel.org>
To: Moudy Ho <moudy.ho@mediatek.com>
Subject: Re: [PATCH v9 03/16] dt-bindings: media: mediatek: mdp3: add config
 for MT8195 RDMA
Message-ID: <169877492598.1810050.14443640728512842209.robh@kernel.org>
References: <20231031083357.13775-1-moudy.ho@mediatek.com>
 <20231031083357.13775-4-moudy.ho@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231031083357.13775-4-moudy.ho@mediatek.com>
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
 Thomas Zimmermann <tzimmermann@suse.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Tue, 31 Oct 2023 16:33:44 +0800, Moudy Ho wrote:
> Added the configuration for MT8195 RDMA. In comparison to MT8183, it
> no longer shares SRAM with RSZ, and there are now preconfigured 5 mbox.
> 
> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../bindings/media/mediatek,mdp3-rdma.yaml    | 21 +++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

