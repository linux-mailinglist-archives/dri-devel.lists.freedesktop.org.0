Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5370CCA5285
	for <lists+dri-devel@lfdr.de>; Thu, 04 Dec 2025 20:46:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3451F10E9BA;
	Thu,  4 Dec 2025 19:46:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="V0YcaQMn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8661810E9B8;
 Thu,  4 Dec 2025 19:46:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 3431740C59;
 Thu,  4 Dec 2025 19:46:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D420FC4CEFB;
 Thu,  4 Dec 2025 19:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764877564;
 bh=aAQKSi8xzvUmhLEEthsE7YsJaouU3OspVMzy9V0zWPI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=V0YcaQMnxiALXGBfC3zNhbc2oxyhQb3smPyeGa+JMOeyLDKFI6y9TIgsdJebP6Qbz
 wx3MLprCjRwfVB+0C/WWZ7ygO0l6Dc9MNaCJTlWDGQY1qIXXzPjofAF7DdLDEzGelg
 pbnbIiG7Wp1PAW/tPldpQgQB+FTxkkNF7T01gQeIdn63Ukr4Np1dWDrhnKQBEX/c4z
 8ySXQTTmymw4v0S5kC2PPhgX2s8irgYgcWEEdWmXNxNCJFw+pygoyBwjNo3vAK0Hiy
 ORwS3dnZzXUuIKpOuHC2uMIAUUmbzR1DQH9CzKQ/GlLxcVy0krp+BUlpwgFJmEtP7w
 RDaXycol3+bdQ==
Message-ID: <3b6d6e50-91ac-435e-adad-a67d4198a5b5@kernel.org>
Date: Thu, 4 Dec 2025 20:45:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Linux 6.18 amdgpu build error
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Shuah Khan <skhan@linuxfoundation.org>
Cc: akpm@linux-foundation.org, Alexander Deucher <Alexander.Deucher@amd.com>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 amd-gfx@lists.freedesktop.org, dri-devel <dri-devel@lists.freedesktop.org>,
 Guenter Roeck <linux@roeck-us.net>,
 Linux Memory Management List <linux-mm@kvack.org>
References: <74032153-813a-4a40-8363-cce264f4d5ea@linuxfoundation.org>
 <1eb24816-530b-4470-8e58-ce7d8297996c@roeck-us.net>
 <0425d7b4-76e4-4057-83a5-a7b17a051c54@linuxfoundation.org>
 <ec77d11a-7613-4b75-8c9e-f2bba1595f0f@roeck-us.net>
 <9d520a1d-0b8d-4d30-b29f-230fc0f92b8a@linuxfoundation.org>
 <1f31b86d-283c-4878-92d0-ab90aed0c58d@roeck-us.net>
 <5af4522e-30ab-4eec-a861-c2760cdabd4f@linuxfoundation.org>
 <2bc690ca-fa57-46fa-949b-28b5441cd364@kernel.org>
 <b24fc85c-0e6d-42f9-a6b9-05136409098f@linuxfoundation.org>
 <CAHk-=whd-k3GhNGvVmP7W2p1d0d4ctqJ8iCuG8DbyKzgNqCL+g@mail.gmail.com>
From: "David Hildenbrand (Red Hat)" <david@kernel.org>
Content-Language: en-US
In-Reply-To: <CAHk-=whd-k3GhNGvVmP7W2p1d0d4ctqJ8iCuG8DbyKzgNqCL+g@mail.gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/4/25 20:36, Linus Torvalds wrote:
> On Thu, 4 Dec 2025 at 09:40, Shuah Khan <skhan@linuxfoundation.org> wrote:
>>
>> This commit has impact on all architectures, not a narrow scoped
>> powerpc only thing -  it enables HAVE_GIGANTIC_FOLIOS on x86_64
>> and changes the common code that determines MAX_FOLIO_ORDER in
>> include/linux/mm.h
> 
> So I suspect your bisection might not have worked out, and there might
> be two different things going on.
> 
> In particular, hugepages were broken in 6.18-rc6 due to commit
> adfb6609c680 ("mm/huge_memory: initialise the tags of the huge zero
> folio").
> 
> That was then fixed for rc7 (and obviously final 6.18) by commit
> 5bebe8de19264 ("mm/huge_memory: Fix initialization of huge zero
> folio"), but the breakage up until that time was a bit random.
> 
> End result: if you ever ended up bisecting into that broken range
> between those two commits, you would get failures on some loads (but
> not reliably), and your bisection would end up pointing to some random
> thing.
> 
> But as mentioned, that particular problem would have been fixed in rc7
> and in final 6.18, so any issues you saw with the final build would
> have been due to something else.
> 
> Can I ask you to try to re-do the bisection, but with that commit
> 5bebe8de19264 applied by hand - if it wasn't already there - every
> time you build a kernel that has adfb6609c680?

Right, that's what I also proposed in [1].

I cannot make sense of how 39231e8d6ba could possibly trigger it given 
that it only affects the value of MAX_FOLIO_ORDER --- which is primarily 
used for safety checks and snapshot_page(), nothing that could explain 
changed application behavior, really.

But while Shuah is retesting, I'll go have a yet another look.

[1] 
https://lore.kernel.org/all/78af7da4-d213-42c6-8ca6-c2bdca81f233@linuxfoundation.org/

-- 
Cheers

David
