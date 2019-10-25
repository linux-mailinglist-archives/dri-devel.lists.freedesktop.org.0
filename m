Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9090DE54B0
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2019 21:55:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55C7E6EB95;
	Fri, 25 Oct 2019 19:55:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 803386EB95
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2019 19:55:06 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 5.4-rc5
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9twWc0UkE53E5JDV_SW4R-4YFxvDBD2n_Cx_vHr0vj0zqw@mail.gmail.com>
References: <CAPM=9twWc0UkE53E5JDV_SW4R-4YFxvDBD2n_Cx_vHr0vj0zqw@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9twWc0UkE53E5JDV_SW4R-4YFxvDBD2n_Cx_vHr0vj0zqw@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2019-10-25
X-PR-Tracked-Commit-Id: 2a3608409f46e0bae5b6b1a77ddf4c42116698da
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 8caacaad78b69c4329c2ae9341ae7268ecfbf475
Message-Id: <157203330592.840.10702027105867630712.pr-tracker-bot@kernel.org>
Date: Fri, 25 Oct 2019 19:55:05 +0000
To: Dave Airlie <airlied@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1572033305;
 bh=od6dv325B1ScnB1Odsg9kjS4svIIXuk++HznXcA2N1I=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=QUP9GzHOUQS3gjvJTZlj71AVm8yTfn2YA3Zn7Pir+QxMl/nucyhGQHBgCWMevNhzG
 DkkAlamQN4Pd0FZCk+aJjIMXjh2ORlqDeKUD2zXrQqm8cXjkOLe+FJ6E6JS4hGYbew
 UJ7L9Wb+tq4FHIQQ2q305U31kQkdtjtTV3yAafH4=
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

VGhlIHB1bGwgcmVxdWVzdCB5b3Ugc2VudCBvbiBTYXQsIDI2IE9jdCAyMDE5IDA1OjMxOjAxICsx
MDAwOgoKPiBnaXQ6Ly9hbm9uZ2l0LmZyZWVkZXNrdG9wLm9yZy9kcm0vZHJtIHRhZ3MvZHJtLWZp
eGVzLTIwMTktMTAtMjUKCmhhcyBiZWVuIG1lcmdlZCBpbnRvIHRvcnZhbGRzL2xpbnV4LmdpdDoK
aHR0cHM6Ly9naXQua2VybmVsLm9yZy90b3J2YWxkcy9jLzhjYWFjYWFkNzhiNjljNDMyOWMyYWU5
MzQxYWU3MjY4ZWNmYmY0NzUKClRoYW5rIHlvdSEKCi0tIApEZWV0LWRvb3QtZG90LCBJIGFtIGEg
Ym90LgpodHRwczovL2tvcmcud2lraS5rZXJuZWwub3JnL3VzZXJkb2MvcHJ0cmFja2VyCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
