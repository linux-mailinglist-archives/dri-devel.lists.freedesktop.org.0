Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81654A1C8B3
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jan 2025 15:52:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B3CE10E382;
	Sun, 26 Jan 2025 14:52:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com
 [209.85.160.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50D3610E00F
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jan 2025 20:59:29 +0000 (UTC)
Received: by mail-oa1-f50.google.com with SMTP id
 586e51a60fabf-29ff039dab2so1380960fac.3
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jan 2025 12:59:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737752368; x=1738357168;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sGynNYUXBjSGx9LjRI5JCt5yNZfImzBg16h6aMP3OUk=;
 b=l//CNs2ao4DFPSnrnwAxU3MT9aKeu1819eIbJkUyNMOGZ25rXVyhw7n33U7lrkaWLc
 gLEexes6MB1rFAcgHJTWfUcHj8o9W+YoGdk3NUxRkhteQ/G/CaV2vkNvoNQsudtOSmdc
 mNpa4aSDicgLIw67nuyv+BJYDY0q34KPFWj/V2YHYTydsz1XgYJ9pTfbaDtqY9MfkGtO
 ghKVZZZ6b9Ah2aIaPKT8dhwAaoCSIwzrekdLMl50h3XNyIK6aNgrhcLqj+PWmixcCYi2
 SoR00KR5a7fDv5B/QCiN5ltb7Am+cABYOSxO42cK2FVGJtp4FfIYgflMtLzBOCq+hhbI
 omQw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWxTSOgZVcdcQKTmpoWxtHrz3UVa+7oS3vgaJH8OSwY55SOSvdms/eIcpknRb0nENIhNIAJu458diU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxqDWdj8WWx8DXlfuSFDlPVDyWPSJLV2C6bGshkwDAHkx9SiKKj
 AdNBtEotoPU7R6zxGv/3d3Z1o4HKD/PgKPb77KJiDAyw6Uq2MDwj
X-Gm-Gg: ASbGnctV9iOEVd9FOJFSfJDQwkKf8prP/kasG/93iveQZ1AObQ/mqB9QNZczPuYeHpm
 SMO8/t3isnPIdIN/ppozYBScV8Aw06cWYXSkd0JTjVricsrRBOPecwcsDTMsXUdqKMycJjlu3Yx
 5SumxpAVy8A5vlFOmZgUoJYd8qgaWB3fq1UTMM78wUxJlzVyDc2Ob7nU08FudoUHl+aheWnywM/
 b+vTycHTdDM+kzVhJzjSydlpTwdzYHJYKrpPvLUpZZvNKcIh0dhZj3CBuIk4P/0T9YQzd7YvFFk
 mS1dqeLZ3bJjwB/h
X-Google-Smtp-Source: AGHT+IGfYMEMfDkDNmVwvMwpQfUf0v2+EYeg1cxWXv724j4HPmn0llaYek4hpGw30T3a4sv6euIvLw==
X-Received: by 2002:a05:6870:4f0b:b0:29e:37bb:c0e0 with SMTP id
 586e51a60fabf-2b1c0b02786mr17167949fac.23.1737752368446; 
 Fri, 24 Jan 2025 12:59:28 -0800 (PST)
Received: from muster.uejji.net ([47.188.205.107])
 by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-2b28f407f42sm765254fac.31.2025.01.24.12.59.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 12:59:27 -0800 (PST)
From: John Edwards <uejji@uejji.net>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Hans de Goede <hdegoede@redhat.com>
Cc: John Edwards <uejji@uejji.net>, Andrew Wyatt <fewtarius@steamfork.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/5] drm: panel-orientation-quirks: Add quirk for
 OneXPlayer Mini (Intel) From: Andrew Wyatt <fewtarius@steamfork.org>
Date: Fri, 24 Jan 2025 20:58:55 +0000
Message-ID: <20250124205857.57079-2-uejji@uejji.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250124204648.56989-12-uejji@uejji.net>
References: 
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 26 Jan 2025 14:52:19 +0000
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

My deepest apologies.  There was a serious formatting error in this email
that was discovered too late.  I have resubmitted this.

John Edwards


On Fri, Jan 24, 2025 at 2:49 PM John Edwards <uejji@uejji.net> wrote:
>
> The Intel model of the OneXPlayer Mini uses a 1200x1920 portrait LCD panel.
> The DMI strings are the same as the OneXPlayer, which already has a DMI
> quirk, but the panel is different.
>
> Add a DMI match to correctly rotate this panel.
>
> Signed-off-by: Andrew Wyatt <fewtarius@steamfork.org>
> Co-developed-by: John Edwards <uejji@uejji.net>
> Signed-off-by: John Edwards <uejji@uejji.net>
> Tested-by: João Pedro Kurtz <joexkurtz@gmail.com>
> ---
>  drivers/gpu/drm/drm_panel_orientation_quirks.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_panel_orientation_quirks.c b/drivers/gpu/drm/drm_panel_orientation_quirks.c
> index e6148cc31..88aa57c15 100644
> --- a/drivers/gpu/drm/drm_panel_orientation_quirks.c
> +++ b/drivers/gpu/drm/drm_panel_orientation_quirks.c
> @@ -129,6 +129,12 @@ static const struct drm_dmi_panel_orientation_data lcd1080x1920_rightside_up = {
>         .orientation = DRM_MODE_PANEL_ORIENTATION_RIGHT_UP,
>  };
>
> +static const struct drm_dmi_panel_orientation_data lcd1200x1920_leftside_up = {
> +       .width = 1200,
> +       .height = 1920,
> +       .orientation = DRM_MODE_PANEL_ORIENTATION_LEFT_UP,
> +};
> +
>  static const struct drm_dmi_panel_orientation_data lcd1200x1920_rightside_up = {
>         .width = 1200,
>         .height = 1920,
> @@ -473,6 +479,12 @@ static const struct dmi_system_id orientation_data[] = {
>                   DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "ONE XPLAYER"),
>                 },
>                 .driver_data = (void *)&lcd1600x2560_leftside_up,
> +       }, {    /* OneXPlayer Mini (Intel) */
> +               .matches = {
> +                 DMI_EXACT_MATCH(DMI_SYS_VENDOR, "ONE-NETBOOK TECHNOLOGY CO., LTD."),
> +                 DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "ONE XPLAYER"),
> +               },
> +               .driver_data = (void *)&lcd1200x1920_leftside_up,
>         }, {    /* OrangePi Neo */
>                 .matches = {
>                   DMI_EXACT_MATCH(DMI_SYS_VENDOR, "OrangePi"),
> --
> 2.43.0
>
