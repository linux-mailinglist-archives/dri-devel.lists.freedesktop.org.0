Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 71E553793BC
	for <lists+dri-devel@lfdr.de>; Mon, 10 May 2021 18:26:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 744216E89B;
	Mon, 10 May 2021 16:26:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x932.google.com (mail-ua1-x932.google.com
 [IPv6:2607:f8b0:4864:20::932])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 646A16E89A
 for <dri-devel@lists.freedesktop.org>; Mon, 10 May 2021 16:26:05 +0000 (UTC)
Received: by mail-ua1-x932.google.com with SMTP id x9so5413261uao.3
 for <dri-devel@lists.freedesktop.org>; Mon, 10 May 2021 09:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:date:message-id:in-reply-to:references:user-agent
 :subject:mime-version;
 bh=9gYoyR6Vo85KSJdT/ewg0u6GZWrYaWOIdM2Op+La4oQ=;
 b=sjZC/e98BCdso1Rh/ZsGJroWvK4FGrkhusvm/Td8Jaes/6Sv9ThC6v6fn5plQZSEe7
 mWyFSZ+/Db91RloWy6VH8eoPmj1tC+4Mp2cS7S1yZ4Yj1sD92cPlQthd8Qo2kFBwOm45
 HMxwvYnU9XXj1Q4i7m2CHuKNGo9WCCEdqXDZasOY9Or2knMeu/o6MO/iCwT8OrzArUMv
 OCmS/2Hz+6T7t//kSn7izgf0f8xmI21Cd5BwnsUBfN9mnoVe/M68vjOhLgFMUTUBy6mk
 RyAicuVcrKcjHepp1cQuzJ82ESKK2ZJRIVX0SxirirRdFfWhkFMzKHjsZZRq0sKpbQir
 WL1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:date:message-id:in-reply-to
 :references:user-agent:subject:mime-version;
 bh=9gYoyR6Vo85KSJdT/ewg0u6GZWrYaWOIdM2Op+La4oQ=;
 b=j/LAejyr7c67BzxScF+16wZ9eHaMvTPznOoSxDOlJwDHrG6gRnrPsMUl9lOFsuH6Y1
 qeIQiy3jo9udrU5e4e93rG+5Emh8lb815Xy1eE7mbCsIGYqM3OELJ8XvjlrWEuPMlOvt
 1j35i7MHUriFMb3rgcbf9C178tTH7S5s+lT8v/zM91o4knwgU6PnJb17rxLL8SHVYKgw
 bPx+l/cj9kxja3wsDKWpBUeSe54ncYi9+NRjH9zRPvxJbyQqS1LlCIGZsUfb0gKh71OK
 UhIWgKW/+k777OMWL5XTZTSQm5deuUrhWfYbZws7zuS3EXCQKyxAKaFLb2Jisoby8NPS
 I4gw==
X-Gm-Message-State: AOAM532gWFmx0TyaHiJwFvwF22J5dyrLpgGVCgvWLvFxu984K74pcRMx
 ghF2ScGTxlDn1JSqR4xTuXfVkw==
X-Google-Smtp-Source: ABdhPJzC9ZOp9O1oJ9UjHhi5lu6AvyeRja7Jp5sdtEMNy9LGy6AmnMmpYU7vcgF6poyhy+vzXWTqaw==
X-Received: by 2002:a9f:2183:: with SMTP id 3mr20665365uac.0.1620663964376;
 Mon, 10 May 2021 09:26:04 -0700 (PDT)
Received: from [100.79.42.25] ([209.107.177.191])
 by smtp.gmail.com with ESMTPSA id l1sm1911982uao.20.2021.05.10.09.26.01
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 10 May 2021 09:26:03 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: Martin Peres <martin.peres@free.fr>,
 Matthew Brost <matthew.brost@intel.com>, <intel-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>
