Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4727A302BB7
	for <lists+dri-devel@lfdr.de>; Mon, 25 Jan 2021 20:36:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 516E06E0CA;
	Mon, 25 Jan 2021 19:36:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com
 [209.85.210.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95F3D6E0CA
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jan 2021 19:36:07 +0000 (UTC)
Received: by mail-ot1-f42.google.com with SMTP id n42so13904872ota.12
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jan 2021 11:36:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=mH2q1AZz5irHrvq/3t1+Obhg0JHH2TFjERBNOT0hM0Q=;
 b=E3L1aODSwSBLkdDvQPGdPw+Lf1Z5AFqa8NkURfAdhHREQ0vOvPC7R4JytUDvoTAaT3
 l5+/YmZa7RZeqU/54dTkTlOdptu0h0vuJz/B+C2z7RmDOFHEgbc831J5XcPkjDmhyxht
 PwsfXokD2B0Kg0qEtHRdx/m05bVYr3qAOx3FAVZd4ddu5/qapaBpxFfA5pPXLoIexxfp
 NOO9OV9/t3ETJSWyWk/Sl8BRXKm9TGjop9Fvo1dNVLxWVMfA3HCTKQGnSeaFzY1NY4Mk
 ItABmElluUw7pwM3kgvedf5QrNDRLQBDT/NSztTXRiy/IaW34iPptUsZxhz/HjzbOZC9
 09ZA==
X-Gm-Message-State: AOAM533xkIoJ+/6vzcpeJ3c2+eSzDv0l+vtT7Roy/n9ATb3yqqRQBs4w
 K0W6zSxOpE4Ko/0SO/h6yA==
X-Google-Smtp-Source: ABdhPJwBqs6kpkcYrx/aXfe/1e/07a9bQgMjrd1YtHP4Jbg6s9G1TE28GLJ8saSbZE8IZ5BXrEU1qg==
X-Received: by 2002:a05:6830:2f3:: with SMTP id
 r19mr1513671ote.299.1611603366943; 
 Mon, 25 Jan 2021 11:36:06 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id z4sm551224ooz.5.2021.01.25.11.36.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Jan 2021 11:36:06 -0800 (PST)
Received: (nullmailer pid 830007 invoked by uid 1000);
 Mon, 25 Jan 2021 19:36:04 -0000
Date: Mon, 25 Jan 2021 13:36:04 -0600
From: Rob Herring <robh@kernel.org>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: Re: [PATCH 22/24] dt-bindings: memory: mediatek: update mediatek,
 smi-larb.yaml references
Message-ID: <20210125193604.GA829546@robh.at.kernel.org>
References: <cover.1610535349.git.mchehab+huawei@kernel.org>
 <c70bd79b311a65babe7374eaf81974563400a943.1610535350.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c70bd79b311a65babe7374eaf81974563400a943.1610535350.git.mchehab+huawei@kernel.org>
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
Cc: Bin Liu <bin.liu@mediatek.com>, devicetree@vger.kernel.org,
 Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
 Rick Chang <rick.chang@mediatek.com>, Jonathan Corbet <corbet@lwn.net>,
 David Airlie <airlied@linux.ie>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 linux-kernel@vger.kernel.org, Houlong Wei <houlong.wei@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 13 Jan 2021 11:59:23 +0100, Mauro Carvalho Chehab wrote:
> Changeset 27bb0e42855a ("dt-bindings: memory: mediatek: Convert SMI to DT schema")
> renamed: Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.txt
> to: Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml.
> 
> Update its cross-references accordingly.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  .../devicetree/bindings/display/mediatek/mediatek,disp.txt      | 2 +-
>  .../devicetree/bindings/media/mediatek-jpeg-decoder.txt         | 2 +-
>  .../devicetree/bindings/media/mediatek-jpeg-encoder.txt         | 2 +-
>  Documentation/devicetree/bindings/media/mediatek-mdp.txt        | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)
> 

Applied, thanks!
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
