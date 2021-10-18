Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC072431D59
	for <lists+dri-devel@lfdr.de>; Mon, 18 Oct 2021 15:48:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B50EF6E0EE;
	Mon, 18 Oct 2021 13:48:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com
 [209.85.210.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8DF86E053;
 Mon, 18 Oct 2021 13:48:27 +0000 (UTC)
Received: by mail-ot1-f45.google.com with SMTP id
 34-20020a9d0325000000b00552cae0decbso1479487otv.0; 
 Mon, 18 Oct 2021 06:48:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=P9P7R1XNzEWBUr0hzeiahpDSW/aXqZDcmDtXm87uoN4=;
 b=s3IzuozXKmbQhCNXhnYVBEY2lefX+9QTZw236vk85QdRzE6Ga3Qed2JBzX/ebJF2Td
 jNjThWrE9nBaikEj4whQDMtySgYYyxhG/lcWJaK91MxMyQx+xpBYZsEqyiWLBJgxY1vB
 43st++RZHKzZ0i3OxHEAr4aQPsxhxvcyVnI3NADNc/tyg8DUZSv4kQr9DQO4SWLw5EQo
 5gV9Su/mpK7Rteqw0ze1I5ePXtCIVW9v9vQgG4npYMvEpXxAKZtM0Hfwv/+ltZWGAD9n
 Rsk2/hIHY3w9UKY1+0xejH5XX3ChOfyOqxKGx9ykJ/w8rha/xAeg0imOLDin1u2lzQ9g
 l95w==
X-Gm-Message-State: AOAM531TNgzL7GxyAES4KFlG0O/tDI3YkxRwOKaJdLSQdncKHfHGp26Q
 gU+L1Rpz3vYLt5Y5n2NnpQ==
X-Google-Smtp-Source: ABdhPJxrOvcBDwbkAPoOwt5BNMvnFSy5s+melOXyqckSyfS8b8a5yyiBvF2I+Uf9OjhpGATCsxYEVQ==
X-Received: by 2002:a9d:6346:: with SMTP id y6mr6554691otk.154.1634564904980; 
 Mon, 18 Oct 2021 06:48:24 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id z8sm2439731oof.47.2021.10.18.06.48.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Oct 2021 06:48:24 -0700 (PDT)
Received: (nullmailer pid 2251980 invoked by uid 1000);
 Mon, 18 Oct 2021 13:48:23 -0000
Date: Mon, 18 Oct 2021 08:48:23 -0500
From: Rob Herring <robh@kernel.org>
To: David Heidelberg <david@ixit.cz>
Cc: Daniel Vetter <daniel@ffwll.ch>, ~postmarketos/upstreaming@lists.sr.ht,
 Sean Paul <sean@poorly.run>, ~okias/devicetree@lists.sr.ht,
 linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Rob Clark <robdclark@gmail.com>, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>
Subject: Re: [PATCH v6] dt-bindings: drm/msm/gpu: convert to YAML
Message-ID: <YW17J03XTvJgfBfj@robh.at.kernel.org>
References: <20211017144350.70295-1-david@ixit.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211017144350.70295-1-david@ixit.cz>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 17 Oct 2021 16:43:50 +0200, David Heidelberg wrote:
> Conversion of text binding for Adreno GPU to the YAML format.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
> v2:
>   - added compatbile description from Rob Clark
>   - dropped reg description
>   - reg numbers increased to 3 (since we also have uncommon cx_dbgc)
>   - specified interconnect-names items range
>   - defined zap-shader as an object and added it's properties
>   - enforce 0 clocks for Andreno >= 6xx since it's defined in GMU node
> 
> v3:
>  - fix patterns (add backslash before dot)
>  - add additional clocks
>  - adreno@ -> gpu@
>  - add few const and change enum to anyOf
>  - added clock & clock-names placeholder in non-conditional part
>  (description)
> 
> v4:
>  - clock & clock-names - true,false instead maxItems
>  - impl. #stream-id-cells, nvmem-cell-names, nvmem-cells
>  - dropped requirement on firmware-name in zap_shader
> 
> v5:
>  - maxOtems -> maxItems typo fix
> 
> v6:
>  - enum -> const to fix ordering
>  - opp-table is object
>  - spacing
>  - drop undocumented and unused #stream-id-cells
> 
>  .../devicetree/bindings/display/msm/gpu.txt   | 157 ----------
>  .../devicetree/bindings/display/msm/gpu.yaml  | 288 ++++++++++++++++++
>  2 files changed, 288 insertions(+), 157 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/msm/gpu.txt
>  create mode 100644 Documentation/devicetree/bindings/display/msm/gpu.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
