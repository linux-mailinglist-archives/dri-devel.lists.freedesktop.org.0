Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 92C72358E4E
	for <lists+dri-devel@lfdr.de>; Thu,  8 Apr 2021 22:24:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E1746E203;
	Thu,  8 Apr 2021 20:24:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com
 [209.85.210.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97D7F6E203
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Apr 2021 20:24:22 +0000 (UTC)
Received: by mail-ot1-f54.google.com with SMTP id
 w31-20020a9d36220000b02901f2cbfc9743so3578148otb.7
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Apr 2021 13:24:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=M3YCDdiRra6VogGwA1vnhtREzQ+WDuc4H3xMdhTez+I=;
 b=s4ROW3LjdXXEaN6XCDMnprg84eUgYzGgnsiUUFSM0ZZ4sIsKNFf0RU9UUpC/whn960
 kAeNxEDYh/jSAVStArmQy/x3xmdoIn1AFdXUq5chu2CRtO/GYoEAPzfFTc0Crtk/K3oC
 7gmtDXpQRMYpyOTvhZuT6yEwMYvioVwpT0OcwdCjx7nkMcE00fNUGKsOOmpvAF8PO5bD
 nOZlA+VraF9c2Dhh5oYlaVRU5k+/HFwIrOBPQo8AxBI0ceWGYwj/mLWV2gmhXnhGTiZE
 IBw7h1DtSx6RjyBsmyOTIPIuR7oG8BTmAu8WgBk0jn1bylckw9aw64Wf188l5qpXBnXa
 /6Vw==
X-Gm-Message-State: AOAM532lFf81zsMBqTDmTavo2aeCQJSpeFqIfajDp1KwTIvf14F7yobp
 bG+LAxEFx26FDbVcXq8/Nw==
X-Google-Smtp-Source: ABdhPJyj/1Kl/phQw5WRAIHujWspkCMZzRj5GHMkFqQn8S2h6Zjz41EgwK7JyjKL4+nlYjHLVRVBbg==
X-Received: by 2002:a05:6830:1290:: with SMTP id
 z16mr9634528otp.122.1617913461847; 
 Thu, 08 Apr 2021 13:24:21 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id g13sm105200otq.3.2021.04.08.13.24.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Apr 2021 13:24:20 -0700 (PDT)
Received: (nullmailer pid 1901276 invoked by uid 1000);
 Thu, 08 Apr 2021 20:24:20 -0000
Date: Thu, 8 Apr 2021 15:24:20 -0500
From: Rob Herring <robh@kernel.org>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Subject: Re: [PATCH v3 2/9] dt-bindings: display/panel: add Jenson JT60245-01
Message-ID: <20210408202420.GA1901222@robh.at.kernel.org>
References: <20210305234427.572114-1-giulio.benetti@benettiengineering.com>
 <20210401231720.2470869-1-giulio.benetti@benettiengineering.com>
 <20210401231720.2470869-3-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210401231720.2470869-3-giulio.benetti@benettiengineering.com>
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 dri-devel@lists.freedesktop.org, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 02 Apr 2021 01:17:13 +0200, Giulio Benetti wrote:
> Add DT binding for "jenson,jt60245-01".
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
