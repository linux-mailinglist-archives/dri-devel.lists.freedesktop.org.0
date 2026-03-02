Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gVB/Ar2vpWkiEgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 16:41:49 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D5EE1DC0A0
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 16:41:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B8AF10E530;
	Mon,  2 Mar 2026 15:41:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="yDVao2ku";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com
 [209.85.128.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1400710E52F
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2026 15:41:45 +0000 (UTC)
Received: by mail-wm1-f74.google.com with SMTP id
 5b1f17b1804b1-4836bf1a920so47765215e9.3
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Mar 2026 07:41:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1772466103; x=1773070903;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=fvJ4Pj0Wo9ryI9xJ6mJ9OBJG9CVcmeBhutvadxQnZZs=;
 b=yDVao2kutJij3UcQPjbx19mZXojU4aZRhj+awnsgjYAAJrkJv2z5k7Y6WlsSuPyNEQ
 OgT7Ey7Bb2eBLYvTQ8DP7xwSncZUR3/Px3uTZ0KSC/VWUMrULjoDQlRs9pfDJ/v1tlWC
 X3wiYQYaNOF4SZ5utaAI2nuqyTcAde9cu7qxXu2WbCh/qPmDI3fUzAKcCFCOfLefzPQB
 r8JTQJ3juH19MpSS17wgYTxpKlx1T++QZ810Zgr3/UZsmlFsgYqbw102xelsqno1jFRn
 LpTYhrEUXi9c+1gXi+MRtMQHFjRavPtCbFlA1Pmm2d+QPoRk7NK2mdJx2mvUVNybPXqF
 HBAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772466103; x=1773070903;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fvJ4Pj0Wo9ryI9xJ6mJ9OBJG9CVcmeBhutvadxQnZZs=;
 b=YHyUo2ULqfAZ3OGHqKiZlU5VHRUybERkXyh/2WR3WmgYWWR9ELPCzb6QcgZNd8AcyR
 NAbhKVkF+5YGFEpFrllSnF4Rp9OTwsAWavAenEuCP+Pk6ljCHqrId+ntdpP0Jr5SznrK
 Fuwn4PVfxzKxPIuby8Dm0DqiKkzvoLUGIT9ZRQLvDqWqvTj6Fn+RHCcYdQehYV0mVWiB
 gBUKOGPj1cgJ3WROlVnkfuW2G+ZZZTH6yT82s8tXAaHFwUKa9XXZbthm0JdPlXNfvgC0
 /5ygUoTdmrjL9dM8aD9y610FOl2qxrjDn7lenqV48jfpgU+rj/eM2wUzjgRc4NL3Ybw+
 +UXQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX77wdFhQK8sAOFSX0SxszZdpEexqPxcukf5zU9JpUA+KK9nk8TpvHwcup8cyc1LocfApu46BRwZPA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyQuHxOp8SulBON/03aP7h+1UnZmr6vWwzlYk/fsFqFz4Ij18LU
 wxeWlFS4tczalXhCsx+QxV7rHW6CjDPZtHaWuQa/GZ5e5+IaKdP572VS6aKm+Dki3oe/lzEsYDA
 9wd5B7Rtzw35Bds8WdA==
X-Received: from wmby19.prod.google.com ([2002:a05:600c:c053:b0:480:690c:88de])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3b18:b0:483:7432:a761 with SMTP id
 5b1f17b1804b1-483c9bc558bmr213622465e9.24.1772466102970; 
 Mon, 02 Mar 2026 07:41:42 -0800 (PST)
Date: Mon, 2 Mar 2026 15:41:42 +0000
In-Reply-To: <5f8dcb7f-9e4f-4484-b160-3a9ce541d63c@kernel.org>
Mime-Version: 1.0
References: <20260227200848.114019-1-david@kernel.org>
 <20260227200848.114019-3-david@kernel.org>
 <aaLh2BxSgC9Jl5iS@google.com>
 <8a27e9ac-2025-4724-a46d-0a7c90894ba7@kernel.org>
 <aaVf5gv4XjV6Ddt-@google.com>
 <f2f3a8a1-3dbf-4ef9-a89a-a6ec20791d1c@kernel.org>
 <aaVnifbdxKhBddQp@google.com>
 <5f8dcb7f-9e4f-4484-b160-3a9ce541d63c@kernel.org>
Message-ID: <aaWvtn48X8UizaaN@google.com>
Subject: Re: [PATCH v1 02/16] mm/memory: remove "zap_details" parameter from
 zap_page_range_single()
From: Alice Ryhl <aliceryhl@google.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: linux-kernel@vger.kernel.org, 
 "linux-mm @ kvack . org" <linux-mm@kvack.org>,
 Andrew Morton <akpm@linux-foundation.org>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Jann Horn <jannh@google.com>, 
 Pedro Falcato <pfalcato@suse.de>, David Rientjes <rientjes@google.com>, 
 Shakeel Butt <shakeel.butt@linux.dev>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Janosch Frank <frankja@linux.ibm.com>, 
 Claudio Imbrenda <imbrenda@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, 
 Vasily Gorbik <gor@linux.ibm.com>, Jarkko Sakkinen <jarkko@kernel.org>,
 Thomas Gleixner <tglx@kernel.org>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Arve =?utf-8?B?SGrDuG5uZXbDpWc=?=" <arve@android.com>,
 Todd Kjos <tkjos@android.com>, 
 Christian Brauner <brauner@kernel.org>, Carlos Llamas <cmllamas@google.com>,
 Ian Abbott <abbotti@mev.co.uk>, 
 H Hartley Sweeten <hsweeten@visionengravers.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Jason Gunthorpe <jgg@ziepe.ca>,
 Leon Romanovsky <leon@kernel.org>, 
 Dimitri Sivanich <dimitri.sivanich@hpe.com>, Arnd Bergmann <arnd@arndb.de>, 
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
 Andrii Nakryiko <andrii@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>,
 Andy Lutomirski <luto@kernel.org>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Eric Dumazet <edumazet@google.com>, 
 Neal Cardwell <ncardwell@google.com>, "David S. Miller" <davem@davemloft.net>, 
 David Ahern <dsahern@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, 
 Miguel Ojeda <ojeda@kernel.org>, linuxppc-dev@lists.ozlabs.org,
 kvm@vger.kernel.org, 
 linux-s390@vger.kernel.org, linux-sgx@vger.kernel.org, 
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-rdma@vger.kernel.org, bpf@vger.kernel.org, 
 linux-perf-users@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 netdev@vger.kernel.org, rust-for-linux@vger.kernel.org, x86@kernel.org
Content-Type: text/plain; charset="utf-8"
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
X-Rspamd-Queue-Id: 5D5EE1DC0A0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:david@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-mm@kvack.org,m:akpm@linux-foundation.org,m:lorenzo.stoakes@oracle.com,m:Liam.Howlett@oracle.com,m:vbabka@kernel.org,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:jannh@google.com,m:pfalcato@suse.de,m:rientjes@google.com,m:shakeel.butt@linux.dev,m:willy@infradead.org,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:borntraeger@linux.ibm.com,m:frankja@linux.ibm.com,m:imbrenda@linux.ibm.com,m:agordeev@linux.ibm.com,m:gerald.schaefer@linux.ibm.com,m:hca@linux.ibm.com,m:gor@linux.ibm.com,m:jarkko@kernel.org,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:gregkh@linuxfoundation.org,m:arve@android.com,m:tkjos@android.com,m:brauner@kernel.org,m:cmllamas@google.com,m:abbotti@mev.co.uk,m:hsweeten@visionengravers.com,m:jani.nikula@linux.intel.com,m:joonas.lahtinen@linux.intel.com,m:rodrigo.vivi@intel.com,m:tursulin@ursulin.net,m:airlied@gmail.com,m:simona@ffwll.ch,m:jgg@ziepe.ca,m:leon@kernel.org,m:
 dimitri.sivanich@hpe.com,m:arnd@arndb.de,m:ast@kernel.org,m:daniel@iogearbox.net,m:andrii@kernel.org,m:peterz@infradead.org,m:acme@kernel.org,m:namhyung@kernel.org,m:luto@kernel.org,m:vincenzo.frascino@arm.com,m:edumazet@google.com,m:ncardwell@google.com,m:davem@davemloft.net,m:dsahern@kernel.org,m:kuba@kernel.org,m:pabeni@redhat.com,m:ojeda@kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:kvm@vger.kernel.org,m:linux-s390@vger.kernel.org,m:linux-sgx@vger.kernel.org,m:intel-gfx@lists.freedesktop.org,m:linux-rdma@vger.kernel.org,m:bpf@vger.kernel.org,m:linux-perf-users@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,m:netdev@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:x86@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[aliceryhl@google.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,kvack.org,linux-foundation.org,oracle.com,kernel.org,google.com,suse.com,suse.de,linux.dev,infradead.org,linux.ibm.com,ellerman.id.au,redhat.com,alien8.de,linuxfoundation.org,android.com,mev.co.uk,visionengravers.com,linux.intel.com,intel.com,ursulin.net,gmail.com,ffwll.ch,ziepe.ca,hpe.com,arndb.de,iogearbox.net,arm.com,davemloft.net,lists.ozlabs.org,lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	RCPT_COUNT_GT_50(0.00)[73];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aliceryhl@google.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[google.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

On Mon, Mar 02, 2026 at 04:01:44PM +0100, David Hildenbrand (Arm) wrote:
> On 3/2/26 11:33, Alice Ryhl wrote:
> > On Mon, Mar 02, 2026 at 11:27:40AM +0100, David Hildenbrand (Arm) wrote:
> >> On 3/2/26 11:01, Alice Ryhl wrote:
> >>>
> >>> Well, rustfmt comes with the compiler, and it would be ideal to build
> >>> test changes before sending them :)
> >>
> >> At least on Ubuntu on my notebook where I do most of the coding+patch
> >> submissions it's a separate package?
> >>
> >> I do all my builds on a different (more powerful) machine where the
> >> whole rust machinery's in place. Further, build bots that run on my
> >> private branches did not report any issues.
> > 
> > There are some build bots that check for rustfmt, though not all of
> > them.
> > 
> >>> But no worries, I took care of testing it. Thanks for taking the time to
> >>> update the Rust code as well.
> >>
> >> I just did an allyesconfig and it does not report any warnings.
> >>
> >> So apparently, rustfmt problems not result in the compiler complaining?
> >>
> >> Or something else is off here that rust/kernel/mm/virt.rs won't get
> >> compiled on my machine, even with allyesconfig. I can definitely see
> >> some RUSTC stuff happening in the logs, like
> >>
> >> 	RUSTC L rust/kernel.o
> >>
> >> Thanks for the review and for pointing out rustfmt!
> > 
> > Similar to kerneldoc and other similar targets, formatting isn't checked
> > in the normal build, but make can be invoked on the rustfmtcheck target
> > to check it.
> 
> Thanks adding that to my cross-compile chain.

Awesome, thanks!

It's not relevant in this patch, but another thing that may be useful is
to add CLIPPY=1 to the make invocation when building normally. This
causes additional warnings to be checked using a tool called clippy.

Alice