Date: Mon, 10 May 2021 11:25:59 -0500
Message-ID: <17957197dd8.2817.c6988b7ea6112e3e892765a0d4287e0c@jlekstrand.net>
In-Reply-To: <546e4ee4-9aa4-1967-cdcb-a561cac582ef@free.fr>
References: <20210506191451.77768-1-matthew.brost@intel.com>
 <d22437bd-8bb6-d7cb-c017-89cdc7da560d@free.fr>
 <17953669798.2817.c6988b7ea6112e3e892765a0d4287e0c@jlekstrand.net>
 <546e4ee4-9aa4-1967-cdcb-a561cac582ef@free.fr>
User-Agent: AquaMail/1.29.1-1808 (build: 102900007)
Subject: Re: [RFC PATCH 00/97] Basic GuC submission support in the i915
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="179571980ab6e0328173119716"
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
Cc: tvrtko.ursulin@intel.com, jason.ekstrand@intel.com,
 daniele.ceraolospurio@intel.com, jon.bloomfield@intel.com,
 daniel.vetter@intel.com, john.c.harrison@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--179571980ab6e0328173119716
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 8bit

On May 10, 2021 08:55:55 Martin Peres <martin.peres@free.fr> wrote:

> On 10/05/2021 02:11, Jason Ekstrand wrote:
>> On May 9, 2021 12:12:36 Martin Peres <martin.peres@free.fr> wrote:
>>
>>> Hi,
>>>
>>> On 06/05/2021 22:13, Matthew Brost wrote:
>>>> Basic GuC submission support. This is the first bullet point in the
>>>> upstreaming plan covered in the following RFC [1].
>>>>
>>>> At a very high level the GuC is a piece of firmware which sits between
>>>> the i915 and the GPU. It offloads some of the scheduling of contexts
>>>> from the i915 and programs the GPU to submit contexts. The i915
>>>> communicates with the GuC and the GuC communicates with the GPU.
>>>
>>> May I ask what will GuC command submission do that execlist won't/can't
>>> do? And what would be the impact on users? Even forgetting the troubled
>>> history of GuC (instability, performance regression, poor level of user
>>> support, 6+ years of trying to upstream it...), adding this much code
>>> and doubling the amount of validation needed should come with a
>>> rationale making it feel worth it... and I am not seeing here. Would you
>>> mind providing the rationale behind this work?
>>>
>>>>
>>>> GuC submission will be disabled by default on all current upstream
>>>> platforms behind a module parameter - enable_guc. A value of 3 will
>>>> enable submission and HuC loading via the GuC. GuC submission should
>>>> work on all gen11+ platforms assuming the GuC firmware is present.
>>>
>>> What is the plan here when it comes to keeping support for execlist? I
>>> am afraid that landing GuC support in Linux is the first step towards
>>> killing the execlist, which would force users to use proprietary
>>> firmwares that even most Intel engineers have little influence over.
>>> Indeed, if "drm/i915/guc: Disable semaphores when using GuC scheduling"
>>> which states "Disable semaphores when using GuC scheduling as semaphores
>>> are broken in the current GuC firmware." is anything to go by, it means
>>> that even Intel developers seem to prefer working around the GuC
>>> firmware, rather than fixing it.
>>
>> Yes, landing GuC support may be the first step in removing execlist
>> support. The inevitable reality is that GPU scheduling is coming and
>> likely to be there only path in the not-too-distant future. (See also
>> the ongoing thread with AMD about fences.) I'm not going to pass
>> judgement on whether or not this is a good thing.  I'm just reading the
>> winds and, in my view, this is where things are headed for good or ill.
>>
>> In answer to the question above, the answer to "what do we gain from
>> GuC?" may soon be, "you get to use your GPU."  We're not there yet and,
>> again, I'm not necessarily advocating for it, but that is likely where
>> things are headed.
>
> This will be a sad day, especially since it seems fundamentally opposed
> with any long-term support, on top of taking away user freedom to
> fix/tweak their system when Intel won't.
>
>> A firmware-based submission model isn't a bad design IMO and, aside from
>> the firmware freedom issues, I think there are actual advantages to the
>> model. Immediately, it'll unlock a few features like parallel submission
>> (more on that in a bit) and long-running compute because they're
>> implemented in GuC and the work to implement them properly in the
>> execlist scheduler is highly non-trivial. Longer term, it may (no
>> guarantees) unlock some performance by getting the kernel out of the way.
>
> Oh, I definitely agree with firmware-based submission model not being a
> bad design. I was even cheering for it in 2015. Experience with it made
> me regret that deeply since :s
>
> But with the DRM scheduler being responsible for most things, I fail to
> see what we could offload in the GuC except context switching (like
> every other manufacturer). The problem is, the GuC does way more than
> just switching registers in bulk, and if the number of revisions of the
> GuC is anything to go by, it is way too complex for me to feel
> comfortable with it.

