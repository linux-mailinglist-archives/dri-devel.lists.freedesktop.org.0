Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B6981DABA4
	for <lists+dri-devel@lfdr.de>; Wed, 20 May 2020 09:11:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DACD36E588;
	Wed, 20 May 2020 07:10:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31AD66E588
 for <dri-devel@lists.freedesktop.org>; Wed, 20 May 2020 07:10:56 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 63CD7B36C;
 Wed, 20 May 2020 07:10:56 +0000 (UTC)
Subject: Re: [RFC PATCH 0/4] DirectX on Linux
To: Sasha Levin <sashal@kernel.org>, alexander.deucher@amd.com,
 chris@chris-wilson.co.uk, ville.syrjala@linux.intel.com,
 Hawking.Zhang@amd.com, tvrtko.ursulin@intel.com
References: <20200519163234.226513-1-sashal@kernel.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
Autocrypt: addr=tzimmermann@suse.de; keydata=
 mQENBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAG0J1Rob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPokBVAQTAQgAPhYh
 BHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJbOdLgAhsDBQkDwmcABQsJCAcCBhUKCQgLAgQWAgMB
 Ah4BAheAAAoJEGgNwR1TC3ojR80H/jH+vYavwQ+TvO8ksXL9JQWc3IFSiGpuSVXLCdg62AmR
 irxW+qCwNncNQyb9rd30gzdectSkPWL3KSqEResBe24IbA5/jSkPweJasgXtfhuyoeCJ6PXo
 clQQGKIoFIAEv1s8l0ggPZswvCinegl1diyJXUXmdEJRTWYAtxn/atut1o6Giv6D2qmYbXN7
 mneMC5MzlLaJKUtoH7U/IjVw1sx2qtxAZGKVm4RZxPnMCp9E1MAr5t4dP5gJCIiqsdrVqI6i
 KupZstMxstPU//azmz7ZWWxT0JzgJqZSvPYx/SATeexTYBP47YFyri4jnsty2ErS91E6H8os
 Bv6pnSn7eAq5AQ0EWznS4AEIAMYmP4M/V+T5RY5at/g7rUdNsLhWv1APYrh9RQefODYHrNRH
 UE9eosYbT6XMryR9hT8XlGOYRwKWwiQBoWSDiTMo/Xi29jUnn4BXfI2px2DTXwc22LKtLAgT
 RjP+qbU63Y0xnQN29UGDbYgyyK51DW3H0If2a3JNsheAAK+Xc9baj0LGIc8T9uiEWHBnCH+R
 dhgATnWWGKdDegUR5BkDfDg5O/FISymJBHx2Dyoklv5g4BzkgqTqwmaYzsl8UxZKvbaxq0zb
 ehDda8lvhFXodNFMAgTLJlLuDYOGLK2AwbrS3Sp0AEbkpdJBb44qVlGm5bApZouHeJ/+n+7r
 12+lqdsAEQEAAYkBPAQYAQgAJhYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJbOdLgAhsMBQkD
 wmcAAAoJEGgNwR1TC3ojpfcIAInwP5OlcEKokTnHCiDTz4Ony4GnHRP2fXATQZCKxmu4AJY2
 h9ifw9Nf2TjCZ6AMvC3thAN0rFDj55N9l4s1CpaDo4J+0fkrHuyNacnT206CeJV1E7NYntxU
 n+LSiRrOdywn6erjxRi9EYTVLCHcDhBEjKmFZfg4AM4GZMWX1lg0+eHbd5oL1as28WvvI/uI
 aMyV8RbyXot1r/8QLlWldU3NrTF5p7TMU2y3ZH2mf5suSKHAMtbE4jKJ8ZHFOo3GhLgjVrBW
 HE9JXO08xKkgD+w6v83+nomsEuf6C6LYrqY/tsZvyEX6zN8CtirPdPWu/VXNRYAl/lat7lSI
 3H26qrE=
Message-ID: <55c57049-1869-7421-aa0f-3ce0b6a133cf@suse.de>
Date: Wed, 20 May 2020 09:10:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200519163234.226513-1-sashal@kernel.org>
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
Cc: linux-hyperv@vger.kernel.org, sthemmin@microsoft.com,
 gregkh@linuxfoundation.org, haiyangz@microsoft.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 spronovo@microsoft.com, wei.liu@kernel.org, linux-fbdev@vger.kernel.org,
 iourit@microsoft.com, kys@microsoft.com
