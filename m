Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C98079A4EF4
	for <lists+dri-devel@lfdr.de>; Sat, 19 Oct 2024 17:08:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7456910E2B0;
	Sat, 19 Oct 2024 15:08:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0E8810E2B0
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Oct 2024 15:08:12 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-539e8586b53so3443401e87.1
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Oct 2024 08:08:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729350487; x=1729955287;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KppUXjhEPV4r0T7yVwFFdc51/qjJ3J+VTbqN9GzY1Fk=;
 b=Zgv/l4xGU7iHWHC2BgiY0gz/p9+fDPRkAZCmIQ6QRLgVjjF/sezUlM/+lASAvvIuLu
 94/z3ZqrqOJBZb3aWk6dktcEFc3YaHC4bGJrkSpD80xMj+agGMMN/w05wFs+0zQIS6U+
 CIo+W6wwuFsLf7Z0QqOQukP1ENTbHZXWsvZvXefdpJJT797QCm+0bvzjV9Fbn8SdhaL3
 NVIbx/FwNKr7oShDSjjYKxITxh88AelA0EACt/94WmlxZ6ggmT/T0S0Oft+Ow4CLdMAD
 CeZs6k9sB8SMH7MLaMslmg73OQ3UcE5CvrtDP1k9uB7UokUqXI8WyvLn57QiDE66z7e1
 uL5Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVcph7qln96yalTdO99gLjalpqC2XjR2VTiDpkRCaG48kGIOChvXfVXpW/Rg4jac53Uj5ttPBtpsZA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzxCNDknyFQYjWlER3I3pFzOYa5aJp+K9Gc5hFG+KFw7XkNi8Wy
 OBEoL5vppfNj6xmJOx6bQKCjxId2eHntsE1Ys5agC5t8czROTtF9orZ2zpbVdnQ=
X-Google-Smtp-Source: AGHT+IHfuN9yXYwZRD9m9FElCO8Rm8H/NAl8EFvcAaN2rLyyiNXZLfyZo1b33lvNOw+mJZmqkOHmlA==
X-Received: by 2002:a05:6512:3094:b0:539:f539:73b2 with SMTP id
 2adb3069b0e04-53a15845c77mr1656864e87.12.1729350487213; 
 Sat, 19 Oct 2024 08:08:07 -0700 (PDT)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com.
 [209.85.208.180]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53a151b90d7sm554665e87.63.2024.10.19.08.08.06
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 19 Oct 2024 08:08:06 -0700 (PDT)
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-2fb5743074bso24106211fa.1
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Oct 2024 08:08:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXDQt9PqhSRAzhDy4xoHy4Ol//ptqVftb1ki9jJkOVpx9crr11kmeL6KDeiELzVk9Hs9gUoWCP0rqk=@lists.freedesktop.org
X-Received: by 2002:a2e:be07:0:b0:2fa:ce0d:ec34 with SMTP id
 38308e7fff4ca-2fb82b82228mr21240541fa.2.1729350485763; Sat, 19 Oct 2024
 08:08:05 -0700 (PDT)
MIME-Version: 1.0
References: <20241018-hdmi-mode-valid-v1-0-6e49ae4801f7@linaro.org>
In-Reply-To: <20241018-hdmi-mode-valid-v1-0-6e49ae4801f7@linaro.org>
From: Chen-Yu Tsai <wens@csie.org>
Date: Sat, 19 Oct 2024 23:07:53 +0800
X-Gmail-Original-Message-ID: <CAGb2v66vRDTJtQHKiGLV73Pep2PN7LHTZMRK8k+N0cseVWL6vQ@mail.gmail.com>
Message-ID: <CAGb2v66vRDTJtQHKiGLV73Pep2PN7LHTZMRK8k+N0cseVWL6vQ@mail.gmail.com>
Subject: Re: [PATCH 0/6] drm/display: hdmi: add drm_hdmi_connector_mode_valid()
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
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
Reply-To: wens@csie.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Oct 19, 2024 at 4:34=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> Several HDMI drivers have common code pice in the .mode_valid function
> that validates RGB / 8bpc rate using the TMDS char rate callbacks.
>
> Move this code piece to the common helper and remove the need to perform
> this check manually. In case of DRM_BRIDGE_OP_HDMI bridges the check can
> be dropped in favour of performing it in drm_bridge_connector.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Makes sense, code looks like a correct substitution, and AFAICT covers
all current in tree drivers.

Whole series is

Reviewed-by: Chen-Yu Tsai <wens@csie.org>

> ---
> Dmitry Baryshkov (6):
>       drm/display: hdmi: add generic mode_valid helper
>       drm/sun4i: use drm_hdmi_connector_mode_valid()
>       drm/vc4: use drm_hdmi_connector_mode_valid()
>       drm/display: bridge_connector: use drm_bridge_connector_mode_valid(=
)
>       drm/bridge: lontium-lt9611: drop TMDS char rate check in mode_valid
>       drm/bridge: dw-hdmi-qp: replace mode_valid with tmds_char_rate
>
>  drivers/gpu/drm/bridge/lontium-lt9611.c        |  4 +---
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c   | 12 +++++-------
>  drivers/gpu/drm/display/drm_bridge_connector.c | 16 +++++++++++++++-
>  drivers/gpu/drm/display/drm_hdmi_helper.c      | 25 ++++++++++++++++++++=
+++++
>  drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c         | 12 +-----------
>  drivers/gpu/drm/vc4/vc4_hdmi.c                 |  4 +---
>  include/drm/display/drm_hdmi_helper.h          |  4 ++++
>  7 files changed, 52 insertions(+), 25 deletions(-)
> ---
> base-commit: af44b5b5776cc6ac1891393a37b1424509f07b35
> change-id: 20241018-hdmi-mode-valid-aaec4428501c
>
> Best regards,
> --
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>
