Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id r8RrIg5vpGl1gwUAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 01 Mar 2026 17:53:34 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B213C1D0BCB
	for <lists+dri-devel@lfdr.de>; Sun, 01 Mar 2026 17:53:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A99E910E3DB;
	Sun,  1 Mar 2026 16:53:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="TH2xx9x2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com
 [209.85.221.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8617410E3DB
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Mar 2026 16:53:29 +0000 (UTC)
Received: by mail-wr1-f73.google.com with SMTP id
 ffacd0b85a97d-439b50320a0so283722f8f.1
 for <dri-devel@lists.freedesktop.org>; Sun, 01 Mar 2026 08:53:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1772384008; x=1772988808;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=PfdUfCNI/OQhhLtw/VeFZbribXWs9YmY3yISi0+RLUA=;
 b=TH2xx9x2r0cr9qoEhWQULjqQ48ykqAke4gxxdKkE+E2dRJsR+Y8mh+Q/uIDUO6WoEy
 Kyw+QcVGgIhozZTgPmMJoWanHy9rUEw/Rxcw8/ucvm6JoJVSN9lQTr6o5CCS8hWMo0hA
 0l+iySlU+RwiLfdNgHCpxzSWrsqceD4EQ7QfNOlJqVv1MdaYhMTVjixuKBjh06/MS0aA
 tebl5wTLGgRUQA+UrVUcSAoz9MitSyZFdK7evXqWo1BVqgWQnCVEug1rRMTOtgqko9xG
 XMALNv/iOR4kuuG+epF1ouK5z4fvyso1BL3Y/m5P9jhfddFlmNN7Uvh2hzJIiKtF8rEa
 5r8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772384008; x=1772988808;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PfdUfCNI/OQhhLtw/VeFZbribXWs9YmY3yISi0+RLUA=;
 b=HoiC8TjyBsE/FAn1LSnbhzH6CitKs55rx+2gvZ34HE8ycsWLvtEsLUkqoqJhRDgCkz
 zKXX+2fI3+f69FrY18IWnrFQOVfNsVJaanVTE3bdrT5fTj+h6UjWGdO7JQyIvsOKY0zt
 I50FjKMaTNZLvx1PP3Sn4aMVbDEdSEaJbudFGBeMRRj5zIXksuNmd8um/zWj16aL+l3s
 thGWJXcil9+WAJ1wTr+jV4BGd5+V7ldJZyybh5PhV8XU1JrpmoH8bKq885qI1tZe1y8p
 iGoEBQpJDaXoKqB+u80fzAuGvxiw3Lh4PIt2TlEV1ubpEnFiYZ+XC/u2nenOfsmTfE3s
 W5+w==
X-Forwarded-Encrypted: i=1;
 AJvYcCU+JdgCYO7mW7ULddrgMa96p+jaUQSWCzA8gxv17mXW9vFydvHV+Fwr1iAGZBdMBMmLPwW9xapIktQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw6a0/QASWU6Qye4gnHlOybEsR2IyWLiUsyu4eOhdPLYcKCD7CF
 S+Paf+/CfsNWqSJhfs+8HxG85IzigxZJ9vLgYLQo1f68GFdO452gjFNZkw/7eR13XthVkna+isS
 W2twOYXhZD0qp082GHA==
X-Received: from wrbbs10.prod.google.com ([2002:a05:6000:70a:b0:439:901b:97cb])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:2013:b0:439:afe3:6185 with SMTP id
 ffacd0b85a97d-439afe364e1mr6850853f8f.15.1772384007596; 
 Sun, 01 Mar 2026 08:53:27 -0800 (PST)
Date: Sun, 1 Mar 2026 16:53:26 +0000
In-Reply-To: <DGRJO4NKZ4R5.2BZ2D9BSPXDMT@kernel.org>
Mime-Version: 1.0
References: <20260204-aref-workitem-v2-0-bec25b012d2a@collabora.com>
 <20260204-aref-workitem-v2-2-bec25b012d2a@collabora.com>
 <DGQTCDOIVTHW.3OGUVXRS496FP@kernel.org>
 <aaQr0ntSw9Q5Qzws@google.com> <DGRJO4NKZ4R5.2BZ2D9BSPXDMT@kernel.org>
Message-ID: <aaRvBmfx-YTp5zEa@google.com>
Subject: Re: [PATCH v2 2/4] rust: drm: dispatch work items to the private data
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Daniel Almeida <daniel.almeida@collabora.com>,
 Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 "=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Tejun Heo <tj@kernel.org>, 
 Lai Jiangshan <jiangshanlai@gmail.com>, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
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
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dakr@kernel.org,m:daniel.almeida@collabora.com,m:ojeda@kernel.org,m:boqun.feng@gmail.com,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:tmgross@umich.edu,m:airlied@gmail.com,m:simona@ffwll.ch,m:tj@kernel.org,m:jiangshanlai@gmail.com,m:rust-for-linux@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:boqunfeng@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[aliceryhl@google.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[collabora.com,kernel.org,gmail.com,garyguo.net,protonmail.com,umich.edu,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[aliceryhl@google.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[google.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: B213C1D0BCB
X-Rspamd-Action: no action

On Sun, Mar 01, 2026 at 04:18:15PM +0100, Danilo Krummrich wrote:
> On Sun Mar 1, 2026 at 1:06 PM CET, Alice Ryhl wrote:
> > On Sat, Feb 28, 2026 at 07:40:26PM +0100, Danilo Krummrich wrote:
> >> On Wed Feb 4, 2026 at 9:40 PM CET, Daniel Almeida wrote:
> >> > This implementation dispatches any work enqueued on ARef<drm::Device<T>> to
> >> > its driver-provided handler. It does so by building upon the newly-added
> >> > ARef<T> support in workqueue.rs in order to call into the driver
> >> > implementations for work_container_of and raw_get_work.
> >> >
> >> > This is notably important for work items that need access to the drm
> >> > device, as it was not possible to enqueue work on a ARef<drm::Device<T>>
> >> > previously without failing the orphan rule.
> >> >
> >> > The current implementation needs T::Data to live inline with drm::Device in
> >> > order for work_container_of to function. This restriction is already
> >> > captured by the trait bounds. Drivers that need to share their ownership of
> >> > T::Data may trivially get around this:
> >> >
> >> > // Lives inline in drm::Device
> >> > struct DataWrapper {
> >> >   work: ...,
> >> >   // Heap-allocated, shared ownership.
> >> >   data: Arc<DriverData>,
> >> > }
> >> 
> >> IIUC, this is how it's supposed to be used:
> >> 
> >> 	#[pin_data]
> >> 	struct MyData {
> >> 	    #[pin]
> >> 	    work: Work<drm::Device<MyDriver>>,
> >> 	    value: u32,
> >> 	}
> >> 	
> >> 	impl_has_work! {
> >> 	    impl HasWork<drm::Device<MyDriver>> for MyData { self.work }
> >> 	}
> >> 	
> >> 	impl WorkItem for MyData {
> >> 	    type Pointer = ARef<drm::Device<MyDriver>>;
> >> 	
> >> 	    fn run(dev: ARef<drm::Device<MyDriver>>) {
> >> 	        dev_info!(dev, "value = {}\n", dev.value);
> >> 	    }
> >> 	}
> >> 
> >> The reason the WorkItem is implemented for MyData, rather than
> >> drm::Device<MyDriver> (which would be a bit more straight forward) is the orphan
> >> rule, I assume.
> >
> > This characterizes it as a workaround for the orphan rule. I don't think
> > that's fair. Implementing WorkItem for MyDriver directly is the
> > idiomatic way to do it, in my opinion.
> 
> The trait bound is T::Data: WorkItem, not T: drm::Driver + WorkItem.
> Implementing WorkItem for MyDriver seems more straight forward to me.

I missed the part about `for MyData` vs `for MyDriver`. Since you
talked about the orphan rule I assumed you wanted the driver to
implement it for `drm::Device<MyDriver>` directly, which is what the
orphan rule would prohibit, rather than for `MyDriver`.

In any case, I do think it makes sense that you would implement it on
the struct that actually contains the `struct work_struct`.

> >> Now, the whole purpose of this is that a driver can implement WorkItem for
> >> MyData without needing an additional struct (and allocation), such as:
> >> 
> >> 	#[pin_data]
> >> 	struct MyWork {
> >> 	    #[pin]
> >> 	    work: Work<Self>,
> >> 	    dev: drm::Device<MyDriver>,
> >> 	}
> >> 
> >> How is this supposed to be done when you want multiple different implementations
> >> of WorkItem that have a drm::Device<MyDriver> as payload?
> >> 
> >> Fall back to various struct MyWork? Add in an "artificial" type state for MyData
> >> with some phantom data, so you can implement HasWork for MyData<Work0>,
> >> MyData<Work1>, etc.?
> >
> > You cannot configure the code that is executed on a per-call basis
> > because the code called by a work item is a function pointer stored
> > inside the `struct work_struct`. And it can't be changed after
> > initialization of the field.
> >
> > So either you must store that info in a separate field. This is what
> > Binder does, see drivers/android/binder/process.rs for an example.
> >
> >     impl workqueue::WorkItem for Process {
> >         type Pointer = Arc<Process>;
> >     
> >         fn run(me: Arc<Self>) {
> >             let defer;
> >             {
> >                 let mut inner = me.inner.lock();
> >                 defer = inner.defer_work;
> >                 inner.defer_work = 0;
> >             }
> >     
> >             if defer & PROC_DEFER_FLUSH != 0 {
> >                 me.deferred_flush();
> >             }
> >             if defer & PROC_DEFER_RELEASE != 0 {
> >                 me.deferred_release();
> >             }
> >         }
> >     }
> 
> Ok, so this would be a switch to decide what to do when a single work is run,
> i.e. it is not for running multiple work.

Yeah.

But in any case, a single `struct work_struct` can't be used to schedule
multiple work items. It only has one prev/next pointer pair.

> > Or you must have multiple different fields of type Work, each with a
> > different function pointer stored inside it.
> 
> This sounds it works for running multiple work, but I wonder how enqueue() knows
> which work should be run in this case? I.e. what do we do with:
> 
> 	impl_has_work! {
> 	    impl HasWork<drm::Device<MyDriver>> for MyData { self.work }
> 	}

Both WorkItem and HasWork are generic over an ID integer. You can
specify it to disambiguiate.

Alice
