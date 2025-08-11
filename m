Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DFECB21199
	for <lists+dri-devel@lfdr.de>; Mon, 11 Aug 2025 18:21:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A2C010E510;
	Mon, 11 Aug 2025 16:21:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="liXkgtiG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEA0010E510
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Aug 2025 16:21:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=6YHqt8dWj0fcOgUOsveewDH79nk5pj47gaZ/Su64I5g=; b=liXkgtiG8wbNgpaQarlZkHQgSv
 4p62NrRciMPAFBLxsx6b3UgfbH1VRls7q3wuLWWT4QXhZwkLfA+k8BrmH57rx9AvlT50SOx9iFXCI
 hK5WidfqB160MtmCqSx7nxFphlYXxCgkCQ1RUkv7o1+XseT/c6WF/OxE6LEuPKRr4EqV5Snrc0UtZ
 E7KVMcaENnK/+GZk75OVQP1a/rHP1Youbcr3qZGtMc5vhzoB300fGlIlFfUzAUlcio3d/+woqjSdu
 pNtXxIh8YuOWlZp33QNposlBXE+ioEqZ+iidTSGhXRKtVY4gbodlE2zo5yq+8QSiQPNNMKyzQ7ggD
 aXCC5mPQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1ulVHG-00000007Mvu-1fZy; Mon, 11 Aug 2025 16:21:39 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
 id CCDF9300328; Mon, 11 Aug 2025 18:21:37 +0200 (CEST)
Date: Mon, 11 Aug 2025 18:21:37 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: John Stultz <jstultz@google.com>, LKML <linux-kernel@vger.kernel.org>,
 syzbot+602c4720aed62576cd79@syzkaller.appspotmail.com,
 K Prateek Nayak <kprateek.nayak@amd.com>,
 Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Valentin Schneider <valentin.schneider@arm.com>,
 Suleiman Souhlal <suleiman@google.com>, airlied@gmail.com,
 mripard@kernel.org, simona@ffwll.ch, tzimmermann@suse.de,
 dri-devel@lists.freedesktop.org, kernel-team@android.com
Subject: Re: [PATCH v3] locking: Fix __clear_task_blocked_on() warning from
 __ww_mutex_wound() path
Message-ID: <20250811162137.GB4067720@noisy.programming.kicks-ass.net>
References: <20250801192157.912805-1-jstultz@google.com>
 <20250805001026.2247040-1-jstultz@google.com>
 <d737c0f0-c0e0-4df5-8246-b484db8d061b@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d737c0f0-c0e0-4df5-8246-b484db8d061b@linux.intel.com>
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

On Tue, Aug 05, 2025 at 11:27:47AM +0200, Maarten Lankhorst wrote:
> Acked-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

Thanks both!
