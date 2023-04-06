Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A7F796D9DA7
	for <lists+dri-devel@lfdr.de>; Thu,  6 Apr 2023 18:39:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8943E10EC5C;
	Thu,  6 Apr 2023 16:39:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BCAD10EC5C
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Apr 2023 16:39:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 (Authenticated sender: lina@asahilina.net)
 by mail.marcansoft.com (Postfix) with ESMTPSA id 93BC941EF0;
 Thu,  6 Apr 2023 16:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=asahilina.net;
 s=default; t=1680799189;
 bh=LLnPl6IqDtKOelee0FA58xfrG/bHv+wl4wafTF3pouw=;
 h=Date:Subject:To:References:From:Cc:In-Reply-To;
 b=i9mpSdvB9UpLiF4dJwyQpTOoECSdrx4EIW6m2SfewJUzh2qCh63H/C+aTlWagdgB7
 DGTgs5BSw46HCJDWxU5Dp/GpkGpQ6R6JN6hwEjVjY5zzK54dY6trbe7qXqt3kiKK0l
 JMrmvzNozC8RTxRfb9uYhmJWdooVDZFseS70p9rDdkCSSVX7H1AnkBdsDj7y4JjZRf
 8CckvfyRxAXiC+FDh3bwEYc7CTfmENIqnFp2+sXuMiXE6Qb2SrmUYbEQbNFwhb7VOQ
 SRuyHaBFa2z2hnqKpFSv2gmd8G+rJR7xUJoFvIgrts3vkHz8m+YULMAYcnsOr1hoYo
 GCgY/nDSZDgXQ==
Message-ID: <6e383036-a12e-607d-4448-63cf2124d0b4@asahilina.net>
Date: Fri, 7 Apr 2023 01:39:41 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [Linaro-mm-sig] Re: [PATCH RFC 07/18] rust: drm: mm: Add DRM MM
 Range Allocator abstraction
Content-Language: en-US
To: Daniel Vetter <daniel@ffwll.ch>
References: <20230307-rust-drm-v1-0-917ff5bc80a8@asahilina.net>
 <20230307-rust-drm-v1-7-917ff5bc80a8@asahilina.net>
 <ZC7T92F7K9XTZPZ1@phenom.ffwll.local>
 <2a419eff-3566-0aa3-7185-951edde22abb@asahilina.net>
 <ZC7vjYUnLZqb0FV4@phenom.ffwll.local>
From: Asahi Lina <lina@asahilina.net>
In-Reply-To: <ZC7vjYUnLZqb0FV4@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: Karol Herbst <kherbst@redhat.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, dri-devel@lists.freedesktop.org,
 Mary <mary@mary.zone>, Gary Guo <gary@garyguo.net>,
 Ella Stanforth <ella@iglunix.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Luben Tuikov <luben.tuikov@amd.com>,
 Alex Gaynor <alex.gaynor@gmail.com>, Miguel Ojeda <ojeda@kernel.org>,
 linux-media@vger.kernel.org, Wedson Almeida Filho <wedsonaf@gmail.com>,
 rust-for-linux@vger.kernel.org, Boqun Feng <boqun.feng@gmail.com>,
 =?UTF-8?Q?Bj=c3=b6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Faith Ekstrand <faith.ekstrand@collabora.com>, linux-sgx@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 Jarkko Sakkinen <jarkko@kernel.org>, asahi@lists.linux.dev,
 Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 07/04/2023 01.13, Daniel Vetter wrote:
