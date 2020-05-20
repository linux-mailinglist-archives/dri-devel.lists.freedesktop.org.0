Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A4C61DB0FD
	for <lists+dri-devel@lfdr.de>; Wed, 20 May 2020 13:06:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14CA96E36F;
	Wed, 20 May 2020 11:06:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20D5A6E14A
 for <dri-devel@lists.freedesktop.org>; Wed, 20 May 2020 11:06:46 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 1B055ADC9;
 Wed, 20 May 2020 11:06:47 +0000 (UTC)
Subject: Re: [EXTERNAL] Re: [RFC PATCH 0/4] DirectX on Linux
To: Steve Pronovost <spronovo@microsoft.com>, Sasha Levin
 <sashal@kernel.org>, "alexander.deucher@amd.com"
 <alexander.deucher@amd.com>,
 "chris@chris-wilson.co.uk" <chris@chris-wilson.co.uk>,
 "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>,
 "Hawking.Zhang@amd.com" <Hawking.Zhang@amd.com>,
 "tvrtko.ursulin@intel.com" <tvrtko.ursulin@intel.com>
References: <20200519163234.226513-1-sashal@kernel.org>
 <55c57049-1869-7421-aa0f-3ce0b6a133cf@suse.de>
 <MWHPR21MB02878FA5BB259F307082B735C7B60@MWHPR21MB0287.namprd21.prod.outlook.com>
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
Message-ID: <8e33f381-6d03-4192-b324-a2f7a05d2d46@suse.de>
Date: Wed, 20 May 2020 13:06:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <MWHPR21MB02878FA5BB259F307082B735C7B60@MWHPR21MB0287.namprd21.prod.outlook.com>
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
Cc: "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
 Stephen Hemminger <sthemmin@microsoft.com>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 Haiyang Zhang <haiyangz@microsoft.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Max McMullen <Max.McMullen@microsoft.com>,
 "wei.liu@kernel.org" <wei.liu@kernel.org>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 Iouri Tarassov <iourit@microsoft.com>, KY Srinivasan <kys@microsoft.com>
Content-Type: multipart/mixed; boundary="===============1099442599=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1099442599==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="CdQi8KpebZFte3Zhz351eearRDfuhsOt4"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--CdQi8KpebZFte3Zhz351eearRDfuhsOt4
Content-Type: multipart/mixed; boundary="Hsf9r5mKZGeedj4ZmFS55Q6iKzl0tx6zo";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Steve Pronovost <spronovo@microsoft.com>, Sasha Levin
 <sashal@kernel.org>, "alexander.deucher@amd.com"
 <alexander.deucher@amd.com>,
 "chris@chris-wilson.co.uk" <chris@chris-wilson.co.uk>,
 "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>,
 "Hawking.Zhang@amd.com" <Hawking.Zhang@amd.com>,
 "tvrtko.ursulin@intel.com" <tvrtko.ursulin@intel.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
 KY Srinivasan <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>,
 Stephen Hemminger <sthemmin@microsoft.com>,
 "wei.liu@kernel.org" <wei.liu@kernel.org>,
 Iouri Tarassov <iourit@microsoft.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 Max McMullen <Max.McMullen@microsoft.com>
Message-ID: <8e33f381-6d03-4192-b324-a2f7a05d2d46@suse.de>
Subject: Re: [EXTERNAL] Re: [RFC PATCH 0/4] DirectX on Linux
References: <20200519163234.226513-1-sashal@kernel.org>
 <55c57049-1869-7421-aa0f-3ce0b6a133cf@suse.de>
 <MWHPR21MB02878FA5BB259F307082B735C7B60@MWHPR21MB0287.namprd21.prod.outlook.com>
In-Reply-To: <MWHPR21MB02878FA5BB259F307082B735C7B60@MWHPR21MB0287.namprd21.prod.outlook.com>

--Hsf9r5mKZGeedj4ZmFS55Q6iKzl0tx6zo
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Steve,

thank you for the fast reply.

Am 20.05.20 um 09:42 schrieb Steve Pronovost:
>> Echoing what others said, you're not making a DRM driver. The driver s=
hould live outside of the DRM code.
>=20
> Agreed, please see my earlier reply. We'll be moving the driver to driv=
ers/hyperv node or something similar. Apology for the confusion here.
>=20
>> I have one question about the driver API: on Windows, DirectX versions=
 are loosly tied to Windows releases. So I guess you can change the kerne=
l interface among DirectX versions?
>> If so, how would this work on Linux in the long term? If there ever is=
 a DirectX 13 or 14 with incompatible kernel interfaces, how would you pl=