Content-Type: multipart/mixed; boundary="===============1530932763=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1530932763==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="vAo58w8SHWXRVnNzumKnOmUo9dwSAv3J1"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--vAo58w8SHWXRVnNzumKnOmUo9dwSAv3J1
Content-Type: multipart/mixed; boundary="hJMvAsFc04AoVDJM7zxnUbCWTttHUlTAT";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sasha Levin <sashal@kernel.org>, alexander.deucher@amd.com,
 chris@chris-wilson.co.uk, ville.syrjala@linux.intel.com,
 Hawking.Zhang@amd.com, tvrtko.ursulin@intel.com
Cc: linux-kernel@vger.kernel.org, linux-hyperv@vger.kernel.org,
 kys@microsoft.com, haiyangz@microsoft.com, sthemmin@microsoft.com,
 wei.liu@kernel.org, spronovo@microsoft.com, iourit@microsoft.com,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 gregkh@linuxfoundation.org
Message-ID: <55c57049-1869-7421-aa0f-3ce0b6a133cf@suse.de>
Subject: Re: [RFC PATCH 0/4] DirectX on Linux
References: <20200519163234.226513-1-sashal@kernel.org>
In-Reply-To: <20200519163234.226513-1-sashal@kernel.org>

--hJMvAsFc04AoVDJM7zxnUbCWTttHUlTAT
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 19.05.20 um 18:32 schrieb Sasha Levin:
> There is a blog post that goes into more detail about the bigger
> picture, and walks through all the required pieces to make this work. I=
t
> is available here:
> https://devblogs.microsoft.com/directx/directx-heart-linux . The rest o=
f
> this cover letter will focus on the Linux Kernel bits.

That's quite a surprise. Thanks for your efforts to contribute.

>=20
> Overview
> =3D=3D=3D=3D=3D=3D=3D=3D
>=20
> This is the first draft of the Microsoft Virtual GPU (vGPU) driver. The=

> driver exposes a paravirtualized GPU to user mode applications running
> in a virtual machine on a Windows host. This enables hardware
> acceleration in environment such as WSL (Windows Subsystem for Linux)
> where the Linux virtual machine is able to share the GPU with the
> Windows host.
>=20
> The projection is accomplished by exposing the WDDM (Windows Display
> Driver Model) interface as a set of IOCTL. This allows APIs and user
> mode driver written against the WDDM GPU abstraction on Windows to be
> ported to run within a Linux environment. This enables the port of the
> D3D12 and DirectML APIs as well as their associated user mode driver to=

> Linux. This also enables third party APIs, such as the popular NVIDIA
> Cuda compute API, to be hardware accelerated within a WSL environment.
>=20
> Only the rendering/compute aspect of the GPU are projected to the
> virtual machine, no display functionality is exposed. Further, at this
> time there are no presentation integration. So although the D3D12 API
> can be use to render graphics offscreen, there is no path (yet) for
> pixel to flow from the Linux environment back onto the Windows host
> desktop. This GPU stack is effectively side-by-side with the native
> Linux graphics stack.
>=20
> The driver creates the /dev/dxg device, which can be opened by user mod=
e
> application and handles their ioctls. The IOCTL interface to the driver=

> is defined in dxgkmthk.h (Dxgkrnl Graphics Port Driver ioctl
> definitions). The interface matches the D3DKMT interface on Windows.
> Ioctls are implemented in ioctl.c.

Echoing what others said, you're not making a DRM driver. The driver
should live outside of the DRM code.

I have one question about the driver API: on Windows, DirectX versions
are loosly tied to Windows releases. So I guess you can change the
kernel interface among DirectX versions?

If so, how would this work on Linux in the long term? If there ever is a
DirectX 13 or 14 with incompatible kernel interfaces, how would you plan
to update the Linux driver?

Best regards
Thomas

>=20
> When a VM starts, hyper-v on the host adds virtual GPU devices to the V=
M
> via the hyper-v driver. The host offers several VM bus channels to the
> VM: the global channel and one channel per virtual GPU, assigned to the=

