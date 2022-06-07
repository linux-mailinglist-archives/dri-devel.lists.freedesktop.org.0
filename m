Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 026D254279E
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jun 2022 09:39:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22C8F10ECBB;
	Wed,  8 Jun 2022 07:39:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 342 seconds by postgrey-1.36 at gabe;
 Tue, 07 Jun 2022 14:58:47 UTC
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44A6710EFAD
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jun 2022 14:58:47 +0000 (UTC)
Received: from beaker.jlekstrand.net
 (2603-8080-2102-63d7-019e-342e-5881-a163.res6.spectrum.com
 [IPv6:2603:8080:2102:63d7:19e:342e:5881:a163])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: jekstrand)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id C32CF6601B25;
 Tue,  7 Jun 2022 15:53:00 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1654613581;
 bh=dN9/O/CrqIChlmhsd4jlmt2GBXaU1mmvwskPFCO/5yo=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=KJYtNQtWGN6Cx1kelzU24UDUXDg7zl3WXcR4vmwuaN1r3a9zWnIgmxoLmaRwzE8F5
 +O2WyIdEu3CYHJ8pYnB5gPKn5Iv8ZxbCADizcr+kJ9y74oMKAmvhtUNnptXqRA4zEN
 VFgxyXbCAsEB5Kv9WcdVAOulUW46H0QNjFCMqMJEHSdeGJI6CZyzFJxxPsVTt3VU3n
 qeqPLX8BA8ardv4/6UyTxU3n20XKNxhvwpVbP2/TbQXNapvl3vKHTvCXH4RVHsz60H
 QofmZ+t5hDkCXIoic/VOvLLMWxae3/2iQO7b0mGV3gao5Geb+zKQchiyxsyRm4E9RA
 c61nkbGW+rLvA==
