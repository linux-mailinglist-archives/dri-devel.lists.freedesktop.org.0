Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D91B857AAE
	for <lists+dri-devel@lfdr.de>; Fri, 16 Feb 2024 11:52:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC26110E546;
	Fri, 16 Feb 2024 10:52:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="dATxe8nR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE3CD10E546
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Feb 2024 10:52:29 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id
 a640c23a62f3a-a2d7e2e7fe0so350568766b.1
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Feb 2024 02:52:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708080748; x=1708685548; darn=lists.freedesktop.org;
 h=in-reply-to:references:subject:cc:to:from:message-id:date
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=8BlcWNd72NqF1gKnOhmnwk5ASoyTAqAbMm6IbUppSeg=;
 b=dATxe8nRWYiGRwSKzKtzt6gOH8+K5Pey29xapCCNBScGRLRfed6Lhro2QBsHdu/Vh3
 qOYKKN6uDnBK7+0Q7JnZIuoWHgLylSc0eKITVVTYl/JP58hwZT7CzNjtJbd3etdUA8Xv
 dy3ssGBf48Yo43Ssu7ChYwQS43tyMjlTvd6hW9pCWbuzHo83iV+r+zIIYn+/yk8adaXF
 JfybzGE+T8SElysDxiIiqNkSguOWCJqpYvwOeBnr8P2z5bPGLPQZJkCtal7Ju+cWarn9
 LHTIcTO/NbqFMeB9/A6ewHjD59ZWLkJOqcEIpsHhN8gXjAfjckwgeZRo+nYuUzrdqQEH
 BsQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708080748; x=1708685548;
 h=in-reply-to:references:subject:cc:to:from:message-id:date
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8BlcWNd72NqF1gKnOhmnwk5ASoyTAqAbMm6IbUppSeg=;
 b=k+cO/+4AKDM10B6GlcmRK4mxVJHj/03hn5199TM7GSogk0prOTvQuTIWQBR9o/8DDQ
 2Gu+su8F9euLhgd6VvDNW4e2n1AwtK8qCgrpWSskwFkoESaaArdctkyIMqpVMut0Do0D
 9vYPLEhFh7kpWWRbmAhWREXZb0dkw3YDIBFw73PH3rHneswY+3vEL67LoYQENI1/yfmu
 diBpOa6MfL+9GlVeVaJUg0sgmvBHiZRPi4Hh+P3apxOmdP9HSz9dSLEUmtuvdgZgbtqJ
 hG6H6ggjx23Ntw9Srtl/5XzTJzLO0AmcKQLKpbN1WQ199Jw1XBZEknJfbBa+v4JuZ4IH
 9RYA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU0vjGwmTuRVrioQ6wVTPiGfgtLBKbEVzwwLYznx/LLgGJSXu01NQx6SgoMmoO7yi9XreLnPzI7Vkx6ueCvGd9yzwmW7rcjXEYFcer8YmLv
X-Gm-Message-State: AOJu0YzmP5gXDCPeuo0ASqouCM4x6mT2NvFGz9tQFWirdAmshzvSFBjK
 SdrUYUKef1zwf4n0ji9UhH+SI39Vyv6D2KvHyMlib000AfjEUnPc
X-Google-Smtp-Source: AGHT+IH0mDcRw34Wq9ydUOENLdvJRoSG5jkuL9c84tNSGhp68b/i9ae6/cVjEJgI+Bo3dCS82Bq4Lg==
X-Received: by 2002:a17:906:f156:b0:a3c:7e4b:e7e7 with SMTP id
 gw22-20020a170906f15600b00a3c7e4be7e7mr3679222ejb.10.1708080748056; 
 Fri, 16 Feb 2024 02:52:28 -0800 (PST)
