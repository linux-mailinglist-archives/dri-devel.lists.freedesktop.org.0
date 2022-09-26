Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3857C5EB3A8
	for <lists+dri-devel@lfdr.de>; Mon, 26 Sep 2022 23:54:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 346B410E7D3;
	Mon, 26 Sep 2022 21:54:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com
 [209.85.210.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5EA010E7D3
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Sep 2022 21:54:42 +0000 (UTC)
Received: by mail-ot1-f47.google.com with SMTP id
 e24-20020a05683013d800b0065be336b8feso5317941otq.8
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Sep 2022 14:54:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=w2QQwnQgmCoCtfJGgTC/b/2B1KxxxneV73oIJQj+vXs=;
 b=dQiVpPRsNQDlHEtD8R/1CM/n84RQBotky6+Fn8Zutq+gDzBnIk97WTz7fNP4pMJ6Dh
 ZkkcJedbJUTkYupcLoLKCcJEafPRqmUUc5B2Z06PbopLtkNyPpVNxcyHNR4sHcWGnWEw
 3gAJQsEj+90kXe6Fj6xcUe2MEGOdmPeqRYQg+SqDp+d7m/2mXsZsJicECq8Rr6kVE8up
 XeOa2AYkUZSa+5RCBuytbPVa9OHe2UAL5zuysrCTyeH0l6GcP84jnH8Lim5RbmiJQWS/
 /Cqcg9yWrqSj3S0g8y0QenrSYZHex1QvTdQrc4ZBoF3kM9+CDPAQYIdwU0BKHTXUxgbg
 KSlA==
X-Gm-Message-State: ACrzQf3oy6bNqposxTH72RlDZVpu07+8uZSxL6OsLbRUhaAnVIHBLbF1
 dr8vuk3GUafip/8Qe/SVLw==
X-Google-Smtp-Source: AMsMyM6bmE7R0bTAstFX4jVboHAVQz30IQaE1gTw1Ch1FS7J/e50TEWed28r2+CwdBjQaLYnUzf7RA==
X-Received: by 2002:a9d:6e0f:0:b0:655:f372:f18b with SMTP id
 e15-20020a9d6e0f000000b00655f372f18bmr11294695otr.206.1664229281970; 
 Mon, 26 Sep 2022 14:54:41 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 bm43-20020a0568081aab00b0034d14c6ce3dsm7615607oib.16.2022.09.26.14.54.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Sep 2022 14:54:41 -0700 (PDT)
Received: (nullmailer pid 2894496 invoked by uid 1000);
 Mon, 26 Sep 2022 21:54:40 -0000
Date: Mon, 26 Sep 2022 16:54:40 -0500
From: Rob Herring <robh@kernel.org>
To: "liangxu.xu" <liangxu.xu@mediatek.com>
Subject: Re: [PATCH] dt-bindings: display: mediatek: dp: Add compatible for
 MediaTek MT8188
Message-ID: <20220926215440.GA2888681-robh@kernel.org>
References: <20220923013953.5043-1-liangxu.xu@mediatek.com>
 <f6e669dd-f2cf-6e3f-18bb-25b21e5eab0c@linaro.org>
 <2afb5b7f761c7931eaf93f2f8a0fd268a39e1b02.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2afb5b7f761c7931eaf93f2f8a0fd268a39e1b02.camel@mediatek.com>
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
Cc: chunkuang.hu@kernel.org, jitao.shi@mediatek.com, devicetree@vger.kernel.org,
 airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-mediatek@lists.infradead.org, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 26, 2022 at 10:52:04AM +0800, liangxu.xu wrote:
> On Fri, 2022-09-23 at 13:16 +0200, Krzysztof Kozlowski wrote:
> > On 23/09/2022 03:39, liangxu.xu@mediatek.com wrote:
> > > From: liangxu xu <liangxu.xu@mediatek.com>
> > > 
> > > Add dt-binding documentation of dp for MediaTek MT8188 SoC.
> > > 
> > > Signed-off-by: liangxu xu <liangxu.xu@mediatek.com>
> > > ---
> > 
> > Where is the DTS? Where are driver changes?
> > 
> > Best regards,
> > Krzysztof
> > 
> 
> Hi Krzysztof:
> 
> If you want to see the synchronous changes of dts and binding files,
> then I will attach this binding file changes when sending dts later.
> 
> The driver change of mt8188 reuses that of mt8195. The driver link is
> as follows:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/gpu/drm/mediatek/mtk_dp.c?id=48f4230642ee32a97ddf4be492838ce96089f040

So the 8188 block is backwards compatible with the 8195 block? 
That's good, but not what your schema says because you have not defined 
a fallback compatible for the driver to use.

Rob
