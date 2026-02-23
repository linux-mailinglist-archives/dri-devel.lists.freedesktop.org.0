Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kHMhCMEgnGkZ/wMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 10:41:21 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC4C7174108
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 10:41:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAD9C10E2C9;
	Mon, 23 Feb 2026 09:41:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from invmail4.hynix.com (exvmail4.hynix.com [166.125.252.92])
 by gabe.freedesktop.org (Postfix) with ESMTP id ADE3310E1C3
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 00:32:16 +0000 (UTC)
X-AuditID: a67dfc5b-c45ff70000001609-c0-699ba00d57c1
Date: Mon, 23 Feb 2026 09:32:07 +0900
From: Byungchul Park <byungchul@sk.com>
To: Dirk Behme <dirk.behme@gmx.de>
Cc: linux-kernel@vger.kernel.org, kernel_team@skhynix.com,
 torvalds@linux-foundation.org, damien.lemoal@opensource.wdc.com,
 linux-ide@vger.kernel.org, adilger.kernel@dilger.ca,
 linux-ext4@vger.kernel.org, mingo@redhat.com, peterz@infradead.org,
 will@kernel.org, tglx@linutronix.de, rostedt@goodmis.org,
 joel@joelfernandes.org, sashal@kernel.org, daniel.vetter@ffwll.ch,
 duyuyang@gmail.com, johannes.berg@intel.com, tj@kernel.org,
 tytso@mit.edu, willy@infradead.org, david@fromorbit.com,
 amir73il@gmail.com, gregkh@linuxfoundation.org, kernel-team@lge.com,
 linux-mm@kvack.org, akpm@linux-foundation.org, mhocko@kernel.org,
 minchan@kernel.org, hannes@cmpxchg.org, vdavydov.dev@gmail.com,
 sj@kernel.org, jglisse@redhat.com, dennis@kernel.org, cl@linux.com,
 penberg@kernel.org, rientjes@google.com, vbabka@suse.cz,
 ngupta@vflare.org, linux-block@vger.kernel.org,
 josef@toxicpanda.com, linux-fsdevel@vger.kernel.org, jack@suse.cz,
 jlayton@kernel.org, dan.j.williams@intel.com, hch@infradead.org,
 djwong@kernel.org, dri-devel@lists.freedesktop.org,
 rodrigosiqueiramelo@gmail.com, melissa.srw@gmail.com,
 hamohammed.sa@gmail.com, harry.yoo@oracle.com,
 chris.p.wilson@intel.com, gwan-gyeong.mun@intel.com,
 max.byungchul.park@gmail.com, boqun.feng@gmail.com,
 longman@redhat.com, yunseong.kim@ericsson.com, ysk@kzalloc.com,
 yeoreum.yun@arm.com, netdev@vger.kernel.org,
 matthew.brost@intel.com, her0gyugyu@gmail.com, corbet@lwn.net,
 catalin.marinas@arm.com, bp@alien8.de, x86@kernel.org,
 hpa@zytor.com, luto@kernel.org, sumit.semwal@linaro.org,
 gustavo@padovan.org, christian.koenig@amd.com,
 andi.shyti@kernel.org, arnd@arndb.de, lorenzo.stoakes@oracle.com,
 Liam.Howlett@oracle.com, rppt@kernel.org, surenb@google.com,
 mcgrof@kernel.org, petr.pavlu@suse.com, da.gomez@kernel.org,
 samitolvanen@google.com, paulmck@kernel.org, frederic@kernel.org,
 neeraj.upadhyay@kernel.org, joelagnelf@nvidia.com,
 josh@joshtriplett.org, urezki@gmail.com,
 mathieu.desnoyers@efficios.com, jiangshanlai@gmail.com,
 qiang.zhang@linux.dev, juri.lelli@redhat.com,
 vincent.guittot@linaro.org, dietmar.eggemann@arm.com,
 bsegall@google.com, mgorman@suse.de, vschneid@redhat.com,
 chuck.lever@oracle.com, neil@brown.name, okorniev@redhat.com,
 Dai.Ngo@oracle.com, tom@talpey.com, trondmy@kernel.org,
 anna@kernel.org, kees@kernel.org, bigeasy@linutronix.de,
 clrkwllms@kernel.org, mark.rutland@arm.com, ada.coupriediaz@arm.com,
 kristina.martsenko@arm.com, wangkefeng.wang@huawei.com,
 broonie@kernel.org, kevin.brodsky@arm.com, dwmw@amazon.co.uk,
 shakeel.butt@linux.dev, ast@kernel.org, ziy@nvidia.com,
 yuzhao@google.com, baolin.wang@linux.alibaba.com,
 usamaarif642@gmail.com, joel.granados@kernel.org,
 richard.weiyang@gmail.com, geert+renesas@glider.be,
 tim.c.chen@linux.intel.com, linux@treblig.org,
 alexander.shishkin@linux.intel.com, lillian@star-ark.net,
 chenhuacai@kernel.org, francesco@valla.it,
 guoweikang.kernel@gmail.com, link@vivo.com, jpoimboe@kernel.org,
 masahiroy@kernel.org, brauner@kernel.org,
 thomas.weissschuh@linutronix.de, oleg@redhat.com, mjguzik@gmail.com,
 andrii@kernel.org, wangfushuai@baidu.com, linux-doc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, linux-i2c@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-modules@vger.kernel.org,
 rcu@vger.kernel.org, linux-nfs@vger.kernel.org,
 linux-rt-devel@lists.linux.dev, 2407018371@qq.com, dakr@kernel.org,
 miguel.ojeda.sandonis@gmail.com, neilb@ownmail.net,
 bagasdotme@gmail.com, wsa+renesas@sang-engineering.com,
 dave.hansen@intel.com, geert@linux-m68k.org, ojeda@kernel.org,
 alex.gaynor@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
 lossin@kernel.org, a.hindborg@kernel.org, aliceryhl@google.com,
 tmgross@umich.edu, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v18 31/42] dept: assign unique dept_key to each distinct
 wait_for_completion() caller
