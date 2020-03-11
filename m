Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D846181B75
	for <lists+dri-devel@lfdr.de>; Wed, 11 Mar 2020 15:38:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63A0489169;
	Wed, 11 Mar 2020 14:38:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AED7B89169
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Mar 2020 14:37:59 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id 11so2368594wmo.2
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Mar 2020 07:37:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=IlF8vjliItStxT/wjkL77PBDGb3h75JlHH9lrCWsv7g=;
 b=a/xX+dGk8qG9dJT0zL2ydBvoiWjouFszn+yYzln3gWsVfTFuTOzoA/iKMUxUUQ65p1
 MkkBGNNdb40Nqbn1Ds2k2tJHD+9fgUZtfNtfVl5KDitE1UdnkybGMZs3VEjI4hyvEoD3
 aieTv9AycjqQKOai/utCiHvR4BFoBWzmZXHgq04w+UT6jbx/Omk2KdMuLxDtUMMGL7Kz
 t3jIIfycEX37PLVzKnoe3BSUGZSkVP+BmRX5385zZxGNZ0mkZZsgCPaxLAImo4Sf0hRt
 ky61nji8UhJ4rH6iysQ7Yba4zqPUYViJwljVVN4u3yJ0XfCo534DoBScWunJVYIzswoK
 6QEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=IlF8vjliItStxT/wjkL77PBDGb3h75JlHH9lrCWsv7g=;
 b=QTKQMdmFpDfwJihFkJePZYvWu2XNfhVL5EIiHpNV26OG62JVwUClTqzQmSBZGeVjWf
 gtWAGvZawvuELD2k7DUauvoYlJ7rnFm9cyIqpxxSI8D175U3KqK5dfT13Zq5j7yuaBMB
 iH8pOo8TzoA2nOfT1nFVW3forAQpH05LlyOpnSVLnrqFJuEhnwBXmTDLEYBHF60qZ2Cu
 EqUKu2kelMIoUDE5yJZcQsqE4PlS6xYSsxEBKrkoZ1M+fXN4Qu7TBBN7ti/q6FxnkHIx
 NWviC5sz0m6JnvtsrNMjFt0vms6GPIvGUIQxGUA7PNyv/t6P9LiTY724R9qiTX+af4t+
 zuhA==
X-Gm-Message-State: ANhLgQ23ae9at6bcGqcenzNw3DnLYblz6cfeelUka0kKrwOCvXajCp0K
 45aZBfgRnKYEFwM4w5ahdPE=
X-Google-Smtp-Source: ADFU+vuCH5zFJfC/erOCWEF28PPs9YZ/845sNE9/1798jBMHK7sfbsYetQ8tFwb8XA/8esL2KHJ42Q==
X-Received: by 2002:a1c:9802:: with SMTP id a2mr4213927wme.117.1583937475882; 
 Wed, 11 Mar 2020 07:37:55 -0700 (PDT)
Received: from localhost (pD9E516A9.dip0.t-ipconnect.de. [217.229.22.169])
 by smtp.gmail.com with ESMTPSA id o16sm56960179wrj.5.2020.03.11.07.37.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Mar 2020 07:37:53 -0700 (PDT)
Date: Wed, 11 Mar 2020 15:37:53 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Wambui Karuga <wambui.karugax@gmail.com>
Subject: Re: [PATCH 10/21] drm/tegra: remove checks for debugfs functions
 return value
Message-ID: <20200311143753.GC494173@ulmo>
References: <20200227120232.19413-1-wambui.karugax@gmail.com>
 <20200227120232.19413-11-wambui.karugax@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20200227120232.19413-11-wambui.karugax@gmail.com>
User-Agent: Mutt/1.13.1 (2019-12-14)
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
Cc: airlied@linux.ie, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jonathan Hunter <jonathanh@nvidia.com>,
 linux-tegra@vger.kernel.org
Content-Type: multipart/mixed; boundary="===============0078426124=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0078426124==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="69pVuxX8awAiJ7fD"
Content-Disposition: inline


--69pVuxX8awAiJ7fD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 27, 2020 at 03:02:21PM +0300, Wambui Karuga wrote:
> Since 987d65d01356 (drm: debugfs: make
> drm_debugfs_create_files() never fail) there is no need to check the
> return value of drm_debugfs_create_files(). Therefore, remove the
> return checks and error handling of the drm_debugfs_create_files()
> function from various debugfs init functions in drm/tegra and have
> them return 0 directly.
>=20
> This change also includes removing the use of drm_debugfs_create_files
> as a return value in tegra_debugfs_init() and have the function declared
> as void.
>=20
> Signed-off-by: Wambui Karuga <wambui.karugax@gmail.com>
> ---
>  drivers/gpu/drm/tegra/dc.c   | 11 +----------
>  drivers/gpu/drm/tegra/drm.c  |  8 ++++----
>  drivers/gpu/drm/tegra/dsi.c  | 11 +----------
>  drivers/gpu/drm/tegra/hdmi.c | 11 +----------
>  drivers/gpu/drm/tegra/sor.c  | 11 +----------
>  5 files changed, 8 insertions(+), 44 deletions(-)

Applied, thanks.

Thierry

--69pVuxX8awAiJ7fD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl5o98AACgkQ3SOs138+
s6HZYhAAkiP6QpzzL7CdD6Z9Ope+DJuC3IiLOgXlUk62gu0rPNgHNHn8qo6QoLN9
lj+yH2lxtBKcNjdbWhbwl7Y0kPcF/NnaIwlNa0DXqeOibQ/25kwTxEUVGLjui5tr
tfuv80lAwAiTBMdkt3j/NYVFAPn593+XIuLTxpmWp1lndf6JJ4q6f7x7oWLKyH2P
4GUNrcGqLjrEvTlL0kSrcnSFt4Lj1+/E/L8S5TduQtnFMJdDX1cRVol9bsFtaYdz
NWKixSEf7MyNXVhSDqAQq6lKd6+MQtjjfA/nBrY2g0dxmlwhKklYcgdsO9RVHnK8
ChFqVsMcu4ekbblHTgZ9aUfsFlR2SsFBGdrXgjXscf95BhK1LeZtkLFHZwSho5jW
25mvVeY0BBCHDzvSdhLBt6c2ib2a3KGTwm0geLuWlEczczQEkyNLYRpESCARrNHx
FGtEQR30sVzRvnkBl+35xthXJ1/d/vzYOkbxjgAgYfBeK/H2NkJQuBxNaolkvTuv
fcQ7mqY71PLwYX/fNtVx9nGxcswa5m1FYxz4NEOykTr9bJIsjyP9gph6nb6zaGNh
mmN74mDvLdyvMZpdOUYgqLkf3bh9I43fECfrpnxkjVRrZhMDDfIVA/I1pw2ChqNQ
CaF+O8yIQIEWeNi/kyamiROf9Pzsyo7ov3RNnk+5t7W34h/+k1k=
=Kgul
-----END PGP SIGNATURE-----

--69pVuxX8awAiJ7fD--

--===============0078426124==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0078426124==--
