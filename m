Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2365EE317
	for <lists+dri-devel@lfdr.de>; Mon,  4 Nov 2019 16:06:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7A796E51B;
	Mon,  4 Nov 2019 15:06:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47E526E51B
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Nov 2019 15:06:13 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id 205so16555954qkk.1
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Nov 2019 07:06:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=0T+pZ8Cy3rQ0P75sV+yYIqy4pMVLEk5JTQlQ3VkapLU=;
 b=Mh/PHudAXNDa34W4wGejcpMBK3UbRl8lV4VddrlnxZmhN88C7TFz0Aeb3qSyxCwHeC
 pTs5yqE4ld7trSgIW/T9Gcr9KRtcoVOXagDAMk4WT8qYQJMq7cWwLpLBen7V2y37W95X
 8+iJcYZ8lZXtYz6DYP18+3WAmlMx4dkQajEo9AUYFmHYILNwNC7+Mw/UtBG+eqYIQNjY
 rNzBwlqfuivL/eHrfwYjcnz+hLYX8bE/SYz4mmqKLucX4FyAUsS4bgHUCfl+4D5CopQM
 vrsRSN5hR71PZGs5d0OE8PRrmJTy/xqd0MJHHCfbdoNAiAFub9VEyQTKQIozruNtufNq
 J8mQ==
X-Gm-Message-State: APjAAAUswlukAG20UuHwoJq7giwP2Kd64TQBgSh0FKBdboBtyKGmyLpB
 T9H706E0snmZ7OxPeDa7ch8=
X-Google-Smtp-Source: APXvYqyhBU9Y5gT7NZohXC8RIYAaf3geAZ1+pDCWSazuXBimuMpaM+5+LLDygxGV/CURneW+BJVicA==
X-Received: by 2002:a37:484b:: with SMTP id v72mr18748128qka.251.1572879972224; 
 Mon, 04 Nov 2019 07:06:12 -0800 (PST)
Received: from smtp.gmail.com ([165.204.55.250])
 by smtp.gmail.com with ESMTPSA id x133sm8311216qka.44.2019.11.04.07.06.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Nov 2019 07:06:11 -0800 (PST)
Date: Mon, 4 Nov 2019 10:06:09 -0500
From: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
To: Gabriela Bittencourt <gabrielabittencourt00@gmail.com>
Subject: Re: [PATCH v2] drm/doc: Adding VKMS module description and use to
 "Testing and Validation"
Message-ID: <20191104150607.gmkdksofuzajoz4d@smtp.gmail.com>
References: <20191101154314.25435-1-gabrielabittencourt00@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20191101154314.25435-1-gabrielabittencourt00@gmail.com>
User-Agent: NeoMutt/20180716
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=0T+pZ8Cy3rQ0P75sV+yYIqy4pMVLEk5JTQlQ3VkapLU=;
 b=GgLqokPYwHwSp+p+PgfCBmdWH4FrVmPL/dJv/9J/jnnyOJXdimRGbe+hIstYSMW6Bh
 w6uaVRiKWi1jgf4uFDHDM4enwbMVhn3NtiP32yjBj2aLspHmlgLXh+jDSC7niuECHKw+
 7f55KHVGNyNNYJ5jYgYQe38tgFlIToqFt7Zv/UNI/pmbUcBPXk+OaNm/uFfQ31sgRGSP
 zcqBU4c5PqTEuMz7R/7+jBuwxH8WFVQkvdboiXGcovc5VMC+vdcgtICynFIE4GACGwk7
 S6d69lZemKUztgFHXhjZXd17n2A9tQ+rfS076l/vWaNtVU9jzAsMBGvv6c0WWa8gXGV+
 9okQ==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: corbet@lwn.net, airlied@linux.ie, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, manasi.d.navare@intel.com,
 outreachy-kernel@googlegroups.com, lkcamp@lists.libreplanetbr.org,
 dri-devel@lists.freedesktop.org, sean@poorly.run
Content-Type: multipart/mixed; boundary="===============1627560603=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1627560603==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="35pfgy7zittkqnjt"
Content-Disposition: inline


--35pfgy7zittkqnjt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Gabriela,

Thank you very much for working on improving our documentation.

For me the patch looks good, I just have some nitpick.

First, it is recommended to use an imperative mood in the subject line.
Try something like this:

 Add VKMS module description under "Testing and Validation" section

