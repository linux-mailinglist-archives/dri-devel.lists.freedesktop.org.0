Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F00571157C1
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2019 20:25:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB9F36FA83;
	Fri,  6 Dec 2019 19:25:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71E606FA83
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Dec 2019 19:25:25 +0000 (UTC)
Subject: Re: [git pull] drm msm-next and fixes
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tzTYPTk9vBxyGruTO_NwYAqk6s+=LRPg2CX9-Zf55Q1sw@mail.gmail.com>
References: <CAPM=9tzTYPTk9vBxyGruTO_NwYAqk6s+=LRPg2CX9-Zf55Q1sw@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9tzTYPTk9vBxyGruTO_NwYAqk6s+=LRPg2CX9-Zf55Q1sw@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-next-2019-12-06
X-PR-Tracked-Commit-Id: 9c1867d730a6e1dc23dd633392d102860578c047
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 7ada90eb9c7ae4a8eb066f8e9b4d80122f0363db
Message-Id: <157566032527.16317.6029268358637804973.pr-tracker-bot@kernel.org>
Date: Fri, 06 Dec 2019 19:25:25 +0000
To: Dave Airlie <airlied@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1575660325;
 bh=p9bveILx+cdu5fEA5I6KU1MFjK0cuP0E31/rezFRch8=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=iTPXFcl9Z3w+qsIubse+kxvXnBGjqUrPgj7WuJ8WkPzwFDFE1zm1QRyruqKURmMJS
 fCxChS5RJJlqRqAHJhsG6GqC1utrYJgMZ4vawcOEIoV66e9uFFkBDSFLcQacn7KR3V
 zgGoId36bd4cv62zuwZPXbaHMHNJ9kz+Hm4h7M2w=
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

VGhlIHB1bGwgcmVxdWVzdCB5b3Ugc2VudCBvbiBGcmksIDYgRGVjIDIwMTkgMTM6MzE6MDYgKzEw
MDA6Cgo+IGdpdDovL2Fub25naXQuZnJlZWRlc2t0b3Aub3JnL2RybS9kcm0gdGFncy9kcm0tbmV4
dC0yMDE5LTEyLTA2CgpoYXMgYmVlbiBtZXJnZWQgaW50byB0b3J2YWxkcy9saW51eC5naXQ6Cmh0
dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvdG9ydmFsZHMvYy83YWRhOTBlYjljN2FlNGE4ZWIwNjZmOGU5
YjRkODAxMjJmMDM2M2RiCgpUaGFuayB5b3UhCgotLSAKRGVldC1kb290LWRvdCwgSSBhbSBhIGJv
dC4KaHR0cHM6Ly9rb3JnLndpa2kua2VybmVsLm9yZy91c2VyZG9jL3BydHJhY2tlcgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
