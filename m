Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B7F0B63001C
	for <lists+dri-devel@lfdr.de>; Fri, 18 Nov 2022 23:29:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DFAF10E7E7;
	Fri, 18 Nov 2022 22:29:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C22EC10E7E6
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Nov 2022 22:29:03 +0000 (UTC)
Received: by mail-pj1-x102a.google.com with SMTP id
 l22-20020a17090a3f1600b00212fbbcfb78so9527169pjc.3
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Nov 2022 14:29:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=UbBsvDU//DL6nEBTfVogOGw4gtrIt5cEgoWU7wg0yqE=;
 b=An8R27hBelrmHfCbOWIi0CQbpB+FbdUKZd/K74OWA+t1inv8v4494buerQXpAbVoQ/
 hawXo5IWqwOaOJXIlgQJ62nY4aZ8mzIQL8T0sN5QawgAa8EGZw3klOrzN/KXycM8ohn1
 PnwiDQNXHvwQENzmlhMaoO6BFIxzwB92hREPE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UbBsvDU//DL6nEBTfVogOGw4gtrIt5cEgoWU7wg0yqE=;
 b=l1tVL1YnszYeUGg7iz2/B1Gs8Czc44uLRjnBJWT8QW9JpCDV+iBfQVvQXSCCAzTZBL
 VMms0x1NXptREZH1IGsBL7JeF3aCCH9uXSugVumQjQF4lgzLrMGEDnmOC+hnOoXiwQgp
 tw9NS/D+Aihq7wV9VgcEKhvIXI/N85hqRMRFPqn0mKggtcAJJ9qxuNt4AR3CdvrhfY1u
 mmINecqwtWnTcZHRxNB3ETJG4dgLm9UqtIYH+LvglX+1/V6/wEl+a/PxqYzLlUhLyhpC
 Fe5RISXCf5qfycY1lcoH58sN1J8YQkk72uIgrE4jSF2Fz2VJhqLA6bjvnredte+CWCtP
 mSJQ==
X-Gm-Message-State: ANoB5pkxOhhiJRJdHdc6gwCBKg8v0Sm9c0OeY5TpSnIbofAVdithNyHD
 803ndGsNjxU2qQpbK/oFLbRZ8w==
X-Google-Smtp-Source: AA0mqf6CgTDul/374P0W7rrlIZwWC/WtPB/rFM9c4Pb8H4WjGT5BNPOAuJqtgF8hwxBjrZP80dPQ5g==
X-Received: by 2002:a17:902:7b96:b0:188:b0db:cd5d with SMTP id
 w22-20020a1709027b9600b00188b0dbcd5dmr1455470pll.104.1668810543328; 
 Fri, 18 Nov 2022 14:29:03 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id
 f26-20020aa7969a000000b00571dda13fafsm3646997pfk.163.2022.11.18.14.29.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Nov 2022 14:29:02 -0800 (PST)
Date: Fri, 18 Nov 2022 14:29:02 -0800
From: Kees Cook <keescook@chromium.org>
To: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH mm-unstable v1 20/20] mm: rename FOLL_FORCE to FOLL_PTRACE
Message-ID: <202211181427.4D1C3132FE@keescook>
References: <20221116102659.70287-1-david@redhat.com>
 <20221116102659.70287-21-david@redhat.com>
 <CAHk-=wgtEwpR-rE_=cXzecHMZ+zgrx5zf9UfvH0w-mKgckn4=Q@mail.gmail.com>
 <Y3dnzgwJpjTQXI9y@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y3dnzgwJpjTQXI9y@hirez.programming.kicks-ass.net>
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
 David Hildenbrand <david@redhat.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Dave Hansen <dave.hansen@linux.intel.com>, dri-devel@lists.freedesktop.org,
 linux-mips@vger.kernel.org, linux-mm@kvack.org, Will Deacon <will@kernel.org>,
 Nadav Amit <namit@vmware.com>, Michael Ellerman <mpe@ellerman.id.au>,
 linux-kselftest@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 sparclinux@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 Borislav Petkov <bp@alien8.de>, Andrea Arcangeli <aarcange@redhat.com>,
 linux-samsung-soc@vger.kernel.org, Paul Moore <paul@paul-moore.com>,
 linux-rdma@vger.kernel.org, x86@kernel.org, Hugh Dickins <hughd@google.com>,
 James Morris <jmorris@namei.org>, Matthew Wilcox <willy@infradead.org>,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Ingo Molnar <mingo@redhat.com>, Vlastimil Babka <vbabka@suse.cz>,
 Matt Turner <mattst88@gmail.com>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>, linux-media@vger.kernel.org,
 Kentaro Takeda <takedakn@nttdata.co.jp>, Arnd Bergmann <arnd@arndb.de>,
 John Hubbard <jhubbard@nvidia.com>, linux-um@lists.infradead.org,
 etnaviv@lists.freedesktop.org, Nicholas Piggin <npiggin@gmail.com>,
 Richard Weinberger <richard@nod.at>,
 Alex Williamson <alex.williamson@redhat.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Peter Xu <peterx@redhat.com>,
 Muchun Song <songmuchun@bytedance.com>, Namhyung Kim <namhyung@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 Arnaldo Carvalho de Melo <acme@kernel.org>, Oleg Nesterov <oleg@redhat.com>,
 linux-arm-kernel@lists.infradead.org, "Serge E. Hallyn" <serge@hallyn.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Oded Gabbay <ogabbay@kernel.org>, linux-kernel@vger.kernel.org,
 Alexander Viro <viro@zeniv.linux.org.uk>, linux-perf-users@vger.kernel.org,
 Johannes Berg <johannes@sipsolutions.net>,
 linux-security-module@vger.kernel.org, Eric Biederman <ebiederm@xmission.com>,
 Jiri Olsa <jolsa@kernel.org>, linux-alpha@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Nov 18, 2022 at 12:09:02PM +0100, Peter Zijlstra wrote:
> On Wed, Nov 16, 2022 at 10:16:34AM -0800, Linus Torvalds wrote:
> > Following the history of it is a big of a mess, because there's a
> > number of renamings and re-organizations, but it seems to go back to
> > 2007 and commit b6a2fea39318 ("mm: variable length argument support").
> 
> I went back and read parts of the discussions with Ollie, and the
> .force=1 thing just magically appeared one day when we were sending
> work-in-progress patches back and forth without mention of where it came
> from :-/
> 
> And I certainly can't remember now..
> 
> Looking at it now, I have the same reaction as both you and Kees had, it
> seems entirely superflous. So I'm all for trying to remove it.

Thanks for digging through the history! I've pushed the change to -next:
https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git/commit/?h=for-next/execve&id=cd57e443831d8eeb083c7165bce195d886e216d4

-- 
Kees Cook
