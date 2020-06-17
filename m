Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A5351FD8EF
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jun 2020 00:35:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5E256E1F2;
	Wed, 17 Jun 2020 22:34:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f193.google.com (mail-il1-f193.google.com
 [209.85.166.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF4B66E1F2
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jun 2020 22:34:57 +0000 (UTC)
Received: by mail-il1-f193.google.com with SMTP id j19so3910844ilk.9
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jun 2020 15:34:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=c5Y+K27z/UnQHPf7dVA+plkp+xMtkTE7h8L8DPS7DYI=;
 b=Jtij6/suL1edEtWWSk1HsxQ0lDOdVA4JDL31uPp7NNknrxsV39GqllWn2tN8erWe/v
 AdNa3TtyFNMZKzbKxryl6sGkUeW6CcL37fmsWSJK1oEgkx9Sg4x8qUP7ZjBJFj81wBmN
 CtQsjYosgFhZaDTtJH3C5luNJuVGVnY5AhuyDrtgK6nu9TL5LNzZjIw+UaDoaFs3fMxR
 JiTYcM5lYb7zJSKzc10lmzbmsty0qlhsARBHYQ4it1bJS6gNL0wEnSxTNjyr9KQdhUWH
 sZ3dv3hnpx/nfvXIoPnesRMJGGfdFwT3ENmIGEA5ZY33lad1eWIx8QaT//bNQz3//dO7
 bxGQ==
X-Gm-Message-State: AOAM532j4BGkLlJPA3+SXCTWKhKzFD4WCOtbbt9vr4/1sKA78N2prcdA
 Y+yIqDZ1T4IrVDunHlvWHA==
X-Google-Smtp-Source: ABdhPJxHuv4++9idd4cGJ1YVbZSUibTvT/Vt5YQAo6Eno5pqsY6fnO3joxmM0yNFJzrCC67k4I+ZSg==
X-Received: by 2002:a92:899b:: with SMTP id w27mr1285269ilk.16.1592433297077; 
 Wed, 17 Jun 2020 15:34:57 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id l3sm710771iow.55.2020.06.17.15.34.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2020 15:34:56 -0700 (PDT)
Received: (nullmailer pid 2961072 invoked by uid 1000);
 Wed, 17 Jun 2020 22:34:55 -0000
Date: Wed, 17 Jun 2020 16:34:55 -0600
From: Rob Herring <robh@kernel.org>
To: Ricardo =?iso-8859-1?Q?Ca=F1uelo?= <ricardo.canuelo@collabora.com>
Subject: Re: [PATCH v3 5/5] dt-bindings: display: ti,tfp410.yaml: make the
 ports node optional
Message-ID: <20200617223455.GA2953201@bogus>
References: <20200611102356.31563-1-ricardo.canuelo@collabora.com>
 <20200611102356.31563-6-ricardo.canuelo@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200611102356.31563-6-ricardo.canuelo@collabora.com>
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
Cc: devicetree@vger.kernel.org, jason@lakedaemon.net, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, tomi.valkeinen@ti.com,
 Laurent.pinchart@ideasonboard.com, kernel@collabora.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 11, 2020 at 12:23:56PM +0200, Ricardo Ca=F1uelo wrote:
> Make the ports node optional, since there are some DTs that don't define
> any ports for ti,tfp410.

Only arch/arm/boot/dts/dove-sbc-a510.dts AFAICT... It should be updated =

IMO.

> =

> Signed-off-by: Ricardo Ca=F1uelo <ricardo.canuelo@collabora.com>
> ---
>  Documentation/devicetree/bindings/display/bridge/ti,tfp410.yaml | 1 -
>  1 file changed, 1 deletion(-)
> =

> diff --git a/Documentation/devicetree/bindings/display/bridge/ti,tfp410.y=
aml b/Documentation/devicetree/bindings/display/bridge/ti,tfp410.yaml
> index 605831c1e836..1c9421eb80fa 100644
> --- a/Documentation/devicetree/bindings/display/bridge/ti,tfp410.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/ti,tfp410.yaml
> @@ -83,7 +83,6 @@ properties:
>  =

>  required:
>    - compatible
> -  - ports
>  =

>  if:
>    required:
> -- =

> 2.18.0
> =

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
