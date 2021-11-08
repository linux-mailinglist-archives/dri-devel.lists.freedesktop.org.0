Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65924449B37
	for <lists+dri-devel@lfdr.de>; Mon,  8 Nov 2021 18:57:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F3AA89C25;
	Mon,  8 Nov 2021 17:57:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com
 [209.85.210.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E087189C25
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Nov 2021 17:57:54 +0000 (UTC)
Received: by mail-ot1-f49.google.com with SMTP id
 q33-20020a056830442100b0055abeab1e9aso26817424otv.7
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Nov 2021 09:57:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=74CgHbOiGXHAT1WXmdFnyE9m5aEGpCGlaYLSb0TtBns=;
 b=RyEiH+Z3FWy0XgoHE2+oigY7gZgiO3a3WONG7zfqm43F59SYhYKpQM3eXB4xz++oBM
 Oy5NSIm/MR4Zye8T5CNruxdpzy8qzvXvLaj1Lde17NyDSw8RsK09YdgyjmA+iubd2yLt
 eETo74uyFWJnqkpAoTFr9CYQYad2DBgKWCGoN53iVPe7JQY9FRMXpcoATkJ9Cakroci9
 EY3BBNXDRY8Dd1VXrmWf538qRG9/H+WGX9g3IEGvEAMuFI58btq1mNFjydash9ewMRbF
 Gi5zVnOdmxQnIwYT1JX43febmXs2oxLzIAMxRl64GydWSGz1A0NA5xfIN+ChGz4uxVxd
 BFCA==
X-Gm-Message-State: AOAM532C3eVESQ6BOgSskfcV4HAoDHSZ3ogsiMNSeJrsrDM9ZgchzOQD
 tW4RT4G9PO7g2uLzAcZfmw==
X-Google-Smtp-Source: ABdhPJx2BSXHkehCfN5UWjokDE+FxEtiZ4XxBCnvwZymax/0XqhN29CygPLgUr7LYWGmajNVyndgLA==
X-Received: by 2002:a05:6830:91a:: with SMTP id
 v26mr632166ott.313.1636394274107; 
 Mon, 08 Nov 2021 09:57:54 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id t11sm4118092oov.23.2021.11.08.09.57.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Nov 2021 09:57:53 -0800 (PST)
Received: (nullmailer pid 3904278 invoked by uid 1000);
 Mon, 08 Nov 2021 17:57:52 -0000
Date: Mon, 8 Nov 2021 11:57:52 -0600
From: Rob Herring <robh@kernel.org>
To: Rahul T R <r-ravikumar@ti.com>
Subject: Re: [PATCH] dt-bindings: display: bridge: Convert
 toshiba,tc358767.txt to yaml
Message-ID: <YYllIOoUd+oSoO73@robh.at.kernel.org>
References: <20211028093656.25493-1-r-ravikumar@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211028093656.25493-1-r-ravikumar@ti.com>
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
Cc: nm@ti.com, devicetree@vger.kernel.org, vigneshr@ti.com, airlied@linux.ie,
 andrey.gusakov@cogentembedded.com, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 28 Oct 2021 15:06:56 +0530, Rahul T R wrote:
> Convert toshiba,tc358767.txt binding to yaml format
> 
> Signed-off-by: Rahul T R <r-ravikumar@ti.com>
> ---
>  .../display/bridge/toshiba,tc358767.txt       |  54 ------
>  .../display/bridge/toshiba,tc358767.yaml      | 158 ++++++++++++++++++
>  2 files changed, 158 insertions(+), 54 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/bridge/toshiba,tc358767.txt
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/toshiba,tc358767.yaml
> 

Applied, thanks!