Received: from localhost
 (p200300e41f147f00f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f14:7f00:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 o4-20020a1709061b0400b00a3d80d7f986sm1422202ejg.82.2024.02.16.02.52.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Feb 2024 02:52:27 -0800 (PST)
Content-Type: multipart/signed;
 boundary=8eadebd4d5fd4d6fa88e29463ae8e3e13d60ee0673e0e78c74e9107668be;
 micalg=pgp-sha256; protocol="application/pgp-signature"
Mime-Version: 1.0
Date: Fri, 16 Feb 2024 11:52:27 +0100
Message-Id: <CZ6G3AJZTG6X.1P6P64B0Y3Q8W@gmail.com>
From: "Thierry Reding" <thierry.reding@gmail.com>
To: "Colin Ian King" <colin.i.king@gmail.com>, "Mikko Perttunen"
 <mperttunen@nvidia.com>, "David Airlie" <airlied@gmail.com>, "Daniel
 Vetter" <daniel@ffwll.ch>, <dri-devel@lists.freedesktop.org>,
 <linux-tegra@vger.kernel.org>
Cc: <kernel-janitors@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH][next] gpu: host1x: remove redundant assignment to
 variable space
X-Mailer: aerc 0.16.0-1-0-g560d6168f0ed-dirty
References: <20240215224301.2073845-1-colin.i.king@gmail.com>
In-Reply-To: <20240215224301.2073845-1-colin.i.king@gmail.com>
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

--8eadebd4d5fd4d6fa88e29463ae8e3e13d60ee0673e0e78c74e9107668be
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Thu Feb 15, 2024 at 11:43 PM CET, Colin Ian King wrote:
> The variable space is being initialized with a value that is never read,
> it is being re-assigned later on. The initialization is redundant and
> can be removed. Also merge two declaration lines together.
>
> Cleans up clang scan build warning:
> drivers/gpu/host1x/cdma.c:628:15: warning: Value stored to 'space'
> during its initialization is never read [deadcode.DeadStores]
>
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>  drivers/gpu/host1x/cdma.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Applied to drm-misc-next, thanks.

Thierry

--8eadebd4d5fd4d6fa88e29463ae8e3e13d60ee0673e0e78c74e9107668be
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmXPPmsACgkQ3SOs138+
s6G7ww/8Ccf1z5cqdmYk/z19Ra4Oq/gXZFdq23lYsXMk8Wan8JQcyrQGHpZPzqCl
tWXsnMCLeJk+ef3DNJRsU1/gIFbiAJlWz4c/1q01Htw5wwJ6S2RMBEyLJUJiQ3jC
TjG+qF62jUQJed/lVA/EXKTx5Vxi9cbaZ4o0cckioVRtxP6aj3dWV/0ySc+nx1uU
o9h8gwgyMafcLn5cVtKzf4aYLq32mDgLSY/UHhG3L6uXSLijxnPixdZyAYIq1gDH
MVeRDtFkX/xplkI1SEFTUQ27U6qGgPszGbZSa+bqSfaoDP6fbuq2UmVaJ8jB+gr1
f+7uxUu3lQ8vCw+NWYY0cfYPV3GajHwzeXmy2Jm0v1/XUr5cB8fU/tPFuikr8as7
Lrweh3ZS8FbWO4WwKRvK1EdsT+RmGyQ5QVbbquU43lPvZav4CKBiZorrXdQca1gN
yMIZQ1xJssRUWQ2fMrxq0Ze1SEiAms4SnnV6TEMxn8dE4gmaorRVLXDksVGA7mFa
ig/P+bW/37UMQubPlhG4HmZ0G1BZrvbVoFW9cOlG3CI5+De+9RiCRMMpwfP7MXEZ
S3x4HeyYvhFJGqk1t7EFrBZYra8UPCITSei3+Zb4symbsxmHoavbjMUwM21IS+Lg
Rxdn8C1BMz1qj0xHP/xHtCEvgKo32hO41Sj9WL5O+3ZhXwzknzE=
=LKQT
-----END PGP SIGNATURE-----

--8eadebd4d5fd4d6fa88e29463ae8e3e13d60ee0673e0e78c74e9107668be--
