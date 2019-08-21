Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE6A09738D
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2019 09:33:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA05C6E928;
	Wed, 21 Aug 2019 07:33:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from conuserg-07.nifty.com (conuserg-07.nifty.com [210.131.2.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 889866E8F9
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2019 04:13:13 +0000 (UTC)
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp
 [153.142.97.92]) (authenticated)
 by conuserg-07.nifty.com with ESMTP id x7L4CeQB002060;
 Wed, 21 Aug 2019 13:12:41 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com x7L4CeQB002060
X-Nifty-SrcIP: [153.142.97.92]
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Subject: [PATCH v2 1/4] video/logo: remove unneeded *.o pattern from
 clean-files
Date: Wed, 21 Aug 2019 13:12:34 +0900
Message-Id: <20190821041237.23197-2-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190821041237.23197-1-yamada.masahiro@socionext.com>
References: <20190821041237.23197-1-yamada.masahiro@socionext.com>
X-Mailman-Approved-At: Wed, 21 Aug 2019 07:33:34 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nifty.com; s=dec2015msa; t=1566360761;
 bh=PNOVklVeViw/I1/MmLHYVbub09qIw/pFC2OWA5k3L1Q=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=LQcJcc1VfN83cd5Um0q55gMG3Nanz759avd9ucEZvv4/Jk69mJPLV24gsAMiZVxaz
 NwkLW+edKS75pYBcLYHaG9GJz4SFjknkDGM7UZtD2JAJy+FhJDJKMrUU/AH56sFjR0
 wliRjaKPifyIn0ASBxmNNNNBZqGDmOpgmA7AlGKCKgPGm0snUF98OgxMsjqCP0GdW1
 3fc5uknRB2/0wuVNWc3/qS7m+N8iOKI3rAzhCg+PVhjsZonuZHWv1/WChDLGB7VNfl
 kJLz++7E0V4DFxu7Fn6/hmk0LwyAkLbRziPZWZ4Ec881DCcHIfmbIn5BRDq2/mN62x
 rlRNLxxaTeYAA==
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
bmV4dC5jb20+Ci0tLQoKQ2hhbmdlcyBpbiB2MjogTm9uZQoKIGRyaXZlcnMvdmlkZW8vbG9nby9N
YWtlZmlsZSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlv
bigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmlkZW8vbG9nby9NYWtlZmlsZSBiL2RyaXZlcnMv
dmlkZW8vbG9nby9NYWtlZmlsZQppbmRleCAyMjhhODliOWJkZDEuLjEwYjc1Y2UzY2UwOSAxMDA2
NDQKLS0tIGEvZHJpdmVycy92aWRlby9sb2dvL01ha2VmaWxlCisrKyBiL2RyaXZlcnMvdmlkZW8v
bG9nby9NYWtlZmlsZQpAQCAtNTYsNCArNTYsNCBAQCAkKG9iaikvJV9ncmF5MjU2LmM6ICQoc3Jj
KS8lX2dyYXkyNTYucGdtICQocG5tdG9sb2dvKSBGT1JDRQogCSQoY2FsbCBpZl9jaGFuZ2VkLGxv
Z28pCiAKICMgRmlsZXMgZ2VuZXJhdGVkIHRoYXQgc2hhbGwgYmUgcmVtb3ZlZCB1cG9uIG1ha2Ug
Y2xlYW4KLWNsZWFuLWZpbGVzIDo9ICoubyAqX21vbm8uYyAqX3ZnYTE2LmMgKl9jbHV0MjI0LmMg
Kl9ncmF5MjU2LmMKK2NsZWFuLWZpbGVzIDo9ICpfbW9uby5jICpfdmdhMTYuYyAqX2NsdXQyMjQu
YyAqX2dyYXkyNTYuYwotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
