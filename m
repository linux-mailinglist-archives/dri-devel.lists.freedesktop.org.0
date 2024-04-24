Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 777E18B14B3
	for <lists+dri-devel@lfdr.de>; Wed, 24 Apr 2024 22:38:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EBB810E72D;
	Wed, 24 Apr 2024 20:38:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="fP4GGcKI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C22B7112096
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Apr 2024 20:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1713991089;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=XDTh0qmoIv7uK+P2ENx3lpsm50voBME9+vMjJSuHrBo=;
 b=fP4GGcKI/dus5dSqH4ejg0YtbnW7wf6flOKBb4e8X7f9F+DWFpr2oJxXjkcUnU1q6UYVf9
 c0oLTqrwLWoopjPZPq5+5da5zwHLw8G/AeZoBDfxLepJCe1FpX++uJrGvIt3cESrfm8ROm
 JxgwViWMroGm6GVl1X264ZwhC84W6vg=
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-682-WM6utxVPO12T-1AWLfT85A-1; Wed, 24 Apr 2024 16:38:08 -0400
X-MC-Unique: WM6utxVPO12T-1AWLfT85A-1
Received: by mail-ot1-f72.google.com with SMTP id
 46e09a7af769-6ebc2b38641so385353a34.0
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Apr 2024 13:38:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713991087; x=1714595887;
 h=mime-version:user-agent:content-transfer-encoding:organization
 :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=996BeoYTjmZ9Jib0lWUI7Xv3M6l6XbkkYp9q6nbbWVk=;
 b=KGA/tXNhqZ96vR/Ydpx8HjU9t/8SEwz29F2MqN2UdgYJglYjjLzB5kXIwYJVFJp/7f
 En7Nma+z+f2qFZNTX3msBtdipwheSrlDS6HcXIg9ODrADQMqMjPq3q/uSjO/RtWxRei1
 SRSuRlw5yY4PUiZAp9IGRGvW4T1lhmR2DzIfMBCY6R7vivbxgJI6EG9MCA90vRFMJJtU
 QsqzrrIHlpekknuwR/NXCPgf4FtvdNWDdY6HgIoos8+N9/EXlvTDMXIIThmU6LnY/2cQ
 I0FH9tpkHdbnLztv63id3g4Awoch9fz26787PmA26NgeyHCzeDNTZUpX7JGx0QzgZa/W
 LunQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXnRavfG4n1gQ/yqsaM/SLPH8JZhqlktthBQSJMrL/juYNwV87C5UIlsmb1brm1TF2uMHoxid6/YfYemjvOvJvmD1bB+VkcjxzU7BGLXXGB
X-Gm-Message-State: AOJu0Yw3DWh7f2NSaPh0S+/ogMDSNH0kDYz89ItHtuDjijw2IcCnMyAQ
 80PbBzizfonOiJdrw9mWxCc+csF0uAioTI+fMCgyjt+Bom6fAuyqMqkx/BwjAhm3SCMogiHeqXr
 JjZ+sH8JsIDhOgFZL6KDTNSBGnKiMIbea9/fvq2MyxoWJ7MP1CpuWhpeogyeaKcuEPw==
X-Received: by 2002:a05:6359:1016:b0:183:fb12:39f6 with SMTP id
 ib22-20020a056359101600b00183fb1239f6mr4252720rwb.14.1713991087185; 
 Wed, 24 Apr 2024 13:38:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGlJI0nGbaoOQkKcVAypzIzTT0uBrkaeZ0ltwUpjjRG3c7U9qU1j6w2dkRyF0e8Q8ZD4q310g==
X-Received: by 2002:a05:6359:1016:b0:183:fb12:39f6 with SMTP id
 ib22-20020a056359101600b00183fb1239f6mr4252676rwb.14.1713991086697; 
 Wed, 24 Apr 2024 13:38:06 -0700 (PDT)
Received: from ?IPv6:2600:4040:5c6c:a300::789? ([2600:4040:5c6c:a300::789])
 by smtp.gmail.com with ESMTPSA id
 w20-20020ac87194000000b00439622fb8f4sm4670014qto.39.2024.04.24.13.38.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Apr 2024 13:38:06 -0700 (PDT)
