Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A80C8FA8A9
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jun 2024 05:10:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE74710E236;
	Tue,  4 Jun 2024 03:10:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from invmail4.hynix.com (exvmail4.hynix.com [166.125.252.92])
 by gabe.freedesktop.org (Postfix) with ESMTP id 34E7210E236
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jun 2024 03:10:50 +0000 (UTC)
X-AuditID: a67dfc5b-d6dff70000001748-2d-665e85b718cd
Date: Tue, 4 Jun 2024 12:10:42 +0900
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
Message-ID: <20240604031042.GB20371@system.software.com>
References: <20240124115938.80132-1-byungchul@sk.com>
 <20240124115938.80132-15-byungchul@sk.com> <87il3ggfz9.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87il3ggfz9.ffs@tglx>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Brightmail-Tracker: H4sIAAAAAAAAA02SX0yTZxTGfd/vL501H53EdzCzpNvCAs6BkeS4mG3hZt/FFmdMZqJh2sGH
 NELVUlHMxlotBKsikiBQiZZKSgPMaiELDEqwRqD+7aDRFpGMDrMRinVo0Qrr1rKZeXPyy3Oe
 8+S5ODyliDGpvFqjk7QaVbGSldGyuZUtH/ZUflOY5W5MgTMnsyDyrJqGZkcnC95LHQg6uw0Y
 Zq5/DvcXQggWb9+loKHei6Bl6iEF3UOTCFz2oyyMTa8CXyTMgqf+BAvHLjpY+GV2CcPE2ToM
 Hc4v4WatFcNg9HcaGmZYONdwDMfHHxiitnYObPr3IWg3c7A0lQ2eyXsMuMYzoen8BAv9Lg8N
 Qz1BDGM/N7Mw2fk3AzeHRmjwnjnFwI+PrSzMLtgosEXCHIwOWjBcNsaDqp7GGBg+NYihqvUK
 Bl+gD8FA9a8YnJ33WLgWCWHoctZT8LLtOoJgzRwHlSejHJwz1CA4UXmWhrt/DTNgnMiBxRfN
 7Gcfi9dCYUo0dh0SXQsWWrxhJWKv+SEnGgfGOdHiPCh22TPEi/0zWGyZjzCis/04Kzrn6zjR
 NOfD4uM7dzhxpHGRFqd9DfirtB2yzQVSsbpM0n70yW5ZkW/uArffTB32PxjBejSETSiJJ8JG
 cqv2KHrFY6bAsk4L75GJQIxKMCukE78/usyrhQ/IldHxZaYEj4x4rbkJflPIJ4HfrjImxPNy
 Achw1doEKoQjpNuUknDIhWTiaZqm/73MIP7YDE5YKCGNtMX4hJwkKEldtZFNcIrwLhn8aThu
 kcWL9SURwxP3fy3fIlftfroWCebXYs2vxZr/j7Ugqh0p1JqyEpW6eOP6onKN+vD6/H0lThT/
 Stv3Szt70Lx3mxsJPFKulGdZ8woVjKqstLzEjQhPKVfLayp2FirkBaryI5J23y7twWKp1I3S
 eFq5Rr5h4VCBQtij0kl7JWm/pH21xXxSqh4deOe7KebRp8H0b083lc0aXoZw7/OKgdZw7htt
 VQ7dlnUdXwRdUQ2XB+r0SyvyTstz1f3bHMyjVv3moj8bjf7tOZlB84oWPRVa3L1KpwgbArqt
 X2dv75PdaL21peLt7uMGf/YP7r6uTXWxDGF27ajdkuJz9IZyktub7qfm2y+Aki4tUmVnUNpS
 1T9l0ZqOkQMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA02SaUxTaRSG8313pbHMtYPxBp0YOxpNzbCoJMclbonx6ogaE0OCGw1epLKm
 FRQjClIQixJhgpWCUsFURBQpxHFksYJQiluVBikCAmIUBUnEMiLIDMUY/XPy5Jz3Ob9elpB1
 U96sKvqgqI5WRsppCSnZsiLlj79T94T5/dW3GLJO+4HrUzoJ+WWlNNhvXENQWpmMob9hAzwf
 GUAw9ugJAfocO4JLPZ0EVDZ2IagpPkFDS58nOFxDNNhyMmhIKSqj4en7cQwd57IxXDMHwoOz
 hRgso29I0PfTkKdPwZPjLYZRUwkDpqT50FtsYGC8xx9sXa0U1F+wUVDTvghyL3bQUF1jI6Hx
 di+Gljv5NHSV/kfBg8YmEuxZZyi4/qGQhvcjJgJMriEGnlmMGG5qJ7+lDU9QYD1jwZB2uRyD
 w1mFoDa9G4O5tJWGetcAhgpzDgFfrjQg6M0cZCD19CgDecmZCDJSz5Hw5KuVAm1HAIx9zqfX
 rBDqB4YIQVtxSKgZMZJCcyEv/GPoZARtbTsjGM1xQkWxQiiq7sfCpY8uSjCXnKIF88dsRtAN
 OrDw4fFjRmg6P0YKfQ493jY7WLJynxipihfVvqtCJOGOwQIm1kAcbnvRhJNQI9YhD5bnlvIt
 OucUk9w8vsM5QbiZ5hbwbW2jU+zFLeTLn7VPMcHZJLy9cJ2bf+VCeeere5QOsayUA96a9psb
 ZdwRvlI3w52QctN5W24f+c1U8G0T/dgdIbhZ/JUJ1r324OR8drqWdvMM7nfecsuKzyKp4Sfb
 8JNt+GEbEVGCvFTR8VFKVWSAjyYiPCFaddgnNCbKjCZ7Z0ocz7qNPrVsqEMci+TTpHB1d5iM
 UsZrEqLqEM8Sci9p5rGdYTLpPmXCEVEds1cdFylq6tAslpTPlG4KEkNk3H7lQTFCFGNF9fcr
 Zj28k1BPQPVYcmdEgfHPPb0NwbnDPuU+62/FrnL+8u/sd3SD1m/hgYD4uNXDx4+uTPRWeBc1
 Byp2naweWlL1pXXTfcvmh5538l5nzI0I3dicvywTlfmmpAZx99Vpqw3mu8VrF2T7zqmt6A7M
 Wr553Var4WVUcOL2oFi9p7/ej7GFVPlft++IkZOacKW/glBrlP8D/IAG+XMDAAA=
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

On Fri, Jan 26, 2024 at 06:30:02PM +0100, Thomas Gleixner wrote:
> > Furthermore, now that Dept was introduced, false positive alarms was
> > reported by that. Replaced it with try lock annotation.
> 
> I still have zero idea what this is about.

Lockdep is working on lock/unlock, while dept is working on wait/event.

Two are similar but strickly speaking, different in what to track.

	Byungchul
