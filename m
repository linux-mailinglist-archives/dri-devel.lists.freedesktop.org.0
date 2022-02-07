Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A09764ACC5E
	for <lists+dri-devel@lfdr.de>; Mon,  7 Feb 2022 23:58:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A95B10E216;
	Mon,  7 Feb 2022 22:58:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com
 [209.85.161.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EA9A10E216
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Feb 2022 22:58:37 +0000 (UTC)
Received: by mail-oo1-f45.google.com with SMTP id
 i10-20020a4aab0a000000b002fccf890d5fso15520880oon.5
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Feb 2022 14:58:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=OuUO/3mep0ZxwUzB1eZmsPdUautSdpAaoSsbMdDIwvk=;
 b=oVlfdqufuSr7BZGQwqsncbYPk3Rtc31GbBpa476ZdYG0eyQYM2+alTj4P1cGhDP8U7
 A6/+ayBUA4IG13kzfDnihnqN3lGmoc1IrEDtbA//NkswctwnEXg5e6PrCOsm6coVeL7a
 GdmaKb1StYyfP9gyK4neE/3wEv1YysXpA/TcDQ5QzAewhbU5IkriiAmqqGYiy2pjHE26
 Lz7/r1Y4L0qBI1bkLVfdHhmXbK0Gvz1arjn3lk7+/OyiyjcFruKADu35sBJOavXaAAkG
 Sp3ZgJ/SwL0dPVbmOyxtCobXe/yb5Ty7Vd0qdasw+fchjGGvyvnnoz6OF5sA8TyATo5x
 8TfA==
X-Gm-Message-State: AOAM533BDsDT/fysDdSjGwoQqNTQQfbiIaVDhKl+yccrrifR7R6LW3YN
 iX06MLjKmOLTKuEvJopq/PJUBAcFSQ==
X-Google-Smtp-Source: ABdhPJz8tRKVh/KhZv13gwKCCkgM7u0aIme6netKeQV2jceD4HV3eIrTtFsAxLP8HBsa9x/6+GVTSw==
X-Received: by 2002:a05:6870:e14f:: with SMTP id
 z15mr405692oaa.115.1644274716319; 
 Mon, 07 Feb 2022 14:58:36 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id r19sm4645810oad.29.2022.02.07.14.58.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Feb 2022 14:58:35 -0800 (PST)
Received: (nullmailer pid 1085294 invoked by uid 1000);
 Mon, 07 Feb 2022 22:58:34 -0000
Date: Mon, 7 Feb 2022 16:58:34 -0600
From: Rob Herring <robh@kernel.org>
To: Chris Morgan <macroalpha82@gmail.com>
Subject: Re: [PATCH 1/6 v2] dt-bindings: vendor-prefixes: Add Geekworm
Message-ID: <YgGkGvRkAH+HAKTU@robh.at.kernel.org>
References: <20220124165526.1104-1-macroalpha82@gmail.com>
 <20220124165526.1104-2-macroalpha82@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220124165526.1104-2-macroalpha82@gmail.com>
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
Cc: devicetree@vger.kernel.org, emma@anholt.net, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org, thierry.reding@gmail.com,
 Chris Morgan <macromorgan@hotmail.com>, mchehab@kernel.org, sam@ravnborg.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 24 Jan 2022 10:55:21 -0600, Chris Morgan wrote:
> From: Chris Morgan <macromorgan@hotmail.com>
> 
> Add vendor prefix for Geekworm (https://geekworm.com).
> 
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
