Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AE9C6A5587
	for <lists+dri-devel@lfdr.de>; Tue, 28 Feb 2023 10:22:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C336110E65C;
	Tue, 28 Feb 2023 09:22:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6025310E65B;
 Tue, 28 Feb 2023 09:22:20 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id t14so9443563ljd.5;
 Tue, 28 Feb 2023 01:22:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1677576138;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=V6NbI+S4Zo6tzBY+15eN9nvIGSIt3qlXNaRweBUwFYg=;
 b=NA3f1vaJs3eN3vz/Uq5w8g6+ipzCq5YakfLVtsPP0KqRM83e3iSoQGIEOhHPNlWQKH
 SHyOs2QQmQjELishwO301NpjbORSQX+wXSqOJSga+NMFKVqky9NQNo53b0srWxEmPIIo
 drXzowOhyMSnokoeaUo9Z2QItGefdYorSJVlOtkg2QdWXdDQ5vzg/FxrrtAKDteqXGUm
 E+qWV+/QftK5PqG5h8K9th799X56gh3BnMJXJLb3AoL802ZTk3D6GETnxHAw2Eu6YQ+h
 lPgpVpCbXGG/G7+vdMIXsWKupvLzX5rFUDuzhq7FrSJnVbhzkonlsy7iD3uN1Hfi+4Jm
 BB1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677576138;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=V6NbI+S4Zo6tzBY+15eN9nvIGSIt3qlXNaRweBUwFYg=;
 b=VQW0Xtq/AtHwm5RVhXRrJEuVcbRxgLGtwpycTxHFkuG6xCGTxnYp9zW2/pprxKFa5B
 E0JqnSIg04DHxzjiPczvvQuFle/aDrcuRKTJAyVWPL3ECNDNi8V4MwOK1HGnTKxCJtfH
 HSzNY+ZJUuhxGQ9endsj6gM56t994XTKwcwWNX13HEhG87GfyczIc/ZwSFjjnbQ6NPUI
 MBP8vyioW+VlO3WlTWf0vM6ON/sBPG0R1UlpzAWOyk3YV6e345O6arEAuCWZsbkMEM94
 8pXMIBniWpq8UvApL9CIpEp0YkDETCVE/cZJodeuAz/DCGrmZJlQD41BHuGaGgiRj7N5
 wjUg==
X-Gm-Message-State: AO0yUKUrszkMKkCPWCcEVfGqUoaiKCaiJw5mEjtCARVT6OdBgXpEO9n1
 j6Ji0513QsKXlPKi/i4heMs=
X-Google-Smtp-Source: AK7set+Kd4cdSNsGv1XTeExPqdFEh3Ndwwe3jttSL7pQS7m8B06XlDDkCqedJLtZ1APlboiu5k2TjQ==
X-Received: by 2002:a2e:bd0d:0:b0:290:8289:8cb9 with SMTP id
 n13-20020a2ebd0d000000b0029082898cb9mr2906789ljq.7.1677576138585; 
 Tue, 28 Feb 2023 01:22:18 -0800 (PST)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 o7-20020a2e9b47000000b00295b2e08b9dsm861727ljj.116.2023.02.28.01.22.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 01:22:18 -0800 (PST)
Date: Tue, 28 Feb 2023 11:22:15 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH v7 05/15] dma-buf/sync_file: Add SET_DEADLINE ioctl
Message-ID: <20230228112215.6d3f1f3d@eldfell>
In-Reply-To: <20230227193535.2822389-6-robdclark@gmail.com>
References: <20230227193535.2822389-1-robdclark@gmail.com>
 <20230227193535.2822389-6-robdclark@gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/oWDcsycV5q/CDhV8x6Uejon";
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
Cc: Rob Clark <robdclark@chromium.org>, Gustavo Padovan <gustavo@padovan.org>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Christian =?UTF-8?B?S8O2bmln?= <ckoenig.leichtzumerken@gmail.com>,
 Michel =?UTF-8?B?RMOkbnplcg==?= <michel@daenzer.net>,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 "moderated list:DMA BUFFER
 SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Luben Tuikov <luben.tuikov@amd.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>, freedreno@lists.freedesktop.org,
 Sumit Semwal <sumit.semwal@linaro.org>, "open list:SYNC
 FILE FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/oWDcsycV5q/CDhV8x6Uejon
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon, 27 Feb 2023 11:35:11 -0800
Rob Clark <robdclark@gmail.com> wrote:

