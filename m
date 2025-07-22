Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49B4FB0E1F2
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jul 2025 18:32:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DE9A10E6CC;
	Tue, 22 Jul 2025 16:32:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="PwnteF8B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
 [209.85.215.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCE6210E6CC
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 16:32:17 +0000 (UTC)
Received: by mail-pg1-f170.google.com with SMTP id
 41be03b00d2f7-b26f5f47ba1so4613021a12.1
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 09:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1753201935; x=1753806735;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=g5dIDnAxZOX8ng1HhpeNVCkuVrJFpRO5masWNAnQ3RE=;
 b=PwnteF8B+mHHE2T96L/RaUmxW9engi3e8BZb9JX4OHV5EYbfwaKQ2IVB4ykg0hN7Ep
 LYwQps46huqknvByRY4qppFIauZ6kKLDtovE5o3mGd4/UW3u6926lokPM+M17JT9OgzQ
 LKIroliYzjS21rIx4sYQVAzr4RCO/YKKaytjY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753201935; x=1753806735;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=g5dIDnAxZOX8ng1HhpeNVCkuVrJFpRO5masWNAnQ3RE=;
 b=fznENSBq4YijP5+a1V1Yhz7Kw1GWgCmBWvCL5Ba/l14pT5bjP/CETGyNJ8o4NrfTJJ
 DyOvj1i/yK9suZ/+5SLgyUYjKlaR6Tzcs5c3D723hXs2SrQMfAQhu3hqecynyrSZ5meZ
 yqHxvRGotnhmflixE0pEpaAeFZOmxJK9cBdDSGHUfGCl7Fevp8PV0Z6WsKUQsZtrFK8U
 7WTdEX9JDPf4XDkgkdvfgdLY1SGa3xFAl75eNc4ViqcdOR89Yyv9PKketoMoMcLZE8H+
 /DfGeQNV1WumMgRfCdk0ju4MuAlGzoNG7VSKLkDZfBhYnxYiFgNIf8YBFxiz47VeqD8f
 z+IQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWveywGgnzmvHyS1um4rtG0NfaBMb7pJ8Eo9oS1qRwwxV/UkjNCa/U4NmDeiEQNdK1G4o+oEl9bkCU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyyYO+FcXSMVwHhfUMvu7+zPI8YaOhle/WMrpYfW03QFpf2Xjf9
 WEdTU9QgQvJPLR638DVJ3VZmajv5tl4Lo8RIKnm2MbOXAA1Gz0vS4U6RcpWtAzCx8BxGOyiBNwm
 vZvQ=
X-Gm-Gg: ASbGncvdIWKQpfHGQXaxt1D0RzSxvJ2/7KdHThp2AatqZ56HZFNiuzitIZLjsC83hC6
 oeq7s+5benW/nlFhA/DF1FRe2Ep93QNt0aYOAZdcgo9JkCPL75Hnqkq2gsH04ZqJUPdSiTFDf3C
 qTgIT0gjemlYs70Jwf91wh/WbhjWPTjdcC1Y2aiJVMoF+km2lrXCj9kTM27TOxJyVTEhbOf7pSy
 13lSNhGcyJFBove14fedMblo2PEh3Xk9OLPAu9NSFUYSJCYSBh/7ldjU4ubFhKnnDY3Cf0en5kL
 YbLRtoo+cbJd5++L/Y+ZIi45g7P9dzkAiLahrMhmCFb95T2kNG2IQeVNB/+/i5dihtpUNqldCn/
 WtQi0h47/SX8eCf8+SnCaICnuJOj27JEWws1KOncc3RyNPzG2FiQC+M6tQKjXMAhG/6ioALMn
X-Google-Smtp-Source: AGHT+IGN9EtoHM6/YhRhf7Hb3mln62VmOlxwc9FY0PjFW3btoigtrY6baqv42m2KzheQNAInBBOsxg==
X-Received: by 2002:a17:90b:46:b0:312:1cd7:b337 with SMTP id
 98e67ed59e1d1-31c9f3c3663mr30297030a91.5.1753201935022; 
 Tue, 22 Jul 2025 09:32:15 -0700 (PDT)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com.
 [209.85.216.51]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31cc3e5bec9sm8315103a91.15.2025.07.22.09.32.11
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Jul 2025 09:32:11 -0700 (PDT)
Received: by mail-pj1-f51.google.com with SMTP id
 98e67ed59e1d1-313a001d781so4735696a91.3
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 09:32:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVrZTXT66JfHTRWCuSbxMo3czRidFYQxEZlL/CxpM42BRH/QgDLCVeO0Grlh9olW0ru6APNHT6HWWs=@lists.freedesktop.org
X-Received: by 2002:a17:90b:2247:b0:313:283e:e881 with SMTP id
 98e67ed59e1d1-31c9f3ded05mr36938957a91.11.1753201930387; Tue, 22 Jul 2025
 09:32:10 -0700 (PDT)
MIME-Version: 1.0
References: <20250722015313.561966-1-me@brighamcampbell.com>
 <20250722015313.561966-3-me@brighamcampbell.com>
In-Reply-To: <20250722015313.561966-3-me@brighamcampbell.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 22 Jul 2025 09:31:58 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Vg6LoPzOHRj=XzCcSb7rPb=vPuCZngrf4hROZNwfj2Pg@mail.gmail.com>
X-Gm-Features: Ac12FXxeoQ5h83qTRHx6WqFmrhVxXb5TjaxOWmVQAou0S7ba7bXolm4shfJMxPI
Message-ID: <CAD=FV=Vg6LoPzOHRj=XzCcSb7rPb=vPuCZngrf4hROZNwfj2Pg@mail.gmail.com>
Subject: Re: [PATCH v6 2/4] drm/panel: jdi-lpm102a188a: Fix bug and clean up
 driver
To: Brigham Campbell <me@brighamcampbell.com>
Cc: tejasvipin76@gmail.com, diogo.ivo@tecnico.ulisboa.pt, 
 skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev, 
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
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

On Mon, Jul 21, 2025 at 6:53=E2=80=AFPM Brigham Campbell <me@brighamcampbel=
l.com> wrote:
>
> Fix bug in unprepare() which causes the function's return value to be
> that of the last mipi "enter sleep mode" command.
>
> Update driver to use the "multi" variant of MIPI functions in order to
> facilitate improved error handling and remove the panel's dependency on
> deprecated MIPI functions.
>
> Use the new mipi_dsi_dual macro to reduce code duplication.
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> Reviewed-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
> Tested-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
> Signed-off-by: Brigham Campbell <me@brighamcampbell.com>
> ---
>  drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c | 196 ++++++------------
>  1 file changed, 59 insertions(+), 137 deletions(-)

Just for fun, I ran bloat-o-meter to compare before and after.

add/remove: 0/0 grow/shrink: 0/3 up/down: 0/-217 (-217)
Function                                     old     new   delta
jdi_write_dcdc_registers.d                    10       5      -5
jdi_panel_unprepare                          312     260     -52
jdi_panel_prepare                           1020     860    -160
Total: Before=3D4908, After=3D4691, chg -4.42%

...not as big of a savings, but that's not too surprising in this case
since we don't have the whole pile of "seq" functions. Still the point
was making the driver cleaner and the space savings is just an extra
bonus!

-Doug
