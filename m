Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4BCeJWA+ommq1AQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 28 Feb 2026 02:01:20 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 096B51BF932
	for <lists+dri-devel@lfdr.de>; Sat, 28 Feb 2026 02:01:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAB5510E1D4;
	Sat, 28 Feb 2026 01:01:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b="gjDb4m9u";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 472F210E1D4
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Feb 2026 01:01:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1772240474; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=lfIKqghSlKRsr1v3j4O6YwUstab/7Yy3ro1FFjCtluHHRFBxw4CF0/7JREycbTP6mmbOu5Dg2csy0+uygnIWig9+agtPEWONxul0EOa1hirPIxgbJODm0XZE5/1pjC9cA7NihMoyIwIc92ie9Npnt92//WnpAuRmZ+W/vk67bM0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1772240474;
 h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=i5sxaA2PVY8xbh1tFOsrEa6kopnjclUJ02+xow5C6wI=; 
 b=mKhFerBv+U7SoPU9N6ju/EoDemLW5ATM9i18jD/8Fj9QTQaWVyafCj2l+TpiLMN5wtQUT0sndVWXhG11w5/lEUki5MSrk2MqszaCfSjktX5mjaRbmyJQKIQxoFYIJxXhAHsCWbnVwjTrshGJz876PN+t6B6qfGN5Wz7Z5GGpKWw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=deborah.brouwer@collabora.com;
 dmarc=pass header.from=<deborah.brouwer@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1772240473; 
 s=zohomail; d=collabora.com; i=deborah.brouwer@collabora.com; 
 h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
 bh=i5sxaA2PVY8xbh1tFOsrEa6kopnjclUJ02+xow5C6wI=;
 b=gjDb4m9uh9NzREgbjFyLYB6soyPnLxNhVUw7d/Ys6nZurMwpHg66Dp29n9E5VPO5
 R7jNNBAnHsmVwzCv67ZODqdPV1kDSyNxWo6BK65H+QCaGdq5NGpEKIl0hILRH4Dor8t
 ZM36dpWA+MOHQuSwZ6zzxCTdjLfcSl5Uh/TnI9vA=
Received: by mx.zohomail.com with SMTPS id 1772240471537395.6159296527935;
 Fri, 27 Feb 2026 17:01:11 -0800 (PST)
Date: Fri, 27 Feb 2026 17:01:11 -0800
From: Deborah Brouwer <deborah.brouwer@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 daniel.almeida@collabora.com, aliceryhl@google.com,
 beata.michalska@arm.com, lyude@redhat.com
