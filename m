Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FA9562C848
	for <lists+dri-devel@lfdr.de>; Wed, 16 Nov 2022 19:54:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB50C10E196;
	Wed, 16 Nov 2022 18:54:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF55910E0A2
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Nov 2022 18:54:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668624845;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XrMOrTfFoolcBWY273BC4KVOqyrI8gbytsgZlItRSSY=;
 b=RSb4pOB8CLIFfX+aOJJIthONAJBwzMekAEUb6eoW3MPcdqMhyYyv+yl9WfOmiQoZUCWzh8
 7qtF1+zHD1tm2Dxtts6gFmeBjFkQ5wSZe1a2D116HDV9wAG+99OD2pUK48zIbGZjke5/9J
 y40ANHASoDaBup9RsO90BJXNVSicIZU=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-645-fdEAljvHO924yM4dq6onbQ-1; Wed, 16 Nov 2022 13:54:02 -0500
X-MC-Unique: fdEAljvHO924yM4dq6onbQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 d23-20020adfa417000000b002364a31b7c9so4024896wra.15
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Nov 2022 10:54:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:organization:from
 :references:cc:to:content-language:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XrMOrTfFoolcBWY273BC4KVOqyrI8gbytsgZlItRSSY=;
 b=l5aMICaM2kRgifo2SAQYR9+XRLAqhIHSeo1uuJJm3P80R1/RDvukJQ/1ANO0mQyk7j
 Lfof3XR+GIyBlkFoIQ+5g1YFucJoopiZjT6bm4+Kw23XjXmza0qbKVSCmnJCNNErUOkP
 hXZu2L2iurSk+noy4R4hFjjg+UiAw/zc0+P4HN0VB+xg5iU/2LX5+mhVxH6CA9erLHnU
 7u3RTFzPzh8nIvu2jguQnhI45WXPtEPTKM8xKHqn2qxC3dCiMqBUzH9WiWw+dVITDwwd
 Lr018Z9oLyGI8eCAxbNGjUBJhpfAAExx9l1J7ab0Uuf3UEd2tf3H6Cd34h5OtLNDGGtM
 RUTg==
X-Gm-Message-State: ANoB5plxhHUQpkiUVOZiLkOyO4pQa+X/RC05Zy3y8eUSAlIoCwXXBiif
 PNkmQFKEV3/IdLuYfu+w8DHUtW58W7XCnENEqWY8xEKWBdaIgR+mswLabT8JlUFfRycT5cxNIx2
 xyzlXlr69qwKEmwPpWhplv08tgYdp
X-Received: by 2002:a05:600c:188a:b0:3cf:8e62:f769 with SMTP id
 x10-20020a05600c188a00b003cf8e62f769mr3135312wmp.52.1668624841272; 
 Wed, 16 Nov 2022 10:54:01 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5DCp6F6fiXltcSvKkMYb+ZcNvwNu+I48re+Q7o+sjDMiBTT1rVi2cU7FL82kIKKDnPvsKEPw==
X-Received: by 2002:a05:600c:188a:b0:3cf:8e62:f769 with SMTP id
 x10-20020a05600c188a00b003cf8e62f769mr3135302wmp.52.1668624841029; 
 Wed, 16 Nov 2022 10:54:01 -0800 (PST)
Received: from ?IPV6:2003:cb:c704:9f00:a98d:4026:7c44:40fd?
 (p200300cbc7049f00a98d40267c4440fd.dip0.t-ipconnect.de.
 [2003:cb:c704:9f00:a98d:4026:7c44:40fd])
 by smtp.gmail.com with ESMTPSA id
 h16-20020a05600c315000b003cff309807esm3012333wmo.23.2022.11.16.10.53.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Nov 2022 10:54:00 -0800 (PST)
Message-ID: <caf52607-49cd-3073-ca4a-ddce9509e7c9@redhat.com>
Date: Wed, 16 Nov 2022 19:53:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
To: Linus Torvalds <torvalds@linux-foundation.org>
References: <20221116102659.70287-1-david@redhat.com>
 <20221116102659.70287-21-david@redhat.com>
 <CAHk-=wgtEwpR-rE_=cXzecHMZ+zgrx5zf9UfvH0w-mKgckn4=Q@mail.gmail.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH mm-unstable v1 20/20] mm: rename FOLL_FORCE to FOLL_PTRACE
