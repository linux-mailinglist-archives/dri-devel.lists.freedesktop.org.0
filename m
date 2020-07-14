Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E9A821E5C2
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jul 2020 04:38:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A5AC6E893;
	Tue, 14 Jul 2020 02:38:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
 [209.85.166.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22CBA6E893
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jul 2020 02:38:37 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id e64so15747522iof.12
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jul 2020 19:38:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=4Gg8DYJFGz0ri+pNHJ3d+QdBSaSue9B9wGaWAqzH7gE=;
 b=obLIRLPUR5pLYF22wSztIbfP/Yr12WkifKU5r96Y5iNq798nFezH4pFYey5ed7OO13
 gjo9tR57SItC5n2manE7WOz25tdMI4YhU4Dp6yqjpYwHb9nlnKznKWHNAGfu0yoSBQq7
 D24+ao1IfVv8vRpmcUlQ8FU5tvgRDHVefubiueEDvG3TUNpct4miy+Bo0IoiWAAyHhMX
 +UAP25ZIQ2d7P6S/jKhW7xqQiw+G9LTQOVulh47OG2e11+sV55+FvbCG9vDcveZN2+QU
 RtD7S2zjxfUBVEKhMhYjQr2q4CfsEhjosS1yfCPbf2u39uSzLuFnz1jfiEl70fRFKPGc
 NYTw==
X-Gm-Message-State: AOAM533DNOXbM66W4H62OoqY4rbE6jPSpzV91JPce9fndjyz7p9iiUnj
 7wNlPrtKjrPJ2ovb0c0uWw==
X-Google-Smtp-Source: ABdhPJwZqnw3INgfD6Hay7X47f+EZmXP1MZ7Ywp8k31VukJNIC1u1XNf6R93i8iUljLxukbnVOSYfg==
X-Received: by 2002:a5d:9590:: with SMTP id a16mr2767645ioo.150.1594694316558; 
 Mon, 13 Jul 2020 19:38:36 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
 by smtp.gmail.com with ESMTPSA id d6sm9425301ilq.27.2020.07.13.19.38.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jul 2020 19:38:35 -0700 (PDT)
Received: (nullmailer pid 1172482 invoked by uid 1000);
 Tue, 14 Jul 2020 02:38:35 -0000
Date: Mon, 13 Jul 2020 20:38:35 -0600
From: Rob Herring <robh@kernel.org>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v2 02/10] dt-bindings: display: Add ingenic,ipu.yaml
Message-ID: <20200714023835.GA1172429@bogus>
References: <20200629235210.441709-1-paul@crapouillou.net>
 <20200629235210.441709-2-paul@crapouillou.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200629235210.441709-2-paul@crapouillou.net>
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
Cc: devicetree@vger.kernel.org, od@zcrc.me, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mips@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 30 Jun 2020 01:52:02 +0200, Paul Cercueil wrote:
> Add documentation of the Device Tree bindings for the Image Processing
> Unit (IPU) found in most Ingenic SoCs.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
> 
> Notes:
>     v2: Add missing 'const' in items list
> 
>  .../bindings/display/ingenic,ipu.yaml         | 65 +++++++++++++++++++
>  1 file changed, 65 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/ingenic,ipu.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
