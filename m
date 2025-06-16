Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2B32ADB6AB
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jun 2025 18:24:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A43010E3E2;
	Mon, 16 Jun 2025 16:24:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="elIoLfni";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 991F410E3E2
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jun 2025 16:24:28 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id
 d9443c01a7336-23636167afeso45627585ad.3
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jun 2025 09:24:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1750091068; x=1750695868;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Jn+pl8Ukndl7fV/3rtDt80K83DzVb4ofgvMyTIgGDxE=;
 b=elIoLfnioEdfqIuGNvCh/FgqqI9nEFHrOQNoBinohD8m26hB+Wzk2utnoa9GPeK/ew
 whBpMX6BCxpqobiJDBxZmn0U2J1nBUnbE8XMurYvqImIdvCBsEHSInVQ+M3eulM7OOys
 AvWpN6v/Ejkz7sFYCE5aEgqolVsmW1/T3Or6Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750091068; x=1750695868;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Jn+pl8Ukndl7fV/3rtDt80K83DzVb4ofgvMyTIgGDxE=;
 b=npdTvNurI6FMJOjnS3/kSqRleHlIBZwQJeeMdTRCZsCZeb0aak50fSUI7G8Yn2HtPo
 flgv945SjQyAWYikCLmRQiK/pT9ovM9fqTjht2VuEfyab77iWTiXDXPlezhbXszvP1E6
 WFAbFY7dCMlycozMTUvXlyyVgexARhNb69cppRMmDc05H1uS5RDtcj7jNKlNEn3ePsFH
 NSHdlbMul9XY9ps+v1Xgpx3VKJ5bAWpUB5ByEUBloAhl49wrfPYTfyBlpuFwZJc6qeBR
 OAxEIO7iO/qNJZhDgOzU/9Ay3UOYGia3vOHHAo+zJFbIGXapSdgb75KGR690Bmz88Qu6
 59hQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUSFIOqnWQaJNoJR9PHZNMcoKCEPJA4m6TIRimNR7RGHEb7rYEz1fWUSXIGGT9/uAizuZmRNoVMlNE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwOX2qZnHtq6cNQmEwBrDZZeJJKRVPlSM8zym7Aj+v35gd3pOG8
 5ehGU0/5vOfZ2iLf85J440bHMfHCPotseaJvKk2JSnozprfZG8dO95slK9f/4PKnkSQtrpYXUyZ
 dp+I=
X-Gm-Gg: ASbGncvYnjmMpMWXGG05Hkj50Ubb6x5PeBTcDM0eYdgLkvEXS1TqIHpob530GEDMx5C
 0xTZ+iQ0X+I+AacO+RXvjiQ8zrbXepLcgAMnbqQaNhww/LS3Ul3E7iKGpq4boFe9egNuHWDbCaK
 junPMMHZtsv/2KQh7IsD2VAIVt98RgSulu4eBDoMOqnYmQpTlV7CdImgRGLc5EK+jV1tZ2eTjou
 ZoNtEsbs/p/FwUwZuoO+ZDmgaR4KQ0Ai/y6iIjpE19WEJa2syWklgpo/Z4/zEkDXTqhxRYuYism
 ejyEBGo9wWdzi+C9YcQ1WAS78c2d57JjhMWl5gJ0Jy2+BOXYOFya1vjCErESasRUcagrc3tpF19
 Bh08eUHaXy/A0l13w9IeM0pOew0GqaA==
X-Google-Smtp-Source: AGHT+IHaoCwQ8SIijSPAwWo9MUWHP++J70q1HEN6iohK2KuS+/JCcXlbm8HT0LbCnH9v1g4cZIOrGQ==
X-Received: by 2002:a17:902:cf10:b0:235:7c6:ebdb with SMTP id
 d9443c01a7336-2366b316d34mr172945595ad.10.1750091068198; 
 Mon, 16 Jun 2025 09:24:28 -0700 (PDT)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com.
 [209.85.214.178]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2365deaa9b8sm63157305ad.165.2025.06.16.09.24.27
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Jun 2025 09:24:28 -0700 (PDT)
Received: by mail-pl1-f178.google.com with SMTP id
 d9443c01a7336-236470b2dceso39744195ad.0
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jun 2025 09:24:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCV9qK3iwfrLhtG/53tgm6CgQgmC28IThC1nQTUL11BIN3h2nu6m52fLvVd2f2xosvPRWRFlxcmu+0I=@lists.freedesktop.org
X-Received: by 2002:a17:90b:35ce:b0:311:d670:a10d with SMTP id
 98e67ed59e1d1-313f1d96b23mr13483334a91.26.1750091067151; Mon, 16 Jun 2025
 09:24:27 -0700 (PDT)
MIME-Version: 1.0
References: <20250616093240.499094-1-j-choudhary@ti.com>
In-Reply-To: <20250616093240.499094-1-j-choudhary@ti.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 16 Jun 2025 09:24:15 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Wb=bWXDfCyF8XhJ93dBRU2rUKM+B0X5uYh39FHRgT1Ww@mail.gmail.com>
X-Gm-Features: AX0GCFvx1jdSZ7AywPO9rUfFoTu7hX2oWiRuFWLsC1T8ClrkXmqFBGVmsbCBYTw
Message-ID: <CAD=FV=Wb=bWXDfCyF8XhJ93dBRU2rUKM+B0X5uYh39FHRgT1Ww@mail.gmail.com>
Subject: Re: [PATCH v5] drm/bridge: ti-sn65dsi86: Add HPD for DisplayPort
 connector type
To: Jayesh Choudhary <j-choudhary@ti.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org, 
 Laurent.pinchart@ideasonboard.com, dri-devel@lists.freedesktop.org, 
 tomi.valkeinen@ideasonboard.com, max.krummenacher@toradex.com, 
 ernestvanhoecke@gmail.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 airlied@gmail.com, simona@ffwll.ch, kieran.bingham+renesas@ideasonboard.com, 
 linux-kernel@vger.kernel.org, max.oss.09@gmail.com, devarsht@ti.com, 
 geert@linux-m68k.org
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

On Mon, Jun 16, 2025 at 2:32=E2=80=AFAM Jayesh Choudhary <j-choudhary@ti.co=
m> wrote:
>
> @@ -1220,6 +1231,27 @@ static void ti_sn65dsi86_debugfs_init(struct drm_b=
ridge *bridge, struct dentry *
>         debugfs_create_file("status", 0600, debugfs, pdata, &status_fops)=
;
>  }
>
> +static void ti_sn_bridge_hpd_enable(struct drm_bridge *bridge)
> +{
> +       struct ti_sn65dsi86 *pdata =3D bridge_to_ti_sn65dsi86(bridge);
> +
> +       /*
> +        * Device needs to be powered on before reading the HPD state
> +        * for reliable hpd detection in ti_sn_bridge_detect() due to
> +        * the high debounce time.
> +        */
> +
> +       pm_runtime_get_sync(pdata->dev);
> +}
> +
> +static void ti_sn_bridge_hpd_disable(struct drm_bridge *bridge)
> +{
> +       struct ti_sn65dsi86 *pdata =3D bridge_to_ti_sn65dsi86(bridge);
> +
> +       pm_runtime_mark_last_busy(pdata->dev);
> +       pm_runtime_put_autosuspend(pdata->dev);

nit: you don't need the pm_runtime_mark_last_busy() here, do you? Just
call pm_runtime_put_autosuspend().

Aside from the nit, this looks reasonable to me now.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
