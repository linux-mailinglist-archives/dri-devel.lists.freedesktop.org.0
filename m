Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC4018A00AF
	for <lists+dri-devel@lfdr.de>; Wed, 10 Apr 2024 21:35:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6AD810E62C;
	Wed, 10 Apr 2024 19:35:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=googlemail.com header.i=@googlemail.com header.b="eRVhEskS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 913E310E62C
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Apr 2024 19:35:08 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id
 d9443c01a7336-1e4bf0b3e06so17430265ad.1
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Apr 2024 12:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20230601; t=1712777708; x=1713382508;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=g656SpCYaMp6vFyqsY3OV3wXp/aZxKZhrmXE0IxorBU=;
 b=eRVhEskSdTJ2LWLOvdz1M2RB4iK2lLfiKvfAzON8ctBeXSP6POh0MKZ5zKZaqjun2o
 dXiJJlymW4ezLwoSJ3YSM7MZm8sXsucnbQPpUDWujuGAXawWdoz5Rn7h7GF7i+SlNuDQ
 lJKGWCZMiZBPfdJ4pz6ABx86w0YO3bj8fz/LDxnrl9T2ZYOM2QaeRUVjQiSX7os+z+HJ
 cqUeLgWaetCZxFHaVDMtIDn3tUXetFqh+YYAfPIWiprkv9hDaPY7jhiMkkL28XlahnUW
 5RAKgI2m9D+TXI0o+8s8fd4JdTMWqYO8UwKUHGF8S/3zfMXr+3zSyM08/O5rIwa5tTOt
 OLNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712777708; x=1713382508;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=g656SpCYaMp6vFyqsY3OV3wXp/aZxKZhrmXE0IxorBU=;
 b=ogZVjvxPeKWCDmtW977Pkn4GXEu+LClGk19xGxV3trkjCpCYHqONwPbQ2JMnN96e8a
 3OyR9LLGxDGXYL7FARObMeLvcIIgCNWaEQ3+/uu+xImwrqVjyCXdnGX3ASj42mDyymCt
 YnRW9pLTs+8YTaR3CDAYI5apD8VRL3pE4oqQ1Up3nIeeT3X2A/j0iVXbvj16xTXPt7fv
 SMXxmLE01YYS9JlwkDF9WdpEMylLyJIVqfQv6I/W4B/XaBxCc4VkvyvZUR2KeF0z2d8P
 pkLT5DODu85gcjagP6NQMXWZv6tMwT3zOp3LlkQwGSF+X8tqWKekzB5R4d6ftXhboin3
 H3Sw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVodzUvhPEdGy9PwGqDodsSyIIaMdBCcC/aQ5ZET7f11EiFB3uraekVmdFaUn239IO9Tod6hGLA65gRKgqvOv0QEDZryB+z40+8nzmQwIZo
X-Gm-Message-State: AOJu0Yx74Na9TtLs6oqYBwjP98ZwYx4+5D5Fr2m24fGMCy3h263CfH0T
 RoZjGL6WVOUMjmja3xGgdjgj4vhajZOecYe2PfVg+WHLdGsNYAyA0Yd3a8e6/28x/fVX9Cdbu2W
 dwBcUeOtZt+Js6gkmR8i05H1gnPQ=
X-Google-Smtp-Source: AGHT+IFG4wZy5xKqrBbd0+jyKIYfyDkXeatsz1RW1t4MoepWhKG5fO6dMM+S5nhn7lThAmtFHKQqa2845byFu2CtKgU=
X-Received: by 2002:a17:902:ce06:b0:1e3:cd26:cf16 with SMTP id
 k6-20020a170902ce0600b001e3cd26cf16mr5200823plg.51.1712777707736; Wed, 10 Apr
 2024 12:35:07 -0700 (PDT)
MIME-Version: 1.0
References: <20240403-amlogic-v6-4-upstream-dsi-ccf-vim3-v12-0-99ecdfdc87fc@linaro.org>
 <20240403-amlogic-v6-4-upstream-dsi-ccf-vim3-v12-4-99ecdfdc87fc@linaro.org>
In-Reply-To: <20240403-amlogic-v6-4-upstream-dsi-ccf-vim3-v12-4-99ecdfdc87fc@linaro.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Wed, 10 Apr 2024 21:34:56 +0200
Message-ID: <CAFBinCChEc+GH+tdmByWDM=Gs_BUpDh=6S=ch3QbGUt501_Ejw@mail.gmail.com>
Subject: Re: [PATCH v12 4/7] drm/meson: gate px_clk when setting rate
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Jagan Teki <jagan@amarulasolutions.com>, Nicolas Belin <nbelin@baylibre.com>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="000000000000d9789e0615c322c7"
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

