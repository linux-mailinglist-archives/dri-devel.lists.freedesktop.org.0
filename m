Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FA036CA771
	for <lists+dri-devel@lfdr.de>; Mon, 27 Mar 2023 16:24:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D663810E5FE;
	Mon, 27 Mar 2023 14:24:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de
 [80.237.130.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F054B10E5FE
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Mar 2023 14:24:02 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
 by wp530.webpack.hosteurope.de running ExIM with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 id 1pgnlM-00028b-GB; Mon, 27 Mar 2023 16:23:56 +0200
Message-ID: <073d5ee7-64e7-7ced-44cc-2f7f00a8b238@leemhuis.info>
Date: Mon, 27 Mar 2023 16:23:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-US, de-DE
To: Matthieu Baerts <matthieu.baerts@tessares.net>,
 Jonathan Corbet <corbet@lwn.net>, Andy Whitcroft <apw@canonical.com>,
 Joe Perches <joe@perches.com>, Dwaipayan Ray <dwaipayanray1@gmail.com>,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 =?UTF-8?Q?Kai_Wasserb=c3=a4ch?= <kai@dev.carbon-project.org>,
 Andrew Morton <akpm@linux-foundation.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
 Bagas Sanjaya <bagasdotme@gmail.com>,
 Linus Torvalds <torvalds@linux-foundation.org>
References: <20230314-doc-checkpatch-closes-tag-v2-0-f4a417861f6d@tessares.net>
 <20230314-doc-checkpatch-closes-tag-v2-1-f4a417861f6d@tessares.net>
 <29b2c9c1-f176-5e42-2606-94b4bc6d4c45@leemhuis.info>
 <9462668e-dbaf-8df8-8ba2-86f9511294ac@tessares.net>
From: Thorsten Leemhuis <linux@leemhuis.info>
Subject: Re: [PATCH v2 1/2] docs: process: allow Closes tags with links
In-Reply-To: <9462668e-dbaf-8df8-8ba2-86f9511294ac@tessares.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;linux@leemhuis.info;1679927043;1bf23bda;
X-HE-SMSGID: 1pgnlM-00028b-GB
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
Cc: mptcp@lists.linux.dev, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 27.03.23 15:05, Matthieu Baerts wrote:
> 
> Thank you for your reply!

Thank you for working on this!

> On 26/03/2023 13:28, Thorsten Leemhuis wrote:
>> On 24.03.23 19:52, Matthieu Baerts wrote:
>>> Making sure a bug tracker is up to date is not an easy task. For
>>> example, a first version of a patch fixing a tracked issue can be sent a
>>> long time after having created the issue. But also, it can take some
>>> time to have this patch accepted upstream in its final form. When it is
>>> done, someone -- probably not the person who accepted the patch -- has
>>> to remember about closing the corresponding issue.
>>>
>>> This task of closing and tracking the patch can be done automatically by
>>> bug trackers like GitLab [1], GitHub [2] and hopefully soon [3]
>>> bugzilla.kernel.org when the appropriated tag is used. The two first
>>> ones accept multiple tags but it is probably better to pick one.
>>>
>>> [...]
>>>
>>> diff --git a/Documentation/process/5.Posting.rst b/Documentation/process/5.Posting.rst
>>> index 7a670a075ab6..20f0b6b639b7 100644
>>> --- a/Documentation/process/5.Posting.rst
>>> +++ b/Documentation/process/5.Posting.rst
>>> @@ -217,6 +217,15 @@ latest public review posting of the patch; often this is automatically done
>>>  by tools like b4 or a git hook like the one described in
>>>  'Documentation/maintainer/configure-git.rst'.
>>>  
>>> +Similarly, there is also the "Closes:" tag that can be used to close issues
>>> +when the underlying public bug tracker can do this operation automatically.
>>> +For example::
>>> +
>>> +	Closes: https://example.com/issues/1234
>>> +
>>> +Private bug trackers and invalid URLs are forbidden. For other public bug
>>> +trackers not supporting automations, keep using the "Link:" tag instead.
>>> [...]
>>
>> This more and more seems half-hearted to me.
>>
>> One reason: it makes things unnecessarily complicated for developers, as
>> they'd then have to remember `is this a public bug tracker that is
>> supporting automations? Then use "Closes", otherwise "Link:"`.
>>
>> Another reason: the resulting situation ignores my regression tracking
>> bot, which (among others) tracks emailed reports. It would benefit from
>> "Closes" as well to avoid the ambiguity problem Konstantin brought up
>> (the one about "Link: might just point to a report for background
>> information in patches that don't address the problem the link points
>> to"[1]. But FWIW, I'm not sure if this ambiguity is much of a problem in
>> practice, I have a feeling that it's rare and most of the time will
>> happen after the reported problem has been addressed or in the same
>> patch-set.
> 
> Even if they are rare, I think it might be good to avoid false-positives
> that can be frustrating or create confusions. Using a dedicated tag plus
> some safeguards help then be required. (And it is not compatible with
> existing forges.)
Yeah, FWIW, I was all for such clear tags myself not that long ago (and
even twice proposed some), but due to the experience with regzbot and
Linus recent comment on Closes: I'm more in the neutral camp these days.

>> I thus think we should use either of these approaches:
>>
>> * just stick to "Link: <url>"
>>
>> * go "all-in" and tell developers to use "Closes: <url>"[2] all the time
>> when a patch is resolving an issue that was reported in public
>>
>> I'm not sure which of them I prefer myself. Maybe I'm slightly leaning
>> towards the latter: it avoids the ambiguity, checkpatch.pl will yell if
>> it's used with something else than a URL, it makes things easier for
>> MPTCP & DRM developers, and (maybe most importantly) is something new
>> developers are often used to already from git forges.
> 
> I think it makes sense not to restrict this tag to bug trackers with
> automations as long as they are public of course. After having looked at
> the comments from v1, I didn't feel like it would have been OK to extend
> its usage but I can send a v3 taking this direction hoping to get more
> feedback. After all, thanks to regzbot, we can also say that there are
> some automations behind lore.kernel.org and other ML's :)

:-D

> If we do that, would it be blocking to have this included in v6.3?

You mean if this still can go in for 6.3? Well, the patches afaics needs
to be ACKed by the right people first (Joe for checkpatch I guess, Jon
for docs). It likely also depends on how this discussion continues and
the opinion of the maintainer(s?) that picks up the patches.

>> [1]
>> https://lore.kernel.org/linux-doc/20230317185637.ebxzsdxivhgzkqqw@meerkat.local/
>>
>> [2] fwiw, I still prefer "Resolves:" over "Closes". Yes, I've seen
>> Konstantin's comment on the subtle difference between the two[3], but as
>> he said, Bugbot can work with it as well. But to me "Resolves" sounds
>> way friendlier and more descriptive to me; but well, I'm not a native
>> speaker, so I don't think my option should count much here.
> 
> As a non-native speaker, I'm open to use either of them. But as a
> developer, I feel like I'm more used to see the "Closes:" tag than the
> "Resolves" one.
> 
> When looking at the Git history, the "Closes:" tag with a link has been
> used ~500 times, compared to ~14 times for "Resolves:". Maybe "Closes:"
> is more natural for developers who first want to have their assigned
> tickets being "closed" automatically than issues being "resolved"? :)

Yeah, "developers are used to it" is a good argument. I'm not so sure
about the other argument, somehow "Resolves" feels more fitting to the
imperative language we use. Whatever, as I said, I don't care much (and
maybe thus shouldn't have written this paragraph :-D ).

Ciao, Thorsten
