Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AB4C9FE411
	for <lists+dri-devel@lfdr.de>; Fri, 15 Nov 2019 18:35:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 838906E78C;
	Fri, 15 Nov 2019 17:35:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7212A6E0E7
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Nov 2019 17:35:06 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 5.4-rc8
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9twvcfHPb4nrAQnHaEWhQrbByR0CfGXbWo_479c3YR47uw@mail.gmail.com>
References: <CAPM=9twvcfHPb4nrAQnHaEWhQrbByR0CfGXbWo_479c3YR47uw@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9twvcfHPb4nrAQnHaEWhQrbByR0CfGXbWo_479c3YR47uw@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2019-11-15
X-PR-Tracked-Commit-Id: 07ceccacfb27be0e151b876caeda3a556cef099c
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 37b49f31e800b563ed7a601816ea4b6fc3c5d165
Message-Id: <157383930603.31249.14123556472751707976.pr-tracker-bot@kernel.org>
Date: Fri, 15 Nov 2019 17:35:06 +0000
To: Dave Airlie <airlied@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1573839306;
 bh=qRUpeut5kwGB05XEdaCmELLksALookGgKdjeXYvSEIo=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=f+Fb9w3XaZLUlDF34lXlewqZuVfPQTqhD28a7/M3frMHm4+TSRMY63pdz38092JF0
 zTZef3tOOyKonRrvf0NrDu/X2362E+VwTolj4VwPy0P3su9kZvIl3XI4p4kUyajyxe
 qWx1frAeml2TBJcLkAwUF0nq42JCeuIqgA/DHWTA=
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

VGhlIHB1bGwgcmVxdWVzdCB5b3Ugc2VudCBvbiBGcmksIDE1IE5vdiAyMDE5IDExOjE4OjE2ICsx
MDAwOgoKPiBnaXQ6Ly9hbm9uZ2l0LmZyZWVkZXNrdG9wLm9yZy9kcm0vZHJtIHRhZ3MvZHJtLWZp
eGVzLTIwMTktMTEtMTUKCmhhcyBiZWVuIG1lcmdlZCBpbnRvIHRvcnZhbGRzL2xpbnV4LmdpdDoK
aHR0cHM6Ly9naXQua2VybmVsLm9yZy90b3J2YWxkcy9jLzM3YjQ5ZjMxZTgwMGI1NjNlZDdhNjAx
ODE2ZWE0YjZmYzNjNWQxNjUKClRoYW5rIHlvdSEKCi0tIApEZWV0LWRvb3QtZG90LCBJIGFtIGEg
Ym90LgpodHRwczovL2tvcmcud2lraS5rZXJuZWwub3JnL3VzZXJkb2MvcHJ0cmFja2VyCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
