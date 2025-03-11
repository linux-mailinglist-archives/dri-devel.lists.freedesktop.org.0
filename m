Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 682FEA5D335
	for <lists+dri-devel@lfdr.de>; Wed, 12 Mar 2025 00:40:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 067F210E288;
	Tue, 11 Mar 2025 23:40:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="EetDPh/d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92AE210E6A2
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Mar 2025 23:40:38 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id
 a640c23a62f3a-ac2dfdf3c38so18077166b.3
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Mar 2025 16:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741736436; x=1742341236; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bCrEEz1dOxuYiOCf/MyW6ME80hX/dRGzdXvkMqYCiBA=;
 b=EetDPh/dhub0S3a/lEbOKaB7Dz68Bl1BqNPYlxHwly7uQnFxEInSaCCW7crfZdIJYb
 EDknvtRDw5IDp1olwy9X+UIcJwfjc+qtS19YOP3AV1NlhFjWKRXbSKrJGYLR5yPncJPP
 6ummeglT3jUReNr6KL5qYYIMAdUwuNfb5mhBf9AV1ngYNV3+0yF5KynerIXWBz4gAgKD
 /bIrVMkO9AOHK9cUddNRTO4G3TAdo/XMf+qy78sCUnQ0hXK1B09up2DFRGdZ7UtsmhtV
 rqnGybMoqrMJdbfWl0ANfhmD8sDRZdE5ii5TFXENwPUCMMn54sAmGD3rZ7/fShRop+IL
 LcQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741736436; x=1742341236;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bCrEEz1dOxuYiOCf/MyW6ME80hX/dRGzdXvkMqYCiBA=;
 b=J0tQvfqXggrVp2OqWIfadWi32Nmok0767OZc8thfJZHMjSQaxYLWa9/0t1c4pV/KQQ
 fNIDJglGL+7tkz31JsE4ZHNYGz9rzHhuKqMVBaH01pMAuce1gf3evkKsfiw84y1MhOtt
 x32pH/E5Yb83GNzCvGIQFmZUU6NVh80N23xrH2qSzTf5C5Na4IJUwzifrNkGqIJDahcQ
 wsGVOMdKq92+Axq1aCywMCPCUrSY1r4MYwj0odlHBKR8OIh8NrOrZwjeNJuZljSu6ZB8
 9SDMLwF+qlZuCi+nRhGO4LwMq9lwqzPBVtMPqZpAGvnM9hSpwgkL54BxLPQAErTFCt+9
 5vFg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXCzRbU6nDhM4oew/CplZgTqgoj5w9rsKd+sNgvhb8yfN/qZCD63EMRkxtyMpO1qaCsnuMbhDjZP14=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwFzep86561yG8l3aHUG8dXJVY3G8IhgkSOndOmp68JKoAXh4/c
 JRyiNVhR9cZvxftG7u5S8CKCDYPwT+4sNyOLNQWLc0YPbBHmTb/0FNrLzz6PrHmszMdpG4gXoI6
 GDzhxg0ypRmLfg+5U/BwKznAVWZM=
X-Gm-Gg: ASbGnctCoCt72sbcK69U0JMIG8aEIh6n5SWKZDXEgRoI1rkCbInv/XF6mB6sGAuk7C2
 VO+rcG3XQR1gPyWshMf2S8OOD6vvAEyzmHdmlyeyCksDbGbcX7nre3/w6/eYupqziJD6mHKmB6W
 Iq1+azfD8OuGyyiRazkqXoHyZaZp/qc+NsTfg=
X-Google-Smtp-Source: AGHT+IED7QDwbntOHRlnxjMjDpnMFuyLr4iyflUA7B1f8doT07Xl1uuxrnzYDNXmzw/O+rn332YQhW8ICQ9/3CKDmsk=
X-Received: by 2002:a17:907:a194:b0:ac2:d1bd:3293 with SMTP id
 a640c23a62f3a-ac2d1bd38fdmr243750566b.19.1741736435499; Tue, 11 Mar 2025
 16:40:35 -0700 (PDT)
