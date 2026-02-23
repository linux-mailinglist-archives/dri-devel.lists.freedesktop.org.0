Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8JGbI8QgnGkZ/wMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 10:41:24 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ABDF174116
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 10:41:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 004E410E2CB;
	Mon, 23 Feb 2026 09:41:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from invmail4.hynix.com (exvmail4.hynix.com [166.125.252.92])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2810A10E065
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 00:33:37 +0000 (UTC)
X-AuditID: a67dfc5b-c2dff70000001609-4b-699ba05fae7c
Date: Mon, 23 Feb 2026 09:33:30 +0900
From: Byungchul Park <byungchul@sk.com>
To: Petr Pavlu <petr.pavlu@suse.com>
Cc: kernel_team@skhynix.com, torvalds@linux-foundation.org,
 damien.lemoal@opensource.wdc.com, linux-ide@vger.kernel.org,
 adilger.kernel@dilger.ca, linux-ext4@vger.kernel.org,
 mingo@redhat.com, peterz@infradead.org, will@kernel.org,
 tglx@linutronix.de, rostedt@goodmis.org, joel@joelfernandes.org,
 sashal@kernel.org, daniel.vetter@ffwll.ch, duyuyang@gmail.com,
 johannes.berg@intel.com, tj@kernel.org, tytso@mit.edu,
 willy@infradead.org, david@fromorbit.com, amir73il@gmail.com,
 gregkh@linuxfoundation.org, kernel-team@lge.com, linux-mm@kvack.org,
 akpm@linux-foundation.org, mhocko@kernel.org, minchan@kernel.org,
 hannes@cmpxchg.org, vdavydov.dev@gmail.com, sj@kernel.org,
 jglisse@redhat.com, dennis@kernel.org, cl@linux.com,
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
 mcgrof@kernel.org, da.gomez@kernel.org, samitolvanen@google.com,
 paulmck@kernel.org, frederic@kernel.org, neeraj.upadhyay@kernel.org,
 joelagnelf@nvidia.com, josh@joshtriplett.org, urezki@gmail.com,
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
 tmgross@umich.edu, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v18 34/42] dept: add module support for struct
 dept_event_site and dept_event_site_dep
