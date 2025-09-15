Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C16C5B57B0F
	for <lists+dri-devel@lfdr.de>; Mon, 15 Sep 2025 14:32:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E29010E47C;
	Mon, 15 Sep 2025 12:31:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fooishbar.org header.i=@fooishbar.org header.b="KaTzUjiR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 015D410E47E
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 12:31:58 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id
 98e67ed59e1d1-323266d6f57so4677393a91.0
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 05:31:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar.org; s=google; t=1757939518; x=1758544318;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=knTNCoPdWg2pHCztUfEQ8k7yWdqtvYzIJewGisE0oL4=;
 b=KaTzUjiRfhEFNmHldF0fDCi7n1gAoEa5tP8Yq5DOU2pYbsaVRfylyuf45ka0gLSZex
 8AMqtLa1AxAlcVvbw+vp0AT4ptlNWEOF1weFduYRiQ1EdD5ihb9qf1+FRv8Jq0o98eAA
 olxKYs939Hrq8NzAjP/sBRNSXiadaGQAgrYd7Sh1nvsKDAmO6E/rkkrUfLWYeLB/5z5b
 DFzZuWj7zb6C1RIyO8opSgEYLocL5YnDrJa4cjYioUbRi90SwGFuhiLC8CrEXHrgRzF8
 hUpqrWz4W5NxQj2iDVfboVfnRpTEvWh+QY9UFnFMpxRvVR60FJPhlIass/fAyR6hWzfa
 Nl4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757939518; x=1758544318;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=knTNCoPdWg2pHCztUfEQ8k7yWdqtvYzIJewGisE0oL4=;
 b=vmUtI3LmbaXzpzmYZDW6MFGiFXEJQonZbLL3SAwBxQK988qkOcb5vOFYaAya9tOhsk
 c1IJJxJ7w4ygxZ/LzicaSK1H204KV0HdyGuuHVU/8PzyNmE898r+OQH9qhcp3SHl/zX2
 zrzmhsnGMqqC03Pk4rAJ/JmRQQRotAsZ5wLCa8+CQkSnvLboyZph7wHp0bGVeYYO3WgE
 m6OsVg116B8kZ7uEzolCQtpSGhtiMMQdFJkspw7zBVkYow3OijnF+dHmEwcOACKV4MsZ
 Qd2cbSp5cTaKbALk4YDvK4wVNwNlAZioFRbNjW/JnFTyW4enNNOMyazftFFurey+9PGc
 686Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCX30YcoKGmqg+S4o7D2Q4UzemszT2DvnbeX5DF3hdGriIQsHNToPMn7qW/hCPUZUmxR4K1BZpc4KvM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx0B9sgUut+l5cRusmTNW0zZE1NvsIkLbgPl590Af4d8tcoKa+a
 fi3feUw0TCFybPyQ3UTUi/ArE10IfJJqwiGaLUWHR/mCodkgUB1fYW/9sz9yKhBgeQqZ9AeEYRy
 BstoE4xEr9OLiv2s0m3dYkO8NjRaymCdbXdXT+PEg6w==
X-Gm-Gg: ASbGncv4Waz120JReQiIKyAnXqRA6ytHYqC8QqVKr4Xqi3T6AA8LKezm+zK2awzDa0C
 GKOVzS7eXyOJ6uQEYsoLDmYBsZob1qvaruRV96XLs9F4a1YSEV7sZb4uZtWGKslr5wIWGYcC6zy
 Js2fdWqbKUMKYyxf+J7gmLQl80g4HSmrifTC0igenmXviaFcooHeIAAIDq2lFgWqNvHDEkNKDOt
 OCSuIPBHdSh96IbmodqhQSd0JBh3bRNX6GZYzuUbIBsmppEyJHk
X-Google-Smtp-Source: AGHT+IH/frGLEtZ7ZHZnQY/5z33pxs75DFZAWxPCVhbB4mB21NkvYviO2w4jUhkbFFY8+vXiW0ByKtS6YODahX8cUnM=
X-Received: by 2002:a17:90b:4c4d:b0:32e:32e4:9785 with SMTP id
 98e67ed59e1d1-32e32e49ff9mr6355901a91.6.1757939518184; Mon, 15 Sep 2025
 05:31:58 -0700 (PDT)
MIME-Version: 1.0
References: <20250822-mtk-post-blend-color-pipeline-v1-0-a9446d4aca82@collabora.com>
 <20250822-mtk-post-blend-color-pipeline-v1-1-a9446d4aca82@collabora.com>
 <CAPj87rPAoD2D99zTdsvJ=9K8+G17mTS2jDYHMPYmXNtUyp2L_Q@mail.gmail.com>
 <CAFZQkGwotQ6cxVCSgp-BhUi5DaZ7MyVvbnrDJW11Z7ztzqy58g@mail.gmail.com>
 <CAPj87rMTOD3_tC70QX4xz3G4zdG=tmwt5VgPhq6jNyf8bbW49Q@mail.gmail.com>
 <269ca85a59f613568543f45867fba7e604cc9f11.camel@collabora.com>
