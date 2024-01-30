Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B56DE8419BA
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jan 2024 03:58:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABA70112C93;
	Tue, 30 Jan 2024 02:58:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from invmail4.hynix.com (exvmail4.skhynix.com [166.125.252.92])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3813B112C93
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jan 2024 02:58:44 +0000 (UTC)
X-AuditID: a67dfc5b-d85ff70000001748-1d-65b865e1c3ac
Date: Tue, 30 Jan 2024 11:58:36 +0900
From: Byungchul Park <byungchul@sk.com>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH v11 14/26] locking/lockdep, cpu/hotplus: Use a weaker
 annotation in AP thread
Message-ID: <20240130025836.GA49173@system.software.com>
References: <20240124115938.80132-1-byungchul@sk.com>
 <20240124115938.80132-15-byungchul@sk.com> <87il3ggfz9.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87il3ggfz9.ffs@tglx>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Brightmail-Tracker: H4sIAAAAAAAAA02SbUyTVxTHc5/3NpQ8VpxX+LCsC9PB5nBqPFmWxSx7uXEz0bgv02VblSfS
 jbcVqJTMBbQwBsq0C3YUYlo0tSlMZtttbBNXwIKdE4sQVhgSxS6jCmKoZVZqWQsx88vNL+f8
 7++cD0eglYtsuqApLJW0hep8FSdn5DMp1hcnpU4pp29EgONHciByv5aBlo52Dvxn2xC0u6so
 CHnfhj/npxEsXLlKg6nRj8B68zoN7r4JBF32QxwMBVNhODLLga+xnoPDpzo4GLwTo2D8hJGC
 Nud2uHyslQJP9B8GTCEOmk2HqcQzRUHU5uDBVpkJk3YzD7GbG8A3McJC11g2NJ0c5+B8l4+B
 vs5JCoZ+aeFgon2Rhct9lxjwHz/Kwnd3Wzm4M2+jwRaZ5eGax0LB94aEqCYcZ6H/qIeCmtPn
 KBge/RXBhdobFDjbRzjojUxT4HI20vDwjBfBZMMMD9VHojw0VzUgqK8+wcDVR/0sGMY3w8KD
 Fm7rK6R3epYmBtcB0jVvYcjvrZj8bL7OE8OFMZ5YnGXEZc8ip86HKGKdi7DE6fiKI845I0/q
 ZoYpcndggCeXvl1gSHDYRO3I2C1/NVfK1+gk7UuvfSzPcw3+RRd3p5Rbw9V0Jbonq0MyAYub
 sNMTZB+zK77AJ5kRM7G9d4BLMieuxYFAlE5ymrgOn7s2tsS06JNjf+vrSV4p7sOjt7qXPAoR
 8MXTxkRGEJRiBXbXrVour8C+piCz/DULB+IhKhmhxQx8Ji4kyzJRhY21hqWpq8RnsefH/kRE
 ntisQ4b9oSv88pprcLc9wBxDovkJrfkJrfl/rQXRDqTUFOoK1Jr8Tevz9IWa8vX7igqcKHGW
 toOxPZ1ozr+rB4kCUqUotn7zk6Rk1boSfUEPwgKtSlNEn/9BUipy1foKSVv0kbYsXyrpQRkC
 o1qteHn+QK5S3K8ulT6VpGJJ+7hLCbL0SpRb1Rwsf2YwJruo8bLjK3ZY20rveZ9+v+E5t3Hx
 S1LfkOri15l22d3Zu7/eaGI9D9+JWbaVvbFx76OAThdO1R+6PSHu/eK+VJO+sujzs+Bw7Nz2
 4VvvZW9Rr3kTvbB/9JOndPp4TmZ46I/V4c9++9vbnNb9oOnd7VP/xocq9ox8UDyVomJK8tQb
 smhtifo/4an4aJIDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA02SbWxLYRTH8zz33ufeNjpXDTf4IPU+8TJZOUFEJOwSb5GIIGLFjdXeaPdK
 JJt1zDaLlSo1spV0y4zRDhsms9mmFrNZw1SNzYTFGKOL6oyVCF9Ofjnn/zvny+EoZQczltPG
 xku6WE20ishp+ZqF6TM7pAppzufcaZCXMwe8XzNpyC8rJdB8+SKC0vI0DN114fC0vweB/+Ej
 CsymZgSFHS8oKK9vR1BVfJBAa1cQuLy9BJymbALp58sItLwfwOA5acRw0b4aGo9ZMVT73tJg
 7iZwxpyOh8o7DD5bCQu21MnQWWxhYaAjFJztTxioPetkoMo9A06f8xC4XeWkob6iE0PrzXwC
 7aU/GWisv09Dc95RBi59tBJ432+jwObtZeFxdQGGK4ahbYe+DDLQcLQaw6ELVzG4nt1CcCfz
 FQZ76RMCtd4eDA67iYLvRXUIOnM/sJCR42PhTFouguyMkzQ8+tHAgMGjBv+3fLJkoVjb00uJ
 BkeSWNVfQIsPrIJYaXnBioY7blYssCeIjuIQ8fztbiwW9nkZ0V5yhIj2PiMrZn1wYfFjUxMr
 3j/lp8UulxmvG79ZvminFK1NlHSzF0fIIx0tz6k9d4clF37JoFLRJ1kWknECHyY4Bv1sgGl+
 slBc20QCTPipQlubjwpwMD9NuPrY/Zsp3ikXmq1LAzyS3yE8e32XCbCCB+HeBeNQhuOU/D6h
 PGvUn/YIwXm6i/6jhghtg904EKH4cULRIBdoy3iVYMw0/L46ip8oVF9vwMeQwvKfbfnPtvyz
 CxBVgoK1sYkxGm20epY+KjIlVps8a0dcjB0NPZ7twEBeBfraGl6DeA6phikiym5ISkaTqE+J
 qUECR6mCFb7p1ySlYqcmZZ+ki9umS4iW9DVoHEerxihWbpQilPwuTbwUJUl7JN3fKeZkY1NR
 BZq7KmjE/LLWz3u3h8q2MhGHE/wqtTotrCfM44p8+ZzoutatGGk6xSTvJhPW7zdV2pOS9C19
 87xr47a5N0yZsfxa0M2ZR7ae+2llFTlbohKWhS8wjSbzh9c5DjcqTxjy47M3tRuk40y/uSj0
 8gH3JPWYeKPnbdAJf+Wb10l0i05F6yM1oSGUTq/5Bd0J6+p0AwAA
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
Cc: hamohammed.sa@gmail.com, hdanton@sina.com, jack@suse.cz,
 peterz@infradead.org, daniel.vetter@ffwll.ch, amir73il@gmail.com,
 david@fromorbit.com, dri-devel@lists.freedesktop.org, mhocko@kernel.org,
 linux-mm@kvack.org, linux-ide@vger.kernel.org, adilger.kernel@dilger.ca,
 chris.p.wilson@intel.com, joel@joelfernandes.org, 42.hyeyoo@gmail.com,
 cl@linux.com, will@kernel.org, duyuyang@gmail.com, sashal@kernel.org,
 her0gyugyu@gmail.com, kernel_team@skhynix.com,
 damien.lemoal@opensource.wdc.com, willy@infradead.org, hch@infradead.org,
 mingo@redhat.com, djwong@kernel.org, vdavydov.dev@gmail.com,
 rientjes@google.com, dennis@kernel.org, linux-ext4@vger.kernel.org,
 ngupta@vflare.org, johannes.berg@intel.com, boqun.feng@gmail.com,
 josef@toxicpanda.com, rostedt@goodmis.org, gwan-gyeong.mun@intel.com,
 linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org, jglisse@redhat.com,
 viro@zeniv.linux.org.uk, longman@redhat.com, dan.j.williams@intel.com,
 vbabka@suse.cz, melissa.srw@gmail.com, sj@kernel.org, tytso@mit.edu,
 rodrigosiqueiramelo@gmail.com, kernel-team@lge.com, gregkh@linuxfoundation.org,
 jlayton@kernel.org, linux-kernel@vger.kernel.org, penberg@kernel.org,
 minchan@kernel.org, max.byungchul.park@gmail.com, hannes@cmpxchg.org,
 tj@kernel.org, akpm@linux-foundation.org, torvalds@linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 26, 2024 at 06:30:02PM +0100, Thomas Gleixner wrote:
