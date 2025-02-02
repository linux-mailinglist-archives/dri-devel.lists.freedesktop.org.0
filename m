Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EB11A24C9E
	for <lists+dri-devel@lfdr.de>; Sun,  2 Feb 2025 06:16:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 018AF10E073;
	Sun,  2 Feb 2025 05:16:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=invisiblethingslab.com header.i=@invisiblethingslab.com header.b="Q/05GUTx";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="kyc8YgL3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 437 seconds by postgrey-1.36 at gabe;
 Sun, 02 Feb 2025 05:16:13 UTC
Received: from fout-a2-smtp.messagingengine.com
 (fout-a2-smtp.messagingengine.com [103.168.172.145])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D9CC10E073
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Feb 2025 05:16:13 +0000 (UTC)
Received: from phl-compute-01.internal (phl-compute-01.phl.internal
 [10.202.2.41])
 by mailfout.phl.internal (Postfix) with ESMTP id 36F2A13800F9;
 Sun,  2 Feb 2025 00:08:55 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-01.internal (MEProxy); Sun, 02 Feb 2025 00:08:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 invisiblethingslab.com; h=cc:content-type:content-type:date:date
 :from:from:in-reply-to:message-id:mime-version:reply-to:subject
 :subject:to:to; s=fm3; t=1738472935; x=1738559335; bh=rr1/byr+Wd
 oUVFGph7xFQwvycFnOeNWMbFMI/glDuBM=; b=Q/05GUTxnXCkG8TjV+QgIg1zk1
 D/IkxXDnEnNB+b/eGZ4VPclHUXxhCffBsUy3E9xpn5RMZWVMoc756E7D3fYY922m
 mZo6ZMN55wNaCf+VRQcVvhPhOaiYAWjOTmpKCvnMnM2nwcEaMpjsphYdLFZBVd2n
 b5E4W1mC/WurGSry/LHKxDCFS8uwUWORWz6RtDJg1S5/9qPJSFRONLMUvkzQ/316
 0bxM2WBrEy4RJBfN/mD7kQoUrtgnySdAVYYAojmFtJLNce0/IzfwYZZG+d51+lOU
 PeGXuKMFj5benmCjpel4tbi6o3uS3tUx8z87XqUgmibPdV2LWdkUTpu55dbg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:message-id
 :mime-version:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1738472935; x=
 1738559335; bh=rr1/byr+WdoUVFGph7xFQwvycFnOeNWMbFMI/glDuBM=; b=k
 yc8YgL35qKHFKQnQUCEkTYrk+DPiURcRoH+S/pce3F+MBT+rwmR0EjhPHwQ8dFBn
 r9Ah5src4J3+3cC9xt9Ta1INVDhhWu7Un/TLkTBWvVAX7uo1xGTc+x5kgQcGMQ07
 utHslzjSGpGo8tsMOCOoug9fGcd4dz4pCeYgMqOtzZqJimmA82b/q1ADW8JaWrmH
 3tE7+Qhr4rH3GPhe7HRQAYkkdC7XK7h6ON9aFLdTu+mwq1t/kzmt8j/O5WdEHUl3
 ppjh/ONpns7tfuO4B2RBpzJp2NdXSSaQQSgm+yLgUe548KKy7yMbq+1OP1RVGX8u
 i+GvVWjX85Xf33pqmFYpQ==
X-ME-Sender: <xms:5v2eZybNuNqzxk9dTEISjdkXwMVZLSzRf9I0DJRc1IXYsHA42-g76A>
 <xme:5v2eZ1aZ_YPYhe0pQQ_sMrJZVcXnAsXLmPDGfpgL2TMFjWbp6PpUR2pFlGlhIL4pT
 Cxz8zuJXPhUUf0>
X-ME-Received: <xmr:5v2eZ8_lZfEl_TXpDDf1EO8CHdkR5WXgK61xtm8l0eU0VTgCh2g30nyhS6Y>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddufeejhecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
 uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
 hnthhsucdlqddutddtmdenucfjughrpeffhffvuffkgggtugesghdtreertddtvdenucfh
 rhhomhepffgvmhhiucforghrihgvucfqsggvnhhouhhruceouggvmhhisehinhhvihhsih
 gslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepudejgfejgeeg
 lefhveekledtkedvuefhteeiffefhfekhefhveehhfekgfdugeeknecuvehluhhsthgvrh
 fuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepuggvmhhisehinhhvihhsihgs
 lhgvthhhihhnghhslhgrsgdrtghomhdpnhgspghrtghpthhtohepudeipdhmohguvgepsh
 hmthhpohhuthdprhgtphhtthhopehhohhnghhlvghiuddrhhhurghnghesrghmugdrtgho
 mhdprhgtphhtthhopehrrgihrdhhuhgrnhhgsegrmhgurdgtohhmpdhrtghpthhtohepug
 hmihhtrhihrdhoshhiphgvnhhkohestgholhhlrggsohhrrgdrtghomhdprhgtphhtthho
 pegurhhiqdguvghvvghlsehlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhgpdhrtg
 hpthhtoheprghirhhlihgvugesrhgvughhrghtrdgtohhmpdhrtghpthhtohepkhhrrgig
 vghlsehrvgguhhgrthdrtghomhdprhgtphhtthhopehguhhrtghhvghtrghnshhinhhghh
 estghhrhhomhhiuhhmrdhorhhgpdhrtghpthhtohepohhlvhgrfhhfvgesghhmrghilhdr
 tghomhdprhgtphhtthhopegrkhhihhhikhhordhouggrkhhisegurgihnhhigidrtghomh
