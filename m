Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2GM4JxYhl2kJvAIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 15:41:26 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B0E415FACB
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 15:41:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6833310E6ED;
	Thu, 19 Feb 2026 14:41:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="4i801VLj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com
 [209.85.128.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3230910E6ED
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Feb 2026 14:41:23 +0000 (UTC)
Received: by mail-wm1-f74.google.com with SMTP id
 5b1f17b1804b1-482d8e6e13aso6831815e9.3
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Feb 2026 06:41:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1771512082; x=1772116882;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=TGMsbouB+cZggAg/zANDRLfVVNeSj2+9Ku1uvYNuqOw=;
 b=4i801VLjjgPfJ2FoJWpM9EjaPrhYTBO1z6aA5CE1TI0gHK7xjBixiqYRE3LIoV8Ujh
 EVjySY6ZNbAywDDuK/HRHyJhEhMJUlDBrTOLVWHB4++rBO0kINqKfxIUUSpc3uhZ+dt9
 5hJKK6xUGGjCwlBDC+9FL+Z000zp6Fxsxvgw2UuHaGSQ7vgvnOE2lADlrR+x7yWlITwb
 Ugx837O0BBO/H/ZkFn/Dhi5p72rB+Fb7JzBT4qhVQc6LtohlKoEUh3KVbqUak+jR7XOv
 x1aDdwzf8WPF4zTST1k58RNsJIZDzJBSE2SgD9Ripc+Gcdl69PNAINeM2VKpVPmlfOhK
 4oug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771512082; x=1772116882;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TGMsbouB+cZggAg/zANDRLfVVNeSj2+9Ku1uvYNuqOw=;
 b=wWh+0sAGizf2CSFz28KUn+5CxM+dTBoeB6NB1Nc4ZbSy/h6wSnnzcUXHCLoKOJzdGI
 KLeV3lsoJW8SlQfQJW5Rhrun8kjwEiewBm1kcayLwGIDT+Pn6a931dmnIERC6Nz9jOF+
 wbSxZjUld1pk/VXslh66QwzF+nH8uyILudtSHuLAi+/Vv1dzu8DEdqgrXVKqYF89vgVI
 WaDVfKKxw/sDvycRfNMM67q1tvvOGfOCgSsU3chthKhSGCw9RyRQOZW1E6oMIXfD8/OC
 ckYg1h10oiaRQbt/AgdziCHkdfUgiYOHjNpnRBjB3CxPtOhTPpLPKmdRXijmnljNDvDG
 MWAg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXUT+PpnH1qBHVYT3M6YEWlE5hX3ZuY+2T2WjH4DS2SCo1JeqcIcRny9EiTvZWcVpuoe+mbf+stHkw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YypsO9DCJeEM4Hl5QWAHQZd7OmPKZCSX/ulpzXeumfkz0daNR2o
 MI5cRQDa0vEoO0wT5LjgXOE9l6n/WemobW1P0y9PijBuui50otJZpQmKZJOtMcnC9Sy+c4nqlef
 +gAHQou0iWn9ppI//+A==
X-Received: from wmpj41.prod.google.com ([2002:a05:600c:48a9:b0:477:a678:a39a])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:c174:b0:477:73e9:dbe7 with SMTP id
 5b1f17b1804b1-4839e66f689mr56234015e9.35.1771512081534; 
 Thu, 19 Feb 2026 06:41:21 -0800 (PST)
Date: Thu, 19 Feb 2026 14:41:20 +0000
In-Reply-To: <DGJ0IL3LLZRW.3JC9RY1GDIJA6@kernel.org>
Mime-Version: 1.0
References: <20260130-gpuvm-rust-v4-0-8364d104ff40@google.com>
 <20260130-gpuvm-rust-v4-1-8364d104ff40@google.com>
 <DGJ0IL3LLZRW.3JC9RY1GDIJA6@kernel.org>
Message-ID: <aZchECrW8mPbZMq8@google.com>
Subject: Re: [PATCH v4 1/6] rust: drm: add base GPUVM immediate mode
 abstraction
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Daniel Almeida <daniel.almeida@collabora.com>, 
 Boris Brezillon <boris.brezillon@collabora.com>, Janne Grunau <j@jannau.net>, 
 Matthew Brost <matthew.brost@intel.com>, 
 "Thomas =?utf-8?Q?Hellstr=C3=B6m?=" <thomas.hellstrom@linux.intel.com>,
 Lyude Paul <lyude@redhat.com>, 
 Asahi Lina <lina+kernel@asahilina.net>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
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
	FORGED_RECIPIENTS(0.00)[m:dakr@kernel.org,m:daniel.almeida@collabora.com,m:boris.brezillon@collabora.com,m:j@jannau.net,m:matthew.brost@intel.com,m:thomas.hellstrom@linux.intel.com,m:lyude@redhat.com,m:lina+kernel@asahilina.net,m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:lina@asahilina.net,s:lists@lfdr.de];
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
X-Rspamd-Queue-Id: 1B0E415FACB
X-Rspamd-Action: no action

On Thu, Feb 19, 2026 at 03:36:20PM +0100, Danilo Krummrich wrote:
> On Fri Jan 30, 2026 at 3:24 PM CET, Alice Ryhl wrote:
> > +/// A DRM GPU VA manager.
> > +///
> > +/// This object is refcounted, but the "core" is only accessible using a special unique handle. The
> > +/// core consists of the `core` field and the GPUVM's interval tree.
> 
> I think this is still a bit confusing, I think we should just rename GpuVmCore
> to UniqueGpuVm and rewrite this to something like:
> 
> "The driver specific data of of `GpuVm` is only accessible through a
> [`UniqueGpuVm`], which guarantees exclusive access."

But it's not really the same as e.g. UniqueArc<_>, which implies that
there are no normal Arc<_>s whatsoever. This one is just a special ref,
but there may also be normal refs at the same time.

> > +    pub unsafe fn from_raw<'a>(ptr: *mut bindings::drm_gpuvm) -> &'a Self {
> > +        // SAFETY: Caller passes a pointer to the `drm_gpuvm` in a `GpuVm<T>`. Caller ensures the
> > +        // pointer is valid for 'a.
> > +        unsafe { &*kernel::container_of!(Opaque::cast_from(ptr), Self, vm) }
> 
> I'd pull the Opaque::cast_from() call out of the unsafe block.

I think that's a bit verbose, and all existing uses do it inside the
`container_of!`.

> > +/// The manager for a GPUVM.
> 
> This description seems a bit odd. In the end, the trait makes GPUVM aware of
> other driver specific types. So, maybe a better name would be
> gpuvm::DriverAttributes, gpuvm::DriverTypes, gpuvm::DriverInfo or just
> gpuvm::Driver. My favorite is gpuvm::DriverInfo.
> 
> We should also change the doc-comment accordingly. Maybe somthing like: "This
> trait make the [`GpuVm`] aware of the other driver specific DRM types."

I mean, it doesn't just do that. The type implementing this is the type
stored in the `core` field, so you really do get more than just some
type relationships from it.

Alice

> > +pub trait DriverGpuVm: Sized {
> > +    /// Parent `Driver` for this object.
> > +    type Driver: drm::Driver<Object = Self::Object>;
> > +
> > +    /// The kind of GEM object stored in this GPUVM.
> > +    type Object: IntoGEMObject;
> > +}
