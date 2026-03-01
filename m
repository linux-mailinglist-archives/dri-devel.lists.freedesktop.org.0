Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IIL7L9krpGnZZgUAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 01 Mar 2026 13:06:49 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 272DC1CF832
	for <lists+dri-devel@lfdr.de>; Sun, 01 Mar 2026 13:06:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D75B110E134;
	Sun,  1 Mar 2026 12:06:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="NqklyLxB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com
 [209.85.128.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F322010E134
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Mar 2026 12:06:44 +0000 (UTC)
Received: by mail-wm1-f74.google.com with SMTP id
 5b1f17b1804b1-4837b7903f3so45612205e9.2
 for <dri-devel@lists.freedesktop.org>; Sun, 01 Mar 2026 04:06:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1772366803; x=1772971603;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=+NLDKguPnGJnQnFRD4unNG+va9+3jiMJbYExTIJsz8s=;
 b=NqklyLxB7xivXM3TrTIniF0T0d5UwgXfXJRak0YNkXrOmDQ9V7j4myt7dLdqPJO5IS
 8g42eutunLafu4O81vpvlpr5ZmdWvMdHopo3NSCzOYE8OCk3ROQQ4+RAmZhsnME9SBq6
 qYfTWh1XbePEhyp9jy50WbSfyOmmE+l55UDx9k570JUPyK9e7UK4Rebzu4fo/Xxe7rOU
 JVcJ5aqEeoKDhMGIw3Fq7EPzmDmt8wZesRfHC52Mv4EEM5EbK5a7c3skxgT5OdkpKh+6
 7qJSR94QxfxuQRTSohrQB+DfPZ95N8TnaGxrJEGmQS+bZlovQ9W6IxhGnh1RGrhTL3Qy
 Tu7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772366803; x=1772971603;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+NLDKguPnGJnQnFRD4unNG+va9+3jiMJbYExTIJsz8s=;
 b=iR1kByYefD7mpieE418nCzMjw9a6xff3zlzHpaM0TazHoW0ZKtFgdaBZocLMmkCinF
 YtB0jqSLTqzeAgQ6l7YAKb/delNArO1Y758xyUJqq673217nAXSRVzjgzgLZcliOXVbx
 BexoTcuclNJpjZXfN9w6m6k359zMHxHGkMD3Mc7XUCxQrAKr0YX6lthtRFc2RL7hhMCe
 d3bHbwveTRZqgZ2bi2Tq6ninWMTS9oMyN++bzYGXzlI4XHvDfaoANjjuoTMO6A8uKxS2
 WY3ITARMabhxmr5S8BxfnE69Ahjla51x1SrpIme2bvQgserb05mdnP0bhPqaXwQud9oY
 bFaA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWQ6eoCm5ct1Sdbx1eGoL5QlBHHwRYrOc+xLqJxLIvZpBOPVoK+hw2RykLqUrWqcT5p58HeupHi7Xg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxT1c7lxoF61nGjwI4vxbbtGAmAROnYVpCD3DAX0QSE+1Uc6tTh
 eL9q6PTfSB5cmtH+TY3QU0o1pT7apsNmCAqonXhh9xjOVdiW0LrC0FIFzRUkRYvMq5oSTCkMfZX
 PpGjY/c9XVB6q0XLLAw==
X-Received: from wmby4.prod.google.com ([2002:a05:600c:c044:b0:482:dff5:2424])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:348a:b0:483:c12b:fe4b with SMTP id
 5b1f17b1804b1-483c9bc19e9mr146027225e9.9.1772366803234; 
 Sun, 01 Mar 2026 04:06:43 -0800 (PST)
Date: Sun, 1 Mar 2026 12:06:42 +0000
In-Reply-To: <DGQTCDOIVTHW.3OGUVXRS496FP@kernel.org>
Mime-Version: 1.0
References: <20260204-aref-workitem-v2-0-bec25b012d2a@collabora.com>
 <20260204-aref-workitem-v2-2-bec25b012d2a@collabora.com>
 <DGQTCDOIVTHW.3OGUVXRS496FP@kernel.org>
Message-ID: <aaQr0ntSw9Q5Qzws@google.com>
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
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dakr@kernel.org,m:daniel.almeida@collabora.com,m:ojeda@kernel.org,m:boqun.feng@gmail.com,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:tmgross@umich.edu,m:airlied@gmail.com,m:simona@ffwll.ch,m:tj@kernel.org,m:jiangshanlai@gmail.com,m:rust-for-linux@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:boqunfeng@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[aliceryhl@google.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_CC(0.00)[collabora.com,kernel.org,gmail.com,garyguo.net,protonmail.com,umich.edu,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[aliceryhl@google.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[google.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[workqueue.rs:url]
X-Rspamd-Queue-Id: 272DC1CF832
X-Rspamd-Action: no action

On Sat, Feb 28, 2026 at 07:40:26PM +0100, Danilo Krummrich wrote:
> On Wed Feb 4, 2026 at 9:40 PM CET, Daniel Almeida wrote:
> > This implementation dispatches any work enqueued on ARef<drm::Device<T>> to
> > its driver-provided handler. It does so by building upon the newly-added
> > ARef<T> support in workqueue.rs in order to call into the driver
> > implementations for work_container_of and raw_get_work.
> >
> > This is notably important for work items that need access to the drm
> > device, as it was not possible to enqueue work on a ARef<drm::Device<T>>
> > previously without failing the orphan rule.
> >
> > The current implementation needs T::Data to live inline with drm::Device in
> > order for work_container_of to function. This restriction is already
> > captured by the trait bounds. Drivers that need to share their ownership of
> > T::Data may trivially get around this:
> >
> > // Lives inline in drm::Device
> > struct DataWrapper {
> >   work: ...,
> >   // Heap-allocated, shared ownership.
> >   data: Arc<DriverData>,
> > }
> 
> IIUC, this is how it's supposed to be used:
> 
> 	#[pin_data]
> 	struct MyData {
> 	    #[pin]
> 	    work: Work<drm::Device<MyDriver>>,
> 	    value: u32,
> 	}
> 	
> 	impl_has_work! {
> 	    impl HasWork<drm::Device<MyDriver>> for MyData { self.work }
> 	}
> 	
> 	impl WorkItem for MyData {
> 	    type Pointer = ARef<drm::Device<MyDriver>>;
> 	
> 	    fn run(dev: ARef<drm::Device<MyDriver>>) {
> 	        dev_info!(dev, "value = {}\n", dev.value);
> 	    }
> 	}
> 
> The reason the WorkItem is implemented for MyData, rather than
> drm::Device<MyDriver> (which would be a bit more straight forward) is the orphan
> rule, I assume.

This characterizes it as a workaround for the orphan rule. I don't think
that's fair. Implementing WorkItem for MyDriver directly is the
idiomatic way to do it, in my opinion.

> Now, the whole purpose of this is that a driver can implement WorkItem for
> MyData without needing an additional struct (and allocation), such as:
> 
> 	#[pin_data]
> 	struct MyWork {
> 	    #[pin]
> 	    work: Work<Self>,
> 	    dev: drm::Device<MyDriver>,
> 	}
> 
> How is this supposed to be done when you want multiple different implementations
> of WorkItem that have a drm::Device<MyDriver> as payload?
> 
> Fall back to various struct MyWork? Add in an "artificial" type state for MyData
> with some phantom data, so you can implement HasWork for MyData<Work0>,
> MyData<Work1>, etc.?

You cannot configure the code that is executed on a per-call basis
because the code called by a work item is a function pointer stored
inside the `struct work_struct`. And it can't be changed after
initialization of the field.

So either you must store that info in a separate field. This is what
Binder does, see drivers/android/binder/process.rs for an example.

    impl workqueue::WorkItem for Process {
        type Pointer = Arc<Process>;
    
        fn run(me: Arc<Self>) {
            let defer;
            {
                let mut inner = me.inner.lock();
                defer = inner.defer_work;
                inner.defer_work = 0;
            }
    
            if defer & PROC_DEFER_FLUSH != 0 {
                me.deferred_flush();
            }
            if defer & PROC_DEFER_RELEASE != 0 {
                me.deferred_release();
            }
        }
    }

Or you must have multiple different fields of type Work, each with a
different function pointer stored inside it.

Note that this is a general workqueue API thing. It's not specific to
ARef<_> or drm::Device<_> based work items, but applies to all users of
the workqueue API.

Alice
