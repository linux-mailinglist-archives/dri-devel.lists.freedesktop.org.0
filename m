Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C3F26AF86E
	for <lists+dri-devel@lfdr.de>; Tue,  7 Mar 2023 23:18:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34A3310E2A0;
	Tue,  7 Mar 2023 22:18:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com
 [IPv6:2607:f8b0:4864:20::112a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D511710E2A0
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Mar 2023 22:18:37 +0000 (UTC)
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-536bbef1c5eso271472227b3.9
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Mar 2023 14:18:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678227517;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=E3DiUR/GgkhgxD2cosHQ9gtTM4EkXnRYU9WOulYy+fI=;
 b=uXQ6pTKn/U2liBv6xoaR1ke+Sh9LHgFqCMu07bxAsguGWrsAegY7rzgPRxpIpb4qk6
 CeaBMbGxoMqpib1QGU73lov1dIR23psWLel2MCzUxJaZzgBIdTc0lfm8f3qzBa5tXEha
 Ly643bvs3Uvtalj9HSi95RwxbLGj093nxULaG4RcPU14sWRsrl6O8AotxZse7oyej7JH
 QgbrLNWKIXF9+RbNS4CYW0E9U5GV/QysiawP03KpoWHaeMvdLjPAZCNCVYrc2g4RGEJm
 t5oVl86KKmdHuwGtV0voKm148Bah5/B8uANQH8WPfsqr/nQD3Bym6YK3CYL5SSIPMD9D
 dOGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678227517;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=E3DiUR/GgkhgxD2cosHQ9gtTM4EkXnRYU9WOulYy+fI=;
 b=Aapw/69rrh5z6/ILHgRCDYSTWUvQC2aEhoeYfvpS+tEQcXjjAh3q/oZnr3NfIGClUE
 Oot7bSxPXXXK7cZ2O/4LvEy+Ccc+EAWt+IdRd3E0ulMCOwiLXB2uoZVrGQPVpTr2dLYg
 +5x7xtPkBDpCSUcMbCfocA/VYirvLrcQy4X+Oi+tom+rcNi2WVnyoeMAzAxQxmVb0bVZ
 xdPOIuMO9BkYzQC3pM4QiUwCTaCV1gtetX80TciQuw2SeZxcD4LB3ulmK7CETqLjxXA0
 GxHiMHF/POzZjvneuKy5XU8UekLd1Mdur6zQwXK6OEA3JCEx2lGB2i8VjuKHUGxDDH9P
 HmKQ==
X-Gm-Message-State: AO0yUKUfkdWDn3SoQrm6mehfx+obrq8rpJyrddBhujvc/Vpq9+l3QoK/
 8xVTnY4jYxNq9O7lEPxLaTNPKezYpbaKHE69UQ6ZrA==
X-Google-Smtp-Source: AK7set/SYnYyFvNE6h8dqT6SwfI0vZ82td/XxR+z0aS3Qpc3Vvvm8bzcKrJkYNLWOiue2Fju36euDI5bybr7bBVpeHE=
X-Received: by 2002:a81:ad24:0:b0:52e:bb2d:2841 with SMTP id
 l36-20020a81ad24000000b0052ebb2d2841mr9656902ywh.10.1678227516874; Tue, 07
 Mar 2023 14:18:36 -0800 (PST)
MIME-Version: 1.0
References: <20230217-topic-lenovo-panel-v2-0-2e2c64729330@linaro.org>
 <20230217-topic-lenovo-panel-v2-2-2e2c64729330@linaro.org>
In-Reply-To: <20230217-topic-lenovo-panel-v2-2-2e2c64729330@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 7 Mar 2023 23:18:25 +0100
Message-ID: <CACRpkdZ8RvFrieWXhx1WGO71M10H0-b3WbDXM7=xnngX7uWT6Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] gpu/drm/panel: Add Lenovo NT36523W BOE panel
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
 Jianhua Lu <lujianhua000@gmail.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, devicetree@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 phone-devel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 7, 2023 at 2:26=E2=80=AFPM Konrad Dybcio <konrad.dybcio@linaro.=
org> wrote:

> Introduce support for the BOE panel with a NT36523W touch/driver IC
> found on some Lenovo Tab P11 devices. It's a 2000x1200, 24bit RGB
> MIPI DSI panel with integrated DCS-controlled backlight (that expects
> big-endian communication).
>
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>

I will think this is some variant of the Novatek NT36523 display
controller packaged up with Lenovo electronics until proven how
wrong I am.

I will listen to reason if it can be demonstrated that NT36523 and
NT36523W are considerably different and need very different
drivers, but I seriously doubt it. (For reasons see below.)

>  drivers/gpu/drm/panel/panel-lenovo-nt36523w-boe.c | 747 ++++++++++++++++=
++++++

We usually share code with different displays using the
same display controller, so panel-novatek-nt36523.c should
be used as name.

> +config DRM_PANEL_LENOVO_NT36523W_BOE
> +       tristate "Lenovo NT36523W BOE panel"

Name it after the display controller like the other examples
in the Kconfig, DRM_PANEL_NOVATEK_NT36523

> +       mipi_dsi_dcs_write_seq(dsi, 0xff, 0x20);
> +       mipi_dsi_dcs_write_seq(dsi, 0xfb, 0x01);
> +       mipi_dsi_dcs_write_seq(dsi, 0x05, 0xd9);
> +       mipi_dsi_dcs_write_seq(dsi, 0x07, 0x78);
> +       mipi_dsi_dcs_write_seq(dsi, 0x08, 0x5a);
> +       mipi_dsi_dcs_write_seq(dsi, 0x0d, 0x63);
> +       mipi_dsi_dcs_write_seq(dsi, 0x0e, 0x91);
> +       mipi_dsi_dcs_write_seq(dsi, 0x0f, 0x73);
> +       mipi_dsi_dcs_write_seq(dsi, 0x95, 0xeb);
> +       mipi_dsi_dcs_write_seq(dsi, 0x96, 0xeb);
> +       mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_SET_PARTIAL_ROWS, 0x11);

I think it looks very similar to Jianhua:s driver:
https://lore.kernel.org/lkml/20230220121258.10727-1-lujianhua000@gmail.com/=
T/

Can't you just add this special magic sequence into
that driver instead?

Would it help if we merge Jianhua's driver first so you can patch on
top of it?

Yours,
Linus Walleij
