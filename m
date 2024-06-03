Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1EC48D7A6B
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jun 2024 05:26:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D86F810E266;
	Mon,  3 Jun 2024 03:25:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="dqESVUdV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F393010E266
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jun 2024 03:25:53 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-35e4aaa0f33so1342687f8f.0
 for <dri-devel@lists.freedesktop.org>; Sun, 02 Jun 2024 20:25:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717385152; x=1717989952; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4+v70MlxPx26RmqrAm4uPG5jCKQlv/XwKZGoTtit7GE=;
 b=dqESVUdVE5g02MUG8eSTMBrDe9+HEdHTcYQJE3qOVzmfszrBiVfmYoyfgVhkpLWupU
 XmRxiw2qP6/1FXru1LHRvWM6KALO7EMbFdh1HV+34H0+ttqp5IJhXhg6CPmPx7FgYZ19
 vPP9KvmDqKRdE0KEI9b+QB+SkvAcwY6MObts3NL3nYk7h1X181snJi/fKpa3Fc4LHnLZ
 UqGC+H1XzxvgNWOlfLrUuFHFXdlmOg5/outIwm64cVFjhfl2Jh1rNk647Axo7v3/Khzf
 SK4/GKPIt6T9y9KTpVwYCQl+CJq8oGXz+6L2gGv4ZW+ZGWvKEe44SsmNvZO2ZWU+50ac
 NBkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717385152; x=1717989952;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4+v70MlxPx26RmqrAm4uPG5jCKQlv/XwKZGoTtit7GE=;
 b=X7GLXYF9NjplBBIbODRf7+aqvYEHiCzRaly748WpJBfQp1eNTeKCuDpS/qyuu75GUD
 0P9EKkhuDdy9bqdMNMU79zPJFTu3yup29gyCiGHKDeMyNZV7rCh0+P/LTbdbGKSC/QO2
 UdRaAVg73TEmtHopBk0KtvYyb73G24WOfq6QrSMDJ7Hya2InG+8rQbvPKAt2jpbAkY4w
 SrppNrq5woKMHpabYQ+XJTgkcbTIhoQzPrvVnPBJY6PlxaZwLBM9uSD9TXPh0x29DmmN
 /NWx9M083yrE+mrWQP6GKsEXhn1rfWgIO2qB8XDR5mm/0dTvjP79tA3CZZQU4wv6Phs/
 6A7Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUXHhXtKWg1gAQ5js4Yyk+x+zQOVutlOvsqh3FF0OSjtGftvOxhu9/tvhiCZJB2vuP/uF9PYL/mPBrTFpiXeMjqHEoMMycAgAx7MS/MWf8q
X-Gm-Message-State: AOJu0YySqmwhC41AUw5VcURMcZhwYPupmQjzwXlzLTKzxjZYxbEDnH9u
 GQth29qcCvs6pr1m/TCNEPujJIFxtxGjwoda7hMz1+1FG6014ra3K+ZImByqzR2S9CmECyz46LA
 i/cAML+xjavYHhmo7dbe+x1GmdeY=
X-Google-Smtp-Source: AGHT+IEZOMMK26fX+knYHoHceWWilwaB/46tXNfYgD7aKzJmhSx5uf/igZymrM/R6chuBlOLL1Du475O+oQnjqyHyYM=
X-Received: by 2002:adf:eb11:0:b0:35e:f0e:1ba0 with SMTP id
 ffacd0b85a97d-35e0f268722mr6796950f8f.19.1717385151461; Sun, 02 Jun 2024
 20:25:51 -0700 (PDT)
MIME-Version: 1.0
References: <20240602-drm-imx-cleanup-v3-0-e549e2a43100@linaro.org>
In-Reply-To: <20240602-drm-imx-cleanup-v3-0-e549e2a43100@linaro.org>
From: Chris Healy <cphealy@gmail.com>
Date: Sun, 2 Jun 2024 20:25:39 -0700
Message-ID: <CAFXsbZo3miDMQ7SDktRP_DOzMy2JTFz4AsuMp78jLQGauTNsmA@mail.gmail.com>
Subject: Re: [PATCH v3 00/12] drm/imx/ipuv3: switch LDB and parallel-display
 driver to use drm_bridge_connector
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
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

On an i.MX53 QSB with HDMI daughter board, this patch series is:

Tested-by: Chris Healy <cphealy@gmail.com>

HDMI output still works correctly and the bridges file reflects the changes=
:

Before:

root:/sys/kernel/debug/dri/display-subsystem/encoder-0 cat bridges
bridge[0]: 0xc0fa76d8
        type: [0] Unknown
        ops: [0x0]
bridge[1]: 0xc0fba03c
        type: [0] Unknown
        OF: /soc/bus@60000000/i2c@63fc4000/bridge-hdmi@39:sil,sii9022
        ops: [0x7] detect edid hpd


