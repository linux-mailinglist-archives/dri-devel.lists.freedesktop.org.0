Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 500BDA2D284
	for <lists+dri-devel@lfdr.de>; Sat,  8 Feb 2025 02:14:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A90F010E397;
	Sat,  8 Feb 2025 01:14:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="nuocuWI5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B27D10E397
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Feb 2025 01:13:38 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-aaeec07b705so445766666b.2
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Feb 2025 17:13:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1738977216; x=1739582016;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tHszUqSCGBMCxsD58rJHaZBPKTZWyVcaex7WlbuvwjY=;
 b=nuocuWI54GD6/GxofMBv7exfBRsfkMKipeNAqczSlV3evF98AUQ0VKg4RvduUInh6r
 2qURDrcYEWa9HI9yW5rmh2sx8zUtlhOt2m0RKeddBekDpQLRSFB27A1oWRsGatMfgMsA
 0O/pGq2BpIRqCJTX3yUoE9iM+BWN1UJuO92dw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738977216; x=1739582016;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tHszUqSCGBMCxsD58rJHaZBPKTZWyVcaex7WlbuvwjY=;
 b=vSrfG8cchNKHoA14vA+ivN76N08X3j5Ni5vQgmYyOUkeF403TP2x+z/L3e71FODRex
 qCnXGZMuoWYj0Sj2E1SVgzqUxxJW7utlto90RqAu9ayLgYkg5sWNXEi1uAZ9Gs7aJqkY
 aobqVeEu+M2YHrWS7BnWUlXPa0DCUQS81J4NpwuYzKMMSxMvkCR8yvZIop8wGWpYoYaV
 5I3CcfXN3QCyD4E8ws6kkpputx3hBTA2b3JV7bQObGFRgaeOjdoFWvb67+0S+RIT1ZB0
 TD5s+EO+BadwYggSqecH7gEL62Kcnh8KTEnysZ2kGPsvVb0bdVqUXT0QBDUHBsxkdE2b
 N9Ig==
X-Forwarded-Encrypted: i=1;
 AJvYcCXFoFrJBFOXhofVqwC2PB1CkfhgdZjQCkdgHQ5VtZ7BAJ9wO1Q3NNdyRS8XqOCL6rUD4MkTd2DAzTw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwttK71JAgFZcE1TVkD7ZYOizJ0NeOm3n3FQlXeHftVVsZPfJIJ
 8UYmWjavc1hIPYaXoe2qLLA584+IxHaIH9WJEM+QdxCgkxySShgK695SMBf+lbESWodDCUuXnxY
 uzcEM
X-Gm-Gg: ASbGncugiBaYEbhgmAQvZM08jRwRhCop047tBOmoQBkWAjCgZqY+LGrG+1v2HP9CtUJ
 l1Emb1CHny2a69ci7qgw66p0B+cu2HLmriJmKpUgJYAQ7t4ep+yclbQ+7B/8rvVVtt783Tmzyxw
 Sst1RmN+9Htci2rxlDH7+dayXjzZ5ThbrwD9a5RNHvuJDrw3EXyvKN+sVq8BIoYQ8xgz/SCwxKb
 8+pqrOI3MG4mgWNidk2Y2PtC9iqxYANJlWIAujRnhLP99UhFidVOmYYXDZyxf2L/S9YM49J4yC7
 NuJyBugG0AZH58g1Yz6R4URpvRQfeQ5BvNkEhC9CpXNxLIxUWRNghaw=
X-Google-Smtp-Source: AGHT+IFSmPc0gqk0SNV8Qk4+I96p2+AE1TH8BtdC+xpGFFemkTEEkqeAZdoMd6DPFLy51DWCKarxuQ==
X-Received: by 2002:a17:907:c1c:b0:aa6:7220:f12f with SMTP id
 a640c23a62f3a-ab789abde22mr622827266b.18.1738977216322; 
 Fri, 07 Feb 2025 17:13:36 -0800 (PST)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com.
 [209.85.128.47]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab78ee9e208sm179205466b.50.2025.02.07.17.13.35
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Feb 2025 17:13:35 -0800 (PST)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-43622267b2eso26170755e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Feb 2025 17:13:35 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCV0Imc9QG4LbTFea3fH4sev+Q/Jdf3U8jRND1wb8MlESFs3WrWwGRXE2iUr9O70ST7YQZD+OTN4sUU=@lists.freedesktop.org
X-Received: by 2002:a05:6512:3ba8:b0:543:9b0f:7d39 with SMTP id
 2adb3069b0e04-54414ae0de2mr2057368e87.32.1738976902442; Fri, 07 Feb 2025
 17:08:22 -0800 (PST)
MIME-Version: 1.0
References: <20250204-bridge-connector-v2-0-35dd6c834e08@kernel.org>
 <20250204-bridge-connector-v2-13-35dd6c834e08@kernel.org>
In-Reply-To: <20250204-bridge-connector-v2-13-35dd6c834e08@kernel.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 7 Feb 2025 17:08:11 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Wu4cGQ9FsQteju78rE04v9O9rTUz0W3Punhr+BZM=66A@mail.gmail.com>
X-Gm-Features: AWEUYZmDTTmxI72piEcHcrC-LMDJ3meTMFGoKV0AJrQqDxffv63GCAjRlxWZiEc
Message-ID: <CAD=FV=Wu4cGQ9FsQteju78rE04v9O9rTUz0W3Punhr+BZM=66A@mail.gmail.com>
Subject: Re: [PATCH v2 13/35] drm/bridge: Change parameter name of
 drm_atomic_bridge_chain_post_disable()
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
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

On Tue, Feb 4, 2025 at 6:59=E2=80=AFAM Maxime Ripard <mripard@kernel.org> w=
rote:
>
> drm_atomic_bridge_chain_post_disable() disables all bridges affected by
> a new commit. It takes the drm_atomic_state being committed as a
> parameter.
>
> However, that parameter name is called (and documented) as old_state,
> which is pretty confusing. Let's rename that variable as state.
>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/drm_bridge.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> index 0a8c7176959d13937124d2a3bf7e69309898b947..ab166972b1b0df239ca014296=
be49846a857df6e 100644
> --- a/drivers/gpu/drm/drm_bridge.c
> +++ b/drivers/gpu/drm/drm_bridge.c
> @@ -577,23 +577,23 @@ void drm_atomic_bridge_chain_disable(struct drm_bri=
dge *bridge,
>         }
>  }
>  EXPORT_SYMBOL(drm_atomic_bridge_chain_disable);
>
>  static void drm_atomic_bridge_call_post_disable(struct drm_bridge *bridg=
e,
> -                                               struct drm_atomic_state *=
old_state)
> +                                               struct drm_atomic_state *=
state)
>  {
>         if (old_state && bridge->funcs->atomic_post_disable)

drivers/gpu/drm/drm_bridge.c:588:6: error: use of undeclared
identifier 'old_state'; did you mean 'node_state'?
  588 |         if (old_state && bridge->funcs->atomic_post_disable)
      |             ^~~~~~~~~
      |             node_state
