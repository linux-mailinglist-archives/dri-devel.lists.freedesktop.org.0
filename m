Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23861738686
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jun 2023 16:14:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DFBC10E495;
	Wed, 21 Jun 2023 14:14:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D66E10E494;
 Wed, 21 Jun 2023 14:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687356860; x=1718892860;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=9adIYkSPZPSbDZomCIPXDHAFkK/cANr4oaK1SeIPzi4=;
 b=YZgWnVbStYNW4fSiwL6uTwc1PWsGPSYJvQmK9yISDz+xYlmPWlu22W84
 N6UpCU5/5Nm8pgjLTcFm1BPGJYCYGZbPnsChI185CAOlF65FvyIqoK8wz
 A/g2xZds62P/jHngZoFXWPyl/mnL+aFhTB5mqZ9sV9Ds02Ug3V2IM9pgr
 0XaH/yJEBsTM/PkyrWbHly7UJSgRZNan/LkI/hzpTbW9/W6413RyIDLR7
 IfOepPg9xmU6ea1X5g/Yi4TCDI71XTfRxvYSzfHGsAXzCcC0vTBbZl5pK
 CiK97Gdb+nP5HPvPjqENdmjETMXg8kwlT3VRECyf5DrMjHV4CS59x3de3 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="349915864"
X-IronPort-AV: E=Sophos;i="6.00,260,1681196400"; d="scan'208";a="349915864"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2023 07:14:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="784507825"
X-IronPort-AV: E=Sophos;i="6.00,260,1681196400"; d="scan'208";a="784507825"
Received: from uniemimu-mobl1.ger.corp.intel.com (HELO [10.249.254.76])
 ([10.249.254.76])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2023 07:14:16 -0700
Message-ID: <7bcd2548ad4a403d8c6b67a8274c253b07123be8.camel@linux.intel.com>
Subject: Re: [PATCH v2] Documentation/gpu: Add a VM_BIND async draft document
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Danilo Krummrich <dakr@redhat.com>
Date: Wed, 21 Jun 2023 16:14:14 +0200
In-Reply-To: <ZJLdoPznXusy8l51@pollux>
References: <20230621100435.54425-1-thomas.hellstrom@linux.intel.com>
 <ZJLdoPznXusy8l51@pollux>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
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
Cc: Matthew Brost <matthew.brost@intel.com>, linux-kernel@vger.kernel.org,
 Oak Zeng <oak.zeng@intel.com>, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thanks for reviewing.

On Wed, 2023-06-21 at 13:23 +0200, Danilo Krummrich wrote:
> On Wed, Jun 21, 2023 at 12:04:35PM +0200, Thomas Hellstr=C3=B6m wrote:
> > Add a motivation for and description of asynchronous VM_BIND
> > operation
> >=20
> > v2:
> > - Fix typos (Nirmoy Das)
> > - Improve the description of a memory fence (Oak Zeng)
> > - Add a reference to the document in the Xe RFC.
> > - Add pointers to sample uAPI suggestions
> >=20
> > Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> > Acked-by: Nirmoy Das <nirmoy.das@intel.com>
> > ---
> > =C2=A0Documentation/gpu/drm-vm-bind-async.rst | 145
> > ++++++++++++++++++++++++
> > =C2=A0Documentation/gpu/rfc/xe.rst=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 4 +-
> > =C2=A02 files changed, 147 insertions(+), 2 deletions(-)
> > =C2=A0create mode 100644 Documentation/gpu/drm-vm-bind-async.rst
> >=20
> > diff --git a/Documentation/gpu/drm-vm-bind-async.rst
> > b/Documentation/gpu/drm-vm-bind-async.rst
> > new file mode 100644
> > index 000000000000..69aff250b62f
> > --- /dev/null
> > +++ b/Documentation/gpu/drm-vm-bind-async.rst
> > @@ -0,0 +1,145 @@
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +Asynchronous VM_BIND
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +Nomenclature:
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +* VRAM: On-device memory. Sometimes referred to as device local
> > memory.
> > +
> > +* vm: A GPU address space. Typically per process, but can be
> > shared by
> > +=C2=A0 multiple processes.
>=20
> Rather obvious, but maybe specify as "GPU virtual address space" or
> just
> "GPU VA space".
>=20
> Personally, I don't like "vm" as an abbreviation for "GPU VA space"
> or "virtual
> address space" in general, but it is commonly used and I fail to find
> a better
> one to be honest.

