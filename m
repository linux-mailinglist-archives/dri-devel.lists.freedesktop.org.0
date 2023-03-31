Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 230296D1CCD
	for <lists+dri-devel@lfdr.de>; Fri, 31 Mar 2023 11:43:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FA9010F197;
	Fri, 31 Mar 2023 09:43:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAC6A10F197
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Mar 2023 09:43:45 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id i5so87502361eda.0
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Mar 2023 02:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tessares.net; s=google; t=1680255824;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OdHfhgdLXpGdQQ70tB5QV01kX6mq0IL4v/ZUmR7Biio=;
 b=K7VEmmVcYK0t9OlaAgHLB918aOf7dQXmRvQD5I5PHW7jcIw+sqQK6ruQUOrYwa4aIE
 Kei2+OjvtqEtrnkAW069tkfYK0ju2KCL5eIqqsz+cSRVfVgQrAB/RMo8RwSC9ximfRcP
 RmZT+IRH7F5loMxIneO+hPakQKBDhcU/AQfKEF13x+s5loiTKMZIQxrkDcWEcaKK+K9U
 +evkll95TimfGbI3bDa0FavxwdnqVCrNqsJYnmt35BrxPqYwS0YwKdiVI4MI/hPYVQxm
 h3KML8zUlqFog2Z1XCPUTbleFeuYFS3EmoXXlDB4D6cZmTLq658N03Jv9y5amOGyeGhY
 g8bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680255824;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OdHfhgdLXpGdQQ70tB5QV01kX6mq0IL4v/ZUmR7Biio=;
 b=HAdgfYAjxExki5Yo5/A51GjvvfErn7bdydFM9nEoNraITuZcN5V4PJzlzh+EZI3ujh
 ZhVaT7AuE+37Mw2fV2REeFC1zi0hI+pwbaRKfI+Va68oyHM4bdt2Zbuf0vtecXzrHVFH
 PlCkvfYAd2axb1W13wbE/+O1RqBa99aktxVu1Y8rkNDF88Pammwb2WyDZT4clAM6he2P
 X1OKMFy28MleA3RpH099HJSgfsLH1EQxWaxSJN3bMzsJxBixMLsijs2wFXLfj2WdDoT1
 N2I1Q6KY61N/q5d4dJhOFBYa3Q1/+ESdNtJYD4nC0T0ibJFlWOV8g1NGud7cejaTPWsQ
 3R5A==
X-Gm-Message-State: AAQBX9f+EBb36MiDuJqyosLU2f+vOQvhw6eLIAzapKG/RVqwd0DIjYB1
 +PA8iSag1LfF3wwXkUjxD/CuUg==
X-Google-Smtp-Source: AKy350b9Uqz0FLCeTKbuaA/ehixKd+VLyzVlriWLonP7gdRAobgYN/1BHqbglH+Sc5bYCl8nkR4Vyw==
X-Received: by 2002:a17:906:3449:b0:93b:b8f3:225d with SMTP id
 d9-20020a170906344900b0093bb8f3225dmr26683289ejb.15.1680255824071; 
 Fri, 31 Mar 2023 02:43:44 -0700 (PDT)
Received: from [10.44.2.5] ([81.246.10.41]) by smtp.gmail.com with ESMTPSA id
 f21-20020a170906085500b00947b74db538sm388008ejd.154.2023.03.31.02.43.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 Mar 2023 02:43:43 -0700 (PDT)
Message-ID: <06e5749d-bd38-1d96-e4a0-e5e7a51dc52c@tessares.net>
Date: Fri, 31 Mar 2023 11:43:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v3 3/4] checkpatch: allow Closes tags with links
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
References: <20230314-doc-checkpatch-closes-tag-v3-0-d1bdcf31c71c@tessares.net>
 <20230314-doc-checkpatch-closes-tag-v3-3-d1bdcf31c71c@tessares.net>
 <da9d8c2174e0813be2e0e6b31129e90fddaa128e.camel@perches.com>
From: Matthieu Baerts <matthieu.baerts@tessares.net>
In-Reply-To: <da9d8c2174e0813be2e0e6b31129e90fddaa128e.camel@perches.com>
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

Thank you for this review.

On 31/03/2023 00:43, Joe Perches wrote:
> On Thu, 2023-03-30 at 20:13 +0200, Matthieu Baerts wrote:
>> As a follow-up of a previous patch modifying the documentation to
>> allow using the "Closes:" tag, checkpatch.pl is updated accordingly.
>>
>> checkpatch.pl now no longer complain when the "Closes:" tag is used by
>> itself or after the "Reported-by:" tag.
>>
>> Fixes: 76f381bb77a0 ("checkpatch: warn when unknown tags are used for links")
>> Fixes: d7f1d71e5ef6 ("checkpatch: warn when Reported-by: is not followed by Link:")
> 
> I don't think this _fixes_ anything.
> I believe it's merely a new capability.

When we first saw the new warnings checkpatch.pl was producing on a pre
Linux 6.3-rc1, we thought it was an issue with checkpatch: the "Closes:"
tag with a URL has been used for years without any complaints from
checkpatch and people as far as I know. At some point we had to stop
using it to please checkpatch and that's why we thought something had to
be fixed: we initially [1] thought the "Closes:" tag case had been
forgotten when the two mentioned commits had been created.

But I'm fine to see these "Fixes" tags removed, I understand the
"Closes:" tags were tolerated before but just not documented. Do I send
a v4 without these two "Fixes" tags? It means only the v6.3 would not
accept "Closes:" tags but we can work around that.

[1]
https://lore.kernel.org/all/a27480c5-c3d4-b302-285e-323df0349b8f@tessares.net/

Cheers,
Matt
-- 
Tessares | Belgium | Hybrid Access Solutions
www.tessares.net
