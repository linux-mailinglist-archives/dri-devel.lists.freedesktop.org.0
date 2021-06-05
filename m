Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BCF1139D59F
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jun 2021 09:11:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4090D6E2C0;
	Mon,  7 Jun 2021 07:11:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com
 [IPv6:2607:f8b0:4864:20::72e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CD186E0C4
 for <dri-devel@lists.freedesktop.org>; Sat,  5 Jun 2021 12:18:24 +0000 (UTC)
Received: by mail-qk1-x72e.google.com with SMTP id r17so12039971qkp.10
 for <dri-devel@lists.freedesktop.org>; Sat, 05 Jun 2021 05:18:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2XU5HDbmcHnF712wVpqM6iQ1X7EhYZWOfK4vwV87prU=;
 b=FWobSpgrhp0Af/hcJqRgDfsHgRC3XmmPbsTFVx7BVZIZsbDAiAq6QmHzQc9wN6ld5l
 6OlQdRVBJ4+zJAXiNK0mBkcTt5KDuPzVbIfcnPn0aHjMdOO+fXMorjb5pGOISWE05oWS
 E+545N6/1rPXvrj+XtwR4xKiapXjMbyzDxyvv1TIezV2LtV2Gc7EJTx4sr9E4BXgjl08
 Mp/gY390Qh61pvf0wqhzTTtw4+GUeasRTiDSVrtZWD6CUES2pnc6QT+2onqSTsGLX+TT
 cKiijQcGu3QN5k2RzM47GLUs61t7zUhpLlYQC9rx9SK1AGJJTyeklrKsl9XqbPS5rlEV
 wEDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2XU5HDbmcHnF712wVpqM6iQ1X7EhYZWOfK4vwV87prU=;
 b=gIxf1ZDis9rqzuzjVRzx6Zpr5ciCGhT9VtvtV2MBN+mFmzbIeJROJU7mCf2JSae/4Z
 LELfJYso5ia1L6XZ3X3FJovSDh8XN8J9ZT14najmioy3sLSIygqxSfOGQXFxMWA/eLXy
 CAMR2DwFDJZh75XAFX3FWi39eP5irQSR7HL9dlV5Nk5IeNuwtzzPpgp7xDZbx5UiIxi3
 gtIjL4dPwapovPsabeZFwP93yBS7lnyhuTjSyf1vBwArrdIzKLf4W1lXdKGea3To2/vg
 WXcVrCdy7M0GgCAuHQ/oTmKHNPAatQsjjXToGtqpSzzf1aav2G4OTEmMH8sgX2qOrF+i
 eePw==
X-Gm-Message-State: AOAM530yyz4i4duuHGfQaZCzpDYdGHLJSe2h2/HSFI1s1OU7N3KKHrbz
 xK71iSC4jP7ebBzLLkSzbv8cFUyzBl9oJUzQrA0=
X-Google-Smtp-Source: ABdhPJz616zbzLkCG4N8pskE1XrPJz4cf9/NOusosJu2q74PjtNEUUCHcdBR5LFqOAKT12RVqIG5z0nyLpZzvcV8Bos=
X-Received: by 2002:a05:620a:119c:: with SMTP id
 b28mr8701321qkk.374.1622895503195; 
 Sat, 05 Jun 2021 05:18:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210605104942.39487-1-konrad.dybcio@somainline.org>
 <20210605104942.39487-2-konrad.dybcio@somainline.org>
In-Reply-To: <20210605104942.39487-2-konrad.dybcio@somainline.org>
From: Marijn Suijten <marijns95@gmail.com>
Date: Sat, 5 Jun 2021 14:18:12 +0200
Message-ID: <CANX-K3t35412cnsWwiG=oi7MK9qYoOFCD5NBOqCwzXFA9OamsQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] drm/panel: Add support for SONY JDI Synaptics panel
To: Konrad Dybcio <konrad.dybcio@somainline.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Mon, 07 Jun 2021 07:11:17 +0000
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 jamipkettunen@somainline.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, martin.botka@somainline.org,
 ~postmarketos/upstreaming@lists.sr.ht,
 angelogioacchino.delregno@somainline.org, marijn.suijten@somainline.org,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 5 Jun 2021 at 12:49, Konrad Dybcio <konrad.dybcio@somainline.org> wrote:
>
> From: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
>
> This commit adds support for Synaptics+JDI display panels
> used in SONY Xperia X, X Compact, X Performance, XZ and XZs
> smartphones.
>
> Due to the nature of phone manufacturing, it is impossible
> to retrieve the actual panel names, hence the replacement
> ones, detailing the devices they are used on.
>
> Co-developed-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> ---
>  drivers/gpu/drm/panel/Kconfig                 |  10 +
>  drivers/gpu/drm/panel/Makefile                |   1 +
>  .../gpu/drm/panel/panel-sony-synaptics-jdi.c  | 511 ++++++++++++++++++
>  3 files changed, 522 insertions(+)
>  create mode 100644 drivers/gpu/drm/panel/panel-sony-synaptics-jdi.c
>
[..]
> diff --git a/drivers/gpu/drm/panel/panel-sony-synaptics-jdi.c b/drivers/gpu/drm/panel/panel-sony-synaptics-jdi.c
> new file mode 100644
> index 000000000000..2b1972dea58a
> --- /dev/null
> +++ b/drivers/gpu/drm/panel/panel-sony-synaptics-jdi.c
> @@ -0,0 +1,511 @@
[..]
> +struct synaptics_jdi_panel {
> +       struct drm_panel base;
> +       struct mipi_dsi_device *dsi;
> +
> +       struct backlight_device *backlight;

As mentioned in pre-review, don't forget to actually probe the
backlight.  It is not necessary to store the backlight (anymore), it
is already kept in base->backli  Something like this should work:

    rc = drm_panel_of_backlight(&synaptics_jdi_panel->base);
    if (rc)
            return dev_err_probe(dev, rc,
                    "cannot register of backlight\n");

> +       struct regulator_bulk_data supplies[5];
> +
> +       struct gpio_desc *pan_reset_gpio;
> +       struct gpio_desc *ts_reset_gpio;
> +
> +       bool prepared;
> +       bool enabled;
> +
> +       const struct synaptics_jdi_panel_desc *desc;
> +};

Thanks!
