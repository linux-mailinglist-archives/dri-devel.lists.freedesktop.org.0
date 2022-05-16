Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBF535286CF
	for <lists+dri-devel@lfdr.de>; Mon, 16 May 2022 16:20:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D502D10E110;
	Mon, 16 May 2022 14:19:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [IPv6:2607:f8b0:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 426C110E349;
 Mon, 16 May 2022 14:19:58 +0000 (UTC)
Received: by mail-oi1-x22b.google.com with SMTP id q8so18733768oif.13;
 Mon, 16 May 2022 07:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Mpj75KaCiBDC1z0Gq3wmQiK0bCjZ+/g+r2qV0jF0QRs=;
 b=h7hGFYuETN0Js7lA4HRVafJbtT3J3KaiOp2PQl9zOveXQ58rogRbhMTVG+EEvFEUGm
 mgiDgExHRSy3NmnDXGWIG/eqz8sOxhVtpQ6zdEtd6pXK3aHPuSX8NvSDLFQn8q3SxzKn
 qPbJoCpOhtLyQtknnmObrNRPcp65M/9lc5+nMQH9EZ6DJ9zvyrxEPJUqB4ZpHgN65UT/
 pZ6wxDTkwgT5vkbieo6BPojGLMCZK/KMf51dzWWT6GmojtBDWnBo2DB6cb2VCY+ARVbR
 DGTOsgB1Jn3+eY0XLFzfo/yyoRwisMfFzPLHaOR+iwIgr/tYqlQaBS1PasQQKYWGO8WS
 WSEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Mpj75KaCiBDC1z0Gq3wmQiK0bCjZ+/g+r2qV0jF0QRs=;
 b=CHh+IhmGza7/WyoxqTP6BkjXA/Vsy8346Yp17i57EGECEnutxAeFp66PVissBKTE9r
 S8UVtPFJmQOJ2yVbVQQWnV6nRGZkx7UQMM03ybJTyAs3HQ5NpUkm5pLIU+gFzwDzyD/L
 bJGn+cFvRjY9AKAteplVcoE8XMb/S/3bGlnFOF1nxUdaZAKxWbOzAVzmoNel1rfBJ/PX
 CKrBbYEvLmSl5tvJbmZkmTJbo/lozujTtkVZqbkbQs8DAJwkHfi/F5hFmsxYJoR8LRHy
 a+ejTlDEdaZPFqh3i2jKSUAG0qg+bRYkrMUwWTWBDO2IjtZ5ZjMtOkbaQQMKXxZPuY+U
 wJzw==
X-Gm-Message-State: AOAM530tk6RnoEKuM6C92J+ZYPBhYeH6Nr30+3l0VQ4vKAyRAbMJzvUT
 bc4HJ0rZuVR9RweR69bU0pg=
X-Google-Smtp-Source: ABdhPJzHIEB8K5ECnXXfF0FVsk0B1nV5R/BR/kSU8cshU+jwA1/3rjPaKr6PQiWtdpcKDnk1QewaaA==
X-Received: by 2002:a05:6808:a11:b0:325:e5c1:5912 with SMTP id
 n17-20020a0568080a1100b00325e5c15912mr8321388oij.204.1652710797515; 
 Mon, 16 May 2022 07:19:57 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c?
 ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 i1-20020a9d6241000000b005b22a0d826csm3916917otk.1.2022.05.16.07.19.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 May 2022 07:19:56 -0700 (PDT)
Message-ID: <9510474d-5555-42b3-5a9c-90e3078df499@roeck-us.net>
Date: Mon, 16 May 2022 07:19:53 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [greybus-dev] Re: [PATCH] [v2] Kbuild: move to -std=gnu11
Content-Language: en-US
To: Greg KH <gregkh@linuxfoundation.org>
References: <20220228103142.3301082-1-arnd@kernel.org>
 <20220516131023.GA2329080@roeck-us.net> <YoJSF8T5K9pPx3Ap@kroah.com>
From: Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <YoJSF8T5K9pPx3Ap@kroah.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: Arnd Bergmann <arnd@kernel.org>, Michal Marek <michal.lkml@markovi.net>,
 linux-doc@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 linux-kbuild@vger.kernel.org, linux-staging@lists.linux.dev,
 Masahiro Yamada <masahiroy@kernel.org>, llvm@lists.linux.dev,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, greybus-dev@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, Federico Vaga <federico.vaga@vaga.pv.it>,
 Hu Haowen <src.res@email.cn>, intel-gfx@lists.freedesktop.org,
 Jonathan Corbet <corbet@lwn.net>, linux-btrfs@vger.kernel.org,
 Linus Torvalds <torvalds@linux-foundation.org>,
 linux-doc-tw-discuss@lists.sourceforge.net, Alex Shi <alexs@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 5/16/22 06:31, Greg KH wrote:
> On Mon, May 16, 2022 at 06:10:23AM -0700, Guenter Roeck wrote:
>> On Mon, Feb 28, 2022 at 11:27:43AM +0100, Arnd Bergmann wrote:
>>> From: Arnd Bergmann <arnd@arndb.de>
>>>
>>> During a patch discussion, Linus brought up the option of changing
>>> the C standard version from gnu89 to gnu99, which allows using variable
>>> declaration inside of a for() loop. While the C99, C11 and later standards
>>> introduce many other features, most of these are already available in
>>> gnu89 as GNU extensions as well.
>>
>> The downside is that backporting affected patches to older kernel branches
>> now fails with error messages such as
>>
>> mm/kfence/core.c: In function ‘kfence_init_pool’:
>> mm/kfence/core.c:595:2: error: ‘for’ loop initial declarations are only allowed in C99 or C11 mode
>>
>> Just something to keep in mind when writing patches.
> 
> I just ran across this very issue on this commit.  It's an easy fixup
> for 5.17.y to make this work, so I did that in my tree.  If this gets to
> be too much, we might need to reconsider adding c11 to older stable
> kernels.
> 

I think I'll do just that for ChromeOS; I don't want to have to deal
with the backports, and we are using recent compilers anyway.

Guenter
