Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8128D345BC1
	for <lists+dri-devel@lfdr.de>; Tue, 23 Mar 2021 11:15:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EA5E6E891;
	Tue, 23 Mar 2021 10:15:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 398426E891
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 10:15:48 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id ce10so26129849ejb.6
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 03:15:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=48I/harJp5SFYdAiSNnqfmCnBx2x54xF8HcFi5UZqSQ=;
 b=Xp8XHXX92pCDKw9t5n/6fSaijVRae//MN7Cq6RI6dD6ySoylR/J9A1PFjydvsNMUgG
 ISOLGDvgE58o62xzFqiniirsEo5E05bMdnJPZRe9rJsHd8v4TBnol0uHGAxD7XlFnSta
 YxUSQw1+KsbWE1K6oBfV+FpZgbmgpFBeSVQiKgIssilo0LEE5xn2UoSnMuR92+a7I5+D
 sCldPb4YxulmStm98Wvkh8x+JRMGd/J58IxSIbrULVPS4OsYOM3C9QTQFcixp9IymbFQ
 9VaeDLIQWso9zoXvFmFCQiXV7eI0RAWYAdh3dKL5AxO+DK2bgyEnezCQcnlE7v0TbXlZ
 gntA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=48I/harJp5SFYdAiSNnqfmCnBx2x54xF8HcFi5UZqSQ=;
 b=rm9M99oEi+ANZq0Llp6gh8dqAcONohz0EcbFTzXXkc7GcAaMzXr8fXcRsz/dSSucqK
 EU7sLAZVRyDP5niVPj3yt5M0oHaUWodnfYgB4MIZUx3/MLUvqFvnTfVF3Whdg4sETLlX
 KP3q5L67d4nEhjZ6yyd9WJXqiJxIu32a6sJFzp2qvbFWLKBUvzmdvNl+pjrfeS2qzptD
 ZYQLIneg3FcKL45D5SQZUklQ76VfQo1czk4e7a6OLyyrIn2deiOozszGcg88j89QOgr8
 w0abShHllPLSdWhKN//CwKFG8Ie2Ffq7nud6/SrjjKZ8MYRPfszGwpuNbtGQ2ZRyyegc
 WctQ==
X-Gm-Message-State: AOAM531+9NLxJQeeXW3PMvCU1U5TazFy9V/r2GAfrFNgv9q3nZOQs12Y
 BLbzdEnxqDGFBl22fpe9tww=
X-Google-Smtp-Source: ABdhPJxDshgt293Mdas5gHS0qduPU8gItw9V1lC4YsedMrSMiuFVvvZX3Kp0vuEmKw9cfm1lw14F+w==
X-Received: by 2002:a17:906:b20b:: with SMTP id
 p11mr4269498ejz.0.1616494546922; 
 Tue, 23 Mar 2021 03:15:46 -0700 (PDT)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id mc10sm10753699ejb.56.2021.03.23.03.15.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 03:15:43 -0700 (PDT)
Date: Tue, 23 Mar 2021 11:16:03 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Mikko Perttunen <mperttunen@nvidia.com>
Subject: Re: [PATCH v5 03/21] gpu: host1x: Show number of pending waiters in
 debugfs
Message-ID: <YFm/431gaaP6wY1A@orome.fritz.box>
References: <20210111130019.3515669-1-mperttunen@nvidia.com>
 <20210111130019.3515669-4-mperttunen@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <20210111130019.3515669-4-mperttunen@nvidia.com>
User-Agent: Mutt/2.0.6 (98f8cb83) (2021-03-06)
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org, jonathanh@nvidia.com,
 talho@nvidia.com, bhuntsman@nvidia.com, linux-tegra@vger.kernel.org,
 digetx@gmail.com
Content-Type: multipart/mixed; boundary="===============2112283226=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============2112283226==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="3GrZ7xf99FimbSD3"
Content-Disposition: inline


