Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C74ABB60EB
	for <lists+dri-devel@lfdr.de>; Fri, 03 Oct 2025 09:01:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1937A10E8A6;
	Fri,  3 Oct 2025 07:01:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="BK2M0PUR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B181210E1C5
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Oct 2025 16:19:33 +0000 (UTC)
Received: by mail-pj1-f52.google.com with SMTP id
 98e67ed59e1d1-33226dc4fc9so1385080a91.1
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Oct 2025 09:19:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759421973; x=1760026773; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bpMkSTIODIVz672XTAf9Z0sXNTeFcRKxvrLWbh3ZoNs=;
 b=BK2M0PURxdKvAq43QL3laTNIAwUuBi5sPzFScy7Cu24/StrIDUNBkzYJ/9027AP+4W
 cK8CyKHptdKm3KinG5fyHuIKFRauTsY2u+PtgQXqvaXmwuBf3J0K5h5C/pXCYZ4xe1hZ
 mTJ+knP3/Zc2jXDIQ7ombgC4Fb+W+K6dJjIkSWo7HZSrAxazB3mzc6RL3c1cniXXYVaV
 Fx4FfxBausfIoHRF8CfHfoNcT7MWhzLIyjOxheG2jo5qQNIaxqYZU4idbhjLJv4MpmDL
 5XrUZorPQRI//bLxx2d3Ox9tDGLGO6M1BiNtyCoij/38oFoBG22ua1vCj7i7fT+Rw54Y
 m93w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759421973; x=1760026773;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bpMkSTIODIVz672XTAf9Z0sXNTeFcRKxvrLWbh3ZoNs=;
 b=GlYecLMvJx9BBgxHz75fLIggxuybOen3OzeUPznq7xuFOnBVSLvWeXQNNpop0nHmWA
 GS/JWe2z6LC9Vvpu7mAFRCqr8GqnDJIXTR+bW4T/ninUGpUpLvxKWFmGpBup/a7sTXDV
 mXR5VhBSqXvhtS/FY5lsjYrLxVW28N0WsRojxVWijHb1HwBJwSB8xy+KBwr0PZ2fQ20I
 KjKyvj4uGp53fw5OAoVYIkz5HxGfqojQzryM0kNpMyJau+7PR02IrvDpmh3MwMD49uAC
 Np0Z//a8cPu38XXFdQ/CIFvnbrLfbesqq1MOBQm0VqPW7XE2struscUGPVyFUNzlYbvg
 pLuQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWTe5fu7xrM3Y7i/XWpBWMen9JwLvOgYq2KxZaCgEsMXeJwU4jbJHMqcA4hP2J6OqaQFeiF8t1PX7I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzFKzXZmm6Bf3+Ad+tXWenn4JRP7fApE7my6zq2JPOaPj0OqXCz
 8huK/OvWoemhHEFb4U2GgFW7PPro7RS8097elPcYaCYDvwDQ8UOaxUVVXwsX7AHob9bCQFnax0m
 R2Fd6bDi6CXBULrkNTn0TrcXFyWZgG7s=
X-Gm-Gg: ASbGncvsHtnMZCyWTVzl3rks3dW5gFNT2lWPuWDlz87e95UMLqbtCGhGHC6M/Jaclot
 m3beEKmAV6XVg+97kQooA7+oGbtWYd5+5FQ3UT2UPKS7+DrDzhqy9TjhipZNlfAlgRx5R49lOw0
 Suv/XuBeaiMxFAko1FBqLlIjmdIhCM/Pk0iaGA/JweLsO8rWZKmpRgnZlFwJseVvkZyIwccy4xv
 y2x4f7ostla7waj+ql7UK8S6wkDrYs=
X-Google-Smtp-Source: AGHT+IHbkL/WNKmVnMSE57YLwWSgNCdRkBP77UN+85Q2tFn3u/n4pmtcGxs9O49PsDeqTKEuH4GQQXmg2wweCS632Js=
X-Received: by 2002:a17:90b:3902:b0:327:734a:ae7a with SMTP id
 98e67ed59e1d1-339a6e9d34amr8340975a91.11.1759421973209; Thu, 02 Oct 2025
 09:19:33 -0700 (PDT)
MIME-Version: 1.0
References: <20250822030651.28099-1-chentaotao@didiglobal.com>
 <20250822030651.28099-2-chentaotao@didiglobal.com>
In-Reply-To: <20250822030651.28099-2-chentaotao@didiglobal.com>
From: ChaosEsque Team <chaosesqueteam@gmail.com>
Date: Thu, 2 Oct 2025 12:24:30 -0400
X-Gm-Features: AS18NWDNM2mM7xaDu1Gqhxbq-umcw1yDXJVRf57g_FAqg_8SWK8_Fb2uRjWOCZ0
Message-ID: <CALC8CXcSywKnQop1Xipcq1Lbtmpu94tc9Eq=ORjCzNCjkSTPVQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] drm/i915: Fix incorrect error handling in
 shmem_pwrite()
To: =?UTF-8?B?6ZmI5rab5rabIFRhb3RhbyBDaGVu?= <chentaotao@didiglobal.com>
Cc: "jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>, 
 "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>, 
 "rodrigo.vivi@intel.com" <rodrigo.vivi@intel.com>,
 "tursulin@ursulin.net" <tursulin@ursulin.net>, 
 "andi.shyti@linux.intel.com" <andi.shyti@linux.intel.com>,
 "airlied@gmail.com" <airlied@gmail.com>, 
 "daniel@ffwll.ch" <daniel@ffwll.ch>, 
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "chentao325@qq.com" <chentao325@qq.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Fri, 03 Oct 2025 07:00:55 +0000
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

Going to hit us with a katana, Taotao?

On Thu, Aug 21, 2025 at 11:11=E2=80=AFPM =E9=99=88=E6=B6=9B=E6=B6=9B Taotao=
 Chen
<chentaotao@didiglobal.com> wrote:
>
> From: Taotao Chen <chentaotao@didiglobal.com>
>
> shmem_pwrite() currently checks for short writes before negative error
> codes, which can overwrite real errors (e.g., -EFBIG) with -EIO.
> Reorder the checks to return negative errors first, then handle short
> writes.
>
> Signed-off-by: Taotao Chen <chentaotao@didiglobal.com>
> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
> ---
> v2:
>  - Drop Fixes tag
>  - Add Reviewed-by from Andi
>  - Add code comments (suggested by Rodrigo)
>
>  drivers/gpu/drm/i915/gem/i915_gem_shmem.c | 15 ++++++++++++---
>  1 file changed, 12 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c b/drivers/gpu/drm/=
i915/gem/i915_gem_shmem.c
> index b9dae15c1d16..26dda55a07ff 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
> @@ -441,11 +441,20 @@ shmem_pwrite(struct drm_i915_gem_object *obj,
>         written =3D file->f_op->write_iter(&kiocb, &iter);
>         BUG_ON(written =3D=3D -EIOCBQUEUED);
>
> -       if (written !=3D size)
> -               return -EIO;
> -
> +       /*
> +        * First, check if write_iter returned a negative error.
> +        * If the write failed, return the real error code immediately.
> +        * This prevents it from being overwritten by the short write che=
ck below.
> +        */
>         if (written < 0)
>                 return written;
> +       /*
> +        * Check for a short write (written bytes !=3D requested size).
> +        * Even if some data was written, return -EIO to indicate that th=
e
> +        * write was not fully completed.
> +        */
> +       if (written !=3D size)
> +               return -EIO;
>
>         return 0;
>  }
> --
> 2.34.1
