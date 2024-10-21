Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0CA99A65DF
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2024 13:06:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7570710E496;
	Mon, 21 Oct 2024 11:06:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="KvVozbqi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2C1B10E496
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2024 11:06:45 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-539e8586b53so4517459e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2024 04:06:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729508804; x=1730113604; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=RnolULg5KM7EXLrBuCEsj9PWWGa59GTkIO/LQyKKSQ4=;
 b=KvVozbqi+hbaFfgUw7/yJRjmwUV/moKYF1Ili9Ndzli+IYqOUkUrdB+oK49hLDtg/H
 T2yADaq0SPZ1vTXz6jhdOueDUSKVUuutWTBKV5HZxeSH7Q2nGBnooZXAU8AKsvSKmuwN
 AiQhXKEhXYXT9qeJjzL/R2jdeChuBFmNfoH6SL/Oc03B/+w9r3nZQlN/1kn5E3hQuS3o
 G7Tj1gm37YWGGgM4sumDwLyiWa0LoVREXqQgxZ3TL66Vlj0cDNad7Ozzbf6Zdw9mbuey
 0/WR5OvC57b/xvYD0ZZPfUKbmXff4LsP18yM+dtaGm642k+RgLd6wIGzn2LS/rJEoIqV
 /Tzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729508804; x=1730113604;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RnolULg5KM7EXLrBuCEsj9PWWGa59GTkIO/LQyKKSQ4=;
 b=a+YlOQe9+2ZM7aBlWgTc7npp6UodE/dMkjc2jzcL75K57MAEe69SPbbotg5rICJq0L
 zqAv933P3bcEpDhMHLv/mRt9XDcQrw2J1tnyWwwUe6m5iDMYFyW4KRHpEMWv3mWNDoNc
 MwUrlfdklRVH8UpjrPKJBg+r9IRKLzUvKVVihj8/X/WQyyp4ivmPf6VwkIvAtXMeddGR
 aFzHfoNd6ukfyuUUSC0XUQlAOHOzszTOzyfMEy1vIfTt/OlL58ItaCUC+3yeAmmLINl9
 rNI5GbcIb3/AJ6Ooacf4/WBq2AbMsjeD0GkNaYCNx5XeYpa0gg7iriBBbuC76rUoHzAU
 E4WA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWDOYFg56pUTl9xRrEfKPBHDt+vX4qHGCTKQQ3/EMG918l10pBlJp00nYsL4u/OOqrpXAbghqccX2E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyRVhDz94GmFkbEbxIdG5mKoq+t4yXmyaT91MNOYHMCLoNnOnr4
 WbTXPuGuxe/yas8U1J/j3Wa+VXlswitIqbJmKxWGpNWfM9UQ2/YtlKSodXf1PDk=
X-Google-Smtp-Source: AGHT+IGm7aR5j3IDD6zj2Is7qEysFSvXPXkRuXdOrYhmnokCl1jooJeLNZfITl/g4HX8vOeeK4W3tw==
X-Received: by 2002:a05:6512:3d8b:b0:539:e263:331c with SMTP id
 2adb3069b0e04-53a1586059emr4022787e87.17.1729508803900; 
 Mon, 21 Oct 2024 04:06:43 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53a2242017csm456428e87.130.2024.10.21.04.06.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Oct 2024 04:06:42 -0700 (PDT)
Date: Mon, 21 Oct 2024 14:06:40 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Liu Ying <victor.liu@nxp.com>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 andrzej.hajda@intel.com, 
 neil.armstrong@linaro.org, rfoss@kernel.org, Laurent.pinchart@ideasonboard.com,
 jonas@kwiboo.se, jernej.skrabec@gmail.com, airlied@gmail.com, simona@ffwll.ch, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, 
 krzk+dt@kernel.org, conor+dt@kernel.org, quic_jesszhan@quicinc.com, 
 mchehab@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, 
 kernel@pengutronix.de, festevam@gmail.com, catalin.marinas@arm.com,
 will@kernel.org, sakari.ailus@linux.intel.com, hverkuil@xs4all.nl,
 tomi.valkeinen@ideasonboard.com, 
 quic_bjorande@quicinc.com, geert+renesas@glider.be, arnd@arndb.de,
 nfraprado@collabora.com, 
 thierry.reding@gmail.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 sam@ravnborg.org, marex@denx.de, biju.das.jz@bp.renesas.com
Subject: Re: [PATCH v3 09/15] dt-bindings: display:
 panel-simple-lvds-dual-ports: Reference lvds-dual-ports.yaml
Message-ID: <xzvjrvp6raqeyx555x3msbdm3ugyjefv4b5qv3dwt3thnblsvf@r37cjtcicuuv>
References: <20241021064446.263619-1-victor.liu@nxp.com>
 <20241021064446.263619-10-victor.liu@nxp.com>
 <3qrtknxsgxzyhwivd7d4eqqg7v6twgtczxotg7rhkdumjkl3p7@u2fso5hexiu4>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3qrtknxsgxzyhwivd7d4eqqg7v6twgtczxotg7rhkdumjkl3p7@u2fso5hexiu4>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Oct 21, 2024 at 09:43:30AM +0200, Krzysztof Kozlowski wrote:
> On Mon, Oct 21, 2024 at 02:44:40PM +0800, Liu Ying wrote:
> > This schema documents LVDS panels with dual links.  lvds-dual-ports.yaml
> > documents dual-link LVDS display common properties.  Reference the ports
> > property defined in lvds-dual-ports.yaml to save lines.
> > 
> > Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > Signed-off-by: Liu Ying <victor.liu@nxp.com>
> > ---
> > v3:
> > * New patch.  (Dmitry)
> > 
> >  .../panel/panel-simple-lvds-dual-ports.yaml   | 20 +------------------
> >  1 file changed, 1 insertion(+), 19 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple-lvds-dual-ports.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple-lvds-dual-ports.yaml
> > index 10ed4b57232b..e80fc7006984 100644
> > --- a/Documentation/devicetree/bindings/display/panel/panel-simple-lvds-dual-ports.yaml
> > +++ b/Documentation/devicetree/bindings/display/panel/panel-simple-lvds-dual-ports.yaml
> > @@ -22,6 +22,7 @@ description: |
> >    If the panel is more advanced a dedicated binding file is required.
> >  
> >  allOf:
> > +  - $ref: /schemas/display/lvds-dual-ports.yaml#
> >    - $ref: panel-common.yaml#
> 
> So dual link panels common binding does not fit here? sorry, this is
> just introducing mess and confusion.

Why? It's allOf, so it is panel-common.yaml AND lvds-dual-ports.yaml.
Where does the confusion come from?

-- 
With best wishes
Dmitry
