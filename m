Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F282C4E6A09
	for <lists+dri-devel@lfdr.de>; Thu, 24 Mar 2022 21:53:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5D1410E360;
	Thu, 24 Mar 2022 20:53:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B83C10E360
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Mar 2022 20:53:31 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id d10so11571607eje.10
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Mar 2022 13:53:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aFSr1woZwQXcWxiIeXMBTdkSmylSGPSvw4l7QhCcJdk=;
 b=UWOwijb6tG4M9q5CzVe8FLlKtNmcdWmo3x+k5WAD0Lt4E7cx8AILpBG8mEMI+DnmqR
 WL38ld57I7KlKmg/69QrQdqARexREhJnmXWz1eZsisBYV0TJxrVX+c7li7f8/tBXOD7O
 y54nz6+M26mmk6N5pwX7PTdnHSVcUN2rsLmQE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aFSr1woZwQXcWxiIeXMBTdkSmylSGPSvw4l7QhCcJdk=;
 b=6mSHqJJ8BeHP5+ZdBmsdujm5rk9iZKoQKePsKpWuRT81bUCfiD0ujcm+9VFfPAjxUn
 uY3TApj5KzCx36+h9lbD9C65VCkMdq5W6ifxJ1uELuN1g3GKdPlTZweohfwRVd7VJZUi
 laCe/6nAmP6ldWkQB9b7e5cRCSVEGtID+uOGYW9TkWpGK2cSD1G8Q2+N+NwMkxMnpNZV
 GI/y0ZltiiAgijZ6bSHyNfbzfRu1y9E9gjqKbqdYLC7xyHYa7atAAFz7xijJftCgLh74
 kxX9Ej5HFUFRRNDZNAkkrWYrLegIsIvQWMaGk7btsYwCzX7+SSerOuJ9caWEs9Twcwq+
 2C1g==
X-Gm-Message-State: AOAM531QBFCiHDBD+Goq3Uhbm4+8JJv/lNBxyDNY3XDszb8ZNMj0svp9
 STLBqfWSp0WeZXGFfGx2Akkf5uO06HVrpOdi
X-Google-Smtp-Source: ABdhPJy0+gwj0MjT3gjSDsjAqkeF1J7iGg36Vapzgsr6RM4eLiWzJsNoiAIZ/t7M/gRd140hpM8pSQ==
X-Received: by 2002:a17:906:dc8c:b0:6e0:6216:3698 with SMTP id
 cs12-20020a170906dc8c00b006e062163698mr7755099ejc.144.1648155209424; 
 Thu, 24 Mar 2022 13:53:29 -0700 (PDT)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com.
 [209.85.128.49]) by smtp.gmail.com with ESMTPSA id
 s4-20020a170906a18400b006db0a78bde8sm1547729ejy.87.2022.03.24.13.53.28
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Mar 2022 13:53:28 -0700 (PDT)
Received: by mail-wm1-f49.google.com with SMTP id
 p12-20020a05600c430c00b0038cbdf52227so3300502wme.2
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Mar 2022 13:53:28 -0700 (PDT)
X-Received: by 2002:a1c:7518:0:b0:37c:7eb:f255 with SMTP id
 o24-20020a1c7518000000b0037c07ebf255mr15649886wmc.29.1648155208026; Thu, 24
 Mar 2022 13:53:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220324111335.1.I1131d63cbefbfa9ff107a284e2e51f880c5bf7c8@changeid>
In-Reply-To: <20220324111335.1.I1131d63cbefbfa9ff107a284e2e51f880c5bf7c8@changeid>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 24 Mar 2022 13:53:16 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XG-JqqjcoAUoLWHjOyOSQMxD2vyXi9WVJNSaUawtvthg@mail.gmail.com>
Message-ID: <CAD=FV=XG-JqqjcoAUoLWHjOyOSQMxD2vyXi9WVJNSaUawtvthg@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: display: simple: Add AUO B133UAN01 panel
To: Matthias Kaehlcke <mka@chromium.org>, Rob Herring <robh+dt@kernel.org>
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
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, Mar 24, 2022 at 11:14 AM Matthias Kaehlcke <mka@chromium.org> wrote:
>
> Add binding for the AUO B133UAN01 panel. It is 13.3" TFT LCD panel
> with WUXGA (1920x1200) resolution.
>
> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> ---
>
>  .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> index 1eb9dd4f8f58..e5cd45c81d02 100644
> --- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> @@ -49,6 +49,8 @@ properties:
>        - auo,b133han05
>          # AU Optronics Corporation 13.3" FHD (1920x1080) color TFT-LCD panel
>        - auo,b133htn01
> +        # AU Optronics Corporation 13.3" WUXGA (1920x1200) color TFT-LCD panel
> +      - auo,b133uan01

Breadcrumbs to save Rob Herring from responding is that we're moving
to do this using the eDP autodetect feature instead of adding a new
compatible. v2 is at:

https://lore.kernel.org/r/20220324134819.v2.1.I816014b6c62da5a33af5021f3cc35cea66552c00@changeid/

-Doug
