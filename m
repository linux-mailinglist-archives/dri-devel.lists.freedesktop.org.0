Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5A332D1E0A
	for <lists+dri-devel@lfdr.de>; Tue,  8 Dec 2020 00:04:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26E126E910;
	Mon,  7 Dec 2020 23:04:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com
 [209.85.167.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A2606E910
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Dec 2020 23:04:07 +0000 (UTC)
Received: by mail-oi1-f196.google.com with SMTP id v85so6812683oia.6
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Dec 2020 15:04:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=FKVOi81QuTxtmvRA/1QQ/i5ym4BvFRsKDGyyquA2QGo=;
 b=JD6VblMtL5iJ8/9HUA2Sz0/WLtCWfzwLZEjGUCkUqipc54cSaEnQhzSzMJf/+PtKwo
 R8SgjHoSNniwre3R3z6754qVK8DEa/Hk0xiWpVrtEuD76XYrqjzs0HyVh8XiGIDLZofB
 IBge4IHTuI3WH6ceabNDqgPgBwBjf/fAWdIlpat+DJ1Jbnk5s+GCsp7c5C323x+MBJTa
 vdZoqa7UKMS2DeHuPB71vCt2eBKS3JUTBVdYwJPgj2trkGISJMM3wXG1pL3SygB3qvzc
 BnAeKs9JsieHAyyu6HjPPxA+OjBxF325KSvup2L/H31lZ0rRBYS60jzDU0AsVM2WTJoj
 VHgg==
X-Gm-Message-State: AOAM533PxEZWhfLeuG5NLMnQUMcEhnuupYPvA+KZMLck91eiK/UZw3os
 bGqGhlmXGa5g1t1tHjmL4Q==
X-Google-Smtp-Source: ABdhPJwPrbY2Mjm4riXSridU15duWihLNezTrBEYDRujhThLF7Qyb60cdAnrlpGQs50eGq37s+lzoA==
X-Received: by 2002:aca:5548:: with SMTP id j69mr856075oib.32.1607382246438;
 Mon, 07 Dec 2020 15:04:06 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id j204sm952836oih.15.2020.12.07.15.04.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Dec 2020 15:04:05 -0800 (PST)
Received: (nullmailer pid 1014048 invoked by uid 1000);
 Mon, 07 Dec 2020 23:04:04 -0000
Date: Mon, 7 Dec 2020 17:04:04 -0600
From: Rob Herring <robh@kernel.org>
To: Zhen Lei <thunder.leizhen@huawei.com>
Subject: Re: [PATCH v2 1/1] dt-bindings: display: eliminate yamllint warnings
Message-ID: <20201207230404.GA1013997@robh.at.kernel.org>
References: <20201207044830.1551-1-thunder.leizhen@huawei.com>
 <20201207044830.1551-2-thunder.leizhen@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201207044830.1551-2-thunder.leizhen@huawei.com>
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
Cc: devicetree <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 07 Dec 2020 12:48:30 +0800, Zhen Lei wrote:
> Eliminate the following yamllint warnings:
> ./Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> :52:9: [warning] wrong indentation: expected 6 but found 8 (indentation)
> 
> ./Documentation/devicetree/bindings/display/bridge/intel,keembay-dsi.yaml
> :42:8: [warning] wrong indentation: expected 8 but found 7 (indentation)
> :45:8: [warning] wrong indentation: expected 8 but found 7 (indentation)
> 
> ./Documentation/devicetree/bindings/display/intel,keembay-msscam.yaml
> :21:6: [warning] wrong indentation: expected 6 but found 5 (indentation)
> 
> ./Documentation/devicetree/bindings/display/panel/novatek,nt36672a.yaml
> :25:10: [warning] wrong indentation: expected 10 but found 9 (indentation)
> 
> Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
> Acked-by: Sam Ravnborg <sam@ravnborg.org>
> ---
>  .../devicetree/bindings/display/bridge/analogix,anx7625.yaml          | 4 ++--
>  .../devicetree/bindings/display/bridge/intel,keembay-dsi.yaml         | 4 ++--
>  Documentation/devicetree/bindings/display/intel,keembay-msscam.yaml   | 4 ++--
>  Documentation/devicetree/bindings/display/panel/novatek,nt36672a.yaml | 2 +-
>  4 files changed, 7 insertions(+), 7 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