I have another upcoming document related to VM_BIND locking variants /
userptr integration and there I call gpu_vm. It would make sense to
unify the naming in the documents anyway. I don't have a strong opinion
either as long as it's not too long.

>=20
> > +
> > +* VM_BIND: An operation or a list of operations to modify a vm
> > using
> > +=C2=A0 an IOCTL. The operations include mapping and unmapping system-
> > or
> > +=C2=A0 VRAM memory.
> > +
> > +* syncobj: A container that abstracts synchronization objects. The
> > +=C2=A0 synchronization objects can be either generic, like dma-fences
> > or
> > +=C2=A0 driver specific. A syncobj typically indicates the type of the
> > +=C2=A0 underlying synchronization object.
> > +
> > +* in-syncobj: Argument to a VM_BIND IOCTL, the VM_BIND operation
> > waits
> > +=C2=A0 for these before starting.
> > +
> > +* out-syncbj: Argument to a VM_BIND_IOCTL, the VM_BIND operation
> > +=C2=A0 signals these when the bind operation is complete.
> > +
> > +* memory fence: A synchronization object, different from a dma-
> > fence.
> > +=C2=A0 A memory fence uses the value of a specified memory location to
> > determine
> > +=C2=A0 signaled status. A memory fence can be awaited and signaled by
> > both
> > +=C2=A0 the GPU and CPU. Memory fences are sometimes referred to as
> > +=C2=A0 user-fences, and do not necessarily bey the dma-fence rule of
> > +=C2=A0 signalling within a "reasonable amount of time". The kernel
> > should
> > +=C2=A0 thus avoid waiting for memory fences with locks held.
> > +
> > +* long-running workload: A workload that may take more than the
> > +=C2=A0 current stipulated dma-fence maximum signal delay to complete
> > and
> > +=C2=A0 which therefore needs to set the VM or the GPU execution contex=
t
> > in
> > +=C2=A0 a certain mode that disallows completion dma-fences.
> > +
> > +* UMD: User-mode driver.
> > +
> > +* KMD: Kernel-mode driver.
> > +
> > +
> > +Synchronous / Asynchronous VM_BIND operation
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +Synchronous VM_BIND
> > +___________________
> > +With Synchronous VM_BIND, the VM_BIND operations all complete
> > before the
> > +ioctl returns. A synchronous VM_BIND takes neither in-fences nor
>=20
> Just some nit-picking: IOCTL is mostly written in caps, maybe you
> want to stick
> to either of the two variants.

Sure,

