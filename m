Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B353989B1A
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2024 09:14:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C49EE10E099;
	Mon, 30 Sep 2024 07:14:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="WUpSppJ/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E624710E099
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2024 07:14:35 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-42cb60aff1eso36909555e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2024 00:14:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1727680474; x=1728285274;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=l0FXb/A2D1cvyh8qyUDJTJHrWpHxWmzrtDlwSI89q1Q=;
 b=WUpSppJ/fVZJ2qnLS6plV+eTarGLzjAA+5H4Zd4CeEe+mQgszNpTC6xrkMtPphITkn
 pmNU4Ybn/+aHYgAPp7fNJRqKks+aYqt8B3JXMFL8FbcMeMJzSr8L2L1/+/OJPIgKgmzs
 311uowFZsIt2nvrERdGVDIJ65w9tEQHhTDyX91Iy123CuHyP0ydqj3ptnPd6iA9KOKFa
 Scm0x0sdhdV9DURSFw9ESyVvrPh8f0s2ZbApw9SAJx1OmYxjtU+A921HICdwyGwcAfhV
 PkmgK+h09phJq9ZxG82wEcIhgM2nH1VSuB9ReAn4sqz0isknWpXPlfdIPt0bPvCodI6j
 tyhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727680474; x=1728285274;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=l0FXb/A2D1cvyh8qyUDJTJHrWpHxWmzrtDlwSI89q1Q=;
 b=jxKW394gb/7xg4v/6Jjtiwf7+YAsu/Ujr5SR96q+FnoOhsoh8lSOiyNsWR27qriQYp
 6Pu1VMLzNNdzPdCZUklTrq3qR9oDENap/Y2xpdsgurGSXWCrUJ5HLvhauEe9pXvT+Qhh
 S7n+Ng16OUF995QMqSidTqwou7/q71zXN0s2QhGc8HhekTnsgQw5FTtgy7Kp6Fgv1yxQ
 eg4eRhqDkmz1Zpl23IZMiUreUsM0N34oWxYJapjR5zbpoBtPjKC9YiobECBLiDGG2hLm
 dLF58mC3TF/5PErAXsaHweHfr2BRc1muUTohAnHpCV/3KtaZMftBYLXeHMMqc+vTc2OC
 t1Gw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVpjM0r8vhu6ye80Wd6Wos+9ceAtu+PGKS96ae8y8qWR38U8sOtfpFJNwBftfmiSBCNlCaqthD9jLQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyemE3jraXqH2XECetKM98Yws59eTSsY6TlMZAufxN97CPZh0Bk
 rnyUeMlKrpOSWfSCNNKCtgqyfTd93wsgzkxNzXVBCXeinnVMIpqbjfiDl9UITmw=
X-Google-Smtp-Source: AGHT+IGJyNHTZESTIIPs/3AcS9Tim8KLQ/LJqIjWRJOSFXTe2ROkCkOJlz373yVP1zJE3bTl0/RU7w==
X-Received: by 2002:a05:600c:a4b:b0:42c:de6f:6ab3 with SMTP id
 5b1f17b1804b1-42f5840e0eamr78362085e9.6.1727680474216; 
 Mon, 30 Sep 2024 00:14:34 -0700 (PDT)
Received: from localhost (p5dc68d3d.dip0.t-ipconnect.de. [93.198.141.61])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37cd56e6596sm8303854f8f.63.2024.09.30.00.14.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Sep 2024 00:14:32 -0700 (PDT)
Date: Mon, 30 Sep 2024 09:14:31 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Alex Lanzano <lanzano.alex@gmail.com>
Cc: dmitry.baryshkov@linaro.org, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Mehdi Djait <mehdi.djait@bootlin.com>,
 skhan@linuxfoundation.org, 
 linux-kernel-mentees@lists.linuxfoundation.org, christophe.jaillet@wanadoo.fr,
 dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pwm@vger.kernel.org
Subject: Re: [PATCH v7 2/2] drm/tiny: Add driver for Sharp Memory LCD
Message-ID: <xaxa2phqlg4vbdexi2atyf5kvu5rixqrprbvcwumbfy5cdwazb@s7fqm6yttsjt>
References: <20240923162205.55658-1-lanzano.alex@gmail.com>
 <20240923162205.55658-3-lanzano.alex@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="mjx4wdiimu3v2vxz"
Content-Disposition: inline
In-Reply-To: <20240923162205.55658-3-lanzano.alex@gmail.com>
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


--mjx4wdiimu3v2vxz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Mon, Sep 23, 2024 at 12:21:35PM -0400, Alex Lanzano wrote:
> Add support for the monochrome Sharp Memory LCDs.
>=20
> Co-developed-by: Mehdi Djait <mehdi.djait@bootlin.com>
> Signed-off-by: Mehdi Djait <mehdi.djait@bootlin.com>
> Signed-off-by: Alex Lanzano <lanzano.alex@gmail.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

JFTR: I gave feedback to v6 as I missed there is already a v7. See
https://lore.kernel.org/all/q2njnpzpkd3xrrv6icr5wq6uztja3wfmy2x2ldreqemzbwk=
edv@ixywmn7qy34q/
=2E

The TL;DR; is that Alex intends to send a v8 to address my suggestions.

Best regards
Uwe

--mjx4wdiimu3v2vxz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmb6T80ACgkQj4D7WH0S
/k4q+gf+NRWnSFReYhgI+VSM690varWV9lp9Iyql+s7nR00KEfVpP2CHMV+HP64f
gA4pGrIcJf79pxHSzTs5FgGym38r/hQyM8YLUeuqdfPPsANSGaPk0LI0//ka8N4c
GI2n+5YJ25ZGJBZWa3pVmcIljqJWrcV2xIpiqkeNTvH0IqODQqdTkLQZVhLij3Lc
tqjylRfiI5TCRqXDKJjsiw4xvW4Y0E377rytq1WhVvCKX2J3rufgYQFF7p1xG8HZ
LvZqEDEe5j55SwePTrGlHcE2cQo4v83EApzgr+OctACGoCmh4IMLnj4alC+zAYdy
Jeulu7OUyuDKVIvc2rxQrZtAc5VNvg==
=Wa/t
-----END PGP SIGNATURE-----

--mjx4wdiimu3v2vxz--