Subject: Re: [PATCH 10/12] drm/tyr: add a kernel buffer object
Message-ID: <aaI-V6Ux_FYk6HZl@um790>
References: <20260212013713.304343-1-deborah.brouwer@collabora.com>
 <20260212013713.304343-11-deborah.brouwer@collabora.com>
 <20260212120043.36a560e9@fedora>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260212120043.36a560e9@fedora>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.81 / 15.00];
	ARC_ALLOW(-1.00)[zohomail.com:s=zohoarc:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:boris.brezillon@collabora.com,m:rust-for-linux@vger.kernel.org,m:daniel.almeida@collabora.com,m:aliceryhl@google.com,m:beata.michalska@arm.com,m:lyude@redhat.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[deborah.brouwer@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_COUNT_THREE(0.00)[3];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[deborah.brouwer@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 096B51BF932
X-Rspamd-Action: no action

On Thu, Feb 12, 2026 at 12:00:43PM +0100, Boris Brezillon wrote:
> On Wed, 11 Feb 2026 17:37:11 -0800
> Deborah Brouwer <deborah.brouwer@collabora.com> wrote:
> 
> > Introduce a buffer object type (KernelBo) for internal driver allocations
> > that are managed by the kernel rather than userspace.
> > 
> > KernelBo wraps a GEM shmem object and automatically handles GPU virtual
> > address space mapping during creation and unmapping on drop. This provides
> > a safe and convenient way for the driver to both allocate and clean up
> > internal buffers for kernel-managed resources.
> > 
> > Co-developed-by: Boris Brezillon <boris.brezillon@collabora.com>
> > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> > Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
> > ---
> >  drivers/gpu/drm/tyr/gem.rs | 74 +++++++++++++++++++++++++++++++++++---
> >  1 file changed, 70 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/tyr/gem.rs b/drivers/gpu/drm/tyr/gem.rs
> > index 111acf33993f..3807810be7ea 100644
> > --- a/drivers/gpu/drm/tyr/gem.rs
> > +++ b/drivers/gpu/drm/tyr/gem.rs
> > @@ -4,6 +4,8 @@
> >  //! This module provides buffer object (BO) management functionality using
> >  //! DRM's GEM subsystem with shmem backing.
> >  
> > +use core::ops::Range;
> > +
> >  use kernel::{
> >      drm::{
> >          gem,
> > @@ -11,12 +13,22 @@
> >          DeviceContext, //
> >      },
> >      prelude::*,
> > -    sync::aref::ARef, //
> > +    sync::{
> > +        aref::ARef,
> > +        Arc,
> > +        ArcBorrow, //
> > +    },
> >  };
> >  
> > -use crate::driver::{
> > -    TyrDrmDevice,
> > -    TyrDrmDriver, //
> > +use crate::{
> > +    driver::{
> > +        TyrDrmDevice,
> > +        TyrDrmDriver, //
> > +    },
> > +    vm::{
> > +        Vm,
> > +        VmMapFlags, //
> > +    },
> >  };
> >  
> >  /// Tyr's DriverObject type for GEM objects.
> > @@ -61,3 +73,57 @@ pub(crate) fn new_dummy_object<Ctx: DeviceContext>(ddev: &TyrDrmDevice<Ctx>) ->
> >  
> >      Ok(bo)
> >  }
> > +
> > +/// A buffer object that is owned and managed by Tyr rather than userspace.
> > +pub(crate) struct KernelBo {
> > +    #[expect(dead_code)]
> > +    pub(crate) bo: ARef<Bo>,
> > +    vm: Arc<Vm>,
> > +    va_range: Range<u64>,
> 
> Missing docs for all those fields.
Ack.
> 
> > +}
> > +
> > +impl KernelBo {
> > +    /// Creates a new kernel-owned buffer object and maps it into GPU VA space.
> > +    #[expect(dead_code)]
> > +    pub(crate) fn new<Ctx: DeviceContext>(
> > +        ddev: &TyrDrmDevice<Ctx>,
> > +        vm: ArcBorrow<'_, Vm>,
> > +        size: u64,
> > +        va: u64,
> 
> I'm already thinking about the next step (automatic VA-range
> allocation), and I'd be tempted to go directly for:
> 
> enum KernelBoVaAlloc {
> 	Explicit(u64),
> }
> 
> so we can easily extend it with
> 
> enum KernelBoVaAlloc {
> 	Auto,
> 	Explicit(u64),
> }
> 
> when we have to.
> 
Sure that is easily done.

> > +        flags: VmMapFlags,
> > +    ) -> Result<Self> {
> > +        let bo = gem::shmem::Object::<BoData>::new(
> > +            ddev,
> > +            size as usize,
> > +            shmem::ObjectConfig {
> > +                map_wc: true,
> > +                parent_resv_obj: None,
> > +            },
> > +            BoCreateArgs { flags: 0 },
> > +        )?;
> > +
> > +        vm.map_bo_range(&bo, 0, size, va, flags)?;
> > +
> > +        Ok(KernelBo {
> > +            bo,
> > +            vm: vm.into(),
> > +            va_range: va..(va + size),
> > +        })
> > +    }
> > +}
> > +
> > +impl Drop for KernelBo {
> > +    fn drop(&mut self) {
> > +        let va = self.va_range.start;
> > +        let size = self.va_range.end - self.va_range.start;
> > +
> > +        if let Err(e) = self.vm.unmap_range(va, size) {
> > +            pr_err!(
> > +                "Failed to unmap KernelBo range {:#x}..{:#x}: {:?}\n",
> > +                self.va_range.start,
> > +                self.va_range.end,
> > +                e
> > +            );
> > +        }
> > +    }
> > +}
> 
