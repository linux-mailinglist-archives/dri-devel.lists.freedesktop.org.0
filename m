Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E56842167E
	for <lists+dri-devel@lfdr.de>; Mon,  4 Oct 2021 20:29:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85F036EA8A;
	Mon,  4 Oct 2021 18:29:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com
 [209.85.161.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB27E6EA8A;
 Mon,  4 Oct 2021 18:29:42 +0000 (UTC)
Received: by mail-oo1-f44.google.com with SMTP id
 v17-20020a4ae051000000b002b5a56e3da3so5654487oos.2; 
 Mon, 04 Oct 2021 11:29:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=FSknb9XucRZhO/00BM6q8xI5pafRYeo3fmHNydtNnM0=;
 b=5tJ7RZThZ2Gh5o0KcQ3lrtLKgZZm6FKAkWjFM1g0eQsinfPeTqLVnORDHPQDBNnPT/
 jPEDh1Yo+Kx5ZJLQOS29lED1GwltfA2SEI2OLX6mLIa64MDc6UktiQW/HvvrDgt7lnAN
 3zHwq2qbHkXJ4ZuoHpsJvGRDoJpE98VYbS0O1s1pKcMGHV7/HfOJDWwIsXeD/crrvgQT
 86rqRpjnNKMucDHSGbpYJc3xEsTPFDokmuCu9fshaa7hDaFIEZQ9nxOU/APBCg71rr0Q
 3PpUV8H6TwgDMXb44DgEKjYmcWjjoF908zuZvX93jVv9XuZMUWR0AwwGbZ8xY1pAIYx/
 pP5w==
X-Gm-Message-State: AOAM532j363nYeGZ59HZ4pQxUD7QGUVLTC/J73sGCUBELXA2dXNSrUqa
 8RSrYMfhQIXeNNrzJ3pCZA==
X-Google-Smtp-Source: ABdhPJwuTkETkHYNHgbb6MaD/3AdXAmRL9R4LDUql91q1Gowx5uviZJ/UMF/CcvKt6jC2ED9RpnzbQ==
X-Received: by 2002:a4a:da41:: with SMTP id f1mr10336324oou.45.1633372181940; 
 Mon, 04 Oct 2021 11:29:41 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id e2sm2925851ooh.40.2021.10.04.11.29.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Oct 2021 11:29:41 -0700 (PDT)
Received: (nullmailer pid 1614180 invoked by uid 1000);
 Mon, 04 Oct 2021 18:29:40 -0000
Date: Mon, 4 Oct 2021 13:29:40 -0500
From: Rob Herring <robh@kernel.org>
To: Sireesh Kodali <sireeshkodali1@gmail.com>
Cc: devicetree@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 linux-kernel@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Sean Paul <sean@poorly.run>,
 ~postmarketos/upstreaming@lists.sr.ht, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, phone-devel@vger.kernel.org,
 Krishna Manikandan <mkrishn@codeaurora.org>
Subject: Re: [PATCH v3 1/3] dt-bindings: msm: dsi: Add MSM8953 dsi phy
Message-ID: <YVtIFGfBnJB7Qd0n@robh.at.kernel.org>
References: <20210928131929.18567-1-sireeshkodali1@gmail.com>
 <20210928131929.18567-2-sireeshkodali1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210928131929.18567-2-sireeshkodali1@gmail.com>
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

On Tue, 28 Sep 2021 18:49:27 +0530, Sireesh Kodali wrote:
> SoCs based on the MSM8953 platform use the 14nm DSI PHY driver
> 
> Signed-off-by: Sireesh Kodali <sireeshkodali1@gmail.com>
> ---
>  Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
