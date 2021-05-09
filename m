Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 87B7C377927
	for <lists+dri-devel@lfdr.de>; Mon, 10 May 2021 01:11:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0173F6E826;
	Sun,  9 May 2021 23:11:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa34.google.com (mail-vk1-xa34.google.com
 [IPv6:2607:f8b0:4864:20::a34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC87D6E829
 for <dri-devel@lists.freedesktop.org>; Sun,  9 May 2021 23:11:49 +0000 (UTC)
Received: by mail-vk1-xa34.google.com with SMTP id k85so3010741vka.9
 for <dri-devel@lists.freedesktop.org>; Sun, 09 May 2021 16:11:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:date:message-id:in-reply-to:references:user-agent
 :subject:mime-version;
 bh=00NCB2RDtVupwamarX5wpT+VpODJVQ9vHAxE5hf5uX8=;
 b=NSyjmvN1svlPUnDB1lzmCIIlyVh/AWrDVnER6kAKYRNoF2ZCsWgMhB60tiJ5kHniiR
 rYXM42DKbXczEYvke/LWUWL1GNi8dz+b9XHJUGORhN2hiQ7MS7foZl0dwWj6W66z9yu0
 9LlIdqg8Z9j/mov8curaiprharCfdl9rn2MwI0SY4qwP/EnPg1v2OR/Wqp9W2i62Q/u1
 NUe7ZCkR8bPED/t23AECs59GfAOgTEPUyDg0JLMltgpu0CULHcNahbW+7p+j9MmRNsk9
 uTBOtaSv9kxLgqTszR8wkUgWdfq/BOStEMUnQln3sTc/v4fAfHDw0mWFy2X+derlYHab
 enug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:date:message-id:in-reply-to
 :references:user-agent:subject:mime-version;
 bh=00NCB2RDtVupwamarX5wpT+VpODJVQ9vHAxE5hf5uX8=;
 b=LVpcu9np0972BYp76alQGEKkrdlxxvtvij3JZ/ZbUqMdDTFyPfq3SX8sD7haR7Cuti
 k5yxcbwH98LnJBPOtNuCyUKrpW5BHO3eUinFWdDZQyeDbecRl1Cco0FmuHScIl1WBOI0
 lklr5tY/KtGVHgq/PMmMs1UwYLfzY04WeQifJ1G598n8SBuZyG8zOOIgkGttkwbDO+Di
 E4zFnLZ8ntaBACO8zKhH1QiugazsDYrvh+ZjSkGq4UfpASk02NLtNz/G9Q2l/U71u9ja
 mp3gfNBZ6H1I11qC6lJrjPyrB6HnciAx7b9qSgC4TdCjtWqFJp04C8LWdVfMK+3uorKV
 gnBw==
X-Gm-Message-State: AOAM5304GaG+WZjPh9s70ea9nBEItFbvWG2ByIg9JQM8xpFkEe3oakPF
 qOCizt7mooPAKTy+Z6sQXOUlEg==
X-Google-Smtp-Source: ABdhPJzbpEAP2K7T8kZip+BqLkxCg30SUfvtbPnR3RhJdFr4MPrCOKmaQEzNHpLYB5J4Dgv19U5k6Q==
X-Received: by 2002:a1f:5d87:: with SMTP id r129mr15571936vkb.13.1620601908850; 
 Sun, 09 May 2021 16:11:48 -0700 (PDT)
Received: from [100.79.42.25] ([209.107.177.191])
 by smtp.gmail.com with ESMTPSA id s136sm1247388vke.49.2021.05.09.16.11.46
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 09 May 2021 16:11:48 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: Martin Peres <martin.peres@free.fr>,
 Matthew Brost <matthew.brost@intel.com>, <intel-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>
Date: Sun, 09 May 2021 18:11:43 -0500
Message-ID: <17953669798.2817.c6988b7ea6112e3e892765a0d4287e0c@jlekstrand.net>
In-Reply-To: <d22437bd-8bb6-d7cb-c017-89cdc7da560d@free.fr>
References: <20210506191451.77768-1-matthew.brost@intel.com>
 <d22437bd-8bb6-d7cb-c017-89cdc7da560d@free.fr>
User-Agent: AquaMail/1.29.1-1808 (build: 102900007)
Subject: Re: [RFC PATCH 00/97] Basic GuC submission support in the i915
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="179536699f66e032817c832169"
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
--179536699f66e032817c832169
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 8bit

On May 9, 2021 12:12:36 Martin Peres <martin.peres@free.fr> wrote:

> Hi,
>
> On 06/05/2021 22:13, Matthew Brost wrote:
>> Basic GuC submission support. This is the first bullet point in the
>> upstreaming plan covered in the following RFC [1].
>>
>> At a very high level the GuC is a piece of firmware which sits between
>> the i915 and the GPU. It offloads some of the scheduling of contexts
>> from the i915 and programs the GPU to submit contexts. The i915
>> communicates with the GuC and the GuC communicates with the GPU.
>
> May I ask what will GuC command submission do that execlist won't/can't
> do? And what would be the impact on users? Even forgetting the troubled
> history of GuC (instability, performance regression, poor level of user
> support, 6+ years of trying to upstream it...), adding this much code
> and doubling the amount of validation needed should come with a
> rationale making it feel worth it... and I am not seeing here. Would you
> mind providing the rationale behind this work?
>
>>
>> GuC submission will be disabled by default on all current upstream
>> platforms behind a module parameter - enable_guc. A value of 3 will
>> enable submission and HuC loading via the GuC. GuC submission should
>> work on all gen11+ platforms assuming the GuC firmware is present.
>
> What is the plan here when it comes to keeping support for execlist? I
> am afraid that landing GuC support in Linux is the first step towards
> killing the execlist, which would force users to use proprietary
> firmwares that even most Intel engineers have little influence over.
> Indeed, if "drm/i915/guc: Disable semaphores when using GuC scheduling"
> which states "Disable semaphores when using GuC scheduling as semaphores
> are broken in the current GuC firmware." is anything to go by, it means
> that even Intel developers seem to prefer working around the GuC
> firmware, rather than fixing it.

Yes, landing GuC support may be the first step in removing execlist 
support. The inevitable reality is that GPU scheduling is coming and likely 
to be there only path in the not-too-distant future. (See also the ongoing 
thread with AMD about fences.) I'm not going to pass judgement on whether 
or not this is a good thing.  I'm just reading the winds and, in my view, 
this is where things are headed for good or ill.

In answer to the question above, the answer to "what do we gain from GuC?" 
may soon be, "you get to use your GPU."  We're not there yet and, again, 
I'm not necessarily advocating for it, but that is likely where things are 
headed.

A firmware-based submission model isn't a bad design IMO and, aside from 
the firmware freedom issues, I think there are actual advantages to the 
model. Immediately, it'll unlock a few features like parallel submission 
(more on that in a bit) and long-running compute because they're 
implemented in GuC and the work to implement them properly in the execlist 
scheduler is highly non-trivial. Longer term, it may (no guarantees) unlock 
some performance by getting the kernel out of the way.


> In the same vein, I have another concern related to the impact of GuC on
> Linux's stable releases. Let's say that in 3 years, a new application
> triggers a bug in command submission inside the firmware. Given that the
> Linux community cannot patch the GuC firmware, how likely is it that
> Intel would release a new GuC version? That would not be necessarily
> such a big problem if newer versions of the GuC could easily be
> backported to this potentially-decade-old Linux version, but given that
> the GuC seems to have ABI-breaking changes on a monthly cadence (we are
> at major version 60 *already*? :o), I would say that it is
> highly-unlikely that it would not require potentially-extensive changes
> to i915 to make it work, making the fix almost impossible to land in the
> stable tree... Do you have a plan to mitigate this problem?
>
> Patches like "drm/i915/guc: Disable bonding extension with GuC
> submission" also make me twitch, as this means the two command
> submission paths will not be functionally equivalent, and enabling GuC
> could thus introduce a user-visible regression (one app used to work,
> then stopped working). Could you add in the commit's message a proof
> that this would not end up being a user regression (in which case, why
> have this codepath to begin with?).

I'd like to address this one specifically as it's become something of a 
speciality of mine the past few weeks. The current bonded submission model 
is bad. It provides a plethora of ways for a client to back itself into a 
corner and doesn't actually provide the guarantees the media driver needs 
for its real-time high-resolution decode. It's bad enough we're seriously 
considering ripping it out, backwards compatibility or not. The good news 
is that very little that your average desktop user does depends on it: 
basically just real-time >4K video decode.

The new parallel submit API is much better and should be the path forward. 
(We should have landed parallel submit the first time around.) It isn't 
full of corners and does let us provides actual parallel execution 
guarantees. It also gives the scheduler the information it needs to 
reliably provide those guarantees.

If we need to support the parallel submit API with the execlist back-end, 
that's totally possible. The choice to only implement the parallel submit 
API with GuC is a pragmatic one. We're trying to get upstream back on it's 
feet and get all the various up-and-coming bits of hardware enabled. 
Enabling the new API in the execlist back-end makes that pipeline longer.


> Finally, could you explain why IGT tests need to be modified to work the
> GuC [1], and how much of the code in this series is covered by
> existing/upcoming tests? I would expect a very solid set of tests to
> minimize the maintenance burden, and enable users to reproduce potential
> issues found in this new codepath (too many users run with enable_guc=3,
> as can be seen on Google[2]).

The IGT changes, as I understand them, are entirely around switching to the 
new parallel submit API. There shouldn't be a major effect to most users.

--Jason

--179536699f66e032817c832169
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.=
w3.org/TR/html4/loose.dtd">
<html>
<body>
<div dir=3D"auto">
<div dir=3D"auto"><span style=3D"font-size: 12pt;">On May 9, 2021 12:12:36 =
Martin Peres &lt;martin.peres@free.fr&gt; wrote:</span></div><div id=3D"aqm=
-original" style=3D"color: black;">
<div><br></div>
<blockquote type=3D"cite" class=3D"gmail_quote" style=3D"margin: 0 0 0 0.75=
ex; border-left: 1px solid #808080; padding-left: 0.75ex;">
<div dir=3D"auto">Hi,</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">On 06/05/2021 22:13, Matthew Brost wrote:</div>
<blockquote type=3D"cite" class=3D"gmail_quote" style=3D"margin: 0 0 0 0.75=
ex; border-left: 1px solid #0099CC; padding-left: 0.75ex;">
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
st won't/can't&nbsp;</div>
<div dir=3D"auto">do? And what would be the impact on users? Even forgettin=
g the troubled&nbsp;</div>
<div dir=3D"auto">history of GuC (instability, performance regression, poor=
 level of user&nbsp;</div>
<div dir=3D"auto">support, 6+ years of trying to upstream it...), adding th=
is much code&nbsp;</div>
<div dir=3D"auto">and doubling the amount of validation needed should come =
with a&nbsp;</div>
<div dir=3D"auto">rationale making it feel worth it... and I am not seeing =
here. Would you&nbsp;</div>
<div dir=3D"auto">mind providing the rationale behind this work?</div>
<div dir=3D"auto"><br></div>
<blockquote type=3D"cite" class=3D"gmail_quote" style=3D"margin: 0 0 0 0.75=
ex; border-left: 1px solid #0099CC; padding-left: 0.75ex;">
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
r execlist? I&nbsp;</div>
<div dir=3D"auto">am afraid that landing GuC support in Linux is the first =
step towards&nbsp;</div>
<div dir=3D"auto">killing the execlist, which would force users to use prop=
rietary&nbsp;</div>
<div dir=3D"auto">firmwares that even most Intel engineers have little infl=
uence over.&nbsp;</div>
<div dir=3D"auto">Indeed, if "drm/i915/guc: Disable semaphores when using G=
uC scheduling"&nbsp;</div>
<div dir=3D"auto">which states "Disable semaphores when using GuC schedulin=
g as semaphores&nbsp;</div>
<div dir=3D"auto">are broken in the current GuC firmware." is anything to g=
o by, it means&nbsp;</div>
<div dir=3D"auto">that even Intel developers seem to prefer working around =
the GuC&nbsp;</div>
<div dir=3D"auto">firmware, rather than fixing it.</div></blockquote></div>=
<div dir=3D"auto"><br></div><div dir=3D"auto">Yes, landing GuC support may =
be the first step in removing execlist support. The inevitable reality is t=
hat GPU scheduling is coming and likely to be there only path in the not-to=
o-distant future. (See also the ongoing thread with AMD about fences.) I'm =
not going to pass judgement on whether or not this is a good thing.&nbsp; I=
'm just reading the winds and, in my view, this is where things are headed =
for good or ill.</div><div dir=3D"auto"><br></div><div dir=3D"auto">In answ=
er to the question above, the answer to "what do we gain from GuC?" may soo=
n be, "you get to use your GPU."&nbsp; We're not there yet and, again, I'm =
not necessarily advocating for it, but that is likely where things are head=
ed.</div><div dir=3D"auto"><br></div><div dir=3D"auto">A firmware-based sub=
mission model isn't a bad design IMO and, aside from the firmware freedom i=
ssues, I think there are actual advantages to the model. Immediately, it'll=
 unlock a few features like parallel submission (more on that in a bit) and=
 long-running compute because they're implemented in GuC and the work to im=
plement them properly in the execlist scheduler is highly non-trivial. Long=
er term, it may (no guarantees) unlock some performance by getting the kern=
el out of the way.&nbsp;</div><div dir=3D"auto"><br></div><div dir=3D"auto"=
><br></div><div id=3D"aqm-original" style=3D"color: black;" dir=3D"auto"><b=
lockquote type=3D"cite" class=3D"gmail_quote" style=3D"margin: 0 0 0 0.75ex=
; border-left: 1px solid #808080; padding-left: 0.75ex;">
<div dir=3D"auto">In the same vein, I have another concern related to the i=
mpact of GuC on&nbsp;</div>
<div dir=3D"auto">Linux's stable releases. Let's say that in 3 years, a new=
 application&nbsp;</div>
<div dir=3D"auto">triggers a bug in command submission inside the firmware.=
 Given that the&nbsp;</div>
<div dir=3D"auto">Linux community cannot patch the GuC firmware, how likely=
 is it that&nbsp;</div>
<div dir=3D"auto">Intel would release a new GuC version? That would not be =
necessarily&nbsp;</div>
<div dir=3D"auto">such a big problem if newer versions of the GuC could eas=
ily be&nbsp;</div>
<div dir=3D"auto">backported to this potentially-decade-old Linux version, =
but given that&nbsp;</div>
<div dir=3D"auto">the GuC seems to have ABI-breaking changes on a monthly c=
adence (we are&nbsp;</div>
<div dir=3D"auto">at major version 60 *already*? :o), I would say that it i=
s&nbsp;</div>
<div dir=3D"auto">highly-unlikely that it would not require potentially-ext=
ensive changes&nbsp;</div>
<div dir=3D"auto">to i915 to make it work, making the fix almost impossible=
 to land in the&nbsp;</div>
<div dir=3D"auto">stable tree... Do you have a plan to mitigate this proble=
m?</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">Patches like "drm/i915/guc: Disable bonding extension wit=
h GuC&nbsp;</div>
<div dir=3D"auto">submission" also make me twitch, as this means the two co=
mmand&nbsp;</div>
<div dir=3D"auto">submission paths will not be functionally equivalent, and=
 enabling GuC&nbsp;</div>
<div dir=3D"auto">could thus introduce a user-visible regression (one app u=
sed to work,&nbsp;</div>
<div dir=3D"auto">then stopped working). Could you add in the commit's mess=
age a proof&nbsp;</div>
<div dir=3D"auto">that this would not end up being a user regression (in wh=
ich case, why&nbsp;</div>
<div dir=3D"auto">have this codepath to begin with?).</div></blockquote></d=
iv><div dir=3D"auto"><br></div><div dir=3D"auto">I'd like to address this o=
ne specifically as it's become something of a speciality of mine the past f=
ew weeks. The current bonded submission model is bad. It provides a plethor=
a of ways for a client to back itself into a corner and doesn't actually pr=
ovide the guarantees the media driver needs for its real-time high-resoluti=
on decode. It's bad enough we're seriously considering ripping it out, back=
wards compatibility or not. The good news is that very little that your ave=
rage desktop user does depends on it: basically just real-time &gt;4K video=
 decode.</div><div dir=3D"auto"><br></div><div dir=3D"auto">The new paralle=
l submit API is much better and should be the path forward. (We should have=
 landed parallel submit the first time around.) It isn't full of corners an=
d does let us provides actual parallel execution guarantees. It also gives =
the scheduler the information it needs to reliably provide those guarantees=
.</div><div dir=3D"auto"><br></div><div dir=3D"auto">If we need to support =
the parallel submit API with the execlist back-end, that's totally possible=
. The choice to only implement the parallel submit API with GuC is a pragma=
tic one. We're trying to get upstream back on it's feet and get all the var=
ious up-and-coming bits of hardware enabled. Enabling the new API in the ex=
eclist back-end makes that pipeline longer.</div><div dir=3D"auto"><br></di=
v><div dir=3D"auto"><br></div><div id=3D"aqm-original" style=3D"color: blac=
k;" dir=3D"auto"><blockquote type=3D"cite" class=3D"gmail_quote" style=3D"m=
argin: 0 0 0 0.75ex; border-left: 1px solid #808080; padding-left: 0.75ex;"=
><div dir=3D"auto"></div>
<div dir=3D"auto">Finally, could you explain why IGT tests need to be modif=
ied to work the&nbsp;</div>
<div dir=3D"auto">GuC [1], and how much of the code in this series is cover=
ed by&nbsp;</div>
<div dir=3D"auto">existing/upcoming tests? I would expect a very solid set =
of tests to&nbsp;</div>
<div dir=3D"auto">minimize the maintenance burden, and enable users to repr=
oduce potential&nbsp;</div>
<div dir=3D"auto">issues found in this new codepath (too many users run wit=
h enable_guc=3D3,&nbsp;</div>
<div dir=3D"auto">as can be seen on Google[2]).</div></blockquote></div><di=
v dir=3D"auto"><br></div><div dir=3D"auto">The IGT changes, as I understand=
 them, are entirely around switching to the new parallel submit API. There =
shouldn't be a major effect to most users.</div><div dir=3D"auto"><br></div=
><div dir=3D"auto">--Jason</div>
</div></body>
</html>

--179536699f66e032817c832169--

