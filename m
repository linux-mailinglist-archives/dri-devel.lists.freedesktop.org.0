Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57935852592
	for <lists+dri-devel@lfdr.de>; Tue, 13 Feb 2024 02:18:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CDF310E344;
	Tue, 13 Feb 2024 01:18:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from invmail4.hynix.com (exvmail4.skhynix.com [166.125.252.92])
 by gabe.freedesktop.org (Postfix) with ESMTP id EEBF610E344
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Feb 2024 01:18:11 +0000 (UTC)
X-AuditID: a67dfc5b-d85ff70000001748-64-65cac3510c41
Date: Tue, 13 Feb 2024 10:18:04 +0900
From: Byungchul Park <byungchul@sk.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: linux-kernel@vger.kernel.org, kernel_team@skhynix.com,
 torvalds@linux-foundation.org, damien.lemoal@opensource.wdc.com,
 linux-ide@vger.kernel.org, adilger.kernel@dilger.ca,
 linux-ext4@vger.kernel.org, mingo@redhat.com, peterz@infradead.org,
 will@kernel.org, rostedt@goodmis.org, joel@joelfernandes.org,
 sashal@kernel.org, daniel.vetter@ffwll.ch, duyuyang@gmail.com,
 johannes.berg@intel.com, tj@kernel.org, tytso@mit.edu,
 willy@infradead.org, david@fromorbit.com, amir73il@gmail.com,
 gregkh@linuxfoundation.org, kernel-team@lge.com, linux-mm@kvack.org,
 akpm@linux-foundation.org, mhocko@kernel.org, minchan@kernel.org,
 hannes@cmpxchg.org, vdavydov.dev@gmail.com, sj@kernel.org,
 jglisse@redhat.com, dennis@kernel.org, cl@linux.com,
 penberg@kernel.org, rientjes@google.com, vbabka@suse.cz,
 ngupta@vflare.org, linux-block@vger.kernel.org,
 josef@toxicpanda.com, linux-fsdevel@vger.kernel.org,
 viro@zeniv.linux.org.uk, jack@suse.cz, jlayton@kernel.org,
 dan.j.williams@intel.com, hch@infradead.org, djwong@kernel.org,
 dri-devel@lists.freedesktop.org, rodrigosiqueiramelo@gmail.com,
 melissa.srw@gmail.com, hamohammed.sa@gmail.com, 42.hyeyoo@gmail.com,
 chris.p.wilson@intel.com, gwan-gyeong.mun@intel.com,
 max.byungchul.park@gmail.com, boqun.feng@gmail.com,
 longman@redhat.com, hdanton@sina.com, her0gyugyu@gmail.com
Subject: Re: [PATCH v11 14/26] locking/lockdep, cpu/hotplus: Use a weaker
 annotation in AP thread
