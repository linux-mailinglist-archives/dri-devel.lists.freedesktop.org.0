Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 45F91646087
	for <lists+dri-devel@lfdr.de>; Wed,  7 Dec 2022 18:44:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E0E310E40D;
	Wed,  7 Dec 2022 17:44:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com
 [209.85.167.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C673D10E40D
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Dec 2022 17:44:52 +0000 (UTC)
Received: by mail-oi1-f169.google.com with SMTP id k189so2464285oif.7
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Dec 2022 09:44:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Bh3kJNWxxONTcLXhSVPL8j31R5ZDr7EBJ7l2X1kdsAM=;
 b=2AvslsTNPIXCS0DJfdVf0B1GU5Xe+M57qcRaP3vvW3s4sVqGQTjfsS6GFvQbmKqDOw
 XsE39NEsocVWDPGQbrLqT0wWHa718LtTz8mGeH8YMWBUrYLFwVO+U9q/U0GJxbN6iPpO
 3i4S1azluG7vTkgAFA9EvtxfGtAe3tuesOd8Rdu7NN9j1NSnUcOmDxMhfay9WxRRjeMe
 AM2OjXZyYxwOxUtQD1tUeC4QvjVmjFiN3pUbOvngxIMwiudHCOgVCQQN+0qkMNscwTbK
 zaO/6k/vi+J6F41/wcWKPmdEjTTrzHcbKvqzaAEyu360WjiRfvSaWIftWIPyknjK7d14
 Nk7g==
X-Gm-Message-State: ANoB5pmjcicMk2LTyVThwsYQmGJahYgc7ig0VHzejWVVcBEKZAvq7u//
 Az3UDYN/7CSZky3kVX/fd5KMc4USIg==
X-Google-Smtp-Source: AA0mqf7uhb6ijSBjoNlIwqMlwkTA5E/1hfm7BXE8hSwPDgd1Pd2bWhJ1JtiYhQ71mmbh0+wi4Cud3Q==
X-Received: by 2002:aca:5c85:0:b0:35b:d7db:7f9d with SMTP id
 q127-20020aca5c85000000b0035bd7db7f9dmr16010624oib.157.1670435091906; 
 Wed, 07 Dec 2022 09:44:51 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 fp43-20020a05687065ab00b00140d421445bsm12420856oab.11.2022.12.07.09.44.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Dec 2022 09:44:51 -0800 (PST)
Received: (nullmailer pid 2465122 invoked by uid 1000);
 Wed, 07 Dec 2022 17:44:51 -0000
Date: Wed, 7 Dec 2022 11:44:51 -0600
From: Rob Herring <robh@kernel.org>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: Re: [PATCH 2/2] dt-bindings: lcdif: Add optional power-domain
Message-ID: <167043509049.2465064.10919707670198151961.robh@kernel.org>
References: <20221207151400.1572582-1-alexander.stein@ew.tq-group.com>
 <20221207151400.1572582-2-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221207151400.1572582-2-alexander.stein@ew.tq-group.com>
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
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Wed, 07 Dec 2022 16:14:00 +0100, Alexander Stein wrote:
> i.MX8MP requires a power-domain for this peripheral to use. Add it as
> an optional property.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
>  Documentation/devicetree/bindings/display/fsl,lcdif.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