After:

root:/sys/kernel/debug/dri/display-subsystem/encoder-0 cat bridges
bridge[0]: 0xc0fa76d8
        type: [0] Unknown
        ops: [0x0]
bridge[1]: 0xc0fb9f5c
        type: [0] Unknown
        OF: /soc/bus@60000000/i2c@63fc4000/bridge-hdmi@39:sil,sii9022
        ops: [0x7] detect edid hpd
bridge[2]: 0xc0fb9794
        type: [11] HDMI-A
        OF: /connector-hdmi:hdmi-connector
        ops: [0x0]

On Sun, Jun 2, 2024 at 5:04=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> The IPUv3 DRM i.MX driver contains several codepaths for different
> usescases: both LDB and paralllel-display drivers handle next-bridge,
> panel and the legacy display-timings DT node on their own.
>
> Drop unused ddc-i2c-bus and edid handling (none of the DT files merged
> upstream ever used these features), switch to panel-bridge driver,
> removing the need to handle drm_panel codepaths separately and finally
> switch to drm_bridge_connector, removing requirement for the downstream
> bridges to create drm_connector on their own.
>
> This has been tested on the iMX53 with the DPI panel attached to LDB via
> LVDS decoder, using all possible usecases (lvds-codec + panel, panel
> linked directly to LDB node and the display-timings node).
>
> To be able to test on the iMX53 QSRB with the HDMI cape apply [1], [2]
>
> [1] https://lore.kernel.org/all/20240514030718.533169-1-victor.liu@nxp.co=
m/
> [2] https://lore.kernel.org/all/20240602-imx-sii902x-defconfig-v1-1-71a6c=
382b422@linaro.org/
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
> Changes in v3:
> - Notice (soft) dependencies in the cover letter (Chris)
> - Select DRM_BRIDGE instead of depending on it (Philipp)
> - Dropped unused selection of DRM_PANEL (Philipp)
> - Added missing include of <drm/bridge/imx.h> to parallel-display.c
>   (Philipp)
> - Link to v2: https://lore.kernel.org/r/20240331-drm-imx-cleanup-v2-0-d81=
c1d1c1026@linaro.org
>
> Changes in v2:
> - Fixed drm_bridge_attach flags in imx/parallel-display driver.
> - Moved the legacy bridge to drivers/gpu/drm/bridge
> - Added missing EXPORT_SYMBOL_GPL to the iMX legacy bridge
> - Link to v1: https://lore.kernel.org/r/20240311-drm-imx-cleanup-v1-0-e10=
4f05caa51@linaro.org
>
> ---
> Dmitry Baryshkov (12):
>       dt-bindings: display: fsl-imx-drm: drop edid property support
>       dt-bindings: display: imx/ldb: drop ddc-i2c-bus property
>       drm/imx: cleanup the imx-drm header
>       drm/imx: parallel-display: drop edid override support
>       drm/imx: ldb: drop custom EDID support
>       drm/imx: ldb: drop custom DDC bus support
>       drm/imx: ldb: switch to drm_panel_bridge
>       drm/imx: parallel-display: switch to drm_panel_bridge
>       drm/imx: add internal bridge handling display-timings DT node
>       drm/imx: ldb: switch to imx_legacy_bridge / drm_bridge_connector
>       drm/imx: parallel-display: switch to imx_legacy_bridge / drm_bridge=
_connector
>       drm/imx: move imx_drm_connector_destroy to imx-tve
>
>  .../bindings/display/imx/fsl-imx-drm.txt           |   2 -
>  .../devicetree/bindings/display/imx/ldb.txt        |   1 -
>  drivers/gpu/drm/bridge/imx/Kconfig                 |  10 +
>  drivers/gpu/drm/bridge/imx/Makefile                |   1 +
>  drivers/gpu/drm/bridge/imx/imx-legacy-bridge.c     |  85 +++++++++
>  drivers/gpu/drm/imx/ipuv3/Kconfig                  |  10 +-
>  drivers/gpu/drm/imx/ipuv3/imx-drm-core.c           |   7 -
>  drivers/gpu/drm/imx/ipuv3/imx-drm.h                |  14 --
>  drivers/gpu/drm/imx/ipuv3/imx-ldb.c                | 203 +++++----------=
------
>  drivers/gpu/drm/imx/ipuv3/imx-tve.c                |   8 +-
>  drivers/gpu/drm/imx/ipuv3/parallel-display.c       | 139 +++-----------
>  include/drm/bridge/imx.h                           |  13 ++
>  12 files changed, 187 insertions(+), 306 deletions(-)
> ---
> base-commit: 850ca533e572247b6f71dafcbf7feb0359350963
> change-id: 20240310-drm-imx-cleanup-10746a9b71f5
>
> Best regards,
> --
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>
