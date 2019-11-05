Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85104EF1E5
	for <lists+dri-devel@lfdr.de>; Tue,  5 Nov 2019 01:26:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 125916E8C4;
	Tue,  5 Nov 2019 00:26:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com
 [IPv6:2607:f8b0:4864:20::836])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B8376E8C4
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Nov 2019 00:26:11 +0000 (UTC)
Received: by mail-qt1-x836.google.com with SMTP id y39so26892298qty.0
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Nov 2019 16:26:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=vGAWpCYyQmdpG0fVWfM47K0qqxSbXPboe+puExmNy/Q=;
 b=Nd/3X7IsYRCH5otsg9yFNKht1Agm2PsqyvA4MmpVr+LjI6GS9sY1uB6pqBj/uk+pOX
 zKvTA7HYUi4a7ajdg/gGArb2T7+cSg4E0FiISRNVFgflEGfUpTmzpXD1Pa6+8MQymFjq
 AVbyTt++zUkiQoRsSp9tRMXy9k40yR3obtlCCLnd1P1UhZPKtxj9n8M/05z0ZfXKtCmk
 oba+ITGUNSqCsNco8p90tlbiagLnhGKsjXGGRdMfMpUxpqPy2tMHjqDRKKDQ3AWDSK7z
 Ieci5O///Xu598rfEOErTKm0rhaalvbEQwBy0ePeDihl9mz4NdwsoVTggKpeelytcMAN
 Uqag==
X-Gm-Message-State: APjAAAUr0JGWpmW4Ey0OYqxCEn+nIQxvtyzYIwYm9Ao9cPVJdkr47pPK
 JSKeENGks3miRGmdd9M2xUUdgpim048=
X-Google-Smtp-Source: APXvYqw64/yT3HNa1mqmD5oeeGGQdIx7SWuSCSQq3pbWmU49SkUD327kCjq+LB7sdISGJVYIIDbhDQ==
X-Received: by 2002:ac8:7655:: with SMTP id i21mr15463788qtr.53.1572913570541; 
 Mon, 04 Nov 2019 16:26:10 -0800 (PST)
Received: from smtp.gmail.com ([165.204.55.250])
 by smtp.gmail.com with ESMTPSA id z70sm9888034qkb.60.2019.11.04.16.26.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Nov 2019 16:26:09 -0800 (PST)
Date: Mon, 4 Nov 2019 19:26:07 -0500
From: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
To: Gabriela Bittencourt <gabrielabittencourt00@gmail.com>
Subject: Re: [PATCH VKMS v3] drm/doc: Add VKMS module description and use to
 "Testing and Validation"
Message-ID: <20191105002606.4h7brs4ozqwcb5zm@smtp.gmail.com>
References: <20191104162705.19735-1-gabrielabittencourt00@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20191104162705.19735-1-gabrielabittencourt00@gmail.com>
User-Agent: NeoMutt/20180716
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=vGAWpCYyQmdpG0fVWfM47K0qqxSbXPboe+puExmNy/Q=;
 b=tG9hbrGoCba4iRI4dXjXXAQSmknmxx2F03TKI/FmsHZpeI4YtT+lJuxTmB4lduVFBf
 8N8QqospPyimSjxvfn+PGgpJQ2ssy5lKotG5b9/skRZAXZ2geOe4s6FAKvzfxAtq1Jf1
 cEksRyo92lCUEKBbWM6kcrVRmxf9vEfbctWP0NAcd2fYGCZPisiP/MaB8XcL5XEq5USu
 JKP929U3BZadQ1mL8MinREFNR9atUrbnwmO6exf9hH16QT1+bnC4/KipN+afpE14jpWx
 a7aOED4uCGBHw8Hsvl1bnbewkeL9B/5Mqt2Vy/4ba9lYIsrstdnrzu7eL78GgIgUm2UB
 vo6g==
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
Cc: hamohammed.sa@gmail.com, corbet@lwn.net, airlied@linux.ie,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 manasi.d.navare@intel.com, outreachy-kernel@googlegroups.com,
 lkcamp@lists.libreplanetbr.org, dri-devel@lists.freedesktop.org,
 sean@poorly.run