X-ME-Proxy: <xmx:5v2eZ0o_kvYUoj1MkPPTqAR50VeauorRCOLQS5P_rShN7sc680H50A>
 <xmx:5v2eZ9oynSEf4YG4DG2yuqQyg0-XLBXWnCHIn9luSF1UBhG5isbdZQ>
 <xmx:5v2eZyQfffkbwhmHealFiqgvgSU0NWZFP0QMmJbp_Lg2z7pBX_k26A>
 <xmx:5v2eZ9orDgSl0hVFWwvJoYMAs_qMFFaOYTrynaTW3fodOHKTW01RxA>
 <xmx:5_2eZzaWCamvQOxzxn_Ksv2U3ZitpXJUH1_G7-ivNGaej9yjsT6jsG3G>
Feedback-ID: iac594737:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 2 Feb 2025 00:08:53 -0500 (EST)
Date: Sun, 2 Feb 2025 00:08:46 -0500
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: "Huang, Honglei1" <Honglei1.Huang@amd.com>, Huang Rui <ray.huang@amd.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>, Akihiko Odaki <akihiko.odaki@daynix.com>,
 Lingshan Zhu <Lingshan.Zhu@amd.com>,
 Xen developer discussion <xen-devel@lists.xenproject.org>,
 Marek =?us-ascii?B?PT91dGYtOD9RP01hcmN6eWtvd3NraS1HPUMzPUIzcmVja2k/?=
 =?us-ascii?Q?=3D?= <marmarek@invisiblethingslab.com>,
 Xenia Ragiadakou <burzalodowa@gmail.com>,
 Stefano Stabellini <stefano.stabellini@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Xen memory management primitives for GPU virtualization
Message-ID: <Z5794ysNE4KDkFuT@itl-email>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="xfrIvn0OgIq9mZNB"
Content-Disposition: inline
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


--xfrIvn0OgIq9mZNB
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Sun, 2 Feb 2025 00:08:46 -0500
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: "Huang, Honglei1" <Honglei1.Huang@amd.com>,
	Huang Rui <ray.huang@amd.com>,
	Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	dri-devel@lists.freedesktop.org, David Airlie <airlied@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Gurchetan Singh <gurchetansingh@chromium.org>,
	Chia-I Wu <olvaffe@gmail.com>,
	Akihiko Odaki <akihiko.odaki@daynix.com>,
	Lingshan Zhu <Lingshan.Zhu@amd.com>,
	Xen developer discussion <xen-devel@lists.xenproject.org>,
	Marek =?us-ascii?B?PT91dGYtOD9RP01hcmN6eWtvd3NraS1HPUMzPUIzcmVja2k/?=
	=?us-ascii?Q?=3D?= <marmarek@invisiblethingslab.com>,
	Xenia Ragiadakou <burzalodowa@gmail.com>,
	Stefano Stabellini <stefano.stabellini@amd.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Xen memory management primitives for GPU virtualization

Cc:=20
Bcc:=20
Subject: Xen requirements for GPU virtualization via virtio-GPU
Reply-To:=20
X-Mutt-Fcc: =3DINBOX,=3Dxen-devel,=3DSent
X-Mutt-PGP: S

Recently, AMD submitted patches to the dri-devel mailing list to support
using application-provided buffers in virtio-GPU.  This feature is
called Shared Virtual Memory (SVM) and it is implemented via an API
called User Pointer (userptr).  This lead to some discussion on
dri-devel@lists.freedesktop.org and dri-devel IRC, from which I
concluded that Xen is missing critical primitives for GPU-accelerated
graphics and compute.  The missing primitives for graphics are the ones
discussed at Xen Project Summit 2024, but it turns out that additional
primitives are needed for compute workloads.

As discussed at Xen Project Summit 2024, GPU acceleration via virtio-GPU
requires that an IOREQ server have access to the following primitives:

