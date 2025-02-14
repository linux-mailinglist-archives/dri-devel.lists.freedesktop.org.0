Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06A0AA365CA
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2025 19:36:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E19FD10E042;
	Fri, 14 Feb 2025 18:36:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=invisiblethingslab.com header.i=@invisiblethingslab.com header.b="kiIoQ5Ke";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="lJA7jIuP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fhigh-b7-smtp.messagingengine.com
 (fhigh-b7-smtp.messagingengine.com [202.12.124.158])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4321310E042;
 Fri, 14 Feb 2025 18:36:20 +0000 (UTC)
Received: from phl-compute-02.internal (phl-compute-02.phl.internal
 [10.202.2.42])
 by mailfhigh.stl.internal (Postfix) with ESMTP id 3A7F72540158;
 Fri, 14 Feb 2025 13:36:19 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-02.internal (MEProxy); Fri, 14 Feb 2025 13:36:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 invisiblethingslab.com; h=cc:cc:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm3; t=1739558179;
 x=1739644579; bh=7ZTwxfUWkOIlcqGLdRKyv3ky064qVFdtn29T51aBe6c=; b=
 kiIoQ5Ke+KnWoKWLaTrp/NMEPZfIJkOfjFi7drZeOk3pA+iBSESKjeBJaEg0HAq4
 eBqq6Xmj9Pu4ZtlAvhxnYbqg2Vnh/6rAG4kq3H8ntPj/drOs/BEc8s5OYN3z4QwL
 Hg5APtSxMBEQC9KxEej9p6BAYJdV+vOGkgcfauw7qdDtnC1PTGy2wheBCFZQbdo2
 m4U3aSFTf9KoIITTsX8vvCXwpNnFI/kX0Xl7sHN6X5IqHp/tnMlAwabXhdbwrUW5
 W9L3rZN9HoqsD39Vwcv8n6RNjQV6EYTl67kqlWtf4Xe0yuJkAU8V2Aux23/IWZil
 5V1Kv5dbmokYD8/zsQmpCA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:subject:subject:to
 :to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
 1739558179; x=1739644579; bh=7ZTwxfUWkOIlcqGLdRKyv3ky064qVFdtn29
 T51aBe6c=; b=lJA7jIuPPINjJQqmPBa/2gU4wYBB7TgO03nAOzRTiw94BZps0Ls
 zoqYIEYpmNeuvldrWDn0euO09aPALe5Kpkmm7plee2yPx2zgwMjwrL/syRwnjrIs
 F08N4LBp5xxP113IQ/cNWcCqmFQ+rcMrNO4JU68inRGyg7saH8rfElkaxN92yJjf
 1/s6pODx8D89oaZsrTcyyc4Hj0Ti7EbJB5I4PWKWeFdD5FYc2fJjzUmI7CWaZvV8
 g7G4jAKZ5+kBk6NSUKr0XWGgDmQrZOSto5GzjuUr4WDAxK+EiMBeMif2P+ziht7N
 Mru+sCBg4NQz+u4t3OAy/wInqh5SeAF2G+w==
X-ME-Sender: <xms:Io2vZ-janKeWESw0zubfobZa6fsQ4r4ZwsxziQDm70tPBhkBtjWpmQ>
 <xme:Io2vZ_DAS5AeeKNQG0MRT8h_6nKmBeqKFQadG-mYahtc7JjqxV58WOlAq42urKY92
 L-0--0k66ZfxAY>
X-ME-Received: <xmr:Io2vZ2EeOXQoecTIRmNlBijt-4F6YSVctVQMg_std-RUh-sYeG6mJ1ct4eQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdehtdefkecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
 uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
 hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehgtderredttdej
 necuhfhrohhmpeffvghmihcuofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvh
 hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpedvjeet
 geekhfetudfhgfetffegfffguddvgffhffeifeeikeektdehgeetheffleenucevlhhush
 htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpeguvghmihesihhnvhhi
 shhisghlvghthhhinhhgshhlrggsrdgtohhmpdhnsggprhgtphhtthhopedutddpmhhoug
 gvpehsmhhtphhouhhtpdhrtghpthhtohepthhhohhmrghsrdhhvghllhhsthhrohhmsehl
 ihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepmhgrthhthhgvfidrsghrohhsth
 esihhnthgvlhdrtghomhdprhgtphhtthhopehinhhtvghlqdigvgeslhhishhtshdrfhhr
 vggvuggvshhkthhophdrohhrghdprhgtphhtthhopegurhhiqdguvghvvghlsehlihhsth
 hsrdhfrhgvvgguvghskhhtohhprdhorhhgpdhrtghpthhtohephhhimhgrlhdrphhrrghs
 rggurdhghhhimhhirhgrhiesihhnthgvlhdrtghomhdprhgtphhtthhopegrphhophhplh
 gvsehnvhhiughirgdrtghomhdprhgtphhtthhopegrihhrlhhivggusehgmhgrihhlrdgt
 ohhmpdhrtghpthhtohepshhimhhonhgrrdhvvghtthgvrhesfhhffihllhdrtghhpdhrtg
 hpthhtohepfhgvlhhigidrkhhuvghhlhhinhhgsegrmhgurdgtohhm
