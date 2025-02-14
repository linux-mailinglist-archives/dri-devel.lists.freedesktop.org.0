Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E29F8A36309
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2025 17:27:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E99A410E498;
	Fri, 14 Feb 2025 16:26:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WoB5yoY4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B15DA10E498;
 Fri, 14 Feb 2025 16:26:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739550415; x=1771086415;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=gmmfdkKx3I1O9XEuA7a4fj11IZleZQQwTDgJ9bjGGpw=;
 b=WoB5yoY4geo3z/gZZ/+KLsyEe1qZLbvi8P0B37E+LE/jVu4TcBNGcUJd
 GM6YBwC96txNIs3sPUhm/cFQiSFyh/8L3VAt3TGZ0oI8UPSwP6sIXEvKP
 ketVe6vueB4c808gRFE9GZO4h/u/975UKhkd51oTrXwUQfXkDuYdv8ico
 c9UxHIrOpiJJ2rl7pQWbhzrhxzn6mPB7CVQNjHM2UZvYWk3XI54WZTjo4
 pkvGIv1+uQJcFbmwaEtGfOWgVizxmNZ0PfOdOWy8DtYdkMcNlQRePJ3vK
 QHH1pOjqaLnFauF18kMx3sex6rWAXImPQQ7Uv/P6tpR/q3q9GA6+RFG3t Q==;
X-CSE-ConnectionGUID: eS+pxW1KQKmxUEFN+JNZXQ==
X-CSE-MsgGUID: 4Y39DLNDT3WSm6AAoL90cw==
X-IronPort-AV: E=McAfee;i="6700,10204,11345"; a="62771329"
X-IronPort-AV: E=Sophos;i="6.13,286,1732608000"; d="scan'208";a="62771329"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2025 08:26:55 -0800
X-CSE-ConnectionGUID: 1FrV0G+1TPqWOfb+vF0MqQ==
X-CSE-MsgGUID: sFWFXmRrQXWbUZSwCV70VA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,286,1732608000"; d="scan'208";a="113451973"
Received: from dprybysh-mobl.ger.corp.intel.com (HELO [10.245.246.74])
 ([10.245.246.74])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2025 08:26:52 -0800
Message-ID: <ae45297e3132f13c6d5113aefeaed2c91ed7010c.camel@linux.intel.com>
Subject: Re: [PATCH v5 00/32] Introduce GPU SVM and Xe SVM implementation
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Demi Marie Obenour <demi@invisiblethingslab.com>, Matthew Brost
 <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, apopple@nvidia.com, airlied@gmail.com, 
 simona.vetter@ffwll.ch, felix.kuehling@amd.com, dakr@kernel.org
Date: Fri, 14 Feb 2025 17:26:48 +0100
In-Reply-To: <Z69r3reWGZq5W7iw@itl-email>
References: <20250213021112.1228481-1-matthew.brost@intel.com>
 <Z65ix566lLCPOsob@itl-email>
 <433228556ac6ad42b21c942dc6c070069107660e.camel@linux.intel.com>
 <Z69r3reWGZq5W7iw@itl-email>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi!

On Fri, 2025-02-14 at 11:14 -0500, Demi Marie Obenour wrote:
> On Fri, Feb 14, 2025 at 09:47:13AM +0100, Thomas Hellstr=C3=B6m wrote:
> > Hi
> >=20
> > On Thu, 2025-02-13 at 16:23 -0500, Demi Marie Obenour wrote:
> > > On Wed, Feb 12, 2025 at 06:10:40PM -0800, Matthew Brost wrote:
> > > > Version 5 of GPU SVM. Thanks to everyone (especially Sima,
> > > > Thomas,
> > > > Alistair, Himal) for their numerous reviews on revision 1, 2,
> > > > 3=C2=A0
> > > > and for
> > > > helping to address many design issues.
> > > >=20
> > > > This version has been tested with IGT [1] on PVC, BMG, and LNL.
> > > > Also
> > > > tested with level0 (UMD) PR [2].
> > >=20
> > > What is the plan to deal with not being able to preempt while a
> > > page
> > > fault is pending?=C2=A0 This seems like an easy DoS vector.=C2=A0 My
> > > understanding
> > > is that SVM is mostly used by compute workloads on headless
> > > systems.
> > > Recent AMD client GPUs don't support SVM, so programs that want
> > > to
> > > run
> > > on client systems should not require SVM if they wish to be
> > > portable.
> > >=20
> > > Given the potential for abuse, I think it would be best to
> > > require
> > > explicit administrator opt-in to enable SVM, along with possibly
> > > having
> > > a timeout to resolve a page fault (after which the context is
> > > killed).
> > > Since I expect most uses of SVM to be in the datacenter space
> > > (for
> > > the
> > > reasons mentioned above), I don't believe this will be a major
> > > limitation in practice.=C2=A0 Programs that wish to run on client
> > > systems
> > > already need to use explicit memory transfer or pinned userptr,
> > > and
> > > administrators of compute clusters should be willing to enable
> > > this
> > > feature because only one workload will be using a GPU at a time.
> >=20
> > While not directly having addressed the potential DoS issue you
> > mention, there is an associated deadlock possibility that may
> > happen
> > due to not being able to preempt a pending pagefault. That is if a
> > dma-
> > fence job is requiring the same resources held up by the pending
> > page-
> > fault, and then the pagefault servicing is dependent on that dma-
> > fence
> > to be signaled in one way or another.
> >=20
> > That deadlock is handled by only allowing either page-faulting jobs
> > or
> > dma-fence jobs on a resource (hw engine or hw engine group) that
> > can be
> > used by both at a time, blocking synchronously in the exec IOCTL
> > until
> > the resource is available for the job type. That means LR jobs
> > waits
> > for all dma-fence jobs to complete, and dma-fence jobs wait for all
> > LR
> > jobs to preempt. So a dma-fence job wait could easily mean "wait
> > for
> > all outstanding pagefaults to be serviced".
> >=20
> > Whether, on the other hand, that is a real DoS we need to care
> > about,
> > is probably a topic for debate. The directions we've had so far are
> > that it's not. Nothing is held up indefinitely, what's held up can
> > be
> > Ctrl-C'd by the user and core mm memory management is not blocked
> > since
> > mmu_notifiers can execute to completion and shrinkers / eviction
> > can
> > execute while a page-fault is pending.
>=20
> The problem is that a program that uses a page-faulting job can lock
> out
> all other programs on the system from using the GPU for an indefinite
> period of time.=C2=A0 In a GUI session, this means a frozen UI, which
> makes
> recovery basically impossible without drastic measures (like
> rebooting
> or logging in over SSH).=C2=A0 That counts as a quite effective denial of
> service from an end-user perspective, and unless I am mistaken it
> would
> be very easy to trigger by accident: just start a page-faulting job
> that
> loops forever.

I think the easiest remedy for this is that if a page-faulting job is
either by purpose or mistake crafted in such a way that it holds up
preemption when preemption is needed (like in the case I described, a
dma-fence job is submitted) the driver will hit a preemption timeout
and kill the pagefaulting job. (I think that is already handled in all
cases in the xe driver but I would need to double check). So this would
then boil down to the system administrator configuring the preemption
timeout.


Thanks,
Thomas

