Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BEE516B15A2
	for <lists+dri-devel@lfdr.de>; Wed,  8 Mar 2023 23:53:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBA8510E0B5;
	Wed,  8 Mar 2023 22:53:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com
 [209.85.167.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A3F910E0B5
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Mar 2023 22:53:12 +0000 (UTC)
Received: by mail-oi1-f174.google.com with SMTP id e21so316179oie.1
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Mar 2023 14:53:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678315991;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BuqaB12E/7ngxaZSj8+nNOabs9E8O9u5mS2YqCJwwyM=;
 b=tKr6tMc48dFp0eDAZuNITfI+r6Dg0sRb2TtLQinHX5T+dGorSvZ5L2DIctkJ3PKjzV
 +KaunLYkLmDfUqjg7ub0fBHpbqz74g0VcnYC2ZIq0HOR+D0JBZzi10A3m/oH/gN6d4EE
 snyg2Fl4mz3joINJUvLTV8viCRirMbbx7WJZmjREvtzdzXyJfjnNWi4XUTJ+5NwSH1xf
 OkiHUOdl92LWQpXSeL/ZG25hSXn5hP3vH8RkxcTrGRtKftR+W86v/sFQapJS9EIQPC4s
 nqFQQtj2ox+dQo3iubnzW4ldTcj/x2GrD/HEGt9O5z8dwc+F6r6J/CAy3rUZD1boo7i+
 VQ2Q==
X-Gm-Message-State: AO0yUKVdwb/uLjsMpSz4H/pFJYbdbGtNmUT9RnUmQ7TOcoDvJNgFnDKG
 WWKKaDVCLdunaF8aS/ldtw==
X-Google-Smtp-Source: AK7set/JsmNvMFZfoHYzJSHo/B2HND/OIf4wuhBQxRS2EIhzSv68ARsX30CfkPjJdX71RA0lvZO0nw==
X-Received: by 2002:a05:6808:994:b0:384:2f05:55e7 with SMTP id
 a20-20020a056808099400b003842f0555e7mr8215887oic.55.1678315991298; 
 Wed, 08 Mar 2023 14:53:11 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 y205-20020aca32d6000000b00383eaf88e75sm6883273oiy.39.2023.03.08.14.53.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Mar 2023 14:53:10 -0800 (PST)
Received: (nullmailer pid 4020456 invoked by uid 1000);
 Wed, 08 Mar 2023 22:53:10 -0000
Date: Wed, 8 Mar 2023 16:53:10 -0600
From: Rob Herring <robh@kernel.org>
To: Alexandre Mergnat <amergnat@baylibre.com>
Subject: Re: [PATCH] Fixes dt-bindings: display: mediatek: Fix the fallback
 for mediatek,mt8186-disp-ccorr
Message-ID: <20230308225310.GA4017099-robh@kernel.org>
References: <20230306-ccorr-binding-fix-v1-0-177d81d60c69@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230306-ccorr-binding-fix-v1-0-177d81d60c69@baylibre.com>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 06, 2023 at 02:40:11PM +0100, Alexandre Mergnat wrote:
> The item which have the mediatek,mt8192-disp-ccorr const compatible already
> exist above. Remove duplicated fallback.

Drop 'Fixes ' at the beginning of the subject.

> 
> Fixes: 137272ef1b0f ("dt-bindings: display: mediatek: Fix the fallback for mediatek,mt8186-disp-ccorr")
> 

No blank line here.

> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
> Fix MTK color correction binding
> 
> The fallback compatible has been duplicated in the 137272ef1b0f commit.
> 
> To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> To: Philipp Zabel <p.zabel@pengutronix.de>
> To: David Airlie <airlied@gmail.com>
> To: Daniel Vetter <daniel@ffwll.ch>
> To: Rob Herring <robh+dt@kernel.org>
> To: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> To: Matthias Brugger <matthias.bgg@gmail.com>
> To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-mediatek@lists.infradead.org
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> ---
>  Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml | 3 ---
>  1 file changed, 3 deletions(-)

With the above,

Reviewed-by: Rob Herring <robh@kernel.org>
