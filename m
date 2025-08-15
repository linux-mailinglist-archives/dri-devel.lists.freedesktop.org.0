Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4C11B2739D
	for <lists+dri-devel@lfdr.de>; Fri, 15 Aug 2025 02:19:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CBB210E100;
	Fri, 15 Aug 2025 00:19:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="USYXnGvM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
 [209.85.210.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A11610E100
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Aug 2025 00:19:31 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id
 d2e1a72fcca58-76e2e618a98so1226681b3a.0
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Aug 2025 17:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1755217169; x=1755821969;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CEZvwZ6yQfWgMEqsVmo462XXGUa5NScj6l2mlIQyQ0c=;
 b=USYXnGvMGpHuknTl5MhmE1S00phYctNeqmM3kYYYGXE2ym/nDTAnalDbMcXuU2Pkm2
 IkMTOC6Wxq7vfx+vIjuW2wr442jfjQbPM8VQXReaxByGwaKmLtaoHSlvmu3d6coFZzQ/
 ZNySIXRr8/Mb647B20Ux3nK/3dIKb7rSkEhqE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755217169; x=1755821969;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CEZvwZ6yQfWgMEqsVmo462XXGUa5NScj6l2mlIQyQ0c=;
 b=kMsUwAs8kN0w/GDZvKrmZsY0N/T5T1zugDm0ANV1dsLthfje8hLY1Qr2O3R1nBTJYd
 s5S5/HlGrw0ek847z6CXe1eqxqnA2d8QCQfnakOa3Vj9JEC3ImGXHO3ZxNfRkQtAvBOy
 JcXmCs26HMQ1LQp89DcBvk6AT5LayaReO9FE6dabwfdpMkb2g30P5InKeICgUlH3Coup
 cgf3TVdNDeQy0dZmLmCSWgZmNHgAElxmm9j7Vqq0PTy+m48Vgypbj32KsqSvYnxRqiCh
 7yoAS3uUSnEPSATvfiBggrO6xkk/lRlQe4lPFxOtlTnhVVtnDPvFGtGomnNhXdcsmpu5
 zkYw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUpbJmER0AGbf5zaV+Bwwfr6EbADXbs6OKqTnpcQ3VeNXl57bcU6Ue/pHURT/YDQyYqaqL+uscfwaI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwZHnCvYz+/R4GMRRCtjVLZ0OI51zcA7I1y3wlfoRVA8BUxwrs4
 icrGjoFWTWR3BWVQQvzFquj1+Mf+GcziHe1tIEew9mGqLNT28yAfQA14PpHbFPPtm5Diji6iHkw
 iVw0=
X-Gm-Gg: ASbGncvzV1I9c1F1yh2FcOlYIiQ43aoKvSsTcL7gNTJdUQjckQo8kqvUg0F1AcUa/Y8
 N+Z5uJmcfAEo39e7JTrMWCAb4NQcxwkOE04ltlByVwm0jAqSudKmVmfK+JYj5UQdWImbXkEAiml
 4PHd9ZjT50ulwZ8UyfDaZc1BJUWQt31VEexc/K9LxvvJ/NZcbry8lCh81vHoKE6ZbdPC/py24G+
 wPwRLzjZrYe4gfMxtMg+G/P6Y6gnRYgU0kDncfCHMvay/tfwJIMIA0491rZh5hlKVwiqj4eISEc
 xGURsxVezAinWAKs6W8gfKacGe0b0JmfHRDquxY4TjAIBQ1Wc6FVJyk1OHl7pmB8byFyVw8UhxJ
 rv1n7i30M2kumbuWjB9OhlibAMqSXd4vTfnIczokw66AUDeauLD872KkSNhcplDjJU3rrGnM6nI
 BG
X-Google-Smtp-Source: AGHT+IGtHRsRRTZIYWwKZ8LDR6zjWhG/8q/ofc0tK7Hi1wzd9TvzB1WFySyiALtkYHFV8atKtg34ng==
X-Received: by 2002:a05:6a20:12c8:b0:240:cd6:a922 with SMTP id
 adf61e73a8af0-240d31a882dmr241276637.37.1755217168627; 
 Thu, 14 Aug 2025 17:19:28 -0700 (PDT)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com.
 [209.85.214.171]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76c2078afd8sm23537944b3a.117.2025.08.14.17.19.26
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Aug 2025 17:19:26 -0700 (PDT)
Received: by mail-pl1-f171.google.com with SMTP id
 d9443c01a7336-24458317464so16907955ad.3
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Aug 2025 17:19:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCW2hFeYx60QU+ojnJOGQiCdQ+pjHAgYVh2w3IfXuJ5U/NXI1cNR3uXZHCXWDCC+iXTjlPVDOmWFBTE=@lists.freedesktop.org
X-Received: by 2002:a17:902:e947:b0:242:a3fc:5900 with SMTP id
 d9443c01a7336-2446d5af310mr1936465ad.8.1755217165481; Thu, 14 Aug 2025
 17:19:25 -0700 (PDT)
MIME-Version: 1.0
References: <20250813125132.1319482-1-treapking@chromium.org>
In-Reply-To: <20250813125132.1319482-1-treapking@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 14 Aug 2025 17:19:13 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VAMT4xNoFKan7UpCS8RRXvOPWqRXJGsMudvJ+eWOOuDw@mail.gmail.com>
X-Gm-Features: Ac12FXz-ckb7A9RPiPMgTBiKCqz6twUCK_GsqpTzShr-jwEY5OOiNXBDYC75hpM
Message-ID: <CAD=FV=VAMT4xNoFKan7UpCS8RRXvOPWqRXJGsMudvJ+eWOOuDw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] drm/panel: Allow powering on panel follower after
 panel is enabled
