Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C287E6E6DBA
	for <lists+dri-devel@lfdr.de>; Tue, 18 Apr 2023 22:53:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63EF310E891;
	Tue, 18 Apr 2023 20:53:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com
 [209.85.161.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F5B510E891
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Apr 2023 20:53:21 +0000 (UTC)
Received: by mail-oo1-f51.google.com with SMTP id
 bb7-20020a056820160700b00546d9935668so1089128oob.8
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Apr 2023 13:53:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681851200; x=1684443200;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=h7OwgyFYxvUdy54LeDh4J8bkZyrATaQx+kfaOB/n8Aw=;
 b=DOlmMGOA0r7TFy+Qvq0Rz93jBloSJqKzUPGYgWQt/Fuv4m7idx/sf+3SJ4loeq9Get
 xLE6AwABycp1w/9dh8xKQ5ZlTHu+mtBrF6JOzbdtgHM1XwyT/NcMUtgu7c6ohG4hJfDU
 ik1B4N97PaPA0gpsux5VfMeBsyX4czig+nCrpG8xabRfU7v8ArzPmFIpOCz7k5CoG4p7
 JVvo4DO91enmpKbV47Vt3jgBii953bpuUdupdgxBVVCZW1zhFM2IDn2ngAojww8Svnqk
 zqCn5+iyQFLuvL866+0xg81RwhCcEXhw4PYUtw7JyBZSZa6WM/B5ZLOFjd5KpPgOdaWR
 zWAw==
X-Gm-Message-State: AAQBX9drASReRmXsG2DmCHxGj6had0xlwv6CXIEowwrer1Ub7TRrzKeM
 YNAwhLWbpzAt/jL1/dZ0uw==
X-Google-Smtp-Source: AKy350b/EDQ8ntn392NFJwpfJRHYL6UKPciQC7U7cGvat7A1qfFG6PLLKiTz+v/L8nLz3JGXjYYDtw==
X-Received: by 2002:a4a:410a:0:b0:542:59fb:949e with SMTP id
 x10-20020a4a410a000000b0054259fb949emr6393003ooa.2.1681851200085; 
 Tue, 18 Apr 2023 13:53:20 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 m21-20020a056870a41500b0017b21991355sm6045739oal.20.2023.04.18.13.53.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Apr 2023 13:53:19 -0700 (PDT)
Received: (nullmailer pid 2322029 invoked by uid 1000);
 Tue, 18 Apr 2023 20:53:18 -0000
Date: Tue, 18 Apr 2023 15:53:18 -0500
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] dt-bindings: display: mediatek: simplify compatibles
 syntax
Message-ID: <168185119638.2321910.8021835045798003240.robh@kernel.org>
References: <20230414083311.12197-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230414083311.12197-1-krzysztof.kozlowski@linaro.org>
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
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Fri, 14 Apr 2023 10:33:11 +0200, Krzysztof Kozlowski wrote:
> Lists (items) with one item should be just enum because it is shorter,
> simpler and does not confuse, if one wants to add new entry with a
> fallback.  Convert all of them to enums.  OTOH, leave unused "oneOf"
> entries in anticipation of further growth of the entire binding.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Cc: angelogioacchino.delregno@collabora.com
> ---
>  .../bindings/display/mediatek/mediatek,ccorr.yaml   |  7 +++----
>  .../bindings/display/mediatek/mediatek,color.yaml   | 10 ++++------
>  .../bindings/display/mediatek/mediatek,dither.yaml  |  4 ++--
>  .../bindings/display/mediatek/mediatek,dsc.yaml     |  4 ++--
>  .../bindings/display/mediatek/mediatek,gamma.yaml   |  7 +++----
>  .../bindings/display/mediatek/mediatek,merge.yaml   |  7 +++----
>  .../bindings/display/mediatek/mediatek,od.yaml      |  7 +++----
>  .../bindings/display/mediatek/mediatek,ovl-2l.yaml  |  7 +++----
>  .../bindings/display/mediatek/mediatek,ovl.yaml     | 13 +++++--------
>  .../display/mediatek/mediatek,postmask.yaml         |  4 ++--
>  .../bindings/display/mediatek/mediatek,rdma.yaml    | 13 +++++--------
>  .../bindings/display/mediatek/mediatek,split.yaml   |  4 ++--
>  .../bindings/display/mediatek/mediatek,ufoe.yaml    |  4 ++--
>  .../bindings/display/mediatek/mediatek,wdma.yaml    |  4 ++--
>  14 files changed, 41 insertions(+), 54 deletions(-)
> 

Applied, thanks!