Message-ID: <e39621c777f7bece1ec92b449b6a706b0b147594.camel@redhat.com>
Subject: Re: [PATCH 1/2] drm/print: drop include debugfs.h and include where
 needed
From: Lyude Paul <lyude@redhat.com>
To: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Maxime Ripard
 <mripard@kernel.org>,  Jacek Lawrynowicz
 <jacek.lawrynowicz@linux.intel.com>, Stanislaw Gruszka
 <stanislaw.gruszka@linux.intel.com>, Oded Gabbay <ogabbay@kernel.org>,
 Russell King <linux@armlinux.org.uk>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>,  Thomas Zimmermann
 <tzimmermann@suse.de>, Jani Nikula <jani.nikula@linux.intel.com>, Rodrigo
 Vivi <rodrigo.vivi@intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>,  Tvrtko Ursulin <tursulin@ursulin.net>,
 Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, Karol Herbst <kherbst@redhat.com>, Danilo
 Krummrich <dakr@redhat.com>, Alex Deucher <alexander.deucher@amd.com>,
 Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, Alain Volmat <alain.volmat@foss.st.com>,
 Huang Rui <ray.huang@amd.com>, Zack Rusin <zack.rusin@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Thomas =?ISO-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
 amd-gfx@lists.freedesktop.org
Date: Wed, 24 Apr 2024 16:38:04 -0400
In-Reply-To: <20240422121011.4133236-1-jani.nikula@intel.com>
References: <20240422121011.4133236-1-jani.nikula@intel.com>
Autocrypt: addr=lyude@redhat.com; prefer-encrypt=mutual;
 keydata=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
Organization: Red Hat Inc.
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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

For the nouveau bits:

Reviewed-by: Lyude Paul <lyude@redhat.com>

On Mon, 2024-04-22 at 15:10 +0300, Jani Nikula wrote:
> Surprisingly many places depend on debugfs.h to be included via
> drm_print.h. Fix them.
>=20
> v3: Also fix armada, ite-it6505, imagination, msm, sti, vc4, and xe
>=20
> v2: Also fix ivpu and vmwgfx
>=20
> Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
> Acked-by: Maxime Ripard <mripard@kernel.org>
> Link:
> https://patchwork.freedesktop.org/patch/msgid/20240410141434.157908-1-jan=
i.nikula@intel.com
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>=20
> ---
>=20
> Cc: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
> Cc: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
> Cc: Oded Gabbay <ogabbay@kernel.org>
> Cc: Russell King <linux@armlinux.org.uk>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Robert Foss <rfoss@kernel.org>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Tvrtko Ursulin <tursulin@ursulin.net>
> Cc: Frank Binns <frank.binns@imgtec.com>
> Cc: Matt Coster <matt.coster@imgtec.com>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: Sean Paul <sean@poorly.run>
> Cc: Marijn Suijten <marijn.suijten@somainline.org>
> Cc: Karol Herbst <kherbst@redhat.com>
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: Danilo Krummrich <dakr@redhat.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>
> Cc: Alain Volmat <alain.volmat@foss.st.com>
> Cc: Huang Rui <ray.huang@amd.com>
> Cc: Zack Rusin <zack.rusin@broadcom.com>
> Cc: Broadcom internal kernel review list
> <bcm-kernel-feedback-list@broadcom.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: "Thomas Hellstr=C3=B6m" <thomas.hellstrom@linux.intel.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: intel-gfx@lists.freedesktop.org
> Cc: intel-xe@lists.freedesktop.org
> Cc: linux-arm-msm@vger.kernel.org
> Cc: freedreno@lists.freedesktop.org
> Cc: nouveau@lists.freedesktop.org
> Cc: amd-gfx@lists.freedesktop.org
> ---
> =C2=A0drivers/accel/ivpu/ivpu_debugfs.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 ++
> =C2=A0drivers/gpu/drm/armada/armada_debugfs.c=C2=A0=C2=A0=C2=A0=C2=A0 | 1=
 +
