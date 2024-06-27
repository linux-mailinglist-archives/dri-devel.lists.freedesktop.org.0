Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC97F919FB0
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2024 08:58:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9198210E186;
	Thu, 27 Jun 2024 06:58:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="XuiGxs3H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83BBA10E186
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2024 06:58:21 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-52cdbc20faeso7201912e87.1
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 23:58:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719471499; x=1720076299; darn=lists.freedesktop.org;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=YNIlrh0o3BmVa7KGn3BlNKQKQ/vsv7AGkjBlD87kKPc=;
 b=XuiGxs3Hc4HZjHYU6crQrJ6rF6SPNnTNfnW1oOpMZCWGW7MbAw8mqm+K7KghenH4y2
 repl9fL8nTSLPPDgdFt4IL0nkLDcUu+6E0AWcu+/8j/dpi3HeZvPRwkehHLCVUTN85Wz
 t8rww42be6mlhh2mMBcJAQ7NUHeiSbDb3c88/Jb6mQ8O+3QGgFws6E7mc6o0WUHWj5dJ
 YFelrPZVCbRMjcatBzWyuns854q6fJXBzwKPqXun7XlCw2k/PQxTd4cy+yXDalbzvHx6
 P3KdA5TF2L4oaAYN3kVnvoK4jR1l1nulxyfVCLoxHn417gZDgVM6ObL5WB8M1nRwZxWS
 D2xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719471499; x=1720076299;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YNIlrh0o3BmVa7KGn3BlNKQKQ/vsv7AGkjBlD87kKPc=;
 b=vS9YFKEt4pQ2umNtqSoiZ1s5GMv7PYLmE9wfeNxO5W21r6TG9zTpGn47DyiSCQNAaE
 txTz79/NNW7RqAb9214LPxBIjViTIKMb8f28lm+RgQp609lwGXKsJG+ItDAz1lwH+0F0
 XJoyjMkkP6socZcjuKXstwqI/uk5K2o3UE/wlz29OSkT7GxoMm7sqGs3D9aLtqexZ7v1
 g48sEdQmYy6DcsbTdP1+HvtFfd8fpIK5y6U4FNtmLziy+nma1gxwdcwVd0PtrxKfSI1M
 yBtjMGYzwZ/WvDzlWtgdz7PPNpkxgPvuK1g39ipICSJspCFZ3cPIGZbgn5fMMFpIjxr+
 velA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVQjRPrCtDFx39m8UFU+3OGz2FkXMIZThiSz8udLuUaY8jur4+UyvkV0A5ZGhOGphpsWoPwAN8J+RABJri5cvxAjJjgWYeKJgV7PXonZCa4
X-Gm-Message-State: AOJu0Yzp4L5NAbrVnumF4GPLS23+pPxm0KHj+F1uc4A86GOCcLoBgt9N
 LugWuQVCczpF8lkEAIAFFjZHuSqumsdMJvSAsduKoGQRLc+5dsi6
X-Google-Smtp-Source: AGHT+IFC/bjGIL/8NWDtP1TJYmgVedL+vEsfhXN8+YyRJabS2/POCAHTTCF6DNNSr3v30AYUjOEA3w==
X-Received: by 2002:a05:6512:158f:b0:52c:d76a:867f with SMTP id
 2adb3069b0e04-52ce17fcb9dmr9938547e87.0.1719471494560; 
 Wed, 26 Jun 2024 23:58:14 -0700 (PDT)
Received: from localhost
 (p200300e41f162000f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f16:2000:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42564bc7b09sm11575715e9.47.2024.06.26.23.58.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jun 2024 23:58:14 -0700 (PDT)
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=7f8dcabb5dc255d60cebfa8d6c3433af39369a68ea1696444b485afea980;
 micalg=pgp-sha256; protocol="application/pgp-signature"
Date: Thu, 27 Jun 2024 08:58:13 +0200
Message-Id: <D2ALRV4G5SZF.229WKTA9B95QN@gmail.com>
Cc: "Daniel Vetter" <daniel@ffwll.ch>, "David Airlie" <airlied@gmail.com>,
 "Jonathan Hunter" <jonathanh@nvidia.com>, "Mikko Perttunen"
 <mperttunen@nvidia.com>, <linux-kernel@vger.kernel.org>,
 <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH v2 3/8] drm/tegra: Call drm_atomic_helper_shutdown() at
 shutdown time
