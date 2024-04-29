Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D668E8B5EC8
	for <lists+dri-devel@lfdr.de>; Mon, 29 Apr 2024 18:18:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0655210E114;
	Mon, 29 Apr 2024 16:18:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Kb2qNDKL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E73310E114;
 Mon, 29 Apr 2024 16:18:53 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id
 d9443c01a7336-1e4c4fb6af3so31593905ad.0; 
 Mon, 29 Apr 2024 09:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714407533; x=1715012333; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jbq+qEr2TR9K519cRuEv707kWrofqjZGYqtbIYY/ePE=;
 b=Kb2qNDKL4y16CV5GlGqdK99nL0AATvNDXmUtSsHkSjMU6nnuGdLRF3wfrDaB8QsZSq
 CsV++JI2yMkptLQQZQZYx7ZtU8hHkDiRZYbMkjZeQzGbCyMv5gUueB7Hy0JUhERv3CjA
 qLAWaHSUl2uPulPtH80bck5QD5SZp4SPy+ssSU58Tjt4tU1e2kaOmP2xinreAJ/7pgk6
 NC5Lckdq60s8H1GXh7qVW/Wtco0xk2umyJm2Uweip1I2FrEBmRD9fCaxFOF77lhDfDHs
 DQczWPdmga6zrK5of1bjsjxME1K9DJL8QSVZXc9RMp++8+24Ev5AD5nV5dNiSWKeYsi7
 KZJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714407533; x=1715012333;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jbq+qEr2TR9K519cRuEv707kWrofqjZGYqtbIYY/ePE=;
 b=HDfHmevt229Z39wiSA2ma+zPgrUBsmBJkrcFWBVa91/11EeUbjEqqc4UDyVnzwPkS/
 tNKenqd8OLp5K6d/OIeK5nfoYIXZQF0YUVNjUE4id//VFMrQPxaUCIZUKUlIXxl7sjb/
 t2QUD0bp5p3sce/H8C/0kiRsRBlC/mf2NwX/12fK8EEMmynB7nHsYItsupK+Zh/lyOnb
 NY3D9DaZi9cLDJyGplCf3UiGxYiEESYEUAyOzkgAB3EZrqMmcwO1+5xBRfupBo6KkO5i
 IQSb6YtQso4oYlcHJHm2HDog5cOnGOlT/1cYl5seX0tVOCZsVjL57laf1VeMzpBbNILM
 wICw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV9qn1vAVbTBVABQMJ4cLHZ/lcg6M9Z157wAivsBKq+fNagbnQI7SxQaIl0DQI3hcQQ5u68FbFRDI5b7kzWaIfw2kK7uScu0JlJlGSqnOw+Gh0Trf5vvE3g7XIOWzTr9yZdRz+hfCLytmzO9tE8GA==
X-Gm-Message-State: AOJu0YzpG8MBSwGxhuKnbAkM1yzuVX+ErZIrz7ean1jzj/0II6lK16E2
 MFZRjxYSo8bC2pov+2MsoJqNMs3fXqQo6O26zwxQsqcUVduWaVxKVct5iSB9JDnCtX/mIdKtCsl
 Bh99XAB1yAP00cJ6d02UKsguCn7p4wg==
X-Google-Smtp-Source: AGHT+IEf/J7+wLIAUMjrhtDR0os0Zz2NgPOtqOal69+ua+96Gx2aPoVGTOLn2bIe1budyCyht7VDIGVIOEAiTKStuWQ=
X-Received: by 2002:a17:903:120e:b0:1eb:7855:43d5 with SMTP id
 l14-20020a170903120e00b001eb785543d5mr149588plh.30.1714407532804; Mon, 29 Apr
 2024 09:18:52 -0700 (PDT)
MIME-Version: 1.0
References: <20240309014732.722139-1-tjakobi@math.uni-bielefeld.de>
In-Reply-To: <20240309014732.722139-1-tjakobi@math.uni-bielefeld.de>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 29 Apr 2024 12:18:41 -0400
Message-ID: <CADnq5_PeBwXpxnKgW0YmcdeMDMZ3maEZmN6h7ZgHKDji3pyjwQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Add MSF panel to DPCD 0x317 patch list
To: tjakobi@math.uni-bielefeld.de
Cc: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
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

Applied.  Thanks!

On Fri, Mar 8, 2024 at 8:58=E2=80=AFPM <tjakobi@math.uni-bielefeld.de> wrot=
e:
>
> From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
>
> This 8.4 inch panel is integrated in the Ayaneo Kun handheld
> device. The panel resolution is 2560=C3=971600, i.e. it has
> portrait dimensions.
>
> Decoding the EDID shows:
> Manufacturer: MSF
> Model: 4099
> Display Product Name: 'TV080WUM-NL0 '
>
> Judging from the product name this might be a clone of a
> BOE panel, but with larger dimensions.
>
> Panel frequently shows non-functional backlight control. Adding
> some debug prints to update_connector_ext_caps() shows that
> something the OLED bit of ext_caps is set, and then the driver
> assumes that backlight is controlled via AUX.
>
> Forcing backlight control to PWM via amdgpu.backlight=3D0 restores
> backlight operation.
>
> Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c b/=
drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> index 7a09a72e182f..5a017ba94e3c 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> @@ -68,6 +68,7 @@ static void apply_edid_quirks(struct edid *edid, struct=
 dc_edid_caps *edid_caps)
>         case drm_edid_encode_panel_id('A', 'U', 'O', 0xE69B):
>         case drm_edid_encode_panel_id('B', 'O', 'E', 0x092A):
>         case drm_edid_encode_panel_id('L', 'G', 'D', 0x06D1):
> +       case drm_edid_encode_panel_id('M', 'S', 'F', 0x1003):
>                 DRM_DEBUG_DRIVER("Clearing DPCD 0x317 on monitor with pan=
el id %X\n", panel_id);
>                 edid_caps->panel_patch.remove_sink_ext_caps =3D true;
>                 break;
> --
> 2.43.0
>
