Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B9762853BB
	for <lists+dri-devel@lfdr.de>; Tue,  6 Oct 2020 23:15:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0E176E10F;
	Tue,  6 Oct 2020 21:15:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
 [209.85.210.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EC176E10F
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Oct 2020 21:15:10 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id m11so146221otk.13
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Oct 2020 14:15:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=HGYIv2AU6G8hcb11jN8PweilRadJB+OxU+0ieq8K4l0=;
 b=ZDpEF47HTbUTfDAdzNoTnQzytfGdYh/Xhd+b+k8mJsGX1+g2s2J9Qu2B3tH75VKZPb
 UhhjOa+UG46EzceEx54YsRKXkYmOsTGhHLxwFyFunWyNlKLQxRfqAWGtUKKkNdaoJHKA
 xMZCwl+R7krFfVmTw1WxgtUoNkDlX3nce+aiwEdFN+VS300d0w2yuJ0QIT6ErmRQEdVi
 kthiq+jlaQQCUYDmJZMbPztLaOV8eXreqapC4t3RSdTHxx71oWKqXztAXeF0mHIpL+de
 l4EafYVyuF/hewoW/SqPy+GJKH7DcfP4OeOxrlAvqohCf4fYxzo1OGoygtjVz5V6oWyV
 uQ+Q==
X-Gm-Message-State: AOAM530qUKK+G3UYFaucZss11KGAP4ORusp08S/L5Qd3Sz/GatsX9mGd
 5GlQsNLl5hoNqEPAnlAAE3ZxTyjSBlwz
X-Google-Smtp-Source: ABdhPJxiseZ6WSJ4JafEr4Vo25mS58EcA9DAaXYFrrpEWQMaKwJycEjRJ/62oyy5082H+w5nm6ie9g==
X-Received: by 2002:a05:6830:1091:: with SMTP id
 y17mr4331385oto.160.1602018909540; 
 Tue, 06 Oct 2020 14:15:09 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id r1sm1708993otc.2.2020.10.06.14.15.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Oct 2020 14:15:09 -0700 (PDT)
Received: (nullmailer pid 2854702 invoked by uid 1000);
 Tue, 06 Oct 2020 21:15:08 -0000
Date: Tue, 6 Oct 2020 16:15:08 -0500
From: Rob Herring <robh@kernel.org>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH] dt-bindings: mxsfb: Add compatible for i.MX8MM
Message-ID: <20201006211508.GA2853753@bogus>
References: <20201003224801.164112-1-marex@denx.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201003224801.164112-1-marex@denx.de>
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
Cc: devicetree@vger.kernel.org,
 Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>, Shawn Guo <shawnguo@kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 04 Oct 2020 00:48:01 +0200, Marek Vasut wrote:
> NXP's i.MX8MM has an LCDIF as well.
> =

> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Guido G=FCnther <agx@sigxcpu.org>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: NXP Linux Team <linux-imx@nxp.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Shawn Guo <shawnguo@kernel.org>
> ---
>  Documentation/devicetree/bindings/display/mxsfb.txt | 1 +
>  1 file changed, 1 insertion(+)
> =


Acked-by: Rob Herring <robh@kernel.org>

Though Laurent posted converting this to schema...
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
