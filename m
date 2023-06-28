Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B787B740C8E
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jun 2023 11:22:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE3EF10E129;
	Wed, 28 Jun 2023 09:22:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com
 [IPv6:2607:f8b0:4864:20::b31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8D0210E129
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jun 2023 09:22:50 +0000 (UTC)
Received: by mail-yb1-xb31.google.com with SMTP id
 3f1490d57ef6-bd729434fa0so5707898276.1
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jun 2023 02:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687944169; x=1690536169;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7/BYorY/q5cLcDCJ090Ghd9w+MLE7Dxtd/FOA8XGDK0=;
 b=yGjc51d+pnM9hgZXegh8DLv4eBfWeNuQiQAqZqW/yiUB1oZacLRVjQkPKxQ1SD3+cr
 OB9/i0YTbxwHomeiZ+R6g4e8ZlP9pHZrNtvk4dODAOPVPjg62kWiAbzqUknUJlbv2w8w
 80uXgaDuIp90IZ8SgDVZ/RMIX03ZD3Jgq5ih+FL9wx6yYgNE/zB/3VhKzl+nyVnXExaC
 ZQToOuiiFgx5ELsVyQhptW9UqaLW7uN0QNjQ0qavMfUQHvMtu1Oa9hBD1Dz4qd2PQrUy
 4Xhys1MVsogiRyPPJtcTynNPChMfuNIlaSus7JRWHT4Kpac2UG9+lVMsrpqHfGfBuCGM
 hw2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687944169; x=1690536169;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7/BYorY/q5cLcDCJ090Ghd9w+MLE7Dxtd/FOA8XGDK0=;
 b=RUouzk6Ri6NZ9RMvmIii7gHLiOxK/B3ecN+HzICqogO056WWbdh4p8tUqQKJp0UL2G
 WKwqdzgpnYtDHnWBtE8IRnvv+SG1gH+pydooSWJeGP1M9rUQ9HqpVysgfagpluTAL+Yu
 /TY7jd5uGzD+Eqh2m6JvbUiPDsuVP61RClcDHqdPhZwR7v+ViJSzpxgbeddF1QUxVHVq
 wK6lByYhXBOPMRPTmgreio1l5b9S5JKWpYKBD0Rg/i5pVZ+CyatrgsegNE1CjQYzJwPy
 ERfqht5L4ibVZyqde5ENpjd94dYF1fxyA7OUc6pdxthqUPWcAgEwyINOjfM6D5u0P9Sm
 vJEQ==
X-Gm-Message-State: AC+VfDx/Sg6IH/TPh8vA1SO2wXxVO+Ri0JN1OLGt8CAG4mWjeIy2vw5o
 DOLpyM/rONjtoOiaRze81OsG9cx9Bq7S8VNshOVSDw==
X-Google-Smtp-Source: ACHHUZ4r8WinXJCe974MXutLGlQG6R6mzm8uxHQuDvBriU4zf9/VBOQVyva1v0fUYCoOQYRpUOz5Bz8N4Lm1mHqZQc8=
X-Received: by 2002:a25:838e:0:b0:c12:abdb:c22d with SMTP id
 t14-20020a25838e000000b00c12abdbc22dmr12289571ybk.61.1687944169188; Wed, 28
 Jun 2023 02:22:49 -0700 (PDT)
MIME-Version: 1.0
References: <20230521-drm-panels-sony-v1-0-541c341d6bee@somainline.org>
 <20230521-drm-panels-sony-v1-10-541c341d6bee@somainline.org>
In-Reply-To: <20230521-drm-panels-sony-v1-10-541c341d6bee@somainline.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 28 Jun 2023 11:22:37 +0200
Message-ID: <CACRpkdbrk_pPqewo-bGPq4NQScHSRKNMeO0ik_aqEQ+BY12BBQ@mail.gmail.com>
Subject: Re: [PATCH RFC 10/10] drm/panel/sony-griffin-samsung: Add panel
 driver for Sony Xperia 1
To: Marijn Suijten <marijn.suijten@somainline.org>
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
Cc: dri-devel@lists.freedesktop.org, Caleb Connolly <caleb@connolly.tech>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Sam Ravnborg <sam@ravnborg.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Andy Gross <agross@kernel.org>, Jessica Zhang <quic_jesszhan@quicinc.com>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>, Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jami Kettunen <jami.kettunen@somainline.org>,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, May 21, 2023 at 11:23=E2=80=AFPM Marijn Suijten
<marijn.suijten@somainline.org> wrote:

> The Sony Xperia 1 (codename kumano griffin) features an unnamed 4k OLED
> DSI cmd mode panel produced by Samsung.  It can be driven in a
> 1644x3840@60 or 1096x2560@60 mode, and always has Display Stream
> Compression 1.1 enabled.
>
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
(...)

> +static int sony_griffin_samsung_on(struct sony_griffin_samsung *ctx)
> +{

> +       ret =3D mipi_dsi_dcs_exit_sleep_mode(dsi);
> +       if (ret < 0) {
> +               dev_err(dev, "Failed to exit sleep mode: %d\n", ret);
> +               return ret;
> +       }
> +       usleep_range(10000, 11000);
> +
> +       ret =3D mipi_dsi_dcs_set_tear_on(dsi, MIPI_DSI_DCS_TEAR_MODE_VBLA=
NK);
> +       if (ret < 0) {
> +               dev_err(dev, "Failed to set tear on: %d\n", ret);
> +               return ret;
> +       }
> +
> +       mipi_dsi_dcs_write_seq(dsi, 0xf0, 0x5a, 0x5a);
> +       mipi_dsi_dcs_write_seq(dsi, 0xb0, 0x05);
> +       mipi_dsi_dcs_write_seq(dsi, 0xd7, 0x07);
> +       mipi_dsi_dcs_write_seq(dsi, 0xf0, 0xa5, 0xa5);
> +       /* Enable backlight control */
> +       mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_WRITE_CONTROL_DISPLAY, BIT(5=
));
> +       msleep(110);
> +       mipi_dsi_dcs_write_seq(dsi, 0xf0, 0x5a, 0x5a);
> +       mipi_dsi_dcs_write_seq(dsi, 0xe2, enable_4k ? 0 : 1);
> +       mipi_dsi_dcs_write_seq(dsi, 0xf0, 0xa5, 0xa5);
> +
> +       ret =3D mipi_dsi_dcs_set_column_address(dsi, 0, hdisplay - 1);
> +       if (ret < 0) {
> +               dev_err(dev, "Failed to set column address: %d\n", ret);
> +               return ret;
> +       }
> +
> +       ret =3D mipi_dsi_dcs_set_page_address(dsi, 0, vdisplay - 1);
> +       if (ret < 0) {
> +               dev_err(dev, "Failed to set page address: %d\n", ret);
> +               return ret;
> +       }
> +
> +       mipi_dsi_dcs_write_seq(dsi, 0xf0, 0x5a, 0x5a);
> +       mipi_dsi_dcs_write_seq(dsi, 0xb0, 0x70);
> +       mipi_dsi_dcs_write_seq(dsi, 0xb9, 0x00, 0x60);
> +       mipi_dsi_dcs_write_seq(dsi, 0xf0, 0xa5, 0xa5);
> +       mipi_dsi_dcs_write_seq(dsi, 0xf0, 0x5a, 0x5a);
> +       mipi_dsi_dcs_write_seq(dsi, 0xc5, 0x2e, 0x21);
> +       mipi_dsi_dcs_write_seq(dsi, 0xf0, 0xa5, 0xa5);
> +
> +       ret =3D mipi_dsi_dcs_set_display_on(dsi);
> +       if (ret < 0) {
> +               dev_err(dev, "Failed to turn display on: %d\n", ret);
> +               return ret;
> +       }
> +
> +       return 0;
> +}

