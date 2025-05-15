Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 158DBAB7BE1
	for <lists+dri-devel@lfdr.de>; Thu, 15 May 2025 05:01:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D60210E0EE;
	Thu, 15 May 2025 03:01:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from invmail4.hynix.com (exvmail4.hynix.com [166.125.252.92])
 by gabe.freedesktop.org (Postfix) with ESMTP id 17C6C10E0EE
 for <dri-devel@lists.freedesktop.org>; Thu, 15 May 2025 03:01:05 +0000 (UTC)
X-AuditID: a67dfc5b-669ff7000002311f-13-682558e73367
Date: Thu, 15 May 2025 12:00:50 +0900
From: Byungchul Park <byungchul@sk.com>
To: Waiman Long <llong@redhat.com>
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
 yskelg@gmail.com, yunseong.kim@ericsson.com, yeoreum.yun@arm.com,
 netdev@vger.kernel.org, matthew.brost@intel.com, her0gyugyu@gmail.com
Subject: Re: [PATCH v15 01/43] llist: move llist_{head,node} definition to
 types.h
Message-ID: <20250515030050.GB1851@system.software.com>
References: <20250513100730.12664-1-byungchul@sk.com>
 <20250513100730.12664-2-byungchul@sk.com>
 <5f412ff9-c6a3-4eb1-9c02-44d7c493327d@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5f412ff9-c6a3-4eb1-9c02-44d7c493327d@redhat.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Brightmail-Tracker: H4sIAAAAAAAAA02SbUxTVxjHd+69vfe2WnYtOo+w+aHCZnBzQnA8SzZDsmU7ydhm4kwWt0SL
 XNe6Aq68CM4l5TUKkyBbYRQmtWyVYFUsxlQFZBhqOh1WCxUdoDI0QHlf2w0FXCkx88uTX57/
 //zO+XB4WlHGRvCatExRl6bSKlkZIxtfbn5j+PNo9aaH5RLw+w4xUHvGyoLr9EkE1nN5FIx0
 fgi3A2MInvxxg4YqgwvB8Qf9NJxzDCBobchnwT0UBt3+SRachlIWCurPsHDTO0dBX2UFBSdt
 H8M9yyMGrpWbKagaYaGmqoAKjmEKZi2NHFj00TDYYORg7kEsOAc8Emi9uwGqj/Wx0NLqZMBh
 H6TAfbGWhQHrUwl4S6ZoCJRFguvoEQmcmjCz4A1YaLD4Jzm41W6iwGF6CZoKg8LivxckcPVI
 OwXFv5yloPvOJQRth+5TYLN6WLjiH6Og2Wag4fGJTgSDZeMcFH0/y0FNXhmC0qJKBgr7NsOT
 f4M3/+yLhby6JgZOzXtQ4rvEesyKyJWxSZoUNu8nj/09LGkNmBjyuxmTC8Z+jhS23eWIyZZF
 mhtiSH3LCEWOz/glxNZ4mCW2mQqOlIx3U2Siq4vb+vIO2TspolaTLere3LJLpm50VDD7fg3L
 6fT10HpUs6wESXksxGP9+I/cMz5a5ZYsMiNE474KO73IrPAa7u2dDfFKQYn9sy6mBMl4Wqhc
 hi84pqnFIFz4DI9N94dEciEBm53uUEkhGBAuzR9lloIV2Fk9FGJaiMG9CyPBw3yQI/GJBX5x
 LRW24LbAvVBllbAOt5+/Si09ziPF1Y6DS7wG/9bQy5Qjwfic1fic1fi/1YToRqTQpGWnqjTa
 +I3q3DRNzsbd6ak2FPyllu/mvrCjGde2DiTwSLlc3l4UpVZIVNkZuakdCPO0cqX89t51aoU8
 RZV7QNSl79RlacWMDhTJM8rV8rjA/hSF8JUqU/xaFPeJumcpxUsj9EgkOZ9OuV9Izg9cb1o9
 H/uR95/3kwt++ivrh2tR2ydHrdtPh492vBr39sSu9w4nXg//oL9+TVwX3jN/48/zL+qmkg0p
 tZsuZ3ter9PefMuZ7ttb882X9rUJO3w9ez5Zsap4fdh0XkTCxcGknYneAweTpVGZzLf37S1J
 w3rV5qd1Q91rI+JfUTIZalVsDK3LUP0HPfruQ6EDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA02SbUxTZxTH8zz3tZWau47pjY1+qMMXFlFU4llc0CVm3Cxz0czERU1moze2
 k1ZtEekUB1KMg0mEBYhFsZZZCJThilNQSwhIsahYLSIqoBAyh60CjttZYbCWZZlfTn45//M7
 58thCeUYNY/VGdJEo0GTqqblpPzLtTnLnn8dp11x5dxikMZPkHCmzkmD75caBM5L2RiG21Lg
 YSiIYOLOXQJKi30Izg/0EXDJ04/AXXWMBv/QbOiSRmjwFufTkFNRR8O9wCSG3pIiDDWujfDU
 8TsJt07ZMZQO01BWmoMj5Q8MYUc1A46sOBissjIwOZAI3v5uClrPeilwP/4ITpf30nDd7SXB
 0zCIwX/1DA39zmkKAnmjBIQKVOArPElB7Ss7DYGQgwCHNMLA/WYbBo9tDly0RLYe/3OKgvaT
 zRiO//wrhq5H1xA0nXiGweXspqFVCmKodxUT8LayDcFgwUsGcn8MM1CWXYAgP7eEBEtvEky8
 iVw+O54I2ecuklD7dzdanyw4y51IaA2OEIKl/pDwVnpAC+6QjRQ67LzQaO1jBEvTY0awuQ4K
 9VXxQsX1YSycfy1Rgqv6B1pwvS5ihLyXXVh41dnJbJq/Tf7JbjFVly4alyfvlGurPUXk/guz
 M9rGHxBZqGxWHpKxPLeaLyz1U1EmuTi+t6iBiDLNLeZ7esIzHMupeSnsI/OQnCW4kll8o2cM
 R4P3uS18cKyPibKCW8Pbvf6ZISVXjPj8Yy/If4P3eO/poRkmuHi+Z2o4IrMRVvGVU2y0LeOS
 +abQ05mRD7iFfPPldnwKKazv2NZ3bOv/tg0R1ShWZ0jXa3SpSQmmvVqzQZeRsGuf3oUij+jI
 nCxsQOP+lBbEsUgdo2jO/VCrpDTpJrO+BfEsoY5VPPx2oVap2K0xfyca931jPJgqmlqQiiXV
 cxWfbxV3Krk9mjRxryjuF43/pZiVzctCGQ5WVT+Qu6UirSCY5V4w+mR95tYL4dCiUN9vgcwb
 n/o87WMbhj6eeF65Y/rQEfFNjP3A6Lru0a7bc/LL//rKeXWHbEVj50+fLf3+cswG87Tqi5WG
 joHDSVZ9x2CK8eaqmtrtCds23lh5WMJlC1TBJUH9UUtd+sRmySzLsQZxYEndajVp0moS4wmj
 SfMPr7iiAoQDAAA=
