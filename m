Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 23C147B507C
	for <lists+dri-devel@lfdr.de>; Mon,  2 Oct 2023 12:40:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB2DF10E286;
	Mon,  2 Oct 2023 10:40:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84AD710E286
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Oct 2023 10:40:50 +0000 (UTC)
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-690ce3c55f1so12705649b3a.0
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Oct 2023 03:40:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696243250; x=1696848050; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=k9BO5D+Mkjuw7PSwT8qd3pRlmg1ZqF7ESwmXR7Zy97c=;
 b=H4jppS+C4D4npMCqDA55xfDDlaSAn4KipJft+WBlJw8cf0+TPcJYmNe1Tm07lsiV5r
 +tj5WjlwcWeT7+iQRCJqV+hp8ES2XfrIcT1Gp53u1PtrOArHc6PIwpeZLHBzBmAoSKv2
 gUgwHUwKmwQe48cNL/Mo3Ocuzt9t0vC+cIi42+fT1g6hbwGT/Of+RMNBExeSRhBuzVum
 u78qWgUORJdAwJiPtnGVOmu8dGWyAg6RkUyOXfF2/EES5XKFYFRXXnxHsbLUIvE46x7r
 XBhCvq0MBw3zqehqurzteuZP8IlSVzvInwHu8mPLjONB7r/sR+YFqHu5hs9E0nygsRci
 GsOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696243250; x=1696848050;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=k9BO5D+Mkjuw7PSwT8qd3pRlmg1ZqF7ESwmXR7Zy97c=;
 b=XoeVQnCWKxq1RFSiEVWArmDcKwsab5eg4jNPza7sjGUNfAaT8VecuWLE3k+pb8ZKTA
 CL4zpTvonPoTcHKWYUSTOgfOVEfg1xKY9r43Tc5H9Et1toMLjOYwi43PakTmvwFueho+
 iVqlUNiKjmS/zvjkw4CPgdqAC/+cgfJ+fECz+wtzqT7OZHgO1gpnMpkNWC9y0uqJl2C0
 g51rZcOgj37RYTuUIgyAXAhPyDGG5ocf1hj2PmsNkA3uufiLvxlmNBXGDEHCKhfbEI1D
 SQ4SydDLt0D6yplDMavfaO5ojVlIohwTc5tT99rqAosNYPoyYn7MCq5gTl14cD9Gd8rU
 QWRw==
X-Gm-Message-State: AOJu0Yzmk2AQERBvNmD8/h+wCxkyb06OlaM5BuHNc33n3lkNJA0uGKrH
 LbEJLOAANJC73h0N80Z45LI7HIKTW4M=
X-Google-Smtp-Source: AGHT+IFlnNgl9H4s1s1mbNRBP7UTYC/EN207XDgHcMg4TOAVrYrNv9S3E9tLPTTfOAc6vNuU6e6xLw==
X-Received: by 2002:a05:6a20:2447:b0:14c:5fa6:e308 with SMTP id
 t7-20020a056a20244700b0014c5fa6e308mr10801060pzc.43.1696243249963; 
 Mon, 02 Oct 2023 03:40:49 -0700 (PDT)
Received: from debian.me ([103.131.18.64]) by smtp.gmail.com with ESMTPSA id
 h20-20020a170902f7d400b001c0c86a5415sm3085459plw.154.2023.10.02.03.40.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Oct 2023 03:40:49 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
 id E92F9813713B; Mon,  2 Oct 2023 17:40:43 +0700 (WIB)
Date: Mon, 2 Oct 2023 17:40:43 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Oleksandr Natalenko <oleksandr@natalenko.name>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [REGRESSION] BUG: KFENCE: memory corruption in
 drm_gem_put_pages+0x186/0x250
