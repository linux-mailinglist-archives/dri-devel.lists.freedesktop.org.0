Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 09EFE345D6E
	for <lists+dri-devel@lfdr.de>; Tue, 23 Mar 2021 12:55:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01BA16E06D;
	Tue, 23 Mar 2021 11:55:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FC576E06D
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 11:55:16 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id e7so23039821edu.10
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 04:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=OmjKsrSUkMAiio37jMcTJDOa+opJ8luWoB+3g0zIs3w=;
 b=umVjL9x25EitIe3xbYipYvezjGixLcmj+s9CW6Se/Nw65qisVuUgPKPFZr+LnSVrta
 FqcB1CGmOYFe0BCTtOc6/R3jm8rjKGzXAvDvhZsWl8Tn0ctbA1hHyDPns2gaa9OmV6+9
 JWK+sp47Z9c4VoD9BivDlscB2FOQa8kTNYE6a090ob2xtpwOn36nTkaJAnWoxUSIf9Bd
 Z/QswUYtMMXwyQpcEcIswUULmOol3weoStQTbMDctafy2gD0wz8s0omas8j259kzzH7m
 s98dMjsg7JP33ZiRNJ/HWuSP2JD9cJb1ynAdysUnTdoJm3lVfMGYx1f9B/aPBt77gjqQ
 mbhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=OmjKsrSUkMAiio37jMcTJDOa+opJ8luWoB+3g0zIs3w=;
 b=KtmVgIgnVhORRlOcj+TIkq2e6sl/kabSKoEW01tOnxM01Z88I0KfEkrT7656XhihtD
 MNBKx15+7huA/xlPAexVg724CsEBO7GXvXqtH53d/4tGMgC3PbpnasObTgYQLoxa7bcy
 EjmYis1X3Dz7m4HLvXstzqGaf+ElJ5mlFZLfp41tIc0vLsCEEjIJ1T6rMKcLPUfhXH2L
 OlZfjUBD0aYFNaEs19KEnTP3NV+0476VkgHHjZJF6/c+o0PMH51XO22DSaQFYR3bkMI1
 s1bHH+2tobHEvdENxt6cmbnWnNdO3aHWRtWKnr020ZQqnvwBF2klzGYWEi8bn5jZpzCX
 c4kg==
X-Gm-Message-State: AOAM531azO38IhYFqDLbjwApKwWFmXnG6h0/sfuaQTibQZ0e6fROYozr
 GkLK7xEKCl6ZNXbk3+IUEPQ=
X-Google-Smtp-Source: ABdhPJwnsgSQN3rBdLXYKbcSOYEsQm4CP13DQ5DyHUfr2wfO0XZomdBxo15acguqtJyoO14+tWjkuA==
X-Received: by 2002:a05:6402:13ca:: with SMTP id
 a10mr4195810edx.320.1616500515229; 
 Tue, 23 Mar 2021 04:55:15 -0700 (PDT)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id x21sm12695275eds.53.2021.03.23.04.55.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 04:55:14 -0700 (PDT)
Date: Tue, 23 Mar 2021 12:55:34 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Mikko Perttunen <mperttunen@nvidia.com>
Subject: Re: [PATCH v5 11/21] gpu: host1x: Add job release callback
Message-ID: <YFnXNs5vFb+tiwzh@orome.fritz.box>
References: <20210111130019.3515669-1-mperttunen@nvidia.com>
 <20210111130019.3515669-12-mperttunen@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <20210111130019.3515669-12-mperttunen@nvidia.com>
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
Content-Type: multipart/mixed; boundary="===============1227655437=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1227655437==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="FjkUz4QETBgSyCZ4"
Content-Disposition: inline


--FjkUz4QETBgSyCZ4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 11, 2021 at 03:00:09PM +0200, Mikko Perttunen wrote:
> Add a callback field to the job structure, to be called just before
> the job is to be freed. This allows the job's submitter to clean
> up any of its own state, like decrement runtime PM refcounts.
>=20
> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
> ---
>  drivers/gpu/host1x/job.c | 3 +++
>  include/linux/host1x.h   | 4 ++++
>  2 files changed, 7 insertions(+)
>=20
> diff --git a/drivers/gpu/host1x/job.c b/drivers/gpu/host1x/job.c
> index 8f59b34672c2..09097e19c0d0 100644
> --- a/drivers/gpu/host1x/job.c
> +++ b/drivers/gpu/host1x/job.c
> @@ -79,6 +79,9 @@ static void job_free(struct kref *ref)
>  {
>  	struct host1x_job *job =3D container_of(ref, struct host1x_job, ref);
> =20
> +	if (job->release)
> +		job->release(job);
> +
>  	if (job->waiter)
>  		host1x_intr_put_ref(job->syncpt->host, job->syncpt->id,
>  				    job->waiter, false);
> diff --git a/include/linux/host1x.h b/include/linux/host1x.h
> index 81ca70066c76..d48cab563d5c 100644
> --- a/include/linux/host1x.h
> +++ b/include/linux/host1x.h
> @@ -265,6 +265,10 @@ struct host1x_job {
> =20
>  	/* Fast-forward syncpoint increments on job timeout */
>  	bool syncpt_recovery;
> +
> +	/* Callback called when job is freed */
> +	void (*release)(struct host1x_job *job);
> +	void *user_data;

It's not clean to me what the user_data is used for. It's not used in
this patch at all, but perhaps it'll become relevant later on. I guess
I'll see.

Thierry

--FjkUz4QETBgSyCZ4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmBZ1zQACgkQ3SOs138+
s6EmMQ/9FEDZm2BCmhv9tgumtdiYseMe1QXqFBsAMXgo6rpsxNvYK5JW+5MxfxP/
viwM32tLpdSYhlheymRFAdMt59xsOewsL9Aa+uKPIFkrl1OdTwUatj4a8XAI7dKB
HU5pe5Rw/eTqOjzw1QDKKfPznW9xq5sHZ0i52AoPI9k0nDZpTen3RqYXijMl+Al6
joWUF0NOcYQH+yEOrem1fFBr8UhdcIyTpFwAlyvKr16l4ZQO00Ph+W/0Q8zis58v
cvH1d+MP3Kk7IrC1T9Wg/zQKC5lOhTAEd7dIeiezVpTAzSqvQ3vk6VEGDXwFKHCa
zl+p+VbLh3qr+Dp5nP7h15+kqOZWnz7VevV/wSDKHyveDpouLxThoX58vSD96JCe
RbVwTgjkAFzBVFkHTijeTG+MItbUcNl5PDz4scYI8Wl/NKfFBCiqi0jLJNTOeH7f
3qoKctVHJUenre8zrZyXYsTgtk5TF65vq/+e4RPE1A145qej9AwVk0UbRBMDxEIj
TlQckBUQw+4LTtBZkU73EeiRqy+jtL3pePWwkI2zPpNDo23C/4g8AFjJo9UouhcI
09kNmxwI0/c1hX/QeTNAOjCzNNrheAOoqupsp2jErLA/HAFy9OmXyVprl2ny0jDP
qY2/NDFRWvrKqcsrC2g4gDUZwWCjTBdhfVdPZXdML52OHnzQzHE=
=//9i
-----END PGP SIGNATURE-----

--FjkUz4QETBgSyCZ4--

--===============1227655437==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1227655437==--
