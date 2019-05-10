Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E2AB41A257
	for <lists+dri-devel@lfdr.de>; Fri, 10 May 2019 19:35:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B31DA6E795;
	Fri, 10 May 2019 17:35:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CAC76E795
 for <dri-devel@lists.freedesktop.org>; Fri, 10 May 2019 17:35:20 +0000 (UTC)
Subject: Re: [GIT PULL] fbdev changes for v5.2
From: pr-tracker-bot@kernel.org
In-Reply-To: <32ceb3b0-0bce-a585-8843-36e851b2a1aa@samsung.com>
References: <CGME20190510165025eucas1p1158b6d87dde378cd9986a6e89125acf1@eucas1p1.samsung.com>
 <32ceb3b0-0bce-a585-8843-36e851b2a1aa@samsung.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <32ceb3b0-0bce-a585-8843-36e851b2a1aa@samsung.com>
X-PR-Tracked-Remote: https://github.com/bzolnier/linux.git tags/fbdev-v5.2
X-PR-Tracked-Commit-Id: d4a5611743a6f5d126f8cbfdbf29e12fd8d1b73f
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: cccd559e98c05b669bdc37b01802f920cff1d6dd
Message-Id: <155750972027.27249.4763452749485963649.pr-tracker-bot@kernel.org>
Date: Fri, 10 May 2019 17:35:20 +0000
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1557509720;
 bh=Nt+CxcwvlJZTJMvBBI6S4qoFF8Qq5Gw7uU01tcOHhYc=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=bJARNUjYNF3fR2TSd4ds4M1sHWGTNu01rqgPdVRlr27h+NWqPjWTDoDF4GHOO0EP3
 hpx/4/MUiiNDGBQOb/i07BRszoKDIIh6WFPdcnTukJElsM374tIg3giMf0MoIxzF9Q
 hafUnUoCA0tEXqw1TbsWGoQ+tQafM6Hl4QPYFHzs=
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
Cc: linux-fbdev@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIHB1bGwgcmVxdWVzdCB5b3Ugc2VudCBvbiBGcmksIDEwIE1heSAyMDE5IDE4OjUwOjIzICsw
MjAwOgoKPiBodHRwczovL2dpdGh1Yi5jb20vYnpvbG5pZXIvbGludXguZ2l0IHRhZ3MvZmJkZXYt
djUuMgoKaGFzIGJlZW4gbWVyZ2VkIGludG8gdG9ydmFsZHMvbGludXguZ2l0OgpodHRwczovL2dp
dC5rZXJuZWwub3JnL3RvcnZhbGRzL2MvY2NjZDU1OWU5OGMwNWI2NjliZGMzN2IwMTgwMmY5MjBj
ZmYxZDZkZAoKVGhhbmsgeW91IQoKLS0gCkRlZXQtZG9vdC1kb3QsIEkgYW0gYSBib3QuCmh0dHBz
Oi8va29yZy53aWtpLmtlcm5lbC5vcmcvdXNlcmRvYy9wcnRyYWNrZXIKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
