Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 316911CD4D6
	for <lists+dri-devel@lfdr.de>; Mon, 11 May 2020 11:26:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85D6A89DF7;
	Mon, 11 May 2020 09:26:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E28889C83;
 Mon, 11 May 2020 09:26:14 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id a4so6879701lfh.12;
 Mon, 11 May 2020 02:26:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=4zo7jzvpk/vepLsJ+HeP+FA5ukIAt2q8Oi1cr2q/goI=;
 b=jdVd4ZgR02BCIFjs6LCvyJyCKthKZ0OwS/H6bLMVvtNhhIOtM2SAVnsR4FWZdD7FGG
 tPDVNHBYuHF3v8LgPVi5RFQmKWPY0f42t18KCN0RgyVOxqu9cmi5xjeseSIPaMpY+mN8
 xU0CRQBSyATjsU0GP9A6O0jgt3cU8Fh4bdsLxp4+KIz+s/0MBKdB1ZXX4EHy1f0prlp7
 jXyjkwZBwHevOj4PmLo4FnTNoW2NxA5v3mXg3QX5I6NMlP9zsi3/rmlYzImu5G03xWD4
 oRwBXtg2pR8gESG4CbaHg4iXj7CV0IUXQLpjBOLjCINrVGYCRwweej2GcbelpiQ0uVo2
 +rUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=4zo7jzvpk/vepLsJ+HeP+FA5ukIAt2q8Oi1cr2q/goI=;
 b=GCZcyeHGjBo/D0HSyD6RIzV5+zDuks0feucCyzTqOhljN7ocNuLuFY1VRfm6qqU9Qj
 /TcRXZbPMrucg6CdnofR2zqdIy8rCfZdoAjvI7qsRtbdtfuKze0NdiB5+0H6I+nMWqz3
 jiEA2peqZMivEpRfNHrQdCv1bqhPZoANhB+80hnkWZjeXh9xahAE7nGZKplQDNbIgCVA
 KkZYzHVLU97EkQi5kmapKQLidM1FV1QRVlYc+B5tTxhtGeRUZV2h17eEMJtB8sakJNY8
 smrlYA/NTANqg2CJ848RK/eQcpYKemnceQNXWIkDEZCFTyhMT4bBPQrEc6YPMUJfABrq
 1hMg==
X-Gm-Message-State: AOAM532/nSBZfEa/7QDVAshU1t0HLAqBnROpM2d3l8Pkg4N239hjORyY
 udp/RjAN7j0aEsYN8sttEWA=
X-Google-Smtp-Source: ABdhPJwg9juRlJdYB40k2MpFA+LR7LsGYm4ZiSldRIWGXVHOG58HbIKcNK5wdol3SE3ei71+Ynxl5w==
X-Received: by 2002:ac2:53af:: with SMTP id j15mr10549137lfh.191.1589189172225; 
 Mon, 11 May 2020 02:26:12 -0700 (PDT)
Received: from eldfell.localdomain ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id w9sm9253730ljw.39.2020.05.11.02.26.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2020 02:26:11 -0700 (PDT)
Date: Mon, 11 May 2020 12:26:00 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Subject: Re: [PATCH 0/6] RFC Support hot device unplug in amdgpu
Message-ID: <20200511122600.0adb4494@eldfell.localdomain>
In-Reply-To: <1589050310-19666-1-git-send-email-andrey.grodzovsky@amd.com>
References: <1589050310-19666-1-git-send-email-andrey.grodzovsky@amd.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
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
Cc: daniel.vetter@ffwll.ch, michel@daenzer.net, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, ckoenig.leichtzumerken@gmail.com
Content-Type: multipart/mixed; boundary="===============0116705663=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0116705663==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/05sbnmefCCihWg0NzLbh/hq"; protocol="application/pgp-signature"

--Sig_/05sbnmefCCihWg0NzLbh/hq
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Sat, 9 May 2020 14:51:44 -0400
Andrey Grodzovsky <andrey.grodzovsky@amd.com> wrote:

