Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 26D3A6FDE8C
	for <lists+dri-devel@lfdr.de>; Wed, 10 May 2023 15:30:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 325EA10E496;
	Wed, 10 May 2023 13:29:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 573CE10E496;
 Wed, 10 May 2023 13:29:56 +0000 (UTC)
Received: by mail-pf1-x42c.google.com with SMTP id
 d2e1a72fcca58-6434e263962so5435033b3a.2; 
 Wed, 10 May 2023 06:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683725395; x=1686317395;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OrTJVzC+N9h0nc4ZEduLU/NeM+jyxDAulMwnlFxtxlY=;
 b=kcGS4d9Ff2Pu8W5Olf1KJebhCAujWewMOB6b0tIuJLOPlgbGAi0+EHQL06R/FR2b4l
 7Q+TwEvxESLbJQSotuf0OAMuigufp3algJowPWUKPD0aFpKy6GG2HVUc32f8hQgC8h4k
 6Tgx7e0YVqZLcxIYq2lBBO4Jww+ybjKvmz0ZV5exuG0oytodCIFo++EYDNC6LULe16Gq
 W7B/S9rvB1M1H0+1nrr0zadgBkqQ6PgGuNWZpB5k19HOM70VgqSaNaT0nnsoRt/LhYIA
 JJtE+KHDYYND+ke9umBSAxYlCC2F9z96tPVFciQG4K4mtF1qbUZQR9+uYfY46rC7dbyH
 FJeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683725395; x=1686317395;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OrTJVzC+N9h0nc4ZEduLU/NeM+jyxDAulMwnlFxtxlY=;
 b=M27D0CHqeaaS3r8OKYOXTl2kYQe+6nlls/aOt9miNWYBiL8hU1cVjRQiFUW++3vhMv
 /nxtl45m/HIfTFLwFzt7bdjGhfvf8g1xCAfHoNopqmWGN6Y5t848phZzQ5IMjVcQI3pl
 r2Mxtzo3jlVmFgAxH4+u9OrP73sO0flGURf/5P1H3TkNNDrvJWosdTqmKfjTmmoQw2lE
 /6pjvNPVNWVYB+uc8QRCU+1AeB5DxolpoUwss/UbiL70aXaEfcqNLUkzOuk05D3AQXSS
 UcTj5R4WtYpVIrSzp/upqZifjrcBLlL6tDnGIY4vasMcZbj9NBgCZwuvnUC1SWHKJNWQ
 w3/Q==
X-Gm-Message-State: AC+VfDxZIXf57sxDfrvULkW3hr6kRg+P9oSm003lffQb2V3WaIs1cIow
 QTwCB8kFp6LgxGUSgND/en0=
X-Google-Smtp-Source: ACHHUZ7GzCWcQ4sO6wa/oMA7dIBZeJ9MBwS332ZFkL0WO3bHNFgWW4AFCg5oMkj7bOXj98w5QLwlfg==
X-Received: by 2002:a05:6a00:2289:b0:625:fe95:f120 with SMTP id
 f9-20020a056a00228900b00625fe95f120mr23709634pfe.8.1683725395276; 
 Wed, 10 May 2023 06:29:55 -0700 (PDT)
Received: from [192.168.43.80] (subs32-116-206-28-53.three.co.id.
 [116.206.28.53]) by smtp.gmail.com with ESMTPSA id
 x9-20020aa784c9000000b006475f831838sm2524832pfn.30.2023.05.10.06.29.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 May 2023 06:29:54 -0700 (PDT)
Message-ID: <cfb6bcf7-a6c2-7e52-d7dd-3e054574942e@gmail.com>
Date: Wed, 10 May 2023 20:29:44 +0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: Fwd: Kernel 5.11 crashes when it boots, it produces black screen.
To: Linux regressions mailing list <regressions@lists.linux.dev>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Hawking Zhang <Hawking.Zhang@amd.com>,
 Le Ma <le.ma@amd.com>, Tao Zhou <tao.zhou1@amd.com>,
 YiPeng Chai <YiPeng.Chai@amd.com>, "Jiadong.Zhu" <Jiadong.Zhu@amd.com>,
 Yang Wang <KevinYang.Wang@amd.com>, Candice Li <candice.li@amd.com>,
 Xiaojian Du <Xiaojian.Du@amd.com>, Likun Gao <Likun.Gao@amd.com>,
 Linux AMDGPU <amd-gfx@lists.freedesktop.org>,
 Linux DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <c2168e4f-4d47-0d5d-a1b7-d237f0760df8@gmail.com>
 <9cf29c20-5b82-89bb-0927-e6f66b3bd8d5@leemhuis.info>
Content-Language: en-US
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <9cf29c20-5b82-89bb-0927-e6f66b3bd8d5@leemhuis.info>
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
Cc: "Azamat S. Kalimoulline" <turtle@bazon.ru>,
 max <kernel-ODwfxu5zp4@maxxor.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 5/10/23 16:51, Linux regression tracking (Thorsten Leemhuis) wrote:
> Bagas, thx for all your help with regression tracking, much appreciated
> (side note, as I'm curious for a while already: what is your motivation?
> Just want to help? But whatever, any help is great!).
> 

I did this when I was on "gabut" (an Indonesian slang term that means
doing nothing but get rewarded). In other words, I was finding a task
when there is no documentation review or issues that needs to be worked
on.

> That being said: I'm not sure if I like what you did in this particular
> case, as developers might start getting annoyed by regression tracking
> if we throw too many bug reports of lesser quality before their feet --
> and then they might start to ignore us, which we really need to prevent.
> 
> That's why I would not have forwarded that report at this point of time,
> mainly for these reasons:
> 
>  * The initial report is quite old already, as it fall through the
> cracks (not good, but happens; sorry Azamat!). Hence in this case it
> would definitely be better to *first* ask the reporter to check if the
> problem still happens with latest mainline (or at least latest stable)
> before involving the kernel developers, as it might have been fixed
> already.
> 

Oh dear, I have already seen the bug age (two years old, from Reported
date).

>  * This might not be a amdgpu bug at all; in fact the other bug the
> reporter mentioned was an iommu thing. Hence this might be one of those
> regressions where a bisection is the only way to get down to the
> problem. Sure, sending a few developers a quick inquiry along the lines
> of "do you maybe have an idea what's up there" is fine, but that's not
> what you did in your mail. Your list of recipients is also quite long;
> that's risky: if you do that too often, as then they might start
> ignoring mail from you.
> 

Oops, I was blindly copy-paste get_maintainer.pl list at that time.

Anyway, thanks for the reminder!

-- 
An old man doll... just what I always wanted! - Clara

