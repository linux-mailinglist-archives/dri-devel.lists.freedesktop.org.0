Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11EBEB15075
	for <lists+dri-devel@lfdr.de>; Tue, 29 Jul 2025 17:50:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B509A10E02A;
	Tue, 29 Jul 2025 15:50:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="kWk9jUPv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0584D10E02A
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jul 2025 15:50:19 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id
 d9443c01a7336-234f17910d8so51074795ad.3
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jul 2025 08:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1753804218; x=1754409018;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pRr//l+WljJZJqCKmuGr3DoCPPP+3a2R/rHAUaoNxRA=;
 b=kWk9jUPva9++0CxrkzcvIfZB0U8u5AJGMd4p8YsRVx3AnawjcOXdBimGRDTAO0Ss9k
 llOZt93TH5a6L/yJJNP+T9PzyKOu4+djPeThvOMu0i2KobXZOote9+YMrUaO1n8eXvxa
 UQkTljdwPoOgYr3VzjJPGFZ7B5rGA5Vc94DBg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753804218; x=1754409018;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pRr//l+WljJZJqCKmuGr3DoCPPP+3a2R/rHAUaoNxRA=;
 b=Py/pLKSy40LXiQsfjSSoGTNfr5Z5GZepQddYdnk+80WNUQDkaNDF3SkSLVt2qkmHQ/
 v94/vp++asZTv3prVcAz5AoeLfHq5r5jfuuoeur+FxJoXHXg6i6NcFQUZ5Cr8tNazIs6
 4NbYHAOBXo6aTOLSOM9xJpOWHdt8Mta2FBDJdfaBKVqsaA9HYQZJAOZlPh7qdWG9Pydz
 +Cl2htSt9aTi9pWjrrKQdFDlj9NRH25MVYmld+ONg7mSXZDqRj7tarqWPXmwvAQ4lJGd
 SO2hM2f1E5WCfeHHn7XWCq9aTB8f2wO6OE2KLMzSodANhPK+lXwTF7rdq0ChbV3SYvzR
 riVg==
X-Gm-Message-State: AOJu0YxDafCvHAAtcPgAxWgConFrT8IUhRDmG6ghpoWf6RtDy1YDJt89
 TDJ8DPIuU5enTdRVWd+/qMwJGlb8MZi79j+BhI6QYmZJz5ZqFW3uxsgg7GJC6Kpjs78fxCec2NM
 ah6g=
X-Gm-Gg: ASbGncsuWzxwYld/y1LPqSFcyWwQZ1VpKJi85nOk73vKV6JPycDaoFszCsSp+a+fZAN
 PHYGwyBP+Ydq8fvhc38VMzGjDpKCG195+2+eIrh/QI0wrvt/UvLsH1GNTcyNAK60a7+/kmd10nB
 QTO8Em+R/KGDEvU/BSwk1KZ0RmIpq7jxMiSjB6kucGxXLiVRkhuIrjM8URvcCilBCfVxMJ+xn4I
 AG8zcoXlx7cJN4B/qbnG7GK/QT3YXUxyRhszp6P2lYuvj5L7KHqQlziYqVbPzd8eOWF0O2oOJkC
 Z/YyF7Fzv9A3MmDjf1fGvpBFJkaZKkSPBp+KYTzT7P8DgNtLOW/YIlQjOcWl5jckIEo4o65uPRj
 1ns9N9yP62OTX/4mg9tYO0+hRbuecvAtYqlBnpPS00ylwHY7rzmG5Kk0IJpJLenHXAQ==
X-Google-Smtp-Source: AGHT+IFbhDhBnLDnMzGTbhUcH2AW112WJgJTYwBA5pjKq58P5AjjmzvF+DWUmh4FZhR+3ZxK06Dd3Q==
X-Received: by 2002:a17:902:eccf:b0:240:7f7d:2b74 with SMTP id
 d9443c01a7336-2407f7d2e69mr24646465ad.30.1753804212673; 
 Tue, 29 Jul 2025 08:50:12 -0700 (PDT)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com.
 [209.85.215.180]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23fbe512d29sm81896655ad.140.2025.07.29.08.50.10
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Jul 2025 08:50:11 -0700 (PDT)
Received: by mail-pg1-f180.google.com with SMTP id
 41be03b00d2f7-b34ab678931so4563233a12.0
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jul 2025 08:50:10 -0700 (PDT)
X-Received: by 2002:a17:90b:35c7:b0:311:eb85:96f0 with SMTP id
 98e67ed59e1d1-31e77a1b44bmr22317060a91.29.1753804209750; Tue, 29 Jul 2025
 08:50:09 -0700 (PDT)
