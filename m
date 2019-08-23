Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EEE879B4BA
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2019 18:45:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E90A6ECF0;
	Fri, 23 Aug 2019 16:45:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 754B76ECF0
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2019 16:45:07 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 5.3-rc6
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tw7pU3_Y=2b0G1u12cn6ZRAB4ypabJz=HopbQ-JLP2zwA@mail.gmail.com>
References: <CAPM=9tw7pU3_Y=2b0G1u12cn6ZRAB4ypabJz=HopbQ-JLP2zwA@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9tw7pU3_Y=2b0G1u12cn6ZRAB4ypabJz=HopbQ-JLP2zwA@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2019-08-23
X-PR-Tracked-Commit-Id: 75710f08ea7e41b2f7010da3f6deab061f7a853b
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 1374a22e0641783a5fa25a18f23d9d7a91c38add
Message-Id: <156657870662.6801.1534341682613399532.pr-tracker-bot@kernel.org>
Date: Fri, 23 Aug 2019 16:45:06 +0000
To: Dave Airlie <airlied@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1566578706;
 bh=I2V+EjWpqRre5Ds4FbG7nrkWjfPQMxu19zfRJ/N0Amg=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=z/eo8Shfww+AyIIKb1yGpOfR0fbgVn4DfGOyVBBOypir0u9R0difMbn3GgKxVnWgD
 kn4LtC/f7au4o/4elcAmJ7QU9r21WnIi3mDE6qi6QrurAN5PVs4y7RbA7ZytJ52g3l
 a+p01bow0a7eQJflml1XcSDWTf4U9w1r9yHk02+8=
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

VGhlIHB1bGwgcmVxdWVzdCB5b3Ugc2VudCBvbiBGcmksIDIzIEF1ZyAyMDE5IDEyOjA3OjEyICsx
MDAwOgoKPiBnaXQ6Ly9hbm9uZ2l0LmZyZWVkZXNrdG9wLm9yZy9kcm0vZHJtIHRhZ3MvZHJtLWZp
eGVzLTIwMTktMDgtMjMKCmhhcyBiZWVuIG1lcmdlZCBpbnRvIHRvcnZhbGRzL2xpbnV4LmdpdDoK
aHR0cHM6Ly9naXQua2VybmVsLm9yZy90b3J2YWxkcy9jLzEzNzRhMjJlMDY0MTc4M2E1ZmEyNWEx
OGYyM2Q5ZDdhOTFjMzhhZGQKClRoYW5rIHlvdSEKCi0tIApEZWV0LWRvb3QtZG90LCBJIGFtIGEg
Ym90LgpodHRwczovL2tvcmcud2lraS5rZXJuZWwub3JnL3VzZXJkb2MvcHJ0cmFja2VyCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
