Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84C7488039
	for <lists+dri-devel@lfdr.de>; Fri,  9 Aug 2019 18:35:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 566236EE5B;
	Fri,  9 Aug 2019 16:35:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46C726EE5B
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Aug 2019 16:35:11 +0000 (UTC)
Subject: Re: [GIT PULL] fbdev fix for v5.3-rc4
From: pr-tracker-bot@kernel.org
In-Reply-To: <22bfe177-272e-afe8-31d1-75bc0cf852c7@samsung.com>
References: <CGME20190809140736eucas1p2b14d3205aa7268cd1a6bba15ebd81066@eucas1p2.samsung.com>
 <22bfe177-272e-afe8-31d1-75bc0cf852c7@samsung.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <22bfe177-272e-afe8-31d1-75bc0cf852c7@samsung.com>
X-PR-Tracked-Remote: https://github.com/bzolnier/linux.git tags/fbdev-v5.3-rc4
X-PR-Tracked-Commit-Id: 6a7553e8d84d5322d883cb83bb9888c49a0f04e0
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: ec4c99ad7bd23dd39ffb1381136cefa4bb632e31
Message-Id: <156536851114.6429.5323105238493947059.pr-tracker-bot@kernel.org>
Date: Fri, 09 Aug 2019 16:35:11 +0000
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1565368511;
 bh=wQZwrZib4V5IoBim3lmKFxlSHDEW90c/a7uHLnGBg9g=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=OTB1Z74vJ0brP0BiQyF7xSH4p/nImnf8musGCZVgzpAyn9PCCWrXmugxjAxYIDY/5
 6NASRz7Pd3rbisEHLD8pzEG+t8gQIBlrygduIwnITrYLe1MIhp/PQKOexz/NCqC4H0
 vkTLOdyZhA3X5ELD5twK8/c+If6qhHpBfdnXUUzU=
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

VGhlIHB1bGwgcmVxdWVzdCB5b3Ugc2VudCBvbiBGcmksIDkgQXVnIDIwMTkgMTY6MDc6MzUgKzAy
MDA6Cgo+IGh0dHBzOi8vZ2l0aHViLmNvbS9iem9sbmllci9saW51eC5naXQgdGFncy9mYmRldi12
NS4zLXJjNAoKaGFzIGJlZW4gbWVyZ2VkIGludG8gdG9ydmFsZHMvbGludXguZ2l0OgpodHRwczov
L2dpdC5rZXJuZWwub3JnL3RvcnZhbGRzL2MvZWM0Yzk5YWQ3YmQyM2RkMzlmZmIxMzgxMTM2Y2Vm
YTRiYjYzMmUzMQoKVGhhbmsgeW91IQoKLS0gCkRlZXQtZG9vdC1kb3QsIEkgYW0gYSBib3QuCmh0
dHBzOi8va29yZy53aWtpLmtlcm5lbC5vcmcvdXNlcmRvYy9wcnRyYWNrZXIKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
