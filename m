Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17665313C2
	for <lists+dri-devel@lfdr.de>; Fri, 31 May 2019 19:25:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A8FD897BC;
	Fri, 31 May 2019 17:25:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C29A6897BC
 for <dri-devel@lists.freedesktop.org>; Fri, 31 May 2019 17:25:13 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 5.2-rc3
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9twUWVimrFu+Lbu4SHZw8szeHD=FGD8GVyf5tmd6p8w7=Q@mail.gmail.com>
References: <CAPM=9twUWVimrFu+Lbu4SHZw8szeHD=FGD8GVyf5tmd6p8w7=Q@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9twUWVimrFu+Lbu4SHZw8szeHD=FGD8GVyf5tmd6p8w7=Q@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2019-05-31
X-PR-Tracked-Commit-Id: 2a3e0b716296a504d9e65fea7acb379c86fe4283
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: ca1918049673a9be507c41fb7e4a69a57601a017
Message-Id: <155932351344.8550.1717898648190094259.pr-tracker-bot@kernel.org>
Date: Fri, 31 May 2019 17:25:13 +0000
To: Dave Airlie <airlied@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1559323513;
 bh=sKYyAym8EO6FT7ThDxTvjDbpuQ8pm7hX1RlE3EIZvg0=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=Yj++GCO3gyIOS90Wel1KyRgYsENBK0Xj/FBkRj+5AMoSWKUmr2k1rRkc30Nm+RTGL
 zhYupM0ZwqDBySQMF6FFZcibmwkcNChNe8H2a2V5jNy9v1jXk0mypqZIsB74xF+NOR
 D0x9kuU6I+obXb/sciBVbdumuns7Uuz6q+NESNKg=
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

VGhlIHB1bGwgcmVxdWVzdCB5b3Ugc2VudCBvbiBGcmksIDMxIE1heSAyMDE5IDExOjEyOjQ1ICsx
MDAwOgoKPiBnaXQ6Ly9hbm9uZ2l0LmZyZWVkZXNrdG9wLm9yZy9kcm0vZHJtIHRhZ3MvZHJtLWZp
eGVzLTIwMTktMDUtMzEKCmhhcyBiZWVuIG1lcmdlZCBpbnRvIHRvcnZhbGRzL2xpbnV4LmdpdDoK
aHR0cHM6Ly9naXQua2VybmVsLm9yZy90b3J2YWxkcy9jL2NhMTkxODA0OTY3M2E5YmU1MDdjNDFm
YjdlNGE2OWE1NzYwMWEwMTcKClRoYW5rIHlvdSEKCi0tIApEZWV0LWRvb3QtZG90LCBJIGFtIGEg
Ym90LgpodHRwczovL2tvcmcud2lraS5rZXJuZWwub3JnL3VzZXJkb2MvcHJ0cmFja2VyCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
