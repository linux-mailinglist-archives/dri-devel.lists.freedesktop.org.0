Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 367D52A0A49
	for <lists+dri-devel@lfdr.de>; Fri, 30 Oct 2020 16:49:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 614DD6EDC7;
	Fri, 30 Oct 2020 15:49:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4EAB6E9C6
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Oct 2020 15:49:46 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id k3so5957184otp.1
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Oct 2020 08:49:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=1ftl2mmglzVyNPpTmwwRhyO51W+rV9lT76LSvntTyw0=;
 b=GOHhIhAUh9YW+jhlvvT2E2G0zIJbc7mZ5PCGmoOUnQc6u+jRc4YzpUwz2VCMyzWPMR
 m76oaAyhPhrf0idaAC9CbEOpFVwo2Mjgmjnho7NS6Mb5P2hibxzY4yBO4UPUMFnMwKyZ
 oi/Mrjd9ISaSDqv5BSpuzG3hfaq2bD4kbkViVJGgcCJiZAU2gdSTE0v3Yln1mb/BMQnj
 Lj8bdVQu+2WkPfcSFRUl75wJjNTPsDMMdvvuNtmXG1G7gb2XlEnl4NqfAiR0tpUT9OP1
 awTchlWFwI0PImhORSF/hn4bf0Bd9YLg48Hc3JSTYA9uxtrqacBKjCYG8YWTz74r1GK3
 C21w==
X-Gm-Message-State: AOAM533s3N43vT+HNAU6Sf7JouG4qhVffcCShaLlYzeylgHxln4rtrVg
 N45VPlfe7aOsxBkfVcAFLg==
X-Google-Smtp-Source: ABdhPJz9aMo+yJ2ejJuLVzoOC70cg6U3LofBzYRBqTxOKAB+DSztHTx+rg5h2SrWLXIwxS+SilU8AQ==
X-Received: by 2002:a05:6830:2018:: with SMTP id
 e24mr2241291otp.278.1604072985738; 
 Fri, 30 Oct 2020 08:49:45 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id w8sm186211otm.64.2020.10.30.08.49.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2020 08:49:45 -0700 (PDT)
Received: (nullmailer pid 3905477 invoked by uid 1000);
 Fri, 30 Oct 2020 15:49:44 -0000
Date: Fri, 30 Oct 2020 10:49:44 -0500
From: Rob Herring <robh@kernel.org>
To: Fabien Parent <fparent@baylibre.com>
Subject: Re: [PATCH v2 1/5] dt-bindings: display: mediatek: disp: add
 documentation for MT8167 SoC
Message-ID: <20201030154944.GA3905431@bogus>
References: <20201023133130.194140-1-fparent@baylibre.com>
 <20201023133130.194140-2-fparent@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201023133130.194140-2-fparent@baylibre.com>
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
Cc: chunkuang.hu@kernel.org, devicetree@vger.kernel.org, airlied@linux.ie,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 23 Oct 2020 15:31:26 +0200, Fabien Parent wrote:
> Add binding documentation for the MT8167 SoC
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> ---
> 
> Changelog:
> 
> V2: No change
> 
>  .../devicetree/bindings/display/mediatek/mediatek,disp.txt    | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
