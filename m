Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 130739AEC95
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2024 18:50:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFF0410E392;
	Thu, 24 Oct 2024 16:50:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="JVQTXXOg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C46A10E392
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2024 16:50:50 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id
 a640c23a62f3a-a9a2209bd7fso140098866b.2
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2024 09:50:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729788648; x=1730393448; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=qw3O9hodQBRp/DEbf4rfIGCtqNJfuZEI+i/CxdbGArM=;
 b=JVQTXXOgBqsboYmwErVDihfUyrYuWrxKRKqeAukEyKsdMmoNB+U6aGcN1EpTFM6/6v
 KnGCdHbOjvuuB/17FC6dFvM80Yu4q64K06T1lLiorsJ/fWrsXZk2sgb87gWstoGxV/UN
 l1I0n5a4Cj8uveXYPA2PvUALGIK3Xsm3CBruIIQHO/lZ5wf9dlXkAWtW6lJETNntbg7G
 cJIRRWoSCM7aQS3WSnENF8XRkRXslLxXhXV2aSLVxMU3jr9owpHkEi+YtMMpktV9J1cO
 +8ywSeOv8I6D9lAajz5/6jW3Z45QSTGkzzHvQLgwTYDPVUsua4Jj/qKrMLz625X+oZ5H
 u0sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729788648; x=1730393448;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qw3O9hodQBRp/DEbf4rfIGCtqNJfuZEI+i/CxdbGArM=;
 b=E2COYe14Rj1bzpkXZzrlxjwXpCyiIdliF0AFH3Xgl0IFyZwcZ9Prbi+iMHlmGz7fpQ
 IyIvi8sh+UjC/m3Ww3EE66fHpjDYZTBZadLvKVk1IGrXtRTGCISr1/QxYWlw6+9Q8Dw/
 KHCKFdGrX+htB3V9bPY91RN6hxL3SiY63QL9NwJtRSp4jDaRjetQPUJ0vZWJ1wIKQU9h
 RbPFk9UIlBCQ037hTiHWbPw8AwYPw74lkymYeakLzT+OKgr8/ijUukB9bpNQ6lx9ZPEq
 YB7eHveHDvoX/ql519QmPSPvC8RpvMK4+WaY+kSDBbTssqd4AwJdBoVCmXVxoyJjY+Qf
 V/ag==
X-Forwarded-Encrypted: i=1;
 AJvYcCVAv5KaIriTbVTqDSIZVKlcw96vMj666CSewb48WHz18iyN/SHD4vvNwNh3G1AC4bu+E8l06+vOpRM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzuc8bIMoUkEh6/imj2ZV1fQNLfF43SEZSh4b70pkwTnp7uIbet
 GZKoeWnbtxCU+MEC8R2yxDGceHgeA71ff1JVMt37HmXdh3RR+C9D
X-Google-Smtp-Source: AGHT+IFdtBJB0hDClK2PASxfoljLwLQyf/nrZv9yVgbCfBzXcKYh5XyFC7uUTYw2p3ozGeP0RZZLIQ==
X-Received: by 2002:a17:907:3d88:b0:a99:f972:7544 with SMTP id
 a640c23a62f3a-a9ad27650a2mr256202666b.38.1729788647917; 
 Thu, 24 Oct 2024 09:50:47 -0700 (PDT)
Received: from orome (p200300e41f26ec00f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f26:ec00:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9a9159a23csm637575566b.205.2024.10.24.09.50.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Oct 2024 09:50:47 -0700 (PDT)
Date: Thu, 24 Oct 2024 18:50:45 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Lu Baolu <baolu.lu@linux.intel.com>, 
 Mikko Perttunen <mperttunen@nvidia.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Jonathan Hunter <jonathanh@nvidia.com>, 
 Lyude Paul <lyude@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] drm/tegra: Fix NULL vs IS_ERR() check in probe()
Message-ID: <hwyc33hoo64ir4lljqehczycrl4bu2g2r74sdmbtssddpdywyz@6lyxnedoe6sy>
References: <ba31cf3a-af3d-4ff1-87a8-f05aaf8c780b@stanley.mountain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="m4ji5aso7m54wndw"
Content-Disposition: inline
In-Reply-To: <ba31cf3a-af3d-4ff1-87a8-f05aaf8c780b@stanley.mountain>
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


--m4ji5aso7m54wndw
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH next] drm/tegra: Fix NULL vs IS_ERR() check in probe()
MIME-Version: 1.0

On Fri, Sep 13, 2024 at 05:34:54PM +0300, Dan Carpenter wrote:
> The iommu_paging_domain_alloc() function doesn't  return NULL pointers,
> it returns error pointers.  Update the check to match.
>=20
> Fixes: 45c690aea8ee ("drm/tegra: Use iommu_paging_domain_alloc()")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/gpu/drm/tegra/drm.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied, thanks.

Thierry

--m4ji5aso7m54wndw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmcaeuUACgkQ3SOs138+
s6HN3RAAvWRr0rls//7gnX2OCfl8oyYPo5mgZd5XMOV0spjX3OeyTFF0KLMJRclG
w5sHhaYFmmWnWs/6UE22ayu0SMjX3Ak28ZJDvY3ssT7uCWvZnAIBfsEjTVqD8eXJ
wp9UkIv8jNW3SEkdfKxVgN2eQ3CWPUm4VLNGG2KBbNoO3EcDODQmqhk2gTXgR2M5
dzhmYvg3rGh6RMElvnXUXD0Ekfj26sRAeNXv+uZdaa12Vox3/Rf+Qye/jBOwJSBX
TiZ9uSph8Fy1kFdFWelJpUA/yOtPBghTwyoYxvRU6nBrDJgnV54XaMoaKLAAAHhM
E8EjeMS1xJJrwnfV+1Xox9Vf5Gj6CD6rdxyNkidE1tpzLE2P/frdXhbmr+SX5xVP
+lqLogiN4EnK6DHsNKGP3blTjlqjoTI4sAwiq+K9dqlclGpTUqozrDvjKzkyiduc
6Yu14WfBsIbiN0jqtdqf085/kOEIqDpPaV0tnVzugeo/ip6QktlgkmJNMhvMAR8o
joL6U2zKAROIGRi/ulXDWmCx54TGDXs3UBW9Zd/EiWuluAFLdpfmB5Phh3199SEO
c6RIFtW6gs9/fDSTSow9k0cQ3J7cq+wMtPo4poK4q0kEJLuUS55zm+OoGvOl/tSM
vvtaUJcVKHdI4nP+tIy8qRng0aCreU0cmgBcJtVFs9wjuVmWcDA=
=8x7A
-----END PGP SIGNATURE-----

--m4ji5aso7m54wndw--