Message-ID: <ZRqeK_OgfDS4liMt@debian.me>
References: <13360591.uLZWGnKmhe@natalenko.name>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="uM8moMeUE6uskfmd"
Content-Disposition: inline
In-Reply-To: <13360591.uLZWGnKmhe@natalenko.name>
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
Cc: Linux Regressions <regressions@lists.linux.dev>,
 Maxime Ripard <mripard@kernel.org>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org,
 Linux DRI Development <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--uM8moMeUE6uskfmd
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 01, 2023 at 06:32:34PM +0200, Oleksandr Natalenko wrote:
> Hello.
>=20
> I've got a VM from a cloud provider, and since v6.5 I observe the followi=
ng kfence splat in dmesg during boot:
>=20
> ```
> BUG: KFENCE: memory corruption in drm_gem_put_pages+0x186/0x250
>=20
> Corrupted memory at 0x00000000e173a294 [ ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! =
] (in kfence-#108):
>  drm_gem_put_pages+0x186/0x250
>  drm_gem_shmem_put_pages_locked+0x43/0xc0
>  drm_gem_shmem_object_vunmap+0x83/0xe0
>  drm_gem_vunmap_unlocked+0x46/0xb0
>  drm_fbdev_generic_helper_fb_dirty+0x1dc/0x310
>  drm_fb_helper_damage_work+0x96/0x170
>  process_one_work+0x254/0x470
>  worker_thread+0x55/0x4f0
>  kthread+0xe8/0x120
>  ret_from_fork+0x34/0x50
>  ret_from_fork_asm+0x1b/0x30
>=20
> kfence-#108: 0x00000000cda343af-0x00000000aec2c095, size=3D3072, cache=3D=
kmalloc-4k
>=20
> allocated by task 51 on cpu 0 at 14.668667s:
>  drm_gem_get_pages+0x94/0x2b0
>  drm_gem_shmem_get_pages+0x5d/0x110
>  drm_gem_shmem_object_vmap+0xc4/0x1e0
>  drm_gem_vmap_unlocked+0x3c/0x70
>  drm_client_buffer_vmap+0x23/0x50
>  drm_fbdev_generic_helper_fb_dirty+0xae/0x310
>  drm_fb_helper_damage_work+0x96/0x170
>  process_one_work+0x254/0x470
>  worker_thread+0x55/0x4f0
>  kthread+0xe8/0x120
>  ret_from_fork+0x34/0x50
>  ret_from_fork_asm+0x1b/0x30
>=20
> freed by task 51 on cpu 0 at 14.668697s:
>  drm_gem_put_pages+0x186/0x250
>  drm_gem_shmem_put_pages_locked+0x43/0xc0
>  drm_gem_shmem_object_vunmap+0x83/0xe0
>  drm_gem_vunmap_unlocked+0x46/0xb0
>  drm_fbdev_generic_helper_fb_dirty+0x1dc/0x310
>  drm_fb_helper_damage_work+0x96/0x170
>  process_one_work+0x254/0x470
>  worker_thread+0x55/0x4f0
>  kthread+0xe8/0x120
>  ret_from_fork+0x34/0x50
>  ret_from_fork_asm+0x1b/0x30
>=20
> CPU: 0 PID: 51 Comm: kworker/0:2 Not tainted 6.5.0-pf4 #1 8b557a4173114d8=
6eef7240f7a080080cfc4617e
> Hardware name: Red Hat KVM, BIOS 1.11.0-2.el7 04/01/2014
> Workqueue: events drm_fb_helper_damage_work
> ```
>=20
> This repeats a couple of times and then stops.
>=20
> Currently, I'm running v6.5.5. So far, there's no impact on how VM functi=
ons for me.
>=20
> The VGA adapter is as follows: 00:02.0 VGA compatible controller: Cirrus =
Logic GD 5446
>=20

Thanks for the regression report. I'm adding it to regzbot:

#regzbot ^introduced: v6.4..v6.5

--=20
An old man doll... just what I always wanted! - Clara

--uM8moMeUE6uskfmd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZRqeJgAKCRD2uYlJVVFO
o94vAQCdK24gbHlE/TSwSnvd8j9uYgtSWF/9JqsuTYcNEIa0QAEAqxCJP7ARfCvm
lDkVmrAMOBGxe7Qpk16rqel6QsVTZQQ=
=lq18
-----END PGP SIGNATURE-----

--uM8moMeUE6uskfmd--
