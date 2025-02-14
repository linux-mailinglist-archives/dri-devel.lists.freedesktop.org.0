Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5D81A3594A
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2025 09:47:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A78DC10EC06;
	Fri, 14 Feb 2025 08:47:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RRoXFtAz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2971610EC00;
 Fri, 14 Feb 2025 08:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739522850; x=1771058850;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=ZJQBYaNf8d623Z/K95levU9ROpVzA9h/aaLUypNmR5o=;
 b=RRoXFtAzHVXMuHdUDq7nKM9UJDSiFUAf8f48wVDBIfyC/qOXAm6xxTOK
 ADxkDKY5BTG7irwMco4sk9C8tjF8ofSqKnICnF26TFNY8NZYmmpmaDhTc
 AO49JNnWumjHY6Jxb/E3AVLSbb0po4OVg7NC8sWoMEzcwARUcTgyeoze2
 sHrgkuGydVuj9uB88iX+Oi4fAfqMSuoXt8Hy5aWBaXQqG1deLU0s8JBKo
 xsrSe2fDUT0/PAyG9EtJHCgtrU5QFOi92HbC7tAedfVuXac/L6uUnpKB9
 zsPM2t2fsFSHXAL8B2qYsgS35bcFiedymZrTqRNlJYTeBScKp1GgG1jTQ g==;
X-CSE-ConnectionGUID: BzY65AphRy+Vt0h5oeEFww==
X-CSE-MsgGUID: lEfPGnNrSd2Ms67Nva/AOA==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="40187187"
X-IronPort-AV: E=Sophos;i="6.13,285,1732608000"; d="scan'208";a="40187187"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2025 00:47:30 -0800
X-CSE-ConnectionGUID: ZqK0XUeySa6tXk79uRt1SA==
X-CSE-MsgGUID: CsABnFrATxOBzAbswb/nOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,285,1732608000"; d="scan'208";a="144254306"
Received: from dprybysh-mobl.ger.corp.intel.com (HELO [10.245.246.74])
 ([10.245.246.74])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2025 00:47:27 -0800
Message-ID: <433228556ac6ad42b21c942dc6c070069107660e.camel@linux.intel.com>
Subject: Re: [PATCH v5 00/32] Introduce GPU SVM and Xe SVM implementation
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Demi Marie Obenour <demi@invisiblethingslab.com>, Matthew Brost
 <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, apopple@nvidia.com, airlied@gmail.com, 
 simona.vetter@ffwll.ch, felix.kuehling@amd.com, dakr@kernel.org
Date: Fri, 14 Feb 2025 09:47:13 +0100
In-Reply-To: <Z65ix566lLCPOsob@itl-email>
References: <20250213021112.1228481-1-matthew.brost@intel.com>
 <Z65ix566lLCPOsob@itl-email>
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

Hi

On Thu, 2025-02-13 at 16:23 -0500, Demi Marie Obenour wrote:
> On Wed, Feb 12, 2025 at 06:10:40PM -0800, Matthew Brost wrote:
> > Version 5 of GPU SVM. Thanks to everyone (especially Sima, Thomas,
> > Alistair, Himal) for their numerous reviews on revision 1, 2, 3=C2=A0
> > and for
> > helping to address many design issues.
> >=20
> > This version has been tested with IGT [1] on PVC, BMG, and LNL.
> > Also
> > tested with level0 (UMD) PR [2].
>=20
> What is the plan to deal with not being able to preempt while a page
> fault is pending?=C2=A0 This seems like an easy DoS vector.=C2=A0 My
> understanding
> is that SVM is mostly used by compute workloads on headless systems.
> Recent AMD client GPUs don't support SVM, so programs that want to
> run
> on client systems should not require SVM if they wish to be portable.
>=20
> Given the potential for abuse, I think it would be best to require
> explicit administrator opt-in to enable SVM, along with possibly
> having
> a timeout to resolve a page fault (after which the context is
> killed).
> Since I expect most uses of SVM to be in the datacenter space (for
> the
> reasons mentioned above), I don't believe this will be a major
> limitation in practice.=C2=A0 Programs that wish to run on client systems
> already need to use explicit memory transfer or pinned userptr, and
> administrators of compute clusters should be willing to enable this
> feature because only one workload will be using a GPU at a time.

While not directly having addressed the potential DoS issue you
mention, there is an associated deadlock possibility that may happen
due to not being able to preempt a pending pagefault. That is if a dma-
fence job is requiring the same resources held up by the pending page-
fault, and then the pagefault servicing is dependent on that dma-fence
to be signaled in one way or another.

That deadlock is handled by only allowing either page-faulting jobs or
dma-fence jobs on a resource (hw engine or hw engine group) that can be
used by both at a time, blocking synchronously in the exec IOCTL until
the resource is available for the job type. That means LR jobs waits
for all dma-fence jobs to complete, and dma-fence jobs wait for all LR
jobs to preempt. So a dma-fence job wait could easily mean "wait for
all outstanding pagefaults to be serviced".

Whether, on the other hand, that is a real DoS we need to care about,
is probably a topic for debate. The directions we've had so far are
that it's not. Nothing is held up indefinitely, what's held up can be
Ctrl-C'd by the user and core mm memory management is not blocked since
mmu_notifiers can execute to completion and shrinkers / eviction can
execute while a page-fault is pending.

Thanks,
Thomas

