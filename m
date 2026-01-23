Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0O1oCxo+c2kztgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 10:23:38 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B81473388
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 10:23:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0506E10EA7F;
	Fri, 23 Jan 2026 09:23:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="Qzn3LkIX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f73.google.com (mail-ed1-f73.google.com
 [209.85.208.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A02BC10EA7F
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jan 2026 09:23:35 +0000 (UTC)
Received: by mail-ed1-f73.google.com with SMTP id
 4fb4d7f45d1cf-64d01707c32so17672a12.1
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jan 2026 01:23:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1769160214; x=1769765014;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:from:subject:message-id:references
 :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
 :reply-to; bh=C+T0dti8ZBhNnJy4fxtj+vryGifAMmqjwXPe5o6PeaE=;
 b=Qzn3LkIXjIwkkTp4Igu5Xmd1CHTUQDGm7UKvLj30zS3eb1YwcW1UgoL2eApGaaxaSk
 blEh6xSfcd4wo/StEEtDgbh3sG05GHFIUtN+cnKkrq6Vchvnsx/rwPi83VjXHWOH2mAg
 hhtg9q82GaKDE8ok8usH9jexGuAMLtI3ESRIISgdCQ1hU2EF4OqkS7iDCmOaZnZhw7s7
 /ba7lu4t6dYziLqd1iFmIoSJH5AL7OFQ2RAFDOLD8qDFrI4o1pIM3cwpGAXa3IYiDihH
 SNq7EOyVzyadMJha0g7piV+2q8Hp4cm825+qG6SUSLt5blWy1UbiElk15hdMrX9thSZG
 RcTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769160214; x=1769765014;
 h=content-transfer-encoding:cc:to:from:subject:message-id:references
 :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=C+T0dti8ZBhNnJy4fxtj+vryGifAMmqjwXPe5o6PeaE=;
 b=eqn5MoAyK5dcxORoClLgFzEXWoCCTB37HJYAsZQ1vCt77ctLek0MaI/SuXH/UQhtpO
 f+BbUO1k1HM5ZDvOuZxwOPt2asFUv4uhtsaF9Qt3vbbFgihAPUBQw/o/Th5LqcesSyen
 Tseb21G5YLBztZJcqjiAB22v8i0oGWw4Sio4BwpkqMTmPiCec1Hx0B+TWPySQNiWMcFQ
 yxmHJmwFP5B5aDPLWtGgeyFcZcxhtgadkrB6v2iRwjADhzBRiVY6t4zuqO1kXFGw95VZ
 XGKe49M+2VU4wlP+2/qQsXziQ+yoJ7IX6agoPRbuXFAoiMhvQQxXy77q0TAx3pdh8zkO
 9/dQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUMvF3Aon4FA86Z/9PB78uDfnundySAnLhJyUL2tgw4A9G+wYyUAnE/vxmLzuQJ7DcUR4JPYanJHYs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzugNjUtVyHfxR/uGF4dz2BA1RfUPzzX+mcOVvTL3cGkv6qV2Mc
 rME04iqjE7tq5YWPMgAPCJijfgUGOJPd5Oo5012m/YJNmfjoEY6brnYcHXZYufT/EDapT9CUYXD
 DuPu98Pul7mKRGs+oWA==
X-Received: from edqv18.prod.google.com ([2002:aa7:d812:0:b0:64b:9dfc:134d])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:524a:b0:658:eca:df89 with SMTP id
 4fb4d7f45d1cf-6584876375cmr1714402a12.13.1769160214158; 
 Fri, 23 Jan 2026 01:23:34 -0800 (PST)
Date: Fri, 23 Jan 2026 09:23:33 +0000
In-Reply-To: <9C5177DB-CEBA-4DD5-8E93-DB39CB1F2079@collabora.com>
Mime-Version: 1.0
References: <20260121-gpuvm-rust-v3-0-dd95c04aec35@google.com>
 <20260121-gpuvm-rust-v3-6-dd95c04aec35@google.com>
 <9C5177DB-CEBA-4DD5-8E93-DB39CB1F2079@collabora.com>
Message-ID: <aXM-Fc0NeY6Acdqz@google.com>
Subject: Re: [PATCH v3 6/6] rust: gpuvm: add GpuVmCore::sm_map()
From: Alice Ryhl <aliceryhl@google.com>
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Danilo Krummrich <dakr@kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Janne Grunau <j@jannau.net>, Matthew Brost <matthew.brost@intel.com>, 
 "Thomas =?utf-8?Q?Hellstr=C3=B6m?=" <thomas.hellstrom@linux.intel.com>,
 Lyude Paul <lyude@redhat.com>, 
 Asahi Lina <lina+kernel@asahilina.net>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
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
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:daniel.almeida@collabora.com,m:dakr@kernel.org,m:boris.brezillon@collabora.com,m:j@jannau.net,m:matthew.brost@intel.com,m:thomas.hellstrom@linux.intel.com,m:lyude@redhat.com,m:lina+kernel@asahilina.net,m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:lina@asahilina.net,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[aliceryhl@google.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aliceryhl@google.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[google.com:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[dri-devel,kernel];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 9B81473388
X-Rspamd-Action: no action

On Thu, Jan 22, 2026 at 07:58:34PM -0300, Daniel Almeida wrote:
> Hi Alice,
>=20
> > On 21 Jan 2026, at 08:31, Alice Ryhl <aliceryhl@google.com> wrote:
> >=20
> > Finally also add the operation for creating new mappings. Mapping
> > operations need extra data in the context since they involve a vm_bo
> > coming from the outside.
> >=20
> > Co-developed-by: Asahi Lina <lina+kernel@asahilina.net>
> > Signed-off-by: Asahi Lina <lina+kernel@asahilina.net>
> > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> > ---
> > rust/kernel/drm/gpuvm/mod.rs    |   9 ++-
> > rust/kernel/drm/gpuvm/sm_ops.rs | 154 +++++++++++++++++++++++++++++++++=
+++++--
> > 2 files changed, 157 insertions(+), 6 deletions(-)
> >=20
> > diff --git a/rust/kernel/drm/gpuvm/mod.rs b/rust/kernel/drm/gpuvm/mod.r=
s
> > index 165a25666ccc3d62e59b73483d4eedff044423e9..557c0d629eec912a97fc4ef=
18495d5bf0807db0a 100644
> > --- a/rust/kernel/drm/gpuvm/mod.rs
> > +++ b/rust/kernel/drm/gpuvm/mod.rs
> > @@ -93,7 +93,7 @@ const fn vtable() -> &'static bindings::drm_gpuvm_ops=
 {
> >             vm_bo_alloc: GpuVmBo::<T>::ALLOC_FN,
> >             vm_bo_free: GpuVmBo::<T>::FREE_FN,
> >             vm_bo_validate: None,
> > -            sm_step_map: None,
> > +            sm_step_map: Some(Self::sm_step_map),
> >             sm_step_unmap: Some(Self::sm_step_unmap),
> >             sm_step_remap: Some(Self::sm_step_remap),
> >         }
> > @@ -248,6 +248,13 @@ pub trait DriverGpuVm: Sized {
> >     /// The private data passed to callbacks.
> >     type SmContext<'ctx>;
> >=20
> > +    /// Indicates that a new mapping should be created.
> > +    fn sm_step_map<'op, 'ctx>(
> > +        &mut self,
> > +        op: OpMap<'op, Self>,
> > +        context: &mut Self::SmContext<'ctx>,
> > +    ) -> Result<OpMapped<'op, Self>, Error>;
> > +
> >     /// Indicates that an existing mapping should be removed.
> >     fn sm_step_unmap<'op, 'ctx>(
> >         &mut self,
> > diff --git a/rust/kernel/drm/gpuvm/sm_ops.rs b/rust/kernel/drm/gpuvm/sm=
_ops.rs
> > index 3c29d10d63f0b0a1976c714a86d486948ba81a15..5f3c5d3918147a6962e5658=
443c343835baa10b8 100644
> > --- a/rust/kernel/drm/gpuvm/sm_ops.rs
> > +++ b/rust/kernel/drm/gpuvm/sm_ops.rs
> > @@ -8,6 +8,100 @@ struct SmData<'a, 'ctx, T: DriverGpuVm> {
> >     user_context: &'a mut T::SmContext<'ctx>,
> > }
> >=20
> > +#[repr(C)]
> > +struct SmMapData<'a, 'ctx, T: DriverGpuVm> {
> > +    sm_data: SmData<'a, 'ctx, T>,
> > +    vm_bo: GpuVmBoResident<T>,
> > +}
> > +
> > +/// The argument for [`GpuVmCore::sm_map`].
> > +pub struct OpMapRequest<'a, 'ctx, T: DriverGpuVm> {
> > +    /// Address in GPU virtual address space.
> > +    pub addr: u64,
> > +    /// Length of mapping to create.
> > +    pub range: u64,
> > +    /// Offset in GEM object.
> > +    pub offset: u64,
>=20
> I=E2=80=99d rename this gem_offset. A bit vague/confusing otherwise.

Sure. I'll rename.

Alice