> This RFC is a more of a proof of concept then a fully working
> solution as there are a few unresolved issues we are hopping to get
> advise on from people on the mailing list. Until now extracting a
> card either by physical extraction (e.g. eGPU with thunderbold
> connection or by emulation through syfs
> -> /sys/bus/pci/devices/device_id/remove) would cause random crashes
> in user apps. The random crashes in apps were mostly due to the app
> having mapped a device backed BO into it's adress space was still
> trying to access the BO while the backing device was gone. To answer
> this first problem Christian suggested to fix the handling of mapped
> memory in the clients when the device goes away by forcibly unmap all
> buffers the user processes has by clearing their respective VMAs
> mapping the device BOs. Then when the VMAs try to fill in the page
> tables again we check in the fault handler if the device is removed
> and if so, return an error. This will generate a SIGBUS to the
> application which can then cleanly terminate. This indeed was done
> but this in turn created a problem of kernel OOPs were the OOPSes
> were due to the fact that while the app was terminating because of
> the SIGBUS it would trigger use after free in the driver by calling
> to accesses device structures that were already released from the pci
> remove sequence. This we handled by introducing a 'flush' seqence
> during device removal were we wait for drm file reference to drop to
> 0 meaning all user clients directly using this device terminated.
> With this I was able to cleanly emulate device unplug with X and
> glxgears running and later emulate device plug back and restart of X
> and glxgears.
>=20
> But this use case is only partial and as I see it all the use cases
> are as follwing and the questions it raises.
>=20
> 1) Application accesses a BO by opening drm file
> 	1.1) BO is mapped into applications address space (BO is CPU visible) - =
this one we have a solution for by invaldating BO's CPU mapping casuing SIG=
BUS=20
> 	     and termination and waiting for drm file refcound to drop to 0 befo=
re releasing the device
> 	1.2) BO is not mapped into applcation address space (BO is CPU invisible=
) - no solution yet because how we force the application to terminate in th=
is case ?
>=20
> 2) Application accesses a BO by importing a DMA-BUF
> 	2.1)  BO is mapped into applications address space (BO is CPU visible) -=
 solution is same as 1.1 but instead of waiting for drm file release we wai=
t for the=20
> 	      imported dma-buf's file release
> 	2.2)  BO is not mapped into applcation address space (BO is CPU invisibl=
e) - our solution is to invalidate GPUVM page tables and destroy backing st=
orage for=20
>               all exported BOs which will in turn casue VM faults in the =
importing device and then when the importing driver will try to re-attach t=
he imported BO to=20
> 	      update mappings we return -ENODEV in the import hook which hopeffu=
ly will cause the user app to terminate.
>=20
> 3) Applcation opens a drm file or imports a dma-bud and holds a reference=
 but never access any BO or does access but never more after device was unp=
lug - how would we=20
>    force this applcation to termiante before proceeding with device remov=
al code ? Otherwise the wait in pci remove just hangs for ever.
>=20
> The attached patches adress 1.1, 2.1 and 2.2, for now only 1.1 fully test=
ed and I am still testing the others but I will be happy for any advise on =
all the=20
> described use cases and maybe some alternative and better (more generic) =
approach to this like maybe obtaining PIDs of relevant processes through so=
me revere=20
> mapping from device file and exported dma-buf files and send them SIGKILL=
 - would this make more sense or any other method ?=20
>=20
> Patches 1-3 address 1.1
> Patch 4 addresses 2.1
> Pathces 5-6 address 2.2
>=20
> Reference: https://gitlab.freedesktop.org/drm/amd/-/issues/1081

Hi,

how did you come up with the goal "make applications terminate"? Is
that your end goal, or is it just step 1 of many on the road of
supporting device hot-unplug?

Why do you want to terminate also applications that don't "need" to
terminate? Why hunt them down? I'm referring to your points 1.2, 2.2
and 3.

=46rom an end user perspective, I believe making applications terminate
is not helpful at all. Your display server still disappears, which
means all your apps are forced to quit, and you lose your desktop. I do
understand that a graceful termination is better than a hard lockup,
but not much.

When I've talked about DRM device hot-unplug with Daniel Vetter, our
shared opinion seems to be that the unplug should not outright kill any
programs that are prepared to handle errors, that is, functions or
ioctls that return a success code can return an error, and then it is
up for the application to decide how to handle that. The end goal must
not be to terminate all applications that had something to do with the
device. At the very least the display server must survive.

The rough idea on how that should work is that DRM ioctls start
returning errors and all mmaps are replaced with something harmless
that does not cause a SIGBUS. Userspace can handle the errors if it
wants to, and display servers will react to the device removed uevent
if not earlier.

Why deliberately avoid raising SIGBUS? Because it is such a huge pain
to handle due to the archaic design of how signals are delivered. Most
of existing userspace is also not prepared to handle SIGBUS anywhere.

