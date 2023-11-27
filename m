Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E3B57FA85B
	for <lists+dri-devel@lfdr.de>; Mon, 27 Nov 2023 18:53:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1737810E0C1;
	Mon, 27 Nov 2023 17:53:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com
 [209.85.161.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7052110E0C1
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Nov 2023 17:53:13 +0000 (UTC)
Received: by mail-oo1-f53.google.com with SMTP id
 006d021491bc7-58d54612d9cso1220578eaf.1
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Nov 2023 09:53:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701107592; x=1701712392;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gXEZGcv8bSxQjKfcCrALAvNXAs+CKpToCxY7DnKjWaE=;
 b=SZsfnR+vblyJwcwQTSey2pyzGTH+oBDdqLhwmf7Emz5lqSJ3xPgfuWehFF5Gsl8NL+
 FuOY5lTedOmWdu32dIpVonJ4NNRzP4qptOOnpTVk7TTMFkV6SyiVFnNnzKuOwMuMEazg
 48tC4UkP2sbmYxm36QOjisasRzJ6atRta1haOBmIfOp+xBkezjqah4jO5S70dIqnleCx
 +LKqrU22hLDYwnefL3L+edRxpZ+mLCNt+xopoU+Mz0dMd7wRZpvu2l7KcozSDyjUYW+K
 DfIp577DLVvWCIKXyHki8HbG4N7rniq36Ccj1gioOWtTgG2/bwhOfr0yLrbpW3R0XIaI
 v8Jg==
X-Gm-Message-State: AOJu0YywF3kI+vMaqyCTgD3v3NFxXzplhWUm0JX3WIIJfZTkwr29XTng
 8ESPPF50DzNZGOcggsHnSQ==
X-Google-Smtp-Source: AGHT+IHqCcFjtcM7hpVFdO1GU5tjNNQyP+pOeAzsBXWkues29+89h8GwQNH+gICSaOfRfB6G2/lWGA==
X-Received: by 2002:a05:6820:514:b0:58d:9d79:abc with SMTP id
 m20-20020a056820051400b0058d9d790abcmr2490913ooj.1.1701107592638; 
 Mon, 27 Nov 2023 09:53:12 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 i14-20020a4aab0e000000b0057327cecdd8sm1545477oon.10.2023.11.27.09.53.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Nov 2023 09:53:11 -0800 (PST)
Received: (nullmailer pid 1865094 invoked by uid 1000);
 Mon, 27 Nov 2023 17:53:10 -0000
Date: Mon, 27 Nov 2023 11:53:10 -0600
From: Rob Herring <robh@kernel.org>
To: Michael Walle <mwalle@kernel.org>
Subject: Re: [PATCH] dt-bindings: display: mediatek: dsi: remove Xinlei's mail
Message-ID: <170110758909.1864817.4462999891137574457.robh@kernel.org>
References: <20231123134927.2034024-1-mwalle@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231123134927.2034024-1-mwalle@kernel.org>
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
 Jitao Shi <jitao.shi@mediatek.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Maxime Ripard <mripard@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Thu, 23 Nov 2023 14:49:27 +0100, Michael Walle wrote:
> Xinlei Lee's mail is bouncing:
> 
> <xinlei.lee@mediatek.com>: host mailgw02.mediatek.com[216.200.240.185] said:
>     550 Relaying mail to xinlei.lee@mediatek.com is not allowed (in reply to
>     RCPT TO command)
> 
> Remove it.
> 
> Signed-off-by: Michael Walle <mwalle@kernel.org>
> ---
>  .../devicetree/bindings/display/mediatek/mediatek,dsi.yaml       | 1 -
>  1 file changed, 1 deletion(-)
> 

Applied, thanks!

