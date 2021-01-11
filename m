Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5FB42F2299
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jan 2021 23:21:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6121D89DC1;
	Mon, 11 Jan 2021 22:21:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com
 [209.85.210.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E209F89DC1
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jan 2021 22:21:36 +0000 (UTC)
Received: by mail-ot1-f47.google.com with SMTP id q25so396975otn.10
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jan 2021 14:21:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=lwowg8R3zoAp02uZXuJJnsblBT2j5J753GEYS/wG8zI=;
 b=d8XNqdLz8RxOqCqlox8T3K0Go3/3WvMFl3ljOULisL2XTh1J2hNSw2+lYegXuCB8CA
 KJhNPvxlPvNGPb6ekVTufvglaVpPBLT8JNyYEivB7FG0yQdWtcFa3XaWoIpjtU4bY+tE
 WLQ/UvvM8D0PrLnUub7W4T3hEDXsYidOvZ/URNC873pDcejz/DxrkIzilLJEacgHGXX0
 sJEFyEN82ajfBEvnUnMJjrkH2oNmkbqXaRElBw+0wHMKNVv4tNVvvpS+aKG8hC8CamWO
 lWHwGo/tI3Q59YuoQUpMnOlBoMDsOdX40LQ4cJHlRZ+G9U/57qiLTJNpGXQmHyCbTZ/+
 plNw==
X-Gm-Message-State: AOAM532g74l32z9D9eaD52ZQ7mSV7KnRjb0wEL2wNphuxNydD6oWSdOq
 BIbNP15wo7O0XcP5QbdzvQ==
X-Google-Smtp-Source: ABdhPJzPp8WM4Egm10CAP1cpF87KCuj9jo/3pxO6fl8N1h0Y4dT98FDOaAIfzhTbbjBxnX0c74DSOA==
X-Received: by 2002:a9d:3ef6:: with SMTP id b109mr865032otc.288.1610403696301; 
 Mon, 11 Jan 2021 14:21:36 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id v13sm186944ook.13.2021.01.11.14.21.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 14:21:35 -0800 (PST)
Received: (nullmailer pid 3162618 invoked by uid 1000);
 Mon, 11 Jan 2021 22:21:34 -0000
Date: Mon, 11 Jan 2021 16:21:34 -0600
From: Rob Herring <robh@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] dt-bindings: display: Augment s6e63m0 bindings
Message-ID: <20210111222134.GA3162565@robh.at.kernel.org>
References: <20210101114522.1981838-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210101114522.1981838-1-linus.walleij@linaro.org>
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
Cc: devicetree@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 01 Jan 2021 12:45:22 +0100, Linus Walleij wrote:
> This fixes the following problems with the s6e63m0 display
> bindings:
> 
> - When used on the DSI bus, the panel is listed directly as
>   a subnode on the DSI host so the "port" node is not
>   compulsory. Remove "port" from required properties.
> 
> - The panel contains its own backlight control, so reference
>   the backlight common properties and list default-brightness
>   and max-brightness as supported but optional properties.
> 
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  .../devicetree/bindings/display/panel/samsung,s6e63m0.yaml    | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
