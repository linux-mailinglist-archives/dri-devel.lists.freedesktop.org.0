Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 64AF76F3EF
	for <lists+dri-devel@lfdr.de>; Sun, 21 Jul 2019 17:24:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A90CA89935;
	Sun, 21 Jul 2019 15:24:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B3C789935
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Jul 2019 15:24:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id C6FC230842B5;
 Sun, 21 Jul 2019 15:24:22 +0000 (UTC)
Received: from shalem.localdomain.com (ovpn-116-49.ams2.redhat.com
 [10.36.116.49])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0079360C64;
 Sun, 21 Jul 2019 15:24:19 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, "H . Peter Anvin" <hpa@zytor.com>
Subject: [PATCH] x86/sysfb_efi: Add quirks for some devices with swapped width
 and height
Date: Sun, 21 Jul 2019 17:24:18 +0200
Message-Id: <20190721152418.11644-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.40]); Sun, 21 Jul 2019 15:24:23 +0000 (UTC)
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
Cc: linux-fbdev@vger.kernel.org, linux-efi@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, x86@kernel.org,
 dri-devel@lists.freedesktop.org, Hans de Goede <hdegoede@redhat.com>,
 Peter Jones <pjones@redhat.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U29tZSBMZW5vdm8gMi1pbi0xcyB3aXRoIGEgZGV0YWNoYWJsZSBrZXlib2FyZCBoYXZlIGEgcG9y
