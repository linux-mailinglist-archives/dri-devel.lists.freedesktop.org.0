Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF1CA962DB4
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 18:32:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EA3A10E599;
	Wed, 28 Aug 2024 16:32:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="QUnYcySq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com
 [209.85.219.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD78D10E597
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2024 16:32:24 +0000 (UTC)
Received: by mail-qv1-f47.google.com with SMTP id
 6a1803df08f44-6bf7f4a133aso37102956d6.2
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2024 09:32:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1724862741; x=1725467541;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qBATEptSZDUUWTJwD0sPaxEB2eHiFYhFMYSfyB0C/nI=;
 b=QUnYcySq/VjMRuHjLTpR5K716/X7MSxEvBuAov2oeyqM9chzhxNvVZrEL9bVCowOjz
 ywhZ8DW8N3xulEuUwPtx8uLRDPhgpkl8pZ1SRkzKUUxIXkeoNvNFk92xxvcvIYGOmCE1
 JlR7XFx6PdpdEaslVdhtaPI0/TbaG6dEwz2N4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724862741; x=1725467541;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qBATEptSZDUUWTJwD0sPaxEB2eHiFYhFMYSfyB0C/nI=;
 b=GB9IhZXUM7fI9rLCWJH6jlW49X0Jvl0LM2saiVIm+/SBbQE6b4+DJvvQXaNPw8dBLe
 YmPybHSBcPcpA3NbMBOzI/QS2kzmUgtW5jejr3XpRUjDJZLof3ynw8kIyZmQIAhrc9wQ
 NqLwFdpdd2whg/Yd8I7hXdkVrrvKaP855bInvNbCUvQLNwaT1Yyac+7ONtU6jDfP5Qh1
 vBaJmnfvIHWmbEX0vsSyeUfcZ9LUBjpMHU/6twJb+Cv4kJU/1G6laHVcCKWaORTTJqCY
 9h30kSspmH3ZSs1Eee0ucQJDtTnFeCPA8Qjh1H4k1cbIp/sA4TaL06EwqjynM8D7XGSB
 nnPQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUruxOZCro4kkNrOw6adI+7r9JLYTEdeOGb4PcGgGnLAQBsHnIwgblaYJ2JihnEFgqSllc4q6Kvma8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwuKug9SQjxxsmQjPBUKCKU0zuIy693LsZyt5saOW9WDD6wgC2D
 YhV2tjSury8cpoeO76zmyIuFna+Vy+cmjzHIBzhYaAJXRoqtSPFlAw0o/0+xxXLzhS6IxWs/B+Q
 =
X-Google-Smtp-Source: AGHT+IEaBoiBeh5CC+nz/m45FFX+By/ZP13V9CyMcxyTrn9MarXJWxMWYcqKjt6MGvjzel/KONYZNw==
X-Received: by 2002:a05:6214:3114:b0:6bb:b478:a614 with SMTP id
 6a1803df08f44-6c33e630dbamr361736d6.10.1724862741220; 
 Wed, 28 Aug 2024 09:32:21 -0700 (PDT)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com.
 [209.85.219.44]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6c162db1e9asm66603256d6.80.2024.08.28.09.32.20
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Aug 2024 09:32:20 -0700 (PDT)
Received: by mail-qv1-f44.google.com with SMTP id
 6a1803df08f44-6c32e1c263aso11540916d6.3
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2024 09:32:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXbgEz+7wGSgyLGEEJHYy+v1skiompXO2k8R3gzcQOSGBQGnrrWI+qgoUHQx4ThMNUGzeASYC2gUV8=@lists.freedesktop.org
X-Received: by 2002:a05:6214:5b0a:b0:6c1:5544:47a1 with SMTP id
 6a1803df08f44-6c33e630dafmr301836d6.7.1724862739672; Wed, 28 Aug 2024
 09:32:19 -0700 (PDT)
MIME-Version: 1.0
References: <20240828-topic-sm8x50-upstream-vtdr6130-multi-v1-0-0cae20d4c55d@linaro.org>
 <20240828-topic-sm8x50-upstream-vtdr6130-multi-v1-1-0cae20d4c55d@linaro.org>
In-Reply-To: <20240828-topic-sm8x50-upstream-vtdr6130-multi-v1-1-0cae20d4c55d@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 28 Aug 2024 09:32:05 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Wke51vmTy7zZ+RV7oDoCGSeszOarhLGapdDrkByNyi-g@mail.gmail.com>
Message-ID: <CAD=FV=Wke51vmTy7zZ+RV7oDoCGSeszOarhLGapdDrkByNyi-g@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/panel: visionox-vtdr6130: switch to mipi_dsi
 wrapped functions
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
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

On Wed, Aug 28, 2024 at 9:03=E2=80=AFAM Neil Armstrong
<neil.armstrong@linaro.org> wrote:
>
> Make usage of the new _multi() mipi_dsi functions instead of the
> deprecated macros, improving error handling and printing.
>
> bloat-o-meter gives a 12% gain on arm64:
> Function                                     old     new   delta
> visionox_vtdr6130_unprepare                  208     204      -4
> visionox_vtdr6130_prepare                   1192     896    -296
> Total: Before=3D2348, After=3D2048, chg -12.78%
>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  drivers/gpu/drm/panel/panel-visionox-vtdr6130.c | 186 +++++++++++-------=
------
>  1 file changed, 82 insertions(+), 104 deletions(-)
>
> diff --git a/drivers/gpu/drm/panel/panel-visionox-vtdr6130.c b/drivers/gp=
u/drm/panel/panel-visionox-vtdr6130.c
> index 540099253e1b..ebe92871dbb6 100644
> --- a/drivers/gpu/drm/panel/panel-visionox-vtdr6130.c
> +++ b/drivers/gpu/drm/panel/panel-visionox-vtdr6130.c
> @@ -40,120 +40,103 @@ static void visionox_vtdr6130_reset(struct visionox=
_vtdr6130 *ctx)
>  static int visionox_vtdr6130_on(struct visionox_vtdr6130 *ctx)
>  {
>         struct mipi_dsi_device *dsi =3D ctx->dsi;
> -       struct device *dev =3D &dsi->dev;
> -       int ret;
> +       struct mipi_dsi_multi_context dsi_ctx =3D { .dsi =3D dsi };
>
>         dsi->mode_flags |=3D MIPI_DSI_MODE_LPM;

This isn't something you introduced in your patch, but I wonder if we
should avoid setting the "MIPI_DSI_MODE_LPM" bit when the function
returns an error?

In any case:

Reviewed-by: Douglas Anderson <dianders@chromium.org>