MIME-Version: 1.0
References: <20250727165846.38186-1-alex.vinarskis@gmail.com>
 <20250727165846.38186-4-alex.vinarskis@gmail.com>
In-Reply-To: <20250727165846.38186-4-alex.vinarskis@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 29 Jul 2025 08:49:58 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Xd_xL=PYvVNqQWFZGmqN+Q=SvvaBTfbv9k+fDb8QwUtQ@mail.gmail.com>
X-Gm-Features: Ac12FXx7-_hf5KJUuN4rJ_U3AGgXay6N1FUZnlxj0Vi-OfESDXBTZN7_sEezRhc
Message-ID: <CAD=FV=Xd_xL=PYvVNqQWFZGmqN+Q=SvvaBTfbv9k+fDb8QwUtQ@mail.gmail.com>
Subject: Re: [PATCH v1 3/3] drm/panel-edp: Add BOE NV140WUM-N64
To: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
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

On Sun, Jul 27, 2025 at 9:58=E2=80=AFAM Aleksandrs Vinarskis
<alex.vinarskis@gmail.com> wrote:
>
> Timings taken from NV140WUM-N41. It is found in some arm64 laptops,
> eg. Asus Zenbook A14 UX3407QA.
>
> The raw edid of the panel is:
> 00 ff ff ff ff ff ff 00 09 e5 f6 0c 00 00 00 00
> 10 22 01 04 a5 1e 13 78 07 8e 95 a6 52 4c 9d 26
> 0f 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
> 01 01 01 01 01 01 5d 30 80 a0 70 b0 28 40 30 20
> 36 00 2e bc 10 00 00 1a 00 00 00 fd 00 28 3c 4a
> 4a 0f 01 0a 20 20 20 20 20 20 00 00 00 fe 00 3d
> 4c 33 30 20 20 20 20 20 20 20 20 ff 00 00 00 fc
> 00 4e 56 31 34 30 57 55 4d 2d 4e 36 34 0a 01 f8
>
> 70 20 79 02 00 21 00 1d c8 0b 5d 07 80 07 b0 04
> 88 66 ea 51 cc 74 9d 66 52 0f 02 35 54 40 5e 40
> 5e 00 44 12 78 22 00 14 7f 5c 02 85 7f 07 9f 00
> 2f 00 1f 00 af 04 27 00 02 00 05 00 2b 00 0c 27
> 00 28 3b 00 00 27 00 28 2f 00 00 2e 00 06 00 44
> 40 5e 40 5e 81 00 1e 72 1a 00 00 03 71 28 3c 00
> 00 60 ff 60 ff 3c 00 00 00 00 e3 05 04 00 e6 06
> 01 01 60 60 ff 00 00 00 00 00 00 00 00 00 de 90
>
> Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/pa=
nel-edp.c
> index 9a56e208cbdd..b334926e96ed 100644
> --- a/drivers/gpu/drm/panel/panel-edp.c
> +++ b/drivers/gpu/drm/panel/panel-edp.c
> @@ -1947,6 +1947,7 @@ static const struct edp_panel_entry edp_panels[] =
=3D {
>         EDP_PANEL_ENTRY('B', 'O', 'E', 0x0c20, &delay_200_500_e80, "NT140=
FHM-N47"),
>         EDP_PANEL_ENTRY('B', 'O', 'E', 0x0c93, &delay_200_500_e200, "Unkn=
own"),
>         EDP_PANEL_ENTRY('B', 'O', 'E', 0x0cb6, &delay_200_500_e200, "NT11=
6WHM-N44"),
> +       EDP_PANEL_ENTRY('B', 'O', 'E', 0x0cf6, &delay_200_500_e50_p2e80, =
"NV140WUM-N64"),

Since this is a "guess" timing without any datasheet, I'd be more
comfortable picking the most conservative of the "cousin" timings. Can
you re-send with "delay_200_500_e200" instead?

-Doug
