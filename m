Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 663BD62E8ED
	for <lists+dri-devel@lfdr.de>; Thu, 17 Nov 2022 23:58:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3083010E6BE;
	Thu, 17 Nov 2022 22:58:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9394210E6BC
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Nov 2022 22:58:21 +0000 (UTC)
Received: by mail-pg1-x52b.google.com with SMTP id 130so3443443pgc.5
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Nov 2022 14:58:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=gB4fu8WxG++brcac1xEx09Jo8IsSv6jaRuNq5hahL+I=;
 b=Fy4BdUGW9a1WNEtqYFLG188KBaVxCW7dlYHJCJYByhqbYzWtrREex26XefPtc0cld6
 YCRtECSkUML5k6sMmax4MrQy/8YHDQGVY6nBvl6IgyA0kq1FCwf8z9yqhcxsos46Zhwv
 H1rDgpoCNHoreRPMRNhXYMHZ9u7/T1h/SC+nQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gB4fu8WxG++brcac1xEx09Jo8IsSv6jaRuNq5hahL+I=;
 b=G9tlcwVK4Vuq5+D7ExCGYT+jZ5hvynHTsB4L8J3Q5AmtmDMFnPjXGUJcgxVOuSUj1A
 Kel2U2JzN1OdNitfct+47j1aLMGf96ZLkj9CYsbkJhnVsK5dovCasDdJWEybuiC3iPPx
 P73hhJyrBXpHAAl/N7vEt45uj5wXt537ygh2VCTnbQZGtuIkPF+AeuU+9VD1XDCbhQ8k
 rrik8bj3/xZxDFDYidV+mJGsHd2pDaa1zxlRFCnnfgbFh94p8vHj7Vm37cHKNuZLB5Ua
 OuCZIFeDUG31nvzswtvbp9QXUryNIrxHYK7fipXPltYMnqkEe+U66gu3E2AtcHiJhPXI
 A9YA==
X-Gm-Message-State: ANoB5plig4/kvdScyKsynYEvpoGP2yWj3PS6/MnYfdTRS7A/a5P4FCLJ
 DJCWG7qJeQxSnOCJ1tOa4ZEc8Q==
X-Google-Smtp-Source: AA0mqf6WctuXnFpA5+6mUDbrkWFd9cOPvCXdH+vpFiVVPZ82O749B2W9Fe6xlTKz0BNICgCat8tmyw==
X-Received: by 2002:aa7:80d0:0:b0:565:c4e2:2634 with SMTP id
 a16-20020aa780d0000000b00565c4e22634mr5143922pfn.0.1668725901160; 
 Thu, 17 Nov 2022 14:58:21 -0800 (PST)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net.
 [198.0.35.241]) by smtp.gmail.com with ESMTPSA id
 u139-20020a627991000000b00561cf757749sm1677934pfc.183.2022.11.17.14.58.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Nov 2022 14:58:20 -0800 (PST)
Date: Thu, 17 Nov 2022 14:58:19 -0800
From: Kees Cook <keescook@chromium.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH mm-unstable v1 20/20] mm: rename FOLL_FORCE to FOLL_PTRACE
Message-ID: <202211171439.CDE720EAD@keescook>
References: <20221116102659.70287-1-david@redhat.com>
 <20221116102659.70287-21-david@redhat.com>
 <CAHk-=wgtEwpR-rE_=cXzecHMZ+zgrx5zf9UfvH0w-mKgckn4=Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wgtEwpR-rE_=cXzecHMZ+zgrx5zf9UfvH0w-mKgckn4=Q@mail.gmail.com>
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
 David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Dave Hansen <dave.hansen@linux.intel.com>, dri-devel@lists.freedesktop.org,
 linux-mips@vger.kernel.org, linux-mm@kvack.org, Will Deacon <will@kernel.org>,
 Nadav Amit <namit@vmware.com>, Michael Ellerman <mpe@ellerman.id.au>,
 linux-kselftest@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 sparclinux@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Andrea Arcangeli <aarcange@redhat.com>, linux-samsung-soc@vger.kernel.org,
 Paul Moore <paul@paul-moore.com>, linux-rdma@vger.kernel.org, x86@kernel.org,
 Hugh Dickins <hughd@google.com>, James Morris <jmorris@namei.org>,
 Matthew Wilcox <willy@infradead.org>, Christoph Hellwig <hch@infradead.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Ingo Molnar <mingo@redhat.com>,
 Vlastimil Babka <vbabka@suse.cz>, Matt Turner <mattst88@gmail.com>,
 Kentaro Takeda <takedakn@nttdata.co.jp>, linux-media@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, John Hubbard <jhubbard@nvidia.com>,
 linux-um@lists.infradead.org, etnaviv@lists.freedesktop.org,
 Nicholas Piggin <npiggin@gmail.com>, Richard Weinberger <richard@nod.at>,
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
 Oded Gabbay <ogabbay@kernel.org>, linux-kernel@vger.kernel.org,
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

On Wed, Nov 16, 2022 at 10:16:34AM -0800, Linus Torvalds wrote:
> There _are_ also small random cases too, like get_cmdline(). Maybe
> that counts as ptrace, but the execve() case most definitely does not.

Oh, er, why does get_arg_page() even need FOLL_FORCE? This is writing the
new stack contents to the nascent brpm->vma, which was newly allocated
with VM_STACK_FLAGS, which an arch can override, but they all appear to include
VM_WRITE | VM_MAYWRITE.

-- 
Kees Cook
