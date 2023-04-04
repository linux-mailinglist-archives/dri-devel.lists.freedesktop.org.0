Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 374D86D5B16
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 10:42:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB3C110E61C;
	Tue,  4 Apr 2023 08:42:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B270710E622
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Apr 2023 08:42:33 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 n10-20020a05600c4f8a00b003ee93d2c914so20972886wmq.2
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Apr 2023 01:42:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tessares.net; s=google; t=1680597751;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=eKhe9Y5JEaP4z1zeWvbQyAnZVIyrCqdZxp2GHp+Z3cc=;
 b=TTl/ADQs4hEpjXJPyC2dBO7s+PlDBsWUCbN9IM0npJvyQZuD8wPzugJe5bBk0l1tBX
 FisY1JxDmetnYsyBBMB0+OT0OzU3foUd9DHqHoxHKiEIDbzhNCT5fNmQM4ddfZ0YBNSd
 ++0AmTCxVXdi3DVnKzfqmMQcxWftjDxzhEmpdYbXaq9IU5mLN1dY334hIvjSMZARCWiq
 ZFTjdY37+ZMJk6vhdZmP86teZpqfOyixU1boFx3b9BnNYQD2xsSSCGH3lw1/bexClLkz
 +j/J+jnaiNlfUtqJDi+IL3yhJ0P33TJx47LYADxuAcpfl4xZNp8Ftl13EGBUtMOCpIxD
 rNiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680597751;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eKhe9Y5JEaP4z1zeWvbQyAnZVIyrCqdZxp2GHp+Z3cc=;
 b=UnksG0JAlwZv1ePCqR/qt72FEnDXlPYzI6isSvHoNwalzg0k0obLTVicV7MaRcft1/
 2vXlGzlD+6otML5ef3HkMU6q8SGpfMdiZo6kUPRy3ZlOKq6C2qbOXz8Ao03wYk2TeOvZ
 gCxCUI8N7WJ4swHpHyy5sfZJf4GuUYVZuYY8ZFe0JFyZ//ZGcyesFRm9goz4mjBLx0kI
 kPz2guQ8y6f7jfYHJkzZGopOvbZSUNZrmFC1hsn8/Onhc3cuRrig3AKlyC3w5eHBqLTM
 NYyh3U+NAyAT7n5JeDjJANAODQgTD9t327405ZbG2pEbTvX5oa939dQ5aSb0vWIwvRrb
 1ttw==
X-Gm-Message-State: AAQBX9cBKJuBs0QAqGkthY1yJR75azhGSD+3qVFtctmHRczPuXychhFR
 wDgFm/lsdt3923ZFK7RVWJwLVQ==
X-Google-Smtp-Source: AKy350Y5DMU8kEAJOzbfmW7NGKy5hnaCRv7A7hFu+RQQNUqByLYI+v3iTHv8cRT+S8Q+uybES9Z5PA==
X-Received: by 2002:a05:600c:2312:b0:3ef:6396:d9c8 with SMTP id
 18-20020a05600c231200b003ef6396d9c8mr1461785wmo.5.1680597751348; 
 Tue, 04 Apr 2023 01:42:31 -0700 (PDT)
Received: from ?IPV6:2a02:578:8593:1200:9bac:ba77:27a:f657?
 ([2a02:578:8593:1200:9bac:ba77:27a:f657])
 by smtp.gmail.com with ESMTPSA id
 b6-20020a5d5506000000b002e463bd49e3sm11660988wrv.66.2023.04.04.01.42.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Apr 2023 01:42:30 -0700 (PDT)
Message-ID: <8edb82ed-10e8-c236-fb08-ed14ed3e4634@tessares.net>
Date: Tue, 4 Apr 2023 10:42:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v4 1/5] docs: process: allow Closes tags with links
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
References: <20230314-doc-checkpatch-closes-tag-v4-0-d26d1fa66f9f@tessares.net>
 <20230314-doc-checkpatch-closes-tag-v4-1-d26d1fa66f9f@tessares.net>
 <e671189c-086e-87bd-68db-fb80678d4666@leemhuis.info>
Content-Language: en-GB
From: Matthieu Baerts <matthieu.baerts@tessares.net>
In-Reply-To: <e671189c-086e-87bd-68db-fb80678d4666@leemhuis.info>
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

Thank you for this review.

On 04/04/2023 10:09, Thorsten Leemhuis wrote:
> 
> On 03.04.23 18:23, Matthieu Baerts wrote:
>> [...]
>> diff --git a/Documentation/process/submitting-patches.rst b/Documentation/process/submitting-patches.rst
>> index 828997bc9ff9..12d58ddc2b8a 100644
>> --- a/Documentation/process/submitting-patches.rst
>> +++ b/Documentation/process/submitting-patches.rst
>> @@ -113,11 +113,9 @@ there is no collision with your six-character ID now, that condition may
>>  change five years from now.
>>  
>>  If related discussions or any other background information behind the change
>> -can be found on the web, add 'Link:' tags pointing to it. In case your patch
>> -fixes a bug, for example, add a tag with a URL referencing the report in the
>> -mailing list archives or a bug tracker; if the patch is a result of some
>> -earlier mailing list discussion or something documented on the web, point to
>> -it.
>> +can be found on the web, add 'Link:' tags pointing to it. If the patch is a
>> +result of some earlier mailing list discussions or something documented on the
>> +web, point to it.
>>  
>>  When linking to mailing list archives, preferably use the lore.kernel.org
>>  message archiver service. To create the link URL, use the contents of the
>> @@ -134,6 +132,16 @@ resources. In addition to giving a URL to a mailing list archive or bug,
>>  summarize the relevant points of the discussion that led to the
>>  patch as submitted.
>>  
>> +In case your patch fixes a bug, use the 'Closes:' tag with a URL referencing
>> +the report in the mailing list archives or a public bug tracker. For example::
>> +
>> +	Closes: https://example.com/issues/1234
> 
> YMMV, but is this...
> 
>> +Some bug trackers have the ability to close issues automatically when a
>> +commit with such a tag is applied. Some bots monitoring mailing lists can
>> +also track such tags and take certain actions. Private bug trackers and
>> +invalid URLs are forbidden.
>> +
> 
> ...section (and a similar one in the other document) really worth it
> and/or does it have to be that long? A simple "Some bug trackers then
> will automatically close the issue when the commit is merged" IMHO would
> suffice, but OTOH it might be considered common knowledge. And the
> "found on the web", "a public bug tracker" (both quoted above) and
> "available on the web" (quoted below) already make it pretty clear that
> links to private bug trackers are now desired. And there is also a
> "Please check the link to make sure that it is actually working and
> points to the relevant message." in submitting-patches.rst already, so
> invalid URLs are obviously not wanted either.

This paragraph seems worth it to me: the two first sentences explain how
this tag can be used by external tools and the last one clearly explain
what is not allowed. I agree that it makes sense and it is somehow
already described around with the "positive form" but it is very common
to use the "Closes:" tag with just the ticket ID, not the full URL. It
might then be important to clearly mention that it has to be used with a
valid URL and not a short version. While at it, I think it is fine to
add that private bug trackers are forbidden too because it can be very
tempting for devs to use them if automations are in place. And also
because checkpatch.pl is not going to verify if URLs are public.

But I'm clearly not an expert in writing docs, it is just my point of
view as a developer :)
I don't mind changing the text.

Cheers,
Matt
-- 
Tessares | Belgium | Hybrid Access Solutions
www.tessares.net
