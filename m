Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BBF975207A1
	for <lists+dri-devel@lfdr.de>; Tue, 10 May 2022 00:29:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBC3110F0D7;
	Mon,  9 May 2022 22:29:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCC4B10F0D7
 for <dri-devel@lists.freedesktop.org>; Mon,  9 May 2022 22:29:14 +0000 (UTC)
Received: from cwcc.thunk.org (pool-108-7-220-252.bstnma.fios.verizon.net
 [108.7.220.252]) (authenticated bits=0)
 (User authenticated as tytso@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 249MSHo6011967
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 9 May 2022 18:28:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
 t=1652135313; bh=PomMNNmWyc5YBypwEkVpIDxcMt6S+On8bnwlKnLl0F0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=Rs39OkFP/pNTkSQxZVxoNUvjfqeJsxGjlEaKtnLe8EYOjlpbdGk2tHWkiS9d9BcFF
 RIS/AIDq54gd3qcAa4HbE2GaHSv1KAhIEOOsohL8REgCHrQHDaElN2R3RR5DILb92k
 krMVvIOOSSVttntoFPdV+0VPdEuK4jdzgzxcp31ezytw6TdqVQENGAP6bOz/BbSmd9
 +UAjd3OyeAuuz3Oxm3sSUqTbAfnKQofWUeaXq8o4sQop7aqBnBEH1MzLZrD38+kmOc
 JbnmmK0DrKFNfZWR24Bn4TkvdA/n26ClG04VexyZ41JIVMdMdWBkKBvA+xtD1mMnID
 Vo6X0EhaRd7zA==
Received: by cwcc.thunk.org (Postfix, from userid 15806)
 id A4D2D15C3F0A; Mon,  9 May 2022 18:28:17 -0400 (EDT)
Date: Mon, 9 May 2022 18:28:17 -0400
From: "Theodore Ts'o" <tytso@mit.edu>
To: Byungchul Park <byungchul.park@lge.com>
Subject: Re: [PATCH RFC v6 00/21] DEPT(Dependency Tracker)
Message-ID: <YnmVgVQ7usoXnJ1N@mit.edu>
References: <1651652269-15342-1-git-send-email-byungchul.park@lge.com>
 <YnmCE2iwa0MSqocr@mit.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YnmCE2iwa0MSqocr@mit.edu>
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
Cc: hamohammed.sa@gmail.com, jack@suse.cz, peterz@infradead.org,
 daniel.vetter@ffwll.ch, amir73il@gmail.com, david@fromorbit.com,
 dri-devel@lists.freedesktop.org, chris@chris-wilson.co.uk,
 bfields@fieldses.org, linux-ide@vger.kernel.org, adilger.kernel@dilger.ca,
 joel@joelfernandes.org, 42.hyeyoo@gmail.com, cl@linux.com, will@kernel.org,
 duyuyang@gmail.com, sashal@kernel.org, paolo.valente@linaro.org,
 damien.lemoal@opensource.wdc.com, willy@infradead.org, hch@infradead.org,
 airlied@linux.ie, mingo@redhat.com, djwong@kernel.org, vdavydov.dev@gmail.com,
 rientjes@google.com, dennis@kernel.org, linux-ext4@vger.kernel.org,
 linux-mm@kvack.org, ngupta@vflare.org, johannes.berg@intel.com, jack@suse.com,
 dan.j.williams@intel.com, josef@toxicpanda.com, rostedt@goodmis.org,
 linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org, jglisse@redhat.com,
 viro@zeniv.linux.org.uk, tglx@linutronix.de, mhocko@kernel.org, vbabka@suse.cz,
 melissa.srw@gmail.com, sj@kernel.org, rodrigosiqueiramelo@gmail.com,
 kernel-team@lge.com, gregkh@linuxfoundation.org, jlayton@kernel.org,
 linux-kernel@vger.kernel.org, penberg@kernel.org, minchan@kernel.org,
 hannes@cmpxchg.org, tj@kernel.org, akpm@linux-foundation.org,
 torvalds@linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Oh, one other problem with DEPT --- it's SLOW --- the overhead is
enormous.  Using kvm-xfstests[1] running "kvm-xfstests smoke", here
are some sample times:

			LOCKDEP		DEPT
Time to first test	49 seconds	602 seconds
ext4/001      		2 s		22 s
ext4/003		2 s		8 s
ext4/005		0 s		7 s
ext4/020		1 s		8 s
ext4/021		11 s		17 s
ext4/023		0 s		83 s
generic/001		4 s		76 s
generic/002		0 s		11 s
generic/003		10 s		19 s

There are some large variations; in some cases, some xfstests take 10x
as much time or more to run.  In fact, when I first started the
kvm-xfstests run with DEPT, I thought something had hung and that
tests would never start.  (In fact, with gce-xfstests the default
watchdog "something has gone terribly wrong with the kexec" had fired,
and I didn't get any test results using gce-xfstests at all.  If DEPT
goes in without any optimizations, I'm going to have to adjust the
watchdogs timers for gce-xfstests.)

The bottom line is that at the moment, between the false positives,
and the significant overhead imposed by DEPT, I would suggest that if
DEPT ever does go in, that it should be possible to disable DEPT and
only use the existing CONFIG_PROVE_LOCKING version of LOCKDEP, just
because DEPT is S - L - O - W.

[1] https://github.com/tytso/xfstests-bld/blob/master/Documentation/kvm-quickstart.md

						- Ted

P.S.  Darrick and I both have disabled using LOCKDEP by default
because it slows down ext4 -g auto testing by a factor 2, and xfs -g
auto testing by a factor of 3.  So the fact that DEPT is a factor of
2x to 10x or more slower than LOCKDEP when running various xfstests
tests should be a real concern.

