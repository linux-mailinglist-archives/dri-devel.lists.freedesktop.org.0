Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF7D37BDCB2
	for <lists+dri-devel@lfdr.de>; Mon,  9 Oct 2023 14:46:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EEC610E108;
	Mon,  9 Oct 2023 12:46:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11A2B10E0FF;
 Mon,  9 Oct 2023 12:46:45 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-405524e6768so43557285e9.2; 
 Mon, 09 Oct 2023 05:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696855603; x=1697460403; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=46YmJF0NCAJOq27FzOxAehU5zeb/ItCo7qFVBmNntgE=;
 b=BAaplgTmnzbb9Bxl0xZAWFOj70h5LKmXBjr6hMUzTIfmf2ZJFb+Cq93nKpCEs0o5rr
 GB+ib08Hx/PmKxcwakNSfjuThiRp37VeuHAH8gLRmRHFUCcClqBkP7rzV6dJjKgYnx6Q
 HmEpsf13DeLv5ZV7B7eJ+t++V7ntkZ7KTrKM2Eh5KBqcms4FnBViharpoXRkWjZLDmly
 UvzKrH8De2aKpy+YbqmhdbfZzK2ZRRTac/jUCVOYCH9N5dQ89aQOqz99+gGVZWDSKjA1
 zo3XBIHIFg40KKGm9J8b0pdRRSFSDvQ6jIo1fVDtGIevewbuXXAOZVnJlPKQ8VkZYYYb
 3Q5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696855603; x=1697460403;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=46YmJF0NCAJOq27FzOxAehU5zeb/ItCo7qFVBmNntgE=;
 b=EBWSObXPkTuzrjgdQCbrffgrg2oy4hN8k0aTKe7rNGZx03M5c3NloarjpcBOztPblN
 8RTBBoqKvLixtJcovo+xCQkTRhGltYzZjhp02siyELW3zEPYaLsDxYvJWIXPLlCg1Zcy
 bBT1ObC0oqBlUnNkpW+entxzLvEE/JKHmVtwLybomYl0ZxKoIxCc6rLfks+ZKJuasV3E
 S+5XK++8pckQn5NG8d9s4Kg4v84SuGo4QxxJGNSme/4glgNEzV8CfodfGapLVTm7lIcq
 erEv1HZHLggtRyKpfVQv8I+EMrDDq0A02fxLG4Ef+uJWU8tFqqoIwr+KLRj5RvVqTJCb
 Obeg==
X-Gm-Message-State: AOJu0Ywow/z9VSbQ+UsG1/cACk7CLFc23Lp5FFYhFIVzkD1t2q9hFp42
 5Y/MDvHrdlCwAGbajEaCNEM=
X-Google-Smtp-Source: AGHT+IFHKObOZreEa2lhEy26Zw5w3xizdKPFB5KSHgUs7mXxo0KcjUbN/Du2Ci/oP8LOrpKffCEM9g==
X-Received: by 2002:a7b:c5c9:0:b0:403:272:4414 with SMTP id
 n9-20020a7bc5c9000000b0040302724414mr13535879wmk.0.1696855603106; 
 Mon, 09 Oct 2023 05:46:43 -0700 (PDT)
Received: from [10.254.108.106] (munvpn.amd.com. [165.204.72.6])
 by smtp.gmail.com with ESMTPSA id
 c11-20020a7bc84b000000b0040648217f4fsm13400617wml.39.2023.10.09.05.46.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Oct 2023 05:46:42 -0700 (PDT)
Message-ID: <0eb8750d-79c5-4508-ac36-7f91bc8cbaf9@gmail.com>
Date: Mon, 9 Oct 2023 14:46:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH AUTOSEL 5.10 13/22] drm/amdgpu: install stub fence into
 potential unused fence pointers
Content-Language: en-US
To: Greg KH <gregkh@linuxfoundation.org>, Bryan Jennings <bryjen423@gmail.com>
References: <2023083119-phoney-ascend-d4ec@gregkh>
 <d32d6919-47cf-4ddc-955a-0759088220ae@gmail.com>
 <2023100750-unraveled-propeller-3697@gregkh>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <2023100750-unraveled-propeller-3697@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: sashal@kernel.org, airlied@linux.ie, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, christian.koenig@amd.com,
 dri-devel@lists.freedesktop.org, alexander.deucher@amd.com,
 stable@vger.kernel.org, Lang.Yu@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 07.10.23 um 11:50 schrieb Greg KH:
> On Sun, Sep 10, 2023 at 03:43:01PM -0500, Bryan Jennings wrote:
>> This is also causing log spam on 5.15.  It was included in 5.15.128 as
>> commit 4921792e04f2125b5eadef9dbe9417a8354c7eff.  I encountered this and
>> found https://gitlab.freedesktop.org/drm/amd/-/issues/2820 while researching
>> the problem.
> Confused, what should we do here?

If this patch was backported to even more older kernels then please 
revert that immediately!

This patch was part of a new feature and can only work correctly with a 
bunch of prerequisites. If you don't have those prerequisites in your 
branch then it might actually cause random memory corruptions through 
device DMA.

And we should probably talk about why this patch was automatically 
selected for backporting in the first place? There is no mention that 
this is a fix or should be backported in the commit message or patch 
itself whatsoever.

Without the WARN_ON() which started to spam the logs that could have 
gone south pretty quickly. Random data corruption without any indicator 
what's causing it is not really funny.

Regards,
Christian.