On 11/01, Gabriela Bittencourt wrote:
> Add a description on VKMS module and the cases in which it should be used.
> There's a brief explanation on how to set it and use it in a VM, along wi=
th
> an example of running an igt-test.
>=20
> Signed-off-by: Gabriela Bittencourt <gabrielabittencourt00@gmail.com>
>=20
> ---
>=20
> Changes in v2:
> - Avoid repetition of words in the same sentence;
> - Make the explanation on 'setting the kernel' shorter, eliminate the
> 'make menuconfig' command;
> - Add tab on enumeration to have one line per item;
> - Clarify from each machine igt-tests commands should be ran on.
>=20
> Tested the patch using 'make htmldocs' to make sure the output .html is
> correct.
>=20
> Hi DRM-community,
> this is my first (of many, I hope)  patch in this subsystem. I hope to ha=
ve
> a lot of learning (and fun :)) working with you guys.
> I'm starting by documenting the VKMS driver in "Userland interfaces", if I
> have been inaccurate in my description or if I misunderstood some concept,
> please let me know.
> ---
>  Documentation/gpu/drm-uapi.rst | 36 ++++++++++++++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
>=20
> diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.=
rst
> index 94f90521f58c..1586cbba05d0 100644
> --- a/Documentation/gpu/drm-uapi.rst
> +++ b/Documentation/gpu/drm-uapi.rst
> @@ -285,6 +285,42 @@ run-tests.sh is a wrapper around piglit that will ex=
ecute the tests matching
>  the -t options. A report in HTML format will be available in
>  ./results/html/index.html. Results can be compared with piglit.
> =20
> +Using VKMS to test DRM API
> +--------------------------
> +
> +VKMS is a software-only model of a KMS driver that is useful for testing
> +and for running compositors. VKMS aims to enable a virtual display witho=
ut
> +the need for a hardware display capability. These characteristics made V=
KMS
> +a perfect tool for validating the DRM core behavior and also support the
> +compositor developer. VKMS makes it possible to test DRM functions in a
> +virtual machine without display, simplifing the validation of some of the

/simplifing/simplifying/

> +core changes.
> +
> +To Validate changes in DRM API with VKMS, start setting the kernel: make
> +sure to enable VKMS module; compile the kernel with the VKMS enabled and
> +install it in the target machine. VKMS can be run in a Virtual Machine
> +(QEMU, virtme or similar). It's recommended the use of KVM with the mini=
mum
> +of 1GB of RAM and four cores.
> +
> +It's possible to run the IGT-tests in a VM in two ways:

Break line or add "::" at the end of the phrase, otherwise the above
line will be bold.

> +	1. Use IGT inside a VM
> +	2. Use IGT from the host machine and write the results in a shared dire=
ctory.
> +
> +As follow, there is an example of using a VM with a shared directory with
> +the host machine to run igt-tests. As example it's used virtme::
> +

/As example/As an example,/

Best Regards

> +	$ virtme-run --rwdir /path/for/shared_dir --kdir=3Dpath/for/kernel/dire=
ctory --mods=3Dauto
> +
> +Run the igt-tests in the guest machine, as example it's ran the 'kms_fli=
p'
> +tests::
> +
> +	$ /path/for/igt-gpu-tools/scripts/run-tests.sh -p -s -t "kms_flip.*" -v
> +
> +In this example, instead of build the igt_runner, Piglit is used
> +(-p option); it's created html summary of the tests results and it's sav=
ed
> +in the folder "igt-gpu-tools/results"; it's executed only the igt-tests
> +matching the -t option.
> +
>  Display CRC Support
>  -------------------
> =20
> --=20
> 2.20.1
>=20

--=20
Rodrigo Siqueira
Software Engineer, Advanced Micro Devices (AMD)
https://siqueira.tech

--35pfgy7zittkqnjt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIyBAEBCgAdFiEE4tZ+ii1mjMCMQbfkWJzP/comvP8FAl3APl8ACgkQWJzP/com
vP8Zhg/4p3v0VFWH55Z5qQ6Zd+bbz9L4pmjlqe6qe9Td2VAhII1uAUdgZ8fYWfie
csclAyx3nBZjMoWFHVlOe/L6WLll7kFJ481gWleNMQlxzXPFB9UMA2d+ag4lnPXf
tFalyxgRtlon52gZbhfYlMYXcOgFCuM7dwgLvFy4jizNbWo8Df+j6AL/LwKMZj+K
Emi9opYY+J6zGfGtR0l32I7Pn5wFyD24VYUOwAuiINj8ofMs6i84oMmVDrO3MfjJ
7W7N0F7795a6OVSUFp+EzH9mSj4pg7v9U8DNhKg9jGBlttphsvRjNUtGUpr0+xMU
bp33i4tE6tGEqaP/lTCPYNhR49Q3I9cyuEShj43UeQFx0Ux3zNNagU6xek0Pfm2U
96NsAa8SYtumTv2qgx+oUB2fyFvlX7YTqbLAcVsa9Kh6F1e7uvsmfQECGvX+au0j
DAmapthA0+z2UBn1+Dg0LKHHOPCiM4d95j5QWHxzXZ5v9I3fxmHH6qAHKl3srQZ6
OGVtlbcpRX0vsNFmAZCvfRXgiQOgFOCNKDNwVGba+6ej9eei/vUEj/eDP65jREO3
ifFK5Bz66dgWNoKtYANEHdEJffH9nazWvGtMTE3+DydWVUt+3/np3s79GjQ0QEit
ZSxIF4LVH0sTfmRj/2wgfj6v4tloBbIVLaZ2/8XQKmWbBh5gbQ==
=qUfx
-----END PGP SIGNATURE-----

--35pfgy7zittkqnjt--

--===============1627560603==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1627560603==--
