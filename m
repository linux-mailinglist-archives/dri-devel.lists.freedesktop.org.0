Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91F30A2C64A
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2025 15:54:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D549F10EB33;
	Fri,  7 Feb 2025 14:54:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=marcan.st header.i=@marcan.st header.b="IiT/K37/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61DC910EB33
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Feb 2025 14:54:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: marcan@marcan.st)
 by mail.marcansoft.com (Postfix) with ESMTPSA id E35C541D83;
 Fri,  7 Feb 2025 14:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=marcan.st; s=default;
 t=1738940079; bh=VqkQLcFGQ0F9GDrz/XsQTbEhW4Idk0VNtejdKRcQIGM=;
 h=Date:Subject:To:References:From:In-Reply-To;
 b=IiT/K37/AxclMcLIwDnGk6idIx7CYfJT7ITOjf65Okkwi1yMdGacXD7i0X5DSGYPW
 0VUKTyQM8ksbi1L/INuNs3o+78LncQfwSdWFyZnaqJFFHotnm3CSsnOWDYBwDqKLcj
 OFOuWuqEWc1Y0lyYSSKhlMTE8lP+IIJcShR4kbDoiET4niDA3WAcEevvrPup9zBeC/
 jvAPe6IpM19vcODCZ7GlqcckmF3hC8bNkjsZKCRkaXjPbQmFb7Ruazn2Tc+xO7yMt9
 4z51rMQ3w/h8CLI+HuH6FdpHZr9VUs0nGliXocbeX/I0KGMrTLKWV/psSjieY65xrm
 CEP2oz3AZqM4Q==
Message-ID: <a869236a-1d59-4524-a86b-be08a15262ec@marcan.st>
Date: Fri, 7 Feb 2025 23:54:35 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: On community influencing (was Re: [PATCH v8 2/2] rust: add dma
 coherent allocator abstraction.)
To: Simona Vetter <simona@ffwll.ch>, Jason Gunthorpe <jgg@nvidia.com>,
 Greg KH <gregkh@linuxfoundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>, phasta@kernel.org,
 Christoph Hellwig <hch@lst.de>, Danilo Krummrich <dakr@kernel.org>,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Abdiel Janulgue <abdiel.janulgue@gmail.com>, daniel.almeida@collabora.com,
 aliceryhl@google.com, robin.murphy@arm.com, rust-for-linux@vger.kernel.org,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 Valentin Obst <kernel@valentinobst.de>,
 open list <linux-kernel@vger.kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>, airlied@redhat.com,
 "open list:DMA MAPPING HELPERS" <iommu@lists.linux.dev>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <293df3d54bad446e8fd527f204c6dc301354e340.camel@mailbox.org>
 <20250130154646.GA2298732@nvidia.com> <2025013030-gummy-cosmic-7927@gregkh>
 <20250130172437.GN5556@nvidia.com>
 <2025013148-reversal-pessimism-1515@gregkh>
 <20250131135421.GO5556@nvidia.com>
 <2b9b75d1-eb8e-494a-b05f-59f75c92e6ae@marcan.st>
 <Z6OzgBYZNJPr_ZD1@phenom.ffwll.local>
 <4c143b85-063a-4413-a6ca-e9d80e26da96@marcan.st>
 <c5a49bcb-45cf-4295-80e0-c4b07083df00@marcan.st>
 <Z6YPfsDSNdRUskvp@phenom.ffwll.local>
From: Hector Martin <marcan@marcan.st>
Content-Language: en-US
In-Reply-To: <Z6YPfsDSNdRUskvp@phenom.ffwll.local>
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



