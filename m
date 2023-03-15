Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 844AB6BC7E0
	for <lists+dri-devel@lfdr.de>; Thu, 16 Mar 2023 08:56:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D2FD10EC51;
	Thu, 16 Mar 2023 07:56:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E77010E2E7
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Mar 2023 18:29:42 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id o12so79114986edb.9
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Mar 2023 11:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tessares.net; s=google; t=1678904980;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wFueg1Re7r7oz+bq5GiyyDwW00ISWX7DiVqgOMzRA58=;
 b=z77gvtWr37A/s5VNJqbHRj5RMHdZyDNaJEFQwqIIut4z+DlUSrDiaHl4Kv474TkyTo
 PMtJeodhY9Sdc1cFqKmX02tf7fQ+YA1d30C+EOaFuIJrlIkavn22w+xZcGUZ+Fqtbo+r
 Egc9ZnO2h2BIuPSvNlvQPAEfy/3rhPfKKviynBm2JUBuf3BQCbvXz+Eg0fSuw5gvi7Pe
 6sA0vYN8/haAHMsNb/rZ/6C38LQP/w7PtgyMWswG/t67xwh0lVe2BX/zfDmadUHEdCUF
 rj0os6zkpLGszqEptTMycf7ZSZwPQUdWwhLpusTyJVsYFkLFOHPiUq+pUjjaBcKo3SsX
 X2Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678904980;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wFueg1Re7r7oz+bq5GiyyDwW00ISWX7DiVqgOMzRA58=;
 b=LNCmlVCrsWlxA94OQ2xBCoAAgzVJzcPyYBdRL5qf/03q5/5/gWswakE6dqd3HWmWgv
 OKhwCLV8YAYCsg2TLEgjZ8F6ZadEz0JEkkwFaSxJCn1M4LyDpK3D5yprln8TdwJMzWAz
 952YDHP31pwR3ptdx39LL+5Fh7KKFrPvTd4Qyi8DE9VOfVxag4LCm3EQoDzXKsf2p/B1
 QLOpJqHUxTHACZN9QCuQ4W0uhFrMFgWMHyBLj11JgOCqJ10Fa7nV265wMqzKZVQ6svy0
 Hw1UzeeelEtYh2/B24C213gkYlp5/LBgYEt5oE4LqoES5H5nUeeqoimmjE5MvsV+kDvi
 UoIA==
X-Gm-Message-State: AO0yUKW3zpKjby40lJ/P++xHqbeEplR2QXV7sKjK3jRcBQ76BBRwWmL9
 jlklBs2ghSn3t/aTwsRW6K8rXA==
X-Google-Smtp-Source: AK7set9V2+oXGXLvqaa5erAztcj3u7fMWk+JUhyXOLyZzl8OTMMm30BM9l3QFu8UbAHFwKCWN/EDrg==
X-Received: by 2002:a17:906:7e4e:b0:929:bd3:eab4 with SMTP id
 z14-20020a1709067e4e00b009290bd3eab4mr7111332ejr.68.1678904980521; 
 Wed, 15 Mar 2023 11:29:40 -0700 (PDT)
Received: from [10.124.6.19] ([195.181.172.151])
 by smtp.gmail.com with ESMTPSA id
 k1-20020a508ac1000000b004c0239e41d8sm2860526edk.81.2023.03.15.11.29.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Mar 2023 11:29:40 -0700 (PDT)
Message-ID: <1126b5c9-0742-0d3e-f483-8f08ea22aec4@tessares.net>
Date: Wed, 15 Mar 2023 19:29:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 1/2] docs: process: allow Closes tags with links
Content-Language: en-GB
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
References: <20230314-doc-checkpatch-closes-tag-v1-0-1b83072e9a9a@tessares.net>
 <20230314-doc-checkpatch-closes-tag-v1-1-1b83072e9a9a@tessares.net>
 <20230315181205.f3av7h6owqzzw64p@meerkat.local>
From: Matthieu Baerts <matthieu.baerts@tessares.net>
In-Reply-To: <20230315181205.f3av7h6owqzzw64p@meerkat.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Thu, 16 Mar 2023 07:56:01 +0000
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
Cc: Jonathan Corbet <corbet@lwn.net>, Dwaipayan Ray <dwaipayanray1@gmail.com>,
 linux-doc@vger.kernel.org, Thorsten Leemhuis <linux@leemhuis.info>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Joe Perches <joe@perches.com>, Andy Whitcroft <apw@canonical.com>,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>, mptcp@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Konstantin,

On 15/03/2023 19:12, Konstantin Ryabitsev wrote:
> On Wed, Mar 15, 2023 at 06:44:56PM +0100, Matthieu Baerts wrote:
>> Note that thanks to this "Closes" tag, the mentioned bug trackers can
>> also locate where a patch has been applied in different branches and
>> repositories. If only the "Link" tag is used, the tracking can also be
>> done but the ticket will not be closed and a manual operation will be
>> needed.
> 
> We will soon gain this ability on bugzilla.kernel.org as one of the features
> of the bugbot integration tool (which is still WIP).

Good news! This feature will be helpful for bugzilla users!

> So, if it helps, I
> support making this a recognized trailer.
Thank you for your support!

Cheers,
Matt
-- 
Tessares | Belgium | Hybrid Access Solutions
www.tessares.net
