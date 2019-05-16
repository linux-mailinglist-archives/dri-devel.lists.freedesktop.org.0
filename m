Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 318E320ABD
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2019 17:10:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C0C889711;
	Thu, 16 May 2019 15:10:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDF7689711
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2019 15:10:14 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 5.2-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tyXaYhQ5dFQMkrkpTJZDrjVJjEcKB2bcYi=BKdq7qnQvg@mail.gmail.com>
References: <CAPM=9tyXaYhQ5dFQMkrkpTJZDrjVJjEcKB2bcYi=BKdq7qnQvg@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9tyXaYhQ5dFQMkrkpTJZDrjVJjEcKB2bcYi=BKdq7qnQvg@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-next-2019-05-16
X-PR-Tracked-Commit-Id: 8da0e1525b7f0d69c6cb44094963906282b32673
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: cc7ce90153e74f8266eefee9fba466faa1a2d5df
Message-Id: <155801941459.14983.15933361374021728610.pr-tracker-bot@kernel.org>
Date: Thu, 16 May 2019 15:10:14 +0000
To: Dave Airlie <airlied@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1558019414;
 bh=i8ktoiYzXaR1F/3yFaQFSwDoBUQZ1c1nUvz0vgJnt1o=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=jWmi7VsvlY/T2BObAqwVUa39u2jauPhdGfeipzpDtmb4SL+vXJMz1iPAret2HINs4
 82EKRtFPKkGBs37clFDRECdrVSSpIezH8Wh0iAoY4/WVJ5mrIaEPCRv2wKfftjrP5Y
 q13Ylg5TouASdq0LCw6MO/REc8lU6+ef15fkNd1U=
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIHB1bGwgcmVxdWVzdCB5b3Ugc2VudCBvbiBUaHUsIDE2IE1heSAyMDE5IDEyOjI3OjU0ICsx
MDAwOgoKPiBnaXQ6Ly9hbm9uZ2l0LmZyZWVkZXNrdG9wLm9yZy9kcm0vZHJtIHRhZ3MvZHJtLW5l
eHQtMjAxOS0wNS0xNgoKaGFzIGJlZW4gbWVyZ2VkIGludG8gdG9ydmFsZHMvbGludXguZ2l0Ogpo
dHRwczovL2dpdC5rZXJuZWwub3JnL3RvcnZhbGRzL2MvY2M3Y2U5MDE1M2U3NGY4MjY2ZWVmZWU5
ZmJhNDY2ZmFhMWEyZDVkZgoKVGhhbmsgeW91IQoKLS0gCkRlZXQtZG9vdC1kb3QsIEkgYW0gYSBi
b3QuCmh0dHBzOi8va29yZy53aWtpLmtlcm5lbC5vcmcvdXNlcmRvYy9wcnRyYWNrZXIKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
