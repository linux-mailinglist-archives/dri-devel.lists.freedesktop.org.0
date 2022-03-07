Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 779BB4D0BBF
	for <lists+dri-devel@lfdr.de>; Tue,  8 Mar 2022 00:10:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7337610E193;
	Mon,  7 Mar 2022 23:10:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com
 [209.85.167.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E180289C53
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Mar 2022 23:10:00 +0000 (UTC)
Received: by mail-oi1-f174.google.com with SMTP id j83so6326807oih.6
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Mar 2022 15:10:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=q7OFvF8QvoaAwEulLrSHTEQKk2lZLeNunlxUwtBXEpA=;
 b=2oYfWKQE6VYeGA2CDbgeT8EZjnBf9vGkRw9ipj23gqEz+UFIMKklwdkthswxthVT2f
 IVqbH9j5s3llFF7e1a1Gtvhfm44BNGQjqm3MHYUgBuA8HLsyVFG2dpZfXFfQMvTNb1T3
 SGRC9eKsfqppDDIfZbQ4JefMrjz/WRzMEqAAMUUycsge+GscQslrh5b0a45yA4WWzY0Q
 QwH1rzTj3tXJP34TODrsKKnpFPFa9U4xj65B/pV++KtifzQgdvv7NwAj0oBoknC+ATek
 MdY+X1SDXUbdBQe1s7+JUqhq0TdRdf+tR50R0uyX/OqaQbNswFRb1+AwDjriLRgPo0Gb
 kzZw==
X-Gm-Message-State: AOAM531i1KqmkzuRYlp0aWREcqm2LRAFqjtEgnzUN1zqix0faU5dLChw
 qxiDlfLDeIlSiKcjWSNQ1g==
X-Google-Smtp-Source: ABdhPJx2aqOgx0F/m/kAyOQe60oiTGlU3FIxlP1JXZH8Ai0hS+wkkij5tLqAORKcRorjaDKGXB3e3Q==
X-Received: by 2002:a05:6808:11ca:b0:2d4:6861:2a9e with SMTP id
 p10-20020a05680811ca00b002d468612a9emr894028oiv.114.1646694600159; 
 Mon, 07 Mar 2022 15:10:00 -0800 (PST)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 dy38-20020a056870c7a600b000d9b7eef08csm5547213oab.39.2022.03.07.15.09.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 15:09:59 -0800 (PST)
Received: (nullmailer pid 3433840 invoked by uid 1000);
 Mon, 07 Mar 2022 23:09:58 -0000
Date: Mon, 7 Mar 2022 17:09:58 -0600
From: Rob Herring <robh@kernel.org>
To: Rex-BC Chen <rex-bc.chen@mediatek.com>
Subject: Re: [RESEND V6 4/5] dt-bindings: display: mediatek: add MT8186 SoC
 binding
Message-ID: <YiaQxto4fwmRDDPi@robh.at.kernel.org>
References: <20220303065725.23384-1-rex-bc.chen@mediatek.com>
 <20220303065725.23384-5-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220303065725.23384-5-rex-bc.chen@mediatek.com>
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
Cc: devicetree@vger.kernel.org, chunkuang.hu@kernel.org, airlied@linux.ie,
 jassisinghbrar@gmail.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, yongqiang.niu@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com, fparent@baylibre.com,
 robh+dt@kernel.org, linux-mediatek@lists.infradead.org, hsinyi@chromium.org,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 03 Mar 2022 14:57:24 +0800, Rex-BC Chen wrote:
> Add MT8186 SoC binding to AAL, CCORR, COLOR, DITHER, GAMMA, MUTEX,
> OVL, POSTMASK and RDMA.
> 
> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> ---
>  .../devicetree/bindings/display/mediatek/mediatek,aal.yaml    | 4 ++++
>  .../devicetree/bindings/display/mediatek/mediatek,ccorr.yaml  | 4 ++++
>  .../devicetree/bindings/display/mediatek/mediatek,color.yaml  | 1 +
>  .../devicetree/bindings/display/mediatek/mediatek,dither.yaml | 1 +
>  .../devicetree/bindings/display/mediatek/mediatek,gamma.yaml  | 1 +
>  .../devicetree/bindings/display/mediatek/mediatek,mutex.yaml  | 1 +
>  .../devicetree/bindings/display/mediatek/mediatek,ovl-2l.yaml | 4 ++++
>  .../devicetree/bindings/display/mediatek/mediatek,ovl.yaml    | 4 ++++
>  .../bindings/display/mediatek/mediatek,postmask.yaml          | 4 ++++
>  .../devicetree/bindings/display/mediatek/mediatek,rdma.yaml   | 1 +
>  10 files changed, 25 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
