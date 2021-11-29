Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1304B4621D0
	for <lists+dri-devel@lfdr.de>; Mon, 29 Nov 2021 21:10:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DC4C6E13C;
	Mon, 29 Nov 2021 20:10:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com
 [209.85.210.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7294C6E13C
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Nov 2021 20:10:31 +0000 (UTC)
Received: by mail-ot1-f48.google.com with SMTP id
 u18-20020a9d7212000000b00560cb1dc10bso27098086otj.11
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Nov 2021 12:10:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=AZAXsJSUQjYW1ESouOH/jYv3V0TFgwXgT2iRk93eZU8=;
 b=jhTyVb13foknWaxA4OLsjG5CTY1QnqIVXLH5OITlkKTtTYvmOcF8ye0v4IA7FeVnkV
 zybcx6Bi6THh95Wnuq6snQwxSQf/7KllT4d5HWjtrTVJb5a4Lj9159G1ldNNUAa01dTV
 vUSPuyMe+SUZP5bV/Pq/vpDqVcujewkXvw4dWX6PISnqxLLhNwkKaBUJW2yyHNQqeAfT
 n9iGjm7vwaaYhMiSZTPUIxpqoLsuIQw2EF0bu9XpzAVdOM+ApThZMLllRiM7/kzX2jc5
 1r06iWSorTZKVltYLjP0unMQTQglLNsehj27DOX5kKUERo87lp5vx3z4ncOGVs+9tWS1
 ZKhA==
X-Gm-Message-State: AOAM5337SrbmbnNo1t9Af0tgFDnJ+l8bWVvQgMAXqsrlb9t66OYRtrpF
 vRMt/xvqkGFHhVaDtQTzaw==
X-Google-Smtp-Source: ABdhPJzuHSkT6aK0MzKQ+XdJKL442IfwmKnd73aDsFA/r4KNla6O+3VTcXB/4IPqG8A+cIv3BXl2Rg==
X-Received: by 2002:a05:6830:169a:: with SMTP id
 k26mr47154935otr.64.1638216630690; 
 Mon, 29 Nov 2021 12:10:30 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id v12sm2827187ote.9.2021.11.29.12.10.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Nov 2021 12:10:30 -0800 (PST)
Received: (nullmailer pid 522769 invoked by uid 1000);
 Mon, 29 Nov 2021 20:10:29 -0000
Date: Mon, 29 Nov 2021 14:10:29 -0600
From: Rob Herring <robh@kernel.org>
To: David Heidelberg <david@ixit.cz>
Subject: Re: [PATCH] dt-bindings: display: sync formats with simplefb.h
Message-ID: <YaUztTzXSRaK9dOB@robh.at.kernel.org>
References: <20211108183322.68192-1-david@ixit.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211108183322.68192-1-david@ixit.cz>
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Hans de Goede <hdegoede@redhat.com>,
 Rob Herring <robh+dt@kernel.org>, ~okias/devicetree@lists.sr.ht
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 08 Nov 2021 19:33:22 +0100, David Heidelberg wrote:
> Sync all formats from simplefb.h into documentation.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  .../bindings/display/simple-framebuffer.yaml         | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 

Applied, thanks!
