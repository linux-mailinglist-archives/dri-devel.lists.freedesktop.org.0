Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE2DA4259FC
	for <lists+dri-devel@lfdr.de>; Thu,  7 Oct 2021 19:51:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 867456ED64;
	Thu,  7 Oct 2021 17:51:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 634F56ED64
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Oct 2021 17:51:44 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id v17so21549494wrv.9
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Oct 2021 10:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=qr9MDwBMzsyNipMpKSvmO1rGtnLhU3br6C9ogb2fBw8=;
 b=l0gf8IrjazvORWdZh1xkbtoa0c0CKoUv4AKMehcFzvJQheuGcGirYhPyuyx7+hNTgI
 s/7zGlnozqfQpeqd3vdzzNELUBwjwZVJwm23vLAT5AfQtTpys1t6Pu64Au9fq17Fvrds
 +cr2luV22MzghTXwbPilEE2wvhdgWwNvPSRbKYOgjdnju/617H1R1SfDTg8zdTZjPkL6
 zld5VpxrcX0+oY+gfbAStKRm/yjXp5GugPCK9xEAIggNMIaFuOOLlA99V1WvN7ibTnjB
 FoNjYUaGaqApga+RajhPFk5VpnfDb7hOMiSLU8TCP255JHX/m+r1DwZGlBW8VKlj3LdZ
 CTYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=qr9MDwBMzsyNipMpKSvmO1rGtnLhU3br6C9ogb2fBw8=;
 b=scRYZMQKkHhEhDeRgGwNk1ZSRZLhsz5FhdrC898ZAJwsTW1GGUp6jc28+NvmrE40eQ
 c/wO9tSfVHTfiZw1hG1PWHTKDCGlTAsZOmCTkQpwG26eyd4+7iNcmYTxqQKbOMzK+af2
 6YAPj66bgof7V6vwS/ImU9CBrH3n6QV68o85g8hDJu+VmJ5tedB2SrzHAxwj1gOwFq5A
 zxOQfhHnMSa0PboynOz5uWJZ6I4XqzfHKJD3T8kbriyk7sL+WARGGv0/BuHEjRZHkRvM
 k2wrkNMQ/Lo6vI5MuolIOnD2eE9gzgWRrg8V6EX/fay/xxr/eoElNQC6Oa8ExIDFNuf3
 DRYA==
X-Gm-Message-State: AOAM533+R6rOzR4BlCDEGhSD0ZjL0GZxflxTX1t7qtXKm+Tfh5IxEl+f
 uP7dShCJzOf3iNdnDh5WZYk=
X-Google-Smtp-Source: ABdhPJzGYc6hxjff2pYBQkacMQj+RBkk0ySzdS5FILQml6vO4E7nfSEeog+342kYjoBnnZFmyPmmRg==
X-Received: by 2002:a1c:1b89:: with SMTP id b131mr17756682wmb.71.1633629102798; 
 Thu, 07 Oct 2021 10:51:42 -0700 (PDT)
Received: from localhost ([217.111.27.204])
 by smtp.gmail.com with ESMTPSA id b19sm7506386wmb.1.2021.10.07.10.51.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Oct 2021 10:51:41 -0700 (PDT)
Date: Thu, 7 Oct 2021 19:51:39 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v2] host1x: bus.c: drop excess kernel-doc entry @key
Message-ID: <YV8zqwBiAhOFh9r0@orome.fritz.box>
References: <20211005053726.14738-1-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="kXhwAqbeq5nO1IC+"
Content-Disposition: inline
In-Reply-To: <20211005053726.14738-1-rdunlap@infradead.org>
User-Agent: Mutt/2.1.3 (987dde4c) (2021-09-10)
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


--kXhwAqbeq5nO1IC+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 04, 2021 at 10:37:26PM -0700, Randy Dunlap wrote:
> Fix kernel-doc warning in host1x:
>=20
> ../drivers/gpu/host1x/bus.c:774: warning: Excess function parameter 'key'=
 description in '__host1x_client_register'
>=20
> Fixes: 0cfe5a6e758f ("gpu: host1x: Split up client initalization and regi=
stration")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-tegra@vger.kernel.org
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> ---
> v2: rebase and resend
>=20
>  drivers/gpu/host1x/bus.c |    1 -
>  1 file changed, 1 deletion(-)

Applied, thanks.

Thierry

--kXhwAqbeq5nO1IC+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmFfM6kACgkQ3SOs138+
s6FAVA//cxr3VWWOyxBD5qYYXmO+ZdMi5MeIZUI7hR7+Ure9SOXLlzZ7BOCU6vvh
Mv2VxIUEExKVLlYrUEVlR4G/WfuQHCml/FQeR1PY9CE8uub2zNYorD/ct30hfTeK
nmdxlK8SeQWldwfKxmuK0bL6sw/3riCFj5c2QruEjWDe3qNoeSS9+BHw/3h4PeNf
bx9UdF8vdjnz6Vu4WfIHDTbEZYtpIPuFXvdVyqknGh7CA25yBHf4sdZANQnP45CU
XMtJSvCDV75qTQNuJj5fpFxbuFAAhLCPoCWWrE2IvUluU3Q0wICrq7e5IuhzGBn9
3+Ar6S46NL/VMfRUJuDLNYzNzqNr/APZqh1J9/D+oDvBP2HIkHTBN76nT0IwklKB
j+pfdcFKD8qa4k1yelMznTSFlf9n4pYER3x4xezdl6jqsQtU0BAK88hy5tUP1M08
fRlErL7N71P1KG2izQa8zbIH/slaYgNd4Rqm4pbLYvfel3rt0FHqPXv6JFQrACMY
8Oub0cvReNN5YrVz1Qo2M0IkdPqHlhSTdvnXc4y3YdMkBsDhzLEULrp9cy7cqw4/
olreNada5aP0ANRylBC5tidRK3wOoGFEhBxa7WNXfN8riW3TIcAC0jdoTlr0KYx2
9rmf/oo/MvjnlKrXtb45xeVlVOLrqpwBO01xUZI7keSMbc7m5cA=
=NJUt
-----END PGP SIGNATURE-----

--kXhwAqbeq5nO1IC+--