MIME-Version: 1.0
References: <20250310132759.3345-1-chunkuang.hu@kernel.org>
In-Reply-To: <20250310132759.3345-1-chunkuang.hu@kernel.org>
From: Dave Airlie <airlied@gmail.com>
Date: Wed, 12 Mar 2025 09:40:24 +1000
X-Gm-Features: AQ5f1Jpu8dUUMKDViwZXrHwirWdNNjyZ1Y-CfeoKOGN_jFAMjkXSkf8Tgq9kWd0
Message-ID: <CAPM=9txoJ3ZOyrcr-FikFAMHSdt3dOFAt=+TvBHFuPTXzH5qvQ@mail.gmail.com>
Subject: Re: [GIT PULL] mediatek drm next for 6.15
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Anusha Srivatsa <asrivats@redhat.com>, Jason-JH Lin <jason-jh.lin@mediatek.com>,
 Douglas Anderson <dianders@chromium.org>, Fabien Parent <fparent@baylibre.com>,
 Dan Carpenter <dan.carpenter@linaro.org>
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

Hey,

This introduced a warning on my local builds,

commit 30d5c46444a6aa4c78103fb898250ab5e6e8a97d
Author: Jason-JH Lin <jason-jh.lin@mediatek.com>
Date:   Mon Feb 24 13:12:21 2025 +0800

    drm/mediatek: Fix config_updating flag never false when no mbox channel

  CC [M]  drivers/gpu/drm/mediatek/mtk_dp.o
/raid1/home/airlied/devel/kernel/dim/src/drivers/gpu/drm/mediatek/mtk_crtc.=
c:
In function =E2=80=98mtk_crtc_update_config=E2=80=99:
/raid1/home/airlied/devel/kernel/dim/src/drivers/gpu/drm/mediatek/mtk_crtc.=
c:630:1:
warning: label =E2=80=98update_config_out=E2=80=99 defined but not used
[-Wunused-label]
  630 | update_config_out:
      | ^~~~~~~~~~~~~~~~~

Please fix and resend,
Thanks,
Dave.

