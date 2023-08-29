Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F9AA78BF97
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 09:49:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BCF510E06E;
	Tue, 29 Aug 2023 07:49:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C22610E0A6;
 Tue, 29 Aug 2023 07:49:03 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-5007616b756so6518109e87.3; 
 Tue, 29 Aug 2023 00:49:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693295341; x=1693900141;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=OI1R5ue1l4PwCG2oi/y01LYQvO74RnqK27QxURC5nsg=;
 b=eP601AowgqNwM3BD8z2/bvld0CsvKwhr9cjQO77ANQJMtKiQWJJ4DwrM7bbQsPJYFK
 /8FELTL+8pvo8H8DuzDqstKrOPeFonP7oZZ+RmMDNYi1rVXb8v+rMo49cJeRGlN3gsQi
 2F3/2nA4G3YpWbnY15TSF+U9dGben0keGIUQMXP84bMYsNp3SiEvCh7UMwPGSX9rU5YC
 zkfUYelPFLHrNYG6QRqt/FKoEmOpQN9KOdb07A9uEYB7tAafvjHwAWHX1DVN2qmf8EKE
 a1ir6xqNv7bcX/P/pbzQdGvVBhdQmRuXQ19EJEIpw+5Ob+B9aHDV9QC8SAgOoZcpaW2P
 6UaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693295341; x=1693900141;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OI1R5ue1l4PwCG2oi/y01LYQvO74RnqK27QxURC5nsg=;
 b=INvo4+80G5i7CPkd0iK2ZANqu39LqODg3X/HO9pDqt6cn0+OHBnYy3zl3l8YRG2dWT
 xaPUt7QbB5dyYpCxxm7qqZLtckbzwh2F79ExiGNhfE6URh2XD+BLkgxLgc6L+0nhCKR3
 SmO5VIdkIlQXI4cXbAkARz8kGgX33yH6CCiw6JNK3XYMltuz3Ssyh5QpOXGZGad5B6mA
 1vdelsDA5m3bbrY+s62SBfWATeTr1N/XvPAvMj8rqCdjxeRLIJXwUOYxTPNjk+BMRu3d
 0FUxcsD4YTE+zYUJbQZ5hD676e74jymQC3wMTuT/dzRoQiAo67JHnoySxg00Yk++rZFV
 71kA==
X-Gm-Message-State: AOJu0YxVNlS3iBtjmiuVZeLNj6HOdP7TuGnP7Y4ATfEK4V/aihpfBYfH
 PCJCkapOEggRT5sEMAKJK2o=
X-Google-Smtp-Source: AGHT+IGIlCEkJil4AnAwfWLiAfpjl2igqxZQluROeJEGmtOcAHN0LTRShvTWhmTqQEjer/Yqx7Vqxw==
X-Received: by 2002:a19:385e:0:b0:4fd:d517:fbcd with SMTP id
 d30-20020a19385e000000b004fdd517fbcdmr16742007lfj.6.1693295341041; 
 Tue, 29 Aug 2023 00:49:01 -0700 (PDT)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 o21-20020a056512051500b004ff8f090057sm1871769lfb.59.2023.08.29.00.49.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Aug 2023 00:49:00 -0700 (PDT)
Date: Tue, 29 Aug 2023 10:48:16 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: Re: [PATCH RFC v6 01/10] drm: Introduce pixel_source DRM plane
 property
Message-ID: <20230829104816.19122c6d@eldfell>
In-Reply-To: <20230828-solid-fill-v6-1-a820efcce852@quicinc.com>
References: <20230828-solid-fill-v6-0-a820efcce852@quicinc.com>
 <20230828-solid-fill-v6-1-a820efcce852@quicinc.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/kN5KPVrZpDI_roK/yihBVMo";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 sebastian.wick@redhat.com, Thomas Zimmermann <tzimmermann@suse.de>,
 Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org,
 quic_abhinavk@quicinc.com, Maxime Ripard <mripard@kernel.org>,
 linux-kernel@vger.kernel.org, laurent.pinchart@ideasonboard.com,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 wayland-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/kN5KPVrZpDI_roK/yihBVMo
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon, 28 Aug 2023 17:05:07 -0700
Jessica Zhang <quic_jesszhan@quicinc.com> wrote:

