Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CF17269712
	for <lists+dri-devel@lfdr.de>; Mon, 14 Sep 2020 22:51:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67ED46E5A3;
	Mon, 14 Sep 2020 20:51:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
 [209.85.166.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED2B26E5A3
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Sep 2020 20:51:41 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id d190so1669126iof.3
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Sep 2020 13:51:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=veG+zgFelzs7P/4CDsW/IyWMer1s9H9FMEOpA6pNK+s=;
 b=Oh23tA+FyWUmu2wOo6DGb6DLfALfn+XXE4gvdv6iLGIJajeDldV/NLZ5C9AIAJOfvf
 bdfyc12SF73O+HKYPwlB6ohqoQvSNF1buHqEiR6lCfjJdv6jFGXBgKITxYHna5uSnMgs
 PgDNiPKZ74WvZmaVbG+SsqicQ74qgxXehbz9dGftCOIjbCSTmf/6rXnZe/P4aNzAvy1/
 bLWqTYD6OqFnpeQ2Az4whT2EKjqpEXUSD5wVxbdv1DA3x0m1Ut9H4VBl1k1gf9IiHSHh
 GHq8sZWMODWKhj/BHDUkf4hdHlCsLKSZuQJm+nvgfmp8LJwMfVXPzdVMGIBTe+x55Jq4
 XVcw==
X-Gm-Message-State: AOAM532iasiQ29uvfKnVr5dMNF1/p7pwvtqezifXASiRnAinoMndTYRa
 teEOxC1FMfrGGmXsL37bgg==
X-Google-Smtp-Source: ABdhPJxqSOICQ+yvso2zHHwy8r+0Fr59OAQEwH7kQzNJeCVKrnQq6PVIOwAtkxhLNDCTjrOkNtEGOg==
X-Received: by 2002:a05:6602:15c5:: with SMTP id
 f5mr11740218iow.42.1600116701429; 
 Mon, 14 Sep 2020 13:51:41 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id 9sm7245845ilj.83.2020.09.14.13.51.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Sep 2020 13:51:40 -0700 (PDT)
Received: (nullmailer pid 224785 invoked by uid 1000);
 Mon, 14 Sep 2020 20:51:39 -0000
Date: Mon, 14 Sep 2020 14:51:39 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2 3/6] dt-bindings: gpu: arm, mali-utgard: Correct
 Maxime's email
Message-ID: <20200914205139.GA224734@bogus>
References: <20200903191438.12781-1-krzk@kernel.org>
 <20200903191438.12781-3-krzk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200903191438.12781-3-krzk@kernel.org>
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
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Kukjin Kim <kgene@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 03 Sep 2020 21:14:35 +0200, Krzysztof Kozlowski wrote:
> Update the address of Maxime Ripard as one in @free-electrons.com does
> not work.
> 
> Cc: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> Acked-by: Maxime Ripard <mripard@kernel.org>
> 
> ---
> 
> Changes since v1:
> 1. Add Ack
> ---
>  Documentation/devicetree/bindings/gpu/arm,mali-utgard.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Applied, thanks!
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
