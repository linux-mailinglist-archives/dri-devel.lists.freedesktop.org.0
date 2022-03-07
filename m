Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 97A324D0BB2
	for <lists+dri-devel@lfdr.de>; Tue,  8 Mar 2022 00:08:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6636A10E18A;
	Mon,  7 Mar 2022 23:08:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com
 [209.85.161.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F3DD10E1C7
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Mar 2022 23:08:42 +0000 (UTC)
Received: by mail-oo1-f53.google.com with SMTP id
 x26-20020a4a9b9a000000b003211029e80fso3296897ooj.5
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Mar 2022 15:08:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=fkg7oi8ypJp3+djSvTk7y0jfuF9EzsvhVs0LqzzSRMk=;
 b=xiI7yn7YPtOoesxIUONFoIpthSw5cQR2e9Ko3yNT92olZuJ4ifY8M88FUAYH6rJttl
 j+YgNTzEhh9vIc6Gk0tIQCbPDTvtJU7rkGKR4aZpGhrr856n4hfhVhGThHaz4esYglCA
 t9nK4BPVQCLIsAQhKGaZqFMVFCvbbQcGnjJ0y1MbgTUdso13qZZagI10ME4jXAyMLERF
 nYedkpwvzorvVKr+RodZSdtxH15z70VzxipQoeYLzvcosg7ePE8i0SkPhAx8XLnc7Zfw
 M2+xcfCuLyJ9hIxlecZ9pgbMv7MXHmzwuDjehqE6xbSwYpZw1nG268IapyHstsI5wXDa
 aEAg==
X-Gm-Message-State: AOAM530b5Mi/fP9jzsvBVbqwbVTo6WpSXKFWWdxr+UvbKg8kfSSSh8LO
 Md+aowJ1k4kycj7kIMzmYQ==
X-Google-Smtp-Source: ABdhPJxGpHsR4FAyDmAlZgdhkDLM1uLBQdtWFxkHCiAQqC2M/strClCm8Qk47svh8X/NY+FmjRMLfQ==
X-Received: by 2002:a05:6870:e88d:b0:da:6cdf:60f1 with SMTP id
 q13-20020a056870e88d00b000da6cdf60f1mr728425oan.285.1646694521354; 
 Mon, 07 Mar 2022 15:08:41 -0800 (PST)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 j25-20020a4ad199000000b003171dfeb5bfsm6144226oor.15.2022.03.07.15.08.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 15:08:40 -0800 (PST)
Received: (nullmailer pid 3431519 invoked by uid 1000);
 Mon, 07 Mar 2022 23:08:39 -0000
Date: Mon, 7 Mar 2022 17:08:39 -0600
From: Rob Herring <robh@kernel.org>
To: Rex-BC Chen <rex-bc.chen@mediatek.com>
Subject: Re: [RESEND V6 2/5] dt-bindings: display: mediatek: revise enum to
 const
Message-ID: <YiaQdyqSvw0Xz6Pv@robh.at.kernel.org>
References: <20220303065725.23384-1-rex-bc.chen@mediatek.com>
 <20220303065725.23384-3-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220303065725.23384-3-rex-bc.chen@mediatek.com>
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

On Thu, 03 Mar 2022 14:57:22 +0800, Rex-BC Chen wrote:
> There won't be more than 1 fallback for these bindings, so we modify
> them to use const instead of enum.
> 
> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> ---
>  .../devicetree/bindings/display/mediatek/mediatek,aal.yaml  | 3 +--
>  .../bindings/display/mediatek/mediatek,ccorr.yaml           | 3 +--
>  .../bindings/display/mediatek/mediatek,color.yaml           | 6 ++----
>  .../bindings/display/mediatek/mediatek,dither.yaml          | 3 +--
>  .../bindings/display/mediatek/mediatek,gamma.yaml           | 3 +--
>  .../devicetree/bindings/display/mediatek/mediatek,ovl.yaml  | 6 ++----
>  .../devicetree/bindings/display/mediatek/mediatek,rdma.yaml | 6 ++----
>  7 files changed, 10 insertions(+), 20 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