Content-Type: multipart/mixed; boundary="===============0921168405=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0921168405==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nzbdziewgyxr7kks"
Content-Disposition: inline


--nzbdziewgyxr7kks
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

lgtm, I'll apply it tomorrow.

Thanks

Reviewed-by: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>

On 11/04, Gabriela Bittencourt wrote:
> Add a description on VKMS module and the cases in which it should be used.
> There's a brief explanation on how to set it and use it in a VM, along wi=
th
> an example of running an igt-test.
>=20
> Changes since V3:
>  Rodrigo:
>  - Change the log message to imperative
>  - Fix some bad spelling/writing
>  - Add a blank line before enumeration
>=20
> Changes since V2:
>  Andre:
>  - Avoid repetition of words in the same sentence;
>  - Make the explanation on 'setting the kernel' shorter, eliminate the
>    'make menuconfig' command;
>  - Add tab on enumeration to have one line per item;
>  - Clarify from each machine igt-tests commands should be ran on.
>=20
> Signed-off-by: Gabriela Bittencourt <gabrielabittencourt00@gmail.com>
> ---
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
>  Documentation/gpu/drm-uapi.rst | 37 ++++++++++++++++++++++++++++++++++
>  1 file changed, 37 insertions(+)
>=20
> diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.=
rst
> index 94f90521f58c..8271c1e240b7 100644
> --- a/Documentation/gpu/drm-uapi.rst
> +++ b/Documentation/gpu/drm-uapi.rst
> @@ -285,6 +285,43 @@ run-tests.sh is a wrapper around piglit that will ex=
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
> +virtual machine without display, simplifying the validation of some of t=
he
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
> +
> +	1. Use IGT inside a VM
> +	2. Use IGT from the host machine and write the results in a shared dire=
ctory.
> +
> +As follow, there is an example of using a VM with a shared directory with
> +the host machine to run igt-tests. As an example it's used virtme::
> +
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

--nzbdziewgyxr7kks
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE4tZ+ii1mjMCMQbfkWJzP/comvP8FAl3AwZ4ACgkQWJzP/com
vP8WWg/9GIwArmMbTRYE9qkqkNDLclr/1TCgv/jtWAmjWNGvp9yh8uRurcT3tX9m
utTEiQmhdHcyc1YzdL+WqJgqR25kU2Kb7roXmyP5/0Y5nrePC3j7nVAr/zoqVOaM
J0/k8cPSO1BTs/QI35Cg7hvrbggWXtNka+IpxK3d5tjDMQ5YwMBOkKOlOBL6aZoD
T3Q5qzTeKhA1kr9yaZw6ADr2MmEHQloRShsEemGCHuzQ44Od+vSC8D/ZItuJJxFp
8GnRHtPg2eZbloGRZGojT6gGKrWC2roO5/WMJcYAIMVgmbBjh/RXBDiEBDk8b5yw
5avVz7/P2+qKQzUTtlWiZS5wO1Yr6w6+ZrwWfdtNKD8WYr+O6D2yCOWLceqdJFtz
v0N/DDLZHLxHFyS4HFgUFeKzluPSVnzht6PD6EpprzSwT3itm5/6VnPTkKm0BlVm
CqeViy5kU708W0rcVrnDPJfZefO0vodfn2C1s1pkp+5x1Gm6eY6Ot+1PKoR1tjxY
cQt9V6Ih1j11sQJ1tcDCOaRKH3mqlw5MDe8Di5kR7re+UGTJN579cHZuyG9LrAqA
BN08l1Ys8BMlFL4F2FdkoFHRRh/VaDLN8FOW0zXpcb0Ypa1p8MjxrBW85ITADMOu
oOd93McE+kcmWjUxVy3xWAWcqCMA9cg4c5dmaGxayTlN0TbAnxU=
=8UYP
-----END PGP SIGNATURE-----

--nzbdziewgyxr7kks--

--===============0921168405==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0921168405==--
