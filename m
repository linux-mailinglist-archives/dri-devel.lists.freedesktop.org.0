Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E6FB60095
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jul 2019 07:25:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C97D6E40B;
	Fri,  5 Jul 2019 05:25:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3EE06E40B
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jul 2019 05:25:03 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 5.2 final
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tz2nw3eu-5HXdA9iaMck34pOL=ZZimrVBStK9WUYKsNAQ@mail.gmail.com>
References: <CAPM=9tz2nw3eu-5HXdA9iaMck34pOL=ZZimrVBStK9WUYKsNAQ@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9tz2nw3eu-5HXdA9iaMck34pOL=ZZimrVBStK9WUYKsNAQ@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2019-07-05-1
X-PR-Tracked-Commit-Id: a0b2cf792ac9db7bb73e599e516adfb9dca8e60b
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 3f9c4dc63309286a6513a86aac35ffc445cb9d1a
Message-Id: <156230430379.17573.4119970529169149467.pr-tracker-bot@kernel.org>
Date: Fri, 05 Jul 2019 05:25:03 +0000
To: Dave Airlie <airlied@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1562304303;
 bh=45d3n2/9QobIgyxW4ebDdgA2oQ65jZidNaSA30Xgj5E=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=Fv9G5oqhfOrd9j0gOhBCpeoFzZMfpfy0uSvh30nj7EG4yKjl5rZclVOjKzTIPaLQE
 K4ilYOa//hyqf6GtmDy2UaULrQnhKecaa2COWXX0GjCB8ZH2r/NSqsqJNnhW0tJ5IA
 RWNBL68dVtjtIkH/xcj+jY3OOLFtYM9mozyrte4g=
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

VGhlIHB1bGwgcmVxdWVzdCB5b3Ugc2VudCBvbiBGcmksIDUgSnVsIDIwMTkgMTQ6NTk6MjYgKzEw
MDA6Cgo+IGdpdDovL2Fub25naXQuZnJlZWRlc2t0b3Aub3JnL2RybS9kcm0gdGFncy9kcm0tZml4
ZXMtMjAxOS0wNy0wNS0xCgpoYXMgYmVlbiBtZXJnZWQgaW50byB0b3J2YWxkcy9saW51eC5naXQ6
Cmh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvdG9ydmFsZHMvYy8zZjljNGRjNjMzMDkyODZhNjUxM2E4
NmFhYzM1ZmZjNDQ1Y2I5ZDFhCgpUaGFuayB5b3UhCgotLSAKRGVldC1kb290LWRvdCwgSSBhbSBh
IGJvdC4KaHR0cHM6Ly9rb3JnLndpa2kua2VybmVsLm9yZy91c2VyZG9jL3BydHJhY2tlcgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
