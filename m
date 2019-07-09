Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB83C63A73
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2019 20:05:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34FCF6E091;
	Tue,  9 Jul 2019 18:05:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7B666E091
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jul 2019 18:05:13 +0000 (UTC)
Subject: Re: [GIT PULL] fbdev changes for v5.3
From: pr-tracker-bot@kernel.org
In-Reply-To: <a6d44af3-cf51-a072-7c52-f505c8990630@samsung.com>
References: <CGME20190709131028eucas1p1f45ed7a16b10e58c649da4ab4a30aff5@eucas1p1.samsung.com>
 <a6d44af3-cf51-a072-7c52-f505c8990630@samsung.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <a6d44af3-cf51-a072-7c52-f505c8990630@samsung.com>
X-PR-Tracked-Remote: https://github.com/bzolnier/linux.git tags/fbdev-v5.3
X-PR-Tracked-Commit-Id: 732146a3f1dc78ebb0d3c4b1f4dc6ea33cc2c58f
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 2d41ef5432b76ae90dc0db93026f1d981f874ec4
Message-Id: <156269551372.14383.671855111699940274.pr-tracker-bot@kernel.org>
Date: Tue, 09 Jul 2019 18:05:13 +0000
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1562695513;
 bh=haDQtb26+fghg9OXTvV9KWxITnThNUfZvQFnEdNh+ik=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=V1uo+EaHdXkacdzeCiFbgDCjeJPUNfgKAFvfORq3I6mQnzFMHvP87HxeNo/e4pdUt
 6xlDrqzQDzJWBko/mLVR63gzJU6xMmBrCy0IIfJLcE2gJEnPxaL9X9aenEplCy0uJx
 5TSZGVzoEe4JUkzrr/4a1XJpZv5mg0lDlTZaANYU=
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIHB1bGwgcmVxdWVzdCB5b3Ugc2VudCBvbiBUdWUsIDkgSnVsIDIwMTkgMTU6MTA6MzMgKzAy
MDA6Cgo+IGh0dHBzOi8vZ2l0aHViLmNvbS9iem9sbmllci9saW51eC5naXQgdGFncy9mYmRldi12
NS4zCgpoYXMgYmVlbiBtZXJnZWQgaW50byB0b3J2YWxkcy9saW51eC5naXQ6Cmh0dHBzOi8vZ2l0
Lmtlcm5lbC5vcmcvdG9ydmFsZHMvYy8yZDQxZWY1NDMyYjc2YWU5MGRjMGRiOTMwMjZmMWQ5ODFm
ODc0ZWM0CgpUaGFuayB5b3UhCgotLSAKRGVldC1kb290LWRvdCwgSSBhbSBhIGJvdC4KaHR0cHM6
Ly9rb3JnLndpa2kua2VybmVsLm9yZy91c2VyZG9jL3BydHJhY2tlcgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