>=20
> > +out-fences. Synchronous VM_BIND may block and wait for GPU
> > operations;
> > +for example swapin or clearing, or even previous binds.
> > +
> > +Asynchronous VM_BIND
> > +____________________
> > +Asynchronous VM_BIND accepts both in-syncobjs and out-syncobjs.
> > While the
> > +IOCTL may return immediately, the VM_BIND operations wait for the
> > in-syncobjs
> > +before modifying the GPU page-tables, and signal the out-syncobjs
> > when
> > +the modification is done in the sense that the next execbuf that
>=20
> Maybe add "execbuf" to the nomenclature.
>=20
> > +awaits for the out-syncobjs will see the change. Errors are
> > reported
> > +synchronously assuming that the asynchronous part of the job never
> > errors.
> > +In low-memory situations the implementation may block, performing
> > the
> > +VM_BIND synchronously, because there might not be enough memory
> > +immediately available for preparing the asynchronous operation.
> > +
> > +If the VM_BIND IOCTL takes a list or an array of operations as an
> > argument,
> > +the in-syncobjs needs to signal before the first operation starts
> > to
> > +execute, and the out-syncobjs signal after the last operation
> > +completes. Operations in the operation list can be assumed, where
> > it
> > +matters, to complete in order.
> > +
> > +To aid in supporting user-space queues, the VM_BIND may take a
> > bind context
>=20
> I think "bind context" should also be explained in the nomenclature.
>=20
> > +AKA bind engine identifier argument. All VM_BIND operations using
> > the same
> > +bind engine can then be assumed, where it matters, to complete in
> > +order. No such assumptions can be made between VM_BIND operations
> > +using separate bind contexts.
> > +
> > +The purpose of an Asynchronous VM_BIND operation is for user-mode
> > +drivers to be able to pipeline interleaved vm modifications and
> > +execbufs. For long-running workloads, such pipelining of a bind
> > +operation is not allowed and any in-fences need to be awaited
> > +synchronously.
> > +
> > +Also for VM_BINDS for long-running VMs the user-mode driver should
> > typically
> > +select memory fences as out-fences since that gives greater
> > flexibility for
> > +the kernel mode driver to inject other=C2=A0 operations into the bind =
/
> > +unbind operations. Like for example inserting breakpoints into
> > batch
> > +buffers. The workload execution can then easily be pipelined
> > behind
> > +the bind completion using the memory out-fence as the signal
> > condition
> > +for a gpu semaphore embedded by UMD in the workload.
> > +
> > +Multi-operation VM_BIND IOCTL error handling and interrupts
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +The VM_BIND operations of the ioctl may error due to lack of
> > resources
> > +to complete and also due to interrupted waits. In both situations
> > UMD
> > +should preferably restart the IOCTL after taking suitable action.
> > If
> > +UMD has overcommitted a memory resource, an -ENOSPC error will be
> > +returned, and UMD may then unbind resources that are not used at
> > the
> > +moment and restart the IOCTL. On -EINTR, UMD should simply restart
> > the
> > +IOCTL and on -ENOMEM user-space may either attempt to free known
> > +system memory resources or abort the operation. If aborting as a
> > +result of a failed operation in a list of operations, some
> > operations
> > +may still have completed, and to get back to a known state, user-
> > space
> > +should therefore attempt to unbind all virtual memory regions
> > touched
> > +by the failing IOCTL.
> > +Unbind operations are guaranteed not to cause any errors due to
> > +resource constraints.
> > +In between a failed VM_BIND ioctl and a successful restart there
> > may
> > +be implementation defined restrictions on the use of the VM. For a
> > +description why, please see KMD implementation details under
> > [error
> > +state saving]_.
> > +
> > +Sample uAPI implementations
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +Suggested uAPI implementations at the moment of writing can be
> > found for
> > +the Nouveau driver `here:
> > https://patchwork.freedesktop.org/patch/543260/?series=3D112994&rev=3D6=
`
> > +and for the Xe driver `here:
> > https://cgit.freedesktop.org/drm/drm-xe/diff/include/uapi/drm/xe_drm.h?=
h=3Ddrm-xe-next&id=3D9cb016ebbb6a275f57b1cb512b95d5a842391ad7`
> > +
> > +KMD implementation details
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
>=20
> Maybe we can mention the GPUVA manager as a helper for implementing
> such an
> interface.

Sure will add this as well.
Thanks,

Thomas

>=20
> Anyway, I will surely add a link pointing to this document to the
> documentation
> of the GPUVA manager.


>=20
> - Danilo
>=20
> > +
> > +.. [error state saving] Open: When the VM_BIND ioctl returns an
> > error, some
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0or eve=
n parts of an operation may have been
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0comple=
ted. If the ioctl is restarted, in
> > order
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0to kno=
w where to restart, the KMD can
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0either=
 put the VM in an error state and
> > save
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0one in=
stance of the needed restart state
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0intern=
ally. In this case, KMD needs to
> > block
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0furthe=
r modifications of the VM state that
> > may
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0cause =
additional failures requiring a
> > restart
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0state =
save, until the error has been fully
> > resolved.
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0If the=
 uAPI instead defines a pointer to a
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0UMD al=
located cookie in the IOCTL struct,
> > it
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0could =
also choose to store the restart
> > state
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0in tha=
t cookie.
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0The re=
start state may, for example, be the
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0number=
 of successfully completed
> > operations.
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Easies=
t for UMD would of course be if KMD
> > did
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0a full=
 unwind on error so that no error
> > state
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0needs =
to be saved.
> > diff --git a/Documentation/gpu/rfc/xe.rst
> > b/Documentation/gpu/rfc/xe.rst
> > index 2516fe141db6..0f062e1346d2 100644
> > --- a/Documentation/gpu/rfc/xe.rst
> > +++ b/Documentation/gpu/rfc/xe.rst
> > @@ -138,8 +138,8 @@ memory fences. Ideally with helper support so
> > people don't get it wrong in all
> > =C2=A0possible ways.
> > =C2=A0
> > =C2=A0As a key measurable result, the benefits of ASYNC VM_BIND and a
> > discussion of
> > -various flavors, error handling and a sample API should be
> > documented here or in
> > -a separate document pointed to by this document.
> > +various flavors, error handling and sample API suggestions are
> > documented in
> > +Documentation/gpu/drm-vm-bind-async.rst
> > =C2=A0
> > =C2=A0Userptr integration and vm_bind
> > =C2=A0-------------------------------
> > --=20
> > 2.40.1
> >=20
>=20