dHJhaXQgc2NyZWVuCmJ1dCBhZHZlcnRpc2UgYSBsYW5kc2NhcGUgcmVzb2x1dGlvbiBhbmQgcGl0
Y2gsIHJlc3VsdGluZyBpbiBhIG1lc3NlZAp1cCBkaXNwbGF5IGlmIHdlIHRyeSB0byBzaG93IGFu
eXRoaW5nIG9uIHRoZSBlZmlmYiAoYmVjYXVzZSBvZiB0aGUgd3JvbmcKcGl0Y2gpLgoKVGhpcyBj
b21taXQgZml4ZXMgdGhpcyBieSBhZGRpbmcgYSBuZXcgRE1JIG1hdGNoIHRhYmxlIGZvciBkZXZp
Y2VzIHdoaWNoCm5lZWQgdG8gaGF2ZSB0aGVpciB3aWR0aCBhbmQgaGVpZ2h0IHN3YXBwZWQuCgpB
dCBmaXJzdCBJIHRyaWVkIHRvIHVzZSB0aGUgZXhpc3RpbmcgdGFibGUgZm9yIG92ZXJyaWRpbmcg
c29tZSBvZiB0aGUKZWZpZmIgcGFyYW1ldGVycywgYnV0IHNvbWUgb2YgdGhlIGFmZmVjdGVkIGRl
dmljZXMgaGF2ZSB2YXJpYW50cyB3aXRoCmRpZmZlcmVudCBMQ0QgcmVzb2x1dGlvbnMgd2hpY2gg
d2lsbCBub3Qgd29yayB3aXRoIGhhcmRjb2RlZCBvdmVycmlkZQp2YWx1ZXMuCgpCdWdMaW5rOiBo
dHRwczovL2J1Z3ppbGxhLnJlZGhhdC5jb20vc2hvd19idWcuY2dpP2lkPTE3MzA3ODMKQ2M6IHN0
YWJsZUB2Z2VyLmtlcm5lbC5vcmcKU2lnbmVkLW9mZi1ieTogSGFucyBkZSBHb2VkZSA8aGRlZ29l
ZGVAcmVkaGF0LmNvbT4KLS0tCiBhcmNoL3g4Ni9rZXJuZWwvc3lzZmJfZWZpLmMgfCA0NSArKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgNDUgaW5z
ZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2FyY2gveDg2L2tlcm5lbC9zeXNmYl9lZmkuYyBiL2Fy
Y2gveDg2L2tlcm5lbC9zeXNmYl9lZmkuYwppbmRleCA4ZWI2N2E2NzBiMTAuLjgwZDViNjcyMGE4
NyAxMDA2NDQKLS0tIGEvYXJjaC94ODYva2VybmVsL3N5c2ZiX2VmaS5jCisrKyBiL2FyY2gveDg2
L2tlcm5lbC9zeXNmYl9lZmkuYwpAQCAtMjMwLDkgKzIzMCw1NCBAQCBzdGF0aWMgY29uc3Qgc3Ry
dWN0IGRtaV9zeXN0ZW1faWQgZWZpZmJfZG1pX3N5c3RlbV90YWJsZVtdIF9faW5pdGNvbnN0ID0g
ewogCXt9LAogfTsKIAorLyoKKyAqIFNvbWUgZGV2aWNlcyBoYXZlIGEgcG9ydHJhaXQgTENEIGJ1
dCBhZHZlcnRpc2UgYSBsYW5kc2NhcGUgcmVzb2x1dGlvbiAoYW5kCisgKiBwaXRjaCkuIFdlIHNp
bXBseSBzd2FwIHdpZHRoIGFuZCBoZWlnaHQgZm9yIHRoZXNlIGRldmljZXMgc28gdGhhdCB3ZSBj
YW4KKyAqIGNvcnJlY3RseSBkZWFsIHdpdGggc29tZSBvZiB0aGVtIGNvbWluZyB3aXRoIG11bHRp
cGxlIHJlc29sdXRpb25zLgorICovCitzdGF0aWMgY29uc3Qgc3RydWN0IGRtaV9zeXN0ZW1faWQg
ZWZpZmJfZG1pX3N3YXBfd2lkdGhfaGVpZ2h0W10gX19pbml0Y29uc3QgPSB7CisJeworCQkvKgor
CQkgKiBMZW5vdm8gTUlJWDMxMC0xMElDUiwgb25seSBzb21lIGJhdGNoZXMgaGF2ZSB0aGUgdHJv
dWJsZXNvbWUKKwkJICogODAweDEyODAgcG9ydHJhaXQgc2NyZWVuLiBMdWNraWx5IHRoZSBwb3J0
cmFpdCB2ZXJzaW9uIGhhcworCQkgKiBpdHMgb3duIEJJT1MgdmVyc2lvbiwgc28gd2UgbWF0Y2gg
b24gdGhhdC4KKwkJICovCisJCS5tYXRjaGVzID0geworCQkJRE1JX0VYQUNUX01BVENIKERNSV9T
WVNfVkVORE9SLCAiTEVOT1ZPIiksCisJCQlETUlfRVhBQ1RfTUFUQ0goRE1JX1BST0RVQ1RfVkVS
U0lPTiwgIk1JSVggMzEwLTEwSUNSIiksCisJCQlETUlfRVhBQ1RfTUFUQ0goRE1JX0JJT1NfVkVS
U0lPTiwgIjFIQ040NFdXIiksCisJCX0sCisJfSwKKwl7CisJCS8qIExlbm92byBNSUlYIDMyMC0x
MElDUiB3aXRoIDgwMHgxMjgwIHBvcnRyYWl0IHNjcmVlbiAqLworCQkubWF0Y2hlcyA9IHsKKwkJ
CURNSV9FWEFDVF9NQVRDSChETUlfU1lTX1ZFTkRPUiwgIkxFTk9WTyIpLAorCQkJRE1JX0VYQUNU
X01BVENIKERNSV9QUk9EVUNUX1ZFUlNJT04sCisJCQkJCSJMZW5vdm8gTUlJWCAzMjAtMTBJQ1Ii
KSwKKwkJfSwKKwl9LAorCXsKKwkJLyogTGVub3ZvIEQzMzAgd2l0aCA4MDB4MTI4MCBvciAxMjAw
eDE5MjAgcG9ydHJhaXQgc2NyZWVuICovCisJCS5tYXRjaGVzID0geworCQkJRE1JX0VYQUNUX01B
VENIKERNSV9TWVNfVkVORE9SLCAiTEVOT1ZPIiksCisJCQlETUlfRVhBQ1RfTUFUQ0goRE1JX1BS
T0RVQ1RfVkVSU0lPTiwKKwkJCQkJIkxlbm92byBpZGVhcGFkIEQzMzAtMTBJR00iKSwKKwkJfSwK
Kwl9LAorCXt9LAorfTsKKwogX19pbml0IHZvaWQgc3lzZmJfYXBwbHlfZWZpX3F1aXJrcyh2b2lk
KQogewogCWlmIChzY3JlZW5faW5mby5vcmlnX3ZpZGVvX2lzVkdBICE9IFZJREVPX1RZUEVfRUZJ
IHx8CiAJICAgICEoc2NyZWVuX2luZm8uY2FwYWJpbGl0aWVzICYgVklERU9fQ0FQQUJJTElUWV9T
S0lQX1FVSVJLUykpCiAJCWRtaV9jaGVja19zeXN0ZW0oZWZpZmJfZG1pX3N5c3RlbV90YWJsZSk7
CisKKwlpZiAoc2NyZWVuX2luZm8ub3JpZ192aWRlb19pc1ZHQSA9PSBWSURFT19UWVBFX0VGSSAm
JgorCSAgICBkbWlfY2hlY2tfc3lzdGVtKGVmaWZiX2RtaV9zd2FwX3dpZHRoX2hlaWdodCkpIHsK
KwkJdTE2IHRlbXAgPSBzY3JlZW5faW5mby5sZmJfd2lkdGg7CisJCXNjcmVlbl9pbmZvLmxmYl93
aWR0aCA9IHNjcmVlbl9pbmZvLmxmYl9oZWlnaHQ7CisJCXNjcmVlbl9pbmZvLmxmYl9oZWlnaHQg
PSB0ZW1wOworCQlzY3JlZW5faW5mby5sZmJfbGluZWxlbmd0aCA9IDQgKiBzY3JlZW5faW5mby5s
ZmJfd2lkdGg7CisJfQogfQotLSAKMi4yMS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
