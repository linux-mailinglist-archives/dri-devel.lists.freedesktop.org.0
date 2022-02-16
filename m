Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C8DD4B916C
	for <lists+dri-devel@lfdr.de>; Wed, 16 Feb 2022 20:40:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 214FA10E62E;
	Wed, 16 Feb 2022 19:40:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7E7B10E62D
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Feb 2022 19:40:02 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id p14so1574541ejf.11
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Feb 2022 11:40:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sHRPRD8GP9uQyILnjM88nA04r7VU/nm1fNnZS/rsGL4=;
 b=UvST5o77fKwFHFG2pZIsRAincIR8FLK2tfWrGygYfVo3SU+XKj7dzDp5lwkqJZL8TN
 iw3VY4v5foNzrztjCNaUqRZETXQVngX5qFMYWE3jFZp0vmi9R7d37BWQFuhOml2KgPwd
 xhJQhODJakHrsWZelDfUgrLxyRGMJJ9iz5waI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sHRPRD8GP9uQyILnjM88nA04r7VU/nm1fNnZS/rsGL4=;
 b=rWrz9B2zk13LP3vdAewfDWxXYQzN9SOfaJe+lju3F4Z/zLRoFdkDkUvqKiGC/0kisw
 rVhLB5a6XH6SwQkCRdZ79M0D2hF9JYREomRFy5KTmme01jOMTgt+dry1iALkOoKEY6Sw
 coL4c2LGE6PXk8CETV8rQrtHS+b7VH789D9TydHG8KOU2aSsw4Gs9Z6Je5ddF0q0BgZv
 Ks5cdrvY8F41+fx94zD+xuqK6vPFxw7e0bbPZxtfgy+GLNaCAp9XGjN5LuxppGUWyW9o
 4Yo338azutucd8/9W7jHEhFXFYqKRkTZrrhizJ/anZZBpqBfOHhwXGxx3t2YkJ2eJ+UN
 6/CA==
X-Gm-Message-State: AOAM533ItfOyP0uDri6GVQBM1Ha544a9PGalMw1bZs5o+cLd+nnTw3Gg
 MSWqhbob2WTZKgSFN8bMFv+tPl93/lhnfy/hQak=
X-Google-Smtp-Source: ABdhPJxbqd32anWsueu1sQ7oHmC6eQ/nfrKGnH2ZPZc67uPsBcwcAOxrbClfiKjy7iqyDjLbBRp1KA==
X-Received: by 2002:a17:907:78cc:b0:6b4:ecc1:42fb with SMTP id
 kv12-20020a17090778cc00b006b4ecc142fbmr3420254ejc.248.1645040400997; 
 Wed, 16 Feb 2022 11:40:00 -0800 (PST)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com.
 [209.85.128.49])
 by smtp.gmail.com with ESMTPSA id q12sm2058119edv.99.2022.02.16.11.39.59
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Feb 2022 11:39:59 -0800 (PST)
Received: by mail-wm1-f49.google.com with SMTP id i19so1799412wmq.5
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Feb 2022 11:39:59 -0800 (PST)
X-Received: by 2002:a7b:c938:0:b0:37b:fdaa:2749 with SMTP id
 h24-20020a7bc938000000b0037bfdaa2749mr3036535wml.88.1645040398608; Wed, 16
 Feb 2022 11:39:58 -0800 (PST)
MIME-Version: 1.0
References: <1644494255-6632-1-git-send-email-quic_sbillaka@quicinc.com>
 <1644494255-6632-5-git-send-email-quic_sbillaka@quicinc.com>
 <CAD=FV=V9vXbvuU5oK6maXKAfzEPzT2Fp5Vf3CUqpJvmM+wrjeg@mail.gmail.com>