The problem of handling SIGBUS at all is that a process can only have a
single signal handler per signal, but the process may comprise of
multiple components that cannot cooperate on signal catching: Mesa GPU
drivers, GUI toolkits, and the application itself may all do some
things that would require handling SIGBUS if removing a DRM device
raised it. For Mesa to cooperate with SIGBUS handling with the other
components in the process, we'd need some whole new APIs, an EGL
extension and maybe Vulkan extension too. The process may also have
threads, which are really painful with signals. What if you need to
handle the SIGBUS differently in different threads?

Hence, mmaps should be replaced with something harmless, maybe
something that reads back all zeros and ignores writes. The application
will learn later that the DRM device is gone. Sending it a SIGBUS on
the spot when it accesses an mmap does not help: the memory is gone
already - if you didn't have a backup of the contents, you're not going
to make one now.

My point here is, are you designing things to specifically only
terminate processes, or will you leave room in the design to improve the
implementation towards a proper handling of DRM device hot-unplug?


Thanks,
pq


>=20
> Andrey Grodzovsky (6):
>   drm/ttm: Add unampping of the entire device address space
>   drm/amdgpu: Force unmap all user VMAs on device removal.
>   drm/amdgpu: Wait for all user clients
>   drm/amdgpu: Wait for all clients importing out dma-bufs.
>   drm/ttm: Add destroy flag in TTM BO eviction interface
>   drm/amdgpu: Use TTM MMs destroy interface
>=20
>  drivers/gpu/drm/amd/amdgpu/amdgpu.h         |  3 ++
>  drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c |  2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c  |  7 +++-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c | 27 ++++++++++++-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c     | 22 ++++++++--
>  drivers/gpu/drm/amd/amdgpu/amdgpu_job.c     |  9 +++++
>  drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c     |  4 ++
>  drivers/gpu/drm/amd/amdgpu/amdgpu_object.c  | 17 +++++++-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_object.h  |  1 +
>  drivers/gpu/drm/nouveau/nouveau_drm.c       |  2 +-
>  drivers/gpu/drm/qxl/qxl_object.c            |  4 +-
>  drivers/gpu/drm/radeon/radeon_object.c      |  2 +-
>  drivers/gpu/drm/ttm/ttm_bo.c                | 63 +++++++++++++++++++++--=
------
>  drivers/gpu/drm/vmwgfx/vmwgfx_drv.c         |  6 +--
>  include/drm/ttm/ttm_bo_api.h                |  2 +-
>  include/drm/ttm/ttm_bo_driver.h             |  2 +
>  16 files changed, 139 insertions(+), 34 deletions(-)
>=20


--Sig_/05sbnmefCCihWg0NzLbh/hq
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl65GigACgkQI1/ltBGq
qqc0TQ//Wa351FirirqlSq/HfRY6tjeNcWcvjjg55BGAFsZXtRsuxzaYG6VsWTZx
9kMl/YFvIvPIhl8vqI+Nhl7r9R+hM2GS0oeXlkaPPyYivkffvf/MFTQePXp3jh7f
g08x5Z2MsdUrAWrujxLMKBBsUUxDWEYhVmrL4XunfMuYLtZWHN2y/9l5z569/aWF
vLhhx+or1vKk1hndowNM5/aNWRJBQrhfHQp3zuuLHIlWBDvcvLySMmKkQWJeuzid
PZRiV/EbpHYkhsAuBGUtZhTonRxJVg8gBtq2RUMxY1kt55K0dPWLUrYxNI7kiyHS
rf822cynGt6KbuoNYarfQd5FuQDrSqDok3iW+t02AGafDiWuq4OwILMzviDanFRB
0Q4y8V9HdQXgVwGYAvFwZKmnRqbDGC3jYFg+ZnFbfNLnxDBMo1S6vEtaGM8C/yz4
0Tdppo4SfSS20wCIOdWfnWk5N1v0VLQlsuZq5pcY5L710Aj80dNcEoq5yfIbiR3H
6J9ZloAAil/00+tg6e/jnPgZeaDkIPRWnkHgD8YcCk3OsRJ2EyOxfBoWeQvNA8JV
Y7HmM4Y+40UB037aicG9yB54eikbv+wX5hEqbSqTPkRVwn43cTguC9GxOt0hi8LC
aJwOnKQg4EYoPmREsPhtIgHVo+C5hcicXS91fAaUYRSKIcdV/fc=
=NSmL
-----END PGP SIGNATURE-----

--Sig_/05sbnmefCCihWg0NzLbh/hq--

--===============0116705663==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0116705663==--