X-ME-Proxy: <xmx:Io2vZ3SB7DG66emuwqeq4oBEsVJL_IeJzRWfHJ3FzrwhRyKINAg5nw>
 <xmx:Io2vZ7waNel0OFIyDA-S3QGGF_ljshWAGHXnSsy0H2bBRJT4Spmydg>
 <xmx:Io2vZ17m1y-BVUXzMLhEt5Sk89U1aBOMcVq3ASenGJ2j5y831b6wYA>
 <xmx:Io2vZ4wbK61XQLwEGV50SHn3cPz8Qs5YSIhjqSit0huvwDtci0mtPQ>
 <xmx:I42vZwrUR865-hwCTNnvPItkIakpOSLXaCSXCQKqgJHYWNnw96nMMVgg>
Feedback-ID: iac594737:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 14 Feb 2025 13:36:17 -0500 (EST)
Date: Fri, 14 Feb 2025 13:36:10 -0500
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, apopple@nvidia.com, airlied@gmail.com,
 simona.vetter@ffwll.ch, felix.kuehling@amd.com, dakr@kernel.org
Subject: Re: [PATCH v5 00/32] Introduce GPU SVM and Xe SVM implementation
Message-ID: <Z6-NHgRbMzhkFYcq@itl-email>
References: <20250213021112.1228481-1-matthew.brost@intel.com>
 <Z65ix566lLCPOsob@itl-email>
 <433228556ac6ad42b21c942dc6c070069107660e.camel@linux.intel.com>
 <Z69r3reWGZq5W7iw@itl-email>
 <ae45297e3132f13c6d5113aefeaed2c91ed7010c.camel@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ftlsOmd0BVm8SH6i"
Content-Disposition: inline
In-Reply-To: <ae45297e3132f13c6d5113aefeaed2c91ed7010c.camel@linux.intel.com>
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


--ftlsOmd0BVm8SH6i
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Fri, 14 Feb 2025 13:36:10 -0500
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
	Matthew Brost <matthew.brost@intel.com>,
	intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, apopple@nvidia.com, airlied@gmail.com,
	simona.vetter@ffwll.ch, felix.kuehling@amd.com, dakr@kernel.org
Subject: Re: [PATCH v5 00/32] Introduce GPU SVM and Xe SVM implementation