> VM.
>=20
> The driver registers with the hyper-v driver (hv_driver) for the arriva=
l
> of VM bus channels. dxg_probe_device recognizes the vGPU channels and
> creates the corresponding objects (dxgadapter for vGPUs and dxgglobal
> for the global channel).
>=20
> The driver uses the hyper-V VM bus interface to communicate with the
> host. dxgvmbus.c implements the communication interface.
>=20
> The global channel has 8GB of IO space assigned by the host. This space=

> is managed by the host and used to give the guest direct CPU access to
> some allocations. Video memory is allocated on the host except in the
> case of existing_sysmem allocations. The Windows host allocates memory
> for the GPU on behalf of the guest. The Linux guest can access that
> memory by mapping GPU virtual address to allocations and then
> referencing those GPU virtual address from within GPU command buffers
> submitted to the GPU. For allocations which require CPU access, the
> allocation is mapped by the host into a location in the 8GB of IO space=

> reserved in the guest for that purpose. The Windows host uses the neste=
d
> CPU page table to ensure that this guest IO space always map to the
> correct location for the allocation as it may migrate between dedicated=

> GPU memory (e.g. VRAM, firmware reserved DDR) and shared system memory
> (regular DDR) over its lifetime. The Linux guest maps a user mode CPU
> virtual address to an allocation IO space range for direct access by
> user mode APIs and drivers.
>=20
> =20
>=20
> Implementation of LX_DXLOCK2 ioctl
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> We would appreciate your feedback on the implementation of the
> LX_DXLOCK2 ioctl.
>=20
> This ioctl is used to get a CPU address to an allocation, which is
> resident in video/system memory on the host. The way it works:
>=20
> 1. The driver sends the Lock message to the host
>=20
> 2. The host allocates space in the VM IO space and maps it to the
> allocation memory
>=20
> 3. The host returns the address in IO space for the mapped allocation
>=20
> 4. The driver (in dxg_map_iospace) allocates a user mode virtual addres=
s
> range using vm_mmap and maps it to the IO space using
> io_remap_ofn_range)
>=20
> 5. The VA is returned to the application
>=20
> =20
>=20
> Internal objects
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> The following objects are created by the driver (defined in dxgkrnl.h):=

>=20
> - dxgadapter - represents a virtual GPU
>=20
> - dxgprocess - tracks per process state (handle table of created
>   objects, list of objects, etc.)
>=20
> - dxgdevice - a container for other objects (contexts, paging queues,
>   allocations, GPU synchronization objects)
>=20
> - dxgcontext - represents thread of GPU execution for packet
>   scheduling.
>=20
> - dxghwqueue - represents thread of GPU execution of hardware schedulin=
g
>=20
> - dxgallocation - represents a GPU accessible allocation
>=20
> - dxgsyncobject - represents a GPU synchronization object
>=20
> - dxgresource - collection of dxgalloction objects
>=20
> - dxgsharedresource, dxgsharedsyncobj - helper objects to share objects=

>   between different dxgdevice objects, which can belong to different
> processes
>=20
>=20
> =20
> Object handles
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> All GPU objects, created by the driver, are accessible by a handle
> (d3dkmt_handle). Each process has its own handle table, which is
> implemented in hmgr.c. For each API visible object, created by the
> driver, there is an object, created on the host. For example, the is a
> dxgprocess object on the host for each dxgprocess object in the VM, etc=
=2E
> The object handles have the same value in the host and the VM, which is=

