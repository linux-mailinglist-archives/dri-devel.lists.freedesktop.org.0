Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cOavJi8Fi2kdPQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 11:15:11 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02A2D119868
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 11:15:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9719210E541;
	Tue, 10 Feb 2026 10:15:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="asuU/AWQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com
 [209.85.128.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D4D110E542
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Feb 2026 10:15:07 +0000 (UTC)
Received: by mail-wm1-f74.google.com with SMTP id
 5b1f17b1804b1-4806cfffca6so63076215e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Feb 2026 02:15:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1770718506; x=1771323306;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:from:subject:message-id:references
 :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
 :reply-to; bh=LOkGkAm2doPiV/1EVK7/mVmF+wrw3R5I+/aUBLVAOLM=;
 b=asuU/AWQJpdL5UcogFIVubgAl6YjxyVSzcKIzVfViTaiS+CFd591pQ9d0KS74s5FY7
 WzgkugVzor9tXrqKHFFbX73CVGwmgBrkgEwcTgUyOwC20MyrLFwQ6H7e3+tDmQEDDQde
 bCRgkVG0P2HKJpaC3JCeSMWZIZ3iPj1o9l2MZev8IqgPs77caM5JakUXSTeWwNob/cyD
 11+oC7qOB+QEH9LT4B3skUbLLS1hGsIJyQ60k044SxcbKUJNtFEjlbWy5otbz5Tl5OZG
 pp8elj3an2y9Qefyt7nwXqHqY2MPbXdm0hWtNShaiHqlyKHudtLLXQ+P7sXUq3kE4kmX
 jM2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770718506; x=1771323306;
 h=content-transfer-encoding:cc:to:from:subject:message-id:references
 :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=LOkGkAm2doPiV/1EVK7/mVmF+wrw3R5I+/aUBLVAOLM=;
 b=Fsbul9DnGsf9TnsKisutBE76H4Ep2rOk/kEcbZhCqdJu+I4r0+ozNnVEQ7k3KrVP6X
 /APgNpGMi6LMxbtg/2NUb22dYK+2SVRIiqmsf81h1VniwiiF2bHHDMIlF4BTMUhVufyY
 XLYeS4M3vLr83fECEXWBaXi/2sPGTVjlA74BEs3P3XsncxLkCLD44nZmlQ5oXTAd/IQx
 1mpGVJNclYxbw35KN0LOHDPe22IWiyZOUmY+mrZBoAB/wWw+jejLZfngvDcR7dyH+hxZ
 ByGlJoFRud4cA9P9w/y6vpXANsYs2hvFEhMp/5kaJvTjEu6YRwcMzHLB6XmYjE8V/66Q
 eKAA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVfjjWYyJbszi8Rqe7z/FSUfOBhSBjTIcKUdL2WZLyJJfC/N3K+QOjIJaBWoEpNF59GYSMznDhvsaE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywcx8ySgoTITM/AZJIOOluM8sKXJ1c2/MhHMTx9RGWBti9xFAWZ
 Te8MymYOsWGwRR3E8jMA/97QoAr0YucDw92olVW6qvsMIOy3Ew3L1MEJg3pgNUN7ANvPPHIF6Ot
 NhoGzRjJKxYUd8JGhug==
X-Received: from wmxa16-n2.prod.google.com
 ([2002:a05:600d:6450:20b0:480:3227:a124])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1381:b0:477:5af7:6fa with SMTP id
 5b1f17b1804b1-4835082d265mr21291245e9.32.1770718505691; 
 Tue, 10 Feb 2026 02:15:05 -0800 (PST)
Date: Tue, 10 Feb 2026 10:15:04 +0000
In-Reply-To: <20260210101525.7fb85f25@fedora>
Mime-Version: 1.0
References: <20260203081403.68733-2-phasta@kernel.org>
 <20260203081403.68733-4-phasta@kernel.org>
 <20260205095727.4c3e2941@fedora> <DG7SZND1GWR4.3C5NLKY4SYC0M@kernel.org>
 <bb57b6837aa8044e679dad5f2589c2e0ba84c221.camel@mailbox.org>
 <20260209155843.725dcfe1@fedora>
 <c319c349-eb95-4c38-84fb-47440daefc3b@amd.com>
 <aYruaIxn8sMXVI0r@google.com> <20260210101525.7fb85f25@fedora>
Message-ID: <aYsFKOVrsMQeAHoi@google.com>
Subject: Re: [RFC PATCH 2/4] rust: sync: Add dma_fence abstractions
From: Alice Ryhl <aliceryhl@google.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: "Christian =?utf-8?B?S8O2bmln?=" <christian.koenig@amd.com>,
 Philipp Stanner <phasta@mailbox.org>, phasta@kernel.org, 
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Gary Guo <gary@garyguo.net>, Benno Lossin <lossin@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 rust-for-linux@vger.kernel.org
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:boris.brezillon@collabora.com,m:christian.koenig@amd.com,m:phasta@mailbox.org,m:phasta@kernel.org,m:dakr@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:gary@garyguo.net,m:lossin@kernel.org,m:daniel.almeida@collabora.com,m:joelagnelf@nvidia.com,m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[amd.com,mailbox.org,kernel.org,gmail.com,ffwll.ch,garyguo.net,collabora.com,nvidia.com,vger.kernel.org,lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[aliceryhl@google.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[aliceryhl@google.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[google.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,mailbox.org:email]
X-Rspamd-Queue-Id: 02A2D119868
X-Rspamd-Action: no action

On Tue, Feb 10, 2026 at 10:15:25AM +0100, Boris Brezillon wrote:
> On Tue, 10 Feb 2026 08:38:00 +0000
> Alice Ryhl <aliceryhl@google.com> wrote:
>=20
> > On Tue, Feb 10, 2026 at 09:16:34AM +0100, Christian K=C3=B6nig wrote:
> > > On 2/9/26 15:58, Boris Brezillon wrote: =20
> > > > On Mon, 09 Feb 2026 09:19:46 +0100
> > > > Philipp Stanner <phasta@mailbox.org> wrote:
> > > >  =20
> > > >> On Fri, 2026-02-06 at 11:23 +0100, Danilo Krummrich wrote: =20
> > > >>> On Thu Feb 5, 2026 at 9:57 AM CET, Boris Brezillon wrote:   =20
> > > >>>> On Tue,=C2=A0 3 Feb 2026 09:14:01 +0100
> > > >>>> Philipp Stanner <phasta@kernel.org> wrote:
> > > >>>> Unfortunately, I don't know how to translate that in rust, but w=
e
> > > >>>> need a way to check if any path code path does a DmaFence.signal=
(),
> > > >>>> go back to the entry point (for a WorkItem, that would be
> > > >>>> WorkItem::run() for instance), and make it a DmaFenceSignallingP=
ath.
> > > >>>> Not only that, but we need to know all the deps that make it so
> > > >>>> this path can be called (if I take the WorkItem example, that wo=
uld
> > > >>>> be the path that leads to the WorkItem being scheduled).   =20
> > > >>>
> > > >>> I think we need a guard object for this that is not Send, just li=
ke for any
> > > >>> other lock.
> > > >>>
> > > >>> Internally, those markers rely on lockdep, i.e. they just acquire=
 and release a
> > > >>> "fake" lock.   =20
> > > >>
> > > >> The guard object would be created through fence.begin_signalling()=
, wouldn't it? =20
> > > >=20
> > > > It shouldn't be a (&self)-method, because at the start of a DMA
> > > > signaling path, you don't necessarily know which fence you're going=
 to
> > > > signal (you might actually signal several of them).
> > > >  =20
> > > >> And when it drops you call dma_fence_end_signalling()? =20
> > > >=20
> > > > Yep, dma_fence_end_signalling() should be called when the guard is
> > > > dropped.
> > > >  =20
> > > >>
> > > >> How would that ensure that the driver actually marks the signallin=
g region correctly? =20
> > > >=20
> > > > Nothing, and that's a problem we have in C: you have no way of tell=
ing
> > > > which code section is going to be a DMA-signaling path. I can't thi=
nk
> > > > of any way to make that safer in rust, unfortunately. The best I ca=
n
> > > > think of would be to
> > > >=20
> > > > - Have a special DmaFenceSignalWorkItem (wrapper a WorkItem with ex=
tra
> > > >   constraints) that's designed for DMA-fence signaling, and that ta=
kes
> > > >   the DmaSignaling guard around the ::run() call.
> > > > - We would then need to ensure that any code path scheduling this w=
ork
> > > >   item is also in a DMA-signaling path by taking a ref to the
> > > >   DmaSignalingGuard. This of course doesn't guarantee that the sect=
ion
> > > >   is wide enough to prevent any non-authorized operations in any pa=
th
> > > >   leading to this WorkItem scheduling, but it would at least force =
the
> > > >   caller to consider the problem. =20
> > >=20
> > > On the C side I have a patch set which does something very similar.
> > >=20
> > > It's basically a WARN_ON_ONCE() which triggers as soon as you try to
> > > signal a DMA fence from an IOCTL, or more specific process context.
> > >=20
> > > Signaling a DMA fence from interrupt context, a work item or kernel
> > > thread is still allowed, there is just the hole that you can schedule
> > > a work item from process context as well.
> > >=20
> > > The major problem with that patch set is that we have tons of very
> > > hacky signaling paths in drivers already because we initially didn't
> > > knew how much trouble getting this wrong causes.
> > >=20
> > > I'm strongly in favor of getting this right for the rust side from th=
e
> > > beginning and enforcing strict rules for every code trying to
> > > implement a DMA fence. =20
> >=20
> > Hmm. Could you say a bit more about what the rules are? I just re-read
> > the comments in dma-fence.c, but I have some questions.
> >=20
> > First, how does the signalling annotation work when the signalling path
> > crosses thread boundaries?
>=20
> It's not supposed to cross the thread boundary at all. The annotation
> is per-thread, and it that sense, it matches the lock guard model
> perfectly.
>=20
> > For example, let's say I call an ioctl to
> > perform an async VM_BIND, then the dma fence signalling critical path
> > starts in the ioctl, but then it moves into a workqueue and finishes
> > there, right?
>=20
> It's a bit trickier. The fence signalling path usually doesn't exist in
> the submitting ioctl until the submission becomes effective and the
> emitted fences are exposed to the outside world. That is, when:
> - syncobjs are updated to point to this new fence
> - fencefd pointing to this new fence is returned
> - fence is added to the dma_resvs inside the gem/dma_buf objects
> - ... (there might be other cases I forgot about)
>=20
> In the submission path, what's important is that no blocking allocation
> is done between the moment the fence is exposed, and the moment it's
> queued. In practice what happens is that the job this fence is bound to
> is queued even before the fences are exposed, so if anything, what we
> should ensure is the ordering, and having a guarantee that a job being
> queued means it's going to be dequeued and executed soon enough.
>=20
> The second DMA signaling path exists in the context of the
> workqueue/item dequeuing a job from the JobQueue (or drm_sched) and
> pushing it to the HW. Then there's the IRQ handler being called to
> inform the GPU is done executing this job, which might in some cases
> lead to another work item being queued for further processing from
> which the dma_fence is signaled. In other cases, the dma_fence is
> signaled directly from the IRQ handler. All of these contexts are
> considered being part of the DMA-signaling path. But it's not like the
> fence signaling annotation is passed around, because the cookies
> returned by dma_fence_begin_signalling() are only valid in a single
> thread context, IIRC.

Ok I understand what's going on now.

You talk about it as-if there are two signalling paths, one in the ioctl
and another in the workqueue. But that sounds like a workaround to make
it work with how dma_fence_begin_signalling() is implemented, and not
the true situation. (Added: looks like Christian confirms this.)

One way you can see this is by looking at what we require of the
workqueue. For all this to work, it's pretty important that we never
schedule anything on the workqueue that's not signalling safe, since
otherwise you could have a deadlock where the workqueue is executes some
random job calling kmalloc(GFP_KERNEL) and then blocks on our fence,
meaning that the VM_BIND job never gets scheduled since the workqueue
is never freed up. Deadlock.

And the correct way to model the above in lockdep is to have the DMA
fence lockdep key be nested *outside* the lockdep key of the workqueue.
Because there is a step in the signalling path where you wait for other
jobs to complete before the signalling path is able to continue.

And the meaning of such a lockdep dependency is exactly that the
critical region moves from one thread to another.


Perhaps we could have an API like this:

// Split the DriverDmaFence into two separate fence concepts:
struct PrivateFence { ... }
struct PublishedFence { ... }

/// The owner of this value must ensure that this fence is signalled.
struct MustBeSignalled<'fence> { ... }
/// Proof value indicating that the fence has either already been
/// signalled, or it will be. The lifetime ensures that you cannot mix
/// up the proof value.
struct WillBeSignalled<'fence> { ... }

/// Create a PublishedFence by entering a region that promises to signal
/// it.
///
/// The only way to return from the `region` closure it to construct a
/// WillBeSignalled value, and the only way to do that (see below) is to
/// signal it, or spawn a workqueue job that promises to signal it.
/// (Since the only way for that workqueue job to exit is to construct a
/// second WillBeSignalled value.)
fn dma_fence_begin_signalling(
    fence: PrivateFence,
    region: impl for<'f> FnOnce(MustBeSignalled<'f>) -> WillBeSignalled<'f>=
,
) -> PublishedFence {
    let cookie =3D bindings::dma_fence_begin_signalling();

    region(<create token here>);

    bindings::dma_fence_end_signalling(cookie);

    fence.i_promise_it_will_be_signalled();
}

impl MustBeSignalled<'_> {
    /// Drivers generally should not use this one.
    fn i_promise_it_will_be_signalled(self) -> WillBeSignalled { ... }

    /// One way to ensure the fence has been signalled is to signal it.
    fn signal_fence(self) -> WillBeSignalled {
        self.fence.signal();
        self.i_promise_it_will_be_signalled()
    }

    /// Another way to ensure the fence will be signalled is to spawn a
    /// workqueue item that promises to signal it.
    fn transfer_to_wq(
        self,
        wq: &Workqueue,
        item: impl DmaFenceWorkItem,
    ) -> WillBeSignalled {
        // briefly obtain the lock class of the wq to indicate to
        // lockdep that the signalling path "blocks" on arbitrary jobs
        // from this wq completing
        bindings::lock_acquire(&wq->key);
        bindings::lock_release(&wq->key);

        // enqueue the job
        wq.enqueue(item, wq);

        // The signature of DmaFenceWorkItem::run() promises to arrange
        // for it to be signalled.
        self.i_promise_it_will_be_signalled()
    }
}

trait DmaFenceWorkItem {
    fn run<'f>(self, fence: MustBeSignalled<'f>) -> WillBeSignalled<'f>;
}


with this API, the ioctl can do this:

let published_fence =3D dma_fence_begin_signalling(|fence| {
    fence.transfer_to_wq(my_wq, my_work_item)
});
somehow_publish_the_fence_to_userspace(published_fence);

And we're ensured that the fence is really signalled because the
signature of the work item closure is such that it can only return from
DmaFenceWorkItem::run() by signalling the fence (or spawning it to a
second workqueue, which in turn promises to signal it).

Of course, the signature only enforces that the fence is (or will be)
signalled if you return. One can still put an infinite loop inside
dma_fence_begin_signalling() and avoid signalling it, but there's
nothing we can do about that.

> > Second, it looks like we have the same challenge as with irq locks wher=
e
> > you must properly nest dma_fence_begin_signalling() regions, and can't
> > e.g. do this:
> >=20
> > c1 =3D dma_fence_begin_signalling()
> > c2 =3D dma_fence_begin_signalling()
> > dma_fence_end_signalling(c1)
> > dma_fence_end_signalling(c2)
>=20
> I think that's the case yes, you have to end in reverse being order.

Ok.

Alice
