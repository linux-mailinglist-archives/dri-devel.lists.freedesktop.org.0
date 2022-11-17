Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 732B162E977
	for <lists+dri-devel@lfdr.de>; Fri, 18 Nov 2022 00:20:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D574110E6C7;
	Thu, 17 Nov 2022 23:20:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com
 [IPv6:2607:f8b0:4864:20::72c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 706A810E6C7
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Nov 2022 23:20:21 +0000 (UTC)
Received: by mail-qk1-x72c.google.com with SMTP id k4so2357567qkj.8
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Nov 2022 15:20:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Y0Zl62KafxDJ8AwrDahi1bqb4Xk/32bDlmDdXpQC/2I=;
 b=McHst7l/f7KmgETncU4ax8Cz1+X0pDSSDz+NpOo85KKRbSTGF3eq2IAlrIRy/FELSJ
 Y7C0SIlyu5mGQyhzPLIjsCXMOXUrzD5TZH+dJcbaF2LHrVuVcof8hyWOL3D9pZZx4wAD
 8LINQRolzJh6QXumNwKV51jsDIdF9sMEo4+5s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Y0Zl62KafxDJ8AwrDahi1bqb4Xk/32bDlmDdXpQC/2I=;
 b=2sycQemg5xb8WZXMesD0A0nVXKOgrV8QqR933cbIyhM41rtUyGs0TZe/x90xpb2Jd/
 /jUFN+X3/iVXO44Tw8AiiE4HJc/EcgYD1WVawQ03xY8iE/D3c3XyIfYb6ISjxSt4uTd/
 RyuUuttn0EjJi0P3JiwX67H5oNzb71VoGUu2PG2XBFHeH8XcmHDQVPNG03PzMSC42Zux
 MIYO8fV//hVpmyzP2oX6wAtv8R3XxyatsdmL06kzLxIVs9IwQUl5c4/yCxqGUVeudttU
 WdG5Wb1afdHyOUS6V04wr1BLJGwNZolif8d6Wc/sdeHhnp6yyVct4OggKfm1t6yhM530
 aodg==
X-Gm-Message-State: ANoB5pkbQFieRRLTcHGfgt3HSHD/iFV31AZfLmFRTPGkAZlGj4a+RA8a
 x2D86eXWmv1IE50xwNUBqbw1Hn9QKDVMdg==
X-Google-Smtp-Source: AA0mqf4HfHd2mNv+I8aVKSFZoOo+pVebFTi2bm3P3iQSo8DiVXxjidnQFsmqW/NdSmqqqqiBVmbT+Q==
X-Received: by 2002:a05:620a:561:b0:6fa:39c3:61cc with SMTP id
 p1-20020a05620a056100b006fa39c361ccmr3787557qkp.386.1668727219859; 
 Thu, 17 Nov 2022 15:20:19 -0800 (PST)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com.
 [209.85.219.49]) by smtp.gmail.com with ESMTPSA id
 v10-20020a05620a440a00b006fab416015csm1413402qkp.25.2022.11.17.15.20.17
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Nov 2022 15:20:17 -0800 (PST)
Received: by mail-qv1-f49.google.com with SMTP id df6so64268qvb.0
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Nov 2022 15:20:17 -0800 (PST)
X-Received: by 2002:ad4:4101:0:b0:4b1:856b:4277 with SMTP id
 i1-20020ad44101000000b004b1856b4277mr4665856qvp.129.1668727216978; Thu, 17
 Nov 2022 15:20:16 -0800 (PST)
MIME-Version: 1.0
References: <20221116102659.70287-1-david@redhat.com>
 <20221116102659.70287-21-david@redhat.com>
 <CAHk-=wgtEwpR-rE_=cXzecHMZ+zgrx5zf9UfvH0w-mKgckn4=Q@mail.gmail.com>
 <202211171439.CDE720EAD@keescook>
In-Reply-To: <202211171439.CDE720EAD@keescook>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 17 Nov 2022 15:20:01 -0800
X-Gmail-Original-Message-ID: <CAHk-=wjykbz-4xVTWF7vkvGJnFoTSXNVeMzfsXaLnGm3CRd8rQ@mail.gmail.com>
Message-ID: <CAHk-=wjykbz-4xVTWF7vkvGJnFoTSXNVeMzfsXaLnGm3CRd8rQ@mail.gmail.com>
Subject: Re: [PATCH mm-unstable v1 20/20] mm: rename FOLL_FORCE to FOLL_PTRACE
To: Kees Cook <keescook@chromium.org>
Content-Type: text/plain; charset="UTF-8"
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

On Thu, Nov 17, 2022 at 2:58 PM Kees Cook <keescook@chromium.org> wrote:
>
> Oh, er, why does get_arg_page() even need FOLL_FORCE? This is writing the
> new stack contents to the nascent brpm->vma, which was newly allocated
> with VM_STACK_FLAGS, which an arch can override, but they all appear to include
> VM_WRITE | VM_MAYWRITE.

Yeah, it does seem entirely superfluous.

It's been there since the very beginning (although in that original
commit b6a2fea39318 it was there as a '1' to the 'force' argument to
get_user_pages()).

I *think* it can be just removed. But as long as it exists, it should
most definitely not be renamed to FOLL_PTRACE.

There's a slight worry that it currently hides some other setup issue
that makes it matter, since it's been that way so long, but I can't
see what it is.

             Linus
