Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2433F6AF8EB
	for <lists+dri-devel@lfdr.de>; Tue,  7 Mar 2023 23:35:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 128C110E552;
	Tue,  7 Mar 2023 22:35:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com
 [IPv6:2607:f8b0:4864:20::b2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8820910E552
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Mar 2023 22:35:07 +0000 (UTC)
Received: by mail-yb1-xb2a.google.com with SMTP id t4so12941908ybg.11
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Mar 2023 14:35:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678228506;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Yyb0rhnuV7oh3CLMKShl+J+wi5X4qG87kgpZAdrNvLo=;
 b=j2eJjWOeqSZqBlt1Ya6O396ehMlnu7bun7PacqdauNEkRClrB8l8duBGCZVtvxoS+N
 RpjWcYF+kLNzDgxJiKJH7/eQWNNMu5Vh3/AyEuy+++8brALwbb1CfyaXBvFZuPuDv/46
 e7+wyKEt41FixpsMi/mmgIACA2+6+MNGOfGRpBzHOw2DT2Ln98zlicoDcfiHFjxgnhGV
 0P+kxVAvbAVCjRaiKILKxjcQHTzFKgb+OIKfWKyCwN8BMUWIoyPUA7NLEM03KmA+VxnO
 fo47X0aDdRhCRXOv4KCWvSCqWHyMubIrLBjt0T0IvaMMmMlIiL4QmpeWKpeUFImkc6o+
 OR4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678228506;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Yyb0rhnuV7oh3CLMKShl+J+wi5X4qG87kgpZAdrNvLo=;
 b=V+Dvcymc2bAF0HqnTJTtY4cnp9M2g0TsoCHEcwCfLRVxeSLFZ/w3bYvLiUxnohjCUN
 F+GvyKA6Zi7kgkf08Nv+zD/YxwhayI5b1Sx3VCWG25V7j5mH+r5b6EwlwK1Tr33Ev7Bb
 DshrfYGMVsz3YtHq7lU4QbpLpK8P+PPB4kltjuKDFnX9RC2/WsdpqfMNXZZBBAWHoyC3
 FqPj4AyM8FNAgIze4z5+nLUcD+0rJUIIzCpn29OzIVkVVVBdNgPWnTYDfR22QGlccu2a
 MT5mo/wGtHa8eUtv6CDMlSn1w0m8iv7v2gULFlXN95H5DwNFKK91FTKcPg+zzui5GCiF
 1Reg==
X-Gm-Message-State: AO0yUKUAiIbMNHKYeskS4ha4za9Blv35qctijdLApa0i/u3PzpjObzIj
 sY8mlwkecqC0tZGNhRPgsDQHxueWjALXiXZvwUr9iA==
X-Google-Smtp-Source: AK7set+qjWLKdRokY0PE/Ly5XTIkGJNsmaouJx7H7eHeFmFlb5PHA7OryQsrT4nZo7WdvCLp9Fsxze+058KE7Clp5w4=
X-Received: by 2002:a05:6902:c3:b0:9f1:6c48:f95f with SMTP id
 i3-20020a05690200c300b009f16c48f95fmr7774360ybs.5.1678228506476; Tue, 07 Mar
 2023 14:35:06 -0800 (PST)
MIME-Version: 1.0
References: <20230220121258.10727-1-lujianhua000@gmail.com>
 <20230220121258.10727-2-lujianhua000@gmail.com>
In-Reply-To: <20230220121258.10727-2-lujianhua000@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 7 Mar 2023 23:34:55 +0100
Message-ID: <CACRpkdbZCZiMM_qeqMd9=txVvPVHEzM4szOnPR-gCYdiXW_9eA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] drm/panel: Add driver for Novatek NT36523
To: Jianhua Lu <lujianhua000@gmail.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
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
Cc: devicetree@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jianhua,

thanks for your patch!

It appears Konrad is working on a very similar driver, so I suggest merging
them into one Novatek NT36523 driver.

Possibly we can fix this up first and then add Konrads Lenovo-panel with
a patch on top.

On Mon, Feb 20, 2023 at 1:13=E2=80=AFPM Jianhua Lu <lujianhua000@gmail.com>=
 wrote:

> Add a driver for panels using the Novatek NT36523 display driver IC.
>
> Signed-off-by: Jianhua Lu <lujianhua000@gmail.com>

(...)

I like how you abstract the panel with init commands in the panel info.

> +enum dsi_cmd_type {
> +       INIT_DCS_CMD,
> +       DELAY_CMD,
> +};
> +
> +struct panel_init_cmd {
> +       enum dsi_cmd_type type;
> +       size_t len;
> +       const char *data;
> +};
> +
> +#define _INIT_DCS_CMD(...) { \
> +       .type =3D INIT_DCS_CMD, \
> +       .len =3D sizeof((char[]){__VA_ARGS__}), \
> +       .data =3D (char[]){__VA_ARGS__} }
> +
> +#define _INIT_DELAY_CMD(...) { \
> +       .type =3D DELAY_CMD,\
> +       .len =3D sizeof((char[]){__VA_ARGS__}), \
> +       .data =3D (char[]){__VA_ARGS__} }

I have seen this type of reinvented wheels a few times now. Don't do this.

Look into other recently merged drivers and look how they do it, for exampl=
e
drivers/gpu/drm/panel/panel-himax-hx8394.c

For example:

- Use mipi_dsi_dcs_write_seq()

- If the delay is just used at one point in the sequence, do not invent
  a command language like above for it, open code the delay instead

- Try to decode as much magic as possible, if you look in Konrads
  driver you clearly see some standard MIPI commands, I bet you have
  some too.

- Maybe use callbacks to send sequences instead of tables, like in
  the himax driver?

Other than that it seems like something that could also handle the Lenovo
display, or the other way around, I don't know which driver is the best
starting point, but this one has the right Novatek name at least.

Yours,
Linus Walleij
