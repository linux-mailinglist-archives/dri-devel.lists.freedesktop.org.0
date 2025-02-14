Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8E29A363C6
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2025 18:00:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57D0310E4A5;
	Fri, 14 Feb 2025 17:00:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="NualumN7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A44CD10E4A5
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 17:00:45 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-308f32984bdso19704151fa.1
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 09:00:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1739552442; x=1740157242;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=x1rJ2BabnpFv+3StHsYJ7G+koKBHBopT3/7GAr+Q32Q=;
 b=NualumN7GWElqQv0Zg9Wd0vEgn4QahKH8alzOrSKoW62oGyecKQ+BIHiFC6bKy4b9Q
 B5bDN1X70/hwRdgMUgdGKAH6DewhT6b3buDmNKr2XsJgSSyI5qhR3XY2zCLAyE3mcMur
 HBoA1yYgmLcaQqDysa2HK3vcDG1regyfj+keE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739552442; x=1740157242;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=x1rJ2BabnpFv+3StHsYJ7G+koKBHBopT3/7GAr+Q32Q=;
 b=LW2zr+YaEpCgpOenOYVYkydBwd9LfLw0a8hKnT3oMl9iCjIunRGoadBJywW9ZITGWR
 4M0lZNtpXAzzb3pNy3+pcpyEhxiyM6lkQj1cSQCO7Lld9DeAqfttSq8sl7vhif5mI+xv
 Y/6X3sI1uBWjYBd7jt4haKInCKB3Bfvq/STFJq57ZY5Maxq2ZgoSVykpfyqRKTi1xMnM
 C643gk1nrVO1O90963pUxiOveUWmb4S8IYKit03X/bIcKZtv2qUFBJ4SbyD1gndtJoXj
 rqudS1tEe/lCL9rRbN1K/rqm6luKQ/q9R17+4OeRAvbQaCtsdjAHyG4Pqq9q6JI10tf/
 ML2A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXwtLFEp26jsM8CZgxw67hqr9URnrGKTBdiiLZPgelGBUk/49D9qAQo0tsd+g019fiyPJ/H/TuVDt0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxTDu//XbNoypzgL++hJUaQdwoZsy2zHU+I8BaZBXV6luwMfpqe
 KUwHQlC5+nuuceWW4Qw5CxdkFYWwUTuWSdnmnBBxdG4g+hOqsXVadR2dzp94DIA7NBxCf1u4V/h
 TFh2X
X-Gm-Gg: ASbGncuWMOavmY88g2QsoHNmdWIzTErMwGrFVn6RAsvETJLmRKc8/rRHx5YMX/PdUt8
 /b+n0vsX3hEBcoBEUn0I5Usp3KA4hWzhefsO7yijRGtIVnjx34rTrgrix1L3VAkNjTnZQy8j/GT
 Su34dnV4ARt+W8l0VjUyxLo9Vtgrhif2EovxrOwcY0h+Wwa2mPvcO+0EUW+YBsg9Yw8zFsSFj0P
 KnrTTqV89u0g4ojdLLJss8xB9KYZqeeLJfDJClhB/l6Dp2aVxPfc+mUU7T0Nosi4OGimB+NI4EX
 njSkGU9mO2UytqeO+vn4Dcun8QAXvnvtQBjft0jLiyoR/XtRZzhV0FRop1Y=
X-Google-Smtp-Source: AGHT+IGkdOZC94QoAcC849i0ZsFr2VrM6K2rJWHed0sS8QKzCPs2kIztASkIiEahTFCMlpD07VXuJw==
X-Received: by 2002:a05:6512:ea5:b0:545:6cf:6f3e with SMTP id
 2adb3069b0e04-5452fea6e3fmr5890e87.49.1739552441499; 
 Fri, 14 Feb 2025 09:00:41 -0800 (PST)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com.
 [209.85.208.172]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54525784de2sm361526e87.109.2025.02.14.09.00.39
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Feb 2025 09:00:40 -0800 (PST)
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-307bc125e2eso23014641fa.3
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 09:00:39 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXkQ1omQVDoKQIm8p10e0SP4FWyu32Q4ee7hCsfSsV1jr+Dk78sBbdYT+WbMyh0yKJTnleBWBZ2wtU=@lists.freedesktop.org
X-Received: by 2002:a2e:890d:0:b0:308:eb58:6586 with SMTP id
 38308e7fff4ca-30927b1ad9fmr526231fa.24.1739552438401; Fri, 14 Feb 2025
 09:00:38 -0800 (PST)
MIME-Version: 1.0
References: <20250213-bridge-connector-v3-0-e71598f49c8f@kernel.org>
 <20250213-bridge-connector-v3-4-e71598f49c8f@kernel.org>
In-Reply-To: <20250213-bridge-connector-v3-4-e71598f49c8f@kernel.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 14 Feb 2025 09:00:25 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UB4NoTaNfV4w4GE6tmHZbGdUKCx6Yscpxo2YQRA4Th0A@mail.gmail.com>
X-Gm-Features: AWEUYZnlF56_MlEcpLFHOcXd4DY1qENmIJ2J2sK12MuHSNIiD9o59vM9X2CDylA
Message-ID: <CAD=FV=UB4NoTaNfV4w4GE6tmHZbGdUKCx6Yscpxo2YQRA4Th0A@mail.gmail.com>
Subject: Re: [PATCH v3 04/37] drm/bridge: Pass full state to atomic_disable
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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

On Thu, Feb 13, 2025 at 6:44=E2=80=AFAM Maxime Ripard <mripard@kernel.org> =
wrote:
>
> It's pretty inconvenient to access the full atomic state from
> drm_bridges, so let's change the atomic_disable hook prototype to pass
> it directly.
>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>

From the point of view of ti-sn65dsi86:

Reviewed-by: Douglas Anderson <dianders@chromium.org>
Tested-by: Douglas Anderson <dianders@chromium.org>
