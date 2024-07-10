Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA07092D788
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2024 19:35:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA65810E851;
	Wed, 10 Jul 2024 17:35:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="PfxD/7F3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com
 [209.85.219.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D665010E851
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2024 17:35:51 +0000 (UTC)
Received: by mail-qv1-f44.google.com with SMTP id
 6a1803df08f44-6b5f4c7f4fbso285336d6.2
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2024 10:35:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1720632946; x=1721237746;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nq9tNUhoBsUEDC1UEIUaCv3t+k06QOX2ENZA+annY9M=;
 b=PfxD/7F3offAoTi7q6/aZhhzSkhQYgI6JU25G4EHro52te6wspT9j9dGIoo1O5y///
 YJtErF4gjQW4wocgIfrs9csRS7i25YBOQPuaFDyMD6Viqat3DyLN3VGRi7DyoFDhZqqS
 FRf6hjL4BhsKxyBYqUGksZu9LiYl2Tl7qll/0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720632946; x=1721237746;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nq9tNUhoBsUEDC1UEIUaCv3t+k06QOX2ENZA+annY9M=;
 b=DLnJO4rWxKf7GbY/qLtsA2nipEGHTFWiXuKiCFSyJckmMgcqT+yPPs8zIUiDsK2ZF0
 +L776tDn6nnlWHtujFP1sTMgckRpQn+dN3Sij/nJoEtpmHOWXj1e25pTlsXfLhO5Buct
 yIet7u2kaKArr/Jf2FMER/pkSluUgl4x/PhTcKCcZqs2KTCM410yyxIqGDX27qaGO/lD
 dt5TLLALzrHeSdiA4/+Ghg7MIG69opgJ52kLQlco5XKxw1nh2s27UjlzfTrmHbd0AfQQ
 /q58/ZoIwEto68ViZMugF2bh07E3ERDshTSn92eP0zTejKS556U+zQ/H7UnQ6iUnMwTx
 Hghw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW0Hlg5it2pq79UE3jffVq0XiRg2jRuhZJpGfAZ5v5VxZpnpgyF1pon+zofpCz0OlcC45Do0XQZ+qVJ/sdScg0ACp0U8VAs3MMh2P6m00Cq
X-Gm-Message-State: AOJu0YzUAuYVA1ZJNTvelMOdlx0iRfovwJH0BpPhDCXQDjq5V8gELuqR
 YyjiBPjRjdsXqKevPozCXZLmaKu+Zi36wFb1SP1rZbu12ENFL4uUKKTOvVHJ3cseMurqsNKPhrA
 +PA==
X-Google-Smtp-Source: AGHT+IFP75Jo76HvPx1CzjV0pL0dyxUR8OWjcP3KubPO1JVDZeJ6qV5a3afwbi6xe23xtx64mLo7Sw==
X-Received: by 2002:a05:6214:2a83:b0:6b7:4319:ad6f with SMTP id
 6a1803df08f44-6b74319b2admr27371886d6.36.1720632945684; 
 Wed, 10 Jul 2024 10:35:45 -0700 (PDT)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com.
 [209.85.160.170]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6b61ba7495csm18788386d6.92.2024.07.10.10.35.44
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Jul 2024 10:35:44 -0700 (PDT)
Received: by mail-qt1-f170.google.com with SMTP id
 d75a77b69052e-44a8b140a1bso24521cf.0
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2024 10:35:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVm8RDliLXfWZP34TSrFi8rjMhixqzz2GyQYMxpw3iYMDpQ9A4ZgnwpIrAY9W8OR2ihImvFJCiS6RyE27WL/J16RCXRsdit93Hcrni4BIaT
X-Received: by 2002:ac8:5399:0:b0:447:f3ae:383b with SMTP id
 d75a77b69052e-44b1a14a434mr3218051cf.19.1720632943866; Wed, 10 Jul 2024
 10:35:43 -0700 (PDT)
MIME-Version: 1.0
References: <20240710-x1e80100-crd-backlight-v1-0-eb242311a23e@linaro.org>
 <20240710-x1e80100-crd-backlight-v1-1-eb242311a23e@linaro.org>
In-Reply-To: <20240710-x1e80100-crd-backlight-v1-1-eb242311a23e@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 10 Jul 2024 10:35:28 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XJuV12mStW3eUm5MHG8BA9W_fn0skN=BrtmqC+fnCZig@mail.gmail.com>
Message-ID: <CAD=FV=XJuV12mStW3eUm5MHG8BA9W_fn0skN=BrtmqC+fnCZig@mail.gmail.com>
Subject: Re: [PATCH 1/5] dt-bindings: display: panel: samsung,atna33xc20:
 Document ATNA45AF01
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Abel Vesa <abel.vesa@linaro.org>, Johan Hovold <johan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Hi,

On Wed, Jul 10, 2024 at 10:05=E2=80=AFAM Stephan Gerhold
<stephan.gerhold@linaro.org> wrote:
>
> The Samsung ATNA45AF01 panel is an AMOLED eDP panel that has backlight
> control over the DP AUX channel. While it works almost correctly with the
> generic "edp-panel" compatible, the backlight needs special handling to
> work correctly. It is similar to the existing ATNA33XC20 panel, just with
> a larger resolution and size.
>
> Add a new "samsung,atna45af01" compatible to describe this panel in the D=
T.
>
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> ---
>  .../devicetree/bindings/display/panel/samsung,atna33xc20.yaml       | 6 =
+++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/display/panel/samsung,atna=
33xc20.yaml b/Documentation/devicetree/bindings/display/panel/samsung,atna3=
3xc20.yaml
> index 765ca155c83a..d668e8d0d296 100644
> --- a/Documentation/devicetree/bindings/display/panel/samsung,atna33xc20.=
yaml
> +++ b/Documentation/devicetree/bindings/display/panel/samsung,atna33xc20.=
yaml
> @@ -14,7 +14,11 @@ allOf:
>
>  properties:
>    compatible:
> -    const: samsung,atna33xc20
> +    enum:
> +      # Samsung 13.3" FHD (1920x1080 pixels) eDP AMOLED panel
> +      - samsung,atna33xc20
> +      # Samsung 14.5" WQXGA+ (2880x1800 pixels) eDP AMOLED panel
> +      - samsung,atna45af01

Seems OK, but a few thoughts:

1. Is it worth renaming this file? Something like
"samsung,atna-oled-panel.yaml"? I'd be interested in DT maintainer
folks' opinions here.

2. In theory you could make your compatible look like this:

compatible =3D "samsung,atna45af01", "samsung,atna33xc20"

...which would say "I have a 45af01 but if the OS doesn't have
anything special to do that it would be fine to use the 33xc20
driver". That would allow device trees to work without the kernel
changes and would allow you to land the DT changes in parallel with
the driver changes and things would keep working.

...and, in fact, that would mean you _didn't_ need to add the new
compatible string to the driver, which is nice.


-Doug
