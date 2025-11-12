Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4BCAC50538
	for <lists+dri-devel@lfdr.de>; Wed, 12 Nov 2025 03:20:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB4B710E04D;
	Wed, 12 Nov 2025 02:20:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="B2I9MviD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0914110E04D
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Nov 2025 02:20:33 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id
 d2e1a72fcca58-7af6a6f20easo284319b3a.0
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Nov 2025 18:20:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762914032; x=1763518832; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LxUF+h7S30BNbJmH4g7pCp3lBzmymefVuj0S5lsfjbg=;
 b=B2I9MviDjFLRzD/u2JEAgvJcQN4becBqOTGGyoGtFVxgOM22t0l7rvt/VM+g5ilzeI
 UdOqPBHQfEFarDTt7lDTSOuTbVNYrmrySdsJqr9FgFMcwwPbY6Xu/mMtdspgZLg18nXb
 JngYYt+nS8jxIy0Cx2rs4z0sHvmh1LfSqdsqDn5Fx25legmdlhK/bDwD4HmoaFqlaG4u
 WFzLEZuP+RKkg9+IUTomazWEKE/OEI/fZwCoEVCzKeqsN8K7zl0tWXwzSHkWtuTpNiak
 y07J37DUe9xtjupqDb5geVOQuZXdghFafjXUIUHfuJdPhVJVAVYq1pyG8qYosiQhsvSK
 +HAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762914032; x=1763518832;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=LxUF+h7S30BNbJmH4g7pCp3lBzmymefVuj0S5lsfjbg=;
 b=gSB/q4kTlX624R0ZMqqw52tWCVRgjzQj6twXOAh7ZzFGuYi9EzTwyJqzw+rREcGKdY
 tIbREmtaNSG5pkdVSK3VeMUedFJi6qUyiKhIst1lUUQPVhKuZTebE4ZwyLaflF2/AcAj
 alW5WTCWuePQipXJh9OVFTzqze5HGUYqoXqWZfI/wau4eahxHAjXUA7TR31ruBtEw7wW
 iieg1nbx5g6AQTtI92TCzvM7EIAScFNOAcZjA5+1Lta4XT+PEBXM+zCHE1eRLOSCu0vf
 5/a7NbN2IQjT6KhpXHJLIGBHgsZUM0ajkD24n+gqUnRZClJuOZ8pJrV0UuI68StzgMRi
 ZxOA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW85tpEitnTjSsuJpK/zP6uS6irwT+kugQ5XfcA/Of1DSxzbZgozpbSD2DBm3EVKne6slTIzoSzKhs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzKTBhTYFVPnJm+ubGcvR1/0qxn4Gv7V167sK7RWO4LGW6flqOQ
 RUSB2spsHvfLQGCvgK/PX9uhkJas6ihV7ZNq7EdyUVQbhTK7fuPOqLeycSrRFBtZ+bZ0auaq3GD
 b89VzvOS8QFbxqhngVos+wqqdvgtkyn4=
X-Gm-Gg: ASbGncsWtqV+X8ISPlpw6wLTUgA/iFKfbxZMLOvHd8vMJ6FX1FVnlXWIlGfz5cpcdFE
 ywwSXk+7a4QFmqrQHyjjhV6YLrN4W4/+QdV4Z2oTxDsLDyYywFmGmqmpbtPAo3TOXlgxv/zTxO4
 77e+KQQ4Q+TUblKWGx0nL9B69y6317Pq3ePcXx062DxLJv0nRun8rUCgIPsOFpfLINfU7y4XNow
 yHP6+0BP5D26RSH5/nne7dPuWO8U4QplR6X/9ez1fu/SyauDSRehBwj7sxN
X-Google-Smtp-Source: AGHT+IFtc6HQrz/xKZ9emyb5FEGlT0SRf+ATUq6DWBXr3zYhujoZ6/yNyjXJ5nXZWWbTjr5BzqbESW0tw1NXrAGBcT8=
X-Received: by 2002:a17:90a:d88b:b0:340:be4d:8980 with SMTP id
 98e67ed59e1d1-343dde27552mr1630702a91.14.1762914032513; Tue, 11 Nov 2025
 18:20:32 -0800 (PST)
