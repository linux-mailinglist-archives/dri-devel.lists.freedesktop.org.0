Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 472C6ABD40
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2019 18:05:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A28356E2F7;
	Fri,  6 Sep 2019 16:05:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAC386E2F7
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Sep 2019 16:05:06 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 5.3-rc8 (or final)
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9twnS=MQzLZM6sJ5wCtS5reFqd7715DtceP-6+=h2JoKLg@mail.gmail.com>
References: <CAPM=9twnS=MQzLZM6sJ5wCtS5reFqd7715DtceP-6+=h2JoKLg@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9twnS=MQzLZM6sJ5wCtS5reFqd7715DtceP-6+=h2JoKLg@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2019-09-06
X-PR-Tracked-Commit-Id: 1e19ec6c3c417a0893fcfae7abfba623e781d876
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 08d433d8121598f7c2a45f3461c534746b1ed05b
Message-Id: <156778590670.8517.14063443643134424076.pr-tracker-bot@kernel.org>
Date: Fri, 06 Sep 2019 16:05:06 +0000
To: Dave Airlie <airlied@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1567785906;
 bh=b1hB4Hzd76gmAO6x22jNaF/llqS4XF+ieLK0Q/iLKyg=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=BEw9cohDjNEe2uedGZflktJOedxTBoGsATjrpAHPRNxaCaGO6xIDibF0Z6p4393Mp
 d4FyQzHoo0U8ODqmSp/hzvuMDvEGToaLofmN4KtKONJLofEeLjP+QILZWY1I0WB2UF
 YomcxAiGqAPPg3hJjdSa2qBsJ/ssjCeGw/9fqPto=
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

VGhlIHB1bGwgcmVxdWVzdCB5b3Ugc2VudCBvbiBGcmksIDYgU2VwIDIwMTkgMTc6MTg6MzQgKzEw
MDA6Cgo+IGdpdDovL2Fub25naXQuZnJlZWRlc2t0b3Aub3JnL2RybS9kcm0gdGFncy9kcm0tZml4
ZXMtMjAxOS0wOS0wNgoKaGFzIGJlZW4gbWVyZ2VkIGludG8gdG9ydmFsZHMvbGludXguZ2l0Ogpo
dHRwczovL2dpdC5rZXJuZWwub3JnL3RvcnZhbGRzL2MvMDhkNDMzZDgxMjE1OThmN2MyYTQ1ZjM0
NjFjNTM0NzQ2YjFlZDA1YgoKVGhhbmsgeW91IQoKLS0gCkRlZXQtZG9vdC1kb3QsIEkgYW0gYSBi
b3QuCmh0dHBzOi8va29yZy53aWtpLmtlcm5lbC5vcmcvdXNlcmRvYy9wcnRyYWNrZXIKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
