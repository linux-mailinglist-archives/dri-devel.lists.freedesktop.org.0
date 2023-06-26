Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C48073E00A
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jun 2023 15:02:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 666D710E1F4;
	Mon, 26 Jun 2023 13:02:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2CC610E1F4
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jun 2023 13:02:28 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1A2ED60EA2;
 Mon, 26 Jun 2023 13:02:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F9A6C433C0;
 Mon, 26 Jun 2023 13:02:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1687784546;
 bh=qHCByCNDys2ECT6mI9nx7oOPVqRAJqAf0TdsDuDj2PI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=o53DZaDNvEAwptnEewGQrTiUVPR6v8FwlmTYX7yfgHWj/oUbJGR0mhRH1GL39WX5g
 fp4oalcmiYuaNf5x8s65Ydy5ihYFrRckIWBUSM6GaHDjLwal1iUXFES1D/rhkOxDnz
 cdPK4n96JJlMF7nWtd+JoN35UgJzBHocXT3XWUCw=
Date: Mon, 26 Jun 2023 15:02:22 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Byungchul Park <byungchul@sk.com>
Subject: Re: [PATCH v10 00/25] DEPT(Dependency Tracker)
Message-ID: <2023062627-chooser-douche-6613@gregkh>
References: <20230626115700.13873-1-byungchul@sk.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230626115700.13873-1-byungchul@sk.com>
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
 dan.j.williams@intel.com, josef@toxicpanda.com, rostedt@goodmis.org,
 gwan-gyeong.mun@intel.com, linux-block@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, jglisse@redhat.com, paolo.valente@linaro.org,
 viro@zeniv.linux.org.uk, longman@redhat.com, tglx@linutronix.de,
 vbabka@suse.cz, melissa.srw@gmail.com, sj@kernel.org, tytso@mit.edu,
 rodrigosiqueiramelo@gmail.com, kernel-team@lge.com, jlayton@kernel.org,
 linux-kernel@vger.kernel.org, penberg@kernel.org, minchan@kernel.org,
 max.byungchul.park@gmail.com, hannes@cmpxchg.org, tj@kernel.org,
 akpm@linux-foundation.org, torvalds@linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jun 26, 2023 at 08:56:35PM +0900, Byungchul Park wrote:
> >From now on, I can work on LKML again! I'm wondering if DEPT has been
> helping kernel debugging well even though it's a form of patches yet.
> 
> I'm happy to see that DEPT reports a real problem in practice. See:
> 
>    https://lore.kernel.org/lkml/6383cde5-cf4b-facf-6e07-1378a485657d@I-love.SAKURA.ne.jp/#t
>    https://lore.kernel.org/lkml/1674268856-31807-1-git-send-email-byungchul.park@lge.com/
> 
> Nevertheless, I apologize for the lack of document. I promise to add it
> before it gets needed to use DEPT's APIs by users. For now, you can use
> DEPT just with CONFIG_DEPT on.
> 
> ---
> 
> Hi Linus and folks,
> 
> I've been developing a tool for detecting deadlock possibilities by
> tracking wait/event rather than lock(?) acquisition order to try to
> cover all synchonization machanisms. It's done on v6.2-rc2.
> 
> Benifit:
> 
> 	0. Works with all lock primitives.
> 	1. Works with wait_for_completion()/complete().
> 	2. Works with 'wait' on PG_locked.
> 	3. Works with 'wait' on PG_writeback.
> 	4. Works with swait/wakeup.
> 	5. Works with waitqueue.
> 	6. Works with wait_bit.
> 	7. Multiple reports are allowed.
> 	8. Deduplication control on multiple reports.
> 	9. Withstand false positives thanks to 6.
> 	10. Easy to tag any wait/event.
> 
> Future work:
> 
> 	0. To make it more stable.
> 	1. To separates Dept from Lockdep.
> 	2. To improves performance in terms of time and space.
> 	3. To use Dept as a dependency engine for Lockdep.
> 	4. To add any missing tags of wait/event in the kernel.
> 	5. To deduplicate stack trace.

If you run this today, does it find any issues with any subsystems /
drivers that the current lockdep code does not find?  Have you run your
tool on patches sent to the different mailing lists for new drivers and
code added to the tree to verify that it can find issues easily?

In other words, why do we need this at all?  What makes it 'better' than
what we already have that works for us today?  What benifit is it?

thanks,

greg k-h
