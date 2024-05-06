Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC3B18BC7CC
	for <lists+dri-devel@lfdr.de>; Mon,  6 May 2024 08:49:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AA2910EDF5;
	Mon,  6 May 2024 06:49:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="tRFth89+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com
 [209.85.128.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8568D10F865
 for <dri-devel@lists.freedesktop.org>; Mon,  6 May 2024 06:49:15 +0000 (UTC)
Received: by mail-yw1-f176.google.com with SMTP id
 00721157ae682-61816fc256dso14849897b3.0
 for <dri-devel@lists.freedesktop.org>; Sun, 05 May 2024 23:49:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714978154; x=1715582954; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=w8noqLZ7rreQXY6bq7wOdAQ/j08jV52ZrD0dDyncfUM=;
 b=tRFth89+wuTSguaLahM6edqXhICmg1N4VhWd40gyfJRimbpHEpBFNPtm8jIfHt4x8F
 jL79m/7BxSmJY2nZQ71ihMfFd2R521VkVu2Ue0iXuTbm+k2OcYN1+Cbg4OIzyYg9eayE
 jPsf+VIv6QRqM3a+MH9fcvQvSgQkRhte8AI2FtWEsz9T3l0SgNQojfdNBdVvPPcfFzeD
 yzU9Z00lcequu4opJUZ8b3JIBPVdLy7fR19C8j/46gx/4n9zG9o9oo7yLZMIoWjGQIrz
 cQG+Y+zDaHkJ8lKnFTi9+XKa4NRSKz6qEHeZqY9TABGjWVDX69YcjKRRAWE11RfwiWi5
 WkUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714978154; x=1715582954;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=w8noqLZ7rreQXY6bq7wOdAQ/j08jV52ZrD0dDyncfUM=;
 b=kdqsMtpZri9l6JdcNhQT2v43csj1ZmHbjGDH+yqpwKvbpbEkDSZQek3gj5EHEHFKex
 5H4hzgn6jWZMcCpDpaDZh6Y9iGdZZ5jT/rY7aE4kD8SoQVsldV8bFZ7XKUI0gbGJHO8n
 oTSiQfnTlUJjAfxxxaiW8ZFb9bsQrfgYYq72G+5jskW1ekH+a9NlYeaVNHJofDxev3ht
 ukDIz+I0MIpKOJxSBwQGdYeVdp8sF+M4qcQnfj/1AoETJ/48JaibhNpcKSfmhPbHgKV/
 lVl91XekzoYpnUBbDDXMuvdOtEbDC2HF3Do+yM7TqDUVwJFKY+Vo6L/nfsFYMTnXtvi/
 ACZw==
X-Gm-Message-State: AOJu0Yyxz6ErMhtgGCvG+juYoYYeXPt343gwJTC0zxdhIHMNDtOlVtzd
 VL6XKBPF0U765yfVu4a2iMPo1JcR/Nfes9lXE2xpQT8mu5Cjz/Qk9ftdLXpSKLU/BUItV76vR8h
 cRL06L0nHEtW/pialJe9UM8TqQYnpA+JR2x2rbw==
X-Google-Smtp-Source: AGHT+IGTmTyx+2hxP484wZ1RDm/WIK4rLYQ/umGSZShmQj88zjWTJid5DVM66fAf4w/k7f8vI65YD102wVdQ0FL8qBw=
X-Received: by 2002:a81:ac13:0:b0:619:da17:87be with SMTP id
 k19-20020a81ac13000000b00619da1787bemr7931494ywh.42.1714978154440; Sun, 05
 May 2024 23:49:14 -0700 (PDT)
MIME-Version: 1.0
References: <20240503213441.177109-1-dianders@chromium.org>
 <20240503143327.RFT.v2.46.I6a51b36831a5c7b2b82bccf8c550cf0d076aa541@changeid>
In-Reply-To: <20240503143327.RFT.v2.46.I6a51b36831a5c7b2b82bccf8c550cf0d076aa541@changeid>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 6 May 2024 08:49:03 +0200
Message-ID: <CACRpkdarbyhZufTHy1m57rfVdMO9aqbgkoHfdhG3h0=RZTjV8g@mail.gmail.com>
Subject: Re: [RFT PATCH v2 46/48] drm/panel: sony-acx565akm: Don't
 double-check enabled state in disable
To: Douglas Anderson <dianders@chromium.org>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 Chris Morgan <macromorgan@hotmail.com>,
 Yuran Pereira <yuran.pereira@hotmail.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 David Airlie <airlied@gmail.com>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Sam Ravnborg <sam@ravnborg.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
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

On Fri, May 3, 2024 at 11:38=E2=80=AFPM Douglas Anderson <dianders@chromium=
.org> wrote:

> As talked about in commit d2aacaf07395 ("drm/panel: Check for already
> prepared/enabled in drm_panel"), we want to remove needless code from
> panel drivers that was storing and double-checking the
> prepared/enabled state. Even if someone was relying on the
> double-check before, that double-check is now in the core and not
> needed in individual drivers.
>
> The acx565akm seems to do some unique stuff with the "enabled"
> state. Specifically:
> 1. It seems to detect the enabled state based on how the bootloader
>    left the panel.
> 2. It uses the enabled state to prevent certain sysfs files from
>    accessing a disabled panel.
>
> We'll leave the "enabled" state tracking for this. However, we can at
> least get rid of the double-check when trying to disable.
>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Sebastian Reichel <sebastian.reichel@collabora.com>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
