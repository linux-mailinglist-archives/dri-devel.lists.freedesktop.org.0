Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64EA034D0E0
	for <lists+dri-devel@lfdr.de>; Mon, 29 Mar 2021 15:04:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3137789E59;
	Mon, 29 Mar 2021 13:03:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com
 [209.85.167.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF0F889E59
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Mar 2021 13:03:55 +0000 (UTC)
Received: by mail-oi1-f181.google.com with SMTP id i3so12984261oik.7
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Mar 2021 06:03:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=mo+ALT4kgpXYp4yKEn82bczeTVBJ+FK1ZJ51cQv9Caw=;
 b=ZxsrQ1l0lDly3JnuVuUNRUPvWUCYo2egTwAXfPP/MVKMb5QOQDgyi2otKdOP3YtHNA
 211Fjw1NxXrXjyq/YnUS+Dhm66qtVsh7ACV9IshAMJqF5xEWPgaocFQjm4UXolnwxweJ
 IoWzjbdmbF2KgJWQdTmSqQaN8qfxshADfrkBCQ4rcUJlayOJd8lXVFzDc0Tzpvju5KCA
 XVRl3S8lFuG6p9RUa3ArtQjtQM/zMTOVz4AnmvolaUcfavSfAq78rQLaElcAI2+UMAJ/
 adVEOrC8+1JAGfXqeslrzlExyj5r4z0UVMzxgxQVsvfqSQJGh7HAVdoG+YONKYoKLJMQ
 sLFQ==
X-Gm-Message-State: AOAM533RaZk1vHY7vzfHEPAsQdELPVJa8cum9jx9RAsUh+45+RpXuh10
 WUfdq3N+5g/tzj/nLQlomw==
X-Google-Smtp-Source: ABdhPJxqMq1JTanm3Xl8VvLn7lO2g5QxiCF4UUmO4d3Qd6PFHRNy8vrBK2oa8amm48eZ4ktjQaUObw==
X-Received: by 2002:aca:57d0:: with SMTP id
 l199mr19421798oib.115.1617023034978; 
 Mon, 29 Mar 2021 06:03:54 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id w16sm4444176otq.15.2021.03.29.06.03.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Mar 2021 06:03:53 -0700 (PDT)
Received: (nullmailer pid 2404777 invoked by uid 1000);
 Mon, 29 Mar 2021 13:03:52 -0000
From: Rob Herring <robh@kernel.org>
To: Daniel Mack <daniel@zonque.org>
In-Reply-To: <20210328200057.1977778-2-daniel@zonque.org>
References: <20210328200057.1977778-1-daniel@zonque.org>
 <20210328200057.1977778-2-daniel@zonque.org>
Subject: Re: [PATCH v5 1/2] dt-bindings: display: add bindings for newhaven,
 1.8-128160EF
Date: Mon, 29 Mar 2021 08:03:52 -0500
Message-Id: <1617023032.498284.2404776.nullmailer@robh.at.kernel.org>
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
Cc: airlied@linux.ie, devicetree@vger.kernel.org, robh+dt@kernel.org,
 dri-devel@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 28 Mar 2021 22:00:56 +0200, Daniel Mack wrote:
> This adds documentation for a new ILI9163 based, SPI connected display.
> 
> Signed-off-by: Daniel Mack <daniel@zonque.org>
> ---
>  .../display/panel/ilitek,ili9163.yaml         | 69 +++++++++++++++++++
>  1 file changed, 69 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/ilitek,ili9163.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
./Documentation/devicetree/bindings/display/panel/ilitek,ili9163.yaml: $id: relative path/filename doesn't match actual path or filename
	expected: http://devicetree.org/schemas/display/panel/ilitek,ili9163.yaml#

See https://patchwork.ozlabs.org/patch/1459305

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