> From: Rob Clark <robdclark@chromium.org>
>=20
> The initial purpose is for igt tests, but this would also be useful for
> compositors that wait until close to vblank deadline to make decisions
> about which frame to show.
>=20
> The igt tests can be found at:
>=20
> https://gitlab.freedesktop.org/robclark/igt-gpu-tools/-/commits/fence-dea=
dline
>=20
> v2: Clarify the timebase, add link to igt tests
> v3: Use u64 value in ns to express deadline.
> v4: More doc
>=20
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/dma-buf/dma-fence.c    |  3 ++-
>  drivers/dma-buf/sync_file.c    | 19 +++++++++++++++++++
>  include/uapi/linux/sync_file.h | 22 ++++++++++++++++++++++
>  3 files changed, 43 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
> index e103e821d993..7761ceeae620 100644
> --- a/drivers/dma-buf/dma-fence.c
> +++ b/drivers/dma-buf/dma-fence.c
> @@ -933,7 +933,8 @@ EXPORT_SYMBOL(dma_fence_wait_any_timeout);
>   *   the GPU's devfreq to reduce frequency, when in fact the opposite is=
 what is
>   *   needed.
>   *
> - * To this end, deadline hint(s) can be set on a &dma_fence via &dma_fen=
ce_set_deadline.
> + * To this end, deadline hint(s) can be set on a &dma_fence via &dma_fen=
ce_set_deadline
> + * (or indirectly via userspace facing ioctls like &SYNC_IOC_SET_DEADLIN=
E).
>   * The deadline hint provides a way for the waiting driver, or userspace=
, to
>   * convey an appropriate sense of urgency to the signaling driver.

Hi,

when the kernel HTML doc is generated, I assume the above becomes a
link to "DOC: SYNC_IOC_SET_DEADLINE - set a deadline on a fence", right?

