Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83738C03FD0
	for <lists+dri-devel@lfdr.de>; Fri, 24 Oct 2025 03:05:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7176310E9B0;
	Fri, 24 Oct 2025 01:05:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="HGKWwB6t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 133FD10E9B0
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 01:05:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id B08134B1E0
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 01:05:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91065C4CEE7
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 01:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761267944;
 bh=N1UrWgOILBnRqswy5FEY5ciBzNaPxQL8l8pULuyWGhg=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=HGKWwB6tqVCDNQXkwvia7WqSK/15ckYh/qWd3Bqmmto2uguzpJ5DdO5Bny5AY+3KW
 8Fma3DgjHoMFdstMLz3B0aOCebGjG/4Y6N4ssIpvbTUjlmyJw7+i/7xnNnVFKz47/j
 HzPg79YwpJsxyCvZL+UP1ik9TlxeJbTsfdERAuO41OJHlPrmXgRSvSrO/j+njTN2l/
 bs7skxIy/eCmBoDFcn1F7tLlB+NY7utdoNR+IoTXFMBJH2Igg1yX91NEfGDE3qku69
 QWJLVGiD06AVYLc/W7FYIwt9AanVoHGHM/mRwKdkgSQadYKJs6M6MxZj+jsfyG3TqN
 hGmrNKilJawcg==
Received: by mail-pl1-f179.google.com with SMTP id
 d9443c01a7336-29488933a91so5791815ad.2
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 18:05:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCU8fZqvjPYdqK0ss/lwRz6VgUnPD6YTAmy8yvqRATZcqqXhaGcNdYqf1jiUQIpiwfDiCnhRzk5ZhbU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz7WhHHtVEVl7J6x0XGDKzgEI5QCnZjy5Zbs6Aps+X0ny+U1iFA
 6P5ASHQK6mn3aBZjrfvpx37zO515Ff22yYgxohhmXUOpUCM+NoYF+1bvjEPnu/SRTRRJDmxaVIm
 rYXSU0ifPwiYBDPBvd+n4oYABkfIZog==
X-Google-Smtp-Source: AGHT+IHmHKlSVr/GzmP0xTu6cc4eOtrAqzAvhNJDZa7uOYCSe2OZrvM3vKi5tiykPb+LHZCxa5Phtk7WggV5xA2hEwk=
X-Received: by 2002:a17:903:240d:b0:290:ac36:2ecd with SMTP id
 d9443c01a7336-290c9ca66famr334907535ad.14.1761267944170; Thu, 23 Oct 2025
 18:05:44 -0700 (PDT)
MIME-Version: 1.0
References: <20251023-mediatek-drm-hdmi-v2-v11-0-7873ec4a1edf@collabora.com>
 <20251023-mediatek-drm-hdmi-v2-v11-9-7873ec4a1edf@collabora.com>
In-Reply-To: <20251023-mediatek-drm-hdmi-v2-v11-9-7873ec4a1edf@collabora.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Fri, 24 Oct 2025 01:05:32 +0000
X-Gmail-Original-Message-ID: <CAAOTY_9o-hHv5Lrd+EKX_mN2PXDC+ifoxSsR6bf6oJdD=N=46A@mail.gmail.com>
X-Gm-Features: AS18NWA5QC6YOHp_7gfEfZBp9DHUgi7nYNVLVto2zbyhAzsNc56vGLeJtuK6Umg
Message-ID: <CAAOTY_9o-hHv5Lrd+EKX_mN2PXDC+ifoxSsR6bf6oJdD=N=46A@mail.gmail.com>
Subject: Re: [PATCH v11 09/11] drm/mediatek: Introduce HDMI/DDC v2 for
 MT8195/MT8188
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 CK Hu <ck.hu@mediatek.com>, 
 kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
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

Hi, Louis:

Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com> =E6=96=BC 2025=E5=B9=
=B410=E6=9C=8823=E6=97=A5
=E9=80=B1=E5=9B=9B =E4=B8=8A=E5=8D=8810:32=E5=AF=AB=E9=81=93=EF=BC=9A
>
> From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com=
>
>
> Add support for the newer HDMI-TX (Encoder) v2 and DDC v2 IPs
> found in MediaTek's MT8195, MT8188 SoC and their variants, and
> including support for display modes up to 4k60 and for HDMI
> Audio, as per the HDMI 2.0 spec.
>
> HDCP and CEC functionalities are also supported by this hardware,
> but are not included in this commit and that also poses a slight
> difference between the V2 and V1 controllers in how they handle
> Hotplug Detection (HPD).
>
> While the v1 controller was using the CEC controller to check
> HDMI cable connection and disconnection, in this driver the v2
> one does not.
>
> This is due to the fact that on parts with v2 designs, like the
> MT8195 SoC, there is one CEC controller shared between the HDMI
> Transmitter (HDMI-TX) and Receiver (HDMI-RX): before eventually
> adding support to use the CEC HW to wake up the HDMI controllers
> it is necessary to have support for one TX, one RX *and* for both
> at the same time.
>
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
> ---
>  drivers/gpu/drm/mediatek/Kconfig            |    7 +
>  drivers/gpu/drm/mediatek/Makefile           |    2 +
>  drivers/gpu/drm/mediatek/mtk_hdmi_common.c  |    4 +
>  drivers/gpu/drm/mediatek/mtk_hdmi_common.h  |    9 +
>  drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c  |  395 ++++++++
>  drivers/gpu/drm/mediatek/mtk_hdmi_regs_v2.h |  263 +++++
>  drivers/gpu/drm/mediatek/mtk_hdmi_v2.c      | 1398 +++++++++++++++++++++=
++++++
>  7 files changed, 2078 insertions(+)
>
> diff --git a/drivers/gpu/drm/mediatek/Kconfig b/drivers/gpu/drm/mediatek/=
Kconfig
> index 994b48b82d447c47391122e6ff2d139edb223536..c89ae4ed2c96123684ecd3573=
14fa2d2ba5a4433 100644
> --- a/drivers/gpu/drm/mediatek/Kconfig
> +++ b/drivers/gpu/drm/mediatek/Kconfig
> @@ -45,3 +45,10 @@ config DRM_MEDIATEK_HDMI
>         select DRM_MEDIATEK_HDMI_COMMON
>         help
>           DRM/KMS HDMI driver for Mediatek SoCs
> +
> +config DRM_MEDIATEK_HDMI_V2
> +       tristate "DRM HDMI v2 IP support for MediaTek SoCs"
> +       depends on DRM_MEDIATEK
> +       select DRM_MEDIATEK_HDMI_COMMON
> +       help
> +         DRM/KMS HDMI driver for MediaTek SoCs with HDMIv2 IP
>

The checkpatch show this warning. Maybe other old description just has
one line, I think it's better to have more information.
Please provide more information and I would modify this patch when I apply =
it.

WARNING: please write a help paragraph that fully describes the config
symbol with at least 4 lines
#54: FILE: drivers/gpu/drm/mediatek/Kconfig:49:
+config DRM_MEDIATEK_HDMI_V2
+    tristate "DRM HDMI v2 IP support for MediaTek SoCs"
+    depends on DRM_MEDIATEK
+    select DRM_MEDIATEK_HDMI_COMMON
+    help
+      DRM/KMS HDMI driver for MediaTek SoCs with HDMIv2 IP

Regards,
Chun-Kuang.
