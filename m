Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4129C6D0DBE
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 20:29:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75C7210E3B3;
	Thu, 30 Mar 2023 18:29:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe31.google.com (mail-vs1-xe31.google.com
 [IPv6:2607:f8b0:4864:20::e31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C065410E3B3
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 18:29:41 +0000 (UTC)
Received: by mail-vs1-xe31.google.com with SMTP id dc30so16537502vsb.3
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 11:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1680200978;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=J1mfsAVkmxLwhRt7IlI3jhuOesEA4D6U7D/dfayN2QA=;
 b=MOGm1VqeuelvWydwOeZe7j2bl24u03Ml/sqnQ8wtHhI7luYrcx6XexkPdh1+XGg8X7
 ebLwoFTfM/YVgVdz4rJU3ROd5aWIFR/AJTdDWu93BwzxoFkP87H022wHHMwUQF4HNJg8
 +A9AYY77V/W0EWSlFW9hCGnTSnAmvXHGEn4/c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680200978;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=J1mfsAVkmxLwhRt7IlI3jhuOesEA4D6U7D/dfayN2QA=;
 b=Fz9VzckcPJdY/TYTG1GeV9JkgvbU+cb1kRZoydEWBwi2ugXzeTIVyiyPcfkzEeRd7p
 igHgGpg4vyF7BIN6JJGG333XO+nqnSG0I/eUfk6OXhND3Ye0ssSZUy8vUO91exAhrQBh
 7S3y+dwdHSJnGiqRIKN+WGXP14pXWY8LmOt4hOkMNXOL28Zhb+8xAY16UgB/JXqE5sZE
 Nl7ezQCcME1WYzsBSlnI2HU89cyDW6kEFJm2xsISJlzBzBCIJsj6G00bfUO3KfpmQxQ6
 vpYj0AfQHB+68Zhdw4KYnSTjgLh0a8Mo6kU3dNukZnnnhYEkRRceRmfWI8V8KQRA+WHV
 5Ccw==
X-Gm-Message-State: AAQBX9e11Fd0v9iJuTHe8Id/3Kztvn32qI8c5dtBgBdCQX32oXHmXAw9
 2GpWcvvUp4nox0yMIruTDNHtIrlIejSvU3EYeL0=
X-Google-Smtp-Source: AKy350aOc/nBFx17OgqwpSu3O0rA0aWMqwtfTMAA8+KddKtNDM/5hHb0XwCmkBQ60TdP8mwmoVgjmw==
X-Received: by 2002:a67:f48b:0:b0:426:3b7f:64ad with SMTP id
 o11-20020a67f48b000000b004263b7f64admr8920716vsn.29.1680200978227; 
 Thu, 30 Mar 2023 11:29:38 -0700 (PDT)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com.
 [209.85.217.50]) by smtp.gmail.com with ESMTPSA id
 e1-20020ab031c1000000b0068727e88479sm34128uan.19.2023.03.30.11.29.37
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Mar 2023 11:29:37 -0700 (PDT)
Received: by mail-vs1-f50.google.com with SMTP id dc30so16537362vsb.3
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 11:29:37 -0700 (PDT)
X-Received: by 2002:a67:d493:0:b0:426:a319:a226 with SMTP id
 g19-20020a67d493000000b00426a319a226mr9101769vsj.7.1680200976855; Thu, 30 Mar
 2023 11:29:36 -0700 (PDT)
MIME-Version: 1.0
References: <20230324195555.3921170-1-markyacoub@google.com>
 <20230324195555.3921170-9-markyacoub@google.com>
In-Reply-To: <20230324195555.3921170-9-markyacoub@google.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 30 Mar 2023 11:29:25 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Wq8Z+rf++08fyYvsBUqdWX23qoUSOBBR5nP=hBUk2mzA@mail.gmail.com>
Message-ID: <CAD=FV=Wq8Z+rf++08fyYvsBUqdWX23qoUSOBBR5nP=hBUk2mzA@mail.gmail.com>
Subject: Re: [PATCH v7 08/10] dt-bindings: msm/dp: Add bindings for HDCP
 registers
To: Mark Yacoub <markyacoub@chromium.org>
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
Cc: freedreno@lists.freedesktop.org, suraj.kandpal@intel.com,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sean Paul <sean@poorly.run>, intel-gfx@lists.freedesktop.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 seanpaul@chromium.org, linux-arm-msm@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>, devicetree@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Fri, Mar 24, 2023 at 12:56=E2=80=AFPM Mark Yacoub <markyacoub@chromium.o=
rg> wrote:
>
> From: Sean Paul <seanpaul@chromium.org>
>
> Add the bindings for the MSM DisplayPort HDCP registers
> which are required to write the HDCP key into the display controller as
> well as the registers to enable HDCP authentication/key
> exchange/encryption.
>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Stephen Boyd <swboyd@chromium.org>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Sean Paul <seanpaul@chromium.org>
> Signed-off-by: Mark Yacoub <markyacoub@chromium.org>
>
> ---
> Changes in v2:
> -Drop register range names (Stephen)
> -Fix yaml errors (Rob)
> Changes in v3:
> -Add new compatible string for dp-hdcp
> -Add descriptions to reg
> -Add minItems/maxItems to reg
> -Make reg depend on the new hdcp compatible string
> Changes in v4:
> -Rebase on Bjorn's multi-dp patchset
> Changes in v4.5:
> -Remove maxItems from reg (Rob)
> -Remove leading zeros in example (Rob)
> Changes in v5:
> -None
> Changes in v6:
> -Rebased: modify minItems instead of adding it as new line.
> Changes in v7:
> -Revert the change to minItems
> -Added the maxItems to Reg
>
>  .../devicetree/bindings/display/msm/dp-controller.yaml     | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