MIME-Version: 1.0
References: <20250923053001.2678596-1-shengjiu.wang@nxp.com>
In-Reply-To: <20250923053001.2678596-1-shengjiu.wang@nxp.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Wed, 12 Nov 2025 10:20:20 +0800
X-Gm-Features: AWmQ_bk8d1h8tBpBrZUtGjow-hV3gnwT5P-EgH-CH9iaE3RQY3pwj7BwDScJKrc
Message-ID: <CAA+D8APHUZmP8qfta4=YL200hJkiikru8yQPddvBZyx-+-1ZtQ@mail.gmail.com>
Subject: Re: [PATCH v7 0/7] drm/bridge: imx: Add HDMI PAI driver on i.MX8MP
To: Shengjiu Wang <shengjiu.wang@nxp.com>, Shawn Guo <shawnguo@kernel.org>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org, 
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 airlied@gmail.com, simona@ffwll.ch, lumag@kernel.org, dianders@chromium.org, 
 cristian.ciocaltea@collabora.com, luca.ceresoli@bootlin.com, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 victor.liu@nxp.com, s.hauer@pengutronix.de, kernel@pengutronix.de, 
 festevam@gmail.com, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 p.zabel@pengutronix.de, devicetree@vger.kernel.org, l.stach@pengutronix.de, 
 perex@perex.cz, tiwai@suse.com, linux-sound@vger.kernel.org
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

Hi Shawn

On Tue, Sep 23, 2025 at 1:30=E2=80=AFPM Shengjiu Wang <shengjiu.wang@nxp.co=
m> wrote:
>
> The HDMI TX Parallel Audio Interface (HTX_PAI) is a digital module that
> acts as the bridge between the Audio Subsystem to the HDMI TX Controller.
>
> Add HDMI PAI driver on i.MX8MP to make HDMI audio function fully work.
>
> changes in v7:
> - add back the mutex which removed in v6
> - add Tested-by tag from Alexander.
>
> changes in v6:
> - remove mutex in dw_hdmi_set_sample_iec958()
>
> changes in v5:
> - add empty line commit message for patch 7
> - remove blank line in dts node
> - add component_unbind_all when dw_hdmi_probe return error
>
> changes in v4:
> - separate dts for soc and board
> - bind hdmi_pai with hdmi_tx by moving some code to .bind() and .unbind()
> - add "select DRM_DW_HDMI" to fix build error reported by test robot
> - remove unnecessary code/definition in pai driver
>
> changes in v3:
> - add space and 'U' in asoundef.h
> - add more commit message for binding doc commit
> - add bitfield.h header for fixing build error
>
> changes in v2:
> - address some comments on commit messages
> - add two more commits:
>   add definitions for the bits in IEC958 subframe
>   add API dw_hdmi_set_sample_iec958() for iec958 format
> - use component helper in hdmi_pai and hdmi_tx driver
> - use regmap in hdmi_pai driver.
> - add clocks in binding doc
>
> Shengjiu Wang (7):
>   dt-bindings: display: imx: add HDMI PAI for i.MX8MP
>   ALSA: Add definitions for the bits in IEC958 subframe
>   drm/bridge: dw-hdmi: Add API dw_hdmi_to_plat_data() to get plat_data
>   drm/bridge: dw-hdmi: Add API dw_hdmi_set_sample_iec958() for iec958
>     format
>   drm/bridge: imx: add driver for HDMI TX Parallel Audio Interface
>   arm64: dts: imx8mp: Add hdmi parallel audio interface node
>   arm64: dts: imx8mp-evk: enable hdmi_pai device

Could you please review the above two dts patches?
Thanks.

Best regards
Shengjiu wang

>
>  .../display/bridge/fsl,imx8mp-hdmi-tx.yaml    |  12 ++
>  .../display/imx/fsl,imx8mp-hdmi-pai.yaml      |  69 ++++++++
>  arch/arm64/boot/dts/freescale/imx8mp-evk.dts  |   4 +
>  arch/arm64/boot/dts/freescale/imx8mp.dtsi     |  27 ++-
>  drivers/gpu/drm/bridge/imx/Kconfig            |  11 ++
>  drivers/gpu/drm/bridge/imx/Makefile           |   1 +
>  drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pai.c  | 158 ++++++++++++++++++
>  drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c   |  65 ++++++-
>  .../drm/bridge/synopsys/dw-hdmi-gp-audio.c    |   5 +
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c     |  18 +-
>  include/drm/bridge/dw_hdmi.h                  |  11 +-
>  include/sound/asoundef.h                      |   9 +
>  12 files changed, 382 insertions(+), 8 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx=
8mp-hdmi-pai.yaml
>  create mode 100644 drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pai.c
>
> --
> 2.34.1
>
