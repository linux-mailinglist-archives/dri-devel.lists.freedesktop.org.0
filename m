Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F067905C6
	for <lists+dri-devel@lfdr.de>; Fri, 16 Aug 2019 18:30:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AA506E35F;
	Fri, 16 Aug 2019 16:30:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E0B56E35F
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Aug 2019 16:30:05 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 5.3-rc5
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tx2Kkbyor2-EnK31VE1eARbq6zCyNgqj39tyLqd8uUWKA@mail.gmail.com>
References: <CAPM=9tx2Kkbyor2-EnK31VE1eARbq6zCyNgqj39tyLqd8uUWKA@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9tx2Kkbyor2-EnK31VE1eARbq6zCyNgqj39tyLqd8uUWKA@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2019-08-16
X-PR-Tracked-Commit-Id: a85abd5d45adba75535b7fc6d9f78329a693b7a9
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: ec037ac244c070f9eedcdf5cdb23bd817e7b8cf4
Message-Id: <156597300495.15122.500266032759245284.pr-tracker-bot@kernel.org>
Date: Fri, 16 Aug 2019 16:30:04 +0000
To: Dave Airlie <airlied@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1565973005;
 bh=X0N24WaO4ijj8bin8BKWcaf+z4gGYDcFJcVqNwGtnyg=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=1sXtOnDQpRcYoOu5M2MSCphW120fdRnqT0sYUcqWtborAXFqHwBB/ZP7/hG0Rh2sn
 x9JnvyH11o18/xSf73RIQxp6/zxbm0UC0FGIX0+e/EQYNQcaJmTYxZh+lYwKyD21sH
 nmMrhjJIbUJf5/jsGyWea43u204pgiv7U/kQuDPg=
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

VGhlIHB1bGwgcmVxdWVzdCB5b3Ugc2VudCBvbiBGcmksIDE2IEF1ZyAyMDE5IDE0OjIxOjU2ICsx
MDAwOgoKPiBnaXQ6Ly9hbm9uZ2l0LmZyZWVkZXNrdG9wLm9yZy9kcm0vZHJtIHRhZ3MvZHJtLWZp
eGVzLTIwMTktMDgtMTYKCmhhcyBiZWVuIG1lcmdlZCBpbnRvIHRvcnZhbGRzL2xpbnV4LmdpdDoK
aHR0cHM6Ly9naXQua2VybmVsLm9yZy90b3J2YWxkcy9jL2VjMDM3YWMyNDRjMDcwZjllZWRjZGY1
Y2RiMjNiZDgxN2U3YjhjZjQKClRoYW5rIHlvdSEKCi0tIApEZWV0LWRvb3QtZG90LCBJIGFtIGEg
Ym90LgpodHRwczovL2tvcmcud2lraS5rZXJuZWwub3JnL3VzZXJkb2MvcHJ0cmFja2VyCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
