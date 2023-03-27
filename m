Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14C076CA453
	for <lists+dri-devel@lfdr.de>; Mon, 27 Mar 2023 14:44:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC5C510E5A2;
	Mon, 27 Mar 2023 12:44:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D55FD10E5A2
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Mar 2023 12:44:43 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id x3so35539060edb.10
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Mar 2023 05:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tessares.net; s=google; t=1679921082;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=EKW/tU35UjGEuUF9Mez4H7fZWGcAomPnT3WUqTcOwB8=;
 b=glqgBSj0rwWYVzccQFPKfUYu5IDeMkUNFZIBmxGr8nrmFA32ZNrdBTM5DUu2qpSXLv
 Mfo4LtPvpfhIO8obwOsqHhZlR0GD506gc5h7OGcxx5xgkduTJjVtlnkrpeagGFFgoyp2
 d1cuQqvxMbD/Mce87L+rEUWcPATyTMuab+t9DHVvLAUdFlYlBvzEHQl1CfO6gB5HRYrf
 1cR4RCuotDVykuEG2m/fTO/HXu5WRxL3jkji0Xf/AWOnRywfpk+o3DOWC7MZPaTGgLdo
 dToSihjbS9ns47KyhivkdLSL9xl2cG6kBlkOEx/4lxrfyqAC/pQ40e0ifowVCDFNiNaK
 7DrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679921082;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EKW/tU35UjGEuUF9Mez4H7fZWGcAomPnT3WUqTcOwB8=;
 b=MpbwRZzPRoh1J5om0fo73lk428P4AWZ2SBeaTd2FOyCy+o5MAWzaPjVIXi2T2t9BVc
 tDZeOzmOVX/IeuV5nEA8OjYnsfBw20SMkfJM/hcMCQpLfqSbYvRBo74ODEQGEGXCxtBR
 O9YrTcWHHtG88Ydu0MqD5jaW9Pj8ECtEZGVEK8Q/iFY9KJbwCgbGx4HOomWRKFW4Lhxs
 GjM17U1qzCkeepkh4saWw38i/2t4rmPCVRyzCnZNl+CPWD5u7vcOxHv+Gp2dW9ZzdvLj
 K+q0vAzcEmjChFmf69AQhkYu1KIXTtHQCtLXfrfpKzK2IdxYSQX0StE4kIWyTAkMhRzc
 cl9Q==
X-Gm-Message-State: AAQBX9d+SqAfcrMg4t55VMauJ95xe9gAUwRtMBJBMJdWnFxunzDltTAM
 6xoyOoHWG27rLpiC+SeEOgyIdQ==
X-Google-Smtp-Source: AKy350bdtzCpB1RpTkMzpU+kL/HgZJs5VPsA2ZEf4q+QvtNuRCG23spbWNl2cGsoNjW3ojSIcOXorQ==
X-Received: by 2002:a17:906:48cb:b0:932:c50e:d6b4 with SMTP id
 d11-20020a17090648cb00b00932c50ed6b4mr11850596ejt.9.1679921081892; 
 Mon, 27 Mar 2023 05:44:41 -0700 (PDT)
Received: from [10.44.2.5] ([81.246.10.41]) by smtp.gmail.com with ESMTPSA id
 w17-20020a170906b19100b0093fa8c2e877sm2894122ejy.80.2023.03.27.05.44.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Mar 2023 05:44:41 -0700 (PDT)
Message-ID: <03e4389e-5790-68c5-422f-f128415c2d03@tessares.net>
Date: Mon, 27 Mar 2023 14:44:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 2/2] checkpatch: allow Closes tags with links
Content-Language: en-GB
To: Joe Perches <joe@perches.com>, Jonathan Corbet <corbet@lwn.net>,
 Andy Whitcroft <apw@canonical.com>, Dwaipayan Ray <dwaipayanray1@gmail.com>,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 =?UTF-8?Q?Kai_Wasserb=c3=a4ch?= <kai@dev.carbon-project.org>,
 Thorsten Leemhuis <linux@leemhuis.info>,
 Andrew Morton <akpm@linux-foundation.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
 Bagas Sanjaya <bagasdotme@gmail.com>,
 Linus Torvalds <torvalds@linux-foundation.org>
References: <20230314-doc-checkpatch-closes-tag-v2-0-f4a417861f6d@tessares.net>
 <20230314-doc-checkpatch-closes-tag-v2-2-f4a417861f6d@tessares.net>
 <d24f2eca8f2a858b48ad0e019e58e0e5098be5c3.camel@perches.com>
From: Matthieu Baerts <matthieu.baerts@tessares.net>
In-Reply-To: <d24f2eca8f2a858b48ad0e019e58e0e5098be5c3.camel@perches.com>
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

Hi Joe,

Thank you for the review!

On 24/03/2023 20:13, Joe Perches wrote:
> On Fri, 2023-03-24 at 19:52 +0100, Matthieu Baerts wrote:
>> As a follow-up of the previous patch modifying the documentation to
>> allow using the "Closes:" tag, checkpatch.pl is updated accordingly.
>>
>> checkpatch.pl now mentions the "Closes:" tag between brackets to express
>> the fact it should be used only if it makes sense.
>>
>> While at it, checkpatch.pl will not complain if the "Closes" tag is used
>> with a "long" line, similar to what is done with the "Link" tag.
>>
>> Fixes: 76f381bb77a0 ("checkpatch: warn when unknown tags are used for links")
>> Fixes: d7f1d71e5ef6 ("checkpatch: warn when Reported-by: is not followed by Link:")
>> Closes: https://github.com/multipath-tcp/mptcp_net-next/issues/373
>> Signed-off-by: Matthieu Baerts <matthieu.baerts@tessares.net>
>> ---
>>  scripts/checkpatch.pl | 16 ++++++++--------
>>  1 file changed, 8 insertions(+), 8 deletions(-)
>>
>> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
>> index bd44d12965c9..d6376e0b68cc 100755
>> --- a/scripts/checkpatch.pl
>> +++ b/scripts/checkpatch.pl
>> @@ -3158,14 +3158,14 @@ sub process {
>>  				}
>>  			}
>>  
>> -# check if Reported-by: is followed by a Link:
>> +# check if Reported-by: is followed by a Link: (or Closes:) tag
>>  			if ($sign_off =~ /^reported(?:|-and-tested)-by:$/i) {
>>  				if (!defined $lines[$linenr]) {
>>  					WARN("BAD_REPORTED_BY_LINK",
>> -					     "Reported-by: should be immediately followed by Link: to the report\n" . $herecurr . $rawlines[$linenr] . "\n");
>> -				} elsif ($rawlines[$linenr] !~ m{^link:\s*https?://}i) {
>> +					     "Reported-by: should be immediately followed by Link: (or Closes:) to the report\n" . $herecurr . $rawlines[$linenr] . "\n");
>> +				} elsif ($rawlines[$linenr] !~ m{^(link|closes):\s*https?://}i) {
> 
> Please do not use an unnecessary capture group.
> 
> 		(?:link|closes)

Good point, thank you, that will be in the v3.

> And because it's somewhat likely that _more_ of these keywords
> could be added, perhaps use some array like deprecated_apis

I can but from the discussions we had on the v1, it looks unlikely to me
that more of these keywords will be allowed (if this one already ends up
being accepted :) ). Strangely, we might not even want to make it easy
to add new tags.

But I'm fine to change that in the v3 if you prefer to have an array here.

Cheers,
Matt
-- 
Tessares | Belgium | Hybrid Access Solutions
www.tessares.net
