Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A49497397
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2019 09:34:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFEED6E92E;
	Wed, 21 Aug 2019 07:33:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from conuserg-07.nifty.com (conuserg-07.nifty.com [210.131.2.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D25FC6E2EC
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2019 03:55:46 +0000 (UTC)
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp
 [153.142.97.92]) (authenticated)
 by conuserg-07.nifty.com with ESMTP id x7L3tQp2016439;
 Wed, 21 Aug 2019 12:55:27 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com x7L3tQp2016439
X-Nifty-SrcIP: [153.142.97.92]
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Subject: [PATCH 1/4] video/logo: remove unneeded *.o pattern from clean-files
Date: Wed, 21 Aug 2019 12:55:13 +0900
Message-Id: <20190821035517.21671-2-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190821035517.21671-1-yamada.masahiro@socionext.com>
References: <20190821035517.21671-1-yamada.masahiro@socionext.com>
X-Mailman-Approved-At: Wed, 21 Aug 2019 07:33:34 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nifty.com; s=dec2015msa; t=1566359728;
 bh=vmQBAhaSJK2tNhLoMYDnGiXN0DBL3oiw2A5oHUe77Co=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=BeqOvx+l3wYKOpFmrXRx1YZKFYf6ISYrjN9OdzhjVHLKdfQN0n0wuYwOrJYUwddl5
 IlfxPZXvkek1mxO5aTudwFQULJ2hZ4BDH/3wP4sjE2UAA93cyoz5zaJehikzqVdw3N
 Yp+5SOK656uLWcByPD+FV6Jcg7FmZb2AtwIZrtiWcTptreC03qSXMW7yB5783v7002
 EzrPjw6X/Ne+Ks9i0bMDS0pE/PWc0OLqlA4d5ggQARTuimoS7HV152sh+OxV+o6n2T
 4nSeM3Xy7OtJXWNwyTcHtdn6qZFt7/UakXm1PUGi11zuKNRlk4UsKMdet1KM9Dx4aH
 8SW25SFooxCZQ==
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
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIHBhdHRlcm4gKi5vIGlzIGNsZWFuZWQgdXAgZ2xvYmFsbHkgYnkgdGhlIHRvcCBNYWtlZmls
ZS4KClNpZ25lZC1vZmYtYnk6IE1hc2FoaXJvIFlhbWFkYSA8eWFtYWRhLm1hc2FoaXJvQHNvY2lv
bmV4dC5jb20+Ci0tLQoKIGRyaXZlcnMvdmlkZW8vbG9nby9NYWtlZmlsZSB8IDIgKy0KIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvdmlkZW8vbG9nby9NYWtlZmlsZSBiL2RyaXZlcnMvdmlkZW8vbG9nby9NYWtlZmlsZQpp
bmRleCAyMjhhODliOWJkZDEuLjEwYjc1Y2UzY2UwOSAxMDA2NDQKLS0tIGEvZHJpdmVycy92aWRl
by9sb2dvL01ha2VmaWxlCisrKyBiL2RyaXZlcnMvdmlkZW8vbG9nby9NYWtlZmlsZQpAQCAtNTYs
NCArNTYsNCBAQCAkKG9iaikvJV9ncmF5MjU2LmM6ICQoc3JjKS8lX2dyYXkyNTYucGdtICQocG5t
dG9sb2dvKSBGT1JDRQogCSQoY2FsbCBpZl9jaGFuZ2VkLGxvZ28pCiAKICMgRmlsZXMgZ2VuZXJh
dGVkIHRoYXQgc2hhbGwgYmUgcmVtb3ZlZCB1cG9uIG1ha2UgY2xlYW4KLWNsZWFuLWZpbGVzIDo9
ICoubyAqX21vbm8uYyAqX3ZnYTE2LmMgKl9jbHV0MjI0LmMgKl9ncmF5MjU2LmMKK2NsZWFuLWZp
bGVzIDo9ICpfbW9uby5jICpfdmdhMTYuYyAqX2NsdXQyMjQuYyAqX2dyYXkyNTYuYwotLSAKMi4x
Ny4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