Message-ID: <93adb5b2ba50a9879a085c10695b9ec9daf7a21e.camel@collabora.com>
Subject: Re: [PATCH v4] dma-buf: Add a capabilities directory
From: Jason Ekstrand <jason.ekstrand@collabora.com>
To: Greg KH <greg@kroah.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Tue, 07 Jun 2022 09:52:56 -0500
In-Reply-To: <Yp8umMtviDqDeDWV@kroah.com>
References: <20220601161303.64797-1-contact@emersion.fr>
 <YphNaq/JZdlTW8S7@kroah.com>
 <BCduk8OI3oQXvl2_-ejGwile7y09VscIp1U2MKHX2kEVun1JNxznDByVlidyN8B0vf5xOxS35axHhz5QYWmrmrQmsa8qONFJof6ZtR7CC1Y=@emersion.fr>
 <YphX2erQp3e4mUba@kroah.com>
 <CtTIPo68VAvDRUp7-QFc0m-2SnikPFd0QpdogNj2xueFfyQKa3DQqiw3Meqtsu8vQgEuKX_-MPKbe7jQdf49-Y3z2TAYbajUrC5GKF0Dolk=@emersion.fr>
 <CAKMK7uEYncnjbwq6fQMNB_5tupMASrAFEadPg9xBS3ykNgNk4A@mail.gmail.com>
 <Yp8umMtviDqDeDWV@kroah.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1 (3.44.1-1.fc36) 
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 08 Jun 2022 07:39:02 +0000
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
Cc: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 2022-06-07 at 12:55 +0200, Greg KH wrote:
> On Thu, Jun 02, 2022 at 08:47:56AM +0200, Daniel Vetter wrote:
> > On Thu, 2 Jun 2022 at 08:34, Simon Ser <contact@emersion.fr> wrote:
> > >=20
> > > On Thursday, June 2nd, 2022 at 08:25, Greg KH <greg@kroah.com>
> > > wrote:
> > >=20
> > > > On Thu, Jun 02, 2022 at 06:17:31AM +0000, Simon Ser wrote:
> > > >=20
> > > > > On Thursday, June 2nd, 2022 at 07:40, Greg KH
> > > > > greg@kroah.com=C2=A0wrote:
> > > > >=20
> > > > > > On Wed, Jun 01, 2022 at 04:13:14PM +0000, Simon Ser wrote:
> > > > > >=20
> > > > > > > To discover support for new DMA-BUF IOCTLs, user-space
> > > > > > > has no
> > > > > > > choice but to try to perform the IOCTL on an existing
> > > > > > > DMA-BUF.
> > > > > >=20
> > > > > > Which is correct and how all kernel features work (sorry I
> > > > > > missed the
> > > > > > main goal of this patch earlier and focused only on the
> > > > > > sysfs stuff).
> > > > > >=20
> > > > > > > However, user-space may want to figure out whether or not
> > > > > > > the
> > > > > > > IOCTL is available before it has a DMA-BUF at hand, e.g.
> > > > > > > at
> > > > > > > initialization time in a Wayland compositor.
> > > > > >=20
> > > > > > Why not just do the ioctl in a test way? That's how we
> > > > > > determine kernel
> > > > > > features, we do not poke around in sysfs to determine what
> > > > > > is, or is
> > > > > > not, present at runtime.
> > > > > >=20
> > > > > > > Add a /sys/kernel/dmabuf/caps directory which allows the
> > > > > > > DMA-BUF
> > > > > > > subsystem to advertise supported features. Add a
> > > > > > > sync_file_import_export entry which indicates that
> > > > > > > importing and
> > > > > > > exporting sync_files from/to DMA-BUFs is supported.
> > > > > >=20
> > > > > > No, sorry, this is not a sustainable thing to do for all
> > > > > > kernel features
> > > > > > over time. Please just do the ioctl and go from there.
> > > > > > sysfs is not
> > > > > > for advertising what is and is not enabled/present in a
> > > > > > kernel with
> > > > > > regards to functionality or capabilities of the system.
> > > > > >=20
> > > > > > If sysfs were to export this type of thing, it would have
> > > > > > to do it for
> > > > > > everything, not just some random tiny thing of one kernel
> > > > > > driver.
> > > > >=20
> > > > > I'd argue that DMA-BUF is a special case here.
> > > >=20
> > > > So this is special and unique just like everything else? :)
> > > >=20
> > > > > To check whether the import/export IOCTLs are available,
> > > > > user-space
> > > > > needs a DMA-BUF to try to perform the IOCTL. To get a DMA-
> > > > > BUF,
> > > > > user-space needs to enumerate GPUs, pick one at random, load
> > > > > GBM or
> > > > > Vulkan, use that heavy-weight API to allocate a "fake" buffer
> > > > > on the
> > > > > GPU, export that buffer into a DMA-BUF, try the IOCTL, then
> > > > > teardown
> > > > > all of this. There is no other way.
> > > > >=20
> > > > > This sounds like a roundabout way to answer the simple
> > > > > question "is the
> > > > > IOCTL available?". Do you have another suggestion to address
> > > > > this
> > > > > problem?
> > > >=20
> > > > What does userspace do differently if the ioctl is present or
> > > > not?
> > >=20
> > > Globally enable a synchronization API for Wayland clients, for
> > > instance
> > > in the case of a Wayland compositor.
> > >=20
> > > > And why is this somehow more special than of the tens of
> > > > thousands of
> > > > other ioctl calls where you have to do exactly the same thing
> > > > you list
> > > > above to determine if it is present or not?
> > >=20
> > > For other IOCTLs it's not as complicated to obtain a FD to do the
> > > test
> > > with.
> >=20
> > Two expand on this:
> >=20
> > - compositor opens the drm render /dev node
> > - compositor initializes the opengl or vulkan userspace driver on
> > top of that
> > - compositor asks that userspace driver to allocate some buffer,
> > which
> > can be pretty expensive
> > - compositor asks the userspace driver to export that buffer into a
> > dma-buf
> > - compositor can finally do the test ioctl, realizes support isn't
> > there and tosses the entire thing
> >=20
> > read() on a sysfs file is so much more reasonable it's not even
> > funny.
>=20
> I agree it seems trivial and "simple", but that is NOT how to
> determine
> what is, and is not, a valid ioctl command for a device node.
>=20
> The only sane way to do this is like we have been doing for the past
> 30+
> years, make the ioctl and look at the return value.
>=20
> Now if we want to come up with a new generic "here's the
> capabilities/ioctls/whatever" that the kernel currently supports at
> this
> point in time api, wonderful, but PLEASE do not overload sysfs to do
> something like this as that is not what it is for at this moment in
> time.
>=20
> Don't just do this for one specific ioctl as there really is nothing
> special about it at all ("it's special and unique just like all other
> ioctls...")
>=20
> > Plan B we discussed is to add a getparam to signify this to the drm
> > ioctl interface, but that has the design problem that a feature in
> > the
> > dma-buf subsystem is announced in a totally different subsystem (ok
> > same maintainers), and if that ever gets out of sync your userspace
> > breaks. So really no good.
>=20
> getparam makes sense in a way, if it doesn't change over time (i.e.
> if
> you call it now, will it be the same if you call it again if some
> kernel
> module is added/removed in the meantime?)=C2=A0 Also be aware of
> suspend/resume where you can swap out the kernel underneath running
> userspace and that kernel might have different capabilities now.=C2=A0 So
> you
> can't just not check error values of ioctl commands (not that you are
> saying you want to here, just that it's more complex than might
> originally seem.)
>=20
> > So if sysfs also isn't the right approach, and the getparam ioctl
> > on
> > drm is defo worse, what is the right approach? Ideally without
> > setting
> > up the entire userspace render driver and doing some expensive-ish
> > (depending upon driver at least) buffer allocations just to check
> > for
> > a feature.
> >=20
> > Note that some compositors want to gate their "should I use vk for
> > rendering and expose some additional features to client" decision
> > on
> > this, so setting up the wrong renderer just to test whether that
> > would
> > work is not a very great approach.
> >=20
> > Also the last time we added a feature to dma-buf was in 3.17, so I
> > guess everyone just hardcodes nowadays that all dma-buf features
> > are
> > present. Which isn't great, and that's why we're trying to fix
> > here.
>=20
> Why can't you call the test ioctl with an invalid value to see if it
> is
> present or not (-ENOTTY vs. -EINVAL) right at the beginning before
> you
> set up anything?

Because we need a file descriptor to call that ioctl on.  Currently,
that file descriptor is the dma-buf itself.  We could move it to be a
DRM IOCTL but then it ends up unnecessarily tied to DRM even if
someone's trying to use it with V4L or some other dma-buf
producer/consumer.  IDK if that's a real problem in practice but there
didn't seem to be a good reason to tie it to things outside dma-buf.

--Jason

