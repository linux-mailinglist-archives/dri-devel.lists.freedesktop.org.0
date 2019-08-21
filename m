Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 727A09739C
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2019 09:34:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 098E36E933;
	Wed, 21 Aug 2019 07:34:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from conuserg-07.nifty.com (conuserg-07.nifty.com [210.131.2.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86BF06E8F6
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2019 04:13:13 +0000 (UTC)
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp
 [153.142.97.92]) (authenticated)
 by conuserg-07.nifty.com with ESMTP id x7L4CeQA002060;
 Wed, 21 Aug 2019 13:12:40 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com x7L4CeQA002060
X-Nifty-SrcIP: [153.142.97.92]
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Subject: [PATCH v2 0/4] video/logo: various fix and cleanups of
 drivers/video/logo/Makefile
Date: Wed, 21 Aug 2019 13:12:33 +0900
Message-Id: <20190821041237.23197-1-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Wed, 21 Aug 2019 07:33:34 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nifty.com; s=dec2015msa; t=1566360761;
 bh=ITTy2JaYsvB5fhZRvaY4vqzdeTClwZEtTVpr/IcMcII=;
 h=From:To:Cc:Subject:Date:From;
 b=xstKaU3lqSmOGLGJD015uRb12PJzIbbFuHUXMu7kBkBT2h69LXhomvUiNJz1Vx5w2
 Y6/oWa/c2SqMVU4L+Y661Sbv2MuOT/Bhx9N27FiyJpFrWzwVqsLR/WameVMQhj6Pp/
 opdwVsNjAm/orhWWsu6K6WfjWsq7JLiZEZ7Z20sVeovZvBa5P/8nObnZFA+rTcB9xP
 vfi4vySswOs67OObuh35ygrXziVv/IVx4wH9f9/Pyv4f8x+hwhwThHd/jXCVE7ORK6
 BSLMxwGY5zfXTxWKpeiXiedjB+aAnTkEZfjS8Gx7Z2HbCQre5ly2vwwBvdamCqyO9X
 r5NlEsw8XtAkQ==
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
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
 Michal Marek <michal.lkml@markovi.net>,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-kernel@vger.kernel.org,
 linux-kbuild@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Q2hhbmdlcyBpbiB2MjoKICAtIEZpeCBjb21taXQgbG9nCgpNYXNhaGlybyBZYW1hZGEgKDQpOgog
IHZpZGVvL2xvZ286IHJlbW92ZSB1bm5lZWRlZCAqLm8gcGF0dGVybiBmcm9tIGNsZWFuLWZpbGVz
CiAgdmlkZW8vbG9nbzogZG8gbm90IGdlbmVyYXRlIHVubmVlZGVkIGxvZ28gQyBmaWxlcwogIHZp
ZGVvL2xvZ286IHNpbXBsaWZ5IGNtZF9sb2dvCiAgdmlkZW8vbG9nbzogbW92ZSBwbm10b2xvZ28g
dG9vbCB0byBkcml2ZXJzL3ZpZGVvL2xvZ28vIGZyb20gc2NyaXB0cy8KCiBkcml2ZXJzL3ZpZGVv
L2xvZ28vLmdpdGlnbm9yZSAgICAgICAgICAgICAgIHwgIDEgKwogZHJpdmVycy92aWRlby9sb2dv
L01ha2VmaWxlICAgICAgICAgICAgICAgICB8IDM2ICsrKystLS0tLS0tLS0tLS0tLS0tLQoge3Nj
cmlwdHMgPT4gZHJpdmVycy92aWRlby9sb2dvfS9wbm10b2xvZ28uYyB8ICAwCiBzY3JpcHRzLy5n
aXRpZ25vcmUgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDEgLQogc2NyaXB0cy9NYWtlZmls
ZSAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAyIC0tCiA1IGZpbGVzIGNoYW5nZWQsIDgg
aW5zZXJ0aW9ucygrKSwgMzIgZGVsZXRpb25zKC0pCiByZW5hbWUge3NjcmlwdHMgPT4gZHJpdmVy
cy92aWRlby9sb2dvfS9wbm10b2xvZ28uYyAoMTAwJSkKCi0tIAoyLjE3LjEKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
