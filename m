Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 182DD2A6D7F
	for <lists+dri-devel@lfdr.de>; Wed,  4 Nov 2020 20:06:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E0D889F99;
	Wed,  4 Nov 2020 19:06:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f65.google.com (mail-oo1-f65.google.com
 [209.85.161.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B92289F99
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Nov 2020 19:06:23 +0000 (UTC)
Received: by mail-oo1-f65.google.com with SMTP id f1so5346611oov.1
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Nov 2020 11:06:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=R2gb5md+lT/qT0Qy1C0A7wiZJjH97JR0T8nu7AkZKBw=;
 b=hys3tr6uhb4SSJQ6x5AInT1I2xxXPKP9E1d/O3QWBHrG+nY9COglqZro/q0ZC1lymo
 5uebT1l+5478qGzhqCUWuQUTQrtYwAyc1KfZ8MjSbcw5QMLzIGpVZqhNi/BzKb1RWgpm
 KzVboVmKIdY4ZRs6WIsas39SJvUkFX3JBFeAIYdEzxisM/e7q5SVPDLoHXZt+WyMCowR
 AY2TDc9lel1evJXDRgFMUGb9NtKnSBj3x8RdlbLoUn5BMqxH0uUdPAvma1ZW/vr+RCAU
 NE8+Blabz0cKUE3DDhtQEc5VZI2TjN0tRQ7Syps+y7gWZf8gGqG7wBQqg50mMzOzslwD
 kSZg==
X-Gm-Message-State: AOAM533aYVdkey07V4ikRJ7OqIHJXTGspy2dUNAhd3rfq+BSup5ksPTk
 lvItejgimparGhxI3JsWTA==
X-Google-Smtp-Source: ABdhPJydRU/q7sjyN4LVnglPCUmlTYexpnq5r2D2zpd/4tsUOp7VPoj8Q9kerD3r6P9or2zPZ5/t9g==
X-Received: by 2002:a4a:b209:: with SMTP id d9mr19637528ooo.70.1604516782442; 
 Wed, 04 Nov 2020 11:06:22 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id 92sm683274otv.29.2020.11.04.11.06.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2020 11:06:21 -0800 (PST)
Received: (nullmailer pid 3960229 invoked by uid 1000);
 Wed, 04 Nov 2020 19:06:21 -0000
Date: Wed, 4 Nov 2020 13:06:21 -0600
From: Rob Herring <robh@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] dt-bindings: display: mcde: Convert to YAML schema
Message-ID: <20201104190621.GB3959462@bogus>
References: <20201104133709.1373147-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201104133709.1373147-1-linus.walleij@linaro.org>
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
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 04 Nov 2020 14:37:09 +0100, Linus Walleij wrote:
> This moves the MCDE bindings over to using the YAML schema
> to describe the ST-Ericsson MCDE display controller,
> making use of the generic DSI controller schema.
> 
> We also add the "port" node, we will use this when adding
> LCD panels using the direct parallel interface DPI instead
> of DSI.
> 
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  .../devicetree/bindings/display/ste,mcde.txt  | 104 -----------
>  .../devicetree/bindings/display/ste,mcde.yaml | 167 ++++++++++++++++++
>  2 files changed, 167 insertions(+), 104 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/ste,mcde.txt
>  create mode 100644 Documentation/devicetree/bindings/display/ste,mcde.yaml
> 


My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/ste,mcde.yaml: 'additionalProperties' is a required property
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/ste,mcde.yaml: ignoring, error in schema: 
warning: no schema found in file: ./Documentation/devicetree/bindings/display/ste,mcde.yaml


See https://patchwork.ozlabs.org/patch/1393940

The base for the patch is generally the last rc1. Any dependencies
should be noted.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