> On Fri, Apr 07, 2023 at 12:53:47AM +0900, Asahi Lina wrote:
>> On 06/04/2023 23.15, Daniel Vetter wrote:
>>> On Tue, Mar 07, 2023 at 11:25:32PM +0900, Asahi Lina wrote:
>>>> drm_mm provides a simple range allocator, useful for managing virtual
>>>> address ranges. Add a Rust abstraction to expose this module to Rust
>>>> drivers.
>>>>
>>>> Signed-off-by: Asahi Lina <lina@asahilina.net>
>>>
>>> In the cover letter you mentioned the design open about embedded the lock
>>> into the rust wrappers.
>>>
>>> I think for a first step that's perfectly fine.
>>>
>>> Longer term we might want to ramp up some "proof of locking"
>>> infrastructure in Rust, where callers can supply a lock guard and ideally
>>> rust validates at compile time that it's for the right type, and at
>>> runtime (like lockdep) that it's consistent and the callers don't mix up
>>> locks (like using different locks for the same drm_mm allocator).
>>
>> That proof-of-lock tuff works in Rust too as far as I know.
>>
>> But the general thread safety story in Rust is much simpler, you just use
>> methods that take &mut self when locking is the caller's responsibility.
>> That effectively implies that there can only be one reference that can call
>> those methods at any given time, thanks to the borrow checker. Shared
>> references only give you &self, a locked Mutex upgrades that to &mut self,
>> and that's how you get proof of locking at compile time, through and
>> through, not just for the type but for the specific object.
> 
> Hm that still has the problem of making sure that you supply the right
> lock (for generic abstractions like drm_mm or drm/sched where the lock is
> supplied by the driver.

No no, I mean you don't have to supply the lock at all. The idea is that 
if you have a mutable reference to the object *at all* then Rust says 
that's effectively interlocked, whether you achieve that with an actual 
lock or just by not sharing the object to begin with.

This is the standard pattern in Rust. Thread-safe methods take &self, 
and you can call those from multiple threads at once. Thread-unsafe 
methods take &mut self, and you can only call them from one thread at 
once. Mutex is one mechanism that allows you to upgrade a shared &self 
to a &mut self (while holding the lock). The actual object doesn't know 
anything about mutexes or locking, it just relies on the more 
fundamental property that Rust says that if you have a &mut obj, 
absolutely nobody else does, at any given time, by definition.

(And then everything also needs to impl Send + Sync for this to work 
across threads, but that's usually what you want)

Basically if there were to exist a Rust abstraction/object/anything that 
allows two threads to get ahold of a &mut to the same object at the same 
time without using unsafe, that abstraction/etc would be broken and 
unsound (and necessarily have to involve bad unsafe code within, because 
you can't do that with just safe code, the borrow checker stops you), 
and the state of affairs of two threads having such a reference is 
outright undefined behavior in the language model.

> Once we have the lock then yeah borrow checker makes sure you can't screw
> up, worst case needs a PhantomData (I guess) as toke of proof to pass
> around the borrowed lifetime (If I got that right from your use of
> PhantomData in the sched wrappers).

Ah, PhantomData is just a hack because Rust wants you to use all type 
parameters inside structs even when you don't actually need them for 
anything because they only have meaning to the abstraction itself. 
Without it it won't compile. Something something deep type system black 
magic rules (I'm pretty sure this requirement isn't gratuitous but I 
don't know what the whole story is here).

The lock does give you a Guard you could pass somewhere as proof, which 
itself contains a lifetime that ties it to the Mutex, but more 
importantly that Guard implements DerefMut to give you a &mut to 
whatever is inside the Mutex, and *that* mutable reference is the proof 
that you are the sole execution context with the right to access that 
one particular object. At that point the Guard doesn't matter, and 
lifetimes tie everything together so you can't stash that &mut somewhere 
else or anything like that to break the rules (modulo unsafe code, of 
course!).

> 
>>> There's a lot of libraries in the kernel that have this "caller ensures
>>> locking" pattern. drm/sched also has these requirements.
>>
>> Yup, that all usually maps nicely to &mut self in Rust... except for the
>> issue below.
>>
>>> There's two other things I'd like to bring up on this patch though, just
>>> because it's a good example. But they're both really general points that
>>> apply for all the rust wrappers.
>>>
>>> Documentation:
>>>
>>> In drm we try to document all the interfaces that drivers use with formal
>>> docs. Yes there's some areas that are not great for historical reasons,
>>> but for new stuff and new wrappers we're really trying:
>>>
>>> - This helps in telling internal (even across .c files or in rust across
>>>     modules within a crate) from stuff drivers access. Sure you have static
>>>     in C or pub in rust, but that doesn't tell you whether it's public all
>>>     the way to drivers.
>>>
>>> - ideally docs have a short intro section that explains the main concepts
>>>     and links to the main data structures and functions. Just to give
>>>     readers a good starting point to explore.
>>>
>>> - Linking all the things, so that readers can connect the different parts.
>>>     This is really important in C where e.g. get/put() or any such function
>>>     pairs all needed to be linked together. With rust I'm hoping that
>>>     rustdoc liberally sprinkles links already and we don't have to do this
>>>     as much.
>>>
>>> - Short explainers for parameters. For rust this also means type
>>>     parameters, for those even simplified examples of how drivers are
>>>     supposed to use them would help a lot in reading docs & understanding
>>>     concepts.
>>>
>>> - Ideally links from the rust to the sphinx side to linke relevant
>>>     chapters together. Often the bigger explanations are in .rst files with
>>>     DOT graphs (kms has a bunch I've added) or similar, and it doesn't make
>>>     that much sense to duplicate all that on the rust side I guess. But it
>>>     needs to be discoverable.
>>>
>>> This might be more a discussion topic for the rust people than you
>>> directly. Still needed for the merge-ready patches eventually.
>>
>> I don't know much about the doc gen stuff on the Rust side so yeah, this is
>> something I need to look into to make it pretty and complete...
> 
>  From what Miguel has shown I think it's all there already, and the only
> missing pieces are the cross-linking at a chapter level from rustdoc to
> rst and sphinx to rstdoc too ideally. But I think for most rust wrappers
> that will be one link each direction only (e.g. C drm_mm linking to
> kernel::drm::MM and other way round and done). So absolutely no problem if
> that one item is sorted out post merge once rustdoc/kernel-sphinx are
> ready.
> 
>>> Refcounting vs borrowing:
>>>
>>> This is honestly much more the eyebrow raising one than the locking. Very
>>> often on the C side these datastructures all work with borrow semantics,
>>> and you need to explicitly upgrade to a full reference (kref_get or
>>> kref_get_unless_zero, depending whether it's a strong or weak reference)
>>> if you need the object outside of the mutex/lock guard section.
>>>
>>> Again I think for now it's ok, but the sales pitch of rust is that it
>>> enables borrow lifetime checking with no runtime cost. Plus viz the vm
>>> cleanup example, if you have too many strong backreferences the cleanup
>>> flow gets complicated. And it would suck if rust drivers have to add
>>> complexity like the openrefcount for the vm example simply because we
>>> can't model the borrow semantics well enough to be safe.
>>>
>>> So not something that's really bad here, but if we need to resort to full
>>> refcounting already for simple datastructures then I'm getting a bit
>>> worried about how well rust will cope with the really nasty borrowed
>>> reference tricks we're playing in other areas.
>>>
>>> Again more a topic for the rust folks I think than specifically here about
>>> drm_mm wrapping. Just to get things going I think this is fine.
>>
>> Yeeeeah... this is a *specific* problem. Drop.
>>
>> The Allocator<T> itself is perfectly safe to implement without any locking,
>> refcounting, or anything. You just make the methods take &mut self (as they
>> already do), the caller can use it with a single reference or wrap it in an
>> Arc<Mutex<T>> and share it, or whatever.
>>
>> The problem is the Node<A, T>. When you Drop that, it has to go back to the
>> Allocator. But now you're a different object, so no thread safety
>> guarantees. And you need to keep the Allocator alive. So now to make a safe
>> abstraction, you need refcounting and a mutex.
>>
>> Lifetimes just don't work here, sadly. Not for a useful abstraction.
>>
>> I'd love to hear from the other Rust folks whether they have any better
>> ideas...
> 
> Hm yeah I think I get the gist of the issue. At time of Drop there's no
> allocator reference you can borrow and so you're screwed.
> 
> In C we tend to solve that by passing both to the unlink/drop stuff (and
> rust could then ensure that we have legit borrows for both), but I guess
> that just totally wreaks entire wrapper and makes it really rough to use.

Yup, that's the issue ^^;;

> 
>> One thing that *can* be done is making the Drop illegal (Rust can't do this
>> "natively" but Linux already has hacks for that, we can make it fail to link
>> if the Drop is ever called). Then you'd have to actively return the Node to
>> the Allocator with a free function. Since Drop is forbidden, and Node is
>> pinned, you'd always have to either return Node objects to the Allocator or
>> leak them. You could drop the Allocator before its nodes, but as far as I
>> know drm_mm can safely handle that (though it will complain), and then due
>> to the previous guarantees the *only* thing you could do with orphan nodes
>> is leak their memory, which is safe.
>>
>> It would work... but it breaks the whole Rust automagic Drop stuff.
> 
> Yeah I think I see the challenge ...
> 
>> Thinking about this a bit, I think I want the current mutex/arc semantics
>> for something like a memory allocator (which is one of my primary use cases
>> for drm_mm), since I definitely don't want to be manually returning objects
>> to their allocator all over the place, nor have overarching lifetime
>> requirements that the allocator outlive its objects for safety (that sounds
>> like a can of worms I don't want to open, I'd much rather use a refcount
>> even if I "think" I can prove the lifetime bounds ad-hoc). But for something
>> like a drm_mm that is tracking VA ranges within a VM with all Nodes held
>> internally, maybe I could manage it all internally and have all node
>> destruction be handled via an explicit call into the Allocator.
> 
> Yeah I think for gpuva we need to do better, but assuming the gpuva
> library is in C then rust would just need to encode the safety properties
> that (hopefully) the C library guarantees ...

Yeah, if this is going to be common C code using drm_mm then it can 
provide whatever safety properties it wants and use drm_mm in ways not 
possible with the Rust abstraction, of course.

> And for any driver that just wants to use some range manager the standard
> wrapping leans heavily on the side of "easy to use".
> 
>> Maybe the mm abstraction should offer both options? The extra locking can be
>> implemented in terms of the base unlocked version I think (perhaps with some
>> Deref abuse for ergonomics)... I definitely want to hear more opinions about
>> this from other Rust folks, since there are probably other options I haven't
>> considered...
> 
> I don't think we need the more raw/tricky one, at least not until we have
> some serious libraries like gpuva implemented in rust. Or drivers
> reimplementing the gpuva stuff in their driver :-)

It only just hit me that gpuva is an actual thing that's in RFC. Sounds 
like I should give it a shot when I do the vm_bind stuff instead of 
reinventing that wheel (which was my original plan)... sorry if I've 
been a bit slow here.

>> Aside: This, and all the other DRM abstractions, were written before the
>> pin_init stuff from y86 that is in review right now was ready. That may open
>> up more interesting/ergonomic/efficient APIs for some cases, especially
>> where Pin and embedding C types into user objects in some way are involved.
>> So maybe there's room for improvement here. Just a sidenote.
> 
> Ah good to know, and yeah that make open some interesting options.
> -Daniel

~~ Lina