Message-ID: <20260223003207.GA44876@system.software.com>
References: <20251205071855.72743-1-byungchul@sk.com>
 <20251205071855.72743-32-byungchul@sk.com>
 <ab0b9f9c-3a05-42f3-b4a7-ddb6ab0d37a4@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ab0b9f9c-3a05-42f3-b4a7-ddb6ab0d37a4@gmx.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Brightmail-Tracker: H4sIAAAAAAAAA02Sa0yTZxTH87x3GupeOpFHmS6pQROm9RKTHZdlMSbL3i9zW/xgoonayCs0
 QMUWuXiJXGokRATqSmc7sUCoRGpEFKmZdR2deIG6drjRlRasqWjDEMZaHOG2dsTMLyf//P45
 v5wPhyNl3zGrOJW6UNSolXlyRkJJxpObNkotZtXmke7NEBgJ0/B7uZOCWLSKgnlzNwsjsSoE
 0ZkhFgzlCBYdvQh8nh9JsN0qJ+DvjgUGxlxTCAyhMAOR+19A2HkWwVjDJAOz7l9IMBo8CJpC
 QRKmIs8Q3OodRuBoq2DgRV0XCaahwzAQXgZPYxMMvO5gwFLhoOGSWY9g1O8goLLlOgMNlzop
 8I7NERBo0BPQ3vkl9NU1E2CMxLsbaWA2VhLx8YoAw7UfCJixXmWhvyVAgbUsA563mViYC22B
 YK2BgrFRPQPRpyECbOdGSXD4P4KLjQEG7joeUVA1H0XQa39OwLmOLhqGbYs0eJx9NPza7qGg
 r/chBUPuWhZaB70EhJ754m19Db0jS3hz5jwl2BptSIi2VpKC688JUtDdLBYc0xZKeNyMhXr3
 RuGOKcgKk3/tF3T3/Kxg6Twm6H4ep4WbbZlCy90IITRNxeivN+yVfJol5qmKRM2mzw5Kcu58
 62IKLiSXDOpyy1CFpBolcZjfhofdV5i32VVhZasRx1F8Bh7xZicww6/HPt8MmcDLeTnuCuxI
 YJJvX4MHxksS+X0+F9+/Pf+fRcoDbg5H6Gok4WS8HmGv6wKxVKTgRxfD1NJyJvYtRIiEk+TT
 8ZUFLoGT+E+wq/sMncip/FrsvP2ASHgw70/Cw9bL5NKZK/FPbT6qDvGmd7Smd7Sm/7UWRF5F
 MpW6KF+pytumyClVq0oUh47kd6L4v1pPze2zoynP7h7Ec0ieLHVOmFQyWlmkLc3vQZgj5cul
 s7NxJM1Slh4XNUcOaI7lidoelM5R8jTp1uniLBmfrSwUc0WxQNS8bQkuaVUZWjYPGfu3qxST
 A2tOptt1J/4QK92DT/pTTm21N77Sr17dX7ryn49TB2vKdiZ7wydSUrdfvjYaXEx7WH84c12s
 etG4W63Y89X3ZEvsvWlF64ZvWPPn8NsHsQ/vvTz7+ugh5LfXnD94XL5zz5NdaM649vSKuuzp
 dcag9k3BrrQDxfLC2hVySpuj3JJJarTKfwENi1eBqwMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA02SbUxTZxTH8zzP7e1tQ821YLjo4ofqYmIibmaa4yRK9mHe7P0TOr+MRq5y
 VyimVQZOYyk065hZsK4ltMoQtVugvpXXznQjNOAcM7ZWRzPBalaRhiJMWhmtpWtjlvnl5H/+
 //M7OR8OQ5RJyWpG1B4WdFp1lYqWU/KPdjRuyutwiG8MTJeA2XQCJsIRCfzRMERBIm6m4MwV
 Fw1px4AUzO42Cfw6bqTAf7kbQThhRrCYchAweTIUpC2jUogv3ZeCtQFBxjuKwBawEAj5fyHg
 6m3AsHB1mYYZ3zME1kcRGlqjDRTMOU8isE85pBAd2Q2z4esSyEw+wTD+PIbAGVnGEBn6CkHa
 poHvO3uyuG2ehtSt2wRarX4E5x5NEngWfYigd/QBAu+PRhoet/QRsN8/AMHICribmKPhpvUb
 GmYDZzA8vUpDh9ErgcDvMwjOOiwIpv70Ymg8f4UG21k3BZ6HP0khMPMCw4TNgqHb/SGEnVMU
 jLV04uzJ2alrheBobcTZMo3Beuk6LnUiftH0LcV39fRj3nQnTfOudhfiU0kL4uMXGwlvasm2
 vtgc4Zt6vuAvjsVoPpm4R/Pe5x0U/1snx1/4Oon5U7c28R77pPSTd/bJSyqEKrFW0G3eWS6v
 9Hznow+dzqsbb9IYkFHejGQMx77F+YxOaTNiGIp9nQsHDuZsmt3AhUJLJGcXsCqub6I0ZxO2
 ey0XnK3L6XxWw430p+mcVrDAdUaikmYkZ5SsBXEB32n8MljJ3WyLUC/hjVxoOYpzOwm7hvth
 mcnZMvZtzjdgkuT0KnYdN9R/A7cghf0V2v4Kbf+f7kCkCxWI2tpqtVi1tVivqazXinXF+2uq
 3Sj7kc7jL04Nonhw9zBiGaTKU8wXOUSlRF2rr68eRhxDVAWKVMouKhUV6vqjgq7mM92RKkE/
 jNYwlKpQ8d4eoVzJHlQfFjSCcEjQ/ZdiRrbagPJJHDyfip/vCZTtcpfn9cnW73C1/82Qnr1d
 wS+Xap7mG8rOtZaGmv7SJsvmNYsFI0Xr321P/bz1yMKqf1zFK/C1bbEwGZx+PCiDxPumtfqg
 v7332F3PvnuGGydjbQuWiqLeO2Mf6Oq2vLaue0vKf+Dj6Inthl0lhRHz9kyGFWMqSl+pfnMj
 0enV/wJlLv3cjQMAAA==
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Mon, 23 Feb 2026 09:41:15 +0000
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.89 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[sk.com];
	FORGED_RECIPIENTS(0.00)[m:dirk.behme@gmx.de,m:linux-kernel@vger.kernel.org,m:kernel_team@skhynix.com,m:torvalds@linux-foundation.org,m:damien.lemoal@opensource.wdc.com,m:linux-ide@vger.kernel.org,m:adilger.kernel@dilger.ca,m:linux-ext4@vger.kernel.org,m:mingo@redhat.com,m:peterz@infradead.org,m:will@kernel.org,m:tglx@linutronix.de,m:rostedt@goodmis.org,m:joel@joelfernandes.org,m:sashal@kernel.org,m:daniel.vetter@ffwll.ch,m:duyuyang@gmail.com,m:johannes.berg@intel.com,m:tj@kernel.org,m:tytso@mit.edu,m:willy@infradead.org,m:david@fromorbit.com,m:amir73il@gmail.com,m:gregkh@linuxfoundation.org,m:kernel-team@lge.com,m:linux-mm@kvack.org,m:akpm@linux-foundation.org,m:mhocko@kernel.org,m:minchan@kernel.org,m:hannes@cmpxchg.org,m:vdavydov.dev@gmail.com,m:sj@kernel.org,m:jglisse@redhat.com,m:dennis@kernel.org,m:cl@linux.com,m:penberg@kernel.org,m:rientjes@google.com,m:vbabka@suse.cz,m:ngupta@vflare.org,m:linux-block@vger.kernel.org,m:josef@toxicpanda.com,m:linux-fsdevel@vger.kernel.org,m:ja
 ck@suse.cz,m:jlayton@kernel.org,m:dan.j.williams@intel.com,m:hch@infradead.org,m:djwong@kernel.org,m:rodrigosiqueiramelo@gmail.com,m:melissa.srw@gmail.com,m:hamohammed.sa@gmail.com,m:harry.yoo@oracle.com,m:chris.p.wilson@intel.com,m:gwan-gyeong.mun@intel.com,m:max.byungchul.park@gmail.com,m:boqun.feng@gmail.com,m:longman@redhat.com,m:yunseong.kim@ericsson.com,m:ysk@kzalloc.com,m:yeoreum.yun@arm.com,m:netdev@vger.kernel.org,m:matthew.brost@intel.com,m:her0gyugyu@gmail.com,m:corbet@lwn.net,m:catalin.marinas@arm.com,m:bp@alien8.de,m:x86@kernel.org,m:hpa@zytor.com,m:luto@kernel.org,m:sumit.semwal@linaro.org,m:gustavo@padovan.org,m:christian.koenig@amd.com,m:andi.shyti@kernel.org,m:arnd@arndb.de,m:lorenzo.stoakes@oracle.com,m:Liam.Howlett@oracle.com,m:rppt@kernel.org,m:surenb@google.com,m:mcgrof@kernel.org,m:petr.pavlu@suse.com,m:da.gomez@kernel.org,m:samitolvanen@google.com,m:paulmck@kernel.org,m:frederic@kernel.org,m:neeraj.upadhyay@kernel.org,m:joelagnelf@nvidia.com,m:josh@joshtriplet
 t.org,m:urezki@gmail.com,m:mathieu.desnoyers@efficios.com,m:jiangshanlai@gmail.com,m:qiang.zhang@linux.dev,m:juri.lelli@redhat.com,m:vincent.guittot@linaro.org,m:dietmar.eggemann@arm.com,m:bsegall@google.com,m:mgorman@suse.de,m:vschneid@redhat.com,m:chuck.lever@oracle.com,m:neil@brown.name,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmx.de];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[byungchul@sk.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,skhynix.com,linux-foundation.org,opensource.wdc.com,dilger.ca,redhat.com,infradead.org,kernel.org,linutronix.de,goodmis.org,joelfernandes.org,ffwll.ch,gmail.com,intel.com,mit.edu,fromorbit.com,linuxfoundation.org,lge.com,kvack.org,cmpxchg.org,linux.com,google.com,suse.cz,vflare.org,toxicpanda.com,lists.freedesktop.org,oracle.com,ericsson.com,kzalloc.com,arm.com,lwn.net,alien8.de,zytor.com,linaro.org,padovan.org,amd.com,arndb.de,suse.com,nvidia.com,joshtriplett.org,efficios.com,linux.dev,suse.de,brown.name,talpey.com,huawei.com,amazon.co.uk,linux.alibaba.com,glider.be,linux.intel.com,treblig.org,star-ark.net,valla.it,vivo.com,baidu.com,lists.infradead.org,lists.linaro.org,lists.linux.dev,qq.com,ownmail.net,sang-engineering.com,linux-m68k.org,garyguo.net,protonmail.com,umich.edu];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_NEQ_ENVFROM(0.00)[byungchul@sk.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_GT_50(0.00)[166];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.857];
	TAGGED_RCPT(0.00)[dri-devel,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,sk.com:email]
