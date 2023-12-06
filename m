Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADA42807AD7
	for <lists+dri-devel@lfdr.de>; Wed,  6 Dec 2023 22:53:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7A3A10E00A;
	Wed,  6 Dec 2023 21:53:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com
 [209.85.167.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4106710E7C1
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Dec 2023 21:53:37 +0000 (UTC)
Received: by mail-oi1-f171.google.com with SMTP id
 5614622812f47-3b9b5bff21dso209016b6e.2
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Dec 2023 13:53:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701899616; x=1702504416;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TRApxN84tK1OELGvRIkKXdOvX6UMTgem7J1gQuAhgrg=;
 b=wpEBpKA8N2gMnv2vbYc7WdVZU+WzuipfCXYivqncBOV4IaSvwz8LZ4HxdAQ/D9E+Ys
 FxvElCdr7u9DnduuHW9OdYzHMLiJNkm4qHeI6DJpRW941Q/niy8xWxgy/r5yFtkWoj+W
 90R6gf7ku21hSZ3sod4O5Q2LrRTF+qVs7jPSDuqbdKWIpjNhYw1VNSSSVyp+TuM1he1T
 A4k3Pjr6LZB42Ktf6i5kCED5P8/wdnrUdMdmKy5uAumuQCJ3DzgJ8SD6CUhoMQAhqrid
 rD6BN7+9oA5TDoX4iUtohoQ5i329TcqMAr1FXdGGupU1RBvRvEJ44lQkDvv6YVKg73HW
 o1Xg==
X-Gm-Message-State: AOJu0Yyh9yqi6Ip51aZe3ZRmu3Rr6HRoBDvOpbcJtTb9Dz2pa6RUqpPr
 3LxNu0Hc5jRM9nqMjbor6w==
X-Google-Smtp-Source: AGHT+IGSHMJia4JEhVitpl4rHwyzT+vJEYWcrBDIAeXj93oiVLvFAOezZjEaBHHG5bU3owr8bMVpeg==
X-Received: by 2002:a05:6808:218e:b0:3b2:ef9e:45af with SMTP id
 be14-20020a056808218e00b003b2ef9e45afmr2100596oib.13.1701899616447; 
 Wed, 06 Dec 2023 13:53:36 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 bd32-20020a056808222000b003ae11a7ab80sm141791oib.47.2023.12.06.13.53.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Dec 2023 13:53:35 -0800 (PST)
Received: (nullmailer pid 3390127 invoked by uid 1000);
 Wed, 06 Dec 2023 21:53:34 -0000
Date: Wed, 6 Dec 2023 15:53:34 -0600
From: Rob Herring <robh@kernel.org>
To: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v2] dt-bindings: lcdif: Properly describe the i.MX23
 interrupts
Message-ID: <170189961308.3390031.1609585569246344819.robh@kernel.org>
References: <20231206112337.2234849-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231206112337.2234849-1-festevam@gmail.com>
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
Cc: marex@denx.de, devicetree@vger.kernel.org, conor+dt@kernel.org,
 Fabio Estevam <festevam@denx.de>, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Wed, 06 Dec 2023 08:23:37 -0300, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
> 
> i.MX23 has two LCDIF interrupts instead of a single one like other
> i.MX devices.
> 
> Take this into account for properly describing the i.MX23 LCDIF
> interrupts.
> 
> This fixes the following dt-schema warning:
> 
> imx23-olinuxino.dtb: lcdif@80030000: interrupts: [[46], [45]] is too long
>         from schema $id: http://devicetree.org/schemas/display/fsl,lcdif.yaml#
> 
> Signed-off-by: Fabio Estevam <festevam@denx.de>
> Reviewed-by: Marek Vasut <marex@denx.de>
> ---
> Changes since v1:
> - Add missing else to limit the number of irqs for the other variants. (Krzysztof)
> 
>  .../bindings/display/fsl,lcdif.yaml           | 20 ++++++++++++++++++-
>  1 file changed, 19 insertions(+), 1 deletion(-)
> 

Applied, thanks!

