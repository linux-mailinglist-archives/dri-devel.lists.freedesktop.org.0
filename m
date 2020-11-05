Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 686CE2A83CB
	for <lists+dri-devel@lfdr.de>; Thu,  5 Nov 2020 17:45:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C7B06EDCA;
	Thu,  5 Nov 2020 16:45:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A40EA6EDCA
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Nov 2020 16:45:42 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id t11so2209547edj.13
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Nov 2020 08:45:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=CoyVEhjU5+i65+RM5MA24dlJcWVZipl6JTaDi+RPIjA=;
 b=vHRqOwZoIMPJEdRIUfEm6A0SNzm3v9aEoMVU+lR1YRJ4VECDuDCgesjtek6nQefppP
 FB7eujDcSbEtiHnoeOFRpm38qCaffocq5PLTEA+Z1wxqLwhWRnA78MPE+s7+SxFcgkV8
 3CpJI+DeQmwMsERvjUaQIJsom24qXiikOBPkdQi2/FuwFQoltsKGzAwA1PSV2Ai7onxs
 oVqb7reyJCENcsWymvdE+dj0XxgN2bDckqMaT7dxIwGyrWt4Xum875h8J5X1vKHsSLCy
 tG5pJX2y95SyxWwJYP/EC6WZhZmUq8wAvO0aT0TO1C1eKLJv63HGrcytU8NCLNLlEeXP
 qoSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=CoyVEhjU5+i65+RM5MA24dlJcWVZipl6JTaDi+RPIjA=;
 b=AVTamIqOsbAmUIjyUJRFEvLI8Sfl1zgHz1tTudgHv2G8bQtw16MyIa+O0E0vxo1dtV
 lgYvE/FN7dKsy2SumSQW103XbRBlOR75WHhLmyHrnXjoGTLxK56QXW7tApmlUB5KkD6f
 WsFO8qrlIL2jXU7jGpxtcDQdoFi5JE73UrUnJFJB1XdT334LuBjJQX3kiKNSHaH8HzC4
 otPSOPyG85a8f/RFaC1dJIIV4xMdlRoPP4q461eFvYjUdgXd9x9NI1hsQh7usqiUImR2
 grebrAbdbsbVaNmGMLm6FW4mSr6br+AYK8t4mjEsCroVGkb8zNRsP0k+cjoJTfBH0DdP
 /fbg==
X-Gm-Message-State: AOAM530xHyQdHoFQ9G41oXOCOHn6rNdp8Rngu1/EHqsM6eEyA7XBaW3F
 Fin8XVFb006Dh+AS9+tdmT87tirDOzU=
X-Google-Smtp-Source: ABdhPJyDxW7zujCRtV06rwzU0KrdHIuYIJHTTT6PD5zogl77WrCXNxfQoknZW9WEzB9+NEBaak27wQ==
X-Received: by 2002:a50:950e:: with SMTP id u14mr3469247eda.260.1604594741362; 
 Thu, 05 Nov 2020 08:45:41 -0800 (PST)
Received: from localhost ([217.111.27.204])
 by smtp.gmail.com with ESMTPSA id bt16sm1279390ejb.89.2020.11.05.08.45.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2020 08:45:40 -0800 (PST)
Date: Thu, 5 Nov 2020 17:45:38 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 01/19] gpu: host1x: bus: Add missing description for
 'driver'
Message-ID: <20201105164538.GE485884@ulmo>
References: <20201105144517.1826692-1-lee.jones@linaro.org>
 <20201105144517.1826692-2-lee.jones@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20201105144517.1826692-2-lee.jones@linaro.org>
User-Agent: Mutt/1.14.7 (2020-08-29)
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
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============2140071460=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============2140071460==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="a+b56+3nqLzpiR9O"
Content-Disposition: inline


--a+b56+3nqLzpiR9O
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 05, 2020 at 02:44:59PM +0000, Lee Jones wrote:
> Fixes the following W=3D1 kernel build warning(s):
>=20
>  drivers/gpu/host1x/bus.c:40: warning: Function parameter or member 'driv=
er' not described in 'host1x_subdev_add'
>=20
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-tegra@vger.kernel.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
>  drivers/gpu/host1x/bus.c | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Thierry Reding <treding@nvidia.com>

--a+b56+3nqLzpiR9O
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl+kLDIACgkQ3SOs138+
s6FfwhAAs7WZQaGt1M9Mff4+rE8bZScWqbl3tzYINl6Z6D0Ghn9KEbM7mKpZBdTv
iRGkVIKdoSoLZukDA36rYSs5ModiN1tEGtD5XcDEe9tR6JzHbk8L9pE+F9R3Q0LH
c8DuKIXbXg8jkpvpvN864xOOIGjWPyNYnQa0DG7cq8KNSz6Uk9VOifD2Qngflrt4
LPZmHQr6hIyU1ULy0P/8Q2fF7fNoUcK5S5TtjpQRmBi7Rjyf5lEiBslQcvoltbJE
fS85N0+feF+Uv051TNeBf/B5XUaZ70aCBZui9nk09V68t8GywYWUpyLeQ4vV0NGi
XewL8VRfbpouUSVVPOBi6xTr7knXeFjqQc6uRFtwSMRefn2xPG1yt90/RWVhd29t
npT1GrWHVbAIsSflOs41ao8Un+PnzRlefNMX0NlKsuEdvKrv68FwPd7JOEkxvsGA
52oRD8BQQddLoeeJ+iDpKL8ZhVOi3zaw6WxrpNskn9pazDTZImHGP+Q14eLdsNWB
FQDGdvGsGBJ1/qeA6Ar8cgJvQwjTcVUmrgP0J38/RWfTjeyWrphOT5/PqGhKmSCP
ME7mQznU6rFsZvOCIzCNTRAoM/tRyuLMnHiKywaKsOFw1sVrvDvDiq1/w/WGxuUK
1hUN6UEDTbRHeqdlT/PVnqJVaAMDDDki1fBkDWTgL6K8Bcivwgc=
=sOvt
-----END PGP SIGNATURE-----

--a+b56+3nqLzpiR9O--

--===============2140071460==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============2140071460==--
