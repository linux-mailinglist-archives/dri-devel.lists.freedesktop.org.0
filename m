Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ACC9A9F77C
	for <lists+dri-devel@lfdr.de>; Mon, 28 Apr 2025 19:38:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76BE210E21C;
	Mon, 28 Apr 2025 17:38:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="AD59N9vb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com
 [209.85.215.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D08B10E21C;
 Mon, 28 Apr 2025 17:38:33 +0000 (UTC)
Received: by mail-pg1-f177.google.com with SMTP id
 41be03b00d2f7-af9a6958a08so719754a12.1; 
 Mon, 28 Apr 2025 10:38:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1745861912; x=1746466712; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XxdH2HBKv26bS3K+JOBUm6gBKxa8LnfYwhAZCtP8Xlo=;
 b=AD59N9vb5OrtR0MCBph9/qyJeiT2+vCOVbFL3yJG1PKe0x/2mw2kGMevP4/U4lGnU8
 VhhwqrVOreg5i6SiQ0eKYhaCTYSfKxEN0PU1yeAR6Rn9aQOuIGFN3n5vtV0gYJ7Y7sl+
 vjlMDS2bI4CbbCYwKzDuB+delh5oyJNQoisLuJNAvgE0FqgYXfdi4P3StAdpS9h38Jqw
 PRbFmga9aiGA28m4sx2CY9zq7v0WKUDI1FTDWkuVls0xW7kkULTxDLOjkeepb4yRKKUV
 wHQ5HZv2OZuSj0rKdtHtUzqS8WZUautzkhlP1rjKFPDrN7XBeIkLwT0cgxAN93vkv+sU
 AB4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745861912; x=1746466712;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XxdH2HBKv26bS3K+JOBUm6gBKxa8LnfYwhAZCtP8Xlo=;
 b=ipkXqZrB5Zkgcd7YSBYNu27HQ2vBkzkC5/7Z+2WNElkiC0rlEZ9XqiX/C97TnQ/FTi
 6DzjvKeHPMMu0VtcbZUXWZcvjdFWzmlVzeH909U2OmJhzMlCYBytItVO319GR/BbB11K
 4JlLQiYNuoqB+d4v21V1ZTX3xslWkLaW+eoE6YcTq55f40zocPGPkx9ut3YAobOxppwA
 W1wcohDTS9KPP+Vue6I0GfZM+9oYtf734Fjr+Ya6AwjQh/BKNxTUqm5/yhYDs969Cbza
 XHcmVwA/SZk9OlutFv5pXyYpq4diSvjaYoA14X2QRQExvJ+5zZzatWzADQBIzvoMkJ31
 n0Og==
X-Forwarded-Encrypted: i=1;
 AJvYcCUXp2bZe3DEXd6tvNG849SXFMRDnAuULQcn6xGgrkjzUGAeZnCX4g/EgW4cLNUVLbuRUwPURKnoJDzG@lists.freedesktop.org,
 AJvYcCUoU/+7tHp7xLcYw+CPUzNpw5QPOFjfs7tNzRcBKQ3VfVvtd0xJARjtMXddGQUBbHipCi3V8Fb6@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzySZHzmcX7uw/IWH6ATJ5v+0DaYvVu4iUPIXTm96wHX6I4199k
 ZY/XHGKz4BXJpAbJthJF8bbMwWNXX7CvbLyWI5atBFQ1dJavYDUdVXFxtE/GWGUBnNsIgMpo90z
 IzpDOAbIsnKV+thi8ZYRxHmLk3mnFaQ==
X-Gm-Gg: ASbGncsnKDwEbHCPhEtW6ZvrRDZ3vGHwq89mT18/bAdgG8lOTPEe3mb3lxeDq/kaPlJ
 vdcdOj0WKh57EMMau47hh9+EE6SmOzD+gaetqUirnEdCY7LmIAr3NtZY1njE9lYB7e4Dgjaw8g4
 BxdDVFXsZCc27cfGwzlDxTEw==
X-Google-Smtp-Source: AGHT+IEf49D21OKZEoGq8PtCW5/VDEocs+Glnf6NxJn6VwlyTRpUK4ukZURDMWvp5+SXIElEAIYZOcpi4f5J3vvG4qI=
X-Received: by 2002:a17:90b:33c7:b0:2ff:7b41:c3cf with SMTP id
 98e67ed59e1d1-30a220c2b2fmr77817a91.4.1745861912606; Mon, 28 Apr 2025
 10:38:32 -0700 (PDT)
MIME-Version: 1.0
References: <20250428104620.12699-1-listout@listout.xyz>
In-Reply-To: <20250428104620.12699-1-listout@listout.xyz>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 28 Apr 2025 13:38:21 -0400
X-Gm-Features: ATxdqUGI4Oe5F6VoqeDEjQ3KgdW839T6wIfAH3GnW6nH4T85eNCbUBtykYRM5qQ
Message-ID: <CADnq5_OB=HLZ+ArqhDQtafFyc2a034jqEN5JsbN36Q0fUdk3qw@mail.gmail.com>
Subject: Re: [PATCH 1/1] drm/amd: Fix malformed kerneldoc comment
To: Brahmajit Das <brahmajit.xyz@gmail.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sunil Khatri <sunil.khatri@amd.com>, 
 Mario Limonciello <mario.limonciello@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, 
 Boyuan Zhang <boyuan.zhang@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Dominik Kaszewski <dominik.kaszewski@amd.com>, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
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

Thanks for the patch.  This was already fixed.

Alex

On Mon, Apr 28, 2025 at 8:53=E2=80=AFAM Brahmajit Das <brahmajit.xyz@gmail.=
com> wrote:
>
> One kerneldoc commets in amd_shared.h failed to adhere to required
> format, resulting in these doc-build warnings:
>
> ./drivers/gpu/drm/amd/include/amd_shared.h:369: warning: Incorrect use of=
 kernel-doc format:          * @DC_HDCP_LC_ENABLE_SW_FALLBACK If set, upon =
HDCP Locality Check FW
> ./drivers/gpu/drm/amd/include/amd_shared.h:369: warning: Incorrect use of=
 kernel-doc format:          * @DC_HDCP_LC_ENABLE_SW_FALLBACK If set, upon =
HDCP Locality Check FW
> ./drivers/gpu/drm/amd/include/amd_shared.h:373: warning: Enum value 'DC_H=
DCP_LC_ENABLE_SW_FALLBACK' not described in enum 'DC_DEBUG_MASK'
>
> Adding missing colon symbol and making kernel doc happy :)
>
> Signed-off-by: Brahmajit Das <listout@listout.xyz>
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
> 2.49.0
>
