Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oayKCDo6k2kG2wEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 16:39:38 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E99E145B43
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 16:39:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BC3710E081;
	Mon, 16 Feb 2026 15:39:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="nGfvKh91";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BFB010E08D
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Feb 2026 15:39:31 +0000 (UTC)
Received: by mail-dl1-f48.google.com with SMTP id
 a92af1059eb24-1244bce2c17so158869c88.1
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Feb 2026 07:39:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771256371; cv=none;
 d=google.com; s=arc-20240605;
 b=M8UetDe+GLOU6oPyY+d6TJUEjce8cw2x88Ye1+3rE4e6G+kOvKUgsecEE0g/JftcH0
 6OSBe60tv+IZviBDYf32lCADpvmTNTPlPcY5RZpCtplIvaoqhpsj2TWivgAjP1emfLpj
 jMIey6exoeIDP/oA/rsyLCjiqMYX10GyPe8jaB9jG2uNVgPYVSwouwrjvbbHE+CurtCE
 8WC6MWI5iCZLX1JQHbuDnmZZ7GdEmOQnNggsIOudMth/mn2lyGXc7J9FzwaoZhk0eYVd
 CzcgB07nMaQiOI+EmQfWMutwNCPM5zslfUVPDH7ozOOsXyZCz/8mxHjPbn96DscU5M0J
 KZ4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=Ob2CEqEmP3Zi8vE7TSabzak1pONCQRxWk1dG5MIku6s=;
 fh=qgQ6Ekx2sOgnJviNC5UGuoXilImIGK3cNXF/oDOLYSs=;
 b=SPhdXzHlKj8T0I0n9Aqr9MjxpI4Wrq/UywfiobMeDqNaKBx8sKQeTv3I8+iOiNszUf
 JArJ+2KSqfso9JPRI5/XDSOExftVkQFc2jm410+1oJ4q60onf/SlJv/RBsihN0BiiFLu
 FKSq66vwUr2BXBu7zYG49Z/ymvZgg9QwFSUAf3fsBhprLjD/9FQAI6ge2MHUwzaFSrr5
 5fXjdcIytUUYHllF+FWPvnro+7KiPQDpelAaORkpL43mO5ox4kS58/HJ9lSwO3Rw0GXf
 DdX+GmuN4K/vqdKraqLxBeNvSMsyBnRLzdYOTKfCEDjW6eDD0NqhCw7qwJBTHf0AUHxg
 8ApA==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771256371; x=1771861171; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ob2CEqEmP3Zi8vE7TSabzak1pONCQRxWk1dG5MIku6s=;
 b=nGfvKh91gQfq/IWoQ1Prrg95JK2gQY0fh50p7nQoQJ3zib8zhjDjniQevucGj90KFz
 VtKyQrlf+eAowa2YkU1OpUQyHG55kkjjMehdLQnPKevKuqMY0/Jd0G4uqiVVJEXpK2cy
 uFVxKK4/7JAqMBAWzsnrMJNDgnIQdRprTYzUsztNXC+z4K2jtShFfajWwynX9Iz3jizd
 jz0L20OsddF1z5e6IuYnQZCpIhU5T56by1w5qSu6xAXWfD2oEUbeDHa1zeR5YDijAjou
 xG0gSHcPp2WkmTiZoYA5sYU79E5UOD2M8Gc0dhAGGFLiXPJhRXeyzjU6rE9zEGblgn+9
 bnKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771256371; x=1771861171;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Ob2CEqEmP3Zi8vE7TSabzak1pONCQRxWk1dG5MIku6s=;
 b=X4tSHg+s0AdJ9lHYgepekLY0TvGXhc+RzIvhbhERcxjzSZQ+w7R51TLdz8PbK8SY6h
 oT/lAukhrQL0uQ+x554VcAxMC3sQns1YiqLEM8imB6OUf3uci/m6yHCyDiJ8yVXCInRq
 gT6E0+zon7GrWLp+0QMFGRQrumYyz02iInS9nnEJjOy+uCEpgPDGPtmDVuJMSzIoarHe
 xArG78wHpLE17fOu2LMAIFLBHt1VkxNncO431HY/EjW4HYGwuBkULR9MdHcMvG+2WaXG
 cwZtASOH0ZUNQdlUrsYiGgVydt/m3ykBC9OKVQkyy+9IAGF5E6bWZi2coW5CwrO7szGS
 pg8Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWqP9lIo5Z843blQV77TeRIjqR5bhIDKz2F/uv/WcY4FJdt0nlK0zC6KkPdOO0NA0o36UUp/uWNoEo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy5xcucxb7UHN0EuNlYNc7MU8R1Q8/cnt2R7CWPqGhfjXkeiJpW
 uhO2Wn00kWv2Rx/BsjLH1eicDURmeEi1lLhGxcotJoIgkLV1EtHaZH9GYyPVxvZDbMVti0Ncnnh
 uBTyfUsq3bU3se/MznbA7mSIL1YwrqPA=
