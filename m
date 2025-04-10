Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B074DA84348
	for <lists+dri-devel@lfdr.de>; Thu, 10 Apr 2025 14:37:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA25610E992;
	Thu, 10 Apr 2025 12:37:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=temperror (0-bit key; unprotected) header.d=asahilina.net header.i=@asahilina.net header.b="u2CRff5M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9C3A10E992
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Apr 2025 12:37:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: lina@asahilina.net)
 by mail.marcansoft.com (Postfix) with ESMTPSA id 9418C42C77;
 Thu, 10 Apr 2025 12:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=asahilina.net;
 s=default; t=1744288663;
 bh=g5YTvC6tXVOI836DEgexpz9Ysrr2aGIHVCxrvEom31Y=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=u2CRff5MKUFGyrLzeQ0RD0Mm5wzrC+PiId0tD2YfxZf3bIp5Yw0c7MsRZ/hwICMO5
 8mmBZYUKcUTTQax1Ia8Ei+fxhtkpkob4DLowHqWLeQuiADDTTdHQIFjkLj2XLQMdPG
 +v+3MxOUMYaVhq6bphu5tRJdJxKhu0NkBbTLcCQvWdwP/+3a1ZhGS9wslU8VczPjFt
 Ug9KQJ+SVDBX29chI/1wH7XQSG5Sk+XX96dnytM5hlcdEG6AY9Hwn+9XHD38SY6TW2
 GSdCPoyNoeC74wvn537cnGv107B0u+NJKN/ns7QByKEJMJfu+H/+fTOzztHlJJ8UCh
 cZLQfEZNPaLmQ==
Message-ID: <88270028-7541-4184-a118-96c182109804@asahilina.net>
Date: Thu, 10 Apr 2025 21:37:39 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/8] DRM Rust abstractions
To: Danilo Krummrich <dakr@kernel.org>
Cc: Dave Airlie <airlied@gmail.com>, maarten.lankhorst@linux.intel.com,
 simona@ffwll.ch, mripard@kernel.org, tzimmermann@suse.de, lyude@redhat.com,
 acurrid@nvidia.com, daniel.almeida@collabora.com, j@jannau.net,
 ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com,
 gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
 a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20250325235522.3992-1-dakr@kernel.org>
 <32e7da7e-de32-4bc6-a751-f604da36a63f@asahilina.net>
 <Z_VXBZcBsk2k6eVN@cassiopeiae>
 <143206f6-cd97-4ef8-a4f3-f68d703903bf@asahilina.net>
 <Z_V2ZxIZxI_HiHM5@cassiopeiae>
 <ebbb4d4e-4778-434b-82d7-188f8f6152ff@asahilina.net>
 <CAPM=9ty5dNQOJUj=wtubGYGt5Kt3QeQAQ9rjM2P0dwjBUFspMw@mail.gmail.com>
 <34a4a130-98d1-4cc3-8dcf-b72b3ed36c10@asahilina.net>
 <43ec8aba-f279-422d-95d1-68daac7eaed9@asahilina.net>
 <Z_ecMl2QtAssfczJ@pollux>
Content-Language: en-US
From: Asahi Lina <lina@asahilina.net>
In-Reply-To: <Z_ecMl2QtAssfczJ@pollux>
Content-Type: text/plain; charset=UTF-8
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



On 4/10/25 7:23 PM, Danilo Krummrich wrote:
> (Adding Sima and dri-devel back in.)
> 
> On Thu, Apr 10, 2025 at 04:12:13PM +0900, Asahi Lina wrote:
>>
>> P.S. my analysis based on the pasted code (since everyone here and
>> everyone on Reddit is forcing me to do it) is that:
> 
> First of all, you keep talking as if I would have been resisting to do any
> changes, even though I offered you to change things from the get-go.

Repeatedly offering trivialities as counterarguments, such as that my
initial analysis was incorrect (when it wasn't), or that an offhand
comment I made in my second analysis was more limited in scope than you
expected, *is* resisting. Even if you say "you will do X", if you keep
bringing up reasons why my motivation to do X is flawed, that *is*
resisting, in thinly veiled form. Not resisting would've been to say
"sorry, which patches would you like to retain ownership for? I think X,
Y make sense, while Z is mostly new code."

> Instead of taking the offer, you decided to go with wild accusations, without
> even properly looking at things and understanding my intentions.

I never accused you of anything beyond taking over primary authorship of
the patches, which is something you did, in fact, do.

> Given that you stepped back from kernel development, making clear that you don't
> want to be bothered with it anymore (as you also repeated in this thread), I had
> to take a decision: Do I "keep" your primary authorship for commits that I
> (newly) create, commit messages I write and code that I substantially change, or
> do I account for this by changing primary authorship while still giving you
> credit.

Just because I stepped back doesn't mean you can't send me an email to
ask a question to make sure you get upstreaming my code respecting my
wishes for attribution. Though given the mess this turned into, as soon
as this conversation is over, I will be sending all kernel-related
emails directly to sieve-discard. While a simple question would have
been fine and encouraged, this mess is not, and I do not have the time
or mental health cycles to deal with any more of this going forward.

So indeed, if you ever find yourself questioning something about my code
*going forward*, please take your best guess, because I'm now really
done with kernel involvement, completely.

> 
> The decision I took is clearly reasonable and *nothing* about it is uncommon.

As far as I am concerned, reorganizing someone's code and commits and
doing so as your own commit identity *without* having previously agreed
to do things that way (and without knowing that person well enough to
know it will be acceptable) is not common, and should not be common in
any respectful, well-functioning community, and is not something I've
ever done myself.

Those are things you do with prior, informed consent between both
parties. Without explicit consent, you keep the authorship info.

> I also want to point out that for patch "rust: drm: ioctl: Add DRM ioctl
> abstraction" I kept your primary authorship, since I took the patch "as is" with
> just very minor modifications.

I'm aware.

> However, I understand that you prefer to have primary authorship, even if the
> code has been re-organized in new commits, moved, modified or rewritten.

Correct.

> This really is *totally* fine for me, and I won't argue about it (even though
> one could).

