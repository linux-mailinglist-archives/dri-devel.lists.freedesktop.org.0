Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97C1CB0EC3C
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jul 2025 09:46:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB87C10E76F;
	Wed, 23 Jul 2025 07:46:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="RN+J0mJE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f174.google.com (mail-il1-f174.google.com
 [209.85.166.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79ADF10E769
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 07:41:06 +0000 (UTC)
Received: by mail-il1-f174.google.com with SMTP id
 e9e14a558f8ab-3df2dbe85d1so43034965ab.0
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 00:41:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753256466; x=1753861266; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=81Y9fywoqF7EeyNEvfPWdoet0imEzVFFJD69wE8Ijuo=;
 b=RN+J0mJEZACdCrhasdzIiMfpObQ56XYf/RNw1VLL183uSO4yP3Tz5vbejMXls3ANRp
 t1zA+K1yAJsVTSC9l9nl27dcLc6FTO2xrTOLrPiIPSLTKMs69P+m5nAesKqV1FsNdt3y
 pUtkNRM/a2tz9PeO12/Uyay1Jpr10xXl/UAy2YfezmeWSTE0DuSAdvznecAeKQ+fBiHy
 7weV58Wg/FSFJTtXli2dPN34ifze4xAc1Y+AJxrSdegf7g/lOarH0cQn0k6JUojaQOje
 Z8/Qa6KH4EZLGuHWUPTjmeb0CKVp2zSZQCebAD0Cr1ZIaPTAyI+GFcLtZ6/EvJLhTQaD
 eX6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753256466; x=1753861266;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=81Y9fywoqF7EeyNEvfPWdoet0imEzVFFJD69wE8Ijuo=;
 b=v8CkwaYa2GaeVKAcbsMCu2gyrlzorTx1/cJHRNTdkiFKaAgjjIpJvmJBA3+NuevqXa
 rsSrYg3nK4SizqN2WnOWHK4X8UtKtbmLx/JO0c4Mf64+ZIN1JFQbSfpowzHnTp9gjQIl
 dkFnyYuRdDLRZMLUtuAj8XG6HRQNMPWZPKWKv2BDAldZFhAD1BBTeTun8vLX+lYVwRXd
 Yur8cU0UF8X91Fgf8RR1gbGftpiGg2g1fLgHXLva1XdwjcTbS70WsqcysNT9ByPsKzfW
 p5fwxTSNAzWIfBE7HMGWatkVDXNqTWuqhshXI+wr02ciHsEboVuLLek+Ki9jlIrlt0rB
 Y+1g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXeoxwRAX3Kr6aACVU6fTKl5S0hLDApGHlnlyS5ZH66WBBSjoNC3J/co0kwscZzcR9vjzltr9ilhog=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxsWKWbWOikKvXx4aDK1DJjUXhxF0nQ2gSaJBbMdwJkDh9vhiS/
 /iB0Fn2LnqgbhD4wTCaUgEOc+N0eeSqlxj9pn8UcgDDYNoC7EBML2j7aUfnyBom7P1Jat3rE0ma
 sf3/5AfCcvhjmSHYf0gB5l0VXEcvunxU=
X-Gm-Gg: ASbGncuq/L5yq13pyyOBO8+iIO8Nyaj7VIazHvAeKGdrR6gPDQ1iWVv2Z+0YZKM5W8R
 fOf/QRgv7KTNo936zHFk5kn8ezerTc8NuRX0Ys8iDAUydx8w8aE+P+L+feNDYbT44GhVNpXxWOo
 XgMyg9MP7PbB16gPPnkegRR0+7hc9axWfUzQmf0KwHksHykf2DNmTtxP72ux2DOqcwlzRQ4E7MR
 fn+eA4=
X-Google-Smtp-Source: AGHT+IFxfL3iPUA5T5lDVBBDYyqD7VIFaDA3fQJ5O2oa4O2dCluRKQiYM4kl1jFwdLxNmmpTIZDHo7HQtauQmGufUFM=
X-Received: by 2002:a05:6e02:2384:b0:3e2:c212:6164 with SMTP id
 e9e14a558f8ab-3e3354dfeb9mr37438145ab.12.1753256465669; Wed, 23 Jul 2025
 00:41:05 -0700 (PDT)
MIME-Version: 1.0
References: <20250718101150.3681002-1-shengjiu.wang@nxp.com>
 <20250718101150.3681002-3-shengjiu.wang@nxp.com> <4668607.LvFx2qVVIh@steina-w>
 <CAA+D8ANQdOuEiHrOWAbqVN2oFAAop2agBzKB2_YsoQ3_SFYYNw@mail.gmail.com>
 <85f1b9f3-0134-4385-9ac6-f3c6c2eb546f@nxp.com>
In-Reply-To: <85f1b9f3-0134-4385-9ac6-f3c6c2eb546f@nxp.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Wed, 23 Jul 2025 15:40:52 +0800
X-Gm-Features: Ac12FXwt3CFjI2gmqrSV6-EQJlh4rFyR_XU_vqi0YUQRGTQLoRTFr6d47NZAQO4
Message-ID: <CAA+D8AN6HSTwByHvqfkLnZ=UFPo8W48N5oRf2CtF6pXdCwSXag@mail.gmail.com>
Subject: Re: [PATCH 2/4] drm/bridge: imx: add driver for HDMI TX Parallel
 Audio Interface
To: Liu Ying <victor.liu@nxp.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org, 
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 airlied@gmail.com, simona@ffwll.ch, lumag@kernel.org, dianders@chromium.org, 
 cristian.ciocaltea@collabora.com, luca.ceresoli@bootlin.com, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
 festevam@gmail.com, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 p.zabel@pengutronix.de, devicetree@vger.kernel.org, l.stach@pengutronix.de, 
 Shengjiu Wang <shengjiu.wang@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Wed, 23 Jul 2025 07:46:33 +0000
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

On Tue, Jul 22, 2025 at 3:50=E2=80=AFPM Liu Ying <victor.liu@nxp.com> wrote=
:
>
> Hi Shengjiu,
>
> On 07/21/2025, Shengjiu Wang wrote:
> > On Fri, Jul 18, 2025 at 7:51=E2=80=AFPM Alexander Stein
> > <alexander.stein@ew.tq-group.com> wrote:
>
> [...]
>
> >> Am Freitag, 18. Juli 2025, 12:11:48 CEST schrieb Shengjiu Wang:
>
> [...]
>
> >>> +     /* IEC60958 format */
> >>> +     val =3D 31 << FIELD_CTRL_P_SEL_SHIFT;
> >>> +     val |=3D 30 << FIELD_CTRL_C_SEL_SHIFT;
> >>> +     val |=3D 29 << FIELD_CTRL_U_SEL_SHIFT;
> >>> +     val |=3D 28 << FIELD_CTRL_V_SEL_SHIFT;
> >>> +     val |=3D 4 << FIELD_CTRL_D_SEL_SHIFT;
> >>> +     val |=3D 0 << FIELD_CTRL_PRE_SEL_SHIFT;
>
> [...]
>
> >> But where do these numbers come from? I can see that downstream kernel
> >> sets these bits depending on audio config being passed.
> >
> > These numbers are defined in standard IEC958 spec.
>
> Can these be defined by macros, even in a certain common header file,
> include/sound/asoundef.h?

yes, then will include ALSA maintainer for the change.

>
> --
> Regards,
> Liu Ying
