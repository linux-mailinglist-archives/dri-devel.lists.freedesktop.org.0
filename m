Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA78A99D64B
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2024 20:19:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E248410E499;
	Mon, 14 Oct 2024 18:19:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="EG55Nuz2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E37D10E499;
 Mon, 14 Oct 2024 18:19:44 +0000 (UTC)
Received: by mail-pj1-f43.google.com with SMTP id
 98e67ed59e1d1-2e2e31aacbbso339225a91.2; 
 Mon, 14 Oct 2024 11:19:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728929984; x=1729534784; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tlrhKCqXu/xpOnojqdm6kWdO4bmpewu3VF9AXfLijTA=;
 b=EG55Nuz2L+pMRNnOGNK9s8IqkZ6s7IIx5XgCFNg84HIyUEI3iQnmm5EdAitAeRnprj
 7UnqE6Tcu85IAa6e0lprcuq2mNgt5YTRIkCuHFi9Fap81DdnyzcQCwzr7cLDdwDoxRJg
 tIMKJJwB1gj9Z/NdXO0R0AB/QHh9IgtQby51/iLUUUfWmSbLPOB7olcioOkC0icS3GkI
 dP4487u4aZi51z9usju+5Prnd3W4ABvRW6yDe0RcX6MZGSOG5bck+v1h6QwL3ulJFfGM
 Y4XQQwIM0yrlBQrCj+jHaIgW1wxyTGDWLbbdr1J4JUeGXJgNt4O0gKvdxYsIYaabQtKN
 ZYiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728929984; x=1729534784;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tlrhKCqXu/xpOnojqdm6kWdO4bmpewu3VF9AXfLijTA=;
 b=qZPfDcPg63Q2AjbCP5pODgzPyNXGDrXR47dYM0OVqWEDIVn7KXpXmSjbryi/t0ZJd3
 Yp3EAf5FiNLzXUzpURVYD7m/gxPibBRi6Yjz9XGPvCT1y2O2+dCq5xnT81cv2UnXDIfB
 Oqu9N+jyzPyZ6WFrxHrrppp+jT0LuoL4X9/CtVybCB8pyePkaVwkZfrhQgDGom5k4X6p
 7v9qLdqjnFNlhgNrX3GoT/25XOsYpw8Rs7Pe+8/EtHLi/VeOxbcdEEduGkbJHcsbLlRs
 DMDhlkWKjgsJppYGL284EARLKZ7Nl4DC2NOJbgwgMrUsEOZ38iDXhGUabd99GEE0Vlqf
 RQAg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXKAqvDhuYHKJnAtMcCtFsWIUfBBqXbqY69pMd6VYcDWNUkHD3oGZtnMZacuMir4suUQt3seIp0@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxFpIA8JrICbc6nlTJCAHg3MS1UCd1EZ6+4mLzQdgqJUq9KVONm
 dUeTzRIl+WQJo/P6iRmH7dC3daciZV3u2MU9l2nctUcNHJ6eHT8NUFamHSwsBfOanGqEbeqvPf3
 zhio9o0+fdRSKnFIJ36II/oOuH6Y=
X-Google-Smtp-Source: AGHT+IHz0iYoNTcR1BPpqWsDc3FeBO9AltozaLKVpLoMJEAcNfz/mFfR4VRrHwFIkXcZ3pqnMjtZLIyHmENWpfVvvgE=
X-Received: by 2002:a17:90b:1d01:b0:2e3:1af7:6ead with SMTP id
 98e67ed59e1d1-2e31af76f40mr4526897a91.5.1728929983645; Mon, 14 Oct 2024
 11:19:43 -0700 (PDT)
MIME-Version: 1.0
References: <20241014160936.24886-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20241014160936.24886-1-ville.syrjala@linux.intel.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 14 Oct 2024 14:19:31 -0400
Message-ID: <CADnq5_NCf4JyP0nVVB0PZrpZa3iJWtV-S1rCfHtM45hgKpEOCg@mail.gmail.com>
Subject: Re: [PATCH] drm/radeon: Fix encoder->possible_clones
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>, 
 amd-gfx@lists.freedesktop.org, stable@vger.kernel.org, 
 Erhard Furtner <erhard_f@mailbox.org>
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

Applied.  Thanks!

Alex

On Mon, Oct 14, 2024 at 12:09=E2=80=AFPM Ville Syrjala
<ville.syrjala@linux.intel.com> wrote:
>
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> Include the encoder itself in its possible_clones bitmask.
> In the past nothing validated that drivers were populating
> possible_clones correctly, but that changed in commit
> 74d2aacbe840 ("drm: Validate encoder->possible_clones").
> Looks like radeon never got the memo and is still not
> following the rules 100% correctly.
>
> This results in some warnings during driver initialization:
> Bogus possible_clones: [ENCODER:46:TV-46] possible_clones=3D0x4 (full enc=
oder mask=3D0x7)
> WARNING: CPU: 0 PID: 170 at drivers/gpu/drm/drm_mode_config.c:615 drm_mod=
e_config_validate+0x113/0x39c
> ...
>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: amd-gfx@lists.freedesktop.org
> Cc: stable@vger.kernel.org
> Fixes: 74d2aacbe840 ("drm: Validate encoder->possible_clones")
> Reported-by: Erhard Furtner <erhard_f@mailbox.org>
> Closes: https://lore.kernel.org/dri-devel/20241009000321.418e4294@yea/
> Tested-by: Erhard Furtner <erhard_f@mailbox.org>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---
>  drivers/gpu/drm/radeon/radeon_encoders.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/radeon/radeon_encoders.c b/drivers/gpu/drm/r=
adeon/radeon_encoders.c
> index 0f723292409e..fafed331e0a0 100644
> --- a/drivers/gpu/drm/radeon/radeon_encoders.c
> +++ b/drivers/gpu/drm/radeon/radeon_encoders.c
> @@ -43,7 +43,7 @@ static uint32_t radeon_encoder_clones(struct drm_encode=
r *encoder)
>         struct radeon_device *rdev =3D dev->dev_private;
>         struct radeon_encoder *radeon_encoder =3D to_radeon_encoder(encod=
er);
>         struct drm_encoder *clone_encoder;
> -       uint32_t index_mask =3D 0;
> +       uint32_t index_mask =3D drm_encoder_mask(encoder);
>         int count;
>
>         /* DIG routing gets problematic */
> --
> 2.45.2
>
