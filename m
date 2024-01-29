Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D9D483FD2B
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jan 2024 05:21:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEDA510EC80;
	Mon, 29 Jan 2024 04:21:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from invmail4.hynix.com (exvmail4.skhynix.com [166.125.252.92])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4C11C10ECB7
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jan 2024 04:21:04 +0000 (UTC)
X-AuditID: a67dfc5b-d6dff70000001748-0b-65b727aa4de6
Date: Mon, 29 Jan 2024 13:20:52 +0900
From: Byungchul Park <byungchul@sk.com>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH v11 14/26] locking/lockdep, cpu/hotplus: Use a weaker
 annotation in AP thread
Message-ID: <20240129042052.GA64402@system.software.com>
References: <20240124115938.80132-1-byungchul@sk.com>
 <20240124115938.80132-15-byungchul@sk.com> <87il3ggfz9.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87il3ggfz9.ffs@tglx>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Brightmail-Tracker: H4sIAAAAAAAAA03SX0xTVxzAcc+5f9vQ5a5DPZOXpcbgMPh/22/L5pa9eJOFzW08aTZt5EYa
 StWLouhcYFZT/k6IUK3oSjGlgW6OwhwT0QKBUv9Ah9UhAgo2bo1UMmabVbAbF7LMl5NPzvmd
 b87D4SntLLOMN5j2SbJJb9SxalodSapLb0z9WVrbMr4SKsvWQvSphYbaC24WAj80IXC3FmEI
 92yG32KTCGZuDlBgrQ4gqBsfpaC1dwxBh+sbFm6FXoJgdIoFf3UpC0frL7Dw6+NZDCM1VRia
 PBlw/YQDgzf+Ow3WMAtnrEfx3PIHhrizkQNn4QqYcNk4mB1fB/6xOwx0DK+C0+dGWLjc4aeh
 t20Cw61LtSyMuf9h4HpvHw2BynIGvn/iYOFxzEmBMzrFwaDXjuFH81zo+F8JBnzlXgzHzzdj
 CN5tR3DF8gCDx32Hhe7oJIYWTzUFzxp6EExURDg4Vhbn4ExRBYLSYzU0DDz3MWAeeQNm/q5l
 P3hH7J6cokRzywGxI2anxWsOIv5iG+VE85VhTrR79ostrjSx/nIYi3XTUUb0NBazome6ihNL
 IkEsPunv58S+UzO0GApa8ZaUrep3sySjIV+S12zaoc4ebTuF99QkHYzcDqFCdFVVgnieCBtJ
 xPlxCVLN09vvQoppYQUZae2cNyukkqGhOKU4WVhJmgeH500JfjUJOD5U/Iqwk9x92MkoSY0A
 xOrLVKgVDpHWksXKhEZ4mfhPh+iFm2lkKBHGygglpJCGBK9sqwQdqbKYWcWLheXEe9GHFx7W
 riIDz0wLfpV0uoboE0iwvVC1vVC1/V+1I6oRaQ2m/Fy9wbhxdXaByXBw9c7duR409yedR2a3
 taHpwOddSOCRLknDF12UtIw+P68gtwsRntIla+Kv/yRpNVn6gkOSvHu7vN8o5XWhFJ7WLdWs
 jx3I0gq79PukHEnaI8n/nWJetawQHb6d3rPtfqL+0aL0tyvvGbvf6jp5OHeD6VPHDcvZDHZ9
 7CvQrwrLDU1b5GtrzpJ7qVtd34W2lz088tqfJ89TXyY+SmTuHXMXZ/LqtD5fOZ/y9dPS9h0V
 S5ds+uwTO725UkwO5uieNz/a0GB5kOH9dtKUfen+8pzim4NfvBnf+7686L0+HZ2XrV+XRsl5
 +n8BEUqc/48DAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA02Sa0yTZxTH8zzvtQ0lrxXYo/ipTkG8YaLLibhF/aDv3OZGojFRozT6Co2A
 rkUUExIYlSCoERKoVsZqWQqpKFAK4gWsEKnVCAgMCgGErskkXOrUEisXpS6Lfjn55Zz/73z6
 85RyhFnKa1LTJG2qOlnFymn57rictdao21LsG4sMCi/Egv9tHg2l1VUsdN66gaDKno1h7NFO
 6JueQDDzrIMCQ3EnguujQxTY24YRNFX+xkK3NxR6/D4WXMUFLOSUV7PwfHwWw2BJEYYbtp/g
 6WUzBkfgHxoMYyxcM+TghfESQ8Bi5cCStQI8lUYOZkc3gGu4l4HW310MNA2shqtlgyzcb3LR
 0NbowdB9t5SF4aoPDDxte0xDZ+FFBm5OmVkYn7ZQYPH7OOhymDDU6Be+5b6ZZ8B50YEh989a
 DD399xA0541gsFX1stDqn8BQZyum4H3FIwSeS5McnLsQ4OBa9iUEBedKaOiYczKgH9wEM+9K
 2a1xYuuEjxL1dafFpmkTLT4xE/GOcYgT9c0DnGiynRLrKmPE8vtjWLz+2s+INut5VrS9LuLE
 /MkeLE61t3Pi4ysztOjtMeBflu2XbzkqJWvSJe367xLkSUONV/DJkpAzk395URZ6IMtHMp4I
 G4mjvRIFmRZWkEH7w0/MClHE7Q5QQQ4Toklt18AnpgSXnHSatwd5sXCE9P/9kMlHPK8QgBic
 e4KoFM4Se354MKEQFhHXVS/9nxlD3PNjOBihhEhSMc8H1zJBRYry9GyQw4XlxNHgxJeRwviF
 bfzCNn62TYiyojBNanqKWpO8aZ3ueFJGqubMuiMnUmxooXeWzNnCRvS2e2cLEnikClHw2Q2S
 klGn6zJSWhDhKVWYIrCqXlIqjqozzkraE4e1p5IlXQuK5GnVV4pd+6QEpZCoTpOOS9JJSfv/
 FfOypVloZKo36vupkPXfeGIjVptDk0aWGH/enrtSxTpNZfrMgh3NOS1r+m/nJe4vT9y1dWOM
 sa/NF+F17/3aExh99e2vpbM/krK4FxQ3PncgdN/40Olw/qD935cHK87X/LDZF71neeSh+giT
 fnrzIqPc3Vf3R/zetDlr5q2MgdoXo8fiNQnblqhoXZJ6Qwyl1ak/AnGPtF9zAwAA
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

I will fix the typo ;( Thank you.

I referred to the commit cb92173d1f047. I will remove the prefix if the
way is more desirable.

> > cb92173d1f0 ("locking/lockdep, cpu/hotplug: Annotate AP thread") was
> > introduced to make lockdep_assert_cpus_held() work in AP thread.
> >
> > However, the annotation is too strong for that purpose. We don't have to
> > use more than try lock annotation for that.
> 
> This lacks a proper explanation why this is too strong.

rwsem_acquire() implies:

   1. might be a waiter on contention of the lock.
   2. enter to the critical section of the lock.

All we need in here is to act 2, not 1. That's why I suggested trylock
version of annotation for that purpose.

Now that dept partially replies on lockdep annotaions for the waiters
and events, dept is interpeting rwsem_acquire() as a potential waiter
and reports a deadlock by the wait.

Of course, the first priority should be not to change the current
behavior. I think the change from non-trylock to trylock for the
annotation won't. Or am I missing something?

	Byungchul

> > Furthermore, now that Dept was introduced, false positive alarms was
> > reported by that. Replaced it with try lock annotation.
> 
> I still have zero idea what this is about.
> 
> Thanks,
> 
>         tglx