--000000000000d9789e0615c322c7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Neil,

On Wed, Apr 3, 2024 at 9:46=E2=80=AFAM Neil Armstrong <neil.armstrong@linar=
o.org> wrote:
>
> Disable the px_clk when setting the rate to recover a fully
> configured and correctly reset VCLK clock tree after the rate
> is set.
>
> Fixes: 77d9e1e6b846 ("drm/meson: add support for MIPI-DSI transceiver")
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  drivers/gpu/drm/meson/meson_dw_mipi_dsi.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/drivers/gpu/drm/meson/meson_dw_mipi_dsi.c b/drivers/gpu/drm/=
meson/meson_dw_mipi_dsi.c
> index a6bc1bdb3d0d..a10cff3ca1fe 100644
> --- a/drivers/gpu/drm/meson/meson_dw_mipi_dsi.c
> +++ b/drivers/gpu/drm/meson/meson_dw_mipi_dsi.c
> @@ -95,6 +95,7 @@ static int dw_mipi_dsi_phy_init(void *priv_data)
>                 return ret;
>         }
>
> +       clk_disable_unprepare(mipi_dsi->px_clk);
nit-pick: clk_disable(mipi_dsi->px_clk); should be enough here as my
understanding is that we only need to {un,}prepare a clock once.

>         ret =3D clk_set_rate(mipi_dsi->px_clk, mipi_dsi->mode->clock * 10=
00);
>
>         if (ret) {
> @@ -103,6 +104,12 @@ static int dw_mipi_dsi_phy_init(void *priv_data)
>                 return ret;
>         }
>
> +       ret =3D clk_prepare_enable(mipi_dsi->px_clk);
> +       if (ret) {
> +               dev_err(mipi_dsi->dev, "Failed to enable DSI Pixel clock =
(ret %d)\n", ret);
> +               return ret;
If we ever hit this error case then there will be a lot of additional
errors in the kernel log:
- initially the clock is prepared and enabled in
meson_dw_mipi_dsi_probe() by calling devm_clk_get_enabled()
- we then disable the clock above (generally disabling a clock is
expected to always succeed)
- if the clock can NOT be re-enabled here we just log the error
- in case a user tries to rmmod the driver (to modprobe it again) to
try and recover from an error the automatic disabling of the pix_clk
(based on devm_clk_get_enabled() where it was enabled initially) there
will be a splat because the clock is already disabled (and enabled
count is zero, so it cannot be disabled any further)

For the 32-bit SoC video clocks I keep track of them being enabled or
disabled, see [0], [1] and [2].
In my case this is important because we can run into cases where the
PLL doesn't lock (I am not sure how likely this is for your case).

It *seems* like we need to do something similar as
dw_mipi_dsi_phy_init() can be called when changing the display
resolution (or whenever drm_bridge_funcs.atomic_pre_enable) is called.
To illustrate what I have in mind I attached a diff (it's based on
this patch) - it's compile tested only as I have no DSI hardware.
In case dw_mipi_dsi_phy_init() is called only once per device
lifecycle things may get easier.

PS: I'm so happy that we don't need any clock notifiers for this!
So: good work with the clock driver bits.


Let me know what you think,
Martin


[0] https://github.com/xdarklight/linux/blob/meson-mx-integration-6.9-20240=
323/drivers/gpu/drm/meson/meson_vclk.c#L1177-L1179
[1] https://github.com/xdarklight/linux/blob/meson-mx-integration-6.9-20240=
323/drivers/gpu/drm/meson/meson_vclk.c#L1077
[2] https://github.com/xdarklight/linux/blob/meson-mx-integration-6.9-20240=
323/drivers/gpu/drm/meson/meson_vclk.c#L1053

--000000000000d9789e0615c322c7
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="meson_dw_mipi_dsi-clk-disable-enable.diff"
Content-Disposition: attachment; 
	filename="meson_dw_mipi_dsi-clk-disable-enable.diff"
Content-Transfer-Encoding: base64
Content-ID: <f_luu7g3we0>
X-Attachment-Id: f_luu7g3we0

ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl9kd19taXBpX2RzaS5jIGIv
ZHJpdmVycy9ncHUvZHJtL21lc29uL21lc29uX2R3X21pcGlfZHNpLmMKaW5kZXggYTZiYzFiZGIz
ZDBkLi45MjY2MThkMGU2MjIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNv
bl9kd19taXBpX2RzaS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl9kd19taXBp
X2RzaS5jCkBAIC00Niw2ICs0Niw3IEBAIHN0cnVjdCBtZXNvbl9kd19taXBpX2RzaSB7CiAJc3Ry
dWN0IGNsayAqYml0X2NsazsKIAlzdHJ1Y3QgY2xrICpweF9jbGs7CiAJc3RydWN0IHJlc2V0X2Nv
bnRyb2wgKnRvcF9yc3Q7CisJYm9vbCBweF9jbGtfZW5hYmxlZDsKIH07CiAKICNkZWZpbmUgZW5j
b2Rlcl90b19tZXNvbl9kd19taXBpX2RzaSh4KSBcCkBAIC04Nyw2ICs4OCwxMSBAQCBzdGF0aWMg
aW50IGR3X21pcGlfZHNpX3BoeV9pbml0KHZvaWQgKnByaXZfZGF0YSkKIAkJcmV0dXJuIHJldDsK
IAl9CiAKKwlpZiAobWlwaV9kc2ktPnB4X2Nsa19lbmFibGVkKSB7CisJCWNsa19kaXNhYmxlKG1p
cGlfZHNpLT5weF9jbGspOworCQltaXBpX2RzaS0+cHhfY2xrX2VuYWJsZWQgPSBmYWxzZTsKKwl9
CisKIAkvKiBNYWtlIHN1cmUgdGhlIHJhdGUgb2YgdGhlIGJpdCBjbG9jayBpcyBub3QgbW9kaWZp
ZWQgYnkgc29tZW9uZSBlbHNlICovCiAJcmV0ID0gY2xrX3JhdGVfZXhjbHVzaXZlX2dldChtaXBp
X2RzaS0+Yml0X2Nsayk7CiAJaWYgKHJldCkgewpAQCAtMTAzLDYgKzEwOSwxNCBAQCBzdGF0aWMg
aW50IGR3X21pcGlfZHNpX3BoeV9pbml0KHZvaWQgKnByaXZfZGF0YSkKIAkJcmV0dXJuIHJldDsK
IAl9CiAKKwlyZXQgPSBjbGtfcHJlcGFyZV9lbmFibGUobWlwaV9kc2ktPnB4X2Nsayk7CisJaWYg
KHJldCkgeworCQlkZXZfZXJyKG1pcGlfZHNpLT5kZXYsICJGYWlsZWQgdG8gZW5hYmxlIERTSSBQ
aXhlbCBjbG9jayAocmV0ICVkKVxuIiwgcmV0KTsKKwkJcmV0dXJuIHJldDsKKwl9CisKKwltaXBp
X2RzaS0+cHhfY2xrX2VuYWJsZWQgPSB0cnVlOworCiAJc3dpdGNoIChtaXBpX2RzaS0+ZHNpX2Rl
dmljZS0+Zm9ybWF0KSB7CiAJY2FzZSBNSVBJX0RTSV9GTVRfUkdCODg4OgogCQlkcGlfZGF0YV9m
b3JtYXQgPSBEUElfQ09MT1JfMjRCSVQ7CkBAIC0yODcsNyArMzAxLDcgQEAgc3RhdGljIGludCBt
ZXNvbl9kd19taXBpX2RzaV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogCQly
ZXR1cm4gZGV2X2Vycl9wcm9iZShkZXYsIHJldCwgIlVuYWJsZSB0byBnZXQgZW5hYmxlZCBiaXRf
Y2xrXG4iKTsKIAl9CiAKLQltaXBpX2RzaS0+cHhfY2xrID0gZGV2bV9jbGtfZ2V0X2VuYWJsZWQo
ZGV2LCAicHgiKTsKKwltaXBpX2RzaS0+cHhfY2xrID0gZGV2bV9jbGtfZ2V0X3ByZXBhcmVkKGRl
diwgInB4Iik7CiAJaWYgKElTX0VSUihtaXBpX2RzaS0+cHhfY2xrKSkKIAkJcmV0dXJuIGRldl9l
cnJfcHJvYmUoZGV2LCBQVFJfRVJSKG1pcGlfZHNpLT5weF9jbGspLAogCQkJCSAgICAgIlVuYWJs
ZSB0byBnZXQgZW5hYmxlZCBweF9jbGtcbiIpOwpAQCAtMzI3LDYgKzM0MSw5IEBAIHN0YXRpYyB2
b2lkIG1lc29uX2R3X21pcGlfZHNpX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2
KQogewogCXN0cnVjdCBtZXNvbl9kd19taXBpX2RzaSAqbWlwaV9kc2kgPSBwbGF0Zm9ybV9nZXRf
ZHJ2ZGF0YShwZGV2KTsKIAorCWlmIChtaXBpX2RzaS0+cHhfY2xrX2VuYWJsZWQpCisJCWNsa19k
aXNhYmxlKG1pcGlfZHNpLT5weF9jbGspOworCiAJZHdfbWlwaV9kc2lfcmVtb3ZlKG1pcGlfZHNp
LT5kbWQpOwogfQogCg==
--000000000000d9789e0615c322c7--
