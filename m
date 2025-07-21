Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8823B0C8EE
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jul 2025 18:38:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00DFF10E39D;
	Mon, 21 Jul 2025 16:38:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="GpZftqf9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A56210E39D
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jul 2025 16:38:37 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-3a4f379662cso3387394f8f.0
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jul 2025 09:38:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753115916; x=1753720716; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4uUOTIvoTJxFo89UBip1+cBZSnUVuP5x6V/Hb7NNPpE=;
 b=GpZftqf9j0AY4moDdp7oC//5nMcql76yYPEBlAv1sufsJvZYSdGdIrbH/CS13El5lm
 K64tFVR5NzUFTOcGKh+DGSHyWBWMVIzdzzPNPkDT6B6ozgxKbLEvrshvvw9OE2dLWPpo
 lwUmJr4Bo9N8M8sua1+Tc8RXPPLDjQzChvi78beB+kFdeW7NaS2c0ZNkEdPbYmTPKsqR
 yqpcIddU0BVPY9eRKHIpiS7GPWbs1n+BysMuK4fP+bQIxGdERRP3M5kjTZUTJ5JPvE8+
 VwyW+nk9ERpdQ0lZCPz5hvuzEilU5Zp8rujRi5j45w2nMQJnNK6qIaQhre8wzu//Aw5F
 UEkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753115916; x=1753720716;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4uUOTIvoTJxFo89UBip1+cBZSnUVuP5x6V/Hb7NNPpE=;
 b=fVGVh2Kdg1m1F8eq3YRnJO8ZZg5Com0HG+gsXvyum04vTfUUxIY6lgcwFAFuX50jUT
 vND1bNNBr2jrRRN7cWROKWQhBZhrSkEYDisZd5Qdgsg38pfIqM8SLGpCdk2kZD2cSpaU
 DGAa3ckyhpCjmMLI/FVfPvJodrUQMs05GGu6EXP+lwcSOLHXAURiAz83Hf1hHKRs8mJq
 Vz3uCBQwOeS0ciJJmxpEma5b0fiMpIvGVz8TRfSDn0G9i8CbtqzyUhQIdtTrf6+oj/6m
 4YdL2/SqAryKcaPL1myA18qvDcaVsIdElQ2mjm8/yWiTP19nnmZusaRb7Az1TtBatCt5
 jAtQ==
X-Gm-Message-State: AOJu0YyVzus9s9GsRmLyWMG0Gz1pOv2x787Bjfwgc1qZZjGXixcEY8Wp
 gKs3jl4L64mxUP4IWtXyGHE0VWvnMtvsRWNZAXHVUR1LQimyj9NDsd0YKzYWV9U7wSHb7bnELfD
 bhMsOVjkR97Dhocf6cYM5xAcLbCF4J20=
X-Gm-Gg: ASbGncvGBpsVduQGMxsRE1FlsCAbtlK/D7ZXdgCVx863ygT08Tts1AqRuw78es0GJ5N
 VNf7I1H2ltb+iVO4UmwTSTTtF16fLngV7xvwHoxKhNGcEMqGEhky0p5OEDs/erftz39HpTxopVl
 3ltOTlzo9BDm9/CFkIXPPbhrgMkFX/jdQB4cmVHr9TNgBuuhqGA0jj61+/o5b/WGF/8pRp0oQ1T
 L+SSP/R
X-Google-Smtp-Source: AGHT+IGlzn+4WfqAWOh8uTdl+e8On+3Kash2k8WlA3OHsyAZo5snlc+j9GV9vcvotImaJPaQSwEoqWJS7yqyO5z8XDg=
X-Received: by 2002:a05:6000:460b:b0:3a5:21c8:af31 with SMTP id
 ffacd0b85a97d-3b60e4c237emr14967601f8f.16.1753115915693; Mon, 21 Jul 2025
 09:38:35 -0700 (PDT)
MIME-Version: 1.0
References: <20250623081504.58622-1-clamor95@gmail.com>
In-Reply-To: <20250623081504.58622-1-clamor95@gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 21 Jul 2025 19:38:24 +0300
X-Gm-Features: Ac12FXwbnrdf-VhDMDnvkeKl4abpgx2aYEoEhRZtmyyVrTx_bhPpP6J_3HsgyAI
Message-ID: <CAPVz0n38N32HobYshtS9cLBJqWGPA1MZjMr0HH3C4UqGcFaFVA@mail.gmail.com>
Subject: Re: [PATCH v7 0/2] drm: bridge: add ssd2825 RGB/DSI bridge support
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Svyatoslav Ryhel <clamor95@gmail.com>
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

=D0=BF=D0=BD, 23 =D1=87=D0=B5=D1=80=D0=B2. 2025=E2=80=AF=D1=80. =D0=BE 11:1=
5 Svyatoslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Solomon SSD2825 is a RGB to MIPI DSI bridge used in LG Optimus 4D P880
> and LG Optimus Vu P895
>
> ---
> Changes on switching from v6 to v7:
> - removed enabled checks
> - configuration complete quirk moved from host_transfer to
>   atomic_enable
> - switched to devm_drm_bridge_alloc
> - removed redundant dev_set_drvdata use
>
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
>  .../display/bridge/solomon,ssd2825.yaml       | 141 ++++
>  drivers/gpu/drm/bridge/Kconfig                |  13 +
>  drivers/gpu/drm/bridge/Makefile               |   1 +
>  drivers/gpu/drm/bridge/ssd2825.c              | 775 ++++++++++++++++++
>  4 files changed, 930 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/solo=
mon,ssd2825.yaml
>  create mode 100644 drivers/gpu/drm/bridge/ssd2825.c
>
> --
> 2.48.1
>

Greetings!

These patches had no activity/feedback from maintainers for almost a
month, so, in case they got lost in the depths of email box, this is a
friendly reminder that they are still relevant and I would like them
to move on.

Best regards,
Svyatoslav R.
