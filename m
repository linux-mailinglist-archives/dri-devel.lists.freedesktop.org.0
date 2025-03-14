Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39F4CA6224A
	for <lists+dri-devel@lfdr.de>; Sat, 15 Mar 2025 00:54:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD99610E06A;
	Fri, 14 Mar 2025 23:54:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="NdSwdPLU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0950810E06A
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Mar 2025 23:54:26 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-ab771575040so711251166b.1
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Mar 2025 16:54:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1741996464; x=1742601264;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rfs1IApiP78w47mM0JVCd/4nl3GQUErIVjcJVZeb7qw=;
 b=NdSwdPLU2OPxfEkBbIdmXBLwBKgp8Dlc/KwQoxEjdX1wo/rALn0ZykDCVbJMlUg1DL
 KYTp5RaAPw0gFyicaP3u3d/zFxq8Qg+uqS6faZX43+LFNzzZx4fWv+u0nmvBxfb2dOB5
 EDzQVr1UOKqvP9Zn1ernooj2PpIw5+k+Adnvw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741996464; x=1742601264;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rfs1IApiP78w47mM0JVCd/4nl3GQUErIVjcJVZeb7qw=;
 b=rQhfdLyBGOgRhpXf0/a0MnvN+TJyl4xxbt/tpCsL/0vE/WtOZXF4ihSCcLzBIy1XKV
 uQr6iGoP2vZjedkIUgirDIDhL0iJmT4uFSaD8NChSCt2kOFSqwjxqJypOVNJXMOimqwS
 Ud+hGXr3EaENS48iLLAKXWACZqCMyQ5EvGKhXaNI3XawmfwXTg0CTYzqBQ3QCCJ0aXAp
 LB0lNJfTY16RSi0WG+ms/A2l9IUtdF4ZshIWjRWjACjjowhogtWffLvhIKR0OM6FgBYc
 hJ8qVvMNhHKwVJM4M75JUdnLqXib4RWSHowhOawjaWHxI+q5LfeVGjb5N11NUB2qIGtV
 F5mw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUTkJWLacoXgMoyuo233R8UIIrm2IoN4P+ID3FqOtLK8ytgF8vAQx32Khi5rtunO0hnklFu0OK0p/w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwlXOLVOjAvgr4IEjbw61GSVtGYROkTYXFPUPLuVTc+71Wr59U8
 QpoSI3vBVUJPWkzdu8BAmBb2AYmLRBc0PkFBhLFPmTcjDeX0PLRitJ1mOO+vU5DPReFglqGl5KH
 K0PM2
X-Gm-Gg: ASbGnct66KbQ4k8dG0xWzVpJUJ4HpYy4ZohjjQtIv2+hGrbYdtfuzNWOInveHxKww0y
 9FlVqMQzjU63ADuQuwkDhBTx9II5sXmPOdEUVe+rl6NtVylTLV5vVh34ChOuLbosH9TvzXhfegh
 mit3zl2Ya/d6WoCOR67XRCAWFrl5tb2Sq/H2DeLy3rBsWcfVCD+r4aqLDOVohXKVOXEgJ9heEfG
 2dzAVFe/49CeCA3CJMLjh/ofbAnwbEby503GAfCo3czv3453IAPBeKaG02IeUtomLZyKjibMoFW
 B9yr4KMv7WvYnmLAfHtG1P/j5nJL9Eusl6YLcPCyaCrsCzJD1PeLKT2WKLJvdNCQkKazt+MkEd/
 u0MsQF+wakr7gDxygBLY=
X-Google-Smtp-Source: AGHT+IE9tVhp9pYU3kKlCGSD/ePtLx+OGGlSGZWTsqaYb2wqb3m9lw5AJ1My9WMgC8rbElFgaaAwGw==
X-Received: by 2002:a17:907:7f86:b0:ac1:791c:153a with SMTP id
 a640c23a62f3a-ac3315652femr444188066b.27.1741996464019; 
 Fri, 14 Mar 2025 16:54:24 -0700 (PDT)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com.
 [209.85.218.49]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac314a489c9sm288840866b.152.2025.03.14.16.54.23
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Mar 2025 16:54:23 -0700 (PDT)
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-ac2aeada833so506463166b.0
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Mar 2025 16:54:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCX/Nt7Mxa8X9/C18SkNX5ufMFNHGvnH2vaKAUjoVe28CJLafyYE1K/8JtRlnOGGBr5DCR1QBsaR9xk=@lists.freedesktop.org
X-Received: by 2002:a05:6512:280e:b0:548:878b:ccb3 with SMTP id
 2adb3069b0e04-549c3fd2760mr1539605e87.25.1741996118140; Fri, 14 Mar 2025
 16:48:38 -0700 (PDT)
MIME-Version: 1.0
References: <20250314224202.13128-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20250314224202.13128-2-wsa+renesas@sang-engineering.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 14 Mar 2025 16:48:25 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VBHfg+Fgp27ieYVhd0U8kDp2E0ATW+=ueM8EBNOYMoSg@mail.gmail.com>
X-Gm-Features: AQ5f1JrWHr8izY-VcdkQhYodhw89fnaCBiirsjP6pzXxlvUX4vLxnubKrDPCEpA
Message-ID: <CAD=FV=VBHfg+Fgp27ieYVhd0U8kDp2E0ATW+=ueM8EBNOYMoSg@mail.gmail.com>
Subject: Re: [PATCH v2] drm/bridge: ti-sn65dsi86: Check bridge connection
 failure
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, 
 Phong Hoang <phong.hoang.wz@renesas.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org
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

Hi,

On Fri, Mar 14, 2025 at 3:42=E2=80=AFPM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> From: Phong Hoang <phong.hoang.wz@renesas.com>
>
> Add a check to the very first register access function when attaching a
> bridge device, so we can bail out if I2C communication does not work.
>
> Signed-off-by: Phong Hoang <phong.hoang.wz@renesas.com>
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>
> Build tested only!
>
> Changes since v1:
>
> * rebased to v6.14-rc6
> * add Laurent's tag (Thanks!)
> * update patch description according to Tomi's suggestions (Thanks!)
>
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/brid=
ge/ti-sn65dsi86.c
> index e4d9006b59f1..59508e82a991 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -696,6 +696,7 @@ static struct ti_sn65dsi86 *bridge_to_ti_sn65dsi86(st=
ruct drm_bridge *bridge)
>
>  static int ti_sn_attach_host(struct auxiliary_device *adev, struct ti_sn=
65dsi86 *pdata)
>  {
> +       int ret;
>         int val;
>         struct mipi_dsi_host *host;
>         struct mipi_dsi_device *dsi;
> @@ -720,8 +721,11 @@ static int ti_sn_attach_host(struct auxiliary_device=
 *adev, struct ti_sn65dsi86
>
>         /* check if continuous dsi clock is required or not */
>         pm_runtime_get_sync(dev);
> -       regmap_read(pdata->regmap, SN_DPPLL_SRC_REG, &val);
> +       ret =3D regmap_read(pdata->regmap, SN_DPPLL_SRC_REG, &val);
>         pm_runtime_put_autosuspend(dev);
> +       if (ret)
> +               return ret;

Seems reasonable to me. I would probably put an error message in this
case, though? I don't think regmap_read() necessarily prints an error
so it would just be a mysterious failure for why things didn't probe,
right?

This also only solves the problems for one of the 4 devices in this
file. I think the GPIO device, PWM device, and DP-AUX device will
still confusingly stick around. It's probably better to add a bogus
regmap read in ti_sn65dsi86_probe().

-Doug
