Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C4E3A699F5
	for <lists+dri-devel@lfdr.de>; Wed, 19 Mar 2025 21:06:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B02210E584;
	Wed, 19 Mar 2025 20:06:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="mPrbczAK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6786E10E584
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Mar 2025 20:06:04 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-54991d85f99so1278364e87.1
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Mar 2025 13:06:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1742414760; x=1743019560;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ox+b86Mz1zLnyFGavaorxBWxZyepAXif0wOlqHKLp20=;
 b=mPrbczAKd8GxAotWTKnqVKXCBn3+i5icGpDmc+sb6gucHu7qkjfbUTFzPi8aMIoQ9z
 BwwhTlSjRUjfiL8Vcaf8pE9DbNFozSfg/k5MsxG2ndPIVb1CYVVDI6u65xcxVIciH68u
 GGLFblqCWezgTQdPStbOn++3U82RZtvCbB8Ik=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742414760; x=1743019560;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ox+b86Mz1zLnyFGavaorxBWxZyepAXif0wOlqHKLp20=;
 b=hO6dTsvf7Ih2J+/8Rm0oN2iPsm4ic+WKQZ54pz5P0YZUntX+kD2eXAKRzSmyJeWg0K
 K1EN82lp9um2N4EV7lQwkRrIO+d7Jn952zuv2vjGmbrmsucWUwTp/izSvQrJoUzM3ddP
 aYBsY/hha/GkGmKp+PuvGdWC2Q5+n3g7oIiJcDibzpl/HuCQzgSrOcyN/gTXxH0pb3KH
 aZ+zJu1V+Q95p6uJPjxsXgbDwr+9NAKERIJ/QsKcWIrhz/x28WrfQupSm9eJXSsMWZgP
 N3i7OSNvXT0WuzCxyqRJ8abVp+MWoWFJxj0aVSrsa45KtLqcV28YT7vTTProJp4hPFLX
 UlPA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWm2dd6TajLh2UeCEzy7ThFkpU7JiHiJZpfyxFaOanbWs146ChtHCUcHBrQuFPnsjysY4yFZ3cwKfE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxWODZgw2OAVlCSgjqvgMBK8Dwlh+PDyjTDnOyNaviqH03CvYLG
 KPZLWV2sGj4YeMhdFWRfwuKaO7hCvTw576GFm67HqO51RG6gwVbtdxpDcVV9PwyuCFamO8LZFh/
 vbQ==
X-Gm-Gg: ASbGnctxD9S9tQnpt9uLc+ghTJDwqjn6nzAZiCTs7w9j8egdw4FopWiyt5Nj1yIfjGc
 RLrg9+HKlBtJCND2MNFb25yuep8DHnbOXi6Hhin9kqgbRYiIMwtQrCHtF/b3rvB2J5w3IlKsisJ
 z+xaibZ2eqaixtB/tXqDSYZ3OT9+okYXu9BJsBbHyjU4ISk2aAcFqw2fsxgIDRJ1H4NZmSwyhHn
 XYgdVRD/w1Krbj8zo8Pbz8aJDTXl1+qt/FZYvfbUBHwk24/gsmK3Inv9E+CQFAY2b3QX0kqgyWM
 JdVfazxIiDWKxB2NRTUg0alE9ujTbUPRGUrPWNiW5Fx5AKvQ5OmxLbOBveL4DTDMs/mEHgbM4R9
 X5pTONc5c
X-Google-Smtp-Source: AGHT+IFrW63JKBjt1HTnROfWn467lvkmWWfCtdkzfKeZccDiqdSgzNqPfOiWxpTY3m6iZ2rs0u9aRg==
X-Received: by 2002:a05:6512:1245:b0:546:1ea9:6230 with SMTP id
 2adb3069b0e04-54acfa79b4cmr305935e87.1.1742414759418; 
 Wed, 19 Mar 2025 13:05:59 -0700 (PDT)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com.
 [209.85.167.50]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-549ba7c0748sm2041822e87.75.2025.03.19.13.05.56
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Mar 2025 13:05:58 -0700 (PDT)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-5439a6179a7so52456e87.1
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Mar 2025 13:05:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUPUk4CjCaG7rrpjph8WNO9SnsYMozQT6df4ybhiOq0qEM4qJORER9MNdNzkPXFY7ovFC2xDbPIXPk=@lists.freedesktop.org
X-Received: by 2002:a05:6512:b99:b0:549:5a14:96d with SMTP id
 2adb3069b0e04-54acfadcd79mr273139e87.19.1742414755591; Wed, 19 Mar 2025
 13:05:55 -0700 (PDT)
MIME-Version: 1.0
References: <20250319183106.12613-1-tejasvipin76@gmail.com>
In-Reply-To: <20250319183106.12613-1-tejasvipin76@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 19 Mar 2025 13:05:44 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WZxF4CGSAAqSvs8XnLEvkXNEEv87V3ffE_uBfj-qWN=A@mail.gmail.com>
X-Gm-Features: AQ5f1JqO4W3z05cexRyDsYmMsA9GOM-V18xTmamNtYwVoiT6_fJtymxP1txM44g
Message-ID: <CAD=FV=WZxF4CGSAAqSvs8XnLEvkXNEEv87V3ffE_uBfj-qWN=A@mail.gmail.com>
Subject: Re: [PATCH v2] drm/panel: samsung-s6d7aa0: transition to mipi_dsi
 wrapped functions
To: Tejas Vipin <tejasvipin76@gmail.com>
Cc: neil.armstrong@linaro.org, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
 aweber.kernel@gmail.com, quic_jesszhan@quicinc.com, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 asrivats@redhat.com
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

On Wed, Mar 19, 2025 at 11:31=E2=80=AFAM Tejas Vipin <tejasvipin76@gmail.co=
m> wrote:
>
> Changes the samsung-s6d7aa0 panel to use multi style functions for
> improved error handling.
>
> Signed-off-by: Tejas Vipin <tejasvipin76@gmail.com>
> ---
> Changes in v2:
>     - Remove unnecessary early return in s6d7aa0_lock
>     - Remove redundant GPIO reset setting in s6d7aa0_on.
>
> Link to v1: https://lore.kernel.org/all/20250316045024.672167-1-tejasvipi=
n76@gmail.com/
> ---
>  drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c | 222 +++++-------------
>  1 file changed, 65 insertions(+), 157 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
