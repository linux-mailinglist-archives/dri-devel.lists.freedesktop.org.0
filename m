Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ED7A281D0B
	for <lists+dri-devel@lfdr.de>; Fri,  2 Oct 2020 22:42:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6DCC6E9C9;
	Fri,  2 Oct 2020 20:42:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe42.google.com (mail-vs1-xe42.google.com
 [IPv6:2607:f8b0:4864:20::e42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC2036E9C9
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Oct 2020 20:42:15 +0000 (UTC)
Received: by mail-vs1-xe42.google.com with SMTP id a16so1221637vsp.12
 for <dri-devel@lists.freedesktop.org>; Fri, 02 Oct 2020 13:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PyTBFVa3qeZA7kgpm5KMRvZPLGIjXaEZxCGTPzBm8AM=;
 b=WulWpA1VQK5XnHxFm6BjaZBFSyC5nWp45+BE2BA1U+iQCLy45rOVwBwCNohf/ZSV+f
 qCW7JmmisW/jA113crFSXVFLFwfsCJNRsfn1vbwz2J2aTIvj2fmdlUv9zF/MFFwkPKMK
 T8aruwThdjnWsBObai0IHqsXB30sj6jxY6QmY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PyTBFVa3qeZA7kgpm5KMRvZPLGIjXaEZxCGTPzBm8AM=;
 b=IrEtFwpC75eTg+UY0iULQQ9fpkTEC8LoshcBscPgfnI89yvGdUrRCxg5OuFoieNyTm
 76Lq5iwDNLdv+7Heh2rRlD2hXJcUsUc4YN/FJAjnA1azfSYyJG3guzl+m/+2t4UtSAA9
 idtbqDfWqL0/Foy0EUCHV9D00jID5+3KmezFayEJazrOXMWK7Q3W13YvLQHphXNCOZqB
 RDLiqZ5jKlMWvQJLJPSR7ls2b2k6WWP1pOfkedXzJS93kKiw7iHWO3aWq3ZjCayNNOFn
 kiP/4WsCuN2piY4imv0sFDr04go8Zs2EfHXV3F0BHcaHqidr9LvBsVRukfPINp7Y6i/z
 jMFw==
X-Gm-Message-State: AOAM530F8jG/qUf5I3pahfyMf9VC7QQx+DVUddNry/sDBX5UM74lydLu
 g4hzANgzX72RgPHNBt4CKKfSyjMN0sN6uQ==
X-Google-Smtp-Source: ABdhPJw0tde0wtzgPlxoSZ0Iqk4Y2sKP4D5DW5UDP3T3gNYmz6AEK2fnWVomxvnjbvL27bn6ecT+NA==
X-Received: by 2002:a67:544:: with SMTP id 65mr2471188vsf.33.1601671334215;
 Fri, 02 Oct 2020 13:42:14 -0700 (PDT)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com.
 [209.85.222.42])
 by smtp.gmail.com with ESMTPSA id e3sm447912vsa.8.2020.10.02.13.42.12
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Oct 2020 13:42:12 -0700 (PDT)
Received: by mail-ua1-f42.google.com with SMTP id 91so198631uas.7
 for <dri-devel@lists.freedesktop.org>; Fri, 02 Oct 2020 13:42:12 -0700 (PDT)
X-Received: by 2002:ab0:4542:: with SMTP id r60mr2415711uar.90.1601671332224; 
 Fri, 02 Oct 2020 13:42:12 -0700 (PDT)
MIME-Version: 1.0
References: <20200930223532.77755-1-bjorn.andersson@linaro.org>
 <20200930223532.77755-2-bjorn.andersson@linaro.org>
In-Reply-To: <20200930223532.77755-2-bjorn.andersson@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 2 Oct 2020 13:42:00 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Unu-PH_RThi3xRF1HUADN2PqcVAOin0O0yo0gcGRWCDQ@mail.gmail.com>
Message-ID: <CAD=FV=Unu-PH_RThi3xRF1HUADN2PqcVAOin0O0yo0gcGRWCDQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: drm/bridge: ti-sn65dsi86: Replace
 #pwm-cells
To: Bjorn Andersson <bjorn.andersson@linaro.org>
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
 <devicetree@vger.kernel.org>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, Sep 30, 2020 at 3:40 PM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> While the signal on GPIO4 to drive the backlight controller indeed is
> pulse width modulated its purpose is specifically to control the
> brightness of a backlight.

I'm a bit on the fence about this.  I guess you're doing this because
it avoids some -EPROBE_DEFER cycles in Linux?  It does seem to have a
few downsides, though.

1. It means a bit of re-inventing the wheel.  It's not a very big
wheel, though, I'll give you.  ...but it's still something.

2. I'm not sure why you'd want to, but in theory one could use this
PWM for some other purposes.  It really is just a generic PWM.  Your
change prevents that.



> Drop the #pwm-cells and instead expose a new property to configure the
> granularity of the backlight PWM signal.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  .../devicetree/bindings/display/bridge/ti,sn65dsi86.yaml | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
> index f8622bd0f61e..e380218b4646 100644
> --- a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
> @@ -66,9 +66,12 @@ properties:
>        1-based to match the datasheet.  See ../../gpio/gpio.txt for more
>        information.
>
> -  '#pwm-cells':
> -    const: 1
> -    description: See ../../pwm/pwm.yaml for description of the cell formats.
> +  ti,backlight-scale:
> +    description:
> +      The granularity of brightness for the PWM signal provided on GPIO4, if
> +      this property is specified.
> +    minimum: 0
> +    maximum: 65535

A few issues here:

1. Maybe call this "num-steps" instead of backlight-scale.  That's
essentially what it is, right?  Saying how many discrete steps you're
allowing in your backlight?

2. IMO you need the PWM frequency specified, since it can actually
matter.  NOTE: once you have the PWM frequency specified, you could
imagine automatically figuring out what "num-steps" was.  Really you'd
want it to be the largest possible value you could achieve with your
hardware at the specified frequency.  There's no advantage (is there?)
of providing fewer steps to the backlight client.

3. Some backlights are specified inverted.  It looks like this maps
nicely to the bridge chip, which has a bit for it.  Probably nice to
expose this?

Of course, if we were just exposing the PWM directly to Linux we could
just use the PWM backlight driver and it'd all magically work.  ;-)


-Doug
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