an to update the Linux driver?
>=20
> You should think of the communication over the VM Bus for the vGPU proj=
ection as a strongly versioned interface. We will be keeping compatibilit=
y with older version of that interface as it evolves over time so we can =
continue to run older guest (we already do). This protocol isn't actually=
 tied to the DX API. It is a generic abstraction for the GPU that can be =
used for any APIs (for example the NVIDIA CUDA driver that we announced i=
s going over the same protocol to access the GPU).=20
>=20
> New version of user mode DX can either take advantage or sometime requi=
re new services from this kernel abstraction. This mean that pulling a ne=
w version of user mode DX can mean having to also pull a new version of t=
his vGPU kernel driver. For WSL, these essentially ships together. The ke=
rnel driver ships as part of our WSL2 Linux Kernel integration. User mode=
 DX bits ships with Windows.=20

Just a friendly advise: maintaining a proprietary component within a
Linux environment is tough. You will need a good plan for long-term
interface stability and compatibility with the other components.

Best regards
Thomas

>=20
> -----Original Message-----
> From: Thomas Zimmermann <tzimmermann@suse.de>=20
> Sent: Wednesday, May 20, 2020 12:11 AM
> To: Sasha Levin <sashal@kernel.org>; alexander.deucher@amd.com; chris@c=
hris-wilson.co.uk; ville.syrjala@linux.intel.com; Hawking.Zhang@amd.com; =
tvrtko.ursulin@intel.com
> Cc: linux-kernel@vger.kernel.org; linux-hyperv@vger.kernel.org; KY Srin=
ivasan <kys@microsoft.com>; Haiyang Zhang <haiyangz@microsoft.com>; Steph=
en Hemminger <sthemmin@microsoft.com>; wei.liu@kernel.org; Steve Pronovos=
t <spronovo@microsoft.com>; Iouri Tarassov <iourit@microsoft.com>; dri-de=
vel@lists.freedesktop.org; linux-fbdev@vger.kernel.org; gregkh@linuxfound=
ation.org
> Subject: [EXTERNAL] Re: [RFC PATCH 0/4] DirectX on Linux
>=20
> Hi
>=20
> Am 19.05.20 um 18:32 schrieb Sasha Levin:
>> There is a blog post that goes into more detail about the bigger=20
>> picture, and walks through all the required pieces to make this work. =

>> It is available here:
>> https://devblogs.microsoft.com/directx/directx-heart-linux . The rest =

>> of this cover letter will focus on the Linux Kernel bits.
>=20
> That's quite a surprise. Thanks for your efforts to contribute.
>=20
>>
>> Overview
>> =3D=3D=3D=3D=3D=3D=3D=3D
>>
>> This is the first draft of the Microsoft Virtual GPU (vGPU) driver.=20
>> The driver exposes a paravirtualized GPU to user mode applications=20
>> running in a virtual machine on a Windows host. This enables hardware =

>> acceleration in environment such as WSL (Windows Subsystem for Linux) =

>> where the Linux virtual machine is able to share the GPU with the=20
>> Windows host.
>>
>> The projection is accomplished by exposing the WDDM (Windows Display=20
>> Driver Model) interface as a set of IOCTL. This allows APIs and user=20
>> mode driver written against the WDDM GPU abstraction on Windows to be =

>> ported to run within a Linux environment. This enables the port of the=

>> D3D12 and DirectML APIs as well as their associated user mode driver=20
>> to Linux. This also enables third party APIs, such as the popular=20
>> NVIDIA Cuda compute API, to be hardware accelerated within a WSL envir=
onment.
>>
>> Only the rendering/compute aspect of the GPU are projected to the=20
>> virtual machine, no display functionality is exposed. Further, at this=
=20
>> time there are no presentation integration. So although the D3D12 API =

>> can be use to render graphics offscreen, there is no path (yet) for=20
>> pixel to flow from the Linux environment back onto the Windows host=20
>> desktop. This GPU stack is effectively side-by-side with the native=20
>> Linux graphics stack.
>>
>> The driver creates the /dev/dxg device, which can be opened by user=20
>> mode application and handles their ioctls. The IOCTL interface to the =

>> driver is defined in dxgkmthk.h (Dxgkrnl Graphics Port Driver ioctl=20
>> definitions). The interface matches the D3DKMT interface on Windows.
>> Ioctls are implemented in ioctl.c.
>=20
> Echoing what others said, you're not making a DRM driver. The driver sh=
ould live outside of the DRM code.
>=20
> I have one question about the driver API: on Windows, DirectX versions =
are loosly tied to Windows releases. So I guess you can change the kernel=
 interface among DirectX versions?