This is eerily similar to the sequence in panel-samsung-sofef00.c:

static int sofef00_panel_on(struct sofef00_panel *ctx)
{
        struct mipi_dsi_device *dsi =3D ctx->dsi;
        struct device *dev =3D &dsi->dev;
        int ret;

        dsi->mode_flags |=3D MIPI_DSI_MODE_LPM;

        ret =3D mipi_dsi_dcs_exit_sleep_mode(dsi);
        if (ret < 0) {
                dev_err(dev, "Failed to exit sleep mode: %d\n", ret);
                return ret;
        }
        usleep_range(10000, 11000);

        mipi_dsi_dcs_write_seq(dsi, 0xf0, 0x5a, 0x5a);

        ret =3D mipi_dsi_dcs_set_tear_on(dsi, MIPI_DSI_DCS_TEAR_MODE_VBLANK=
);
        if (ret < 0) {
                dev_err(dev, "Failed to set tear on: %d\n", ret);
                return ret;
        }

        mipi_dsi_dcs_write_seq(dsi, 0xf0, 0xa5, 0xa5);
        mipi_dsi_dcs_write_seq(dsi, 0xf0, 0x5a, 0x5a);
        mipi_dsi_dcs_write_seq(dsi, 0xb0, 0x07);
        mipi_dsi_dcs_write_seq(dsi, 0xb6, 0x12);
        mipi_dsi_dcs_write_seq(dsi, 0xf0, 0xa5, 0xa5);
        mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_WRITE_CONTROL_DISPLAY, 0x20);
        mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_WRITE_POWER_SAVE, 0x00);

        ret =3D mipi_dsi_dcs_set_display_on(dsi);
        if (ret < 0) {
                dev_err(dev, "Failed to set display on: %d\n", ret);
                return ret;
        }

        return 0;
}

Isn't this just the same display controller with a different configuration?
Especially the sleep ranges are even the same.

I almost feel like buying these phones just to pry them apart and put
under a microscope to figure out what these displays actually contain.

Yours,
Linus Walleij
