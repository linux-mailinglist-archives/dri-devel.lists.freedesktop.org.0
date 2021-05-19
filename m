Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8809B3891F3
	for <lists+dri-devel@lfdr.de>; Wed, 19 May 2021 16:51:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86A546EDDE;
	Wed, 19 May 2021 14:51:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12ED86EDDE
 for <dri-devel@lists.freedesktop.org>; Wed, 19 May 2021 14:51:02 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 f75-20020a1c1f4e0000b0290171001e7329so3493508wmf.1
 for <dri-devel@lists.freedesktop.org>; Wed, 19 May 2021 07:51:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=9hWo+oUpcm6brp7QVlWP1qMLhPG7on+ugtgTIWdWGgk=;
 b=DkbY+S6Kg6quQSONCtHMXfCOVH4OqhINL2j5T2IQkq270nlPjxKYMOHAvn7NWQh8X3
 Jhma/fsIgCa0KwMhVLvInBhtvcRSi7uxPlGlTwbvO6clzDTUen87CWrbzK5cRjybbWRP
 PhJn84d1pBheNl2WpfksWb0E2d+ClU+7OKVwGil1F+lQanIzMlgNYDRkpjv5F54gFZAF
 JqAdn/Wh9QK5zpJOpgWnqRxeQRToHI85pqtl/YpVaxYF47j9Nz2GikmJ0e3/mhMoEV2F
 Fr0AE4zoSCrxSgKOhdk2qoKqrJ8Bsm9nTRjKH8MfzK/wIo1B8JlgqujcclkxDnRVOdcB
 2MVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=9hWo+oUpcm6brp7QVlWP1qMLhPG7on+ugtgTIWdWGgk=;
 b=kO6iuGy4wJLF1XUhRT0IyTLmnjLabIwDiCm6e/LuD1HUp7dhbdtjeSiNDosMin3n2M
 atL9CY8RjGn5pwcDViu9f9VSLuSz4i21WEg8N5KQCrrv0OPDtF6+xP+PCdUD6ESCPLfR
 Qt8mhGlFzkjoUclpctO+JCUaJIdYpA6UZPbNn9nKzTXo3Rfb3T5cVsV2x9bdZI2mDz3D
 pMi1UwtThr1JXmWZOMhujiGoNRjUUXtFaDFSliuh7WmG4nhwIqCdD6VJdJSIGj2vJ1e3
 Jx0ThYV+nYRduPWDJ0AC60pSHq3+sUE2A3tvdgmXwr5P4kC/i+58wWws4B8kmbEYq0k5
 843Q==
X-Gm-Message-State: AOAM533F3oa5TXQncug4oH4jvTH9tc6EJnttOY4qcU9vgbHrM1KxRmcH
 YuxTjqbjDSeH/O2ALi39LdDgEQ==
X-Google-Smtp-Source: ABdhPJxq4yOvrbz4+GMdrRqg0XGhy30GzDMOvEMevBFgiblHVaKtLBRosn/C9Txh2zMPl8KgwasAgQ==
X-Received: by 2002:a05:600c:4f4d:: with SMTP id
 m13mr12270205wmq.4.1621435860634; 
 Wed, 19 May 2021 07:51:00 -0700 (PDT)
Received: from dell ([91.110.221.215])
 by smtp.gmail.com with ESMTPSA id l8sm7188514wry.55.2021.05.19.07.50.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 07:51:00 -0700 (PDT)
Date: Wed, 19 May 2021 15:50:58 +0100
From: Lee Jones <lee.jones@linaro.org>
To: cy_huang <u0084500@gmail.com>
Subject: Re: [PATCH v7 3/4] mfd: rt4831: Adds DT binding document for Richtek
 RT4831
Message-ID: <20210519145058.GF2549456@dell>
References: <1621262161-9972-1-git-send-email-u0084500@gmail.com>
 <1621262161-9972-3-git-send-email-u0084500@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1621262161-9972-3-git-send-email-u0084500@gmail.com>
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
 b.zolnierkie@samsung.com, jingoohan1@gmail.com, lgirdwood@gmail.com,
 robh+dt@kernel.org, linux-fbdev@vger.kernel.org, cy_huang@richtek.com,
 broonie@kernel.org, dri-devel@lists.freedesktop.org, pavel@ucw.cz,
 linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 17 May 2021, cy_huang wrote:

> From: ChiYuan Huang <cy_huang@richtek.com>
> 
> Adds DT binding document for Richtek RT4831.
> 
> Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
>  .../devicetree/bindings/mfd/richtek,rt4831.yaml    | 90 ++++++++++++++++++++++
>  1 file changed, 90 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/richtek,rt4831.yaml

Applied, thanks.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
