Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F03D329D10
	for <lists+dri-devel@lfdr.de>; Fri, 24 May 2019 19:35:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BAEC6E132;
	Fri, 24 May 2019 17:35:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44EE76E12F
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2019 17:35:17 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 5.2-rc2
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9txEn_xBG7fW+P40v6VZW8txMUn9usQnC4L_KXumXNXMjw@mail.gmail.com>
References: <CAPM=9txEn_xBG7fW+P40v6VZW8txMUn9usQnC4L_KXumXNXMjw@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9txEn_xBG7fW+P40v6VZW8txMUn9usQnC4L_KXumXNXMjw@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2019-05-24
X-PR-Tracked-Commit-Id: e1e52981f292b4e321781794eaf6e8a087f4f300
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: c074989171801171af6c5f53dd16b27f36b31deb
Message-Id: <155871931712.20356.1440632621890156969.pr-tracker-bot@kernel.org>
Date: Fri, 24 May 2019 17:35:17 +0000
To: Dave Airlie <airlied@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1558719317;
 bh=ea7tQ4I3l0XYPLSzWUVRBi8wD4VUi3zM6ApyTznKSEw=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=bprlgLNAzPSZJdRkts86dpLgIYrLhwlZoo4T5vrIIgQMpCiVm13OS/a342oGnvoM5
 HuAl5wy4Ph7cy1ds7na8Q9vG5j6rKGibObG2nR1MRQdLNIFVizOdzLT4ybbanJ+5W6
 hUZP3Mg90tIwIuBD/4NLnMHucmTkmUFr8rTWqaeM=
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

VGhlIHB1bGwgcmVxdWVzdCB5b3Ugc2VudCBvbiBGcmksIDI0IE1heSAyMDE5IDE0OjI4OjA4ICsx
MDAwOgoKPiBnaXQ6Ly9hbm9uZ2l0LmZyZWVkZXNrdG9wLm9yZy9kcm0vZHJtIHRhZ3MvZHJtLWZp
eGVzLTIwMTktMDUtMjQKCmhhcyBiZWVuIG1lcmdlZCBpbnRvIHRvcnZhbGRzL2xpbnV4LmdpdDoK
aHR0cHM6Ly9naXQua2VybmVsLm9yZy90b3J2YWxkcy9jL2MwNzQ5ODkxNzE4MDExNzFhZjZjNWY1
M2RkMTZiMjdmMzZiMzFkZWIKClRoYW5rIHlvdSEKCi0tIApEZWV0LWRvb3QtZG90LCBJIGFtIGEg
Ym90LgpodHRwczovL2tvcmcud2lraS5rZXJuZWwub3JnL3VzZXJkb2MvcHJ0cmFja2VyCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
