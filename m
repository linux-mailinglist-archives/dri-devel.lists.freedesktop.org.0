Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F1B9A4128E2
	for <lists+dri-devel@lfdr.de>; Tue, 21 Sep 2021 00:30:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 430696E892;
	Mon, 20 Sep 2021 22:30:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com
 [209.85.210.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B56206E892
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Sep 2021 22:30:20 +0000 (UTC)
Received: by mail-ot1-f52.google.com with SMTP id
 l7-20020a0568302b0700b0051c0181deebso25652181otv.12
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Sep 2021 15:30:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=8FCmNHtt11QLhSvmcLvs+zJc97YSOXkXRIB2hIvlHIs=;
 b=PN5dl46VIfY+z+fq6qyQqb5VcGuY5pCsN8AtTYdQ6Dw5eAz5J9QfwIsNHFSgv40Nqv
 pdfNfOR5RiJ5HItqQvPz5eG+hnGIxxWEHi738dRU9yLtjMpZJr4+YuyC4vgJTvbWjvc2
 ooOA++ymmXV9vi7GJLanj7QaSYNVzHFiDXI7v3tzvIYS0Qcuw+36ji85WtbPDhpOa/4l
 h21kzlzr0Cckan8qjdieXaD0rdA2bIb8oWSM6Nmj8pjZRkOOlNOudhK6MbLkUdRuULpi
 eN31qlIE4UhYrtxUsa98d7Xt4wzcc9+7ZK65zbAOqom14y2+mXjtl2zNAQIC0FpSwipH
 ItuQ==
X-Gm-Message-State: AOAM533t0yX8v9PklrtxXqiZc1IjkaYkmRGbmzqP75ZKFbRPrHhLVVc8
 3Mctn0HMHm1XM8hg7dUOkw==
X-Google-Smtp-Source: ABdhPJycZrI/QFeDTsrcWnT2z08c9jZQ4XXTbR5wI4O9KMU9KzoF0bMQ1Q22QmcRRJGdaUkvVLXHnA==
X-Received: by 2002:a9d:601a:: with SMTP id h26mr3947732otj.326.1632177020062; 
 Mon, 20 Sep 2021 15:30:20 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id 186sm3719698ood.39.2021.09.20.15.30.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Sep 2021 15:30:19 -0700 (PDT)
Received: (nullmailer pid 916414 invoked by uid 1000);
 Mon, 20 Sep 2021 22:30:18 -0000
Date: Mon, 20 Sep 2021 17:30:18 -0500
From: Rob Herring <robh@kernel.org>
To: Cai Huoqing <caihuoqing@baidu.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: panel: ilitek,ili9341: Fix the
 warning-wrong indentation: expected 10 but found 8 (indentation)
Message-ID: <YUkLehSRd0eFlV2t@robh.at.kernel.org>
References: <20210908030215.112-1-caihuoqing@baidu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210908030215.112-1-caihuoqing@baidu.com>
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

On Wed, Sep 08, 2021 at 11:02:14AM +0800, Cai Huoqing wrote:
> Fix indentation for the warning-
> wrong indentation: expected 10 but found 8 (indentation)
> 
> Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
> ---
>  .../devicetree/bindings/display/panel/ilitek,ili9341.yaml       | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Already have a similar patch queued up.

Rob
