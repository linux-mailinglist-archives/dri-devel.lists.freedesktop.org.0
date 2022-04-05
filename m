Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 77F974F2F67
	for <lists+dri-devel@lfdr.de>; Tue,  5 Apr 2022 14:12:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B835210E5A6;
	Tue,  5 Apr 2022 12:12:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9886F10E2E2
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Apr 2022 12:12:49 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 2FE681F745;
 Tue,  5 Apr 2022 12:12:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1649160767; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YGolTQlWegdqsJgfgfOCgFdotBM/n5qIvgfFfvEjxd0=;
 b=BK6a6qL8o7p/MJgbNqqctnSF5bmv5BGKuuqBTv2USITbTpPoKI1f15ogW871KoTo/RdheN
 2ofE8y9/q59bmAhdL1seIYTAGQd263xP4FVoKwCcc/FYdRc3tUwqP3pmlISrihOeY4NF+U
 B5AcViJAx3CYaDGctEIJbO7LJzMoxwU=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id AA5C913A04;
 Tue,  5 Apr 2022 12:12:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id s8TPKD4yTGIlCAAAMHmgww
 (envelope-from <mkoutny@suse.com>); Tue, 05 Apr 2022 12:12:46 +0000
Date: Tue, 5 Apr 2022 14:12:45 +0200
From: Michal =?iso-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>
To: "T.J. Mercier" <tjmercier@google.com>
Subject: Re: [RFC v4 5/8] dmabuf: Add gpu cgroup charge transfer function
Message-ID: <20220405121245.GA30368@blackbody.suse.cz>
References: <20220328035951.1817417-1-tjmercier@google.com>
 <20220328035951.1817417-6-tjmercier@google.com>
 <20220329152142.GA15794@blackbody.suse.cz>
 <CABdmKX2874NdYCBzpKLnqWhZQDkC2wKz4ZL_aFNqrec6iAutpQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABdmKX2874NdYCBzpKLnqWhZQDkC2wKz4ZL_aFNqrec6iAutpQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Zefan Li <lizefan.x@bytedance.com>, linux-doc@vger.kernel.org,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Kalesh Singh <kaleshsingh@google.com>, Joel Fernandes <joel@joelfernandes.org>,
 Shuah Khan <shuah@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 Kenny.Ho@amd.com, Jonathan Corbet <corbet@lwn.net>,
 Martijn Coenen <maco@android.com>, Laura Abbott <labbott@redhat.com>,
 linux-media@vger.kernel.org, linux-kselftest@vger.kernel.org,
 Todd Kjos <tkjos@android.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 linaro-mm-sig@lists.linaro.org, Tejun Heo <tj@kernel.org>,
 Shuah Khan <skhan@linuxfoundation.org>, cgroups@vger.kernel.org,
 Suren Baghdasaryan <surenb@google.com>, Christian Brauner <brauner@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Liam Mark <lmark@codeaurora.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Arve =?iso-8859-1?B?SGr4bm5lduVn?= <arve@android.com>,
 Johannes Weiner <hannes@cmpxchg.org>, Hridya Valsaraju <hridya@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 01, 2022 at 11:41:36AM -0700, "T.J. Mercier" <tjmercier@google.com> wrote:
> This link doesn't work for me, but I think you're referring to the
> discussion about your "RAM_backed_buffers" comment from March 23rd.

(Oops, it's a non-public message. But yes, you guessed it right ;-))

> Anyway the test I did goes like this: enable memcg and gpu cgoups
> tracking and run a process that allocates 100MiB of dmabufs. Observe
> memcg and gpu accounting values before and after the allocation.

Thanks for this measurement/dem/demoo.

> Before
> # cat memory.current gpu.memory.current
> 14909440
> system 0
> 
> <Test program does the allocation of 100MiB of dmabufs>
> 
> After
> # cat memory.current gpu.memory.current
> 48025600
> system 104857600
> 
> So the memcg value increases by about 30 MiB while the gpu values
> increases by 100 MiB.

> This is with kmem enabled, and the /proc/maps
> file for this process indicates that the majority of that 30 MiB is
> kernel memory.

> I think this result shows that neither the kernel nor process memory
> overlap with the gpu cgroup tracking of these allocations.

It depends how the semantics of the 'system' entry is defined, no?
As I grasped from other thread, the 'total' is going to be removed, so
'system' represents exclusively device memory?


> So despite the fact that these buffers are in main memory, they are
> allocated in a way that does not result in memcg attribution. (It
> looks to me like __GFP_ACCOUNT is not set for these.)

(I thought you knew what dmabufs your program used :-p)

So, the goal is to do the tracking and migrations only via the gpu cg
layer, regardless how memcg charges it (or not).

(I have no opinion on that, I'm just summing it so that we're on the
same page.)

Michal
