Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46272B163F9
	for <lists+dri-devel@lfdr.de>; Wed, 30 Jul 2025 17:56:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89DB910E104;
	Wed, 30 Jul 2025 15:56:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="B88e6Riv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
 [209.85.215.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A74710E104
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jul 2025 15:56:19 +0000 (UTC)
Received: by mail-pg1-f169.google.com with SMTP id
 41be03b00d2f7-b3507b63c6fso7401303a12.2
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jul 2025 08:56:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1753890975; x=1754495775;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ac5jc5iSuVh5ffwFsIe3xf2fxESMA6NIz6igvIuJEDk=;
 b=B88e6RivauL7efdQ5SYfB0Ro+35DEnuxQ2y0Va+v7NyElBgMUaTKQZ+mHVoEh5aT4o
 Obon4xOnwAJindXGGVXhRbvFcUUhtDWqUIV9lqxNvwOFWq4lHIXQDspCnZnZmyHRoCFj
 /l9rdNRM+DzPiuUa7i562B/lmJ3t3vo0Q6yh8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753890975; x=1754495775;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ac5jc5iSuVh5ffwFsIe3xf2fxESMA6NIz6igvIuJEDk=;
 b=ZXWIfyrtGLPrhQQmynyR80RjnO5BEZttyMKm2uQMxKjKXFMR+ssUwP6k5Yqg9CYdov
 fUXrTfbgvfJLJUTglF3nuXnpE5Ins64EF1IDmsjdY88Q6tBzwGf18H3k92kwxaTr5iTj
 4V1sPjyObUpae8SAWu/H6jnI9tZZpMq9o2kgHqaVf79Y2k5TLRvd4JrUowwwwxh+5MGx
 ECdiOah2d39YU6L3HjKY65ebm9cuEjikxgDjCr3exHxgovmAsxNIV3END4tBoW3B3XPK
 AFbGfy9M5vwtNB0cJKXlMN2WaqNeYnfdxO1Okgokols3W9fNPUTRYQUcXr8zOtIbn9qF
 Bzpg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV3vR9tWcxGvDJ+IxsKhsEdCXGh1IPLeO2vWwXi3AhkOd/+XJqFFW/RkAQk53326FSgrhmu1Zi5GBg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyDeXYldTA2QSlGe9uaeGHhA+Lwp7Lc3Svd3oeiLQjBEFTL/NlV
 FlMHcGnSo18+MaVzII+GAP14bVBDbl8+xz4RJ/YAz6W3fWtwRWmlAAgVP6rSIzizVkbbzcpXO3Y
 UjAE=
X-Gm-Gg: ASbGncv3TkaqZZDU4xF5jA+yiyA1go96J6HmJDfMCSM0Rh5VviMuA8/oAxa8B4nQXy7
 CUHOlQ4rAWV8kYcdVxGKde4VxbPmCE1F/MTO3ay0O7pLwq2+r7Q1H2DdCkdkP/cdDQieHKaoISF
 fy5PKaC9SL75wkgeor9Tp0N5N29vD2wcQeDJaaoJNx7uQ7WDBEEPoTzcuyqKDzFvTYnG1y3vOaj
 vPllmInNBnd66ZfFN1SI3SBEaLXDPYPKvq1yLVCQdSMy0+fCrrgRgtVnWMD9XquN7neq9rZT2og
 ronWd4xKNMyWwQoCcHL4acTExMSM6RrXdjCpOqqp6hLlO+DGwgPzVjXulitOQU3P0DEAaPdGflF
 i7tB/XTTPUXxPqPMG4qPW/XOSo3gSnv6UH9BeRxir3dqs4ObUEBqexgCSwUz6iw==
X-Google-Smtp-Source: AGHT+IFeF84E98gR2hs3LG5VGo+hfKxr4+a3/g/HD2gRYaPSyPmLTSA6pjqMZZGIwHtYeIR0O6YXVg==
X-Received: by 2002:a05:6a20:728e:b0:238:351a:6440 with SMTP id
 adf61e73a8af0-23dc0eb2a90mr6307661637.43.1753890975247; 
 Wed, 30 Jul 2025 08:56:15 -0700 (PDT)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com.
 [209.85.216.42]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7640b4c8695sm10291382b3a.116.2025.07.30.08.56.13
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Jul 2025 08:56:13 -0700 (PDT)
Received: by mail-pj1-f42.google.com with SMTP id
 98e67ed59e1d1-31f02b6cd37so38386a91.1
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jul 2025 08:56:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCU7HjMI0E3y9lPiM8YNye6cUEoaeg1LvZs6643m2CCHw4QdYuD0GaQBq6EQFmVTlz6d/Mrb3lKJaM4=@lists.freedesktop.org
X-Received: by 2002:a17:90b:1b48:b0:31f:4a91:4e97 with SMTP id
 98e67ed59e1d1-31f5de1ea3cmr5307381a91.7.1753890972855; Wed, 30 Jul 2025
 08:56:12 -0700 (PDT)
MIME-Version: 1.0
References: <20250730061748.1227643-1-me@brighamcampbell.com>
 <20250730061748.1227643-3-me@brighamcampbell.com>
In-Reply-To: <20250730061748.1227643-3-me@brighamcampbell.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 30 Jul 2025 08:56:01 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WpbU-iuEDVRuMm87H48PKQ3pz5aBwTRyedguFQA3dvTQ@mail.gmail.com>
X-Gm-Features: Ac12FXywEUfNlazykPXpS0so8Utrbf7RYxdVRu4_QjEIfWrjs2DXSKQ83cwp0WY
Message-ID: <CAD=FV=WpbU-iuEDVRuMm87H48PKQ3pz5aBwTRyedguFQA3dvTQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] drm: Add MIPI read_multi func and two write macros
To: Brigham Campbell <me@brighamcampbell.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, linus.walleij@linaro.org, 
 neil.armstrong@linaro.org, jessica.zhang@oss.qualcomm.com, sam@ravnborg.org, 
 skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev, 
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

On Tue, Jul 29, 2025 at 11:18=E2=80=AFPM Brigham Campbell
<me@brighamcampbell.com> wrote:
>
> Create mipi_dsi_dcs_read_multi(), which accepts a mipi_dsi_multi_context
> struct for improved error handling and cleaner panel driver code.
>
> Create mipi_dsi_dcs_write_var_seq_multi() and
> mipi_dsi_generic_write_var_seq_multi() macros which allow MIPI panel
> drivers to write non-static data to display controllers.
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Brigham Campbell <me@brighamcampbell.com>
> ---
>
> Doug, you had suggested a slightly different shortlog for this patch. I
> adjusted your suggestion to fit within the canonical recommended
> shortlog length of 50 characters. I understand that the 50 character
> limit isn't a rule as much as it is a guideline, but the current
> shortlog seems to me like a good compromise.

Looks good.


> @@ -431,6 +449,23 @@ void mipi_dsi_dcs_set_tear_off_multi(struct mipi_dsi=
_multi_context *ctx);
>                 mipi_dsi_dcs_write_buffer_multi(ctx, d, ARRAY_SIZE(d)); \
>         } while (0)
>
> +/**
> + * mipi_dsi_dcs_write_var_seq_multi - transmit a DCS command with non-st=
atic
> + * payload

I should have been explicit, but the above "non-static" should also be
"non-constant". ;-)

I could probably fix that when applying, or you could send a v4. Up to you.

Speaking of applying this, I'll be on vacation next week, so I won't
be able to apply the patches until the week after. That will also give
anyone else on the list a chance to comment if they want...

-Doug