It's more than just bulk register writes. When it comes to load-balancing 
multiple GPU users, firmware can theoretically preempt and switch faster 
leading to more efficient time-slicing. All we really need the DRM 
scheduler for is handling implicit dma_fence dependencies between different 
applications.


>
>>> In the same vein, I have another concern related to the impact of GuC on
>>> Linux's stable releases. Let's say that in 3 years, a new application
>>> triggers a bug in command submission inside the firmware. Given that the
>>> Linux community cannot patch the GuC firmware, how likely is it that
>>> Intel would release a new GuC version? That would not be necessarily
>>> such a big problem if newer versions of the GuC could easily be
>>> backported to this potentially-decade-old Linux version, but given that
>>> the GuC seems to have ABI-breaking changes on a monthly cadence (we are
>>> at major version 60 *already*? :o), I would say that it is
>>> highly-unlikely that it would not require potentially-extensive changes
>>> to i915 to make it work, making the fix almost impossible to land in the
>>> stable tree... Do you have a plan to mitigate this problem?
>>>
>>> Patches like "drm/i915/guc: Disable bonding extension with GuC
>>> submission" also make me twitch, as this means the two command
>>> submission paths will not be functionally equivalent, and enabling GuC
>>> could thus introduce a user-visible regression (one app used to work,
>>> then stopped working). Could you add in the commit's message a proof
>>> that this would not end up being a user regression (in which case, why
>>> have this codepath to begin with?).
>>
>> I'd like to address this one specifically as it's become something of a
>> speciality of mine the past few weeks. The current bonded submission
>> model is bad. It provides a plethora of ways for a client to back itself
>> into a corner and doesn't actually provide the guarantees the media
>> driver needs for its real-time high-resolution decode. It's bad enough
>> we're seriously considering ripping it out, backwards compatibility or
>> not. The good news is that very little that your average desktop user
>> does depends on it: basically just real-time >4K video decode.
>>
>> The new parallel submit API is much better and should be the path
>> forward. (We should have landed parallel submit the first time around.)
>> It isn't full of corners and does let us provides actual parallel
>> execution guarantees. It also gives the scheduler the information it
>> needs to reliably provide those guarantees. >
>> If we need to support the parallel submit API with the execlist
>> back-end, that's totally possible. The choice to only implement the
>> parallel submit API with GuC is a pragmatic one. We're trying to get
>> upstream back on it's feet and get all the various up-and-coming bits of
>> hardware enabled. Enabling the new API in the execlist back-end makes
>> that pipeline longer.
>
> I feel your pain, and wish you all the best to get GEM less complex
> and more manageable.
>
> So, if I understood correctly, the plan is just to regress 4K+ video
> decoding for people who do not enable GuC scheduling, or did not also
> update to a recent-enough media driver that would support this new
> interface? If it is indeed only for over 4K videos, then whatever. If it
> is 4K, it starts being a little bad, assuming graceful fallback to
> CPU-based decoding. What's the test plan for this patch then? The patch
> in its current form is definitely not making me confident.

