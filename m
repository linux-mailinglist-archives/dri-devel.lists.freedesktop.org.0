Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDBC8AEA0E4
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jun 2025 16:40:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0DF110E87E;
	Thu, 26 Jun 2025 14:40:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="Wa74ePHS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
 [209.85.210.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 464CF10E87E
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jun 2025 14:40:03 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id
 d2e1a72fcca58-748e378ba4fso1485897b3a.1
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jun 2025 07:40:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1750948798; x=1751553598;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0NbDqFXySj+gbUU6xSTy3Imp3ynt9ccm9VYTmcwbQNg=;
 b=Wa74ePHSoBSoEdea6cDID8Qu7rn78wPIMis7PXThKJKRhQgUcd/JXDcrD37my6NKt1
 19AtcSj9kdDta1zs2+v8kHwhJXVLmF5c/Pmg+3k8/vZ5Lr5ISN611T+Kxfq3xm76Wdyi
 xidcOPUOIOJXn9Thx2RxA2eSWZtzQe+HefCCE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750948798; x=1751553598;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0NbDqFXySj+gbUU6xSTy3Imp3ynt9ccm9VYTmcwbQNg=;
 b=rl/hA7MkXG6KJyPGCO0hrU1Yk1ME6q/wea03aEhXwbMIoe/hpb3dubEjYKScFwJ6ah
 Y4z+I0z7I3dKTmGrBWIkaotzKxON8EbjOEmDKyP6kQhKjbiImuAVZvzFd76Neu+dAHo5
 OoVOPrgDLkSwd4JqaP8hTILGmQiXcarzcX9m35yjoTtnh2QjbZGOrNo63dgL16FIVxyW
 5O23OsA7UKvjwK8uJeA1FanNxQ6Fy3JIwXneMpw5XSs5ov91q3zSp7m8pnw6NpnGvlPe
 JOJTBmQ3U6scEZU4kyz6AkN3f1pGiAAKeY2t7BkhsOXeiIChOe/HZEJuyaZsi2rJVd+j
 HhSA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXMUd1qYKuUfBeoTSQXGz/53xZLzzJz/MHBZ38x6MTil0t4QV1MbqZ4E8n+JkQr2XZenLKs4HQhcBM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxOf37Sd+B/yw7n1wbSJF+M7PXb5xNaIIyTwUx5hTX0ggnEnOKy
 N5MMt0eTkCixTKJWBDnI3LiKnvalnlTzwxepl45E576vlxzhIGgDRJSJr9EOqMLoeCVTdHjbeJL
 FEbpQL6p7
X-Gm-Gg: ASbGncuvZG9nvEVM88gdP5hChr80uZaYq3XFNKGEo34hIl8mpdL9TbRE2ilOkQDOiU4
 pn7IByPDCPpioMdwpZfNYy9oZ6sCd3g7o9HI1NBld/+2qPHydGqWBM4Zc03ArKX5cIc4YFJnLSO
 goRT75HkZ64IQgUTpLY5T0yceryi1VG1GILkqqZxvgr9qWo4x8/9Iuse1L9aNc8u1mC4GYOZcf3
 ZdBcEWVBitJT4Ec8zPYpWof2xZzPXC+QW9CrLO7tbtqN9VXIP+c2jUW6BAXeu/b0nXtHCG5w0tx
 UAtX7ydoisqQMcJHLNhU/OJfI9dTCk+39q6/FX3+lf7w9MQpw15/mr4CawsGrcPVrzKc3JL319U
 ILKyQA1ir8+6G4Nz18uA5H8kJTGuUSWLWLBudWTA4
X-Google-Smtp-Source: AGHT+IHHQ06FjQuqagn/u46L1vi5qIN8CqaLvSpErzcT1nblsCs2N+ebabrnW8W6pSupHQ08AmWNEA==
X-Received: by 2002:a05:6a00:240e:b0:740:67aa:94ab with SMTP id
 d2e1a72fcca58-74af43dffa5mr189573b3a.0.1750948797890; 
 Thu, 26 Jun 2025 07:39:57 -0700 (PDT)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com.
 [209.85.215.170]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-749c883889esm7597633b3a.101.2025.06.26.07.39.55
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Jun 2025 07:39:56 -0700 (PDT)
Received: by mail-pg1-f170.google.com with SMTP id
 41be03b00d2f7-b3182c6d03bso1240791a12.0
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jun 2025 07:39:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUiVVVvWFcfi4eTT5SxVK/H5ECM50qdvxpegI3zABpR6EHyUniUxCgScMxCSEyzADOBe8YxI/FGD2I=@lists.freedesktop.org
X-Received: by 2002:a17:90b:5212:b0:312:db8f:9a09 with SMTP id
 98e67ed59e1d1-315f25e698bmr11249585a91.14.1750948795378; Thu, 26 Jun 2025
 07:39:55 -0700 (PDT)
MIME-Version: 1.0
References: <20250626122854.193239-1-yelangyan@huaqin.corp-partner.google.com>
In-Reply-To: <20250626122854.193239-1-yelangyan@huaqin.corp-partner.google.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 26 Jun 2025 07:39:43 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XHVKvsJwHzuL+7bv70LvcC2Y-y1C3_aZ7rsAki3cJOGg@mail.gmail.com>
X-Gm-Features: Ac12FXxkqZPpQXyw5nU2lsKO8nED1gWJWX73WnTNQEt8Js0cUhmqSOeE9SC36iU
Message-ID: <CAD=FV=XHVKvsJwHzuL+7bv70LvcC2Y-y1C3_aZ7rsAki3cJOGg@mail.gmail.com>
Subject: Re: [PATCH] drm/panel-edp: Add CMN N116BCJ-EAK
To: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
Cc: neil.armstrong@linaro.org, jessica.zhang@oss.qualcomm.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org, 
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

Hi,

On Thu, Jun 26, 2025 at 5:29=E2=80=AFAM Langyan Ye
<yelangyan@huaqin.corp-partner.google.com> wrote:
>
> Add support for the CMN N116BCJ-EAK, pleace the EDID here for
> subsequent reference.
>
> 00 ff ff ff ff ff ff 00 0d ae 63 11 00 00 00 00
> 19 22 01 04 95 1a 0e 78 02 67 75 98 59 53 90 27
> 1c 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
> 01 01 01 01 01 01 da 1d 56 e2 50 00 20 30 30 20
> a6 00 00 90 10 00 00 18 00 00 00 fe 00 4e 31 31
> 36 42 43 4a 2d 45 41 4b 0a 20 00 00 00 fe 00 43
> 4d 4e 0a 20 20 20 20 20 20 20 20 20 00 00 00 fe
> 00 4e 31 31 36 42 43 4a 2d 45 41 4b 0a 20 00 80
>
> Signed-off-by: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/pa=
nel-edp.c
> index 6c45c9e879ec..3796c41629cc 100644
> --- a/drivers/gpu/drm/panel/panel-edp.c
> +++ b/drivers/gpu/drm/panel/panel-edp.c
> @@ -1967,6 +1967,7 @@ static const struct edp_panel_entry edp_panels[] =
=3D {
>         EDP_PANEL_ENTRY('C', 'M', 'N', 0x115e, &delay_200_500_e80_d50, "N=
116BCA-EA1"),
>         EDP_PANEL_ENTRY('C', 'M', 'N', 0x1160, &delay_200_500_e80_d50, "N=
116BCJ-EAK"),
>         EDP_PANEL_ENTRY('C', 'M', 'N', 0x1161, &delay_200_500_e80, "N116B=
CP-EA2"),
> +       EDP_PANEL_ENTRY('C', 'M', 'N', 0x1163, &delay_200_500_e80_d50, "N=
116BCJ-EAK"),

Reviewed-by: Douglas Anderson <dianders@chromium.org>

...and pushed to drm-misc-next:

[1/1] drm/panel-edp: Add CMN N116BCJ-EAK
      commit: 34a3554a1c7059b861db2aafb052a256f38813d6