X-Rspamd-Queue-Id: CC4C7174108
X-Rspamd-Action: no action

On Sun, Feb 15, 2026 at 07:42:05AM +0100, Dirk Behme wrote:
> On 05.12.25 08:18, Byungchul Park wrote:
> > wait_for_completion() can be used at various points in the code and it's
> > very hard to distinguish wait_for_completion()s between different usages.
> > Using a single dept_key for all the wait_for_completion()s could trigger
> > false positive reports.
> >
> > Assign unique dept_key to each distinct wait_for_completion() caller to
> > avoid false positive reports.
> >
> > While at it, add a rust helper for wait_for_completion() to avoid build
> > errors.
> >
> > Signed-off-by: Byungchul Park <byungchul@sk.com>
> > ---
> >  include/linux/completion.h | 100 +++++++++++++++++++++++++++++++------
> >  kernel/sched/completion.c  |  60 +++++++++++-----------
> >  rust/helpers/completion.c  |   5 ++
> >  3 files changed, 120 insertions(+), 45 deletions(-)
> >
> ...
> > diff --git a/rust/helpers/completion.c b/rust/helpers/completion.c
> > index b2443262a2ae..5bae5e749def 100644
> > --- a/rust/helpers/completion.c
> > +++ b/rust/helpers/completion.c
> > @@ -6,3 +6,8 @@ void rust_helper_init_completion(struct completion *x)
> >  {
> >       init_completion(x);
> >  }
> > +
> > +void rust_helper_wait_for_completion(struct completion *x)
> 
> Please add `__rust_helper`:

I will.  Thanks.

	Byungchul
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/rust/helpers/completion.c?h=next-20260213&id=1c7a6f48f7eeb3014584d2fc55fc67f0cbaeef69
> 
> Best regards
> 
> Dirk
