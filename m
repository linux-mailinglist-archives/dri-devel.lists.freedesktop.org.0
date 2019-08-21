Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 013A29738A
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2019 09:33:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC2366E921;
	Wed, 21 Aug 2019 07:33:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from conuserg-07.nifty.com (conuserg-07.nifty.com [210.131.2.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCAEA6E462
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2019 03:55:46 +0000 (UTC)
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp
 [153.142.97.92]) (authenticated)
 by conuserg-07.nifty.com with ESMTP id x7L3tQp3016439;
 Wed, 21 Aug 2019 12:55:28 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com x7L3tQp3016439
X-Nifty-SrcIP: [153.142.97.92]
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Subject: [PATCH 2/4] video/logo: fix unneeded generation of font C files
Date: Wed, 21 Aug 2019 12:55:14 +0900
Message-Id: <20190821035517.21671-3-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190821035517.21671-1-yamada.masahiro@socionext.com>
References: <20190821035517.21671-1-yamada.masahiro@socionext.com>
X-Mailman-Approved-At: Wed, 21 Aug 2019 07:33:34 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nifty.com; s=dec2015msa; t=1566359728;
 bh=xvzRaJpfAiuO+5/j+Hz3YB5Qx9ImeceBGGq+CyKuQ7k=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Wa3+nU5BGO15eyxz0lR5bIn9rwZ+2mjRIYim+iLMokOLIkpJs39HjD4Myi/Ao98hq
 x6P5m2dqGM4Xs0ynb4eSTpu4eZsabnZi25M6MOLBeSNSHbW+ltJYl0ZKKi1WC/nswO
 FWDm5tNeP5UZkEWbjqdkmoQ2LNBTw9iLkQPVKpL0YVte6K6Sri3igN7yzfqCEn6LHB
 oQlnxf/gVIikOijXjjvndkr7dj1LJg3ci3pfshNAIIVPjKftzdxGc7wuB9etDJENDI
 IbufhIOK0fj85Nb9hHEaxwiA9YWkA1ks0y+m+H6wZP9RTuPnkXwfrFhBqWvxKmO9pr
 JKUI+JjrERlkA==
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

Q3VycmVudGx5LCBhbGwgdGhlIGZvbnQgQyBmaWxlcyBhcmUgZ2VuZXJhdGVkIGlycmVzcGVjdGl2
ZSBvZiBDT05GSUcKb3B0aW9ucy4gQWRkaW5nIHRoZW0gdG8gZXh0cmEteSBpcyB3cm9uZy4gV2hh
dCB3ZSBuZWVkIHRvIGRvIGhlcmUgaXMKdG8gYWRkIHRoZW0gdG8gJ3RhcmdldHMnIHNvIHRoYXQg
aWZfY2hhbmdlZCB3b3JrcyBwcm9wZXJseS4KCkFsbCBmaWxlcyBsaXN0ZWQgaW4gJ3RhcmdldHMn
IGFyZSBjbGVhbmVkLCBzbyBjbGVhbi1maWxlcyBpcyB1bm5lZWRlZC4KClNpZ25lZC1vZmYtYnk6
IE1hc2FoaXJvIFlhbWFkYSA8eWFtYWRhLm1hc2FoaXJvQHNvY2lvbmV4dC5jb20+Ci0tLQoKIGRy
aXZlcnMvdmlkZW8vbG9nby9NYWtlZmlsZSB8IDIxICsrLS0tLS0tLS0tLS0tLS0tLS0tLQogMSBm
aWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMTkgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0
IGEvZHJpdmVycy92aWRlby9sb2dvL01ha2VmaWxlIGIvZHJpdmVycy92aWRlby9sb2dvL01ha2Vm
aWxlCmluZGV4IDEwYjc1Y2UzY2UwOS4uMTZmNjBjMWUxNzY2IDEwMDY0NAotLS0gYS9kcml2ZXJz
L3ZpZGVvL2xvZ28vTWFrZWZpbGUKKysrIGIvZHJpdmVycy92aWRlby9sb2dvL01ha2VmaWxlCkBA
IC0xOCwyMyArMTgsNiBAQCBvYmotJChDT05GSUdfU1BVX0JBU0UpCQkJKz0gbG9nb19zcGVfY2x1
dDIyNC5vCiAKICMgSG93IHRvIGdlbmVyYXRlIGxvZ28ncwogCi0jIFVzZSBsb2dvLWNmaWxlcyB0
byByZXRyaWV2ZSBsaXN0IG9mIC5jIGZpbGVzIHRvIGJlIGJ1aWx0Ci1sb2dvLWNmaWxlcyA9ICQo
bm90ZGlyICQocGF0c3Vic3QgJS4kKDIpLCAlLmMsIFwKLSAgICAgICAgICAgICAgJCh3aWxkY2Fy
ZCAkKHNyY3RyZWUpLyQoc3JjKS8qJCgxKS4kKDIpKSkpCi0KLQotIyBNb25vIGxvZ29zCi1leHRy
YS15ICs9ICQoY2FsbCBsb2dvLWNmaWxlcyxfbW9ubyxwYm0pCi0KLSMgVkdBMTYgbG9nb3MKLWV4
dHJhLXkgKz0gJChjYWxsIGxvZ28tY2ZpbGVzLF92Z2ExNixwcG0pCi0KLSMgMjI0IExvZ29zCi1l
eHRyYS15ICs9ICQoY2FsbCBsb2dvLWNmaWxlcyxfY2x1dDIyNCxwcG0pCi0KLSMgR3JheSAyNTYK
LWV4dHJhLXkgKz0gJChjYWxsIGxvZ28tY2ZpbGVzLF9ncmF5MjU2LHBnbSkKLQogcG5tdG9sb2dv
IDo9IHNjcmlwdHMvcG5tdG9sb2dvCiAKICMgQ3JlYXRlIGNvbW1hbmRzIGxpa2UgInBubXRvbG9n
byAtdCBtb25vIC1uIGxvZ29fbWFjX21vbm8gLW8gLi4uIgpAQCAtNTUsNSArMzgsNSBAQCAkKG9i
aikvJV9jbHV0MjI0LmM6ICQoc3JjKS8lX2NsdXQyMjQucHBtICQocG5tdG9sb2dvKSBGT1JDRQog
JChvYmopLyVfZ3JheTI1Ni5jOiAkKHNyYykvJV9ncmF5MjU2LnBnbSAkKHBubXRvbG9nbykgRk9S
Q0UKIAkkKGNhbGwgaWZfY2hhbmdlZCxsb2dvKQogCi0jIEZpbGVzIGdlbmVyYXRlZCB0aGF0IHNo
YWxsIGJlIHJlbW92ZWQgdXBvbiBtYWtlIGNsZWFuCi1jbGVhbi1maWxlcyA6PSAqX21vbm8uYyAq
X3ZnYTE2LmMgKl9jbHV0MjI0LmMgKl9ncmF5MjU2LmMKKyMgZ2VuZXJhdGVkIEMgZmlsZXMKK3Rh
cmdldHMgKz0gKl9tb25vLmMgKl92Z2ExNi5jICpfY2x1dDIyNC5jICpfZ3JheTI1Ni5jCi0tIAoy
LjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