>=20
> If so, how would this work on Linux in the long term? If there ever is =
a DirectX 13 or 14 with incompatible kernel interfaces, how would you pla=
n to update the Linux driver?
>=20
> Best regards
> Thomas
>=20
>>
>> When a VM starts, hyper-v on the host adds virtual GPU devices to the =

>> VM via the hyper-v driver. The host offers several VM bus channels to =

>> the
>> VM: the global channel and one channel per virtual GPU, assigned to=20
>> the VM.
>>
>> The driver registers with the hyper-v driver (hv_driver) for the=20
>> arrival of VM bus channels. dxg_probe_device recognizes the vGPU=20
>> channels and creates the corresponding objects (dxgadapter for vGPUs=20
>> and dxgglobal for the global channel).
>>
>> The driver uses the hyper-V VM bus interface to communicate with the=20
>> host. dxgvmbus.c implements the communication interface.
>>
>> The global channel has 8GB of IO space assigned by the host. This=20
>> space is managed by the host and used to give the guest direct CPU=20
>> access to some allocations. Video memory is allocated on the host=20
>> except in the case of existing_sysmem allocations. The Windows host=20
>> allocates memory for the GPU on behalf of the guest. The Linux guest=20
>> can access that memory by mapping GPU virtual address to allocations=20
>> and then referencing those GPU virtual address from within GPU command=
=20
>> buffers submitted to the GPU. For allocations which require CPU=20
>> access, the allocation is mapped by the host into a location in the=20
>> 8GB of IO space reserved in the guest for that purpose. The Windows=20
>> host uses the nested CPU page table to ensure that this guest IO space=
=20
>> always map to the correct location for the allocation as it may=20
>> migrate between dedicated GPU memory (e.g. VRAM, firmware reserved=20
>> DDR) and shared system memory (regular DDR) over its lifetime. The=20
>> Linux guest maps a user mode CPU virtual address to an allocation IO=20
>> space range for direct access by user mode APIs and drivers.
>>
>> =20
>>
>> Implementation of LX_DXLOCK2 ioctl
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>
>> We would appreciate your feedback on the implementation of the
>> LX_DXLOCK2 ioctl.
>>
>> This ioctl is used to get a CPU address to an allocation, which is=20
>> resident in video/system memory on the host. The way it works:
>>
>> 1. The driver sends the Lock message to the host
>>
>> 2. The host allocates space in the VM IO space and maps it to the=20
>> allocation memory
>>
>> 3. The host returns the address in IO space for the mapped allocation
>>
>> 4. The driver (in dxg_map_iospace) allocates a user mode virtual=20
>> address range using vm_mmap and maps it to the IO space using
>> io_remap_ofn_range)
>>
>> 5. The VA is returned to the application
>>
>> =20
>>
>> Internal objects
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>
>> The following objects are created by the driver (defined in dxgkrnl.h)=
:
>>
>> - dxgadapter - represents a virtual GPU
>>
>> - dxgprocess - tracks per process state (handle table of created
>>   objects, list of objects, etc.)
>>
>> - dxgdevice - a container for other objects (contexts, paging queues,
>>   allocations, GPU synchronization objects)
>>
>> - dxgcontext - represents thread of GPU execution for packet
>>   scheduling.
>>
>> - dxghwqueue - represents thread of GPU execution of hardware=20
>> scheduling
>>
>> - dxgallocation - represents a GPU accessible allocation
>>
>> - dxgsyncobject - represents a GPU synchronization object
>>
>> - dxgresource - collection of dxgalloction objects
>>
>> - dxgsharedresource, dxgsharedsyncobj - helper objects to share object=
s
>>   between different dxgdevice objects, which can belong to different=20
>> processes
>>
>>
>> =20
>> Object handles
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>
>> All GPU objects, created by the driver, are accessible by a handle=20
>> (d3dkmt_handle). Each process has its own handle table, which is=20
>> implemented in hmgr.c. For each API visible object, created by the=20
>> driver, there is an object, created on the host. For example, the is a=
=20
>> dxgprocess object on the host for each dxgprocess object in the VM, et=
c.
>> The object handles have the same value in the host and the VM, which=20
>> is done to avoid translation from the guest handles to the host handle=
s.
>> =20
>>
>>
>> Signaling CPU events by the host
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
>>
>> The WDDM interface provides a way to signal CPU event objects when=20
>> execution of a context reached certain point. The way it is implemente=
d:
>>
>> - application sends an event_fd via ioctl to the driver
>>
>> - eventfd_ctx_get is used to get a pointer to the file object
>>   (eventfd_ctx)
>>
>> - the pointer to sent the host via a VM bus message
>>
>> - when GPU execution reaches a certain point, the host sends a message=