> =C2=A0drivers/gpu/drm/bridge/ite-it6505.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 1 +
> =C2=A0drivers/gpu/drm/bridge/panel.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 ++
> =C2=A0drivers/gpu/drm/drm_print.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 6 +++---
> =C2=A0drivers/gpu/drm/i915/display/intel_dmc.c=C2=A0=C2=A0=C2=A0 | 1 +
> =C2=A0drivers/gpu/drm/imagination/pvr_fw_trace.c=C2=A0 | 1 +
> =C2=A0drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 2 ++
> =C2=A0drivers/gpu/drm/nouveau/dispnv50/crc.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 | 2 ++
> =C2=A0drivers/gpu/drm/radeon/r100.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 1 +
> =C2=A0drivers/gpu/drm/radeon/r300.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 1 +
> =C2=A0drivers/gpu/drm/radeon/r420.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 1 +
> =C2=A0drivers/gpu/drm/radeon/r600.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 3 ++-
> =C2=A0drivers/gpu/drm/radeon/radeon_fence.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 | 1 +
> =C2=A0drivers/gpu/drm/radeon/radeon_gem.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 1 +
> =C2=A0drivers/gpu/drm/radeon/radeon_ib.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | 2 ++
> =C2=A0drivers/gpu/drm/radeon/radeon_pm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | 1 +
> =C2=A0drivers/gpu/drm/radeon/radeon_ring.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 2 ++
> =C2=A0drivers/gpu/drm/radeon/radeon_ttm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 1 +
> =C2=A0drivers/gpu/drm/radeon/rs400.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 1 +
> =C2=A0drivers/gpu/drm/radeon/rv515.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 1 +
> =C2=A0drivers/gpu/drm/sti/sti_drv.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 1 +
> =C2=A0drivers/gpu/drm/ttm/ttm_device.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 1 +
> =C2=A0drivers/gpu/drm/ttm/ttm_resource.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | 3 ++-
> =C2=A0drivers/gpu/drm/ttm/ttm_tt.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 5 +++--
> =C2=A0drivers/gpu/drm/vc4/vc4_drv.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 1 +
> =C2=A0drivers/gpu/drm/vmwgfx/vmwgfx_gem.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 2 ++
> =C2=A0drivers/gpu/drm/xe/xe_debugfs.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 1 +
> =C2=A0drivers/gpu/drm/xe/xe_gt_debugfs.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | 2 ++
> =C2=A0drivers/gpu/drm/xe/xe_uc_debugfs.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | 2 ++
> =C2=A0include/drm/drm_print.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 | 2 +-
> =C2=A031 files changed, 46 insertions(+), 8 deletions(-)
>=20
> diff --git a/drivers/accel/ivpu/ivpu_debugfs.c
> b/drivers/accel/ivpu/ivpu_debugfs.c
> index d09d29775b3f..e07e447d08d1 100644
> --- a/drivers/accel/ivpu/ivpu_debugfs.c
> +++ b/drivers/accel/ivpu/ivpu_debugfs.c
> @@ -3,6 +3,8 @@
> =C2=A0 * Copyright (C) 2020-2023 Intel Corporation
> =C2=A0 */
> =C2=A0
> +#include <linux/debugfs.h>
> +
> =C2=A0#include <drm/drm_debugfs.h>
> =C2=A0#include <drm/drm_file.h>
> =C2=A0#include <drm/drm_print.h>
> diff --git a/drivers/gpu/drm/armada/armada_debugfs.c
> b/drivers/gpu/drm/armada/armada_debugfs.c
> index 29f4b52e3c8d..a763349dd89f 100644
> --- a/drivers/gpu/drm/armada/armada_debugfs.c
> +++ b/drivers/gpu/drm/armada/armada_debugfs.c
> @@ -5,6 +5,7 @@
> =C2=A0 */
> =C2=A0
> =C2=A0#include <linux/ctype.h>
> +#include <linux/debugfs.h>
> =C2=A0#include <linux/module.h>
> =C2=A0#include <linux/seq_file.h>
> =C2=A0#include <linux/uaccess.h>
> diff --git a/drivers/gpu/drm/bridge/ite-it6505.c
> b/drivers/gpu/drm/bridge/ite-it6505.c
> index 27334173e911..3f68c82888c2 100644
> --- a/drivers/gpu/drm/bridge/ite-it6505.c
> +++ b/drivers/gpu/drm/bridge/ite-it6505.c
> @@ -3,6 +3,7 @@
> =C2=A0 * Copyright (c) 2020, The Linux Foundation. All rights reserved.
> =C2=A0 */
> =C2=A0#include <linux/bits.h>
> +#include <linux/debugfs.h>
> =C2=A0#include <linux/delay.h>
> =C2=A0#include <linux/device.h>
> =C2=A0#include <linux/err.h>
> diff --git a/drivers/gpu/drm/bridge/panel.c
> b/drivers/gpu/drm/bridge/panel.c
> index 7f41525f7a6e..32506524d9a2 100644
> --- a/drivers/gpu/drm/bridge/panel.c
> +++ b/drivers/gpu/drm/bridge/panel.c
> @@ -4,6 +4,8 @@
> =C2=A0 * Copyright (C) 2017 Broadcom
> =C2=A0 */
> =C2=A0
> +#include <linux/debugfs.h>
> +
> =C2=A0#include <drm/drm_atomic_helper.h>
> =C2=A0#include <drm/drm_bridge.h>
> =C2=A0#include <drm/drm_connector.h>
> diff --git a/drivers/gpu/drm/drm_print.c
> b/drivers/gpu/drm/drm_print.c
> index 699b7dbffd7b..cf2efb44722c 100644
> --- a/drivers/gpu/drm/drm_print.c
> +++ b/drivers/gpu/drm/drm_print.c
> @@ -23,13 +23,13 @@
> =C2=A0 * Rob Clark <robdclark@gmail.com>
> =C2=A0 */
> =C2=A0
> -#include <linux/stdarg.h>
> -
> +#include <linux/debugfs.h>
> +#include <linux/dynamic_debug.h>
> =C2=A0#include <linux/io.h>
> =C2=A0#include <linux/moduleparam.h>
> =C2=A0#include <linux/seq_file.h>
> =C2=A0#include <linux/slab.h>
> -#include <linux/dynamic_debug.h>
> +#include <linux/stdarg.h>
> =C2=A0
> =C2=A0#include <drm/drm.h>
> =C2=A0#include <drm/drm_drv.h>
> diff --git a/drivers/gpu/drm/i915/display/intel_dmc.c
> b/drivers/gpu/drm/i915/display/intel_dmc.c
> index 3697a02b51b6..09346afd1f0e 100644
> --- a/drivers/gpu/drm/i915/display/intel_dmc.c
> +++ b/drivers/gpu/drm/i915/display/intel_dmc.c
> @@ -22,6 +22,7 @@
> =C2=A0 *
> =C2=A0 */
> =C2=A0
> +#include <linux/debugfs.h>
> =C2=A0#include <linux/firmware.h>
> =C2=A0
> =C2=A0#include "i915_drv.h"
> diff --git a/drivers/gpu/drm/imagination/pvr_fw_trace.c
> b/drivers/gpu/drm/imagination/pvr_fw_trace.c
> index 31199e45b72e..73707daa4e52 100644
> --- a/drivers/gpu/drm/imagination/pvr_fw_trace.c
> +++ b/drivers/gpu/drm/imagination/pvr_fw_trace.c
> @@ -12,6 +12,7 @@
> =C2=A0
> =C2=A0#include <linux/build_bug.h>
> =C2=A0#include <linux/dcache.h>
> +#include <linux/debugfs.h>
> =C2=A0#include <linux/sysfs.h>
> =C2=A0#include <linux/types.h>
> =C2=A0
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> index 0bf8a83e8df3..8586f2761782 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> @@ -2,6 +2,8 @@
> =C2=A0/* Copyright (c) 2015-2018, The Linux Foundation. All rights
> reserved.
> =C2=A0 */
> =C2=A0
> +#include <linux/debugfs.h>
> +
> =C2=A0#include "dpu_hwio.h"
> =C2=A0#include "dpu_hw_catalog.h"
> =C2=A0#include "dpu_hw_lm.h"
> diff --git a/drivers/gpu/drm/nouveau/dispnv50/crc.c
> b/drivers/gpu/drm/nouveau/dispnv50/crc.c
> index 9c942fbd836d..5936b6b3b15d 100644
> --- a/drivers/gpu/drm/nouveau/dispnv50/crc.c
> +++ b/drivers/gpu/drm/nouveau/dispnv50/crc.c
> @@ -1,5 +1,7 @@
> =C2=A0// SPDX-License-Identifier: MIT
> +#include <linux/debugfs.h>
> =C2=A0#include <linux/string.h>
> +
> =C2=A0#include <drm/drm_crtc.h>
> =C2=A0#include <drm/drm_atomic_helper.h>
> =C2=A0#include <drm/drm_vblank.h>
> diff --git a/drivers/gpu/drm/radeon/r100.c
> b/drivers/gpu/drm/radeon/r100.c
> index 86b8b770af19..0b1e19345f43 100644
> --- a/drivers/gpu/drm/radeon/r100.c
> +++ b/drivers/gpu/drm/radeon/r100.c
> @@ -26,6 +26,7 @@
> =C2=A0 *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Jerome Gli=
sse
> =C2=A0 */
> =C2=A0
> +#include <linux/debugfs.h>
> =C2=A0#include <linux/firmware.h>
> =C2=A0#include <linux/module.h>
> =C2=A0#include <linux/pci.h>
> diff --git a/drivers/gpu/drm/radeon/r300.c
> b/drivers/gpu/drm/radeon/r300.c
> index 25201b9a5aae..1620f534f55f 100644
> --- a/drivers/gpu/drm/radeon/r300.c
> +++ b/drivers/gpu/drm/radeon/r300.c
> @@ -26,6 +26,7 @@
> =C2=A0 *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Jerome Gli=
sse
> =C2=A0 */
> =C2=A0
> +#include <linux/debugfs.h>
> =C2=A0#include <linux/pci.h>
> =C2=A0#include <linux/seq_file.h>
> =C2=A0#include <linux/slab.h>
> diff --git a/drivers/gpu/drm/radeon/r420.c
> b/drivers/gpu/drm/radeon/r420.c
> index eae8a6389f5e..a979662eaa73 100644
> --- a/drivers/gpu/drm/radeon/r420.c
> +++ b/drivers/gpu/drm/radeon/r420.c
> @@ -26,6 +26,7 @@
> =C2=A0 *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Jerome Gli=
sse
> =C2=A0 */
> =C2=A0
> +#include <linux/debugfs.h>
> =C2=A0#include <linux/pci.h>
> =C2=A0#include <linux/seq_file.h>
> =C2=A0#include <linux/slab.h>
> diff --git a/drivers/gpu/drm/radeon/r600.c
> b/drivers/gpu/drm/radeon/r600.c
> index b5e97d95a19f..087d41e370fd 100644
> --- a/drivers/gpu/drm/radeon/r600.c
> +++ b/drivers/gpu/drm/radeon/r600.c
> @@ -26,11 +26,12 @@
> =C2=A0 *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Jerome Gli=
sse
> =C2=A0 */
> =C2=A0
> +#include <linux/debugfs.h>
> =C2=A0#include <linux/firmware.h>
> =C2=A0#include <linux/module.h>
> =C2=A0#include <linux/pci.h>
> -#include <linux/slab.h>
> =C2=A0#include <linux/seq_file.h>
> +#include <linux/slab.h>
> =C2=A0
> =C2=A0#include <drm/drm_device.h>
> =C2=A0#include <drm/drm_vblank.h>
> diff --git a/drivers/gpu/drm/radeon/radeon_fence.c
> b/drivers/gpu/drm/radeon/radeon_fence.c
> index 9ebe4a0b9a6c..4fb780d96f32 100644
> --- a/drivers/gpu/drm/radeon/radeon_fence.c
> +++ b/drivers/gpu/drm/radeon/radeon_fence.c
> @@ -30,6 +30,7 @@
> =C2=A0 */
> =C2=A0
> =C2=A0#include <linux/atomic.h>
> +#include <linux/debugfs.h>
> =C2=A0#include <linux/firmware.h>
> =C2=A0#include <linux/kref.h>
> =C2=A0#include <linux/sched/signal.h>
> diff --git a/drivers/gpu/drm/radeon/radeon_gem.c
> b/drivers/gpu/drm/radeon/radeon_gem.c
> index 3fec3acdaf28..2ef201a072f1 100644
> --- a/drivers/gpu/drm/radeon/radeon_gem.c
> +++ b/drivers/gpu/drm/radeon/radeon_gem.c
> @@ -26,6 +26,7 @@
> =C2=A0 *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Jerome Gli=
sse
> =C2=A0 */
> =C2=A0
> +#include <linux/debugfs.h>
> =C2=A0#include <linux/iosys-map.h>
> =C2=A0#include <linux/pci.h>
> =C2=A0
> diff --git a/drivers/gpu/drm/radeon/radeon_ib.c
> b/drivers/gpu/drm/radeon/radeon_ib.c
> index fb9ecf5dbe2b..63d914f3414d 100644
> --- a/drivers/gpu/drm/radeon/radeon_ib.c
> +++ b/drivers/gpu/drm/radeon/radeon_ib.c
> @@ -27,6 +27,8 @@
> =C2=A0 *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Christian =
K=C3=B6nig
> =C2=A0 */
> =C2=A0
> +#include <linux/debugfs.h>
> +
> =C2=A0#include <drm/drm_file.h>
> =C2=A0
> =C2=A0#include "radeon.h"
> diff --git a/drivers/gpu/drm/radeon/radeon_pm.c
> b/drivers/gpu/drm/radeon/radeon_pm.c
> index 4482c8c5f5ce..2d9d9f46f243 100644
> --- a/drivers/gpu/drm/radeon/radeon_pm.c
> +++ b/drivers/gpu/drm/radeon/radeon_pm.c
> @@ -21,6 +21,7 @@
> =C2=A0 *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Alex Deuch=
er <alexdeucher@gmail.com>
> =C2=A0 */
> =C2=A0
> +#include <linux/debugfs.h>
> =C2=A0#include <linux/hwmon-sysfs.h>
> =C2=A0#include <linux/hwmon.h>
> =C2=A0#include <linux/pci.h>
> diff --git a/drivers/gpu/drm/radeon/radeon_ring.c
> b/drivers/gpu/drm/radeon/radeon_ring.c
> index 38048593bb4a..8d1d458286a8 100644
> --- a/drivers/gpu/drm/radeon/radeon_ring.c
> +++ b/drivers/gpu/drm/radeon/radeon_ring.c
> @@ -27,6 +27,8 @@
> =C2=A0 *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Christian =
K=C3=B6nig
> =C2=A0 */
> =C2=A0
> +#include <linux/debugfs.h>
> +
> =C2=A0#include <drm/drm_device.h>
> =C2=A0#include <drm/drm_file.h>
> =C2=A0
> diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c
> b/drivers/gpu/drm/radeon/radeon_ttm.c
> index 2078b0000e22..5c65b6dfb99a 100644
> --- a/drivers/gpu/drm/radeon/radeon_ttm.c
> +++ b/drivers/gpu/drm/radeon/radeon_ttm.c
> @@ -30,6 +30,7 @@
> =C2=A0 *=C2=A0=C2=A0=C2=A0 Dave Airlie
> =C2=A0 */
> =C2=A0
> +#include <linux/debugfs.h>
> =C2=A0#include <linux/dma-mapping.h>
> =C2=A0#include <linux/pagemap.h>
> =C2=A0#include <linux/pci.h>
> diff --git a/drivers/gpu/drm/radeon/rs400.c
> b/drivers/gpu/drm/radeon/rs400.c
> index d7f552d441ab..d4d1501e6576 100644
> --- a/drivers/gpu/drm/radeon/rs400.c
> +++ b/drivers/gpu/drm/radeon/rs400.c
> @@ -26,6 +26,7 @@
> =C2=A0 *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Jerome Gli=
sse
> =C2=A0 */
> =C2=A0
> +#include <linux/debugfs.h>
> =C2=A0#include <linux/seq_file.h>
> =C2=A0#include <linux/slab.h>
> =C2=A0
> diff --git a/drivers/gpu/drm/radeon/rv515.c
> b/drivers/gpu/drm/radeon/rv515.c
> index 79709d26d983..bbc6ccabf788 100644
> --- a/drivers/gpu/drm/radeon/rv515.c
> +++ b/drivers/gpu/drm/radeon/rv515.c
> @@ -26,6 +26,7 @@
> =C2=A0 *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Jerome Gli=
sse
> =C2=A0 */
> =C2=A0
> +#include <linux/debugfs.h>
> =C2=A0#include <linux/seq_file.h>
> =C2=A0#include <linux/slab.h>
> =C2=A0
> diff --git a/drivers/gpu/drm/sti/sti_drv.c
> b/drivers/gpu/drm/sti/sti_drv.c
> index 4bab93c4fefd..1799c12babf5 100644
> --- a/drivers/gpu/drm/sti/sti_drv.c
> +++ b/drivers/gpu/drm/sti/sti_drv.c
> @@ -5,6 +5,7 @@
> =C2=A0 */
> =C2=A0
> =C2=A0#include <linux/component.h>
> +#include <linux/debugfs.h>
> =C2=A0#include <linux/dma-mapping.h>
> =C2=A0#include <linux/kernel.h>
> =C2=A0#include <linux/module.h>
> diff --git a/drivers/gpu/drm/ttm/ttm_device.c
> b/drivers/gpu/drm/ttm/ttm_device.c
> index 76027960054f..434cf0258000 100644
> --- a/drivers/gpu/drm/ttm/ttm_device.c
> +++ b/drivers/gpu/drm/ttm/ttm_device.c
> @@ -27,6 +27,7 @@
> =C2=A0
> =C2=A0#define pr_fmt(fmt) "[TTM DEVICE] " fmt
> =C2=A0
> +#include <linux/debugfs.h>
> =C2=A0#include <linux/mm.h>
> =C2=A0
> =C2=A0#include <drm/ttm/ttm_bo.h>
> diff --git a/drivers/gpu/drm/ttm/ttm_resource.c
> b/drivers/gpu/drm/ttm/ttm_resource.c
> index be8d286513f9..4a66b851b67d 100644
> --- a/drivers/gpu/drm/ttm/ttm_resource.c
> +++ b/drivers/gpu/drm/ttm/ttm_resource.c
> @@ -22,8 +22,9 @@
> =C2=A0 * Authors: Christian K=C3=B6nig
> =C2=A0 */
> =C2=A0
> -#include <linux/iosys-map.h>
> +#include <linux/debugfs.h>
> =C2=A0#include <linux/io-mapping.h>
> +#include <linux/iosys-map.h>
> =C2=A0#include <linux/scatterlist.h>
> =C2=A0
> =C2=A0#include <drm/ttm/ttm_bo.h>
> diff --git a/drivers/gpu/drm/ttm/ttm_tt.c
> b/drivers/gpu/drm/ttm/ttm_tt.c
> index 578a7c37f00b..474fe7aad2a0 100644
> --- a/drivers/gpu/drm/ttm/ttm_tt.c
> +++ b/drivers/gpu/drm/ttm/ttm_tt.c
> @@ -32,10 +32,11 @@
> =C2=A0#define pr_fmt(fmt) "[TTM] " fmt
> =C2=A0
> =C2=A0#include <linux/cc_platform.h>
> -#include <linux/sched.h>
> -#include <linux/shmem_fs.h>
> +#include <linux/debugfs.h>
> =C2=A0#include <linux/file.h>
> =C2=A0#include <linux/module.h>
> +#include <linux/sched.h>
> +#include <linux/shmem_fs.h>
> =C2=A0#include <drm/drm_cache.h>
> =C2=A0#include <drm/drm_device.h>
> =C2=A0#include <drm/drm_util.h>
> diff --git a/drivers/gpu/drm/vc4/vc4_drv.h
> b/drivers/gpu/drm/vc4/vc4_drv.h
> index ab61e96e7e14..08e29fa82563 100644
> --- a/drivers/gpu/drm/vc4/vc4_drv.h
> +++ b/drivers/gpu/drm/vc4/vc4_drv.h
> @@ -5,6 +5,7 @@
> =C2=A0#ifndef _VC4_DRV_H_
> =C2=A0#define _VC4_DRV_H_
> =C2=A0
> +#include <linux/debugfs.h>
> =C2=A0#include <linux/delay.h>
> =C2=A0#include <linux/of.h>
> =C2=A0#include <linux/refcount.h>
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c
> b/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c
> index 2132a8ad8c0c..07185c108218 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c
> @@ -30,6 +30,8 @@
> =C2=A0#include "drm/drm_prime.h"
> =C2=A0#include "drm/drm_gem_ttm_helper.h"
> =C2=A0
> +#include <linux/debugfs.h>
> +
> =C2=A0static void vmw_gem_object_free(struct drm_gem_object *gobj)
> =C2=A0{
> =C2=A0=09struct ttm_buffer_object *bo =3D drm_gem_ttm_of_gem(gobj);
> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c
> b/drivers/gpu/drm/xe/xe_debugfs.c
> index c9b30dbdc14d..0b7aebaae843 100644
> --- a/drivers/gpu/drm/xe/xe_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
> @@ -5,6 +5,7 @@
> =C2=A0
> =C2=A0#include "xe_debugfs.h"
> =C2=A0
> +#include <linux/debugfs.h>
> =C2=A0#include <linux/string_helpers.h>
> =C2=A0
> =C2=A0#include <drm/drm_debugfs.h>
> diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c
> b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> index ff7f4cf52fa9..8cf0b2625efc 100644
> --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> @@ -5,6 +5,8 @@
> =C2=A0
> =C2=A0#include "xe_gt_debugfs.h"
> =C2=A0
> +#include <linux/debugfs.h>
> +
> =C2=A0#include <drm/drm_debugfs.h>
> =C2=A0#include <drm/drm_managed.h>
> =C2=A0
> diff --git a/drivers/gpu/drm/xe/xe_uc_debugfs.c
> b/drivers/gpu/drm/xe/xe_uc_debugfs.c
> index 0a39ec5a6e99..78eb8db73791 100644
> --- a/drivers/gpu/drm/xe/xe_uc_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_uc_debugfs.c
> @@ -3,6 +3,8 @@
> =C2=A0 * Copyright =C2=A9 2022 Intel Corporation
> =C2=A0 */
> =C2=A0
> +#include <linux/debugfs.h>
> +
> =C2=A0#include <drm/drm_debugfs.h>
> =C2=A0
> =C2=A0#include "xe_gt.h"
> diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
> index 9cc473e5d353..561c3b96b6fd 100644
> --- a/include/drm/drm_print.h
> +++ b/include/drm/drm_print.h
> @@ -30,11 +30,11 @@
> =C2=A0#include <linux/printk.h>
> =C2=A0#include <linux/seq_file.h>
> =C2=A0#include <linux/device.h>
> -#include <linux/debugfs.h>
> =C2=A0#include <linux/dynamic_debug.h>
> =C2=A0
> =C2=A0#include <drm/drm.h>
> =C2=A0
> +struct debugfs_regset32;
> =C2=A0struct drm_device;
> =C2=A0
> =C2=A0/* Do *not* use outside of drm_print.[ch]! */

--=20
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