X-CFilter-Loop: Reflected
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

On Wed, May 14, 2025 at 08:14:26PM -0400, Waiman Long wrote:
> On 5/13/25 6:06 AM, Byungchul Park wrote:
> > llist_head and llist_node can be used by very primitives. For example,
> 
> I suppose you mean "every primitives". Right? However, the term "primitive"
> may sound strange. Maybe just saying that it is used by some other header
> files.

Thank you.  I will apply it.

	Byungchul
> 
> Cheers,
> Longman
> 
> > dept for tracking dependencies uses llist in its header. To avoid header
> > dependency, move those to types.h.
> > 
> > Signed-off-by: Byungchul Park <byungchul@sk.com>
> > ---
> >   include/linux/llist.h | 8 --------
> >   include/linux/types.h | 8 ++++++++
> >   2 files changed, 8 insertions(+), 8 deletions(-)
> > 
> > diff --git a/include/linux/llist.h b/include/linux/llist.h
> > index 2c982ff7475a..3ac071857612 100644
> > --- a/include/linux/llist.h
> > +++ b/include/linux/llist.h
> > @@ -53,14 +53,6 @@
> >   #include <linux/stddef.h>
> >   #include <linux/types.h>
> > -struct llist_head {
> > -	struct llist_node *first;
> > -};
> > -
> > -struct llist_node {
> > -	struct llist_node *next;
> > -};
> > -
> >   #define LLIST_HEAD_INIT(name)	{ NULL }
> >   #define LLIST_HEAD(name)	struct llist_head name = LLIST_HEAD_INIT(name)
> > diff --git a/include/linux/types.h b/include/linux/types.h
> > index 49b79c8bb1a9..c727cc2249e8 100644
> > --- a/include/linux/types.h
> > +++ b/include/linux/types.h
> > @@ -204,6 +204,14 @@ struct hlist_node {
> >   	struct hlist_node *next, **pprev;
> >   };
> > +struct llist_head {
> > +	struct llist_node *first;
> > +};
> > +
> > +struct llist_node {
> > +	struct llist_node *next;
> > +};
> > +
> >   struct ustat {
> >   	__kernel_daddr_t	f_tfree;
> >   #ifdef CONFIG_ARCH_32BIT_USTAT_F_TINODE
> 
