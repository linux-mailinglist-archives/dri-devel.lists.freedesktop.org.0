Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D4BE36AFB19
	for <lists+dri-devel@lfdr.de>; Wed,  8 Mar 2023 01:29:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A073810E57C;
	Wed,  8 Mar 2023 00:29:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95D9810E57B
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Mar 2023 00:29:37 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id
 y15-20020a17090aa40f00b00237ad8ee3a0so424565pjp.2
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Mar 2023 16:29:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678235377;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=neil0YcjMg5OlZpgLIxN4QQb0hZIOV/hSlbbEvfwcFw=;
 b=O5S1Vcfg3uY4QpCcu7Bp2GrToAHmSBtsVBC0XsCmkclppUzv3Czvwb/cxp3/oF3yAJ
 sTq2vumZPMfNUZA25qjAnkfphtJ8ApfZEbG8JR50UQLnNDwFMNYB+GlhUvr/fvK3cWsh
 D2aVK/uP0FaUYo0POzsZfW6++y92hYyRz9v5cfFMDOY2+LSUut9Zy3HTX6b9DMwtvGKP
 iGz+HpYH1BID6cNO0mH3wdDVGRCBb9jqsyPORcd9V34qO9IhymsSaTK0FRyzc/RXi7IZ
 JzlzW3LYDrQ770ouZkZy9PMv2D6QviuA3HdxYqfMMHq5do9PWpxPdDMM6GYvkI21Bms+
 yOQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678235377;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=neil0YcjMg5OlZpgLIxN4QQb0hZIOV/hSlbbEvfwcFw=;
 b=6mcpkPdmdnm9On4M28Y/0RRKgVFwvsabNymtYO7c1BunymxXzjZxM5yZUAr1feVp+b
 qpzTm4GYsECXhhuB4FuJhhtlDBDfLQNyMW4zp8I2Ygrgx3v2E9Zp+x+TpKGJQDUc/xe4
 jUOxgJ9GxhpWh7hcUGLqsE5BMvIisnSkUQx/rlB5/os4p4NhxEXFSXxjHEOIcZ8HWSN4
 b1b92T7v2/s1YzQwiV8JSp0HpBTXrCSQ8jzRZfkoSIoSBnV/Y+H4s2E6N8RUw5YpGUat
 bggE9kSU5Phl8S1NH61qp2ofAoIGX62cQ3AM9qc5AL/YQq/Wwi1wF30FGtAicXkWaYT+
 LHjQ==
X-Gm-Message-State: AO0yUKWRPhL2f/Hj61pOSJkDD1XwjMjQ9+NFPsA7QTvGxRpFAxbzHn16
 YYYEZ71hfRwKP1zaklrD+7w=
X-Google-Smtp-Source: AK7set8TC6sUXmdHpRsNnZmMrxB0ZJ2/9fbZMOAORQMMKffjtrjfGvxtdRek02q0fbuwZk3Wcpn+uA==
X-Received: by 2002:a17:90b:17c4:b0:234:e0c:caaa with SMTP id
 me4-20020a17090b17c400b002340e0ccaaamr17074287pjb.6.1678235377098; 
 Tue, 07 Mar 2023 16:29:37 -0800 (PST)
Received: from Gentoo (n220246252084.netvigator.com. [220.246.252.84])
 by smtp.gmail.com with ESMTPSA id
 k20-20020a63d854000000b004fbb4a55b64sm8311779pgj.86.2023.03.07.16.29.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 16:29:36 -0800 (PST)
Date: Wed, 8 Mar 2023 08:29:28 +0800
From: Jianhua Lu <lujianhua000@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: display: panel: Add Novatek NT36523
 bindings
Message-ID: <ZAfW6AbFLkKwxZZA@Gentoo>
References: <20230220121258.10727-1-lujianhua000@gmail.com>
 <CACRpkdZ=6bU2gPv4zVzMBFaCgEY+fkRbrnLAB6NGOhWus1gwaA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdZ=6bU2gPv4zVzMBFaCgEY+fkRbrnLAB6NGOhWus1gwaA@mail.gmail.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org,
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 07, 2023 at 11:22:35PM +0100, Linus Walleij wrote:
> On Mon, Feb 20, 2023 at 1:13 PM Jianhua Lu <lujianhua000@gmail.com> wrote:
> 
> > Novatek NT36523 is a display driver IC used to drive DSI panels.
> >
> > Signed-off-by: Jianhua Lu <lujianhua000@gmail.com>
> > ---
> > Changes in v2:
> >   - Drop unnecessary description
> >   - dsi0 -> dsi
> >   - Correct indentation
> 
> I'd like Konrad and Neil to look at this before we merge it.
> 
> > +required:
> > +  - compatible
> > +  - reg
> > +  - vddio-supply
> > +  - vddpos-supply
> > +  - vddneg-supply
> 
> It appears vddpos and vddneg are not necessary on
> all variants, can they be made non-required?
It can be non-required, this panel's positive regulator and negative
regulator are supplied by backlight IC, the both regulator of Konrad's
NT36523W panel are supplied by secure firmware layer.
> 
> It is also possible to do some - if -construction of course
> based on the compatible, if we want to be fancy.
> 
> Yours,
> Linus Walleij
