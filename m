Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC1377C006A
	for <lists+dri-devel@lfdr.de>; Tue, 10 Oct 2023 17:33:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30EC810E39B;
	Tue, 10 Oct 2023 15:33:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE8AF10E39B
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Oct 2023 15:33:07 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-538575a38ffso9507124a12.1
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Oct 2023 08:33:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696951986; x=1697556786; darn=lists.freedesktop.org;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uA30MYl9QHPBHFzDvcPwyw2o41gOUerdhZVk4I6+4pw=;
 b=IsA2epIXx8ojKfPAIU1VYkzVm+1ca5eJd6N2YcHb8i7zMm2/g+8AJpjzoki2VNcwEm
 Y5M9JJ3EFFlhNatpzQhoPuxLaR9lECo3ZMwteLxxpjC/OM5Ag8cPds+O++QdGrWmZtWA
 h/RmKIsNbwtxmCrhlrP6xDm64DQbQHCkxkt0C6Lz/tEks5k/IFUITq7SiuMEBXQyrF8o
 BvmLVkA8CNJ2bUsnt1HnI8j/IFfSJjdytbw3P7UMqdhLQ7ZpEChRW+fd1G/rtaShNCD+
 2AEBrzRjkGWXtNajhQsGmSQALZpPkPFffenMx2oauo4k+nOBWYlEutSgQxAFlNeMBs6U
 ybSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696951986; x=1697556786;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uA30MYl9QHPBHFzDvcPwyw2o41gOUerdhZVk4I6+4pw=;
 b=pYVdT7hCyX0awHpJiIr7Q+xXa00Gz3qqlxPkH7s0ek0cJa1FTEffBlNDFpZPMZYmcR
 3UxS3Wvzl9i/YT71i9eBHVbFerZRlQICzgxvqYZejDX++mKAzFtwC3P7iqnOX26VI03K
 LDiqMjdpYI0Dr1to794sT7aek8HpLGPQD+3Gbz9zzswjnyD8lp4Cd4kJ+iVnon0egdTp
 p3hh/g9BPwXbFHQaStMPrSykhlqGQ0fxOEBOkQSn6ywmazfR3SPz3CaH11Ky4L1eEGFN
 gaGR03NDPmwgmFE3xrTQQlHHGOcbRy81boGPJlOj5JLgyyu6iTUtYTp6tvR8uDFfFFNu
 xN0w==
X-Gm-Message-State: AOJu0YwpmADYwtmVG/Fvhf2gpP1ZTrsfrJxWtmqlvbfRyTQJEHAv4Q/F
 +xMt4Y5dLgvAD4f28l8gvENHXf13AVo=
X-Google-Smtp-Source: AGHT+IFdHuk7XbZCiSFl/ZQnmMM5FBKExgsZqn43R/kXm7e2RMTM9Xy02X8OMD7DuvpntTVJu5svYA==
X-Received: by 2002:a17:907:770c:b0:9b9:eb30:b5ea with SMTP id
 kw12-20020a170907770c00b009b9eb30b5eamr14797437ejc.31.1696951985967; 
 Tue, 10 Oct 2023 08:33:05 -0700 (PDT)
Received: from orome.fritz.box
 (p200300e41f3f4900f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f3f:4900:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 p26-20020a1709060dda00b0098921e1b064sm8611133eji.181.2023.10.10.08.33.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Oct 2023 08:33:05 -0700 (PDT)
Date: Tue, 10 Oct 2023 17:33:03 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Yue Haibing <yuehaibing@huawei.com>
Subject: Re: [PATCH -next] drm/tegra: Remove two unused function declarations
Message-ID: <ZSVur4CNQD3woL0o@orome.fritz.box>
References: <20230809030226.3412-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="g8HowzIengH1BfT5"
Content-Disposition: inline
In-Reply-To: <20230809030226.3412-1-yuehaibing@huawei.com>
User-Agent: Mutt/2.2.12 (2023-09-09)
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
Cc: dri-devel@lists.freedesktop.org, jonathanh@nvidia.com, tzimmermann@suse.de,
 linux-tegra@vger.kernel.org, mperttunen@nvidia.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--g8HowzIengH1BfT5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 09, 2023 at 11:02:26AM +0800, Yue Haibing wrote:
> Commit 776dc3840367 ("drm/tegra: Move subdevice infrastructure to host1x")
> removed the implementation but not the declaration.
>=20
> Signed-off-by: Yue Haibing <yuehaibing@huawei.com>
> ---
>  drivers/gpu/drm/tegra/drm.h | 3 ---
>  1 file changed, 3 deletions(-)

Applied, thanks.

Thierry

--g8HowzIengH1BfT5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmUlbq8ACgkQ3SOs138+
s6GTsBAAvV1qiOB/3BT01lO45vvHM0fJ41zlyp8bXQhNreL832hpVqmrSpotDNU7
ScPX8DteFgnRjvfa+oSbHs6Y4khC1FrdNSwqdcSG6LfltGFBMVDnhrEPmWmHX+pR
rGhd5MwCtg93BHAcYmuahwyTIj15INWAagxSs4JZ6MsUQRsTDDGdwm90v0gWMqmW
kNLeV2eMeKiQ7GLWpke3iXEXF+hM5x5CVcZadtJngNa7gdDCMak1OrSrt1OhKwnr
gDjY1cyusBKdgBE5+gCK9hZcf3vgCt84B6Ly4FNdah5kXZrwgzi4/2EBFDpZy3FU
d+iLrc0ykdAl7OMdXai1r9O6vvu4MQlt6q9WKJbrf0EUVTpA2SGdXGeII1mSMHnb
rXo2U7JwnkN3TTaYaGd/04ugxTAi0z+ec7M4AF4fQdyoE648Iz7VZ6KO3yYWV+Jk
h93AhLrbB1MXu5NTqrh3C0pe0fBjXYd4LLZCG4N9+cbCGFPWhmUm52n2vR+l5RxG
lXIcuwjr7tghwlnU9t4+TD8IfeNOl6a+YZJMsy9suZjBxbH4guPqvgoQkrSgVbUP
GkhTXEBG9mKqfcKWaexmkWBRBDdFD/DyW4yfOJtoM9uKrzGKsR5U5ZXXhjiQQU5I
Aiw4sbt7KIGvlRlAcBiwkck/7AbD8ZbiExFrt82RKZJGqB3IEd0=
=j69Z
-----END PGP SIGNATURE-----

--g8HowzIengH1BfT5--