On Mon, 10 Mar 2025 at 23:37, Chun-Kuang Hu <chunkuang.hu@kernel.org> wrote=
:
>
> Hi, Dave & Daniel:
>
> This includes:
> 1. HDMI fixup and refinement
> 2. Move to devm_platform_ioremap_resource() usage
> 3. Add MT8188 dsc compatible
> 4. Fix config_updating flag never false when no mbox channel
> 5. dp: drm_err =3D> dev_err in HPD path to avoid NULL ptr
> 6. Add dpi power-domains example
> 7. Add MT8365 SoC support
> 8. Fix error codes in mtk_dsi_host_transfer()
>
> Regards,
> Chun-Kuang.
>
> The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f0=
5b:
>
>   Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)
>
> are available in the Git repository at:
>
>   https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git =
tags/mediatek-drm-next-6.15
>
> for you to fetch changes up to 8c9d519aa138aa36c0c3f201ff336b17b0ba32b2:
>
>   drm/mediatek: dsi: fix error codes in mtk_dsi_host_transfer() (2025-03-=
03 13:26:03 +0000)
>
> ----------------------------------------------------------------
> Mediatek DRM Next for Linux 6.15
>
> 1. HDMI fixup and refinement
> 2. Move to devm_platform_ioremap_resource() usage
> 3. Add MT8188 dsc compatible
> 4. Fix config_updating flag never false when no mbox channel
> 5. dp: drm_err =3D> dev_err in HPD path to avoid NULL ptr
> 6. Add dpi power-domains example
> 7. Add MT8365 SoC support
> 8. Fix error codes in mtk_dsi_host_transfer()
>
> ----------------------------------------------------------------
> AngeloGioacchino Del Regno (21):
>       drm/mediatek: mtk_hdmi: Unregister audio platform device on failure
>       drm/mediatek: mtk_hdmi: Fix typo for aud_sampe_size member
>       drm/mediatek: mtk_hdmi: Compress of_device_id array entries
>       drm/mediatek: mtk_hdmi: Move vendor/product strings to drm_bridge
>       drm/mediatek: mtk_hdmi: Remove unused members of struct mtk_hdmi
>       drm/mediatek: mtk_hdmi: Use devm managed version of drm_bridge_add
>       drm/mediatek: mtk_hdmi: Remove ifdef for CONFIG_PM_SLEEP
>       drm/mediatek: mtk_hdmi: Remove goto in mtk_hdmi_clk_enable_audio()
>       drm/mediatek: mtk_hdmi: Remove driver bound to HDMI print
>       drm/mediatek: mtk_hdmi: Cleanup function mtk_hdmi_resume()
>       dt-bindings: display: mediatek: dpi: Add MT8195 and MT8188 compat
>       drm/mediatek: mtk_dpi: Add support for Pattern Generator in debugfs
>       drm/mediatek: mtk_dpi: Use an array for pixclk factor calculation
>       drm/mediatek: mtk_dpi: Move pixel clock setting flow to function
>       drm/mediatek: mtk_dpi: Add checks for reg_h_fre_con existence
>       drm/mediatek: mtk_dpi: Move the input_2p_en bit to platform data
>       drm/mediatek: mtk_dpi: Add support for DPI input clock from HDMI
>       drm/mediatek: mtk_dpi: Support AFIFO 1T1P output and conversion
>       drm/mediatek: mtk_dpi: Explicitly manage TVD clock in power on/off
>       drm/mediatek: Add support for MT8195 Digital Parallel Interface
>       dt-bindings: display: mediatek: dsc: Add MT8188 compatible
>
> Anusha Srivatsa (1):
>       drm/mediatek: Move to devm_platform_ioremap_resource() usage
>
> Dan Carpenter (1):
>       drm/mediatek: dsi: fix error codes in mtk_dsi_host_transfer()
>
> Douglas Anderson (1):
>       drm/mediatek: dp: drm_err =3D> dev_err in HPD path to avoid NULL pt=
r
>
> Fabien Parent (2):
>       dt-bindings: display: mediatek: dpi: add power-domains example
>       drm/mediatek: add MT8365 SoC support
>
> Jason-JH Lin (1):
>       drm/mediatek: Fix config_updating flag never false when no mbox cha=
nnel
>
>  .../bindings/display/mediatek/mediatek,dpi.yaml    |   7 +
>  .../bindings/display/mediatek/mediatek,dsc.yaml    |   3 +
>  drivers/gpu/drm/mediatek/mtk_crtc.c                |   5 +-
>  drivers/gpu/drm/mediatek/mtk_disp_color.c          |   4 +-
>  drivers/gpu/drm/mediatek/mtk_disp_gamma.c          |   4 +-
>  drivers/gpu/drm/mediatek/mtk_disp_merge.c          |   4 +-
>  drivers/gpu/drm/mediatek/mtk_disp_ovl.c            |   4 +-
>  drivers/gpu/drm/mediatek/mtk_disp_rdma.c           |   4 +-
>  drivers/gpu/drm/mediatek/mtk_dp.c                  |   6 +-
>  drivers/gpu/drm/mediatek/mtk_dpi.c                 | 323 +++++++++++++++=
------
>  drivers/gpu/drm/mediatek/mtk_dpi_regs.h            |   9 +
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c             |  10 +
>  drivers/gpu/drm/mediatek/mtk_dsi.c                 |  10 +-
>  drivers/gpu/drm/mediatek/mtk_hdmi.c                | 108 +++----
>  drivers/gpu/drm/mediatek/mtk_mdp_rdma.c            |   4 +-
>  15 files changed, 334 insertions(+), 171 deletions(-)
