Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C37455BA45
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jun 2022 16:07:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BBB110ECC6;
	Mon, 27 Jun 2022 14:07:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E11D1120D4
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jun 2022 14:07:25 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id o4so9289604wrh.3
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jun 2022 07:07:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=gsgc6DIOzArZPsUhaJm6TQBUqT+cOuEtKePYXM55dn8=;
 b=RwHx2DUc+zQdZoM/fppv9uMqeCAsq+OTGc/uLrz+5I2GWcjSb+HNw7JV4svTtEhUy7
 vIFfvyGeQMDZyn3ImibEdKS/PIZ63/tO5OCzlNTZhFo1Vfo96vu2exkNVAVWPKeof0N8
 0Xu3lAWYFac0xwHZL5TSyegckajoASkwSSjl2HAGRLtOx4jZ3SS/gGt1JuEYfTGfE5r7
 CfAeuR2t91wZvVhojT3UVBbHVMkvmi5uytl/EmCfOYw1azGp9xArgKPoVQwAZNtbZAqs
 TYIFnFm/FWbbSQPZTSwobvd1SzOXoFJxmGpy6ujesCML//e9Al0NiJzMqwlc60Uz/OOc
 G1+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=gsgc6DIOzArZPsUhaJm6TQBUqT+cOuEtKePYXM55dn8=;
 b=6r3H06PWhNc51iMfkiyhYaG5Rp1NwGXKFUaCUvFwFzIc8gsNe5c92cBAyVjCwbjWIi
 /OFeZ1l017cWQknTgzBHBR8S9x2qsyyWIX7tOwdhyQYn8HyXOBWYQawyk9vEtwHLY5/9
 d2Wyd99ChWSfHZmjOKCpvoMH4gujucrPPt4OgiQtDssqU8HpTM2So0tW/DknqKF/gV0f
 3EMX2VSIsZC1qbgEdNb6ANjT2Pdfa3SEYvsboe/CwTFpSXXuuwrVtvxjYSQLJYZyjnn0
 n88v56GmjEzb06EBxWLMWW0m/7GLS7cVsSUUWAVqq2N7cTLvsAYVBgKsXXLx7eupbeU/
 YZsg==
X-Gm-Message-State: AJIora8K93VIN8by0ASKLZp1scjnY6CjLNq+bqmfkNDoMNL/VZODmFXb
 IHbblEfP+VN9GEDayT9zZPJBjg==
X-Google-Smtp-Source: AGRyM1tqOffr5P69k2JXSjDJ26X0SHzGuAeWDAQMALNpO6JuPQMieD2zfhpuXvwpbHW0niVy/fmg2g==
X-Received: by 2002:a05:6000:80f:b0:21b:927a:16b1 with SMTP id
 bt15-20020a056000080f00b0021b927a16b1mr12143982wrb.440.1656338843969; 
 Mon, 27 Jun 2022 07:07:23 -0700 (PDT)
Received: from google.com (cpc155339-bagu17-2-0-cust87.1-3.cable.virginm.net.
 [86.27.177.88]) by smtp.gmail.com with ESMTPSA id
 f17-20020a7bcd11000000b0039c811077d3sm13142680wmj.22.2022.06.27.07.07.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 07:07:23 -0700 (PDT)
Date: Mon, 27 Jun 2022 15:07:21 +0100
From: Lee Jones <lee.jones@linaro.org>
To: cy_huang <u0084500@gmail.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: backlight: rt4831: Add the new ocp
 level property
Message-ID: <Yrm5mRvVm2yl7zKc@google.com>
References: <1655807788-24511-1-git-send-email-u0084500@gmail.com>
 <1655807788-24511-2-git-send-email-u0084500@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1655807788-24511-2-git-send-email-u0084500@gmail.com>
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
Cc: devicetree@vger.kernel.org, daniel.thompson@linaro.org,
 krzysztof.kozlowski+dt@linaro.org, lucas_tsai@richtek.com,
 jingoohan1@gmail.com, deller@gmx.de, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 cy_huang@richtek.com, robh+dt@kernel.org, pavel@ucw.cz,
 linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 21 Jun 2022, cy_huang wrote:

> From: ChiYuan Huang <cy_huang@richtek.com>
> 
> Add 'richtek,bled-ocp-microamp' property to make it chooseable.
> 
> The wrong backlight ocp level may affect the backlight channel output
> current smaller than configured.
> 
> Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
> Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
> Since v3:
> - Refine the description for backlight ocp property.
> - Use the enum to list the supported value.
> 
> Since v2:
> - Change the property name from 'richtek,bled-ocp-sel' to 'richtek,bled-ocp-microamp'.
> 
> ---
>  .../devicetree/bindings/leds/backlight/richtek,rt4831-backlight.yaml | 5 +++++
>  1 file changed, 5 insertions(+)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Principal Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
