Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1573DC4E24F
	for <lists+dri-devel@lfdr.de>; Tue, 11 Nov 2025 14:38:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43DC410E077;
	Tue, 11 Nov 2025 13:38:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="EKwWEEww";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E9EC10E077
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Nov 2025 13:38:24 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-47777000dadso20067345e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Nov 2025 05:38:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762868303; x=1763473103; darn=lists.freedesktop.org;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=GrwdyoxI2lUALNY0TRANh662eC4IKDTitbT7pD9E+gE=;
 b=EKwWEEwwkUwelNVO+Nu7eLx/Zxa6N7qg5fQVV2wu2OwhcBaYSWylexvB3atBTmMKtR
 l5BYHoNXxUJKXtBrUN9VUdJpodOCyNsXS6Pm0QPkuoP+VCGPZFgAiVuZ7H20IdkrT1MM
 NyoZ1SHEZU6sby5eyXYaB4emXARKNB0hDukhjAfr6+AibR6t5Fot73YzfT73RqqPtdVj
 we1SBNBuEp+BZoaoUNFxjfEnR2DkAAAyAT0xJpWWQYHvsFsDlOEStcJ7oNrWncvyZqur
 3um48Uea/YflUBzj+u0zvdFgd7R0jVo4qJiW13eM7b90M7P+mIqeNoErF2bRAjyxWEKF
 zPew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762868303; x=1763473103;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GrwdyoxI2lUALNY0TRANh662eC4IKDTitbT7pD9E+gE=;
 b=rVChf6NstSc50qzvd/DoySHJqOXGMxtlrQzFQ4Uya5lE2ugWB8EMY94TJH3McDEI7K
 vRdoaq+hRjO3oxhilih667ZckuOiXSFIB6ARz/y21g4mg5eWlyFalBm1MYnRoA3y7toS
 GX7O3GrfklE0DuUxaMpZ/DUuDC+TUBuNWaZWbTPbiazUs37mo4JzNFgrUgV05n8/Kz37
 veuD5yKuVimYWhkSFmZmGilOsarBTy2RyxCb/Wi+Y2dEXAnsHYMRP5DP4qsSvUoEVp87
 k8b3pBg1gKmnEQFz4l/GutPFmjo+bv13Kp2yybeVXOUcGNzI+vAKLSKJ3iv/iL76xpb1
 LRnQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX3xGlVe6VtvoIy4usxclNOotxltcB6am3cMjAOOepftLMwWk3NC2OsQPpFpNYB/zfmMYYGthQwPDo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyzhZSXOmihvVdtpVM+LxCU8/H+wlcAaRjw0Eft8pZckdGdn3j4
 fZKreSKMEJxFrm6LdbUvqfjQnD+msitai/ONAsdnUHlebcNzaFLPK9t0
X-Gm-Gg: ASbGncvbitWrxYghYrU+z59+ff9Zy1/Y6yHsQ50DBTQX06pnr+UiB/T1GdHgCUrxD2O
 5D5+fLjJx8z8wDj7R43tNdguvgbCaOgf1Dy9rCpGZWEg39ucqc43slfmtnwYRx1Xl44+T2uyQ39
 XWhhwFQo8Dmkls0U2PN13AstM7a0x3xu7hlK3RaG7BmFDNAcInegNZw6zliN7eYSwUwA8YiuNZi
 gyi1duPwrh9GWj//2SalSyzqpHncOLD92+qHnh2gwW6UOViNiqyZ8An2eUEhSz7u2zhmMMdW1W+
 +2CjYQCnmZOmMDdxtWdjIlvoiF/D5rHfe1kmVNbUAY3xI7esHEQFZ5OMqfEq9mo5f3lsAZSry+i
 ARMot/nn0vT0wbTK8aLW8xXAG754ZS6pmXNnj4zLP0DFgCi0nRgRecPyGouWFvYaGVf9Fqc88fV
 jItC8NiOe4eJWWXp5udkegiuRZIeiLa+D8Ly8CIRk/rdQhJFBX/xsc
X-Google-Smtp-Source: AGHT+IHxdICTtfr47guR8kd1BuuHAytzu5/NoRm9sPjURe0K3ZBg2j5w6eGHi02CQPOhU0gaerumoQ==
X-Received: by 2002:a05:600c:4583:b0:477:19b7:d3c0 with SMTP id
 5b1f17b1804b1-4777322d955mr107093375e9.2.1762868302753; 
 Tue, 11 Nov 2025 05:38:22 -0800 (PST)
Received: from ?IPv6:2001:4c4e:24e1:af00:ca8b:1d2c:125:e560?
 ([2001:4c4e:24e1:af00:ca8b:1d2c:125:e560])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47781d4a91esm19273035e9.4.2025.11.11.05.38.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Nov 2025 05:38:21 -0800 (PST)
Message-ID: <e8d330e5262e7db6b2be739f849849307f873555.camel@gmail.com>
Subject: Re: [PATCH v7 04/15] drm/amd/display: use drm_edid helper to set
 analog EDID caps
From: Timur =?ISO-8859-1?Q?Krist=F3f?= <timur.kristof@gmail.com>
To: Melissa Wen <mwen@igalia.com>, Harry Wentland <harry.wentland@amd.com>, 
 Alex Hung <alex.hung@amd.com>, Mario Limonciello
 <mario.limonciello@amd.com>, Rodrigo Siqueira	 <siqueira@igalia.com>,
 airlied@gmail.com, alexander.deucher@amd.com, 	andrzej.hajda@intel.com,
 christian.koenig@amd.com, jernej.skrabec@gmail.com, 	jonas@kwiboo.se,
 Laurent.pinchart@ideasonboard.com, 	maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, neil.armstrong@linaro.org, 	rfoss@kernel.org,
 simona@ffwll.ch, sunpeng.li@amd.com, tzimmermann@suse.de
Cc: Michel Daenzer <michel.daenzer@mailbox.org>, Jani Nikula
 <jani.nikula@linux.intel.com>, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
Date: Tue, 11 Nov 2025 14:38:18 +0100
In-Reply-To: <20251106165536.161662-5-mwen@igalia.com>
References: <20251106165536.161662-1-mwen@igalia.com>
 <20251106165536.161662-5-mwen@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
MIME-Version: 1.0
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

On Thu, 2025-11-06 at 13:49 -0300, Melissa Wen wrote:
> Use drm_edid_is_digital helper instead of open-coded mask.
>=20
> Signed-off-by: Melissa Wen <mwen@igalia.com>

Thanks for catching this, I was not aware of this helper.

Reviewed-by: Timur Krist=C3=B3f <timur.kristof@gmail.com>

> ---
> =C2=A0drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git
> a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> index 7d05cff08233..05e5f51b0a90 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> @@ -135,7 +135,7 @@ enum dc_edid_status dm_helpers_parse_edid_caps(
> =C2=A0	edid_caps->serial_number =3D
> le32_to_cpu(product_id.serial_number);
> =C2=A0	edid_caps->manufacture_week =3D
> product_id.week_of_manufacture;
> =C2=A0	edid_caps->manufacture_year =3D
> product_id.year_of_manufacture;
> -	edid_caps->analog =3D !(edid_buf->input &
> DRM_EDID_INPUT_DIGITAL);
> +	edid_caps->analog =3D !drm_edid_is_digital(drm_edid);
> =C2=A0
> =C2=A0	drm_edid_get_monitor_name(edid_buf,
> =C2=A0				=C2=A0 edid_caps->display_name,