> Add support for pixel_source property to drm_plane and related
> documentation. In addition, force pixel_source to
> DRM_PLANE_PIXEL_SOURCE_FB in DRM_IOCTL_MODE_SETPLANE as to not break
> legacy userspace.
>=20
> This enum property will allow user to specify a pixel source for the
> plane. Possible pixel sources will be defined in the
> drm_plane_pixel_source enum.
>=20
> Currently, the only pixel sources are DRM_PLANE_PIXEL_SOURCE_FB (the
> default value) and DRM_PLANE_PIXEL_SOURCE_NONE.
>=20
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  drivers/gpu/drm/drm_atomic_state_helper.c |  1 +
>  drivers/gpu/drm/drm_atomic_uapi.c         |  4 ++
>  drivers/gpu/drm/drm_blend.c               | 90 +++++++++++++++++++++++++=
++++++
>  drivers/gpu/drm/drm_plane.c               | 19 +++++--
>  include/drm/drm_blend.h                   |  2 +
>  include/drm/drm_plane.h                   | 21 ++++++++
>  6 files changed, 133 insertions(+), 4 deletions(-)

...

> diff --git a/drivers/gpu/drm/drm_blend.c b/drivers/gpu/drm/drm_blend.c
> index 6e74de833466..c3c57bae06b7 100644
> --- a/drivers/gpu/drm/drm_blend.c
> +++ b/drivers/gpu/drm/drm_blend.c
> @@ -185,6 +185,21 @@
>   *		 plane does not expose the "alpha" property, then this is
>   *		 assumed to be 1.0
>   *
> + * pixel_source:
> + *	pixel_source is set up with drm_plane_create_pixel_source_property().
> + *	It is used to toggle the active source of pixel data for the plane.
> + *	The plane will only display data from the set pixel_source -- any
> + *	data from other sources will be ignored.
> + *
> + *	Possible values:
> + *
> + *	"NONE":
> + *		No active pixel source.
> + *		Committing with a NONE pixel source will disable the plane.
> + *
> + *	"FB":
> + *		Framebuffer source set by the "FB_ID" property.
> + *
>   * Note that all the property extensions described here apply either to =
the
>   * plane or the CRTC (e.g. for the background color, which currently is =
not
>   * exposed and assumed to be black).

This UAPI:
Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>


Thanks,
pq

--Sig_/kN5KPVrZpDI_roK/yihBVMo
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmTtosAACgkQI1/ltBGq
qqebyRAAi5m4OshgltcLENupHhZJbAyOF4Vgz6aKR+OJ9smMDKbW6FmmNZmJqtj7
qq4Vb00Id6DDEnZidpPvMFRIoS10VChTqEF/kptq47/xoAtXmjeansqskKT6m6h5
rLuURGUKNRDy+r54irp86Gz5PPAwCUQEW+1WQebI2ph7I1wAkFp065LCf0zoJiQv
9z/hmqjnt6aiiGlDvc0IuRitiJp25VZa0p/FPW3eI/ob6zxT10r9lFAkvRz0UikE
ICw7tqEAVWJPQaqCOuJbRMR7fEmPhVYWj/sQ0wZqB75FQTzyay4zEHGwANyyXfFd
eMgKNv+Vn350Vari1CxY1nEvFC0/BIJT6s7G4h/bFZuaJebqQn7i1g05LRxY5WbK
g4c6kMIN26dJei4yHkPE22yFf9hPyx8mNK/EfC3LZ4LN2oIfimiUqH/mSSKkahLc
3RHN1zQ7TwlcLkHT9lVggZFFjhsv2YuACf9O34KzrAbh9ta0Nh1HOfazh3XxLrs5
WcFecPziUw/jT5HwdpsdENePJ9iMhds4/7aKx951HSXUdparXEaO7gjyy++7JqcE
5X80m73A321nxOSa6JLICiFMWHTobI3Qc+0nbanQElxcmDNFDyQrYP+du+dPCTXa
m+KUEU5syHRTxg7t51Acpjv7lVCec+Zgj+t+sfG8rxZKa5ziX88=
=eLDG
-----END PGP SIGNATURE-----

--Sig_/kN5KPVrZpDI_roK/yihBVMo--