My understanding is that it's only >4k that's affected; we've got enough 
bandwidth on a single VCS for 4K. I'm not sure where the exact cut-off is 
(it may be a little higher than 4k) but real-time 4k should be fine and 
real-time 8k requires parallel submit. So we're really not cutting off many 
use-cases. Also, as I said above, the new API can be implemented with the 
execlist scheduler if needed. We've just pragmatically deprioritized it.

--Jason


>
>>> Finally, could you explain why IGT tests need to be modified to work the
>>> GuC [1], and how much of the code in this series is covered by
>>> existing/upcoming tests? I would expect a very solid set of tests to
>>> minimize the maintenance burden, and enable users to reproduce potential
>>> issues found in this new codepath (too many users run with enable_guc=3,
>>> as can be seen on Google[2]).
>>
>> The IGT changes, as I understand them, are entirely around switching to
>> the new parallel submit API. There shouldn't be a major effect to most
>> users.
>
> Right, this part I followed, but failed to connect it to the GuC...
> because I couldn't see why it would be needed (execlist requiring a lot
> more work).
>
> I sincerely wish for the GuC to stay away from upstream because of the
> above concerns (which are yet to be addressed), but if Intel were to
> push forward with the plan to drop execlist, I can foresee a world of
> trouble for users... That is of course unless the GuC were to be open
> sourced, with people outside of Intel able to sign their own builds or
> run unsigned. Failing that, let's hope the last 6 years were just a bad
> start, and the rapid climb in major version of the GuC will magically
> stop! I hope execlists will remain at feature parity with the GuC when
> possible... but deplore the increase in validation needs which will only
> hurt users in the end.
>
> Thanks for your honest answer,
> Martin
>
>>
>> --Jason


--179571980ab6e0328173119716
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.=
w3.org/TR/html4/loose.dtd">
<html>
<body>
<div dir=3D"auto">
<div dir=3D"auto"><span style=3D"font-size: 12pt;">On May 10, 2021 08:55:55=
 Martin Peres &lt;martin.peres@free.fr&gt; wrote:</span></div><div id=3D"aq=
m-original" style=3D"color: black;">
<div><br></div>
<blockquote type=3D"cite" class=3D"gmail_quote" style=3D"margin: 0 0 0 0.75=
ex; border-left: 1px solid #808080; padding-left: 0.75ex;">
<div dir=3D"auto">On 10/05/2021 02:11, Jason Ekstrand wrote:</div>
<blockquote type=3D"cite" class=3D"gmail_quote" style=3D"margin: 0 0 0 0.75=
ex; border-left: 1px solid #0099CC; padding-left: 0.75ex;">
<div dir=3D"auto">On May 9, 2021 12:12:36 Martin Peres &lt;martin.peres@fre=
e.fr&gt; wrote:</div>
<div dir=3D"auto"><br></div>
<blockquote type=3D"cite" class=3D"gmail_quote" style=3D"margin: 0 0 0 0.75=
ex; border-left: 1px solid #9933CC; padding-left: 0.75ex;">
<div dir=3D"auto">Hi,</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">On 06/05/2021 22:13, Matthew Brost wrote:</div>
<blockquote type=3D"cite" class=3D"gmail_quote" style=3D"margin: 0 0 0 0.75=
ex; border-left: 1px solid #669900; padding-left: 0.75ex;">
<div dir=3D"auto">Basic GuC submission support. This is the first bullet po=
int in the</div>
<div dir=3D"auto">upstreaming plan covered in the following RFC [1].</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">At a very high level the GuC is a piece of firmware which=
 sits between</div>