In-Reply-To: <269ca85a59f613568543f45867fba7e604cc9f11.camel@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Mon, 15 Sep 2025 13:31:45 +0100
X-Gm-Features: Ac12FXx-lR_XqhTnyAEupBeFxl6WMTjW6Kcjw5_GSL4qiK2IHfeaMNkbyUCiheY
Message-ID: <CAPj87rMhsFy+uzKmNecrQG4e+BEoeX1FyEobO7bnHdQqhy1_2Q@mail.gmail.com>
Subject: Re: [PATCH RFC 1/5] drm: Support post-blend color pipeline API
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Cc: Xaver Hugl <xaver.hugl@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Alex Hung <alex.hung@amd.com>, 
 wayland-devel@lists.freedesktop.org, harry.wentland@amd.com, leo.liu@amd.com, 
 ville.syrjala@linux.intel.com, pekka.paalanen@collabora.com, 
 contact@emersion.fr, mwen@igalia.com, jadahl@redhat.com, 
 sebastian.wick@redhat.com, shashank.sharma@amd.com, agoins@nvidia.com, 
 joshua@froggi.es, mdaenzer@redhat.com, aleixpol@kde.org, 
 victoria@system76.com, uma.shankar@intel.com, quic_naseer@quicinc.com, 
 quic_cbraga@quicinc.com, quic_abhinavk@quicinc.com, marcan@marcan.st, 
 Liviu.Dudau@arm.com, sashamcintosh@google.com, 
 chaitanya.kumar.borah@intel.com, louis.chauvet@bootlin.com, mcanal@igalia.com, 
 kernel@collabora.com, daniels@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, Simona Vetter <simona.vetter@ffwll.ch>
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

Hi N=C3=ADcolas,

On Wed, 3 Sept 2025 at 19:43, N=C3=ADcolas F. R. A. Prado
<nfraprado@collabora.com> wrote:
> On Tue, 2025-08-26 at 13:25 +0100, Daniel Stone wrote:
> Based on this discussion, this is my understanding for the changes
> desired on the series and their reasonings:
>
> 1. Add a driver cap, DRM_CAP_POST_BLEND_COLOR_PIPELINE, which drivers
> will use to signal they support post-blend color pipelines.
>   - Reason: Allow userspace to figure out that the driver doesn't
> support post-blend color pipelines and choose to not set the client
> cap, DRM_CLIENT_CAP_POST_BLEND_COLOR_PIPELINE, so it can use legacy
> color management instead.
> 2. Make it so setting the client cap,
> DRM_CLIENT_CAP_POST_BLEND_COLOR_PIPELINE, fails if the driver cap,
> DRM_CAP_POST_BLEND_COLOR_PIPELINE, isn't set
>   - Reason: Prevent userspace from making color management unusable if
> the driver doesn't support post-blend color pipelines, as the legacy
> color-management properties (GAMMA_LUT, DEGAMMA_LUT, CTM) would be
> unwriteable with the client cap set.

Definitely.

> 3. Make legacy color-management properties (GAMMA_LUT, DEGAMMA_LUT,
> CTM) read-only if the client cap,
> DRM_CLIENT_CAP_POST_BLEND_COLOR_PIPELINE, is set
>   - Reason: Allow drm_info to print legacy color management
> configuration while still enabling post-blend color pipelines through
> the client cap. Also to allow smooth handover from pre-colorop
> userspace client to colorop-ready userspace client, as the latter can
> now replicate the legacy color configuration through the colorops.

I think yes, but I don't really feel strongly about this. If others
involved have stronger opinions, I'm happy to yield.

> Side note: Smooth handover back to pre-colorop userspace after tweaking
> the colorops to something else would not be possible without making the
> legacy properties writable too, so that the client could update them to
> match the colorops setting before switching back. I don't imagine this
> would be a common use case, and colorops are a superset of the legacy
> properties so there are cases where it wouldn't even be possible to
> replicate the colorop setting on the legacy properties, but thought I'd
> mention this limitation for completeness' sake.

That's a totally acceptable tradeoff. We don't have a standard
inter-client capability handshake, so if downgrading from a
newer/more-capable to an older/less-capable client is a bit janky,
that's OK. There's only so much we can do given the original design
decision for the KMS core to not be opinionated about a 'golden state'
that could be used as a reference for userspace to work from as a
base.

> Also, as Xaver noted, this feedback also applies to pre-blend pipelines
> and its legacy color-management properties (COLOR_ENCODING,
> COLOR_RANGE), so the same changes would be desirable there for the same
> reasons. So we should share this feedback on that series as well.

Yep.

Cheers,
Daniel
