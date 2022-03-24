Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 863C24E68A6
	for <lists+dri-devel@lfdr.de>; Thu, 24 Mar 2022 19:28:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EB8C10E217;
	Thu, 24 Mar 2022 18:28:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A19A10E217
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Mar 2022 18:28:02 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id c62so6621017edf.5
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Mar 2022 11:28:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+ygG+HH337q5v9sz6PqzrvY4iKgWE93C7S5i0O4f63g=;
 b=oc8kTVbhwa6wJC/gXWdCu77hRiGAU4REtV7s9DWb3cpLca+yc8cuMzLzxSzy+v+GxU
 U3bM2+ZjbgoFLF18bj3GlU9iSeUSayVsnczoCwX0VDcahl/YjTIEt0PxQsL03TSeC6Up
 FabZWtlpAud5LOAXBRyg7zWRZcO2ow0PkmLss=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+ygG+HH337q5v9sz6PqzrvY4iKgWE93C7S5i0O4f63g=;
 b=No5Ly9mQOjJL7/x1C3liBLlkPaZiNERX7Xwte5vNmVRvKcc+ZMWFbjHbVMICvyqQfA
 Ns9NBFiCKzt5K7BUtHvKSVvAZYYYP58so/g+QL0JvKNaxErVmdCxvmL4bXpP9UjInvWX
 PxShuuxtrDLzNymN8xNoqwnk6PfRc/RwF3V026mvae6W4caHnJsQ58vjh335SbX3jUhh
 5hInLwP906T7/5dpiyCA9gMj9QL0N5x65sgl2px5Jw7loFN/gzhtooVTBgesYrHLhmcf
 S7I4Q+AZLpFgaXYPBCIxWGOrzpozU9s+mNzMVc4adQV4szRs0tgaQ1P70jW6mPo1cP2Y
 o8JQ==
X-Gm-Message-State: AOAM530LO0t9Siz282LorymLdM4xSbnRbbpOW0yU9HBIqXjFm6P8Koqy
 XC7ZSOVJpputThMiMHcYxsoCVooXdjCHdlOa
X-Google-Smtp-Source: ABdhPJye2IhSW2DUW2tJxWbdGtSFkU+gutVHZAgAINDZfWVkvL7bggm47pimfXbt7f/rckyA7QZjzg==
X-Received: by 2002:a05:6402:90c:b0:415:d340:4ae2 with SMTP id
 g12-20020a056402090c00b00415d3404ae2mr8270798edz.331.1648146479993; 
 Thu, 24 Mar 2022 11:27:59 -0700 (PDT)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com.
 [209.85.128.51]) by smtp.gmail.com with ESMTPSA id
 mp33-20020a1709071b2100b006db6dea7f9dsm1453537ejc.168.2022.03.24.11.27.58
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Mar 2022 11:27:59 -0700 (PDT)
Received: by mail-wm1-f51.google.com with SMTP id
 p26-20020a05600c1d9a00b0038ccbff1951so1781231wms.1
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Mar 2022 11:27:58 -0700 (PDT)
X-Received: by 2002:a05:600c:4f10:b0:38c:ae36:d305 with SMTP id
 l16-20020a05600c4f1000b0038cae36d305mr15523519wmq.34.1648146478374; Thu, 24
 Mar 2022 11:27:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220324111335.1.I1131d63cbefbfa9ff107a284e2e51f880c5bf7c8@changeid>
 <20220324111335.2.I816014b6c62da5a33af5021f3cc35cea66552c00@changeid>
In-Reply-To: <20220324111335.2.I816014b6c62da5a33af5021f3cc35cea66552c00@changeid>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 24 Mar 2022 11:27:46 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X_a9aU0ZvXg1AkGS5j1oKDJmPdZt0Hs22eEcWWczTe_A@mail.gmail.com>
Message-ID: <CAD=FV=X_a9aU0ZvXg1AkGS5j1oKDJmPdZt0Hs22eEcWWczTe_A@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/panel-edp: Add AUO B133UAN01
To: Matthias Kaehlcke <mka@chromium.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, Mar 24, 2022 at 11:14 AM Matthias Kaehlcke <mka@chromium.org> wrote:
>
> Add support for the AUO B133UAN01 13.3" WUXGA panel.
>
> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> ---
> output of edid-decode:
>
>   Block 0, Base EDID:
>     EDID Structure Version & Revision: 1.4
>     Vendor & Product Identification:
>       Manufacturer: AUO
>       Model: 34196
>       Made in: 2020
>     Basic Display Parameters & Features:
>       Digital display
>       Bits per primary color channel: 8
>       DisplayPort interface
>       Maximum image size: 29 cm x 18 cm
>       Gamma: 2.20
>       Supported color formats: RGB 4:4:4
>       First detailed timing includes the native pixel format and preferred refresh rate
>     Color Characteristics:
>       Red  : 0.6513, 0.3271
>       Green: 0.2900, 0.6279
>       Blue : 0.1503, 0.0517
>       White: 0.3134, 0.3291
>     Established Timings I & II: none
>     Standard Timings: none
>     Detailed Timing Descriptors:
>       DTD 1:  1920x1200   60.026 Hz   8:5    74.192 kHz 156.100 MHz (286 mm x 178 mm)
>                    Hfront   16 Hsync  16 Hback 152 Hpol N
>                    Vfront    3 Vsync  14 Vback  19 Vpol N
>       Manufacturer-Specified Display Descriptor (0x0f): 00 0f 00 00 00 00 00 00 00 00 00 00 00 00 00 20 '............... '
>       Alphanumeric Data String: 'AUO'
>       Alphanumeric Data String: 'B133UAN01.0 '
>
>  drivers/gpu/drm/panel/panel-edp.c | 32 +++++++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)

I can review this patch and it can be landed if you really need it,
but I'd prefer not to. Instead I'd rather see the panel added to
_just_ the "edp_panels" structure. That maps the panel ID to the
delays. If we do it that way:

1. We don't need the binding.

2. We don't need to hardcode the mode in this file.

3. We support second sourcing the panel.

4. We simplify our device tree files.


Let me know if we can just go that way. If we really have a reason to
support the old hardcoded mode we can land something like this but I'd
rather avoid it if possible.

Also: note that even if we land this, adding the entry to the
"edp_panels" structure would help future-proof us a bit.

-Doug
