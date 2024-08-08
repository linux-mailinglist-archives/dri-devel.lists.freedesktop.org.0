Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4D1C94C4D8
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2024 20:47:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A715110E7DF;
	Thu,  8 Aug 2024 18:47:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="GfIgRLp6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com
 [209.85.160.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DED910E7DF
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Aug 2024 18:47:51 +0000 (UTC)
Received: by mail-oa1-f42.google.com with SMTP id
 586e51a60fabf-264988283a3so703650fac.0
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Aug 2024 11:47:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1723142870; x=1723747670;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Aayk2Lttmn0wD83xXMa7bzpsBk9VzLksOrAAh6yDi/8=;
 b=GfIgRLp6HfYf1TnjNHR3t1fgJdiSglhMLcGJq7BBcrfKK8tpFFYzxbhz/UHuwYP8nN
 LqP/gdoxKpJg3y8DZjiCfpqfZQCgiHYnvcPJZOJA4suMnCSoadWtXifFaBoSGbD2DgDo
 HkujNxco548EAFioyURLFv2ctsmJUI2bdpxfc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723142870; x=1723747670;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Aayk2Lttmn0wD83xXMa7bzpsBk9VzLksOrAAh6yDi/8=;
 b=hpt9r9qrw8x8t/fyy9JxQLr/6Km1oDmdKz73m5S3AFuaLLkU/qMJ9WVUGa8yhSrrXq
 TxY35EBaNPnmzU65UvS6bo7zikhxc15LoMmWWf51c+Lg0ba3MD2ttIJFYrL6Kn4mFHjg
 wzs0udSJ7VOYT01V8SVPijtU2rv7WJwqCA9TwS/trQMlY7NezV96N5Bwk0BwZj4NKF7X
 5JcUeX+sDREqF87Zcr5FR5VDAJiP+ZE4bW/UYigneAAgCmdC8OWLR7+f024m8yBXqzRL
 rC117bQWxXqIVMt0MiSxGHGZeJxAlBirOen9P7Fxmgl+s/fQPE+8+2OzjR6J+mIN2LYx
 qT4A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWycGzWlwK1rc1sqn2A8mEEu9m0na9WTHjJInrRay/oX07/aPGODGRItgkqdIFYn2U2AwICly8VX9tFF3/sfNBgfPHd9iSl501hQQk26NSe
X-Gm-Message-State: AOJu0YzaE3ZMhyKCEtmNHsiAn4FJert6cLpTbyAN4Z2jY0maqcMwd0I6
 2UdqJNamUVfXJg8v7XxXZH3Awamwy9kCfBHhW/TY4pJtcdbIHx5DZzd8PcKyNricnkv9g1Xsp31
 lGcjKdez5izZ/oqT7S5QBTJPQ20ZbUxxV7aKW
X-Google-Smtp-Source: AGHT+IGcE9MOFmsH0Ui6LQ5gDODf1sP6ILA52lvJYyRoqrcSMR7DavF+iykCGMACE/oztRceFKqzbwHJtLPCcEEwgLw=
X-Received: by 2002:a05:6870:391f:b0:25e:de4:9621 with SMTP id
 586e51a60fabf-2692b69db3bmr3285147fac.24.1723142870500; Thu, 08 Aug 2024
 11:47:50 -0700 (PDT)
MIME-Version: 1.0
References: <20240808114407.1.I099e8e9e36407a0785d846b953031d40ea71e559@changeid>
In-Reply-To: <20240808114407.1.I099e8e9e36407a0785d846b953031d40ea71e559@changeid>
From: Rob Clark <robdclark@chromium.org>
Date: Thu, 8 Aug 2024 11:47:39 -0700
Message-ID: <CAJs_Fx7GN1_2xAM0Qg8oezQ2Foxy2smOXb3zMhNiJxCDMPUNug@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: display: panel: samsung,
 atna45dc02: Fix indentation
To: Douglas Anderson <dianders@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
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

On Thu, Aug 8, 2024 at 11:44=E2=80=AFAM Douglas Anderson <dianders@chromium=
.org> wrote:
>
> The yaml had indentation errors:
>   ./Documentation/devicetree/bindings/display/panel/samsung,atna33xc20.ya=
ml:21:9:
>   [warning] wrong indentation: expected 10 but found 8 (indentation)
>   ./Documentation/devicetree/bindings/display/panel/samsung,atna33xc20.ya=
ml:23:11:
>   [warning] wrong indentation: expected 12 but found 10 (indentation)
>
> Fix them.
>
> Reported-by: Rob Herring <robh@kernel.org>
> Closes: https://lore.kernel.org/r/CAL_JsqLRTgQRPcfXy4G9hLoHMd-Uax4_C90BV_=
OZn4mK+-82kw@mail.gmail.com
> Fixes: 1c4a057d01f4 ("dt-bindings: display: panel: samsung,atna45dc02: Do=
cument ATNA45DC02")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Reviewed-by: Rob Clark <robdclark@gmail.com>
Thanked-by: Rob Clark <robdclark@gmail.com>

BR,
-R

> ---
>
>  .../bindings/display/panel/samsung,atna33xc20.yaml   | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/display/panel/samsung,atna=
33xc20.yaml b/Documentation/devicetree/bindings/display/panel/samsung,atna3=
3xc20.yaml
> index 87c601bcf20a..032f783eefc4 100644
> --- a/Documentation/devicetree/bindings/display/panel/samsung,atna33xc20.=
yaml
> +++ b/Documentation/devicetree/bindings/display/panel/samsung,atna33xc20.=
yaml
> @@ -18,12 +18,12 @@ properties:
>        # Samsung 13.3" FHD (1920x1080 pixels) eDP AMOLED panel
>        - const: samsung,atna33xc20
>        - items:
> -        - enum:
> -          # Samsung 14.5" WQXGA+ (2880x1800 pixels) eDP AMOLED panel
> -          - samsung,atna45af01
> -          # Samsung 14.5" 3K (2944x1840 pixels) eDP AMOLED panel
> -          - samsung,atna45dc02
> -        - const: samsung,atna33xc20
> +          - enum:
> +              # Samsung 14.5" WQXGA+ (2880x1800 pixels) eDP AMOLED panel
> +              - samsung,atna45af01
> +              # Samsung 14.5" 3K (2944x1840 pixels) eDP AMOLED panel
> +              - samsung,atna45dc02
> +          - const: samsung,atna33xc20
>
>    enable-gpios: true
>    port: true
> --
> 2.46.0.76.ge559c4bf1a-goog
>