1. Map: Map a backend-provided buffer into the frontend.  The buffer
   might point to system memory or to a PCIe BAR.  The frontend is _not_
   allowed to use these buffers in hypercalls or grant them to other
   domains.  Accessing the pages using hypercalls directed at the
   frontend fails as if the frontend did not have the pages.  The only
   exception is that the frontend _may_ be allowed to use the buffer in
   a Map operation, provided that Revoke (below) is transitive.

2. Revoke: Revoke access to a buffer provided by the backend.  Once
   access is revoked, no operation on or in the frontend domain can
   access or modify the pages, and the backend can safely reuse the
   backing memory for other purposes.  Furthermore, revocation is not
   allowed to fail unless the backend or hypervisor is buggy, and if it
   does fail for any reason, the backend will panic.  Once access is
   revoked, further accesses by the frontend will cause a fault that the
   backend can intercept.

Map can be handled by userspace, but Revoke must be handled entirely
in-kernel.  This is because Revoke happens from a Linux MMU notifier
callback, and those are not allowed to block, fail, or involve userspace
in any way.  Since MMU notifier callbacks are called before freeing
memory, failure means that some other part of the system still has
access to freed memory that might be reused for other purposes, which
is a security vulnerability.

It turns out that compute has additional requirements.  Graphics APIs
use DMA buffers (dmabufs), which only support a subset of operations.
In particular, direct I/O doesn't work.  Compute APIs allow users to
make malloc'd memory accessible to the GPU.  This memory can be used
in Linux kernel direct I/O and in other operations that do not work
with dmabufs.  However, such memory starts out as frontend-owned pages,
so it must be converted to backend pages before it can be used by the
GPU.  Linux supports migration of userspace pages, but this is too
unreliable to be used for this purpose.  Instead, it will need to be
done by Xen and the backend.

This requires two additional primitives:

3. Steal: Convert frontend-owned pages to backend-owned pages and
   provide the backend with a mapping of the page.  After a successful
   Steal operation, the pages are in the same state as if they had been
   provided via Map.  Steal fails if the pages are currently being used
   in a hypercall, are MMIO (as opposed to system memory), were provided
   by another domain via Map or grant tables, are currently foreign
   mapped, are currently granted to another domain, or more generally
   are accessible to any domain other than the target domain.  The
   frontend's quota is decreased by the number of pages stolen, and the
   backend's quota is increased by the same amount.  A successful Steal
   operation means that Revoke and Map can be used to operate on the
   pages.

4. Return: Convert a backend-owned page to a frontend-owned page.  After
   a successful call to Return, the backend is no lonter able to use
   Revoke or Map.  The returned page ceases to count against backend
   quota and now counts against frontend quota.

Are these operations ones that Xen is interested in providing?  There
may be other primitives that are sufficient to implement the above four,
but I believe that any solution that allows virtio-GPU to work must
allow the above four operations to be implemented.  Without the first
two, virtio-GPU will not be able to support Vulkan or native contexts,
and without the second two also being present, shared virtual memory
and compute APIs that require it will not work.
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--xfrIvn0OgIq9mZNB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEopQtqVJW1aeuo9/sszaHOrMp8lMFAmee/d4ACgkQszaHOrMp
8lPaQQ/9Ern0ko7OPnEl4/TRQ+LI7iawb45bEXoOoOmj2AeHl3hlvJK6eGQ3Q520
71VAeRYl3h5MZm5LQRjTUm1iz+q+3vQJhZuUs6m/mD0sla2XHIAS2ILJWe8bNILb
q5Pq6bsSlEZMyVJOzrpp5Ym/IWf0oYYvgT6epkggI5lmND3wE8/2ns0RupZW5jQW
0pzNhPYVe9WHMtCZDPQWqzTgrXxbabAw1QO2fV9Epf/jojqbsBhnWoijqHoTKfjd
pi7J+QG+v4KyRM1Oql9f/JFhwJ5rP+te/dn08hsKuuwTCortSq3gRjyGup1tHDvU
l3roIHfT3nppVUh5cDiLTDybYtD16unhRcoEPO+VtH8kQ15Q9vY3u326k563f5xg
WRRVCJUJX+druNkQg1YA1XRGE6N3LvvD189+GWnIsZHuIf4/LD5lC/VlNjxscAIl
NRIV6TPP/cgiCLLX6zT1AoCS1vum4jRIopjhOTXZUlcrI9Pn+ZM9cEsazAxE9g4/
xHr3idiUkKksj5D2TjqTHfNCQn3WvMKYphzbxxOLKFLMnQBQRGJ6wSDqY+PGJAIX
1GMQ+pbsJO5XkWj+wJm7j7nDAYas+/qz+A3S+Ko1FM0OJ8/2HYcMzyf+wg219k6j
JkKMA0HmxUfgc5tcmyRd0jZZkAQ301ChEatIwzEHTXb2gxv1eKk=
=pzYf
-----END PGP SIGNATURE-----

--xfrIvn0OgIq9mZNB--
