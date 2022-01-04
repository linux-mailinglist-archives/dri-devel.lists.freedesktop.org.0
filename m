Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 74C31484130
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jan 2022 12:49:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA0CD10E182;
	Tue,  4 Jan 2022 11:49:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A970310E182
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jan 2022 11:49:37 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id s1so75639160wra.6
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Jan 2022 03:49:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PiTilpP3Bz7ZjAJItTFQ1+Dz34boNVjYl6oKFRhtc0Q=;
 b=cOMhcn1J5UlEZAXKJ/boZKiXhSdYW0iQdmir3Lf7e0SFW9q/l+RopOiaiLZ/S0Alxs
 gEf633aU3NlLjANWptKdh4co9gtW5bF+hEjxr7b/A9+qun1msWjq4PeGV2Wpr5Yw83mP
 3dXiGu4MIgvfFTLT5oQsPtt3H1t+J6qvx07neFri5llTtxTZvWUQC7Y+nlFp1FjsOAYd
 STouFIXVzVy+PyihnanDhLKrpte0VGecj5I9mst+uIx7x20aGroXzQS3XAik6pZlS7jC
 NTrezHR88ebJQRr5Yzt2Qs1YoGPBInj/oRHX3gdepplon5JQqrjw510KCaQ+v7g99dCq
 Mhiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PiTilpP3Bz7ZjAJItTFQ1+Dz34boNVjYl6oKFRhtc0Q=;
 b=EqZHJ4lFD1EaJYT2M9hSBVEBGhD/8dUiGJ71OXHeo8ahz8EM7v3oP8C8v6lVSv5cEX
 eSjQsf+OxSALmwk4ZOr2KMWbpZlw3hSxre+tvxdmtcQ5Q1jahD9tT1EHekvcT7P2t/Qq
 k6RL76Rg/MX1RfcUiEwpeppu/LmlVKRkQKTTjDLaYksjhmpBXTbLXSBQhsLTdtV+HK5E
 gJ7Yl+j8o/h9OWWaVROaDkr/UFOl2BM421S7upYeTVYPzRrvXRygKJNJidR4Zs/jm6Uu
 8K6z7mSzVz+iVAdoUXs5QoLjIgXb6d+RFNX+l6ciy2Zox82+J7IF5wpYfqOc5roaxBOk
 meSA==
X-Gm-Message-State: AOAM533RCPGJKPWy9UR8xXVfBt6CBLbTX3A46yu2RsEjBX4tSSr3n8Xn
 yN6IWjo/LfsFPpJEknjqvbHmOQdaxjx3oo/nDLHkqQ==
X-Google-Smtp-Source: ABdhPJyzYo76mmymNn/EFfKFV7mnbuF4LgFaafKZxybUkpDr4UVPBcKKdYvt9QGRf/C/CTigqQ5SvaZ4CjZx+Ig5Kn0=
X-Received: by 2002:a5d:58f6:: with SMTP id f22mr41092618wrd.638.1641296976219; 
 Tue, 04 Jan 2022 03:49:36 -0800 (PST)
MIME-Version: 1.0
References: <20220103174106.907-1-macroalpha82@gmail.com>
 <20220103174106.907-6-macroalpha82@gmail.com>
In-Reply-To: <20220103174106.907-6-macroalpha82@gmail.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 4 Jan 2022 11:49:23 +0000
Message-ID: <CAPY8ntARq9_2=mLRhG2eKR2Dt-y4xT5uKs+nKznBxOyiW37-Ag@mail.gmail.com>
Subject: Re: [PATCH 5/5] drm/vc4: dpi: Support DPI interface in mode3 for
 RGB565
To: Chris Morgan <macroalpha82@gmail.com>
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
Cc: devicetree@vger.kernel.org, Chris Morgan <macromorgan@hotmail.com>,
 Eric Anholt <emma@anholt.net>, David Airlie <airlied@linux.ie>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Chris

Thanks for the patch.

On Mon, 3 Jan 2022 at 17:41, Chris Morgan <macroalpha82@gmail.com> wrote:
>
> From: Chris Morgan <macromorgan@hotmail.com>
>
> Add support for the VC4 DPI driver to utilize DPI mode 3. This is
> defined here as xxxRRRRRxxGGGGGGxxxBBBBB:
>
> https://www.raspberrypi.com/documentation/computers/raspberry-pi.html#parallel-display-interface-dpi
>
> This mode is required to use the Geekworm MZP280 DPI display.
>
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

The other patches all look valid to me, but I'll leave those for the
more experienced maintainers.

  Dave

> ---
>  drivers/gpu/drm/vc4/vc4_dpi.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_dpi.c b/drivers/gpu/drm/vc4/vc4_dpi.c
> index c180eb60bee8..3c58ade2549e 100644
> --- a/drivers/gpu/drm/vc4/vc4_dpi.c
> +++ b/drivers/gpu/drm/vc4/vc4_dpi.c
> @@ -173,6 +173,10 @@ static void vc4_dpi_encoder_enable(struct drm_encoder *encoder)
>                         dpi_c |= VC4_SET_FIELD(DPI_FORMAT_16BIT_565_RGB_3,
>                                                DPI_FORMAT);
>                         break;
> +               case MEDIA_BUS_FMT_RGB565_1X24_CPADHI:
> +                       dpi_c |= VC4_SET_FIELD(DPI_FORMAT_16BIT_565_RGB_2,
> +                                              DPI_FORMAT);
> +                       break;
>                 default:
>                         DRM_ERROR("Unknown media bus format %d\n", bus_format);
>                         break;
> --
> 2.25.1
>
