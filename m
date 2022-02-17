Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4D8B4BC75D
	for <lists+dri-devel@lfdr.de>; Sat, 19 Feb 2022 11:02:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 283E710F68F;
	Sat, 19 Feb 2022 10:02:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lgeamrelo11.lge.com (lgeamrelo12.lge.com [156.147.23.52])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7818F10E83D
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 23:55:12 +0000 (UTC)
Received: from unknown (HELO lgemrelse7q.lge.com) (156.147.1.151)
 by 156.147.23.52 with ESMTP; 18 Feb 2022 08:55:11 +0900
X-Original-SENDERIP: 156.147.1.151
X-Original-MAILFROM: byungchul.park@lge.com
Received: from unknown (HELO X58A-UD3R) (10.177.244.38)
 by 156.147.1.151 with ESMTP; 18 Feb 2022 08:55:11 +0900
X-Original-SENDERIP: 10.177.244.38
X-Original-MAILFROM: byungchul.park@lge.com
Date: Fri, 18 Feb 2022 08:55:04 +0900
From: Byungchul Park <byungchul.park@lge.com>
To: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: Report in ata_scsi_port_error_handler()
Message-ID: <20220217235504.GB20620@X58A-UD3R>
References: <1644984747-26706-1-git-send-email-byungchul.park@lge.com>
 <1644984964-28300-1-git-send-email-byungchul.park@lge.com>
 <1644984964-28300-3-git-send-email-byungchul.park@lge.com>
 <94b1cba2-0e78-bbc0-0321-8be70b2b3be2@opensource.wdc.com>
 <CAHk-=wgfpfWuNQi2SjXQL1ir6iKCpUdBruJ+kmOQP1frH7Zdig@mail.gmail.com>
 <20220216133318.204f36ac@gandalf.local.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220216133318.204f36ac@gandalf.local.home>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Mailman-Approved-At: Sat, 19 Feb 2022 10:01:55 +0000
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
 Joel Fernandes <joel@joelfernandes.org>, Christoph Lameter <cl@linux.com>,
 Will Deacon <will@kernel.org>, duyuyang@gmail.com,
 Sasha Levin <sashal@kernel.org>, paolo.valente@linaro.org,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 Matthew Wilcox <willy@infradead.org>, Christoph Hellwig <hch@infradead.org>,
 Dave Airlie <airlied@linux.ie>, Ingo Molnar <mingo@redhat.com>,
 "Darrick J. Wong" <djwong@kernel.org>,
 Vladimir Davydov <vdavydov.dev@gmail.com>,
 David Rientjes <rientjes@google.com>, Dennis Zhou <dennis@kernel.org>,
 Linux-MM <linux-mm@kvack.org>, ngupta@vflare.org, johannes.berg@intel.com,
 Dan Williams <dan.j.williams@intel.com>, Josef Bacik <josef@toxicpanda.com>,
 linux-block <linux-block@vger.kernel.org>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Jerome Glisse <jglisse@redhat.com>, Al Viro <viro@zeniv.linux.org.uk>,
 Thomas Gleixner <tglx@linutronix.de>, Michal Hocko <mhocko@kernel.org>,
 Vlastimil Babka <vbabka@suse.cz>, Jens Axboe <axboe@kernel.dk>,
 melissa.srw@gmail.com, sj@kernel.org, Theodore Ts'o <tytso@mit.edu>,
 rodrigosiqueiramelo@gmail.com, kernel-team@lge.com,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jeff Layton <jlayton@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Pekka Enberg <penberg@kernel.org>, Minchan Kim <minchan@kernel.org>,
 Johannes Weiner <hannes@cmpxchg.org>, Tejun Heo <tj@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 16, 2022 at 01:33:18PM -0500, Steven Rostedt wrote:
> On Wed, 16 Feb 2022 10:09:14 -0800
> Linus Torvalds <torvalds@linux-foundation.org> wrote:
> 
> > Byungchul, could you fix those two issues? Some of your reports may
> > well be entirely valid, but the hard-to-read hex offsets and the
> > knowledge that at least some of them are confused about how
> > prepare_to_wait -> wait actually works makes the motivation to look at
> > the details much less..
> 
> Hi Byungchul,
> 
> I'm not sure what your tool is using to attach to the kernel to analyze the
> events (perhaps tracepoints?). But you can have the prepare_to_wait event
> just flag the task is about to wait, and then attach to the schedule
> (sched_switch) event to denote that it actually waited.
> 
> Of course have the finish_wait() clear the flag.

(Sorry for late reply, which was because of my email client issue.)

Thank you for the hint. However, unfortunately, I didn't use tracepoint
for that. However, the key idea is the thing that I should take!

Thanks a lot!

Thanks,
Byungchul

> 
> -- Steve