Message-ID: <20240213011804.GA4147@system.software.com>
References: <20240124115938.80132-1-byungchul@sk.com>
 <20240124115938.80132-15-byungchul@sk.com> <87il3ggfz9.ffs@tglx>
 <20240130025836.GA49173@system.software.com> <871q9hlnl2.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <871q9hlnl2.ffs@tglx>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Brightmail-Tracker: H4sIAAAAAAAAA02SbUxTVxjHc86999zbxi53FfUMkm2WyQyLiobNZ4vZzJZlN3vLlhk/6KI0
 cCONQEmrKHsLykuYIBMMLy3ElGpqAwhSDMGXshZioTSDCkyQQTcYBJm8RLbiGAxWSsz8cvLL
 ef7PL/8Pj8CoV7lIQZd2QjakaVM0RMkqZzZU7/i8vUuO65wEKC6Mg+Bf+SxUNdQR8NfXIqi7
 cQbD1N0PYGBhGsHSTz0MlJf6EVSPjjBwwxNA4LSfJdA3/hz0B+cIeEsLCGRfbiBw79EyhuGy
 Egy1jk/Ad8GKwbU4yUL5FIHK8mwceh5iWLTV8GDL2gZjdjMPy6O7wRu4z4Fz6DUwXRomcMfp
 ZcHTMoah71YVgUDdKgc+TycL/uLzHFybtRJ4tGBjwBac46HXZcFwPSckyvtzhYOO8y4MeVca
 MfQ/uI2gNf83DI66+wTag9MYmhylDPxz9S6CsaIZHnILF3moPFOEoCC3jIWefzs4yBl+HZb+
 riL735Lap+cYKafplORcsLBSl5VKN80jvJTTOsRLFsdJqckeK12+M4Wl6vkgJzlqvieSY76E
 l87N9GNptrublzorllhpvL8cfxZ1SLkvSU7RZciGXW8nKJOv9w2Q9NvK0/UWmoWqhXNIIVAx
 nlqfdOOn3Jb9mKwxK26jtcU/MGtMxFfp4OBimCPE7bSxdyjMjOhVUr/13TXeKCbSB7+7uTVW
 iXupO/Aw7FSLbkR9jfvX/5+nXtM4u74bSwdXpkIZIcRR9OpKuI5C1FB7d204skmMpq7mjlBE
 GarWpKAXXSZmvecL1G0fZC8g0fyM1vyM1vy/1oKYGqTWpWWkanUp8TuTM9N0p3cm6lMdKHSW
 tm+XD7egef8XbUgUkGaDKuGVLlnNaTOMmaltiAqMJkLVW9Epq1VJ2syvZIP+qOFkimxsQ1EC
 q9mi2rNwKkktHtOekI/LcrpseDrFgiIyCyW9/M7E8QMNv0bb4wYujahLN25qTkj+Q2y5V08i
 8wZ6X6x4z1PwS/6Ooq09+kn2YC532POkpHB1gn9/tMzdU2l682jMxwc/TPxGv+xrXYn+8tND
 lS1fR03o52K+27U3XrH11ktXsszG9o/2benb/kaEyvej6WKzc/bx2c17AjFHfnam+8c0rDFZ
 uzuWMRi1/wG/hCFpkgMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA02SW0yTWRDHPee70ljzbcV4AvpgFXYDETVZ4kSNtwc9MdHogxr1QRr4Io3c
 bAVFswZtUbygYgS0oBbQgtBFKYZ4q3IJl9IVkBLAikRYohARUCkRQbTFGH2Z/DLz/03mYURG
 1cMFiNq4g7IuThOj5hWsYstKw+JtNY3yUpthAWScWwqe0TQWcu9YeWgpLUFgvXccw0DtRugY
 G0Qw8ayZgezMFgR5Pa8YuFfXjcBedIIHV98saPMM8+DIPMuDoeAOD8/fTWLoyrqEocS2GZwX
 8zFUjr9lIXuAh5xsA/aWfgzjlmIBLClB0FtkEmCyZxk4uts5qLnm4MDuDoWr17t4eGx3sFB3
 vxeD62EuD93Wbxw46xpYaMlI5+DfoXwe3o1ZGLB4hgVorTRjuGv0bjv5aYqD+vRKDCdvlmFo
 e/EIwZO01xhs1nYeajyDGMptmQx8KaxF0Hv+vQCp58YFyDl+HsHZ1CwWmr/Wc2DsCoeJz7n8
 2pW0ZnCYocbyQ9Q+ZmZpYz6hD0yvBGp84hao2ZZIy4tCaMHjAUzzPno4ais+zVPbx0sCPfO+
 DdOhpiaBNlyZYGlfWzbeOm+3YlWUHKNNknVLVkcoou+6OviER4rDpWaSgvLEM8hPJNLfpNrw
 gfcxKwWRkowLjI956U/S2Tk+zf7SX6Ss1T3NjORQkJb89T6eLUWSF/9XcT5WSstJVXc/9rFK
 qkLEWbb2R/8P4rjax/5wQ0jn1IA3I3o5kBROTZ/gJ6lJUVPJdGSOtJBUVtTji0hp+s02/Wab
 ftlmxBQjf21cUqxGGxMept8fnRynPRwWGR9rQ97Hs/wzmXEfjbo2ViNJROqZyohFjbKK0yTp
 k2OrEREZtb+y9UqDrFJGaZKPyLr4vbrEGFlfjQJFVj1XuWmnHKGS9mkOyvtlOUHW/Zxi0S8g
 BR0NfenelLrtWemt9Kr5K54Wbnid67i8ne6JdBlHhwpHnBXXpIIbUrQ5eKr9zdEsu9YY7FwT
 rwxOSEs3tY59211vmvyUrGXCT1wP+8/oloJw6ayOdZp5UbcrckaSQp2LrV/6L+wgWosnIHEL
 0P5Tgce6RmrX7DpQNto3o/N588ztalYfrVkWwuj0mu/gxPrBdAMAAA==
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

On Mon, Feb 12, 2024 at 04:16:41PM +0100, Thomas Gleixner wrote:
> On Tue, Jan 30 2024 at 11:58, Byungchul Park wrote:
> > On Fri, Jan 26, 2024 at 06:30:02PM +0100, Thomas Gleixner wrote:
> >> On Wed, Jan 24 2024 at 20:59, Byungchul Park wrote:
> >> 
> >> Why is lockdep in the subsystem prefix here? You are changing the CPU
> >> hotplug (not hotplus) code, right?
> >> 
> >> > cb92173d1f0 ("locking/lockdep, cpu/hotplug: Annotate AP thread") was
> >> > introduced to make lockdep_assert_cpus_held() work in AP thread.
> >> >
> >> > However, the annotation is too strong for that purpose. We don't have to
> >> > use more than try lock annotation for that.
> >> 
> >> This lacks a proper explanation why this is too strong.
> >> 
> >> > Furthermore, now that Dept was introduced, false positive alarms was
> >> > reported by that. Replaced it with try lock annotation.
> >> 
> >> I still have zero idea what this is about.
> >
> > 1. can track PG_locked that is a potential deadlock trigger.
> >
> >    https://lore.kernel.org/lkml/1674268856-31807-1-git-send-email-byungchul.park@lge.com/
> 
> Sure, but that wants to be explicitely explained in the changelog and
> not with a link. 'Now that Dept was introduced ...' is not an
> explanation.

Admit. I will fix it from the next spin. Thanks.

	Byungchul
