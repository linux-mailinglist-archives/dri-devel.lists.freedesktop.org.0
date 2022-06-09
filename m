Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1E6D54475E
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jun 2022 11:26:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6575112B47;
	Thu,  9 Jun 2022 09:26:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9612D112B39
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jun 2022 09:26:39 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id s1so8434978wra.9
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Jun 2022 02:26:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=doJDwgeNCCpGAVqsr1zYgJtRpwsMml2sELB5t/MLY5M=;
 b=VPq3f0ZdO06SkOgMTlkS3D7YZmul+nXO/J0BjMk+stYpad6L9H5cOp2IBGHQEJn+Sl
 1DMRophNR04WNcXUHOqrs6OdfQB6HANh/JIw0MbdRNMPdyNkUr80U6L24XxRCD+MDAjQ
 b8uHt8YM3EAoR9QEqHA6AWl3jKoB4Qv35ji2cAwqZiUJ19jKK2galnmED0gVBj+49+66
 /qGVkju5ZMhYZOrCdmwHdn/4FpDWyJv/LT9amthGPdsenZoaAJkV3WM4pcG5dhO2/6AC
 O8TCD9uWN5YA+b2+xx6Tzxnp/uPXS1CUQ9z2beYU40E9pslWPHdTUZeMIWzAmccv0CRG
 zrng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=doJDwgeNCCpGAVqsr1zYgJtRpwsMml2sELB5t/MLY5M=;
 b=pGdnqa/7hBJ257yBmbaHheVDfueuiy+Y3KCR1qK63d/0iNvGlqIKgfMHkBS0CL6nJJ
 1munP/ijE1u/84dxsYbZFAxQEbwcNjSj4T2F6cL0LDPem/SqoXcugQ+JJCDX6PK3sktN
 IgJ0CODnslmmAwCFLpEP82oxuUXnGfoMvS8famMMmREYi3X8p4AgaqdRvFIlnkV6Mvrf
 wtotNpeRZTN1Y/si/efjzP/7LAEy7nTMBjSs87f4VV1d/sqC7KK24mTtcVa4wF1t4Qdv
 jagPW1gQz42SI4xcahnJEyCfFJQE4NakeO7vJQQW/tH8LfTGAuMcUEsBMU3suzQgbt8i
 1ZhQ==
X-Gm-Message-State: AOAM533iUhcFiRkf+KJxN/QDLPXNKp9AyCOjjCwla5I9i61Z9SQwgizq
 jUHw2XNUw4PRz6aRQic+WT6abw==
X-Google-Smtp-Source: ABdhPJwHbfMoTUujhvRpFZUQSGO8P5QHWho99EELCVbHKvomYjfYHQdY9sivEWq9/Zf7ddPDSfJWtA==
X-Received: by 2002:adf:f750:0:b0:210:2ef5:7c5c with SMTP id
 z16-20020adff750000000b002102ef57c5cmr36424281wrp.416.1654766797986; 
 Thu, 09 Jun 2022 02:26:37 -0700 (PDT)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175]) by smtp.gmail.com with ESMTPSA id
 b15-20020adfde0f000000b002103136623esm24819171wrm.85.2022.06.09.02.26.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 02:26:37 -0700 (PDT)
Date: Thu, 9 Jun 2022 10:26:35 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: cy_huang <u0084500@gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: backlight: rt4831: Add the new ocp
 level property
Message-ID: <20220609092635.ew3wqfi2uv6d3smj@maple.lan>
References: <1654741339-12756-1-git-send-email-u0084500@gmail.com>
 <1654741339-12756-2-git-send-email-u0084500@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1654741339-12756-2-git-send-email-u0084500@gmail.com>
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 krzysztof.kozlowski+dt@linaro.org, lucas_tsai@richtek.com,
 jingoohan1@gmail.com, deller@gmx.de, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, cy_huang@richtek.com, robh+dt@kernel.org,
 pavel@ucw.cz, lee.jones@linaro.org, linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 09, 2022 at 10:22:18AM +0800, cy_huang wrote:
> From: ChiYuan Huang <cy_huang@richtek.com>
> 
> Add 'richtek,bled-ocp-microamp' property to make it chooseable.
> 
> The wrong backlight ocp level may affect the backlight channel output
> current smaller than configured.
> 
> Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
