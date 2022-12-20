Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 708E8652435
	for <lists+dri-devel@lfdr.de>; Tue, 20 Dec 2022 17:06:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 046F110E09E;
	Tue, 20 Dec 2022 16:06:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com
 [209.85.210.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34EB710E073
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Dec 2022 16:06:02 +0000 (UTC)
Received: by mail-ot1-f53.google.com with SMTP id
 m7-20020a9d6447000000b0066da0504b5eso7393875otl.13
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Dec 2022 08:06:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=F8YG3bJMRRAs+4R88/SEWWX5CeSnSiZ81eWgJ4ufJLU=;
 b=Oy/ctzBXA4YDoQ4k92EcChnZmI0emzNkWWRIY0hbddy6McAXa6Vo5qdxiPTYgHnDb3
 ZVsy9h3j8RL+KF1FfPkAqOq5A8OqcyA8bTpHQ4B2myOIjtG8lWW5IJCZ1PbYR4P+i5i6
 JDdM0l2PpzjZfHviYyT1AV+I8E32AfL7rc6/8NwoHbXqbP/LIn+gG0gAPKZMcrFF17x2
 A9/6tXkFo0sAErp5YKDj+TQnpYDUTR3hmMXYTn8DFQmlFLR1TRlJmFF6aU2Yu4fSYtTQ
 SVHaGCT85tk53wXXMdct8O3nyKiwS/n4f7EieU9g6EQVJ5xDnUQUrmdxY2O9NXubFFwn
 5daQ==
X-Gm-Message-State: ANoB5pnh2OrkcZcra5xUvjJ3gJi8ICa9BFz/sNs0VqGCZjudCCLyuTvY
 kozUkmCwUWTQpUNmUbVPIQ==
X-Google-Smtp-Source: AA0mqf4tF/ZFxy5NOQx96hQL7bxwIeaLFezvzgFmcVU3atu70GP5RGx1Qg1PVYgEEW9vY6fEOhgs1Q==
X-Received: by 2002:a05:6830:4cd:b0:670:73fc:fa3c with SMTP id
 s13-20020a05683004cd00b0067073fcfa3cmr17408144otd.36.1671552360486; 
 Tue, 20 Dec 2022 08:06:00 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 v15-20020a05683018cf00b0066c3bbe927esm5798631ote.21.2022.12.20.08.05.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Dec 2022 08:05:59 -0800 (PST)
Received: (nullmailer pid 635046 invoked by uid 1000);
 Tue, 20 Dec 2022 16:05:58 -0000
Date: Tue, 20 Dec 2022 10:05:58 -0600
From: Rob Herring <robh@kernel.org>
To: Johan Jonker <jbx6244@gmail.com>
Subject: Re: [PATCH v4 1/5] dt-bindings: display: rockchip: convert
 rockchip-lvds.txt to YAML
Message-ID: <167155235801.634980.18150426131189597701.robh@kernel.org>
References: <7f38e245-4fc0-1754-e75c-10c1e31bbd4d@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7f38e245-4fc0-1754-e75c-10c1e31bbd4d@gmail.com>
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
Cc: kishon@kernel.org, devicetree@vger.kernel.org,
 krzysztof.kozlowski+dt@linaro.org, hjc@rock-chips.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, vkoul@kernel.org, robh+dt@kernel.org,
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Mon, 19 Dec 2022 17:54:16 +0100, Johan Jonker wrote:
> Convert rockchip-lvds.txt to YAML.
> 
> Changed:
>   Add power-domains property.
>   Requirements between PX30 and RK3288
> 
> Signed-off-by: Johan Jonker <jbx6244@gmail.com>
> ---
> 
> Changed V3:
>   Filename matching compatible style
>   Drop "Regulator phandle for "
>   Specify properties and requirements per SoC
>   Sort order and restyle
> 
> Changed V2:
>   Fix title
> ---
>  .../display/rockchip/rockchip,lvds.yaml       | 170 ++++++++++++++++++
>  .../display/rockchip/rockchip-lvds.txt        |  92 ----------
>  2 files changed, 170 insertions(+), 92 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/rockchip/rockchip,lvds.yaml
>  delete mode 100644 Documentation/devicetree/bindings/display/rockchip/rockchip-lvds.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