> done to avoid translation from the guest handles to the host handles.
> =20
>=20
>=20
> Signaling CPU events by the host
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> The WDDM interface provides a way to signal CPU event objects when
> execution of a context reached certain point. The way it is implemented=
:
>=20
> - application sends an event_fd via ioctl to the driver
>=20
> - eventfd_ctx_get is used to get a pointer to the file object
>   (eventfd_ctx)
>=20
> - the pointer to sent the host via a VM bus message
>=20
> - when GPU execution reaches a certain point, the host sends a message
>   to the VM with the event pointer
>=20
> - signal_guest_event() handles the messages and eventually
>   eventfd_signal() is called.
>=20
>=20
> Sasha Levin (4):
>   gpu: dxgkrnl: core code
>   gpu: dxgkrnl: hook up dxgkrnl
>   Drivers: hv: vmbus: hook up dxgkrnl
>   gpu: dxgkrnl: create a MAINTAINERS entry
>=20
>  MAINTAINERS                      |    7 +
>  drivers/gpu/Makefile             |    2 +-
>  drivers/gpu/dxgkrnl/Kconfig      |   10 +
>  drivers/gpu/dxgkrnl/Makefile     |   12 +
>  drivers/gpu/dxgkrnl/d3dkmthk.h   | 1635 +++++++++
>  drivers/gpu/dxgkrnl/dxgadapter.c | 1399 ++++++++
>  drivers/gpu/dxgkrnl/dxgkrnl.h    |  913 ++++++
>  drivers/gpu/dxgkrnl/dxgmodule.c  |  692 ++++
>  drivers/gpu/dxgkrnl/dxgprocess.c |  355 ++
>  drivers/gpu/dxgkrnl/dxgvmbus.c   | 2955 +++++++++++++++++
>  drivers/gpu/dxgkrnl/dxgvmbus.h   |  859 +++++
>  drivers/gpu/dxgkrnl/hmgr.c       |  593 ++++
>  drivers/gpu/dxgkrnl/hmgr.h       |  107 +
>  drivers/gpu/dxgkrnl/ioctl.c      | 5269 ++++++++++++++++++++++++++++++=

>  drivers/gpu/dxgkrnl/misc.c       |  280 ++
>  drivers/gpu/dxgkrnl/misc.h       |  288 ++
>  drivers/video/Kconfig            |    2 +
>  include/linux/hyperv.h           |   16 +
>  18 files changed, 15393 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/gpu/dxgkrnl/Kconfig
>  create mode 100644 drivers/gpu/dxgkrnl/Makefile
>  create mode 100644 drivers/gpu/dxgkrnl/d3dkmthk.h
>  create mode 100644 drivers/gpu/dxgkrnl/dxgadapter.c
>  create mode 100644 drivers/gpu/dxgkrnl/dxgkrnl.h
>  create mode 100644 drivers/gpu/dxgkrnl/dxgmodule.c
>  create mode 100644 drivers/gpu/dxgkrnl/dxgprocess.c
>  create mode 100644 drivers/gpu/dxgkrnl/dxgvmbus.c
>  create mode 100644 drivers/gpu/dxgkrnl/dxgvmbus.h
>  create mode 100644 drivers/gpu/dxgkrnl/hmgr.c
>  create mode 100644 drivers/gpu/dxgkrnl/hmgr.h
>  create mode 100644 drivers/gpu/dxgkrnl/ioctl.c
>  create mode 100644 drivers/gpu/dxgkrnl/misc.c
>  create mode 100644 drivers/gpu/dxgkrnl/misc.h
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--hJMvAsFc04AoVDJM7zxnUbCWTttHUlTAT--

--vAo58w8SHWXRVnNzumKnOmUo9dwSAv3J1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl7E1/kACgkQaA3BHVML
eiNeVgf/bJ3sJkCimINIWeNBYqvEJN0ujoHxTiwIS/f38u215qfggRR0JNbPrUOP
gagN5nkrDxi7Gx66VP2LpdL1o96JYhmk3ANUQoR8DmMA3viCjSVouK3QH0E8tpFn
LppCLnGyS1pa8hOd5fk5zZJvrruQ1PFnATdkSr329FpzqjKxzadf6eCeBMa0gsuK
V7tQlURGY/OnXG2jrlEhUPsXgJdP9bZPZT0gu2mSf/88TZ7tkz6xylWYdxuCX16q
MCGawoK8wqbeIcO5nczSEWYvxn0OFpWFWLPaYXaxQIGgdAZL/AG7bACmuW401rzM
dTXKSDqGUQkwKv/DG5JuYvhxHO/J9Q==
=BFgr
-----END PGP SIGNATURE-----

--vAo58w8SHWXRVnNzumKnOmUo9dwSAv3J1--

--===============1530932763==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1530932763==--