Message-ID: <20260223003330.GB44876@system.software.com>
References: <20251205071855.72743-1-byungchul@sk.com>
 <20251205071855.72743-35-byungchul@sk.com>
 <7afb6666-43b6-4d17-b875-e585c7a5ac99@suse.com>
 <20260213055006.GA55430@system.software.com>
 <7765df86-b08a-4f70-900d-4b4d85c07d49@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7765df86-b08a-4f70-900d-4b4d85c07d49@suse.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Brightmail-Tracker: H4sIAAAAAAAAA02Sf1DTZRzH7/n+3s51TxPzUa5fS8/DzH4ccZ/ukOjqj++dd4aXd3napSu+
 xa5t6KYgdRlzYINqER0S3xk3BZFgiQxR80IWg6UJBRa46bBEWBEsYm4zITC+dl3+87nXvZ/X
 vT+fPx6B1srccsFg3iVZzHqjjlMz6uiiw49td7sMTwT9y8BR+h4M2XwMJOIOBuZcp3hweGtY
 OHdpHwP9x5oRzFUGeKiyIbjdEUDgOWGjoOraKAdyxMXDpeQkglHf+wgOXRum4UTgKoKfElMc
 RAcOUjDQO4EgcrmDAntdCwcHPvcyUD2+AK1LwVVtpxbGbxT01oUZaCheCSONMg+33fkQaP6V
 h+GPqxg4Fv2BBc+HERq814dYqKkNc+CYiyModt1kod93gYULgXMMJJ2p0P/JRywEK8YQhKon
 eWicrmYh4L4P2jtLEcTqkwz0ub5nIez8nYH99a0UdLecoqAl4qfBn5ikYMQZ5cFlcyJwdCdp
 aO+5ycPx6aMc2G78jKAk/DT8dfw6C1/ODaHsbLGp7SQlemo9SJydqURi/IidFkvaCsWZxCAn
 diTdjPjdYSLWl81Q4lfyMC+6vbvFku4oK9Z9PU6Jh2IJVrw8sU70NpVxOQ9tUWfmSkZDgWR5
 PGu7Oi/ibKV3hDL2nA7nFKPP0sqRSiA4nVwdvMKVI+EO9/oFJWbwStJ81okU5vAqEgzeohUl
 Ba8gF0eeK0dqgcYHHiDn2xys4izGRuL/dJpSHA0G4oktUWItTiDSF3pRYQ2+l5yvGWUUpvFq
 Epwfv6PTOJUcnRcUVOFMEu15UDGW4EeI7+S3lLKJ4IiKjNXE0L8HLyPfNAaZCoTlu1rlu1rl
 /1vdiG5CWoO5wKQ3GNPX5hWZDXvWvp5v8qKFH9vw7t9bT6NY/0tdCAtIt0jjm5INWlZfYC0y
 dSEi0LoUzezsQqTJ1Re9LVnyt1l2GyVrF0oVGN1SzVPJwlwtflO/S3pLknZIlv9eKUG1vBi9
 sP9s+x8b3LOqLTilMuQo+3Fb9v23dk6/Zn1Uv/nPK1kZe+9ZXy6nb/xlcc8X6x8u3bgmfmbN
 cGfnjZ21vn3PdttfWRE3M4kjTWmN1oh5LGed/9WChl7TpirLhsGLhW8YZzIqhMwzaVl7nwm9
 k7Xq5anR5x3z9XUTH1g39U3aTfRALDNDx1jz9E+upi1W/T8wE0YKrQMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA02SfUwbdRjHfe53vR6NZ86ubOeImnU2TsxejM48iXNxxrhzZnPinHFZ3Kq7
 SEMpWzvZGDECtVrREKhpGe3QilIXqG5rGY4tVUIdAweRDiegvGym1hFgnUBZoJTaMzHunyff
 53k+n+T542GJel6xkjWYDktmk96oZVS0asdT1rX7vB7Dhrn4/Wi3vYfDY1EF/lreTmNi1k7j
 iVN+BlOe75RoD9QpsGuggsa+b5sBxxJ2wNtJD0FbW5rGlKNTibPzvyvRWQ6YDnUCuiIOgoN9
 PxD0t5RTOHN6icGJ8DSg83qUwdrxchrjvk8A3TGPEscvbsWpsQsKTI/8ReHA3CSgL7pEYbT9
 Q8CUqwA/bwhmdNctBpO9PxOsdfYBfnF9hOD0+DXAls5RwNDJCgb/rD5LsD96D/6SiDPY7fyY
 wanICQpvnmbQWxFSYKRnArDe4wCM/Rai0PrlKQZd9QEa266dV2JkYpHCYZeDwubAdhzzxWi8
 XN1AZc7NUGdWoKfWSmXKDQqd31ygcN7XpHymEcTbtipabAq2UqLtSooR/Z/5QUwuOECcbbQS
 0VadacOTcSK+HzwiNl6eZMSFxFVGDM15afGnBkH86qMFSqzpXSu2uUeUO7fsUW06IBkNxZJ5
 /eb9qvxY1RlycOjJo+eGd5bB8UcqgWUF/gmhJ8xWQhZL8zqh+fsqkDPDPywMDs4TGdHwDwlX
 /thSCSqW8K4HhO6gXSEzy3ijEP70b0pmOB4F/3S2PFbzCRB6h16SM8ffK3TXRWk5Ez5XGFwa
 /xcnfI7w9RIrxyx+kzB18UGZyOZXC+2tl6hq4Nx3yO47ZPf/shdIE2gMpuJCvcG4cZ2lIL/E
 ZDi67q2iwgBkHtL37mLNOZjt39oBPAvau7lb93kMaoW+2FJS2AECS7QaLpl0G9TcAX3JMclc
 tM/8jlGydEAOS2tXcNtek/ar+bf1h6UCSToomf/bUmzWyjJ481i6LLZo1nj7D63GILf8lR6z
 LlTwslN/12R6d9zZ0jXQym6eXnboyO6hIrixUTHzqu+F0tIPXr/KWbcnt+19uk633vNjIO/x
 Ndl5nGn5s6N7F3TdeaZHzz9X6grtmtmVU3Pp+eNrVrV0rdqjC2t6TcWjG07mvng2MpBqrLe9
 kU7f1NKWfP1jucRs0f8DOc5IfIwDAAA=
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
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[sk.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:petr.pavlu@suse.com,m:kernel_team@skhynix.com,m:torvalds@linux-foundation.org,m:damien.lemoal@opensource.wdc.com,m:linux-ide@vger.kernel.org,m:adilger.kernel@dilger.ca,m:linux-ext4@vger.kernel.org,m:mingo@redhat.com,m:peterz@infradead.org,m:will@kernel.org,m:tglx@linutronix.de,m:rostedt@goodmis.org,m:joel@joelfernandes.org,m:sashal@kernel.org,m:daniel.vetter@ffwll.ch,m:duyuyang@gmail.com,m:johannes.berg@intel.com,m:tj@kernel.org,m:tytso@mit.edu,m:willy@infradead.org,m:david@fromorbit.com,m:amir73il@gmail.com,m:gregkh@linuxfoundation.org,m:kernel-team@lge.com,m:linux-mm@kvack.org,m:akpm@linux-foundation.org,m:mhocko@kernel.org,m:minchan@kernel.org,m:hannes@cmpxchg.org,m:vdavydov.dev@gmail.com,m:sj@kernel.org,m:jglisse@redhat.com,m:dennis@kernel.org,m:cl@linux.com,m:penberg@kernel.org,m:rientjes@google.com,m:vbabka@suse.cz,m:ngupta@vflare.org,m:linux-block@vger.kernel.org,m:josef@toxicpanda.com,m:linux-fsdevel@vger.kernel.org,m:jack@suse.cz,m:jlayton@kernel.o
 rg,m:dan.j.williams@intel.com,m:hch@infradead.org,m:djwong@kernel.org,m:rodrigosiqueiramelo@gmail.com,m:melissa.srw@gmail.com,m:hamohammed.sa@gmail.com,m:harry.yoo@oracle.com,m:chris.p.wilson@intel.com,m:gwan-gyeong.mun@intel.com,m:max.byungchul.park@gmail.com,m:boqun.feng@gmail.com,m:longman@redhat.com,m:yunseong.kim@ericsson.com,m:ysk@kzalloc.com,m:yeoreum.yun@arm.com,m:netdev@vger.kernel.org,m:matthew.brost@intel.com,m:her0gyugyu@gmail.com,m:corbet@lwn.net,m:catalin.marinas@arm.com,m:bp@alien8.de,m:x86@kernel.org,m:hpa@zytor.com,m:luto@kernel.org,m:sumit.semwal@linaro.org,m:gustavo@padovan.org,m:christian.koenig@amd.com,m:andi.shyti@kernel.org,m:arnd@arndb.de,m:lorenzo.stoakes@oracle.com,m:Liam.Howlett@oracle.com,m:rppt@kernel.org,m:surenb@google.com,m:mcgrof@kernel.org,m:da.gomez@kernel.org,m:samitolvanen@google.com,m:paulmck@kernel.org,m:frederic@kernel.org,m:neeraj.upadhyay@kernel.org,m:joelagnelf@nvidia.com,m:josh@joshtriplett.org,m:urezki@gmail.com,m:mathieu.desnoyers@effici
 os.com,m:jiangshanlai@gmail.com,m:qiang.zhang@linux.dev,m:juri.lelli@redhat.com,m:vincent.guittot@linaro.org,m:dietmar.eggemann@arm.com,m:bsegall@google.com,m:mgorman@suse.de,m:vschneid@redhat.com,m:chuck.lever@oracle.com,m:neil@brown.name,m:okorniev@redhat.com,m:Dai.Ngo@oracle.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[byungchul@sk.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[skhynix.com,linux-foundation.org,opensource.wdc.com,vger.kernel.org,dilger.ca,redhat.com,infradead.org,kernel.org,linutronix.de,goodmis.org,joelfernandes.org,ffwll.ch,gmail.com,intel.com,mit.edu,fromorbit.com,linuxfoundation.org,lge.com,kvack.org,cmpxchg.org,linux.com,google.com,suse.cz,vflare.org,toxicpanda.com,lists.freedesktop.org,oracle.com,ericsson.com,kzalloc.com,arm.com,lwn.net,alien8.de,zytor.com,linaro.org,padovan.org,amd.com,arndb.de,nvidia.com,joshtriplett.org,efficios.com,linux.dev,suse.de,brown.name,talpey.com,huawei.com,amazon.co.uk,linux.alibaba.com,glider.be,linux.intel.com,treblig.org,star-ark.net,valla.it,vivo.com,baidu.com,lists.infradead.org,lists.linaro.org,lists.linux.dev,qq.com,ownmail.net,sang-engineering.com,linux-m68k.org,garyguo.net,protonmail.com,umich.edu];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_NEQ_ENVFROM(0.00)[byungchul@sk.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_GT_50(0.00)[165];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.948];
	TAGGED_RCPT(0.00)[dri-devel,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,sk.com:email]
X-Rspamd-Queue-Id: 3ABDF174116
X-Rspamd-Action: no action

On Wed, Feb 18, 2026 at 04:08:19PM +0100, Petr Pavlu wrote:
> On 2/13/26 6:50 AM, Byungchul Park wrote:
> > On Wed, Jan 07, 2026 at 01:19:00PM +0100, Petr Pavlu wrote:
> >> On 12/5/25 8:18 AM, Byungchul Park wrote:
> >>> struct dept_event_site and struct dept_event_site_dep have been
> >>> introduced to track dependencies between multi event sites for a single
> >>> wait, that will be loaded to data segment.  Plus, a custom section,
> >>> '.dept.event_sites', also has been introduced to keep pointers to the
> >>> objects to make sure all the event sites defined exist in code.
> >>>
> >>> dept should work with the section and segment of module.  Add the
> >>> support to handle the section and segment properly whenever modules are
> >>> loaded and unloaded.
> >>>
> >>> Signed-off-by: Byungchul Park <byungchul@sk.com>
> >>
> >> Below are a few comments from the module loader perspective.
> >
> > Sorry about the late reply.  I've been going through some major life
> > changes lately. :(
> >
> > Thank you sooooo~ much for your helpful feedback.  I will leave my
> > opinion below.
> >
> [...]
> >>> diff --git a/kernel/dependency/dept.c b/kernel/dependency/dept.c
> >>> index b14400c4f83b..07d883579269 100644
> >>> --- a/kernel/dependency/dept.c
> >>> +++ b/kernel/dependency/dept.c
> >>> @@ -984,6 +984,9 @@ static void bfs(void *root, struct bfs_ops *ops, void *in, void **out)
> >>>   * event sites.
> >>>   */
> >>>
> >>> +static LIST_HEAD(dept_event_sites);
> >>> +static LIST_HEAD(dept_event_site_deps);
> >>> +
> >>>  /*
> >>>   * Print all events in the circle.
> >>>   */
> >>> @@ -2043,6 +2046,33 @@ static void del_dep_rcu(struct rcu_head *rh)
> >>>       preempt_enable();
> >>>  }
> >>>
> >>> +/*
> >>> + * NOTE: Must be called with dept_lock held.
> >>> + */
> >>> +static void disconnect_event_site_dep(struct dept_event_site_dep *esd)
> >>> +{
> >>> +     list_del_rcu(&esd->dep_node);
> >>> +     list_del_rcu(&esd->dep_rev_node);
> >>> +}
> >>> +
> >>> +/*
> >>> + * NOTE: Must be called with dept_lock held.
> >>> + */
> >>> +static void disconnect_event_site(struct dept_event_site *es)
> >>> +{
> >>> +     struct dept_event_site_dep *esd, *next_esd;
> >>> +
> >>> +     list_for_each_entry_safe(esd, next_esd, &es->dep_head, dep_node) {
> >>> +             list_del_rcu(&esd->dep_node);
> >>> +             list_del_rcu(&esd->dep_rev_node);
> >>> +     }
> >>> +
> >>> +     list_for_each_entry_safe(esd, next_esd, &es->dep_rev_head, dep_rev_node) {
> >>> +             list_del_rcu(&esd->dep_node);
> >>> +             list_del_rcu(&esd->dep_rev_node);
> >>> +     }
> >>> +}
> >>> +
> >>>  /*
> >>>   * NOTE: Must be called with dept_lock held.
> >>>   */
> >>> @@ -2384,6 +2414,8 @@ void dept_free_range(void *start, unsigned int sz)
> >>>  {
> >>>       struct dept_task *dt = dept_task();
> >>>       struct dept_class *c, *n;
> >>> +     struct dept_event_site_dep *esd, *next_esd;
> >>> +     struct dept_event_site *es, *next_es;
> >>>       unsigned long flags;
> >>>
> >>>       if (unlikely(!dept_working()))
> >>> @@ -2405,6 +2437,24 @@ void dept_free_range(void *start, unsigned int sz)
> >>>       while (unlikely(!dept_lock()))
> >>>               cpu_relax();
> >>>
> >>> +     list_for_each_entry_safe(esd, next_esd, &dept_event_site_deps, all_node) {
> >>> +             if (!within((void *)esd, start, sz))
> >>> +                     continue;
> >>> +
> >>> +             disconnect_event_site_dep(esd);
> >>> +             list_del(&esd->all_node);
> >>> +     }
> >>> +
> >>> +     list_for_each_entry_safe(es, next_es, &dept_event_sites, all_node) {
> >>> +             if (!within((void *)es, start, sz) &&
> >>> +                 !within(es->name, start, sz) &&
> >>> +                 !within(es->func_name, start, sz))
> >>> +                     continue;
> >>> +
> >>> +             disconnect_event_site(es);
> >>> +             list_del(&es->all_node);
> >>> +     }
> >>> +
> >>>       list_for_each_entry_safe(c, n, &dept_classes, all_node) {
> >>>               if (!within((void *)c->key, start, sz) &&
> >>>                   !within(c->name, start, sz))
> >>> @@ -3337,6 +3387,7 @@ void __dept_recover_event(struct dept_event_site_dep *esd,
> >>>
> >>>       list_add(&esd->dep_node, &es->dep_head);
> >>>       list_add(&esd->dep_rev_node, &rs->dep_rev_head);
> >>> +     list_add(&esd->all_node, &dept_event_site_deps);
> >>>       check_recover_dl_bfs(esd);
> >>>  unlock:
> >>>       dept_unlock();
> >>> @@ -3347,6 +3398,23 @@ EXPORT_SYMBOL_GPL(__dept_recover_event);
> >>>
> >>>  #define B2KB(B) ((B) / 1024)
> >>>
> >>> +void dept_mark_event_site_used(void *start, void *end)
> >>
> >> Nit: I suggest that dept_mark_event_site_used() take pointers to
> >> dept_event_site_init, which would catch the type mismatch with
> >
> > IMO, this is the easiest way to get all the pointers from start to the
> > end, or I can't get the number of the pointers.  It's similar to the
> > initcalls section for device drivers.
> 
> This was a minor suggestion.. The idea is to simply change the function
> signature to:
> 
> void dept_mark_event_site_used(struct dept_event_site_init **start,
>                                struct dept_event_site_init **end))

I got what you meant.  I will.  Thanks.

	Byungchul

> This way, the compiler can provide proper type checking to ensure that
> correct pointers are passed to dept_mark_event_site_used(). It would
> catch the type mismatch with module::dept_event_sites.
> 
> >
> >> module::dept_event_sites.
> >>
> >>> +{
> >>> +     struct dept_event_site_init **evtinitpp;
> >>> +
> >>> +     for (evtinitpp = (struct dept_event_site_init **)start;
> >>> +          evtinitpp < (struct dept_event_site_init **)end;
> >>> +          evtinitpp++) {
> >>> +             (*evtinitpp)->evt_site->used = true;
> >>> +             (*evtinitpp)->evt_site->func_name = (*evtinitpp)->func_name;
> >>> +             list_add(&(*evtinitpp)->evt_site->all_node, &dept_event_sites);
> >>> +
> >>> +             pr_info("dept_event_site %s@%s is initialized.\n",
> >>> +                             (*evtinitpp)->evt_site->name,
> >>> +                             (*evtinitpp)->evt_site->func_name);
> >>> +     }
> >>> +}
> >>> +
> >>>  extern char __dept_event_sites_start[], __dept_event_sites_end[];
> >>
> >> Related to the above, __dept_event_sites_start and
> >> __dept_event_sites_end can already be properly typed here.
> >
> > How can I get the number of the pointers?
> 
> Similarly here, changing the code to:
> 
> extern struct dept_event_site_init *__dept_event_sites_start[], *__dept_event_sites_end[];
> 
> It is the same for the initcalls you mentioned. The declarations of
> their start/end symbols are also already properly typed as
> initcall_entry_t[] in include/linux/init.h.
> 
> --
> Thanks,
> Petr