Continuing to mention that "one could" and previously "even though I do
think my changes do justify how things are currently" means no, you are
not totally fine with it, and you are in fact arguing about it. Just
because you ostensibly intend to let me win the argument does not mean
you aren't arguing about it, because you are.

> 
>> The series adds around 978 lines of code. After merging some code that
>> was just moved around in the diff that Danilo posted, only 412 addition
>> lines remain in the diff. So more than 50% of the raw remaining code is
>> mine. If you exclude comments, Danilo only added 270 lines of actual
>> code (and whitespace). And of those, a good portion were just minor
>> changes and refactoring, not completely novel code (this also tracks
>> with the stat that to get to those 270 lines, 379 were removed, and much
>> of those probably pair up as minor refactorings and not outright novel
>> code).
>>
>> In terms of actual code added an not just lines rearranged or further
>> commented, I probably wrote at least 75% of this series. And I'm sure
>> Danilo knows this, having done the refactoring/rearranging/modification
>> work to get here.
> 
> I do not understand what you are trying to proof here and especially why.

I'm trying to give a rough statistic of how much of the code is mine vs.
yours, because apparently you (and others in the giant Reddit thread
this somehow spawned) expect me to actually analyze the code to
determine what the authorship should be. This could have ben avoided had
you just *told* me "yeah, I think you should be the owner of most of the
patches except maybe drm::Device, can you take a look at that one and
see if that makes sense?" instead of sending me off to decide which
patches I should own, as if I need to come up with my own analysis and
conclusions while you already know what changes were made and to what code.

> I also do *not* agree with the above; to me it looks like it does not account
> for the cases where code has been moved *and* modified.

Of course it does. I only deleted a small section of code from the diff
that was moved verbatim and not modified. Plenty of code was moved and
modified, and that's all accounted to you.

> 
> Here's the full list of changes for the diff [1].
> 
>   - rewrite of drm::Device
>     - full rewrite of the abstraction using the subclassing pattern
> 
>   - rework of drm::Registration
>     - this may seem like a trivial simplification (or move), but has
>       architectural implications to prevent use-after-free bugs
>       - some members (vtable) of drm::Registration need to be tied to the
>         lifetime of the drm::Device instead, *not* the drm::Registration
>     - introduce Devres
> 
>   - rework of drm::File
>     - switch to the Opaque<T> type
>     - fix (mutable) references to struct drm_file (which in this context is UB)
>     - restructure and rename functions to align with common kernel schemes
> 
>   - rework of the GEM object abstractions
>     - switch to the Opaque<T> type
>     - fix (mutable) references to struct drm_gem_object (which in this context is UB)
>     - drop all custom reference types in favor of AlwaysRefCounted
>     - a bunch of minor changes and simplifications (e.g. IntoGEMObject trait)
> 
>   - MISC
>     - write and fix lots of safety and invariant comments
>     - remove necessity for and convert 'as' casts
>     - bunch of other minor changes
> 
> The sum of the above is clearly *not* minor.

And yet it clearly does not amount to a complete rewrite of the entirety
or most of the code, never mind the engineering and design that went
into the abstractions in the first place, which is not something you can
even measure in terms of lines of code. I'm quite certain I spent more
hours hacking on this code than you did (and in fact, most of my time is
documented in public YouTube videos), especially considering I put it
into production with a real driver.

> I really don't agree with the fact that you keep accusing me of "stealing" your
> code, which I clearly did not. Trust me, I don't need that.

I'm getting really tired of *your* false accusations. I never accused
you of "stealing" code, I only ever talked about primary authorship. If
you are interpreting that as "stealing" that is something you are
maneuvering *yourself* into, to use your own words.

>> Danilo: If you do not take me up on the CC-0 offer, I expect you to put
>> my name as primary author of patches 3 through 7.
> 
> I offered this from the get-go, hence I will do so.
> 
> However, are you sure you really want primary authorship for "rust: drm: add
> device abstraction", given that drm::Device is a full rewrite?
> 
> [1] https://pastebin.com/FT4tNn5d
> 

The vtable/legacy stuff came straight from the other file. The "rewrite"
is, quite frankly, an obvious refactor (the original code was written
before the PinInit stuff even existed so it could not have been done
that way, and I've done this same refactor for other bits of code many
times before and would never call that a rewrite), but given there's
30-odd lines of new code (with comments) in the Device<T>::new() method
that comprises most of the actual effort, and most of the rest of the
file is boilerplate... sure, you can put yourself as primary author for
that one if you wish.

See? You could have started with that story about drm::Device being a
more major change than the others and spared us all the blind arguing
and wasting of time.

~~ Lina