On 2025/02/07 22:49, Simona Vetter wrote:
> On Fri, Feb 07, 2025 at 07:20:03PM +0900, Hector Martin wrote:
>> On 2025/02/07 18:41, Hector Martin wrote:
>>> On 2025/02/06 3:52, Simona Vetter wrote:
>>>> On Tue, Feb 04, 2025 at 03:46:14AM +0900, Hector Martin wrote:
>>>>> Adding Linus
>>>>>
>>>>> My 2c: If Linus doesn't pipe up with an authoritative answer to this
>>>>> thread, Miguel and the other Rust folks should just merge this series
>>>>> once it is reviewed and ready, ignoring Christoph's overt attempt at
>>>>> sabotaging the project. If Linus pulls it, what Christoph says doesn't
>>>>> matter. If Linus doesn't pull it, the R4L project is essentially dead
>>>>> until either Linus or Christoph make a move. Everything else is beating
>>>>> around the bush.
>>>>>
>>>>> Rust folks: Please don't waste your time and mental cycles on drama like
>>>>> this. It's not worth your time. Either Linus likes it, or he doesn't.
>>>>> Everything else is distractions orchestrated by a subset of saboteur
>>>>> maintainers who are trying to demoralize you until you give up, because
>>>>> they know they're going to be on the losing side of history sooner or
>>>>> later. No amount of sabotage from old entrenched maintainers is going to
>>>>> stop the world from moving forward towards memory-safe languages.
>>>>>
>>>>> FWIW, in my opinion, the "cancer" comment from Christoph would be enough
>>>>> to qualify for Code-of-Conduct action, but I doubt anything of the sort
>>>>> will happen.
>>>>
>>>> Yeah no.
>>>>
>>>> https://chaos.social/@sima/113942119012147959
>>>>
>>>> This was about you, because typing a proper answer takes a bit longer. It
>>>> was also about your toots on fedi, like this:
>>>>
>>>> https://social.treehouse.systems/@marcan/113941468353031993
>>>>
>>>> And "haha it's only a joke" does not work with your public profile and following.
>>>>
>>>> I do understand the frustration and temptation to just burn it all to the
>>>> ground, head the call of the sirens, or maybe for me more pick up goat
>>>> farming in the Swiss Alps. But you can't have it both and expect to also
>>>> be part of and contribute to the same community. And personally I don't
>>>> appreciate getting drenched in gasoline while I'm trying to quench flames
>>>> on the ground.
>>>>
>>>> And this isn't the first time or the second, by now it's a pretty clear
>>>> pattern over some years. And with the first I could explain why you react
>>>> like that and you had my full understanding, but eventually that runs a
>>>> bit thin as an excuse.  Now I'm left with the unlikely explanation that
>>>> you just like thundering in as the cavalry, fashionably late, maximally
>>>> destructive, because it entertains the masses on fedi or reddit or
>>>> wherever. I have no idea what you're trying to achieve here, I really
>>>> don't get it, but I am for sure fed up dealing with the fallout.
>>>>
>>>> Cheers, Sima
>>>
>>> Since we're into complaining about social media posts on the list now,
>>> I'm going to link one of yours:
>>>
>>> https://chaos.social/@sima/113961496955043901
>>>
>>> An R4L maintainer quit after multiple rounds of hostility, including
>>> some completely unacceptable public comments bordering on downright
>>> harassment from tytso, a situation which was widely publicized.
>>>
>>> If, according to you, that's "shockingly smooth" with "no outsized
>>> drama" other than "what I stirred up" (I guess you also missed the whole
>>> LWN post about this thread before I posted anything on Fedi? That's how
>>> I even found out about this), then I'm glad I'm disengaging with this
>>> community. The Stockholm syndrome and utter denial is palpable.
> 
> Yes, the kernel's conduct is still not where I think it needs to be. And
> there are still cases occuring with some regularity which would be
> unacceptable on dri-devel and sanctioned under the freedesktop.org code of
> conduct. But that's not really new, it's not really specific to the r4l
> project, and despite that it's still not good enough, it's definitely much
> better than 10 years ago.
> 
> That all aside, I put the "outsized" very intentionally in my comment. It
> carries a lot more than just the above paragraph in just one small word.
> 
>>> I thought I could work with you on these issues; I don't know what
>>> happened over the past year since we last had a private conversation
>>> about this, but clearly you've changed your mind.
> 
> I got seriously annoyed with you about two years ago for the first time,
> but kept chatting for quite a while longer. Nothing changed. Like I said,
> I'm not complaining about this specific case here, but about a pattern
> that you've established consistently over a fair amount of time.
> 
> And if you're wondering why you didn't realize this: It's impossible to
> change people by telling them they're wrong. What does tend to work is
> explaining different perspectives, so that they can figure it out
> themselves. And sometimes that's just way too subtle to ever register.
> 
>>> Thus, as you kindly requested of me in social media,
>>>
>>> https://chaos.social/@sima/113961283260455876
>>>
>>> I will now proceed to fuck off. Good luck.
> 
> I wasn't fully awake yet this morning, but I have no issue standing behind
> that thread in it's entirety. Lightly edited for typos below, with one
> sentence added for a bit more context:
> 
> This isn't about "being civil" or "friendly" and even less about "don't
> call out". This is about calling out in an ineffective and imprecise way,
> so that the people actually trying to change things are busy patching up
> your collateral damage instead of implementing real changes, while all
> you've achieved is airing your frustration for internet drama points.
> 
> Aside from that I've learned through private feedback since my first mail
> here that your social media brigading has had much more of a chilling
> effect on contributors than I assumed, which is not acceptable.
> 
> When you're that harmful with your calling out, eventually I'm going to be
> fed up, and you get a live round shot across your bow. And if that then
> causes you to ragequit, because you can't actually deal with the heat
> you've been dishing out coming back around the corner:
> 
> Fuck off.
> 
> Or as Dave Airlie put it upthread in this conversation:
> 
> "Being toxic on the right side of an argument is still toxic, [...]"
> 
> So please do call out broken things, do change things, I've been doing it
> for well over a decade in the linux kernel. But do it in a way that you're
> not just becoming part of the problem and making it bigger.
> 
>> Oh, and one last thing. I've heard that, in whatever backroom
>> conversations you've been having about this situation, there has
>> apparently been a belief, explicit or implicit, that I am in any way
>> employed to work on the Linux kernel.
>>
>> Unlike most people in this thread, I don't enjoy the luxury of a cushy
>> tech job that pays me to deal with this community. I am supported
>> exclusively by donations, which incidentally, have been steadily
>> *de*creasing since the start of the Asahi Linux project. The project has
>> zero corporate sponsorship.
>>
>> And I do believe the fact that essentially all high-level Linux kernel
>> maintainers and contributors are paid by corporations to do it is a
>> major factor that has caused this community to become wildly out of
>> touch with what it means to be a community FOSS project.
> 
> I'm really not in favor of chiding people for how they earn money, because
> this world isn't fair and critizing people for how they get their bills
> paid is generally not ok. But this is a bit too much to just let it slide.
> 
> It's fairly plausible that you need the social media brigading to generate
> attention that you can convert into enough donations to support the asahi
> project. But someone has to clean up the mess your shitstorms create, it's
> sure not you, which means my and other people's mental health essentially
> pay your bills. And I really do not appreciate that dynamic.
> 

If I were trying to get more funds, I'd be spending my time finding
corporate sponsors, not documenting the failings of the Linux kernel
community in public. Believe it or not, no, the latter doesn't get me
more donations.

Given you have now decided to add "baseless public accusations from a
position of power" to the list of abuses perpetrated by Linux kernel
maintainers, I think it's about time we stop having this conversation.

- Hector