From: "Thierry Reding" <thierry.reding@gmail.com>
To: "Douglas Anderson" <dianders@chromium.org>,
 <dri-devel@lists.freedesktop.org>, "Maxime Ripard" <mripard@kernel.org>
X-Mailer: aerc 0.17.0-167-g7c5a1afbda60-dirty
References: <20240612222435.3188234-1-dianders@chromium.org>
 <20240612152336.v2.3.Ifb4450979b62976fd5a98847dade2e5b377d47c8@changeid>
In-Reply-To: <20240612152336.v2.3.Ifb4450979b62976fd5a98847dade2e5b377d47c8@changeid>
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

--7f8dcabb5dc255d60cebfa8d6c3433af39369a68ea1696444b485afea980
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Thu Jun 13, 2024 at 12:23 AM CEST, Douglas Anderson wrote:
> Based on grepping through the source code this driver appears to be
> missing a call to drm_atomic_helper_shutdown() at system shutdown
> time. Among other things, this means that if a panel is in use that it
> won't be cleanly powered off at system shutdown time.
>
> The fact that we should call drm_atomic_helper_shutdown() in the case
> of OS shutdown/restart comes straight out of the kernel doc "driver
> instance overview" in drm_drv.c.
>
> Suggested-by: Maxime Ripard <mripard@kernel.org>
> Reviewed-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> This commit is only compile-time tested.
>
> (no changes since v1)
>
>  drivers/gpu/drm/tegra/drm.c | 6 ++++++
>  1 file changed, 6 insertions(+)

Acked-by: Thierry Reding <treding@nvidia.com>

--7f8dcabb5dc255d60cebfa8d6c3433af39369a68ea1696444b485afea980
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmZ9DYUACgkQ3SOs138+
s6FERw//WlQjtIszEzDkWeZFUGfNYgXGaeeQUylwV9ndafXASfuHpgYc8tePAZfa
yrchhtD+5LxEYKIKuUuIBkbWr50g/kQ+2+Xtf71w0NMefhYqiFNz1XnxMr5OKScU
HHa4+6qF9EDxuuEtAIT+WqQde0cA4unqzGb6yaLoBFNCoWThcbf1YqquRq1omnlp
mx3gtMnG6lS3Rv2CcnrdZQBhozGIj4sEebECSyZtKSsMI32J9l4fMP27qp8HKd7e
OYOkAVoDsk8V+qZu+Z5liNSMUaQ8OdfDiOoEN7Yjz8HlqDSChbdrxZjleRkYreeT
eA+vWUXKnDL3jpWouBkV6WyF08n1LgU6ExVNo/N7uaaZwri86mo/WrrE1DpIfVfl
rpGLIfdmxhgUKevei02C0vZIKHQcJW4mQsnlMk3nI1jaZNUQE/Dq+I9e7RZu9I4D
0fLJEWN53g5CQQCef5jkCQmig2GR3SD4+YVlHMwtaCRHGEnDV9uwaC6hQEVUjrlG
6RiX+hPhPq1VPsNUsUwLoW9H7lWF4ec+clXpeQ1m01yF8KnWGkCn5LrKZjY66yor
A5dqs6nVO1Ysbjiv5e21RZ6iX2eE+HlIjwihezDB66iNdPEKQS9BVI9gP0fO56eD
eopW9b9ItT4dSRbVRlDcfAt3q8mzVOG/H0bbToLDJgDYVOohII8=
=ykhp
-----END PGP SIGNATURE-----

--7f8dcabb5dc255d60cebfa8d6c3433af39369a68ea1696444b485afea980--
