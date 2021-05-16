Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F009382564
	for <lists+dri-devel@lfdr.de>; Mon, 17 May 2021 09:32:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7E456E8DE;
	Mon, 17 May 2021 07:32:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 377 seconds by postgrey-1.36 at gabe;
 Sun, 16 May 2021 16:12:45 UTC
Received: from depni-mx.sinp.msu.ru (depni-mx.sinp.msu.ru [213.131.7.21])
 by gabe.freedesktop.org (Postfix) with ESMTP id B46886E0AF;
 Sun, 16 May 2021 16:12:45 +0000 (UTC)
Received: from spider (ip-95-220-118-46.bb.netbynet.ru [95.220.118.46])
 by depni-mx.sinp.msu.ru (Postfix) with ESMTPSA id 9250C1BF457;
 Sun, 16 May 2021 19:07:24 +0300 (MSK)
From: Serge Belyshev <belyshev@depni.sinp.msu.ru>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 4/4] i915: fix remap_io_sg to verify the pgprot
References: <20210326055505.1424432-1-hch@lst.de>
 <20210326055505.1424432-5-hch@lst.de>
Date: Sun, 16 May 2021 19:06:25 +0300
In-Reply-To: <20210326055505.1424432-5-hch@lst.de> (Christoph Hellwig's
 message of "Fri, 26 Mar 2021 06:55:05 +0100")
Message-ID: <87pmxqiry6.fsf@depni.sinp.msu.ru>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.0.50 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Mailman-Approved-At: Mon, 17 May 2021 07:32:15 +0000
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
Cc: Peter Zijlstra <peterz@infradead.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 Chris Wilson <chris@chris-wilson.co.uk>, linux-mm@kvack.org,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I have another problem with this patch since it landed in mainline. On
my m3-6Y30 skylake HD Graphics 515 (rev 07), it causes visual artifacts
that look like bunch of one pixel high horizontal streaks, seen most
often in firefox while scrolling or in menu controls.

Reverting this patch on top of current mainline fixes the problem.