X-Gm-Gg: AZuq6aLa3dXnDst4kP0hsbNXW5uAwwnE1z9pRc8UEipzVDu4uSRh0byktw9P60pa46T
 iLhe5KAN5kc5aPHLb4Bz1tpqty0VEvC4p0DX2kW7yESkzNOShPK7+xiaKWWjGSB5xGPywjt+IGL
 cADTsl/a3pZYxYgEaNVbo3LqSBqxYCnKylcesyoKGqVRzUE3qb3tVcVnrL9oRv50vLBVPuEv22u
 izBhShN/TfDyTkbgJzs/Al8m6vNMKg0XBqCYjNe4rIouQ2GjL6eb3x22FJeNWxY7mwWjKu4kwT0
 c+ZDekV5NOjY2FzS5iAOwOYVMDw7JnBzAJcGNbENxO7T1D4oYtxw1GkCDL7EJ63AsfTjlw==
X-Received: by 2002:a05:7022:b93:b0:127:2d87:f0fa with SMTP id
 a92af1059eb24-127398117bemr2871932c88.4.1771256370330; Mon, 16 Feb 2026
 07:39:30 -0800 (PST)
MIME-Version: 1.0
References: <20260206223828.33061-1-mario.kleiner.de@gmail.com>
In-Reply-To: <20260206223828.33061-1-mario.kleiner.de@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 16 Feb 2026 10:39:18 -0500
X-Gm-Features: AaiRm52EOYj-okIlSlxWKrJwP9FVULI7wkjN1UPMFdj7PbYikOnQP0p8sKBPk_M
Message-ID: <CADnq5_Nbm7i+b2ykCrYBXJLha3ow74PWVQ_8hVmB=Btim2Jdew@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Use same max plane scaling limits for
 all 64 bpp formats
To: Mario Kleiner <mario.kleiner.de@gmail.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 Alex Deucher <alexander.deucher@amd.com>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:mario.kleiner.de@gmail.com,m:amd-gfx@lists.freedesktop.org,m:alexander.deucher@amd.com,m:harry.wentland@amd.com,m:sunpeng.li@amd.com,m:mariokleinerde@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[alexdeucher@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCPT_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexdeucher@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 4E99E145B43
X-Rspamd-Action: no action

Applied.  Thanks!

Alex

On Fri, Feb 6, 2026 at 5:39=E2=80=AFPM Mario Kleiner <mario.kleiner.de@gmai=
l.com> wrote:
>
> The plane scaling hw seems to have the same min/max plane scaling limits
> for all 16 bpc / 64 bpp interleaved pixel color formats.
>
> Therefore add cases to amdgpu_dm_plane_get_min_max_dc_plane_scaling() for
> all the 16 bpc fixed-point / unorm formats to use the same .fp16
> up/downscaling factor limits as used by the fp16 floating point formats.
>
> So far, 16 bpc unorm formats were not handled, and the default: path
> returned max/min factors for 32 bpp argb8888 formats, which were wrong
> and bigger than what many DCE / DCN hw generations could handle.
>
> The result sometimes was misscaling of framebuffers with
> DRM_FORMAT_XRGB16161616, DRM_FORMAT_ARGB16161616, DRM_FORMAT_XBGR16161616=
,
> DRM_FORMAT_ABGR16161616, leading to very wrong looking display, as tested
> on Polaris11 / DCE-11.2.
>
> So far this went unnoticed, because only few userspace clients used such
> 16 bpc unorm framebuffers, and those didn't use hw plane scaling, so they
> did not experience this issue.
>
> With upcoming Mesa 26 exposing 16 bpc unorm formats under both OpenGL
> and Vulkan under Wayland, and the upcoming GNOME 50 Mutter Wayland
> compositor allowing for direct scanout of these formats, the scaling
> hw will be used on these formats if possible for HiDPI display scaling,
> so it is important to use the correct hw scaling limits to avoid wrong
> display.
>
> Tested on AMD Polaris 11 / DCE 11.2 with upcoming Mesa 26 and GNOME 50
> on HiDPI displays with scaling enabled. The mutter Wayland compositor now
> correctly falls back to scaling via desktop compositing instead of direct
> scanout, thereby avoiding wrong image display. For unscaled mode, it
> correctly uses direct scanout.
>
> Fixes: 580204038f5b ("drm/amd/display: Enable support for 16 bpc fixed-po=
int framebuffers.")
> Signed-off-by: Mario Kleiner <mario.kleiner.de@gmail.com>
> Tested-by: Mario Kleiner <mario.kleiner.de@gmail.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Leo Li <sunpeng.li@amd.com>
> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c b/dr=
ivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> index d3e62f511c8f..394880ec1078 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> @@ -1060,10 +1060,15 @@ static void amdgpu_dm_plane_get_min_max_dc_plane_=
scaling(struct drm_device *dev,
>                 *min_downscale =3D plane_cap->max_downscale_factor.nv12;
>                 break;
>
> +       /* All 64 bpp formats have the same fp16 scaling limits */
>         case DRM_FORMAT_XRGB16161616F:
>         case DRM_FORMAT_ARGB16161616F:
>         case DRM_FORMAT_XBGR16161616F:
>         case DRM_FORMAT_ABGR16161616F:
> +       case DRM_FORMAT_XRGB16161616:
> +       case DRM_FORMAT_ARGB16161616:
> +       case DRM_FORMAT_XBGR16161616:
> +       case DRM_FORMAT_ABGR16161616:
>                 *max_upscale =3D plane_cap->max_upscale_factor.fp16;
>                 *min_downscale =3D plane_cap->max_downscale_factor.fp16;
>                 break;
> --
> 2.43.0
>