<div dir=3D"auto">the i915 and the GPU. It offloads some of the scheduling =
of contexts</div>
<div dir=3D"auto">from the i915 and programs the GPU to submit contexts. Th=
e i915</div>
<div dir=3D"auto">communicates with the GuC and the GuC communicates with t=
he GPU.</div>
</blockquote>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">May I ask what will GuC command submission do that execli=
st won't/can't</div>
<div dir=3D"auto">do? And what would be the impact on users? Even forgettin=
g the troubled</div>
<div dir=3D"auto">history of GuC (instability, performance regression, poor=
 level of user</div>
<div dir=3D"auto">support, 6+ years of trying to upstream it...), adding th=
is much code</div>
<div dir=3D"auto">and doubling the amount of validation needed should come =
with a</div>
<div dir=3D"auto">rationale making it feel worth it... and I am not seeing =
here. Would you</div>
<div dir=3D"auto">mind providing the rationale behind this work?</div>
<div dir=3D"auto"><br></div>
<blockquote type=3D"cite" class=3D"gmail_quote" style=3D"margin: 0 0 0 0.75=
ex; border-left: 1px solid #669900; padding-left: 0.75ex;">
<div dir=3D"auto"><br></div>
<div dir=3D"auto">GuC submission will be disabled by default on all current=
 upstream</div>
<div dir=3D"auto">platforms behind a module parameter - enable_guc. A value=
 of 3 will</div>
<div dir=3D"auto">enable submission and HuC loading via the GuC. GuC submis=
sion should</div>
<div dir=3D"auto">work on all gen11+ platforms assuming the GuC firmware is=
 present.</div>
</blockquote>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">What is the plan here when it comes to keeping support fo=
r execlist? I</div>
<div dir=3D"auto">am afraid that landing GuC support in Linux is the first =
step towards</div>
<div dir=3D"auto">killing the execlist, which would force users to use prop=
rietary</div>
<div dir=3D"auto">firmwares that even most Intel engineers have little infl=
uence over.</div>
<div dir=3D"auto">Indeed, if "drm/i915/guc: Disable semaphores when using G=
uC scheduling"</div>
<div dir=3D"auto">which states "Disable semaphores when using GuC schedulin=
g as semaphores</div>
<div dir=3D"auto">are broken in the current GuC firmware." is anything to g=
o by, it means</div>
<div dir=3D"auto">that even Intel developers seem to prefer working around =
the GuC</div>
<div dir=3D"auto">firmware, rather than fixing it.</div>
</blockquote>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">Yes, landing GuC support may be the first step in removin=
g execlist&nbsp;</div>
<div dir=3D"auto">support. The inevitable reality is that GPU scheduling is=
 coming and&nbsp;</div>
<div dir=3D"auto">likely to be there only path in the not-too-distant futur=
e. (See also&nbsp;</div>
<div dir=3D"auto">the ongoing thread with AMD about fences.) I'm not going =
to pass&nbsp;</div>
<div dir=3D"auto">judgement on whether or not this is a good thing.&nbsp; I=
'm just reading the&nbsp;</div>
<div dir=3D"auto">winds and, in my view, this is where things are headed fo=
r good or ill.</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">In answer to the question above, the answer to "what do w=
e gain from&nbsp;</div>
<div dir=3D"auto">GuC?" may soon be, "you get to use your GPU."&nbsp; We're=
 not there yet and,&nbsp;</div>
<div dir=3D"auto">again, I'm not necessarily advocating for it, but that is=
 likely where&nbsp;</div>
