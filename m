Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CBA59780775
	for <lists+dri-devel@lfdr.de>; Fri, 18 Aug 2023 10:50:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 981AB10E4A4;
	Fri, 18 Aug 2023 08:50:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5C6610E4A4
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Aug 2023 08:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=GZI0ZY6uhGOX87ixVG7ZamQ8W8elzDD6vGESeyJDmhg=; b=rEgHuxKyXf+zBftxhl7u5/A8AM
 HAY03sk/lb/Wl1PeqOjeFz0CBNFOa1qCGK4m1uokWn13GMmJT7sNK2BKxKQ2fuuHFFsIwdDf2PSeJ
 AeDomTYiB6hoA3ezArbswQiw+Sz0bjeKDQiLUBBQ1y5DSl49RTbi1jM24UwXQnhKftY+i+Thq3f/j
 lUHvYtc2R8i4cFcLn1X+KYg6w4dKLW6Ok1kBYKxTfv9S66K4B3djv0HsAyd5hw7VNfcIFcB4JO8Hm
 eZTIXUc8Tdiyg9tN6pvvOKVQF+8JoIYxOP4jNMekiQA7+hv0ft3Inot4Gv2NMw/OvGGN0bqUbZ06R
 IO8DjQPw==;
Received: from [38.44.68.151] (helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1qWvBj-002EmR-HC; Fri, 18 Aug 2023 10:50:35 +0200
Date: Fri, 18 Aug 2023 07:50:28 -0100
From: Melissa Wen <mwen@igalia.com>
To: =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>
Subject: Re: [PATCH v2 0/2] drm/v3d: Expose GPU usage stats
Message-ID: <20230818085028.yhcbg5iy4npdtpqt@mail.igalia.com>
References: <20230807211849.49867-1-mcanal@igalia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="qvy2v3zcroggcndo"
Content-Disposition: inline
In-Reply-To: <20230807211849.49867-1-mcanal@igalia.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, kernel-dev@igalia.com,
 Emma Anholt <emma@anholt.net>, dri-devel@lists.freedesktop.org,
 Chema Casanova <jmcasanova@igalia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--qvy2v3zcroggcndo
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 08/07, Ma=C3=ADra Canal wrote:
> This patchset exposes GPU usages stats both globally and per-file
> descriptor.
>=20
> The first patch exposes the accumulated amount of active time per client
> through the fdinfo infrastructure. The amount of active time is exposed
> for each V3D queue. Moreover, it exposes the number of jobs submitted to
> each queue.
>=20
> The second patch exposes the accumulated amount of active time for each
> V3D queue, independent of the client. This data is exposed through the
> sysfs interface.
>=20
> With these patches, it is possible to calculate the GPU usage percentage
> per queue globally and per-file descriptor.
>=20
> * Example fdinfo output:
>=20
> $ cat /proc/1140/fdinfo/4
> pos:    0
> flags:  02400002
> mnt_id: 24
> ino:    209
> drm-driver:     v3d
> drm-client-id:  44
> drm-engine-bin:         1661076898 ns
> v3d-jobs-bin:   19576 jobs
> drm-engine-render:      31469427170 ns
> v3d-jobs-render:        19575 jobs
> drm-engine-tfu:         5002964 ns
> v3d-jobs-tfu:   13 jobs
> drm-engine-csd:         188038329691 ns
> v3d-jobs-csd:   250393 jobs
> drm-engine-cache_clean:         27736024038 ns
> v3d-jobs-cache_clean:   250392 job
>=20
> * Example gputop output:
>=20
> DRM minor 128
>  PID         bin               render               tfu                cs=
d            cache_clean     NAME
> 1140 |=E2=96=8E                ||=E2=96=88=E2=96=88=E2=96=8B             =
  ||                 ||=E2=96=88=E2=96=88=E2=96=88=E2=96=88=E2=96=88=E2=96=
=88=E2=96=88=E2=96=88=E2=96=88=E2=96=88=E2=96=88=E2=96=88=E2=96=88=E2=96=8D=
   ||=E2=96=88=E2=96=8B               | computecloth
> 1158 |=E2=96=8D                ||=E2=96=88=E2=96=88=E2=96=88=E2=96=88=E2=
=96=88=E2=96=88=E2=96=88=E2=96=88=E2=96=89         ||                 ||   =
              ||                 | gears
> 1002 |=E2=96=8F                ||=E2=96=88=E2=96=8E                ||    =
             ||                 ||                 | chromium-browse
>=20

Hi Ma=C3=ADra,

Nice job!

Overall LGTM but I prefer to have an ack from Chema before applying it.

I left some comments regarding documentation for future users.
With this, you can add my r-b in the next version:
Reviewed-by: Melissa Wen <mwen@igalia.com>

Thanks,

Melissa

> Best Regards,
> - Ma=C3=ADra
> ---
>=20
> v1 -> v2: https://lore.kernel.org/dri-devel/20230727142929.1275149-1-mcan=
al@igalia.com/T/
>=20
> * Use sysfs to expose global GPU stats (Tvrtko Ursulin)
>=20
> Ma=C3=ADra Canal (2):
>   drm/v3d: Implement show_fdinfo() callback for GPU usage stats
>   drm/v3d: Expose the total GPU usage stats on sysfs
>=20
>  drivers/gpu/drm/v3d/Makefile    |   3 +-
>  drivers/gpu/drm/v3d/v3d_drv.c   |  39 +++++++++++-
>  drivers/gpu/drm/v3d/v3d_drv.h   |  30 ++++++++++
>  drivers/gpu/drm/v3d/v3d_gem.c   |   6 +-
>  drivers/gpu/drm/v3d/v3d_irq.c   |  33 +++++++++++
>  drivers/gpu/drm/v3d/v3d_sched.c |  35 +++++++++++
>  drivers/gpu/drm/v3d/v3d_sysfs.c | 101 ++++++++++++++++++++++++++++++++
>  7 files changed, 244 insertions(+), 3 deletions(-)
>  create mode 100644 drivers/gpu/drm/v3d/v3d_sysfs.c
>=20
> --
> 2.41.0
>=20

--qvy2v3zcroggcndo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEd8WOo/JViG+Tu+XIwqF3j0dLehwFAmTfMNQACgkQwqF3j0dL
ehxaJg/8DExsdSnDPwXytBuasOhKqqariWKEWnywTRzi9xxs/2kpDsR8w86cOpzf
CDG17epmPnBXymT93EoN81KULX0mb3+NQ7KLqX4tafWU4McsI7SreS1k57SfWPwI
R4Sq/0wy1r5mU/CXS8WGiaZNqu4YQHbYva+2UwbsnIxYsV/9+8dSfNC7ax8m6hl2
9c6zNlC+Wu+3y7VrTyj5J8GTYf1qOZUb0+TMCf+btQcbqp9vKYwTg8cBwbM1MkAB
m2JtmjZ2svu48kpRTrlNb9dmEMQz26v6+4f+19GDkQ1uyFQY3/saShklenUeUb6o
KaAKFXuhZ/mplmhjxRBmwMmKb09RSolGQX/4oXx2sLckzMX3U4VTiU8qzHhTkOh2
PYGwko9sbou63uV7FiPCyHfA2i517rN1FBu+nBHlR4GeDxo09W24PrSx8IIGk0Rb
PZJsCGWd7oPvN8e0Q+i4q6IpBzQj8l18NyM8b0ML8eZB9HFFz5KFz2hL/CRGLimf
hxZDLLpCkoUy8z3WiR/7TCKGtihsjibaZGgNWYldxlE+Pilfl179QDVOnFyNxMSe
299W61tkcvhZsKAXloCFrwLYzCJhOsdFMcryxqgDh/2uXt8Auguz2746PPudMNyi
i1JTf30pJKeuWrOdOrmPUC5jpgFVJF8Av5OKRvn6zYb9EGELdZ8=
=29RJ
-----END PGP SIGNATURE-----

--qvy2v3zcroggcndo--
