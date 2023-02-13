Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F31269444C
	for <lists+dri-devel@lfdr.de>; Mon, 13 Feb 2023 12:20:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C093E10E55A;
	Mon, 13 Feb 2023 11:20:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67C6F10E55A
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Feb 2023 11:20:34 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id mg23so5035987pjb.0
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Feb 2023 03:20:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=yhUwkGMbfcta0BgiSZrgFVKdvG85/JtJXXzQxSbA5YQ=;
 b=B6fPkWSEu9uiErCCsKFH4Qb+CG8wznVqNXHcGOl+/oxHKNpZxDDNCC8ApRe23IPnjQ
 YMiBYq8TMAIekQvSZ0iSkLAYRKr7uyTWQ62H0oUBB4+n9qzlDYR8JZFp+s9s69UTOiy/
 GZA4Y+9rDimUIXiDbwSybiOMt5Pg77f6mwfObFAzGvN5QZ8MJmGKr3WU7oyGrxGI3V1l
 evuq8IkzHWirRrvEqMefvSxk99GF5D7lncdSBEZY5SNokXebCfSzMomc4MX9NUIrtSOA
 f22sApfftWaxt8ODCbSbWRslv4Dyd9ibnkXkvr5hFEL/mXDEXR4KJcFazUxy50m5o65v
 3ioA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yhUwkGMbfcta0BgiSZrgFVKdvG85/JtJXXzQxSbA5YQ=;
 b=ojdf28Ft+/6guGJLWmQ0q08eYuJfvHGjzDEcYxNzVVgEg/6mUr1Ikw2PC3j0FRk/HS
 1w9s7N6SGQFlpAga2gsz0ljHoajR/1EgBJQT4LGicGxboUOvRfifqpgWXP1pSIEhERgW
 v9N32SwPeGa7T+UH7peQchgl4Hj0Vd06e96t0YLlRF8YACYt7XMV6IXbYL/xDsDC9ZxT
 Zt4GfBhyFppldtWrFE0J0WxFh+DHwm7Rca8pI0tGE7LCVxL88nrVbQeNLqvlhJcdBKZf
 v1x9cBfdvnnR7l+G5fYS4f0iSpSezYMAd2W3tIeKye/YQx5odSV6VVSPhOdecBTWFMKu
 6Dvg==
X-Gm-Message-State: AO0yUKW1kHVH2OTzmtvJh/uGJT/8IutcLFjxs/tCUhxfsOcZo7A6ZkcE
 FpaxFzGtdK961V6hXeeWV7U=
X-Google-Smtp-Source: AK7set+uAhLU/ISmNgXiCtRLzy+Ssc5QgA2lwcvZbThMYhB+3YMWL1TTaVsO0Mt6Wu/EUPH1xlvPQg==
X-Received: by 2002:a17:90a:195a:b0:231:284:ea4d with SMTP id
 26-20020a17090a195a00b002310284ea4dmr21468329pjh.22.1676287233846; 
 Mon, 13 Feb 2023 03:20:33 -0800 (PST)
Received: from Gentoo (n220246252084.netvigator.com. [220.246.252.84])
 by smtp.gmail.com with ESMTPSA id
 m11-20020a17090a3f8b00b002312586b5b1sm7702406pjc.57.2023.02.13.03.20.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Feb 2023 03:20:33 -0800 (PST)
Date: Mon, 13 Feb 2023 19:20:26 +0800
From: Jianhua Lu <lujianhua000@gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 1/2] dt-bindings: display: panel: Add Novatek NT36523
 bindings
Message-ID: <Y+oc+kEDoiMsebWF@Gentoo>
References: <20230210161925.32343-1-lujianhua000@gmail.com>
 <6cffa875-d8cc-a4fe-e18d-2e24c28a49d8@linaro.org>
 <Y+oZOXyE8/a+vreS@Gentoo>
 <ad5dd369-842f-7301-e57d-d0445f0a5268@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ad5dd369-842f-7301-e57d-d0445f0a5268@linaro.org>
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
Cc: devicetree@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 13, 2023 at 12:08:27PM +0100, Krzysztof Kozlowski wrote:
> On 13/02/2023 12:04, Jianhua Lu wrote:
> > On Mon, Feb 13, 2023 at 11:45:23AM +0100, Krzysztof Kozlowski wrote:
> >> On 10/02/2023 17:19, Jianhua Lu wrote:
> >>> Novatek NT36523 is a display driver IC that can drive DSI panel. It
> >>> is also present in the csot and boe video mode panels. It is found
> >>> in Xiaomi Mi Pad 5 series.
> >>>
> >>> Signed-off-by: Jianhua Lu <lujianhua000@gmail.com>
> >>> ---
> >>>  .../display/panel/novatek,nt36523.yaml        | 101 ++++++++++++++++++
> >>>  1 file changed, 101 insertions(+)
> >>>  create mode 100644 Documentation/devicetree/bindings/display/panel/novatek,nt36523.yaml
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/display/panel/novatek,nt36523.yaml b/Documentation/devicetree/bindings/display/panel/novatek,nt36523.yaml
> >>> new file mode 100644
> >>> index 000000000000..a7098d0ce7e1
> >>> --- /dev/null
> >>> +++ b/Documentation/devicetree/bindings/display/panel/novatek,nt36523.yaml
> >>> @@ -0,0 +1,101 @@
> >>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> >>> +%YAML 1.2
> >>> +---
> >>> +$id: http://devicetree.org/schemas/display/panel/novatek,nt36523.yaml#
> >>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >>> +
> >>> +title: Novatek NT36523 based DSI display Panels
> >>> +
> >>> +maintainers:
> >>> +  - Jianhua Lu <lujianhua000@gmail.com>
> >>> +
> >>> +description: |
> >>> +  The nt36523 IC from Novatek is a generic DSI Panel IC used to drive dsi
> >>> +  panels.
> >>> +  Right now, only support cost and boe LCD display panels with the
> >>
> >> boe? both?
> > Boe Technology Group Co., Ltd
> 
> Then what is "cost"? If both are names, then they start with capital
> letters or how the company officially spells itself.
both are company name, I will search offical name for it.
> 
> >>
> >>> +  resolution of 1600x2560. It is a video mode DSI panel.
> >>
> >> The binding or hardware supports only 1600x2560? The how it can be
> >> "right now"? It's defined, isn't it?
> > Yes
> 
> What yes? How it can be "right now"? It implies it will change, so how
> hardware can change?
sorry, my wrong. This binding only support 1600x2560.
> 
> 
> Best regards,
> Krzysztof
> 