<div dir=3D"auto">things are headed.</div>
</blockquote>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">This will be a sad day, especially since it seems fundame=
ntally opposed&nbsp;</div>
<div dir=3D"auto">with any long-term support, on top of taking away user fr=
eedom to&nbsp;</div>
<div dir=3D"auto">fix/tweak their system when Intel won't.</div>
<div dir=3D"auto"><br></div>
<blockquote type=3D"cite" class=3D"gmail_quote" style=3D"margin: 0 0 0 0.75=
ex; border-left: 1px solid #0099CC; padding-left: 0.75ex;">
<div dir=3D"auto">A firmware-based submission model isn't a bad design IMO =
and, aside from&nbsp;</div>
<div dir=3D"auto">the firmware freedom issues, I think there are actual adv=
antages to the&nbsp;</div>
<div dir=3D"auto">model. Immediately, it'll unlock a few features like para=
llel submission&nbsp;</div>
<div dir=3D"auto">(more on that in a bit) and long-running compute because =
they're&nbsp;</div>
<div dir=3D"auto">implemented in GuC and the work to implement them properl=
y in the&nbsp;</div>
<div dir=3D"auto">execlist scheduler is highly non-trivial. Longer term, it=
 may (no&nbsp;</div>
<div dir=3D"auto">guarantees) unlock some performance by getting the kernel=
 out of the way.</div>
</blockquote>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">Oh, I definitely agree with firmware-based submission mod=
el not being a&nbsp;</div>
<div dir=3D"auto">bad design. I was even cheering for it in 2015. Experienc=
e with it made&nbsp;</div>
<div dir=3D"auto">me regret that deeply since :s</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">But with the DRM scheduler being responsible for most thi=
ngs, I fail to&nbsp;</div>
<div dir=3D"auto">see what we could offload in the GuC except context switc=
hing (like&nbsp;</div>
<div dir=3D"auto">every other manufacturer). The problem is, the GuC does w=
ay more than&nbsp;</div>
<div dir=3D"auto">just switching registers in bulk, and if the number of re=
visions of the&nbsp;</div>
<div dir=3D"auto">GuC is anything to go by, it is way too complex for me to=
 feel&nbsp;</div>
<div dir=3D"auto">comfortable with it.</div></blockquote></div><div dir=3D"=
auto"><br></div><div dir=3D"auto">It's more than just bulk register writes.=
 When it comes to load-balancing multiple GPU users, firmware can theoretic=
ally preempt and switch faster leading to more efficient time-slicing. All =
we really need the DRM scheduler for is handling implicit dma_fence depende=
ncies between different applications.</div><div dir=3D"auto"><br></div><div=
 dir=3D"auto"><br></div><div id=3D"aqm-original" style=3D"color: black;" di=
r=3D"auto"><blockquote type=3D"cite" class=3D"gmail_quote" style=3D"margin:=
 0 0 0 0.75ex; border-left: 1px solid #808080; padding-left: 0.75ex;"><div =
dir=3D"auto"></div><blockquote type=3D"cite" class=3D"gmail_quote" style=3D=
"margin: 0 0 0 0.75ex; border-left: 1px solid #0099CC; padding-left: 0.75ex=
;">
<blockquote type=3D"cite" class=3D"gmail_quote" style=3D"margin: 0 0 0 0.75=
ex; border-left: 1px solid #9933CC; padding-left: 0.75ex;">
<div dir=3D"auto">In the same vein, I have another concern related to the i=
mpact of GuC on</div>
<div dir=3D"auto">Linux's stable releases. Let's say that in 3 years, a new=
 application</div>
<div dir=3D"auto">triggers a bug in command submission inside the firmware.=
 Given that the</div>
<div dir=3D"auto">Linux community cannot patch the GuC firmware, how likely=
 is it that</div>
<div dir=3D"auto">Intel would release a new GuC version? That would not be =
necessarily</div>
<div dir=3D"auto">such a big problem if newer versions of the GuC could eas=
ily be</div>
<div dir=3D"auto">backported to this potentially-decade-old Linux version, =
but given that</div>
<div dir=3D"auto">the GuC seems to have ABI-breaking changes on a monthly c=
adence (we are</div>
<div dir=3D"auto">at major version 60 *already*? :o), I would say that it i=
s</div>
<div dir=3D"auto">highly-unlikely that it would not require potentially-ext=
ensive changes</div>
<div dir=3D"auto">to i915 to make it work, making the fix almost impossible=
 to land in the</div>
