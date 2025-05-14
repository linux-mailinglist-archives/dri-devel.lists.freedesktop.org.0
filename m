Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4574BAB6DE9
	for <lists+dri-devel@lfdr.de>; Wed, 14 May 2025 16:16:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC9DF10E0CF;
	Wed, 14 May 2025 14:16:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Osm6mulV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
 [209.85.210.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D64A510E0CF;
 Wed, 14 May 2025 14:16:17 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id
 d2e1a72fcca58-739ab4447c7so903640b3a.0; 
 Wed, 14 May 2025 07:16:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747232177; x=1747836977; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+9l/yJokrJezdTMly2gEBI61HIpT790BZH9nQ/918eA=;
 b=Osm6mulVBOLFDIEcuq03S+W62QxZY9v9JVZFiwf0gOiG/SKnuA0ALRn/T1iAq3+lWJ
 eYgG6FI5jnkGAfpB1OVNPeeo9Enzd76pRx7LJfTYV/UrbrMwQwYAxgDo8S4vX7S4IaNk
 fYRQROr0J7jS7eDdkr9XU3Hyi1IpxBc+YjfWIKYAJaO0j64hJvA+2dFskyN9tjGJdt5w
 GJyIdoPZOJhBueiQ5eIrrHKIsEfJZ6kGqMXwP+GfXLjl8dMAfFjF5wz8U4q886dSWJ1i
 N/zvsv5rvSxZ2Wqwxv0fGWMKb3zDglmGueYyjlys5HmBtY9egMUP7wCiVs5n5FK74F60
 JuJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747232177; x=1747836977;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+9l/yJokrJezdTMly2gEBI61HIpT790BZH9nQ/918eA=;
 b=ECmuRbltJkak+5mO2ZuDV1m59EPwW7Rt7OJ6d8APpwGKXvk+QlmFtlBVhtYRmkhZbB
 MBzD+kBjXho655VnwrzKBVAAatJme5hnIK72kUekBPAs4HDzq3haiwz4yapHhsyXj4Z6
 J8TraDgsQkBQjjfudwjIAaDshpfDGpO/A8VgEEZHWi/EOJaeySL4mOq1dEfasc0+EoLA
 RWwQkT/TZCotrjO3W8GKLG/UsK+KWF7yZ0F1T29TO0ugiWu+vYPd7r8XCIPROptqwlKt
 WR/d4RseacNPjus3irua3hqkyZCUHBS8bT38CL+oNtxr8+MZ0RUXVtPO1owU+DZaOreg
 sYLw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVVxdX17lqd7NUi+fZyGW6i15r7VxDgYv6Fmqsa9z5n0jV6qX3KYgdrXLgOWU1SXvMXeZrKDWwX@lists.freedesktop.org,
 AJvYcCVfEN4Kun1A/0NAvtMzt83oSc4WxvhMgg3dZghLQjjbh8kOJrQzGQcy8hTVRG4jcpaqY61cETGn43vl@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywd70fjZQhE/nklYBF11HKuGtrwOo80STdA6yfNGF+ibXJSRgme
 nYqeQoYweiT9DLNFPvxXBKy/VNyKPfpPn38/Y6Ob6W4lsdEekAeBrYq3I0E5P929AtBppXBg3Kx
 +YrQUMpIlC8XjSEcBYFWg2x3VwMQ=
X-Gm-Gg: ASbGncuv/kr8rdoTx37APfGRdFlCuJo8O9aEJoMqMIbSJthVLx0ucPx5KDT2ZuwAQHK
 +DE+AvNYxJ3MBXHTERCJhJeWuy0go2tZ55O13BdEZ9lzHUKAUi0K5tbhD2/cV4Xt19CKxFofC5X
 opGmArToITOx909kz1Ol38EEw9+0F/tdUe
X-Google-Smtp-Source: AGHT+IHtKxU0GEGaAeLVg/+ec50sLA3k6YKoCWcfCuiQT8vSKq7Gdewqx4zLExHIkduOo2EYU8VEwV70WujGnLmeMn0=
X-Received: by 2002:a17:903:248:b0:215:435d:b41a with SMTP id
 d9443c01a7336-231980ce4d3mr20167045ad.1.1747232177142; Wed, 14 May 2025
 07:16:17 -0700 (PDT)
MIME-Version: 1.0
References: <20250513234621.322283-1-Abdelrahmanfekry375@gmail.com>
In-Reply-To: <20250513234621.322283-1-Abdelrahmanfekry375@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 14 May 2025 10:16:05 -0400
X-Gm-Features: AX0GCFvNZ6---Ox_xhZShkODoC-fkTW8iHJut3_i8L0kz1QSIWvS7bGXMuWlPGI
Message-ID: <CADnq5_MAYSH0Cj6pfZFdPx8b_goJRFEeB61iW6bD_wON-GWxzg@mail.gmail.com>
Subject: Re: [PATCH] drm/amd: fix kernel-doc parameter tag format
To: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
Cc: alexander.deucher@amd.com, christian.koenig@amd.com, airlied@gmail.com, 
 simona@ffwll.ch, skhan@linuxfoundation.org, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-kernel-mentees@lists.linux.dev
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

On Wed, May 14, 2025 at 3:31=E2=80=AFAM Abdelrahman Fekry
<abdelrahmanfekry375@gmail.com> wrote:
>
> The DC_HDCP_LC_ENABLE_SW_FALLBACK enum comment was missing the required
> colon after the parameter name in its kernel-doc tag:
>
>   * @DC_HDCP_LC_ENABLE_SW_FALLBACK If set, ...
>
> Kernel-doc insists on the form @name: description. Adding the colon
> eliminates the warning and ensures consistent extraction into Sphinx
> documentation. No functional changes are made.
>
> Signed-off-by: Abdelrahman Fekry <Abdelrahmanfekry375@gmail.com>

Thanks for the patch, but this was already fixed.

Alex

> ---
>  drivers/gpu/drm/amd/include/amd_shared.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/include/amd_shared.h b/drivers/gpu/drm/a=
md/include/amd_shared.h
> index 4c95b885d1d0..c8eccee9b023 100644
> --- a/drivers/gpu/drm/amd/include/amd_shared.h
> +++ b/drivers/gpu/drm/amd/include/amd_shared.h
> @@ -366,7 +366,7 @@ enum DC_DEBUG_MASK {
>         DC_HDCP_LC_FORCE_FW_ENABLE =3D 0x80000,
>
>         /**
> -        * @DC_HDCP_LC_ENABLE_SW_FALLBACK If set, upon HDCP Locality Chec=
k FW
> +        * @DC_HDCP_LC_ENABLE_SW_FALLBACK: If set, upon HDCP Locality Che=
ck FW
>          * path failure, retry using legacy SW path.
>          */
>         DC_HDCP_LC_ENABLE_SW_FALLBACK =3D 0x100000,
> --
> 2.25.1
>