In-Reply-To: <CAD=FV=V9vXbvuU5oK6maXKAfzEPzT2Fp5Vf3CUqpJvmM+wrjeg@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 16 Feb 2022 11:39:46 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WWjn+CPSes2y1U=9mKZG9gkj5ubBpJOLTJDwhs4gYbeA@mail.gmail.com>
Message-ID: <CAD=FV=WWjn+CPSes2y1U=9mKZG9gkj5ubBpJOLTJDwhs4gYbeA@mail.gmail.com>
Subject: Re: [PATCH v4 4/5] drm/panel-edp: Add eDP sharp panel support
To: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
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
Cc: quic_kalyant@quicinc.com,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 quic_khsieh@quicinc.com, quic_vproddut@quicinc.com,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, quic_abhinavk@quicinc.com,
 Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
 Sean Paul <seanpaul@chromium.org>, Thierry Reding <thierry.reding@gmail.com>,
 Stephen Boyd <swboyd@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>, quic_mkrishn@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, Feb 16, 2022 at 11:29 AM Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Thu, Feb 10, 2022 at 3:58 AM Sankeerth Billakanti
> <quic_sbillaka@quicinc.com> wrote:
> >
> > Add support for the 14" sharp,lq140m1jw46 eDP panel.
> >
> > Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
> > ---
> > 00 ff ff ff ff ff ff 00 4d 10 23 15 00 00 00 00
> > 35 1e 01 04 a5 1f 11 78 07 de 50 a3 54 4c 99 26
> > 0f 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
> > 01 01 01 01 01 01 5a 87 80 a0 70 38 4d 40 30 20
> > 35 00 35 ae 10 00 00 18 65 38 80 a0 70 38 4d 40
> > 30 20 35 00 35 ae 10 00 00 18 00 00 00 fd 00 30
> > 90 a7 a7 23 01 00 00 00 00 00 00 00 00 00 00 fc
> > 00 4c 51 31 34 30 4d 31 4a 57 34 39 0a 20 00 77
> >
> > ----------------
> >
> > Block 0, Base EDID:
> >   EDID Structure Version & Revision: 1.4
> >   Vendor & Product Identification:
> >     Manufacturer: SHP
> >     Model: 5411
> >     Made in: week 53 of 2020
> >   Basic Display Parameters & Features:
> >     Digital display
> >     Bits per primary color channel: 8
> >     DisplayPort interface
> >     Maximum image size: 31 cm x 17 cm
> >     Gamma: 2.20
> >     Supported color formats: RGB 4:4:4
> >     Default (sRGB) color space is primary color space
> >     First detailed timing includes the native pixel format and preferred refresh rate
> >     Display is continuous frequency
> >   Color Characteristics:
> >     Red  : 0.6396, 0.3291
> >     Green: 0.2998, 0.5996
> >     Blue : 0.1494, 0.0595
> >     White: 0.3125, 0.3281
> >   Established Timings I & II: none
> >   Standard Timings: none
> >   Detailed Timing Descriptors:
> >     DTD 1:  1920x1080  143.981 Hz  16:9   166.587 kHz  346.500 MHz (309 mm x 174 mm)
> >                  Hfront   48 Hsync  32 Hback  80 Hpol N
> >                  Vfront    3 Vsync   5 Vback  69 Vpol N
> >     DTD 2:  1920x1080   59.990 Hz  16:9    69.409 kHz  144.370 MHz (309 mm x 174 mm)
> >                  Hfront   48 Hsync  32 Hback  80 Hpol N
> >                  Vfront    3 Vsync   5 Vback  69 Vpol N
> >   Display Range Limits:
> >     Monitor ranges (Bare Limits): 48-144 Hz V, 167-167 kHz H, max dotclock 350 MHz
> >     Display Product Name: 'LQ140M1JW49'
> > Checksum: 0x77
> >
> > Changes in v4:
> >   -Add all modes from EDID
> >   -Provide EDID blob
> >
> > Changes in v3:
> >   None
> >
> >  drivers/gpu/drm/panel/panel-edp.c | 44 +++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 44 insertions(+)
>
> We want to be moving to the generic edp-panel but even if we move to
> edp-panel there's no harm in supporting things the old way, especially
> as people are transitioning.
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>

...and pushed to drm-misc-next:

a874aba8bbc5 drm/panel-edp: Add eDP sharp panel support

So v5 shouldn't include this patch.

-Doug
