Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1137292AB94
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2024 00:00:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 692D610E429;
	Mon,  8 Jul 2024 22:00:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="WdjLGFnP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A81710E429
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jul 2024 22:00:00 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id
 a640c23a62f3a-a77e6dd7f72so252666066b.3
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Jul 2024 15:00:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1720475995; x=1721080795;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ltrpJ3wpWcI1Lsx4DkbvbSmrXoLvEHXjwbwXRsoboiM=;
 b=WdjLGFnPKczrV51LYHNgw1D52QtPq70DYpWZViawOL1twm05iR3j2TEOsriFoN/Y2z
 a1o/d8OXWfZ1fxBBku5iDBxKM9BoKku4/sJsLMd6puHa6Pp7UvdgmSMd1yfq+IGLsm8N
 gdN1flXtvhYKnEH277g+jtxzkhz2lkGBfc3yI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720475995; x=1721080795;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ltrpJ3wpWcI1Lsx4DkbvbSmrXoLvEHXjwbwXRsoboiM=;
 b=QuRc+/E+oHWmFn2QKWs5i7tgrVojiIP5SFeiPwcQIm4GG9W1EHg3cYOF/8W3z5wDrC
 xdH4un0jwuaoSxW3SGQ7ktiLMiwkoSbX8qWQVBIYV9saaxKHoAT+DN3z3SHS6NT3yqre
 5UNBiIRorRjbdcEdISptMFCmbQOThObuZqUq1p4TvUQifKPyA4OFS4ETz4sGDEB28EWv
 5odegGjeDQ/gDdeO25IMwfJ+dd3X8HoEwhq2cf6HaPbqvpw4WJSe0xkF7b4aofglrmV2
 CumiA437W9wRDoHvG8Fvw3LrPVPAhefhoKuySRLP0bNjOxCv4lp4L27iyymDtInxGnQl
 IhOA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXcUBCQg3AT6VXrfgBeFFAAizctGHGDa/tyilj4RBFaSieo5rerVavzqi/ppTLvephRQKtemSJyUwxOkWupKitz3LIrKgzxgWeCwecmgY0D
X-Gm-Message-State: AOJu0Yw5iFLNLClhG9LOU9U8q1rVSxkVhHVFG+3380S6ZL56pp0nGzNl
 9uCOVwQr7LRfYZl94xZQdHTd3oZw7T0vlGkIeGybYblSMUg5BHJcpAqEEwQ7KUmlcfpBpMdzjys
 bcA==
X-Google-Smtp-Source: AGHT+IEBiSibh36pSmeR4ffp43oc5zh04Id86t52BHtzk2a2nqcIVDsa/ZTZ09t3o9CDosrDbVHq8A==
X-Received: by 2002:a17:907:7284:b0:a77:e48d:bb4 with SMTP id
 a640c23a62f3a-a780b6887a1mr65527566b.13.1720475994498; 
 Mon, 08 Jul 2024 14:59:54 -0700 (PDT)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com.
 [209.85.128.41]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a780a7fef92sm25568866b.125.2024.07.08.14.59.53
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Jul 2024 14:59:53 -0700 (PDT)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-4265dce6195so8215e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Jul 2024 14:59:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXI0Qo9rY5vC223KsQbhzHe9gll8bbJ9xbhGGEqUPGjaSYwt677vR71RGP7pWqV+KfQ6W2QxOIvjH0CFDucZfif5yTI5iEoPEL5IWrqoHWK
X-Received: by 2002:a05:600c:4f53:b0:426:66a0:6df6 with SMTP id
 5b1f17b1804b1-4267189fe44mr730175e9.0.1720475993130; Mon, 08 Jul 2024
 14:59:53 -0700 (PDT)
MIME-Version: 1.0
References: <20240704045017.2781991-1-yangcong5@huaqin.corp-partner.google.com>
 <20240704045017.2781991-3-yangcong5@huaqin.corp-partner.google.com>
In-Reply-To: <20240704045017.2781991-3-yangcong5@huaqin.corp-partner.google.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 8 Jul 2024 14:59:36 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WLVC8OkP-MqNmzpU3_O7bPv_qJUpG2MVActGT14fP4Jw@mail.gmail.com>
Message-ID: <CAD=FV=WLVC8OkP-MqNmzpU3_O7bPv_qJUpG2MVActGT14fP4Jw@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] drm/panel: jd9365da: Support for Melfas
 lmfbx101117480 MIPI-DSI panel
To: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
Cc: sam@ravnborg.org, neil.armstrong@linaro.org, daniel@ffwll.ch, 
 linus.walleij@linaro.org, swboyd@chromium.org, airlied@gmail.com, 
 dmitry.baryshkov@linaro.org, krzysztof.kozlowski+dt@linaro.org, 
 robh+dt@kernel.org, conor+dt@kernel.org, 
 lvzhaoxiong@huaqin.corp-partner.google.com, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
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

On Wed, Jul 3, 2024 at 9:50=E2=80=AFPM Cong Yang
<yangcong5@huaqin.corp-partner.google.com> wrote:
>
> The Melfas lmfbx101117480 is a 10.1" WXGA TFT-LCD panel, use jd9365da
> controller, which fits in nicely with the existing panel-jadard-jd9365da-=
h3
> driver. Hence, we add a new compatible with panel specific config.
>
> Signed-off-by: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  .../gpu/drm/panel/panel-jadard-jd9365da-h3.c  | 246 ++++++++++++++++++
>  1 file changed, 246 insertions(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
