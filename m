Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62F9F98A0F2
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2024 13:38:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFE1610E3F3;
	Mon, 30 Sep 2024 11:38:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=inria.fr header.i=@inria.fr header.b="uATNerqt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 624DA10E3F3;
 Mon, 30 Sep 2024 11:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inria.fr; s=dc;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=nhq8/UPreno8caLcXe4CSQDb5B0HGw0ef8Ii7H+AOns=;
 b=uATNerqtbMuhMDz3jvGZ7blwoQ6xty8ok7dX0EA6QjFkHpi/p7829+C0
 5XU/J5iEhvFrpkcpzn+jpyDke3Ax5/CI8sD90g24LHmCUKLWUE3mZMcom
 uFcuGhvkNuSV9mbPMq58iK5OjyTrH+AVAK51hnXz6GP6/GjTJ4QkR5aDU I=;
Authentication-Results: mail3-relais-sop.national.inria.fr;
 dkim=none (message not signed) header.i=none;
 spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr;
 dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.11,165,1725314400"; d="scan'208";a="97769838"
Received: from dt-lawall.paris.inria.fr ([128.93.67.65])
 by mail3-relais-sop.national.inria.fr with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2024 13:38:20 +0200
Date: Mon, 30 Sep 2024 13:38:19 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
To: =?ISO-8859-15?Q?Christian_K=F6nig?= <christian.koenig@amd.com>
cc: Alex Deucher <alexander.deucher@amd.com>, kernel-janitors@vger.kernel.org, 
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 29/35] drivers/gpu/drm: Reorganize kerneldoc parameter
 names
In-Reply-To: <ea6868b2-ea0e-42ad-8351-c02553691b74@amd.com>
Message-ID: <a15de05b-131f-503b-b8b5-62c4c69b87a4@inria.fr>
References: <20240930112121.95324-1-Julia.Lawall@inria.fr>
 <20240930112121.95324-30-Julia.Lawall@inria.fr>
 <ea6868b2-ea0e-42ad-8351-c02553691b74@amd.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1881777891-1727696300=:3991"
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1881777891-1727696300=:3991
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT



On Mon, 30 Sep 2024, Christian König wrote:

> Am 30.09.24 um 13:21 schrieb Julia Lawall:
> > Reorganize kerneldoc parameter names to match the parameter
> > order in the function header.
>
> Please split that up by driver, apart from that looks good to me.

Thanks for the feedback.  I will wait a bit for any other feedback and the
resend.

julia

>
> Christian.
>
> >
> > Problems identified using Coccinelle.
> >
> > Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>
> >
> > ---
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c |    2 +-
> >   drivers/gpu/drm/radeon/radeon_ib.c     |    2 +-
> >   2 files changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> > b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> > index 6005280f5f38..ad4fdd4d4d82 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> > @@ -2773,11 +2773,11 @@ int amdgpu_vm_ioctl(struct drm_device *dev, void
> > *data, struct drm_file *filp)
> >    * amdgpu_vm_handle_fault - graceful handling of VM faults.
> >    * @adev: amdgpu device pointer
> >    * @pasid: PASID of the VM
> > - * @ts: Timestamp of the fault
> >    * @vmid: VMID, only used for GFX 9.4.3.
> >    * @node_id: Node_id received in IH cookie. Only applicable for
> >    *           GFX 9.4.3.
> >    * @addr: Address of the fault
> > + * @ts: Timestamp of the fault
> >    * @write_fault: true is write fault, false is read fault
> >    *
> >    * Try to gracefully handle a VM fault. Return true if the fault was
> > handled and
> > diff --git a/drivers/gpu/drm/radeon/radeon_ib.c
> > b/drivers/gpu/drm/radeon/radeon_ib.c
> > index 1aa41cc3f991..8611a27dfb3d 100644
> > --- a/drivers/gpu/drm/radeon/radeon_ib.c
> > +++ b/drivers/gpu/drm/radeon/radeon_ib.c
> > @@ -49,8 +49,8 @@ static void radeon_debugfs_sa_init(struct radeon_device
> > *rdev);
> >    *
> >    * @rdev: radeon_device pointer
> >    * @ring: ring index the IB is associated with
> > - * @vm: requested vm
> >    * @ib: IB object returned
> > + * @vm: requested vm
> >    * @size: requested IB size
> >    *
> >    * Request an IB (all asics).  IBs are allocated using the
> >
>
>
--8323329-1881777891-1727696300=:3991--
