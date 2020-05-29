Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DD1E1E8368
	for <lists+dri-devel@lfdr.de>; Fri, 29 May 2020 18:17:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 502646E942;
	Fri, 29 May 2020 16:17:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f193.google.com (mail-il1-f193.google.com
 [209.85.166.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60DA66E942
 for <dri-devel@lists.freedesktop.org>; Fri, 29 May 2020 16:17:37 +0000 (UTC)
Received: by mail-il1-f193.google.com with SMTP id 17so3065530ilj.3
 for <dri-devel@lists.freedesktop.org>; Fri, 29 May 2020 09:17:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=1WA+w4gWKVFAKdOjyjOP/tEtWPocATjUQITVK+3DOw8=;
 b=StZlyc8dTJMhBC9MmZTbkGZEyYMvjnnOcsaTRvBBHgeAVic5Bpu06nukxwsKydAzQQ
 ZtIAgAMnAQdaGPch3FTEvCa5+54GrZjA4bs7gDo0g/hgiASO0Wngj/5dC9FjtAbHiXJ7
 yfjXWBUV2t7vOiyhBl5w6IoXdme5kN6YLD41itBOmEN2wiJH7NF2DQitb8OGvrZOPvSU
 xADV4D5RAXo3RzKnFXFpfBEbmSM8k3rUzZTAJsacG110Qr4BmsUe3P3LQe5KFw2nJ7bx
 8FEK4Ni52K7DdYNsNNS46/HKxUZqymEeNIosrCzbLb8jY8M2UfVJShUdlUXb0eFGOd07
 +f8g==
X-Gm-Message-State: AOAM533Hk04cckJNfgYask+/YUkXElHTeKzE4sobImESvNygEszu3N3S
 CeLrm1fdNJLCEclz2z/1k0WmwvQvyg==
X-Google-Smtp-Source: ABdhPJzaiMsri3Ce6ct811n/Nx3VT+C3nOOEcWn2ikVVXzQHkkLZAWZnsnOcN0C90jGOSCtG3QTx+Q==
X-Received: by 2002:a92:9142:: with SMTP id t63mr6838165ild.191.1590769056769; 
 Fri, 29 May 2020 09:17:36 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
 by smtp.gmail.com with ESMTPSA id j63sm1083926ilg.50.2020.05.29.09.17.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2020 09:17:35 -0700 (PDT)
Received: (nullmailer pid 2494095 invoked by uid 1000);
 Fri, 29 May 2020 16:17:32 -0000
Date: Fri, 29 May 2020 10:17:32 -0600
From: Rob Herring <robh@kernel.org>
To: dillon.minfei@gmail.com
Subject: Re: [PATCH v6 4/9] dt-bindings: display: panel: Add ilitek ili9341
 panel bindings
Message-ID: <20200529161732.GA2493963@bogus>
References: <1590564453-24499-1-git-send-email-dillon.minfei@gmail.com>
 <1590564453-24499-5-git-send-email-dillon.minfei@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1590564453-24499-5-git-send-email-dillon.minfei@gmail.com>
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
Cc: dillonhua@gmail.com, airlied@linux.ie, dri-devel@lists.freedesktop.org,
 thierry.reding@gmail.com, sam@ravnborg.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-clk@vger.kernel.org,
 andy.shevchenko@gmail.com, mturquette@baylibre.com, devicetree@vger.kernel.org,
 alexandre.torgue@st.com, robh+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, sboyd@kernel.org,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, broonie@kernel.org,
 mcoquelin.stm32@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 27 May 2020 15:27:28 +0800, dillon.minfei@gmail.com wrote:
> From: dillon min <dillon.minfei@gmail.com>
> 
> Add documentation for "ilitek,ili9341" panel.
> 
> Signed-off-by: dillon min <dillon.minfei@gmail.com>
> ---
>  .../bindings/display/panel/ilitek,ili9341.yaml     | 69 ++++++++++++++++++++++
>  1 file changed, 69 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/ilitek,ili9341.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