--3GrZ7xf99FimbSD3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 11, 2021 at 03:00:01PM +0200, Mikko Perttunen wrote:
> Show the number of pending waiters in the debugfs status file.
> This is useful for testing to verify that waiters do not leak
> or accumulate incorrectly.
>=20
> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
> ---
>  drivers/gpu/host1x/debug.c | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/host1x/debug.c b/drivers/gpu/host1x/debug.c
> index 1b4997bda1c7..8a14880c61bb 100644
> --- a/drivers/gpu/host1x/debug.c
> +++ b/drivers/gpu/host1x/debug.c
> @@ -69,6 +69,7 @@ static int show_channel(struct host1x_channel *ch, void=
 *data, bool show_fifo)
> =20
>  static void show_syncpts(struct host1x *m, struct output *o)
>  {
> +	struct list_head *pos;
>  	unsigned int i;
> =20
>  	host1x_debug_output(o, "---- syncpts ----\n");
> @@ -76,12 +77,19 @@ static void show_syncpts(struct host1x *m, struct out=
put *o)
>  	for (i =3D 0; i < host1x_syncpt_nb_pts(m); i++) {
>  		u32 max =3D host1x_syncpt_read_max(m->syncpt + i);
>  		u32 min =3D host1x_syncpt_load(m->syncpt + i);
> +		unsigned int waiters =3D 0;
> =20
> -		if (!min && !max)
> +		spin_lock(&m->syncpt[i].intr.lock);
> +		list_for_each(pos, &m->syncpt[i].intr.wait_head)
> +			waiters++;
> +		spin_unlock(&m->syncpt[i].intr.lock);

Would it make sense to keep a running count so that we don't have to
compute it here?

> +
> +		if (!min && !max && !waiters)
>  			continue;
> =20
> -		host1x_debug_output(o, "id %u (%s) min %d max %d\n",
> -				    i, m->syncpt[i].name, min, max);
> +		host1x_debug_output(o,
> +				    "id %u (%s) min %d max %d (%d waiters)\n",
> +				    i, m->syncpt[i].name, min, max, waiters);

Or alternatively, would it be useful to collect a bit more information
about waiters so that when they leak we get a better understanding of
which ones leak?

It doesn't look like we currently have much information in struct
host1x_waitlist to identify waiters, but perhaps that can be extended?

Thierry

--3GrZ7xf99FimbSD3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmBZv+MACgkQ3SOs138+
s6GqGxAAh277Z6AEC7xUplc3xUrllXuDHyD0gRhY/YSYl1g6QJzHsnMzwQY9KvXz
E0pObUamO4SuwBCrrCDP7znkKW/OLxgklqVbSfE78Y2iVbBFcBbKBo+W2jqRgFZ+
A+VkUToq3cAldjvrGk/Z1AlaQRQdoNo2lrt40pf5S7xxP8ksbX9uD/1k5cn00JZc
9/wUW33ovWxnWuKGnvmS4duyiyJzwXsfgasoYav3UOIdhEKWkhK4yoS4uaX7IVdo
uR1yerVbNoNOdSd6XzGxCDIKsNIjfS8z9srMuRBqAgGE/gTQoKGCxkMwdz5nqz1r
fN705ppNh5gb6dhshUEQORyk0KGXfhb5ASRW8cLtPqWokKrUHrEnAZJVO0Uf2BF3
ZaDSmbM1o+aZPQV+J4FR0+ga3B/uCQOZ7+3ObjpIwZQ+kmWOvaGsVgDRrfSerfjY
9E8X17L81BiTiuZbqAI4bEhnsQJ3ao3dMrjSOdy+4y+HXkhvgKkP5kZKO6e1eW54
6JHa91XlNvuh12bTL9C1KRu1hkLFKLqkd6MSoi18Uy4KZTguwrzlfo0IRt2Fzrkx
2JYppUkWxLU/clwS7DthW6Hgydhn0dDZnPcN4z8Mus9L2jIdIoU9ukvvPqOs1/lf
i1mskeED1F1yTu/K5OoJgLlvanxQXLVQh0i9YUiCTEcEdUbZE4Y=
=+0Pr
-----END PGP SIGNATURE-----

--3GrZ7xf99FimbSD3--

--===============2112283226==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============2112283226==--
