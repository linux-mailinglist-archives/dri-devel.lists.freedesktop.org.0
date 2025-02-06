Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D746A2AEC5
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2025 18:26:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FEFA10E1E6;
	Thu,  6 Feb 2025 17:26:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="BRNbXjBC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3580F10E1E6
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Feb 2025 17:24:43 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-5401be44b58so1314269e87.0
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Feb 2025 09:24:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1738862679; x=1739467479;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ed7lT/vrZVPJbPUzm9AOnCzmZ1I0Y/f6j1mnOtXgaMc=;
 b=BRNbXjBCR3lZ9/wotq6EbjWixGFMnLYKjJz68Ph/j4Fm1N2HRApzdowWn3MwSDXMAk
 KqEd0xG3oZfniYWtldN5Sta6WhZ4cTO2drhiYiY1Ix9Oidttnwk4c/mjSNxpt1eDQbt/
 7aHHC7Fsz3rZoEsaELTa5GDwjpCKm53Pd8P+U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738862679; x=1739467479;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ed7lT/vrZVPJbPUzm9AOnCzmZ1I0Y/f6j1mnOtXgaMc=;
 b=oxofDZnWDIXum4c0v4dI6pHesiRn5Ne5HiF0/2Btd4VfFAlrgmQoD9LdB+bnW0jKgM
 tlF6L29267CEKM8gworOIZOC4QmEt9axKKk8kOZkST+gTql87yRWhlxH58yOoS6NPDU5
 bBePUbsgUUfu3kmFMZY17ZhCGiXZuU9kXHB1ZFQBssu7VQ2ryhc/Whu/Yi/dooqTvSnn
 KZ/4LGlxLxsghx/mhuCMXvzvEERJfgeVRMugEbFx8D8QZyqxPB6rzF/wTvM7nRa964uj
 Eme6hDF8+h3pQt1kuBcGqcVrWIYnoKzYTlanLewAvvQBiTvSY1j/w6XQK2YjXBMcwyqI
 M1Ww==
X-Forwarded-Encrypted: i=1;
 AJvYcCWuvuvqTB74P7G5aKvZAFJdJOJHyvgRZu+QAg98oaOt6bou8MwXXt98SXjctVQHue1s2M9tKvqTR+M=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz+pW+XpHD1aLjFnZNkVQA0LVmEkYCOgqefY/UAtsoysFtlfoEs
 ehUaogxkfixGBOzk0SJWkYjmNin6qyGj+bofBKJDH/rXY9awtvfZr2Uj0UAd6eG0v4dlXDosyOe
 jZLg5
X-Gm-Gg: ASbGncsgQqNJeB7vFSqUoQI6QvjuEStvNo4t79CES3cERIRt6derSVk4bs+MBOJ0MS0
 fyukNdPa2cWmxHBsRf2uJOXUuKDhACyDG96TRj1AYoKMlb8KN9s749L5pup+bUjJpF3tjGfzs70
 LkTfWLUW9QFOFjqYRZBWctL0TxrClziiN8QL1CcNzDLmWy+jdfNAAWhHzTTOQNC8tKlf53U0j6+
 4LhKxvHmjn5SgrBsActhyQcgciFNTXK3F62hSamzpYF+djsMWE1fToH+bFMPorQBi4fMA+QkEzt
 nFjUn32Y59F+VP1yOOOkXiDlwhIUPJsz9A9liEFDvE/SzkqdXg5h3qg=
X-Google-Smtp-Source: AGHT+IEAIxOFkdPle05PI6m0CH1FiJ/9oIdOodCmaRGdQW7qsE38Xh1339LqaUVXUepekah9uCResA==
X-Received: by 2002:a05:6512:158e:b0:542:9a42:797f with SMTP id
 2adb3069b0e04-544059f9d13mr2632065e87.1.1738862679236; 
 Thu, 06 Feb 2025 09:24:39 -0800 (PST)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com.
 [209.85.167.48]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54410555a0dsm186575e87.86.2025.02.06.09.24.37
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Feb 2025 09:24:38 -0800 (PST)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-5401be44b58so1314194e87.0
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Feb 2025 09:24:37 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVVK1fPcmmBt3lv+BlOwjwY59o/egVUrrkzWql6SV2QHRg8dgp3DcpLWEyPkXPOxymtzJEjwVYT3qs=@lists.freedesktop.org
X-Received: by 2002:a2e:bc27:0:b0:302:29a5:6e21 with SMTP id
 38308e7fff4ca-307cf2ecceemr28052561fa.3.1738862677388; Thu, 06 Feb 2025
 09:24:37 -0800 (PST)
MIME-Version: 1.0
References: <20250206-drm-cleanups-v1-0-93df60faa756@bootlin.com>
 <20250206-drm-cleanups-v1-4-93df60faa756@bootlin.com>
In-Reply-To: <20250206-drm-cleanups-v1-4-93df60faa756@bootlin.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 6 Feb 2025 09:24:25 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Wpd7uweOrLJfxzBBL0DSs=5++QpfaQZQ98++en2=4fmA@mail.gmail.com>
X-Gm-Features: AWEUYZkPAnqgw5tLJHzsOP5sDbr1MervVm8zS8Lc-qKKD9rrDdhPe1XWkMlYEhw
Message-ID: <CAD=FV=Wpd7uweOrLJfxzBBL0DSs=5++QpfaQZQ98++en2=4fmA@mail.gmail.com>
Subject: Re: [PATCH 4/8] drm/bridge: parade-ps8640: remove unused drm_panel.h
 include
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
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

On Thu, Feb 6, 2025 at 9:02=E2=80=AFAM Luca Ceresoli <luca.ceresoli@bootlin=
.com> wrote:
>
> The file uses the panel_bridge APIs from drm_bridge.h, but no drm_panel
> APIs from drm_panel.h.
>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>  drivers/gpu/drm/bridge/parade-ps8640.c | 1 -
>  1 file changed, 1 deletion(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
