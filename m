Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D8E7310F80
	for <lists+dri-devel@lfdr.de>; Fri,  5 Feb 2021 19:09:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A8046F49E;
	Fri,  5 Feb 2021 18:09:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com
 [IPv6:2607:f8b0:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06A066F49E
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Feb 2021 18:09:41 +0000 (UTC)
Received: by mail-il1-x135.google.com with SMTP id q9so6664466ilo.1
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Feb 2021 10:09:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=iSGUYlU8VNNBRqdy8VTbbGEf6C9L8ldY8pady5boXSg=;
 b=RxKYiw8totJBxLt4stxBy2dyUyB9sJ0jmzGh8PkB7ACuGouoOTKMAk8xJd7ihDYb4p
 swCGokFtdsJFZIApXjDDxuXjqzJBCNCb583z11gbjihPqOQAFDlk+Aj15Z+mbbd6YulP
 E2vF42SyEOdcOi9vxfudsZUqoO9hMRB+YXzQ/ell/SyEthLIZoIUUBmWXXyOnbaZCMXL
 8cRPxTMn91Lr7/7axV4kOmfrWDJe3q2NXAktX3W/Es0UxrQbCDCNSpq4OXBiy82aiCFI
 qy9I+vi8jauo09g1meY1XvuPCQGO/zbMgX/DQzcBgiuk1OMd31sV6rV7HDpl4FxWHIHq
 LbAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=iSGUYlU8VNNBRqdy8VTbbGEf6C9L8ldY8pady5boXSg=;
 b=GvZyYhnxT3UfQpxhPa43Lr+JVC2V7JItR2sRQZ0NXoE8H2ARxbL7lufcuBk+rzBbI6
 uh9d6LAC6YP7JqtsDbU9EStS6zUM+igg6jLynujzgqlLQFe5L03lMz7o3o8yAsTgvwKB
 R34jrWkkONMysB7foQy0weZj2uK3BhdZDXWUv7q7BRFs5Cwo+bmoYKdjgCHeJ+F5SlSV
 LGJvqFUsmqjCIqEpXBdcqN9Tvm78unL/+XJF2+GNyEABNGAUMs0cWC9DQj1ZNoIhDIm+
 RSarGNn2WLZTZycG22lVJDmz+rCoddFI3gDb40FHBaUSbHtZU83Obn3s6lj2etIT9Crw
 S7MQ==
X-Gm-Message-State: AOAM533gh97IVhJzCx8njzT8OVX+5z6O08wfXPEeAX55g0giG3Bxndi/
 PUyLwH9ICoJOwwu0jYKt2tU=
X-Google-Smtp-Source: ABdhPJzZkAOKkPP3gQoJocGdN3LwzrekFIyLicBg7Fyti46Y1H5Cc62wl2lepkRlVJDiJTokOAdnRg==
X-Received: by 2002:a92:1904:: with SMTP id 4mr4824080ilz.201.1612548581360;
 Fri, 05 Feb 2021 10:09:41 -0800 (PST)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id r11sm4343881ilb.13.2021.02.05.10.09.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Feb 2021 10:09:40 -0800 (PST)
Date: Fri, 5 Feb 2021 19:09:37 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 10/11] drm/tegra: Annotate dma-fence critical section in
 commit path
Message-ID: <YB2J4e8gpIt7CINk@ulmo>
References: <20210121152959.1725404-1-daniel.vetter@ffwll.ch>
 <20210121152959.1725404-11-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
In-Reply-To: <20210121152959.1725404-11-daniel.vetter@ffwll.ch>
User-Agent: Mutt/2.0.5 (da5e3282) (2021-01-21)
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
Cc: linux-tegra@vger.kernel.org, Daniel Vetter <daniel.vetter@intel.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Jonathan Hunter <jonathanh@nvidia.com>
Content-Type: multipart/mixed; boundary="===============1354942033=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1354942033==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="U/4uM/neOvp42j8/"
Content-Disposition: inline


--U/4uM/neOvp42j8/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 21, 2021 at 04:29:58PM +0100, Daniel Vetter wrote:
> Again ends just after drm_atomic_helper_commit_hw_done(), but with the
> twist that we need to make sure we're only annotate the custom
> version. And not the other clause which just calls
> drm_atomic_helper_commit_tail_rpm(), which is already annotated.
>=20
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Jonathan Hunter <jonathanh@nvidia.com>
> Cc: linux-tegra@vger.kernel.org
> ---
>  drivers/gpu/drm/tegra/drm.c | 3 +++
>  1 file changed, 3 insertions(+)

I assume you want to take this through drm-misc? If so:

Acked-by: Thierry Reding <treding@nvidia.com>

--U/4uM/neOvp42j8/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmAdid4ACgkQ3SOs138+
s6Fy2RAAtfMRIMDsAm08wwhw0p0iiBWuvDMIJ1ESzdAB4875oJ6ShXp7IC5KRTqY
wfcSbKvKQB/Ze/aqwDAutJQkWVL0oGV6vW8ctUvZMWeAdLnpbFIIOhErBL8JAKfi
NRs76VV/1GePrn2YnrhkYgyfxpZh8/kMfkFpQsC2/2cFdXiU7p4Mnie0c7QeXfpx
DQa0gi0ItWyrGXY++FAdhQW4tPYpiWIS9G/VZYhZ8+exMCx4JDgWKaoP2KwVlnhZ
HX+0+jp08iUuW22ceaMxfBcmus01fuj739a/agCuGfYml92QEuVxuAJd4D2lOgqA
mdoGiluS/zNpRRgkyfN+svK4I7nWjeV/yFVXqI/1/1Yn/kfzUQh6PipQzt72nY6f
q3V6dKOMZZVD9OZT3VNV2CosfHMrPSwWrcR8wjGnBUiaI4T9QjnjDsFREVtaADo5
t6MXMr+VYTNCQKjFnaDvxe7A3ybJd+04aHFoiWKSZY5MWJ5Hq2bPZNVNVG7AJt/O
lWBdhx96ugS/fosq7RGSaC7+OA8HlHpg+RewVifxMavHqcWmAw/v/Xj8pY9Vyuz2
H+MSq139dZIkUd86tfNJeJdbR2ZzwoP9+UAa0V+3uShwZPn55itLZIT14cfGuTlc
IQBcgBjwwGl+NauZRlekmcKUi5ckw1j8jd/NAP7A5oVfWBk2xTg=
=l9dU
-----END PGP SIGNATURE-----

--U/4uM/neOvp42j8/--

--===============1354942033==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1354942033==--