>   *
> diff --git a/drivers/dma-buf/sync_file.c b/drivers/dma-buf/sync_file.c
> index af57799c86ce..418021cfb87c 100644
> --- a/drivers/dma-buf/sync_file.c
> +++ b/drivers/dma-buf/sync_file.c
> @@ -350,6 +350,22 @@ static long sync_file_ioctl_fence_info(struct sync_f=
ile *sync_file,
>  	return ret;
>  }
> =20
> +static int sync_file_ioctl_set_deadline(struct sync_file *sync_file,
> +					unsigned long arg)
> +{
> +	struct sync_set_deadline ts;
> +
> +	if (copy_from_user(&ts, (void __user *)arg, sizeof(ts)))
> +		return -EFAULT;
> +
> +	if (ts.pad)
> +		return -EINVAL;
> +
> +	dma_fence_set_deadline(sync_file->fence, ns_to_ktime(ts.deadline_ns));
> +
> +	return 0;
> +}
> +
>  static long sync_file_ioctl(struct file *file, unsigned int cmd,
>  			    unsigned long arg)
>  {
> @@ -362,6 +378,9 @@ static long sync_file_ioctl(struct file *file, unsign=
ed int cmd,
>  	case SYNC_IOC_FILE_INFO:
>  		return sync_file_ioctl_fence_info(sync_file, arg);
> =20
> +	case SYNC_IOC_SET_DEADLINE:
> +		return sync_file_ioctl_set_deadline(sync_file, arg);
> +
>  	default:
>  		return -ENOTTY;
>  	}
> diff --git a/include/uapi/linux/sync_file.h b/include/uapi/linux/sync_fil=
e.h
> index ee2dcfb3d660..49325cf6749b 100644
> --- a/include/uapi/linux/sync_file.h
> +++ b/include/uapi/linux/sync_file.h
> @@ -67,6 +67,21 @@ struct sync_file_info {
>  	__u64	sync_fence_info;
>  };
> =20
> +/**
> + * struct sync_set_deadline - set a deadline hint on a fence
> + * @deadline_ns: absolute time of the deadline

Is it legal to pass zero as deadline_ns?

> + * @pad:	must be zero
> + *
> + * The timebase for the deadline is CLOCK_MONOTONIC (same as vblank)

Does something here provide doc links to "DOC: SYNC_IOC_SET_DEADLINE -
set a deadline on a fence" and to the "DOC: deadline hints"?

> + */
> +struct sync_set_deadline {
> +	__u64	deadline_ns;
> +	/* Not strictly needed for alignment but gives some possibility
> +	 * for future extension:
> +	 */
> +	__u64	pad;
> +};
> +
>  #define SYNC_IOC_MAGIC		'>'
> =20
>  /**
> @@ -95,4 +110,11 @@ struct sync_file_info {
>   */
>  #define SYNC_IOC_FILE_INFO	_IOWR(SYNC_IOC_MAGIC, 4, struct sync_file_inf=
o)
> =20
> +/**
> + * DOC: SYNC_IOC_SET_DEADLINE - set a deadline on a fence
> + *
> + * Allows userspace to set a deadline on a fence, see dma_fence_set_dead=
line()

Does something here provide doc links to struct sync_set_deadline and
to the "DOC: deadline hints"?

> + */
> +#define SYNC_IOC_SET_DEADLINE	_IOW(SYNC_IOC_MAGIC, 5, struct sync_set_de=
adline)
> +
>  #endif /* _UAPI_LINUX_SYNC_H */

With all those links added:
Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>


Thanks,
pq

--Sig_/oWDcsycV5q/CDhV8x6Uejon
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmP9x8cACgkQI1/ltBGq
qqc8sQ/8DMqhf/kvcj3c5YZrL8dLCmCqAWPORFyimEdVZrrOVLHSkH108GROuZQw
INjgpRuu3xjgF1ysobkDxh1MyKXA9ofSipChhlgpMKsbIX5xQAJdTFgZrdDP0rll
L3egS0Y9eERlUR1pR/gkzh96SKYSDsjmF4Ecykp+Q4mz1AkvBqRaHEUBaJ3B63me
BiHA1+oCxultWV/scXjfNr+EYHe1p5Bv67Q+l6Er4lCMDAPeU7F8raYra0d5br8s
AtigfJeTjt3dwxUaLWcz8gt4uCGgd98iEzOjLVMdPFyY39wah/1+UkRhAhlNat+f
+syYHxXq6rDxtlEl3JV1VRWAwYoZwtyAeehrkoT2MScVk+aru/Mg3H4x9vTc/o4/
W6XrU7ptZhZVid5jxs+VVLHA0k4XAuF2tpDoWHTvclmWtMyOTYCuUEP8e2urZl9C
U7V1+GjbOH7xc2DqsrYG+E23TXn+3iFfEBXv9KIklN1fCPibBjWe/2VhoHoH6PMN
THp4xUwHa8R/Qqj193krLYUQwtFlnKGNB7PkIzs9NPiHEw4CyMhbtgQycXMFCP0I
5lamapasfvqlZDBAmDKK+2V5r9aOZhODDswyAoPQOy3lsM8bKuGQv2PqG/kBmlHy
7HminviHeL9maC8ONOYuEvixlc1u3PwSDq+Pp+sUxtlyOnmg01Y=
=th3d
-----END PGP SIGNATURE-----

--Sig_/oWDcsycV5q/CDhV8x6Uejon--