<div dir=3D"auto">stable tree... Do you have a plan to mitigate this proble=
m?</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">Patches like "drm/i915/guc: Disable bonding extension wit=
h GuC</div>
<div dir=3D"auto">submission" also make me twitch, as this means the two co=
mmand</div>
<div dir=3D"auto">submission paths will not be functionally equivalent, and=
 enabling GuC</div>
<div dir=3D"auto">could thus introduce a user-visible regression (one app u=
sed to work,</div>
<div dir=3D"auto">then stopped working). Could you add in the commit's mess=
age a proof</div>
<div dir=3D"auto">that this would not end up being a user regression (in wh=
ich case, why</div>
<div dir=3D"auto">have this codepath to begin with?).</div>
</blockquote>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">I'd like to address this one specifically as it's become =
something of a&nbsp;</div>
<div dir=3D"auto">speciality of mine the past few weeks. The current bonded=
 submission&nbsp;</div>
<div dir=3D"auto">model is bad. It provides a plethora of ways for a client=
 to back itself&nbsp;</div>
<div dir=3D"auto">into a corner and doesn't actually provide the guarantees=
 the media&nbsp;</div>
<div dir=3D"auto">driver needs for its real-time high-resolution decode. It=
's bad enough&nbsp;</div>
<div dir=3D"auto">we're seriously considering ripping it out, backwards com=
patibility or&nbsp;</div>
<div dir=3D"auto">not. The good news is that very little that your average =
desktop user&nbsp;</div>
<div dir=3D"auto">does depends on it: basically just real-time &gt;4K video=
 decode.</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">The new parallel submit API is much better and should be =
the path&nbsp;</div>
<div dir=3D"auto">forward. (We should have landed parallel submit the first=
 time around.)&nbsp;</div>
<div dir=3D"auto">It isn't full of corners and does let us provides actual =
parallel&nbsp;</div>
<div dir=3D"auto">execution guarantees. It also gives the scheduler the inf=
ormation it&nbsp;</div>
<div dir=3D"auto">needs to reliably provide those guarantees. &gt;</div>
<div dir=3D"auto">If we need to support the parallel submit API with the ex=
eclist&nbsp;</div>
<div dir=3D"auto">back-end, that's totally possible. The choice to only imp=
lement the&nbsp;</div>
<div dir=3D"auto">parallel submit API with GuC is a pragmatic one. We're tr=
ying to get&nbsp;</div>
<div dir=3D"auto">upstream back on it's feet and get all the various up-and=
-coming bits of&nbsp;</div>
<div dir=3D"auto">hardware enabled. Enabling the new API in the execlist ba=
ck-end makes&nbsp;</div>
<div dir=3D"auto">that pipeline longer.</div>
</blockquote>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">I feel your pain, and wish you all the best to get GEM le=
ss complex</div>
<div dir=3D"auto">and more manageable.</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">So, if I understood correctly, the plan is just to regres=
s 4K+ video&nbsp;</div>
<div dir=3D"auto">decoding for people who do not enable GuC scheduling, or =
did not also&nbsp;</div>
<div dir=3D"auto">update to a recent-enough media driver that would support=
 this new&nbsp;</div>
<div dir=3D"auto">interface? If it is indeed only for over 4K videos, then =
whatever. If it&nbsp;</div>
<div dir=3D"auto">is 4K, it starts being a little bad, assuming graceful fa=
llback to&nbsp;</div>
<div dir=3D"auto">CPU-based decoding. What's the test plan for this patch t=
hen? The patch&nbsp;</div>
<div dir=3D"auto">in its current form is definitely not making me confident=
.</div></blockquote></div><div dir=3D"auto"><br></div><div dir=3D"auto">My =
understanding is that it's only &gt;4k that's affected; we've got enough ba=
ndwidth on a single VCS for 4K. I'm not sure where the exact cut-off is (it=
 may be a little higher than 4k) but real-time 4k should be fine and real-t=