> On Wed, Jan 24 2024 at 20:59, Byungchul Park wrote:
> 
> Why is lockdep in the subsystem prefix here? You are changing the CPU
> hotplug (not hotplus) code, right?
> 
> > cb92173d1f0 ("locking/lockdep, cpu/hotplug: Annotate AP thread") was
> > introduced to make lockdep_assert_cpus_held() work in AP thread.
> >
> > However, the annotation is too strong for that purpose. We don't have to
> > use more than try lock annotation for that.
> 
> This lacks a proper explanation why this is too strong.
> 
> > Furthermore, now that Dept was introduced, false positive alarms was
> > reported by that. Replaced it with try lock annotation.
> 
> I still have zero idea what this is about.

1. can track PG_locked that is a potential deadlock trigger.

   https://lore.kernel.org/lkml/1674268856-31807-1-git-send-email-byungchul.park@lge.com/

2. can track any waits/events e.g. wait_for_xxx(), dma fence and so on.

3. easy to annotate using dept_wait() on waits, dept_event() on events.

4. track read lock better way instead of the ugly way, by assinging wait
   or event annotations onto read lock and write lock. For instrance, a
   read lock is annotated as a potential waiter for its write unlock,
   and a write lock is annotated as a potential waiter for either write
   unlock or read unlock.

I'd like to remove unnecessary complexity on deadlock detection and add
additional functionality by making it do what the type of tool exactly
should do.

	Byungchul

> Thanks,
> 
>         tglx
