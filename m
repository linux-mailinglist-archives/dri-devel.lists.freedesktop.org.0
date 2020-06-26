Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89A4920B0B2
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jun 2020 13:40:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 418DB6EC78;
	Fri, 26 Jun 2020 11:40:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com
 [IPv6:2a00:1450:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E9F26EC78
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jun 2020 11:40:44 +0000 (UTC)
Received: by mail-ej1-x641.google.com with SMTP id a1so9017386ejg.12
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jun 2020 04:40:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=BJC4oloYb5RbjxtRrvfFmqUozt++cFwO1fPLD+Iu6uQ=;
 b=gaO0lpVUM4tO4+Abx4tPmG5ompbTtXgQHrSEKTykvo+it12BrkH0I9Iqx7D70iORDM
 XMs0WU0CT1wTawfBLxXbGE3OmZq2QoL/cQGIlJRF1ZHe3hYiNa1ulKzm6LJZ42Ugan3Y
 N4AiqTfMMVd/uhLnQ+AYsGDycSVk0tD5qwEqJ2SUIduKbn7t0YLqaqY46a2ZgDSx3BR5
 DLDGgLkCYr+5prGVha06DsTJ7gTRPapXcj6ta7PKjNOj7tAddkZ9wrtwT1PUBFWLd9Dy
 iBl9Xe/MYveW+9MuB2EVhVHWVIDuKM7sxgvRiKqsCWL/grmDkBzwztCag+hSHQ+Bni4G
 cgtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=BJC4oloYb5RbjxtRrvfFmqUozt++cFwO1fPLD+Iu6uQ=;
 b=aXLzXcFfVQDmXIbxa8E8Iyv6nhgKk1n7aPKjtodJguo0tBo+ppdg37A6tBUhTaGlgp
 L++/B8qr/sqxpKGKYz4k/VLW0WaBaH1LKpvHBExpddfBvaF5CGOfTwoLGEtxbs8n+Yov
 NcRIr0ZdC0RDfB6uY5qwatvcgoRQctLFekGrZpSVUNeDZ7oN8Zgqcc6IeMnnZlCiyQ1P
 dD3gSmX5BO+eskUqUXBCRu87XRvjcHj0Hl96vm+0UtqcQh8hJjfhL50taaV01MgDm+ZS
 /OH6axTNjwPrxMTKi4DB+m35V0tM3bQg0y7FMm+7m17MlV6DK25njsmjkXPUlbKBaqYK
 vC0Q==
X-Gm-Message-State: AOAM5321MC3TJiwOD29wzFfXPnLRYGoqdwiiTvl1v8GxZ80TBWSdI1VB
 mgb041r54gE7N44F9FvosPQ=
X-Google-Smtp-Source: ABdhPJzTuIrtaP1w1RW0PfvVTA+xgbMdrOWOhLS0fQydCM6Ckk34PyX48uLkgHGN4uezoeGCCHBABA==
X-Received: by 2002:a17:906:2e4b:: with SMTP id
 r11mr2105436eji.227.1593171643145; 
 Fri, 26 Jun 2020 04:40:43 -0700 (PDT)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id q24sm15872460edg.51.2020.06.26.04.40.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2020 04:40:41 -0700 (PDT)
Date: Fri, 26 Jun 2020 13:40:40 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Karol Herbst <kherbst@redhat.com>
Subject: Re: [RFC] Host1x/TegraDRM UAPI
Message-ID: <20200626114040.GA3143884@ulmo>
References: <9b06b7ec-f952-2561-7afb-5653514cd5d3@kapsi.fi>
 <CACO55ttfwQDwnO8ep=YKBgo+HYBg=zLDLfBKtH67MrqKzMWw_w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACO55ttfwQDwnO8ep=YKBgo+HYBg=zLDLfBKtH67MrqKzMWw_w@mail.gmail.com>
User-Agent: Mutt/1.14.4 (2020-06-18)
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
Cc: Mikko Perttunen <cyndis@kapsi.fi>, David Airlie <airlied@linux.ie>,
 gustavo@padovan.org, dri-devel <dri-devel@lists.freedesktop.org>,
 Jon Hunter <jonathanh@nvidia.com>, talho@nvidia.com, bhuntsman@nvidia.com,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 Dmitry Osipenko <digetx@gmail.com>
Content-Type: multipart/mixed; boundary="===============1425030503=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1425030503==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="OXfL5xGRrasGEqWY"
Content-Disposition: inline


--OXfL5xGRrasGEqWY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 26, 2020 at 01:06:58PM +0200, Karol Herbst wrote:
> On Tue, Jun 23, 2020 at 3:03 PM Mikko Perttunen <cyndis@kapsi.fi> wrote:
> >
> > # Host1x/TegraDRM UAPI proposal
> >
> > This is a proposal for a stable UAPI for Host1x and TegraDRM, to replace
> > the current TegraDRM UAPI that is behind `STAGING` and quite obsolete in
> > many ways.
> >
> > I haven't written any implementation yet -- I'll do that once there is
> > some agreement on the high-level design.
> >
> > Current open items:
> >
> > * The syncpoint UAPI allows userspace to create sync_file FDs with
> > arbitrary syncpoint fences. dma_fence code currently seems to assume all
> > fences will be signaled, which would not necessarily be the case with
> > this interface.
> > * Previously present GEM IOCTLs (GEM_CREATE, GEM_MMAP) are not present.
> > Not sure if they are still needed.
> >
>=20
> Hi, as this wasn't addressed here (and sorry if I missed it): is there
> an open source userspace making use of this UAPI? Because this is
> something which needs to be seen before it can be included at all.

There's a set of commits that implement an earlier draft here:

    https://github.com/thierryreding/linux/tree/for-5.6/drm-tegra-destage-a=
bi

and corresponding changes to libdrm to make use of that and implement
tests using the various generations of VIC here:

    https://cgit.freedesktop.org/~tagr/drm/log/

Before actually jumping to an implementation we wanted to go over the
design a bit more to avoid wasting a lot of work, like we've done in
the past. Turns out it isn't easy to get everyone to agree on a good
ABI. Who would've thought? =3D)

I expect that once the discussion around the ABI settles Mikko will
start on implementing this ABI in the kernel and we'll update the
libdrm patches to make use of the new ABI as well.

Thierry

--OXfL5xGRrasGEqWY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl713rQACgkQ3SOs138+
s6HnQQ/9HkD1MHHeapEcnLVFgLiBum365fmqgGgJ5efaTwGtbES9Wet4idqD0wgz
9ARttZ3MLezzzJZWKolNI27ja+MPYnb8UyroITDTseXrVEiLR3/L6t0jeekX6zXA
0sbFZiv33cO9rkgD+z4hYAgadpCvZOOsKb7SciZFqYS6LMxPv6AQ6chX4s3/AXcA
ZSEUCoAesUWopKTsLSHtmBor0VKOaJdSWj4ei3POTBS7LQnhZCIGdZDy+i+Hlmsd
53LW21zaSECPxfSM6ibmhPv9+mvd1QSqBQXryXs8Bohj3/WfYPY6MLVj6Z+2XenQ
hpuXwsAtRJtdi5uJ+l+6N/X9zel1p0RqBXioCU409Gotzn7zbvAYQ2aAvFD8Y1fh
XwTpOMhU8zS16yBsCpFotc9igFeSULuMPt/GcLwnAjspHIoWE2yX5DII/mx/XCmc
IeTnKTlZ8WmWoJJAB/8lnypoMwatDA4ZAYbqgIOPN65dWlXdHxCGkayYN5xj1QRL
f3fBLHsiSXHJ54NhMj50wGMEFjBOq3NdFij7i3z8Zo6Y1UT18L3fuvszJuz0Qk7t
/IqCfN0Fgoc03sj8c9OH00+aMaGg9YxLaOYq06rox87fBD1xPpP7CbLxPbJuSLhf
lBUnIoQKS77gx5cEudEKrqYSSpCUllsxUBcGjhK/9E35MJ/YrTI=
=Ejbg
-----END PGP SIGNATURE-----

--OXfL5xGRrasGEqWY--

--===============1425030503==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1425030503==--