ime 8k requires parallel submit. So we're really not cutting off many use-c=
ases. Also, as I said above, the new API can be implemented with the execli=
st scheduler if needed. We've just pragmatically deprioritized it.</div><di=
v dir=3D"auto"><br></div><div dir=3D"auto">--Jason</div><div dir=3D"auto"><=
br></div><div dir=3D"auto"><br></div><div id=3D"aqm-original" style=3D"colo=
r: black;" dir=3D"auto"><blockquote type=3D"cite" class=3D"gmail_quote" sty=
le=3D"margin: 0 0 0 0.75ex; border-left: 1px solid #808080; padding-left: 0=
.75ex;"><div dir=3D"auto"></div><blockquote type=3D"cite" class=3D"gmail_qu=
ote" style=3D"margin: 0 0 0 0.75ex; border-left: 1px solid #0099CC; padding=
-left: 0.75ex;">
<blockquote type=3D"cite" class=3D"gmail_quote" style=3D"margin: 0 0 0 0.75=
ex; border-left: 1px solid #9933CC; padding-left: 0.75ex;">
<div dir=3D"auto">Finally, could you explain why IGT tests need to be modif=
ied to work the</div>
<div dir=3D"auto">GuC [1], and how much of the code in this series is cover=
ed by</div>
<div dir=3D"auto">existing/upcoming tests? I would expect a very solid set =
of tests to</div>
<div dir=3D"auto">minimize the maintenance burden, and enable users to repr=
oduce potential</div>
<div dir=3D"auto">issues found in this new codepath (too many users run wit=
h enable_guc=3D3,</div>
<div dir=3D"auto">as can be seen on Google[2]).</div>
</blockquote>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">The IGT changes, as I understand them, are entirely aroun=
d switching to&nbsp;</div>
<div dir=3D"auto">the new parallel submit API. There shouldn't be a major e=
ffect to most&nbsp;</div>
<div dir=3D"auto">users.</div>
</blockquote>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">Right, this part I followed, but failed to connect it to =
the GuC...&nbsp;</div>
<div dir=3D"auto">because I couldn't see why it would be needed (execlist r=
equiring a lot&nbsp;</div>
<div dir=3D"auto">more work).</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">I sincerely wish for the GuC to stay away from upstream b=
ecause of the&nbsp;</div>
<div dir=3D"auto">above concerns (which are yet to be addressed), but if In=
tel were to&nbsp;</div>
<div dir=3D"auto">push forward with the plan to drop execlist, I can forese=
e a world of&nbsp;</div>
<div dir=3D"auto">trouble for users... That is of course unless the GuC wer=
e to be open&nbsp;</div>
<div dir=3D"auto">sourced, with people outside of Intel able to sign their =
own builds or&nbsp;</div>
<div dir=3D"auto">run unsigned. Failing that, let's hope the last 6 years w=
ere just a bad&nbsp;</div>
<div dir=3D"auto">start, and the rapid climb in major version of the GuC wi=
ll magically&nbsp;</div>
<div dir=3D"auto">stop! I hope execlists will remain at feature parity with=
 the GuC when&nbsp;</div>
<div dir=3D"auto">possible... but deplore the increase in validation needs =
which will only&nbsp;</div>
<div dir=3D"auto">hurt users in the end.</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">Thanks for your honest answer,</div>
<div dir=3D"auto">Martin</div>
<div dir=3D"auto"><br></div>
<blockquote type=3D"cite" class=3D"gmail_quote" style=3D"margin: 0 0 0 0.75=
ex; border-left: 1px solid #0099CC; padding-left: 0.75ex;">
<div dir=3D"auto"><br></div>
<div dir=3D"auto">--Jason</div>
</blockquote>
</blockquote>
</div><div dir=3D"auto"><br></div>
</div></body>
</html>

--179571980ab6e0328173119716--

