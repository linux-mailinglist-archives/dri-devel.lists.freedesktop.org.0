Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YA7LB+2yjWll6AAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 12:01:01 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEFC312CC95
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 12:00:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB6D010E0FA;
	Thu, 12 Feb 2026 11:00:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="RPtd3jtp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D63C10E0FA
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Feb 2026 11:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1770894049;
 bh=0PbOUQa0WWBfipvr845H+TKj1+G5H/zYpDWnnPdpB88=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=RPtd3jtphp1DqPTRZ/Bfj35YdnxLdjFbtF1CM5AfzYGt8rjb0wrsLqkIArGCr4hYZ
 Tqwoyj5WWI9B3qW7M5IuGIaXKhfDnvTRx9rDEi1gOCqziqvBwNq7HYQVxo9nUpvW2K
 IqQR94CRVE6EZZvvUAf91zxofRpEXnOR8JjlEsiKefRI850CgD3Zvy5wWfy7IbEbk+
 TPVR1vR/hFY7h42NVVCGXC8/WxbuP8Kw56MDje3/7uy4KxzGDAnL5VQQaUaRpfHaC7
 ID0m7C6++0vMCo1aF1V0zmEjgQ08sWAgMGPeCYaNCLw7ox7qaYKPrXYKmDr+nK6yi6
 JXagNI11lHEDg==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 74BE417E1144;
 Thu, 12 Feb 2026 12:00:49 +0100 (CET)
Date: Thu, 12 Feb 2026 12:00:43 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Deborah Brouwer <deborah.brouwer@collabora.com>
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 daniel.almeida@collabora.com, aliceryhl@google.com,
 beata.michalska@arm.com, lyude@redhat.com
Subject: Re: [PATCH 10/12] drm/tyr: add a kernel buffer object
Message-ID: <20260212120043.36a560e9@fedora>
In-Reply-To: <20260212013713.304343-11-deborah.brouwer@collabora.com>
References: <20260212013713.304343-1-deborah.brouwer@collabora.com>
 <20260212013713.304343-11-deborah.brouwer@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	RSPAMD_URIBL_FAIL(0.00)[collabora.com:query timed out];
	FORGED_RECIPIENTS(0.00)[m:deborah.brouwer@collabora.com,m:rust-for-linux@vger.kernel.org,m:daniel.almeida@collabora.com,m:aliceryhl@google.com,m:beata.michalska@arm.com,m:lyude@redhat.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[boris.brezillon@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	HAS_ORG_HEADER(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[boris.brezillon@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RSPAMD_EMAILBL_FAIL(0.00)[boris.brezillon.collabora.com:query timed out];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:email,collabora.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: AEFC312CC95
X-Rspamd-Action: no action

On Wed, 11 Feb 2026 17:37:11 -0800
Deborah Brouwer <deborah.brouwer@collabora.com> wrote:

> Introduce a buffer object type (KernelBo) for internal driver allocations
> that are managed by the kernel rather than userspace.
> 
> KernelBo wraps a GEM shmem object and automatically handles GPU virtual
> address space mapping during creation and unmapping on drop. This provides
> a safe and convenient way for the driver to both allocate and clean up
> internal buffers for kernel-managed resources.
> 
> Co-developed-by: Boris Brezillon <boris.brezillon@collabora.com>
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
> ---
>  drivers/gpu/drm/tyr/gem.rs | 74 +++++++++++++++++++++++++++++++++++---
>  1 file changed, 70 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tyr/gem.rs b/drivers/gpu/drm/tyr/gem.rs
> index 111acf33993f..3807810be7ea 100644
> --- a/drivers/gpu/drm/tyr/gem.rs
> +++ b/drivers/gpu/drm/tyr/gem.rs
> @@ -4,6 +4,8 @@
>  //! This module provides buffer object (BO) management functionality using
>  //! DRM's GEM subsystem with shmem backing.
>  
> +use core::ops::Range;
> +
>  use kernel::{
>      drm::{
>          gem,
> @@ -11,12 +13,22 @@
>          DeviceContext, //
>      },
>      prelude::*,
> -    sync::aref::ARef, //
> +    sync::{
> +        aref::ARef,
> +        Arc,
> +        ArcBorrow, //
> +    },
>  };
>  
> -use crate::driver::{
> -    TyrDrmDevice,
> -    TyrDrmDriver, //
> +use crate::{
> +    driver::{
> +        TyrDrmDevice,
> +        TyrDrmDriver, //
> +    },
> +    vm::{
> +        Vm,
> +        VmMapFlags, //
> +    },
>  };
>  
>  /// Tyr's DriverObject type for GEM objects.
> @@ -61,3 +73,57 @@ pub(crate) fn new_dummy_object<Ctx: DeviceContext>(ddev: &TyrDrmDevice<Ctx>) ->
>  
>      Ok(bo)
>  }
> +
> +/// A buffer object that is owned and managed by Tyr rather than userspace.
> +pub(crate) struct KernelBo {
> +    #[expect(dead_code)]
> +    pub(crate) bo: ARef<Bo>,
> +    vm: Arc<Vm>,
> +    va_range: Range<u64>,

Missing docs for all those fields.

> +}
> +
> +impl KernelBo {
> +    /// Creates a new kernel-owned buffer object and maps it into GPU VA space.
> +    #[expect(dead_code)]
> +    pub(crate) fn new<Ctx: DeviceContext>(
> +        ddev: &TyrDrmDevice<Ctx>,
> +        vm: ArcBorrow<'_, Vm>,
> +        size: u64,
> +        va: u64,

I'm already thinking about the next step (automatic VA-range
allocation), and I'd be tempted to go directly for:

enum KernelBoVaAlloc {
	Explicit(u64),
}

so we can easily extend it with

enum KernelBoVaAlloc {
	Auto,
	Explicit(u64),
}

when we have to.

> +        flags: VmMapFlags,
> +    ) -> Result<Self> {
> +        let bo = gem::shmem::Object::<BoData>::new(
> +            ddev,
> +            size as usize,
> +            shmem::ObjectConfig {
> +                map_wc: true,
> +                parent_resv_obj: None,
> +            },
> +            BoCreateArgs { flags: 0 },
> +        )?;
> +
> +        vm.map_bo_range(&bo, 0, size, va, flags)?;
> +
> +        Ok(KernelBo {
> +            bo,
> +            vm: vm.into(),
> +            va_range: va..(va + size),
> +        })
> +    }
> +}
> +
> +impl Drop for KernelBo {
> +    fn drop(&mut self) {
> +        let va = self.va_range.start;
> +        let size = self.va_range.end - self.va_range.start;
> +
> +        if let Err(e) = self.vm.unmap_range(va, size) {
> +            pr_err!(
> +                "Failed to unmap KernelBo range {:#x}..{:#x}: {:?}\n",
> +                self.va_range.start,
> +                self.va_range.end,
> +                e
> +            );
> +        }
> +    }
> +}

