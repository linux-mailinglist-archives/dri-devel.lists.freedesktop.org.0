Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8806AE0084
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jun 2025 10:54:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FB4110E0D9;
	Thu, 19 Jun 2025 08:54:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="iHW7YRq0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EFEF10E0D9
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jun 2025 08:54:25 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-3a57c8e247cso524256f8f.1
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jun 2025 01:54:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1750323264; x=1750928064; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2BgTuvT3u6AIqLm/PQRYt/22SDLcCwFXFs+qer6/yKE=;
 b=iHW7YRq0JklMEYRc+YH3pYUslA9jDLHgad/eMawddxG/OnUZHqXyZU2qO64D5SPx0n
 +q0ct1/f2IDPp4xadd2jFotHsj5vhmJxNqCc0b5yVasWVQdGL3kp7BNDE5+RnpTsF290
 HgPXYLuZK2qb4HUrVqNREA8C6DSUa63LMmAFDCQyv8jS/FOkipvfVD5KyXj0PNt89eYG
 Vci5au0XkjX9YMnT19xY3W1yTg87g+dpG3GFD/ZYoa0kv6mUrEGRdNH22As/RCmsiOoZ
 xG2MFNPdytDzKMTCVCcfEmib2xdZg7cd522uOUFzcIt/Ytj+CfFl82J9sERQP/bznNcB
 kb7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750323264; x=1750928064;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2BgTuvT3u6AIqLm/PQRYt/22SDLcCwFXFs+qer6/yKE=;
 b=kxk9h7Q80oM+p664fOZd7l9SFc0ts8VRVyn9e96i+Lu8+1U+8ERfWIySFe5zi7ulR2
 ARs3OjTTXnOJLEfoKZCi0dmF5RKw38NtupVGpLrN5Qd7oUojEw9FNURmtAlpU5PQx6IM
 g9p8hBmjVkiH2Fo0Sd0eD3ayF0arAqcNTErKG6otAsS15hO7ZbPJ33Pw6ddn8IycG64C
 2HPtsO0/YuxWsnPMmZiBfcKiGeaqEjvRMuwELNv3bNeYtR4X0HdeqzidvOr5afyR+Jo1
 h4z21ybRacJnRG1NOA2qGWWqhxpLrNp9ax1K7OpCa3UeZOB+zfhADVH9cQSeorBD+7UD
 YglA==
X-Gm-Message-State: AOJu0YzJF1TEbIo/CZq1KJ5vrxU3QmBzvF2BSfa7K2XJPnek3tlvDJxD
 +Dngk2fRkeaZjnIU/DK+I7tAeIbWetQIaXdrbTQrLGDMvBsVCiPWplMU4N7vwR8ENFrse8hoRZk
 gcFmKmwCyeS1D34KoZXfglD82Azz4ixs=
X-Gm-Gg: ASbGncveN0gvFkMWbcCmsL8UNvugEofsWLfwD1FdXEQU+/w9JpEXtNgG8A8RuWWOPBl
 B+yJUbmpJq69bL6m3j8QGUVW24M2V2bBk/zq6dbet2BLJq4g/eGTZ3UCM244HCR6okE7TCuHexb
 Z74d7LdSDtBwWyjKaT4JtxCRAyKz3jJV55NcP4kmxB22Ma
X-Google-Smtp-Source: AGHT+IEPcrAct2MvP6lMu67WHWgZkRHjbRH9x4L5SPSXZCedtmDIaEdykoVs3GdsAansa3lx+5kGChF4gR2TEuObCOU=
X-Received: by 2002:a05:6000:144f:b0:3a4:f72a:b18a with SMTP id
 ffacd0b85a97d-3a5723a197amr16822801f8f.26.1750323263687; Thu, 19 Jun 2025
 01:54:23 -0700 (PDT)
MIME-Version: 1.0
References: <20250526114353.12081-1-clamor95@gmail.com>
In-Reply-To: <20250526114353.12081-1-clamor95@gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Thu, 19 Jun 2025 11:54:12 +0300
X-Gm-Features: Ac12FXzaBC7401W2R75FUry1Dj9NV-cb1lVlcCWDqwkSkHUUU5xEZJLQ_IxV-to
Message-ID: <CAPVz0n3QJHBVbTvfW8A-4nTDmagEiav4iwiekFd-z2nQTvUegg@mail.gmail.com>
Subject: Re: [PATCH v6 0/2] drm: bridge: add ssd2825 RGB/DSI bridge support
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
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

=D0=BF=D0=BD, 26 =D1=82=D1=80=D0=B0=D0=B2. 2025=E2=80=AF=D1=80. =D0=BE 14:4=
4 Svyatoslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Solomon SSD2825 is a RGB to MIPI DSI bridge used in LG Optimus 4D P880
> and LG Optimus Vu P895
>
> ---
> Changes on switching from v5 to v6:
> - set correct module name in Kconfig help
> - return error if spi sync failed for reading
>
> Changes on switching from v4 to v5:
> - rebased on top of drm-misc-next with adjustments to fit
>
> Changes on switching from v3 to v4:
> - no changes, resend
>
> Changes on switching from v2 to v3:
> - added mutex guard
> - configuration register flags parametrized using panel flags
> - removed unneded debug messages
> - removed unimplemented modes checks
> - added check for maximum pixel row length
> - use types header
> - remove ssd2825_to_ns
> - shift bridge setup into atomic pre-enable
> - cleaned default values of hzd and hpd
>
> Changes on switching from v1 to v2:
> - added description for clock
> - removed clock-names
> - added boundries for hs-zero-delay-ns and hs-prep-delay-ns
> - added mutex lock for host transfers
> - converted to atomic ops
> - get drm_display_mode mode with atomic helpers
> - parameterized INTERFACE_CTRL_REG_6 configuration
> - added video mode validation and fixup
> - removed clock name
> - switched to devm_regulator_bulk_get_const
> - added default timings
> ---
>
> Svyatoslav Ryhel (2):
>   dt-bindings: display: bridge: Document Solomon SSD2825
>   drm: bridge: Add support for Solomon SSD2825 RGB/DSI bridge
>
>  .../display/bridge/solomon,ssd2825.yaml       | 141 +++
>  drivers/gpu/drm/bridge/Kconfig                |  13 +
>  drivers/gpu/drm/bridge/Makefile               |   1 +
>  drivers/gpu/drm/bridge/ssd2825.c              | 814 ++++++++++++++++++
>  4 files changed, 969 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/solo=
mon,ssd2825.yaml
>  create mode 100644 drivers/gpu/drm/bridge/ssd2825.c
>
> --
> 2.48.1
>

These patches had no activity/feedback from DRM maintainers for a
while, so, in case they got lost in the depths of email box, this is a
friendly reminder that they are still relevant and I would like them
to move on.

Best regards,
Svyatoslav R.