In-Reply-To: <CAHk-=wgtEwpR-rE_=cXzecHMZ+zgrx5zf9UfvH0w-mKgckn4=Q@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
Cc: Mark Rutland <mark.rutland@arm.com>, linux-ia64@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Dave Hansen <dave.hansen@linux.intel.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Will Deacon <will@kernel.org>, Nadav Amit <namit@vmware.com>,
 Michael Ellerman <mpe@ellerman.id.au>, linux-kselftest@vger.kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org,
 Shuah Khan <shuah@kernel.org>, Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Andrea Arcangeli <aarcange@redhat.com>, linux-samsung-soc@vger.kernel.org,
 Paul Moore <paul@paul-moore.com>, linux-rdma@vger.kernel.org, x86@kernel.org,
 Hugh Dickins <hughd@google.com>, James Morris <jmorris@namei.org>,
 Matthew Wilcox <willy@infradead.org>, Christoph Hellwig <hch@infradead.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Ingo Molnar <mingo@redhat.com>,
 Vlastimil Babka <vbabka@suse.cz>, Matt Turner <mattst88@gmail.com>,
 Kentaro Takeda <takedakn@nttdata.co.jp>, linux-media@vger.kernel.org,
 Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>,
 John Hubbard <jhubbard@nvidia.com>, linux-um@lists.infradead.org,
 etnaviv@lists.freedesktop.org, Nicholas Piggin <npiggin@gmail.com>,
 Richard Weinberger <richard@nod.at>,
 Alex Williamson <alex.williamson@redhat.com>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Peter Xu <peterx@redhat.com>,
 Muchun Song <songmuchun@bytedance.com>, Namhyung Kim <namhyung@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 Arnaldo Carvalho de Melo <acme@kernel.org>, Oleg Nesterov <oleg@redhat.com>,
 linux-arm-kernel@lists.infradead.org, "Serge E. Hallyn" <serge@hallyn.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Oded Gabbay <ogabbay@kernel.org>, linux-mips@vger.kernel.org,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>, linux-perf-users@vger.kernel.org,
 Johannes Berg <johannes@sipsolutions.net>,
 linux-security-module@vger.kernel.org, Eric Biederman <ebiederm@xmission.com>,
 Jiri Olsa <jolsa@kernel.org>, linux-alpha@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Borislav Petkov <bp@alien8.de>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 16.11.22 19:16, Linus Torvalds wrote:
> On Wed, Nov 16, 2022 at 2:30 AM David Hildenbrand <david@redhat.com> wrote:
>>
>> Let's make it clearer that functionality provided by FOLL_FORCE is
>> really only for ptrace access.
> 
> I'm not super-happy about this one.
> 
> I do understand the "let's rename the bit so that no new user shows up".
> 
> And it's true that the main traditional use is ptrace.
> 
> But from the patch itself it becomes obvious that no, it's not *just*
> ptrace. At least not yet.
> 
> It's used for get_arg_page(), which uses it to basically look up (and
> install) pages in the newly created VM.
> 
> Now, I'm not entirely sure why it even uses FOLL_FORCE, - I think it
> might be historical, because the target should always be the new stack
> vma.
> 
> Following the history of it is a big of a mess, because there's a
> number of renamings and re-organizations, but it seems to go back to
> 2007 and commit b6a2fea39318 ("mm: variable length argument support").
> 

Right.

> Before that commit, we kept our own array of "this is the set of pages
> that I will install in the new VM". That commit basically just inserts
> the pages directly into the VM instead, getting rid of the array size
> limitation.
> 
> So at a minimum, I think that FOLL_FORCE would need to be removed
> before any renaming to FOLL_PTRACE, because that's not some kind of
> small random case.
> 
> It *might* be as simple as just removing it, but maybe there's some
> reason for having it that I don't immediately see.

Right, I have the same feeling. It might just be a copy-and-paste legacy 
leftover.

> 
> There _are_ also small random cases too, like get_cmdline(). Maybe
> that counts as ptrace, but the execve() case most definitely does not.

I agree. I'd suggest moving forward without this (last) patch for now 
and figuring out how to further cleanup FOLL_FORCE usage on top.

@Andrew, if you intend to put this into mm-unstable, please drop the 
last patch for now.

-- 
Thanks,

David / dhildenb

