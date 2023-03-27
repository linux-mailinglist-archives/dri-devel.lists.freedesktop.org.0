Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F8C06CA525
	for <lists+dri-devel@lfdr.de>; Mon, 27 Mar 2023 15:05:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3C9810E05B;
	Mon, 27 Mar 2023 13:05:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74BF610E05B
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Mar 2023 13:05:18 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id r11so35906290edd.5
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Mar 2023 06:05:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tessares.net; s=google; t=1679922317;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MUedMoE14JQ28fok10enBbyDNKiAv+6x2jhiRaNAMrQ=;
 b=q3g2IUSeGBLtR4VAoubgIg8uzHTrexKkK19JfvoK50i3hZgdovxZoLoelnLSXQonTU
 5835oKTmd3bkY3veUkU2BaWjOTFaErD8ndQALmRjuMEQWA5JgVX25TsxgwRVFWlYbwfv
 zsB3bp1e1RUWEttMSJvOyKS7GRv5NYLlXtjFi/XUCBYBmngWCJ/fOf2Zl3CaEmWOut6P
 l/RFjGqHPn3fpUUw/Y3xI3jKnsFFbueEWtXrq7dRbr7t1ydqfV0pbXCnQXIV0PhEF6wa
 ZLvQ1YS88ycDtak3To96ECqux0DDRyZiAGZc4BJp7LLmJof3VZYQXdU4twNzj7Yh1FkP
 1fkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679922317;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MUedMoE14JQ28fok10enBbyDNKiAv+6x2jhiRaNAMrQ=;
 b=ehAPrs82MSRzjNJZjNOKb5JzQaO2u5jtyfP3OgFxI/ze86jutrX7LwldSvQO5SEIQz
 MV4XskxqQ8+QKWDBrDx4f2lFfAB0lBvc2dSLIwr1v2NH0Dxk9o+FcmUBjSg7/X7xoAyG
 OIAb3/VKQr7RoluLmk3esDztf2pom0L27cu2S8WF9tAQv3W72KQca3tCnjsMr/CDLF4V
 t3qbSxei8BngGsKQe5O3zLKz1sujGKSRXdm6LIbTPfqoqT49e+1eUuFTdpBmzb0FM9/G
 wGrXUjt0menx3s5RU/3gxgU0TjliQl5qKGrU0/uwvkLmIcnuJWuVO0qC8ynbIV9uHuuk
 VyZg==
X-Gm-Message-State: AAQBX9fvMpeCpVfG4JO4FRUUyr8kG1ZoOZKfYCV2G9prMIeoBPU/s+an
 w4Lkp1fAb1oyi/0QC9MuzeodZA==
X-Google-Smtp-Source: AKy350b8SuxITm8TpdYemMwCmE2tqKvi1KpZiRhxEdvVPCZnD0RBwmihbZkQCZjH4l2/Lo8nVTxYDw==
X-Received: by 2002:a17:906:7e4a:b0:93d:f7a6:219b with SMTP id
 z10-20020a1709067e4a00b0093df7a6219bmr11766956ejr.65.1679922316865; 
 Mon, 27 Mar 2023 06:05:16 -0700 (PDT)
Received: from [10.44.2.5] ([81.246.10.41]) by smtp.gmail.com with ESMTPSA id
 sd24-20020a170906ce3800b00931024e96c5sm14247420ejb.99.2023.03.27.06.05.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Mar 2023 06:05:16 -0700 (PDT)
Message-ID: <9462668e-dbaf-8df8-8ba2-86f9511294ac@tessares.net>
Date: Mon, 27 Mar 2023 15:05:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 1/2] docs: process: allow Closes tags with links
Content-Language: en-GB
To: Thorsten Leemhuis <linux@leemhuis.info>, Jonathan Corbet
 <corbet@lwn.net>, Andy Whitcroft <apw@canonical.com>,
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
From: Matthieu Baerts <matthieu.baerts@tessares.net>
In-Reply-To: <29b2c9c1-f176-5e42-2606-94b4bc6d4c45@leemhuis.info>
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
Cc: mptcp@lists.linux.dev, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thorsten,

Thank you for your reply!

