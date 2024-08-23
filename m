Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EAE5195C6FB
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2024 09:53:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DFA710EC3C;
	Fri, 23 Aug 2024 07:53:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.b="uL+E+TcY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [62.89.141.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FCD410EC3B;
 Fri, 23 Aug 2024 07:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=rOoo4FQ0l9gDxiXKpG4Bqp0Jh6cejWRo351EVbPg1Fk=; b=uL+E+TcYWT7M2jqyy185yYkDza
 x1/AM0kmTyGOrUV3RrABsme3F9gIFSCccOXit27YwUU4vL2t2lodqoqD2i29lo6fIIJZLDrvOBW7I
 O1JbxG4Az9+xpypJLvK8wEqJmvi9cKUiMGyux2y6LfB6lZ/CPpC+gZlUACXcR0WXroftRDz5Wscsh
 15EwkyC7w5I5XLF9p966Wj3f/iM19yPHQldnfDCpIJ2AVB5apOarIEsdGHmeUR2uXRYL9DRcCwZc3
 migwg1cnRVm9P3eKL9mrYo6yY9J8RpRMwVSXkbLdITE/SKYWA93oTtHin/4X+aLcYwVHutR2Uh1ZF
 DpzGGoKA==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.98 #2 (Red Hat
 Linux)) id 1shP6x-00000004RWX-46JG; Fri, 23 Aug 2024 07:53:32 +0000
Date: Fri, 23 Aug 2024 08:53:31 +0100
From: Al Viro <viro@zeniv.linux.org.uk>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-fsdevel@vger.kernel.org, Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [PATCH 1/4] new helper: drm_gem_prime_handle_to_dmabuf()
Message-ID: <20240823075331.GE1049718@ZenIV>
References: <20240812065656.GI13701@ZenIV>
 <20240812065906.241398-1-viro@zeniv.linux.org.uk>
 <57520a28-fff2-41ae-850b-fa820d2b0cfa@suse.de>
 <20240822152022.GU504335@ZenIV> <20240823015719.GV504335@ZenIV>
 <50379388-302d-420a-8397-163433c31bdc@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <50379388-302d-420a-8397-163433c31bdc@suse.de>
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

On Fri, Aug 23, 2024 at 09:21:14AM +0200, Thomas Zimmermann wrote:

> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
> 
> Thank you so much.

OK, Acked-by added, branch force-pushed to
git://git.kernel.org:/pub/scm/linux/kernel/git/viro/vfs.git #for-drm

In case if anybody wants a signed pull request, see below; or just
cherry-pick, etc. - entirely up to drm and amd folks...

The following changes since commit 8400291e289ee6b2bf9779ff1c83a291501f017b:

  Linux 6.11-rc1 (2024-07-28 14:19:55 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs.git tags/pull-for-drm

for you to fetch changes up to 30581926c42d1886cce2a04dcf615f551d829814:

  amdgpu: get rid of bogus includes of fdtable.h (2024-08-23 03:46:46 -0400)

----------------------------------------------------------------
get rid of racy manipulations of descriptor table in amdgpu

----------------------------------------------------------------
Al Viro (4):
      new helper: drm_gem_prime_handle_to_dmabuf()
      amdgpu: fix a race in kfd_mem_export_dmabuf()
      amdkfd CRIU fixes
      amdgpu: get rid of bogus includes of fdtable.h

 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c    |  1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c   | 12 +---
 drivers/gpu/drm/amd/amdgpu/amdgpu_sched.c          |  1 -
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c           | 64 ++++++++++++-----
 drivers/gpu/drm/drm_prime.c                        | 84 ++++++++++++++--------
 include/drm/drm_prime.h                            |  3 +
 6 files changed, 106 insertions(+), 59 deletions(-)
