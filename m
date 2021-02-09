Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A564315814
	for <lists+dri-devel@lfdr.de>; Tue,  9 Feb 2021 21:55:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 418946E106;
	Tue,  9 Feb 2021 20:55:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com
 [209.85.210.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83B606E106
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Feb 2021 20:55:52 +0000 (UTC)
Received: by mail-ot1-f42.google.com with SMTP id s107so18760498otb.8
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Feb 2021 12:55:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=RP3dhPMdlKAjivrXGUHAi9hHjPbrEKsu6Dv+Yzctmhw=;
 b=FyyFNJ3yXs8Ubyr0XFK2WXn4ZlpGLIwpis/7wXLr6K7fEXKY2c5wDReZ7I1TVRVXUW
 WVXhJ457fM3ndnMu3baz8v1puVN/CfLSqp6F/j4mK1AAto3yf4RhbQifcKIoA7kAZybf
 4RpC/nOieGrlle5oqb4eXpZj/ABFsMrDSYb231dJONFFp6Z5/Qe5+xy72/HDcSAh3w40
 KivZ6z3+DjjIJZk/CeWVnOY4Y6sz8WzBI9TrWTKecda0Gj7jAMvF5qJ6/sZTYICIb+Gh
 NcGD9Nl3GvjEKQTO5iKoHDVrpziTrKx1bYdIYij6bhQFMPeZmpZ2S6UlyxvjTQrkSgNu
 ZiSg==
X-Gm-Message-State: AOAM531+4zveeCtaDfFuQmy0ff5ou3hG5Wau48TC0G0gLrzSG50qVLko
 P7KSTbhz75/6qVNXZtuMVIhFytBg+g==
X-Google-Smtp-Source: ABdhPJyKYoGnii7JnW/1A4WdWWq6HpZ+jUyGwMPxsQGjJmlzc/2O4MqhObgvPviB1qdJQgl1D0k8Cw==
X-Received: by 2002:a05:6830:c6:: with SMTP id
 x6mr2228694oto.135.1612904151832; 
 Tue, 09 Feb 2021 12:55:51 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id a63sm4597844otc.75.2021.02.09.12.55.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Feb 2021 12:55:50 -0800 (PST)
Received: (nullmailer pid 164883 invoked by uid 1000);
 Tue, 09 Feb 2021 20:55:49 -0000
Date: Tue, 9 Feb 2021 14:55:49 -0600
From: Rob Herring <robh@kernel.org>
To: Iskren Chernev <iskren.chernev@gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: panel: Add Samsung S6E3FA2 panel
Message-ID: <20210209205549.GA164827@robh.at.kernel.org>
References: <20210201165307.51443-1-iskren.chernev@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210201165307.51443-1-iskren.chernev@gmail.com>
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 01 Feb 2021 18:53:05 +0200, Iskren Chernev wrote:
> The Samsung S6E3FA2 AMOLED cmd LCD panel is used on the Samsung Galaxy
> S5 (klte).
> 
> Signed-off-by: Iskren Chernev <iskren.chernev@gmail.com>
> ---
> Add a simple generated panel driver that supports on/off and the corresponding
> binding documentation.
> 
> Changes in v3:
> - fix dt_binding_check issue with missing include
> - fix panel type (cmd) in kconfig description
> 
> Changes in v2:
> - move bindings to separate file, add 2 regulators
> - add standalone panel driver
> 
> v1: https://lkml.org/lkml/2020/12/30/293
> v2: https://lkml.org/lkml/2021/2/1/313
> 
>  .../display/panel/samsung,s6e3fa2.yaml        | 64 +++++++++++++++++++
>  1 file changed, 64 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/samsung,s6e3fa2.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