On Fri, Feb 14, 2025 at 05:26:48PM +0100, Thomas Hellstr=C3=B6m wrote:
> Hi!
>=20
> On Fri, 2025-02-14 at 11:14 -0500, Demi Marie Obenour wrote:
> > On Fri, Feb 14, 2025 at 09:47:13AM +0100, Thomas Hellstr=C3=B6m wrote:
> > > Hi
> > >=20
> > > On Thu, 2025-02-13 at 16:23 -0500, Demi Marie Obenour wrote:
> > > > On Wed, Feb 12, 2025 at 06:10:40PM -0800, Matthew Brost wrote:
> > > > > Version 5 of GPU SVM. Thanks to everyone (especially Sima,
> > > > > Thomas,
> > > > > Alistair, Himal) for their numerous reviews on revision 1, 2,
> > > > > 3=C2=A0
> > > > > and for
> > > > > helping to address many design issues.
> > > > >=20
> > > > > This version has been tested with IGT [1] on PVC, BMG, and LNL.
> > > > > Also
> > > > > tested with level0 (UMD) PR [2].
> > > >=20
> > > > What is the plan to deal with not being able to preempt while a
> > > > page
> > > > fault is pending?=C2=A0 This seems like an easy DoS vector.=C2=A0 My
> > > > understanding
> > > > is that SVM is mostly used by compute workloads on headless
> > > > systems.
> > > > Recent AMD client GPUs don't support SVM, so programs that want
> > > > to
> > > > run
> > > > on client systems should not require SVM if they wish to be
> > > > portable.
> > > >=20
> > > > Given the potential for abuse, I think it would be best to
> > > > require
> > > > explicit administrator opt-in to enable SVM, along with possibly
> > > > having
> > > > a timeout to resolve a page fault (after which the context is
> > > > killed).
> > > > Since I expect most uses of SVM to be in the datacenter space
> > > > (for
> > > > the
> > > > reasons mentioned above), I don't believe this will be a major
> > > > limitation in practice.=C2=A0 Programs that wish to run on client
> > > > systems
> > > > already need to use explicit memory transfer or pinned userptr,
> > > > and
> > > > administrators of compute clusters should be willing to enable
> > > > this
> > > > feature because only one workload will be using a GPU at a time.
> > >=20
> > > While not directly having addressed the potential DoS issue you
> > > mention, there is an associated deadlock possibility that may
> > > happen
> > > due to not being able to preempt a pending pagefault. That is if a
> > > dma-
> > > fence job is requiring the same resources held up by the pending
> > > page-
> > > fault, and then the pagefault servicing is dependent on that dma-
> > > fence
> > > to be signaled in one way or another.
> > >=20
> > > That deadlock is handled by only allowing either page-faulting jobs
> > > or
> > > dma-fence jobs on a resource (hw engine or hw engine group) that
> > > can be
> > > used by both at a time, blocking synchronously in the exec IOCTL
> > > until
> > > the resource is available for the job type. That means LR jobs
> > > waits
> > > for all dma-fence jobs to complete, and dma-fence jobs wait for all
> > > LR
> > > jobs to preempt. So a dma-fence job wait could easily mean "wait
> > > for
> > > all outstanding pagefaults to be serviced".
> > >=20
> > > Whether, on the other hand, that is a real DoS we need to care
> > > about,
> > > is probably a topic for debate. The directions we've had so far are
> > > that it's not. Nothing is held up indefinitely, what's held up can
> > > be
> > > Ctrl-C'd by the user and core mm memory management is not blocked
> > > since
> > > mmu_notifiers can execute to completion and shrinkers / eviction
> > > can
> > > execute while a page-fault is pending.
> >=20
> > The problem is that a program that uses a page-faulting job can lock
> > out
> > all other programs on the system from using the GPU for an indefinite
> > period of time.=C2=A0 In a GUI session, this means a frozen UI, which
> > makes
> > recovery basically impossible without drastic measures (like
> > rebooting
> > or logging in over SSH).=C2=A0 That counts as a quite effective denial =
of
> > service from an end-user perspective, and unless I am mistaken it
> > would
> > be very easy to trigger by accident: just start a page-faulting job
> > that
> > loops forever.
>=20
> I think the easiest remedy for this is that if a page-faulting job is
> either by purpose or mistake crafted in such a way that it holds up
> preemption when preemption is needed (like in the case I described, a
> dma-fence job is submitted) the driver will hit a preemption timeout
> and kill the pagefaulting job. (I think that is already handled in all
> cases in the xe driver but I would need to double check). So this would
> then boil down to the system administrator configuring the preemption
> timeout.

That makes sense!  That turns a DoS into "Don't submit pagefaulting jobs
on an interactive system, they won't be reliable."
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--ftlsOmd0BVm8SH6i
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEopQtqVJW1aeuo9/sszaHOrMp8lMFAmevjRsACgkQszaHOrMp
8lOWHg//eLLAkZejnVcFf7fFDn4HDPcjdbBYVx1wMyS4XTIOoeF0ztvzesbf/4Xs
j8f/Vt4Ujb3bYXgF+FppZdopr5bivHkWxsUh2zzweNQ3+Wh45z6duT1pfDoBFncn
jw15+5FIaAsjSpVvRDK0s+JKg7XRxg4I2u9ZrT8FIektO89ZZxjUZQBEK4Z6tkOc
K3Qv4P2es0gge9AaTcCk8xniJkp6+0FhMyg8ewE6YH99cqU7PlC/iq/O47vLK4+i
lAAfAjs6dF25Yx9KYDgna5ALiFJXn+Imvh6Bep4xz0zAQdwNPvsmMwVi1IQfXbYX
6LUSs0yU/iG3hygO3hJ4QdlOUfHQQKOR3sjoMXsT6bBBCJ0aNZR6+ED6KDZEnfcZ
vXImGcu96IKW7W0gIbVQ1EZsGOEXgMs7GaNIXu0MGBIf7qg2tSRAYz/0Ide/LO+V
aDE0DYiUsDZ+6lKmNCz8cnoXuy5mV1ZCs9EixB++XKyZ7eqLe8j+xCgYAD7KV6xn
srNhT4e9LzyHSQ+u+0bv5f3onGBVUl2q3Sv1kr78niD2C6pkpFhJ18Ae7rzqsFpB
2LQl1bP8CYHAs8Al570eCQBPFwD//abp27oHe0e6scxmzGNFJrdaD+0OmweU1RBC
dA0mBWui4X1y5kAGAhAy0Jih4ZA4x6CMr+JxCKLUsrP+miWOrk4=
=i/Xe
-----END PGP SIGNATURE-----

--ftlsOmd0BVm8SH6i--
