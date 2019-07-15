Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 449D668265
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jul 2019 05:00:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FFC3896A5;
	Mon, 15 Jul 2019 03:00:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA26A896A5;
 Mon, 15 Jul 2019 03:00:14 +0000 (UTC)
Subject: Re: [GIT PULL] Please pull hmm changes
From: pr-tracker-bot@kernel.org
In-Reply-To: <20190709192418.GA13677@ziepe.ca>
References: <20190709192418.GA13677@ziepe.ca>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20190709192418.GA13677@ziepe.ca>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/rdma/rdma.git
 tags/for-linus-hmm
X-PR-Tracked-Commit-Id: cc5dfd59e375f4d0f2b64643723d16b38b2f2d78
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: fec88ab0af9706b2201e5daf377c5031c62d11f7
Message-Id: <156315961463.2012.6385315659069176378.pr-tracker-bot@kernel.org>
Date: Mon, 15 Jul 2019 03:00:14 +0000
To: Jason Gunthorpe <jgg@mellanox.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1563159614;
 bh=Ar2oLzYPfNRIJ/cKktihwM03Q0D3KOFaf7zQt3uCrhY=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=g0DVxuH0O8BwZfaSxEtLyRsfEYPSCQdWnn2yhetG2F8mg12jeSXAQTnuntXE+E6hh
 3jRqBcH7Oh1Z/vN6zC0AHX0l+UoWFpMiIlodt+M38nbijWqBr0neCq5SSuXJhz8Czi
 Qp2nslOyUee5Z2RZI2rVwJKKf+p22oV15OzeaA5A=
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: David Airlie <airlied@linux.ie>, "Kuehling, Felix" <Felix.Kuehling@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Christoph Hellwig <hch@lst.de>, "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Dan Williams <dan.j.williams@intel.com>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIHB1bGwgcmVxdWVzdCB5b3Ugc2VudCBvbiBUdWUsIDkgSnVsIDIwMTkgMTk6MjQ6MjEgKzAw
MDA6Cgo+IGdpdDovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9yZG1h
L3JkbWEuZ2l0IHRhZ3MvZm9yLWxpbnVzLWhtbQoKaGFzIGJlZW4gbWVyZ2VkIGludG8gdG9ydmFs
ZHMvbGludXguZ2l0OgpodHRwczovL2dpdC5rZXJuZWwub3JnL3RvcnZhbGRzL2MvZmVjODhhYjBh
Zjk3MDZiMjIwMWU1ZGFmMzc3YzUwMzFjNjJkMTFmNwoKVGhhbmsgeW91IQoKLS0gCkRlZXQtZG9v
dC1kb3QsIEkgYW0gYSBib3QuCmh0dHBzOi8va29yZy53aWtpLmtlcm5lbC5vcmcvdXNlcmRvYy9w
cnRyYWNrZXIKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
