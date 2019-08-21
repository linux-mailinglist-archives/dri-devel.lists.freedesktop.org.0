Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21E1F97395
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2019 09:33:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0DCE6E92F;
	Wed, 21 Aug 2019 07:33:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from conuserg-07.nifty.com (conuserg-07.nifty.com [210.131.2.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 884CD6E8F7
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2019 04:13:13 +0000 (UTC)
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp
 [153.142.97.92]) (authenticated)
 by conuserg-07.nifty.com with ESMTP id x7L4CeQC002060;
 Wed, 21 Aug 2019 13:12:42 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com x7L4CeQC002060
X-Nifty-SrcIP: [153.142.97.92]
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Subject: [PATCH v2 2/4] video/logo: do not generate unneeded logo C files
Date: Wed, 21 Aug 2019 13:12:35 +0900
Message-Id: <20190821041237.23197-3-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190821041237.23197-1-yamada.masahiro@socionext.com>
References: <20190821041237.23197-1-yamada.masahiro@socionext.com>
X-Mailman-Approved-At: Wed, 21 Aug 2019 07:33:34 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nifty.com; s=dec2015msa; t=1566360762;
 bh=rG1uzD+ZsouFnScMd+YS+lbLIqKukipCyXFlBuBls/8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=otT/vRdpFvNnROJNxtb+yU1E8OIA+ohk3ZhRjZVkvdwKeQK3pyBNLr257cnxw4aV9
 BY5C3ijhHysdD8e1TMUJwFmlzkA3oV2Tl5bHUtGSQusH1VGiKzzjsIRP9+2T5teMNK
 iRvkAMXe6eY38W2otcXUIRKhHcq3Mt/8Et9sKxWb6gIM/FH0qTFIo8bXRs6oom2mAA
 77iz3S6axA0pmj66S+0HDqul4F81OSvxXXymEbMlUJdAlzGzWrRVILuHMmtYpA+eLQ
 MN1GGOfFzrLdEa7pLkv0w7/xYT9H2Xua4SqWnoWrC9wymBHG2hth4SaTF9NtDHLq2y
 8Kh4660PXf+Yw==
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

Q3VycmVudGx5LCBhbGwgdGhlIGxvZ28gQyBmaWxlcyBhcmUgZ2VuZXJhdGVkIGlycmVzcGVjdGl2
ZSBvZiB0aGUKQ09ORklHIG9wdGlvbnMuIEFkZGluZyB0aGVtIHRvIGV4dHJhLXkgaXMgd3Jvbmcu
IFdoYXQgd2UgbmVlZCB0byBkbwpoZXJlIGlzIHRvIGFkZCB0aGVtIHRvICd0YXJnZXRzJyBzbyB0
aGF0IGlmX2NoYW5nZWQgd29ya3MgcHJvcGVybHkuCgpGaWxlcyBsaXN0ZWQgaW4gJ3RhcmdldHMn
IGFyZSBjbGVhbmVkLCBzbyBjbGVhbi1maWxlcyBpcyB1bm5lZWRlZC4KClNpZ25lZC1vZmYtYnk6
IE1hc2FoaXJvIFlhbWFkYSA8eWFtYWRhLm1hc2FoaXJvQHNvY2lvbmV4dC5jb20+Ci0tLQoKQ2hh
bmdlcyBpbiB2MjoKICAtIEZpeCBjb21taXQgbG9nCgogZHJpdmVycy92aWRlby9sb2dvL01ha2Vm
aWxlIHwgMjEgKystLS0tLS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRp
b25zKCspLCAxOSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3ZpZGVvL2xvZ28v
TWFrZWZpbGUgYi9kcml2ZXJzL3ZpZGVvL2xvZ28vTWFrZWZpbGUKaW5kZXggMTBiNzVjZTNjZTA5
Li4xNmY2MGMxZTE3NjYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvdmlkZW8vbG9nby9NYWtlZmlsZQor
KysgYi9kcml2ZXJzL3ZpZGVvL2xvZ28vTWFrZWZpbGUKQEAgLTE4LDIzICsxOCw2IEBAIG9iai0k
KENPTkZJR19TUFVfQkFTRSkJCQkrPSBsb2dvX3NwZV9jbHV0MjI0Lm8KIAogIyBIb3cgdG8gZ2Vu
ZXJhdGUgbG9nbydzCiAKLSMgVXNlIGxvZ28tY2ZpbGVzIHRvIHJldHJpZXZlIGxpc3Qgb2YgLmMg
ZmlsZXMgdG8gYmUgYnVpbHQKLWxvZ28tY2ZpbGVzID0gJChub3RkaXIgJChwYXRzdWJzdCAlLiQo
MiksICUuYywgXAotICAgICAgICAgICAgICAkKHdpbGRjYXJkICQoc3JjdHJlZSkvJChzcmMpLyok
KDEpLiQoMikpKSkKLQotCi0jIE1vbm8gbG9nb3MKLWV4dHJhLXkgKz0gJChjYWxsIGxvZ28tY2Zp
bGVzLF9tb25vLHBibSkKLQotIyBWR0ExNiBsb2dvcwotZXh0cmEteSArPSAkKGNhbGwgbG9nby1j
ZmlsZXMsX3ZnYTE2LHBwbSkKLQotIyAyMjQgTG9nb3MKLWV4dHJhLXkgKz0gJChjYWxsIGxvZ28t
Y2ZpbGVzLF9jbHV0MjI0LHBwbSkKLQotIyBHcmF5IDI1NgotZXh0cmEteSArPSAkKGNhbGwgbG9n
by1jZmlsZXMsX2dyYXkyNTYscGdtKQotCiBwbm10b2xvZ28gOj0gc2NyaXB0cy9wbm10b2xvZ28K
IAogIyBDcmVhdGUgY29tbWFuZHMgbGlrZSAicG5tdG9sb2dvIC10IG1vbm8gLW4gbG9nb19tYWNf
bW9ubyAtbyAuLi4iCkBAIC01NSw1ICszOCw1IEBAICQob2JqKS8lX2NsdXQyMjQuYzogJChzcmMp
LyVfY2x1dDIyNC5wcG0gJChwbm10b2xvZ28pIEZPUkNFCiAkKG9iaikvJV9ncmF5MjU2LmM6ICQo
c3JjKS8lX2dyYXkyNTYucGdtICQocG5tdG9sb2dvKSBGT1JDRQogCSQoY2FsbCBpZl9jaGFuZ2Vk
LGxvZ28pCiAKLSMgRmlsZXMgZ2VuZXJhdGVkIHRoYXQgc2hhbGwgYmUgcmVtb3ZlZCB1cG9uIG1h
a2UgY2xlYW4KLWNsZWFuLWZpbGVzIDo9ICpfbW9uby5jICpfdmdhMTYuYyAqX2NsdXQyMjQuYyAq
X2dyYXkyNTYuYworIyBnZW5lcmF0ZWQgQyBmaWxlcwordGFyZ2V0cyArPSAqX21vbm8uYyAqX3Zn
YTE2LmMgKl9jbHV0MjI0LmMgKl9ncmF5MjU2LmMKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
