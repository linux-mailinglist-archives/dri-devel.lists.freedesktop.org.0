Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E38A6E38A8
	for <lists+dri-devel@lfdr.de>; Sun, 16 Apr 2023 15:32:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2827010E101;
	Sun, 16 Apr 2023 13:32:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCDCF10E101
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Apr 2023 13:32:00 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id q23so47985773ejz.3
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Apr 2023 06:32:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681651918; x=1684243918;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6JdNGYn7ATErhvA1sUBmn8DjGAPLnDdtrFLVnGWMoc4=;
 b=CKDBa6gKS+JJAQOxB3ElN/nd9k2MKyzH1GLlWozxzcaJR2dJ3bKuGYKnmi1mMLGXCS
 FrZXfuBtPgf5E7G65C1gDgKxLCcfBeOBvPzgG9lH3V6BkNTT/PaUdJpY3v2kneykuk9s
 KaP56hDIiccMScOjuAlY3WlIQsCoYZmEx0gkgbl+PoQY5rNZIKMYHVvZUiaDGJzPsIU+
 fat7UlrKFKPmunxWauMHMHXNliZziRKEVDlPwRMKxaEuk+Zc+5HGhqslxzYm3cjTTCQe
 WwWQSWd5ngHpamlDBhVvdeksdtOuoaeluI+8CPsJ2xI1Kt4qLC/5fHUI9zJDhrdYb7dZ
 2KwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681651918; x=1684243918;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6JdNGYn7ATErhvA1sUBmn8DjGAPLnDdtrFLVnGWMoc4=;
 b=bti8nhylovYl/FBFhPfPm1qrCbBP62nIy0+A9wgvm22OL47a4VwM3Gqn29yNUaGphz
 cPjtOHB2kBxsRBwWh4t/qk+h9x8DVQjxx6cg5LdiKVhNU3UxfzgTwGI3WArY+wc/uunG
 dyOR9Jfp5HBVXCph4gAvPTeIalHpcI9g9DFMP+U9W2aLtz/aTdsPkRwvWLkYwUP+gp95
 Z14ZnaHCuVc0iB1XEW5fmbaprwcPpnsmuIh8ADljJ/Tjrw1UMIDdIs2Hp/LJM35KnDiE
 RxOTWsGyvy3rcxpVk2gqOrOPslz7JSGR23GDDWN6Df9Ig3uXVqHRzZGwKARcbhNMpSgo
 A5jg==
X-Gm-Message-State: AAQBX9dosXu+USz4wkRs02Hgmfc0Sm0JWg8Xu0e9L2qjDEXEYeGfLntY
 S+AHS+/rlWt3LP+OsX+inXw=
X-Google-Smtp-Source: AKy350agXy7aE/aJS4jJ15TKpLErwEJZj78+qOwH9nVYLbGTOcJD/smUnMqrvq5muFXhioghT0nC7w==
X-Received: by 2002:a17:906:30c3:b0:94e:e1c7:31b4 with SMTP id
 b3-20020a17090630c300b0094ee1c731b4mr4474093ejb.48.1681651918086; 
 Sun, 16 Apr 2023 06:31:58 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-1-233.dynamic.telemach.net.
 [82.149.1.233]) by smtp.gmail.com with ESMTPSA id
 ww4-20020a170907084400b0094f62a3197asm560513ejb.202.2023.04.16.06.31.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Apr 2023 06:31:57 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 3/3] ARM: dts: sun8i: h3: beelink-x2: Disable DW-HDMI CEC
Date: Sun, 16 Apr 2023 15:31:56 +0200
Message-ID: <2675247.mvXUDI8C0e@jernej-laptop>
In-Reply-To: <20230416132531.GA28551@pendragon.ideasonboard.com>
References: <20230415104613.61224-1-jernej.skrabec@gmail.com>
 <20230415104613.61224-4-jernej.skrabec@gmail.com>
 <20230416132531.GA28551@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
Cc: neil.armstrong@linaro.org, rfoss@kernel.org, andrzej.hajda@intel.com,
 samuel@sholland.org, jonas@kwiboo.se, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, wens@csie.org, robh+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, krzysztof.kozlowski+dt@linaro.org,
 hverkuil-cisco@xs4all.nl, linux-sunxi@lists.linux.dev,
 devicetree@vger.kernel.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Dne nedelja, 16. april 2023 ob 15:25:31 CEST je Laurent Pinchart napisal(a):
> Hi Jernej,
> 
> Thank you for the patch.
> 
> On Sat, Apr 15, 2023 at 12:46:13PM +0200, Jernej Skrabec wrote:
> > Beelink X2 uses software implementation of CEC even though DW-HDMI has
> > working hardware implementation.
> 
> Why ? The reason should be explained in the commit message.

Maybe I should reword this differently. It uses software implementation through 
GPIO pin. Dedicated DW-HDMI CEC pin is left unconnected.

Best regards,
Jernej 

> 
> > Disable unused DW-HDMI CEC.
> > 
> > Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> > ---
> > 
> >  arch/arm/boot/dts/sun8i-h3-beelink-x2.dts | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/arch/arm/boot/dts/sun8i-h3-beelink-x2.dts
> > b/arch/arm/boot/dts/sun8i-h3-beelink-x2.dts index
> > a6d38ecee141..38f40d69e5c5 100644
> > --- a/arch/arm/boot/dts/sun8i-h3-beelink-x2.dts
> > +++ b/arch/arm/boot/dts/sun8i-h3-beelink-x2.dts
> > @@ -150,6 +150,7 @@ &emac {
> > 
> >  };
> >  
> >  &hdmi {
> > 
> > +	snps,disable-cec;
> > 
> >  	status = "okay";
> >  
> >  };