To: Pin-yen Lin <treapking@chromium.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>,
 dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, 
 Chen-Yu Tsai <wenst@chromium.org>
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

On Wed, Aug 13, 2025 at 5:51=E2=80=AFAM Pin-yen Lin <treapking@chromium.org=
> wrote:
>
> @@ -230,6 +239,18 @@ void drm_panel_enable(struct drm_panel *panel)
>         if (ret < 0)
>                 DRM_DEV_INFO(panel->dev, "failed to enable backlight: %d\=
n",
>                              ret);
> +
> +       list_for_each_entry(follower, &panel->followers, list) {
> +               if (!follower->funcs->panel_enabled)
> +                       continue;
> +
> +               ret =3D follower->funcs->panel_enabled(follower);
> +               if (ret < 0)
> +                       dev_info(panel->dev, "%ps failed: %d\n",
> +                                follower->funcs->panel_enabled, ret);
> +       }
> +exit:
> +       mutex_unlock(&panel->follower_lock);

Extremely nitty nit: all of the other functions have a blank line
before the "exit" label. :-P Could you match?


> @@ -598,12 +641,18 @@ void drm_panel_remove_follower(struct drm_panel_fol=
lower *follower)
>
>         mutex_lock(&panel->follower_lock);
>
> -       if (panel->prepared) {
> +       if (panel->prepared && follower->funcs->panel_unpreparing) {
>                 ret =3D follower->funcs->panel_unpreparing(follower);
>                 if (ret < 0)
>                         dev_info(panel->dev, "%ps failed: %d\n",
>                                  follower->funcs->panel_unpreparing, ret)=
;
>         }
> +       if (panel->enabled && follower->funcs->panel_disabling) {
> +               ret =3D follower->funcs->panel_disabling(follower);
> +               if (ret < 0)
> +                       dev_info(panel->dev, "%ps failed: %d\n",
> +                                follower->funcs->panel_disabling, ret);
> +       }

The above order is incorrect. You should call "panel_disabling" before
"panel_unpreparing" which will match the natural order things are
called in.

Also: please review kernel-docs for the following functions and update
them for your patch:
* drm_panel_add_follower()
* drm_panel_remove_follower()

-Doug