>>   to the VM with the event pointer
>>
>> - signal_guest_event() handles the messages and eventually
>>   eventfd_signal() is called.
>>
>>
>> Sasha Levin (4):
>>   gpu: dxgkrnl: core code
>>   gpu: dxgkrnl: hook up dxgkrnl
>>   Drivers: hv: vmbus: hook up dxgkrnl
>>   gpu: dxgkrnl: create a MAINTAINERS entry
>>
>>  MAINTAINERS                      |    7 +
>>  drivers/gpu/Makefile             |    2 +-
>>  drivers/gpu/dxgkrnl/Kconfig      |   10 +
>>  drivers/gpu/dxgkrnl/Makefile     |   12 +
>>  drivers/gpu/dxgkrnl/d3dkmthk.h   | 1635 +++++++++
>>  drivers/gpu/dxgkrnl/dxgadapter.c | 1399 ++++++++
>>  drivers/gpu/dxgkrnl/dxgkrnl.h    |  913 ++++++
>>  drivers/gpu/dxgkrnl/dxgmodule.c  |  692 ++++ =20
>> drivers/gpu/dxgkrnl/dxgprocess.c |  355 ++
>>  drivers/gpu/dxgkrnl/dxgvmbus.c   | 2955 +++++++++++++++++
>>  drivers/gpu/dxgkrnl/dxgvmbus.h   |  859 +++++
>>  drivers/gpu/dxgkrnl/hmgr.c       |  593 ++++
>>  drivers/gpu/dxgkrnl/hmgr.h       |  107 +
>>  drivers/gpu/dxgkrnl/ioctl.c      | 5269 +++++++++++++++++++++++++++++=
+
>>  drivers/gpu/dxgkrnl/misc.c       |  280 ++
>>  drivers/gpu/dxgkrnl/misc.h       |  288 ++
>>  drivers/video/Kconfig            |    2 +
>>  include/linux/hyperv.h           |   16 +
>>  18 files changed, 15393 insertions(+), 1 deletion(-)  create mode=20
>> 100644 drivers/gpu/dxgkrnl/Kconfig  create mode 100644=20
>> drivers/gpu/dxgkrnl/Makefile  create mode 100644=20
>> drivers/gpu/dxgkrnl/d3dkmthk.h  create mode 100644=20
>> drivers/gpu/dxgkrnl/dxgadapter.c  create mode 100644=20
>> drivers/gpu/dxgkrnl/dxgkrnl.h  create mode 100644=20
>> drivers/gpu/dxgkrnl/dxgmodule.c  create mode 100644=20
>> drivers/gpu/dxgkrnl/dxgprocess.c  create mode 100644=20
>> drivers/gpu/dxgkrnl/dxgvmbus.c  create mode 100644=20
>> drivers/gpu/dxgkrnl/dxgvmbus.h  create mode 100644=20
>> drivers/gpu/dxgkrnl/hmgr.c  create mode 100644=20
>> drivers/gpu/dxgkrnl/hmgr.h  create mode 100644=20
>> drivers/gpu/dxgkrnl/ioctl.c  create mode 100644=20
>> drivers/gpu/dxgkrnl/misc.c  create mode 100644=20
>> drivers/gpu/dxgkrnl/misc.h
>>
>=20
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
> (HRB 36809, AG N=C3=BCrnberg)
> Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--Hsf9r5mKZGeedj4ZmFS55Q6iKzl0tx6zo--

--CdQi8KpebZFte3Zhz351eearRDfuhsOt4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl7FDz4ACgkQaA3BHVML
eiOACggAhhK0IpNNw4pzJPQyPIF/VcC71ymVG5etEdwVXJ1otDDkzw6wG2AZUoSB
PQ49SEWYi8vm0K+fT3BpsM5KkndBDdg6ziktnGU2xpKw941vRlgYoyYo4oOtbJvB
7eRoNtsUc4zrUgMX+JPP22RKdq3c1iJu4DC8SHmEMARxhdxpB2cDLyxd+y46gJLl
q+34Vv/69v2vrWMBAhpMy6eo8OVMo8D4gBWFoKBapyC8bEsULlzX1dErQeM0tDkp
2xa2j3jsC2dTFTqPOOw0l3CbHentBiXUUjLzPjfXk7R16erB7UZ9WKi/JN0XBBGd
Sp3wGCAyLxoWZaYrXC9sU8GIes4HRA==
=zNU1
-----END PGP SIGNATURE-----

--CdQi8KpebZFte3Zhz351eearRDfuhsOt4--

--===============1099442599==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1099442599==--
