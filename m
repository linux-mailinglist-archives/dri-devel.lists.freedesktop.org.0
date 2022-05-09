Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9653A51F220
	for <lists+dri-devel@lfdr.de>; Mon,  9 May 2022 03:23:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 734A110EBA3;
	Mon,  9 May 2022 01:23:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lgeamrelo11.lge.com (lgeamrelo12.lge.com [156.147.23.52])
 by gabe.freedesktop.org (Postfix) with ESMTP id E8EF810EBA3
 for <dri-devel@lists.freedesktop.org>; Mon,  9 May 2022 01:23:39 +0000 (UTC)
Received: from unknown (HELO lgeamrelo04.lge.com) (156.147.1.127)
 by 156.147.23.52 with ESMTP; 9 May 2022 10:23:37 +0900
X-Original-SENDERIP: 156.147.1.127
X-Original-MAILFROM: byungchul.park@lge.com
Received: from unknown (HELO X58A-UD3R) (10.177.244.38)
 by 156.147.1.127 with ESMTP; 9 May 2022 10:23:37 +0900
X-Original-SENDERIP: 10.177.244.38
X-Original-MAILFROM: byungchul.park@lge.com
Date: Mon, 9 May 2022 10:22:02 +0900
From: Byungchul Park <byungchul.park@lge.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH RFC v6 00/21] DEPT(Dependency Tracker)
Message-ID: <20220509012202.GB6047@X58A-UD3R>
References: <1651652269-15342-1-git-send-email-byungchul.park@lge.com>
 <CAHk-=whnPePcffsNQM+YSHMGttLXvpf8LbBQ8P7HEdqFXaV7Lg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=whnPePcffsNQM+YSHMGttLXvpf8LbBQ8P7HEdqFXaV7Lg@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
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
Cc: hamohammed.sa@gmail.com, Jan Kara <jack@suse.cz>,
 Peter Zijlstra <peterz@infradead.org>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Amir Goldstein <amir73il@gmail.com>, Dave Chinner <david@fromorbit.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 "J. Bruce Fields" <bfields@fieldses.org>, linux-ide@vger.kernel.org,
 Andreas Dilger <adilger.kernel@dilger.ca>,
 Joel Fernandes <joel@joelfernandes.org>, 42.hyeyoo@gmail.com,
 Christoph Lameter <cl@linux.com>, Will Deacon <will@kernel.org>,
 duyuyang@gmail.com, Sasha Levin <sashal@kernel.org>, paolo.valente@linaro.org,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 Matthew Wilcox <willy@infradead.org>, Christoph Hellwig <hch@infradead.org>,
 Dave Airlie <airlied@linux.ie>, Ingo Molnar <mingo@redhat.com>,
 "Darrick J. Wong" <djwong@kernel.org>,
 Vladimir Davydov <vdavydov.dev@gmail.com>,
 David Rientjes <rientjes@google.com>, Dennis Zhou <dennis@kernel.org>,
 Ext4 Developers List <linux-ext4@vger.kernel.org>,
 Linux-MM <linux-mm@kvack.org>, ngupta@vflare.org, johannes.berg@intel.com,
 jack@suse.com, Dan Williams <dan.j.williams@intel.com>,
 Josef Bacik <josef@toxicpanda.com>, Steven Rostedt <rostedt@goodmis.org>,
 linux-block <linux-block@vger.kernel.org>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Jerome Glisse <jglisse@redhat.com>, Al Viro <viro@zeniv.linux.org.uk>,
 Thomas Gleixner <tglx@linutronix.de>, Michal Hocko <mhocko@kernel.org>,
 Vlastimil Babka <vbabka@suse.cz>, melissa.srw@gmail.com, sj@kernel.org,
 Theodore Ts'o <tytso@mit.edu>, rodrigosiqueiramelo@gmail.com,
 kernel-team@lge.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jeff Layton <jlayton@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Pekka Enberg <penberg@kernel.org>, Minchan Kim <minchan@kernel.org>,
 Johannes Weiner <hannes@cmpxchg.org>, Tejun Heo <tj@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 04, 2022 at 11:17:02AM -0700, Linus Torvalds wrote:
> On Wed, May 4, 2022 at 1:19 AM Byungchul Park <byungchul.park@lge.com> wrote:
> >
> > Hi Linus and folks,
> >
> > I've been developing a tool for detecting deadlock possibilities by
> > tracking wait/event rather than lock(?) acquisition order to try to
> > cover all synchonization machanisms.
> 
> So what is the actual status of reports these days?

I'd like to mention one important thing here. Reportability would get
stronger if the more wait-event pairs get tagged everywhere DEPT can
work.

Everything e.g. HW-SW interface, any retry logic and so on can be a
wait-event pair if they work wait or event anyway. For example, polling
on an IO mapped read register and initiating the HW to go for the event
also can be a pair. Definitely those make DEPT more useful.

---

The way to use the APIs:

1. Define SDT(Simple Dependency Tracker)

   DEFINE_DEPT_SDT(my_hw_event); <- add this

2. Tag on the waits

   sdt_wait(&my_hw_event); <- add this
   ... retry logic until my hw work done ... <- the original code

3. Tag on the events

   sdt_event(&my_hw_event); <- add this
   run_my_hw(); <- the original code

---

These are all we should do. I believe DEPT would be a very useful tool
once all wait-event pairs get tagged by the developers in all subsystems
and device drivers.

	Byungchul

> Last time I looked at some reports, it gave a lot of false positives
> due to mis-understanding prepare_to_sleep().
> 
> For this all to make sense, it would need to not have false positives
> (or at least a very small number of them together with a way to sanely
> get rid of them), and also have a track record of finding things that
> lockdep doesn't.
> 
> Maybe such reports have been sent out with the current situation, and
> I haven't seen them.
> 
>                  Linus
