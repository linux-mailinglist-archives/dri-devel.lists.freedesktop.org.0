Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C90F6C3B8C3
	for <lists+dri-devel@lfdr.de>; Thu, 06 Nov 2025 15:04:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1654810E8E5;
	Thu,  6 Nov 2025 14:04:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X3ExHMKl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E346510E8DE;
 Thu,  6 Nov 2025 14:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762437842; x=1793973842;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=XsKoKCJUyaXtGWfJzy6ovo9M30gDGcuFn8pFzErVQzQ=;
 b=X3ExHMKlhPszD17H1T0AbQfgRpMJYHyN+PKFvX7pJxsnryouawTBKhTN
 hxScrUv31PSVrkOWaqeyTXxQ7nNVKl6gojiNZkpO1laInO/csnw6lEBAV
 KcoXaDexDIHo1FoWFWAw/FErsz5Opl8DbJankWMABnZIBor/DLpOhwQne
 nklAQFATvbFHxk1jDNiG1AOrtEZb0W4UOB4cHQVSz/1xX2agfbER9fORw
 ytLf12d77c26pa6AviBsdJSmQBRjEpTzTNiYGMErzSEtRz7lTW0ZGEY+X
 2G0de5ne3YxVRy5Lslx1axJC8qgr0JwX/UG7I/55GVtUQ+3Fe5cCHq4Zc w==;
X-CSE-ConnectionGUID: z5lyubx5RhCPa6U331w39g==
X-CSE-MsgGUID: 5t+o+NTsTWa1aCzWhjWfXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="75181740"
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; d="scan'208";a="75181740"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 06:04:02 -0800
X-CSE-ConnectionGUID: a3poRIfRTmyKokEdlZVRDg==
X-CSE-MsgGUID: T+rRKSimStirho1IiirNUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; d="scan'208";a="192041508"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost)
 ([10.245.244.173])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 06:03:57 -0800
Date: Thu, 6 Nov 2025 15:03:55 +0100
From: Pawel Sikora <pawel.sikora@linux.intel.com>
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>, adrinael@adrinael.net,
 arek@hiler.eu, kamil.konieczny@linux.intel.com,
 juhapekka.heikkila@gmail.com, bhanuprakash.modem@gmail.com,
 ashutosh.dixit@intel.com, karthik.b.s@intel.com,
 liviu.dudau@arm.com, steven.price@arm.com, aliceryhl@google.com,
 jeffv@google.com, intel-gfx@lists.freedesktop.org,
 igt-dev@lists.freedesktop.org, pawel.sikora@intel.com,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH i-g-t v3 3/3] tests/panthor: add panthor tests
Message-ID: <20251106140355.lpsgbj7i6hlx2jji@pawelsik-desk>
References: <20251104202845.2879460-1-daniel.almeida@collabora.com>
 <20251104202845.2879460-4-daniel.almeida@collabora.com>
 <20251104220412.24b4b454@fedora>
 <F3A3F344-2406-41E4-906E-481A4A56AC1A@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <F3A3F344-2406-41E4-906E-481A4A56AC1A@collabora.com>
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

Hi Daniel,

There is a new IGT GPU tools documentation site:
https://drm.pages.freedesktop.org/igt-gpu-tools/ which is available via Gitlab Pages.

Especially the part regarding hw platforms might be interested for you in case you
would like to add something about your tests:
https://drm.pages.freedesktop.org/igt-gpu-tools/platforms/
Modifications can be made in docs directory in markdown files and posted here(Patchwork)
for review for this or a new patch:
https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/blob/master/docs/platforms.md

Please have a look in case you would like to add some note for others.

Kind Regards,
Pawel

On Thu, Nov 06, 2025 at 08:13:14AM -0300, Daniel Almeida wrote:
> Kamil, 
> 
> > On 4 Nov 2025, at 18:04, Boris Brezillon <boris.brezillon@collabora.com> wrote:
> > 
> > On Tue,  4 Nov 2025 17:28:43 -0300
> > Daniel Almeida <daniel.almeida@collabora.com> wrote:
> > 
> >> +igt_main {
> >> + int fd;
> >> +
> >> + igt_fixture {
> >> + fd = drm_open_driver(DRIVER_PANTHOR);
> >> + }
> >> +
> >> + igt_describe("Create and destroy a CSF group.");
> >> + igt_subtest("group_create") {
> >> + struct drm_panthor_vm_create vm_create = {};
> >> + struct drm_panthor_vm_destroy vm_destroy = {};
> >> + uint32_t group_handle;
> >> +
> >> + vm_create.flags = 0;
> >> + do_ioctl(fd, DRM_IOCTL_PANTHOR_VM_CREATE, &vm_create);
> >> + igt_assert_neq(vm_create.id, 0);
> >> +
> >> + group_handle = igt_panthor_group_create_simple(fd, vm_create.id, 0);
> >> + igt_assert_neq(group_handle, 0);
> >> +
> >> + igt_panthor_group_destroy(fd, group_handle, 0);
> >> +
> >> + vm_destroy = (struct drm_panthor_vm_destroy) { .id = vm_create.id };
> >> + do_ioctl(fd, DRM_IOCTL_PANTHOR_VM_DESTROY, &vm_destroy);
> >> + }
> >> +
> >> + igt_describe("Submit a job to a group and wait for completion. "
> >> + "The job writes a known value to a buffer object that is then "
> >> + "mmaped and checked.");
> > 
> > nit: indentation is off ^
> > 
> > igt_describe("Submit a job to a group and wait for completion. "
> >     "The job writes a known value to a buffer object that is then "
> >     "mmaped and checked.");
> 
> What should I do here?
> 
> Usually sending new versions so soon would be confusing. Given it's a trivial
> fix, can you do it while applying? If not, should I wait a few days so that
> this collects a few more tags?
> 
> — Daniel
> 