On 26/03/2023 13:28, Thorsten Leemhuis wrote:
> On 24.03.23 19:52, Matthieu Baerts wrote:
>> Making sure a bug tracker is up to date is not an easy task. For
>> example, a first version of a patch fixing a tracked issue can be sent a
>> long time after having created the issue. But also, it can take some
>> time to have this patch accepted upstream in its final form. When it is
>> done, someone -- probably not the person who accepted the patch -- has
>> to remember about closing the corresponding issue.
>>
>> This task of closing and tracking the patch can be done automatically by
>> bug trackers like GitLab [1], GitHub [2] and hopefully soon [3]
>> bugzilla.kernel.org when the appropriated tag is used. The two first
>> ones accept multiple tags but it is probably better to pick one.
>>
>> [...]
>>
>> diff --git a/Documentation/process/5.Posting.rst b/Documentation/process/5.Posting.rst
>> index 7a670a075ab6..20f0b6b639b7 100644
>> --- a/Documentation/process/5.Posting.rst
>> +++ b/Documentation/process/5.Posting.rst
>> @@ -217,6 +217,15 @@ latest public review posting of the patch; often this is automatically done
>>  by tools like b4 or a git hook like the one described in
>>  'Documentation/maintainer/configure-git.rst'.
>>  
>> +Similarly, there is also the "Closes:" tag that can be used to close issues
>> +when the underlying public bug tracker can do this operation automatically.
>> +For example::
>> +
>> +	Closes: https://example.com/issues/1234
>> +
>> +Private bug trackers and invalid URLs are forbidden. For other public bug
>> +trackers not supporting automations, keep using the "Link:" tag instead.
>> [...]
> 
> This more and more seems half-hearted to me.
> 
> One reason: it makes things unnecessarily complicated for developers, as
> they'd then have to remember `is this a public bug tracker that is
> supporting automations? Then use "Closes", otherwise "Link:"`.
> 
> Another reason: the resulting situation ignores my regression tracking
> bot, which (among others) tracks emailed reports. It would benefit from
> "Closes" as well to avoid the ambiguity problem Konstantin brought up
> (the one about "Link: might just point to a report for background
> information in patches that don't address the problem the link points
> to"[1]. But FWIW, I'm not sure if this ambiguity is much of a problem in
> practice, I have a feeling that it's rare and most of the time will
> happen after the reported problem has been addressed or in the same
> patch-set.

Even if they are rare, I think it might be good to avoid false-positives
that can be frustrating or create confusions. Using a dedicated tag plus
some safeguards help then be required. (And it is not compatible with
existing forges.)

> I thus think we should use either of these approaches:
> 
> * just stick to "Link: <url>"
> 
> * go "all-in" and tell developers to use "Closes: <url>"[2] all the time
> when a patch is resolving an issue that was reported in public
> 
> I'm not sure which of them I prefer myself. Maybe I'm slightly leaning
> towards the latter: it avoids the ambiguity, checkpatch.pl will yell if
> it's used with something else than a URL, it makes things easier for
> MPTCP & DRM developers, and (maybe most importantly) is something new
> developers are often used to already from git forges.

I think it makes sense not to restrict this tag to bug trackers with
automations as long as they are public of course. After having looked at
the comments from v1, I didn't feel like it would have been OK to extend
its usage but I can send a v3 taking this direction hoping to get more
feedback. After all, thanks to regzbot, we can also say that there are
some automations behind lore.kernel.org and other ML's :)

If we do that, would it be blocking to have this included in v6.3?

> [1]
> https://lore.kernel.org/linux-doc/20230317185637.ebxzsdxivhgzkqqw@meerkat.local/
> 
> [2] fwiw, I still prefer "Resolves:" over "Closes". Yes, I've seen
> Konstantin's comment on the subtle difference between the two[3], but as
> he said, Bugbot can work with it as well. But to me "Resolves" sounds
> way friendlier and more descriptive to me; but well, I'm not a native
> speaker, so I don't think my option should count much here.

As a non-native speaker, I'm open to use either of them. But as a
developer, I feel like I'm more used to see the "Closes:" tag than the
"Resolves" one.

When looking at the Git history, the "Closes:" tag with a link has been
used ~500 times, compared to ~14 times for "Resolves:". Maybe "Closes:"
is more natural for developers who first want to have their assigned
tickets being "closed" automatically than issues being "resolved"? :)

Cheers,
Matt
-- 
Tessares | Belgium | Hybrid Access Solutions
www.tessares.net
