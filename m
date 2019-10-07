Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35F57CE202
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2019 14:45:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E7F489E38;
	Mon,  7 Oct 2019 12:45:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 889FE89E38
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Oct 2019 12:44:59 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x97CitGu030289;
 Mon, 7 Oct 2019 07:44:55 -0500
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x97Cit91109873
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 7 Oct 2019 07:44:55 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 7 Oct
 2019 07:44:54 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 7 Oct 2019 07:44:52 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x97CirYU093802;
 Mon, 7 Oct 2019 07:44:54 -0500
From: Jean-Jacques Hiblot <jjhiblot@ti.com>
To: <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>, <sre@kernel.org>,
 <robh+dt@kernel.org>, <mark.rutland@arm.com>, <lee.jones@linaro.org>,
 <daniel.thompson@linaro.org>
Subject: [PATCH v9 0/5] Add a generic driver for LED-based backlight
Date: Mon, 7 Oct 2019 14:44:32 +0200
Message-ID: <20191007124437.20367-1-jjhiblot@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1570452295;
 bh=UKYNlQrAnqYHdLObzAAphAQPvbt/6HFXaFAp/AGJipk=;
 h=From:To:CC:Subject:Date;
 b=swLnqi6AwNfzDlhYP5J9keUG1KcsL4skefAR55w8Pz2OMMn08OqjivTAXjr91v/y3
 SckiArG3Sf2ECvZ199k9uSOKNvYthRKzsyVh7cm/bdBoUlxvFSv7SUXVZ1+GMvVDu1
 rjqBP58vKmIjF/EKnavTGlHpU1xuauD6GHYpwLS4=
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 tomi.valkeinen@ti.com, dmurphy@ti.com, Jean-Jacques Hiblot <jjhiblot@ti.com>,
 linux-leds@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBzZXJpZXMgYWltcyB0byBhZGQgYSBsZWQtYmFja2xpZ2h0IGRyaXZlciwgc2ltaWxhciB0
byBwd20tYmFja2xpZ2h0LApidXQgdXNpbmcgYSBMRUQgY2xhc3MgZGV2aWNlIHVuZGVybmVhdGgu
CgpBIGZldyB5ZWFycyBhZ28gKDIwMTUpLCBUb21pIFZhbGtlaW5lbiBwb3N0ZWQgYSBzZXJpZXMg
aW1wbGVtZW50aW5nIGEKYmFja2xpZ2h0IGRyaXZlciBvbiB0b3Agb2YgYSBMRUQgZGV2aWNlOgpo
dHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3BhdGNoLzcyOTM5OTEvCmh0dHBzOi8vcGF0Y2h3
b3JrLmtlcm5lbC5vcmcvcGF0Y2gvNzI5NDAwMS8KaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9y
Zy9wYXRjaC83MjkzOTgxLwoKVGhlIGRpc2N1c3Npb24gc3RvcHBlZCBiZWNhdXNlIFRvbWkgbGFj
a2VkIHRoZSB0aW1lIHRvIHdvcmsgb24gaXQuCgpjaGFuZ2VzIGluIHY5OgotIGxldCB0b19vZl9u
b2RlKCkgY2hlY2sgaWYgdGhlIGZ3bm9kZSBpcyBhY3R1YWxseSBhIG9mX25vZGUKLSBhZGQgc29t
ZSBjaGVja3MgaW4gb2ZfbGVkX2dldCgpCi0gbGV0IGRldl9vZl9ub2RlKCkgZG8gdGhlIGNoZWNr
IGFib3V0IE9GIGF2YWlsYWJpbHR5Ci0gcmVmYWN0b3IgbGVkX2JsX3Byb2JlKCkgdG8gcmVnaXN0
ZXIgYSBjbGVhbnVwIGZ1bmN0aW9uIHdpdGgKICBkZXZtX2FkZF9hY3Rpb25fb3JfcmVzZXQoKS4g
VGhpcyBzaW1wbGlmaWVzIHRoZSBlcnJvciBoYW5kbGluZyAod2hpY2gKICB3YXMgbm90IDEwMCUg
ZG9uZSBpbiB2NykgYW5kIGFsbG93cyB0byBnZXQgcmlkIG9mIGxlZF9ibF9yZW1vdmUoKQoKY2hh
bmdlcyBpbiB2ODoKLSB1c2UgY2xhc3NfZmluZF9kZXZpY2VfYnlfb2Zfbm9kZSgpIGluc3RlYWQg
b2YgY2xhc3NfZmluZF9kZXZpY2UoKQotIHJlbmFtZWQgZGV2bV9sZWRfZ2V0KCkgYXMgZGV2bV9v
Zl9sZWRfZ2V0KCkKCmNoYW5nZXMgaW4gdjc6Ci0gcmViYXNlZCBvbiB0b3Agb2YgbGludXgtbGVk
cy9mb3ItbmV4dAotIHBvcHVsYXRlIHRoZSBvZl9ub2RlIG1lbWJlciBvZiB0aGUgTEVEIGRldmlj
ZSBpZiBmd25vZGUgaXMgYSBvZl9ub2RlCiAgKHRoaXMgaXMgYSBuZXcgcGF0Y2ggYW5kIHRoZSBm
aXJzdCBvZiB0aGUgc2VyaWVzKS4KLSBkZXZtX2xlZF9nZXQoKSB3b3JrcyBvbmx5IHdoZW4gdGhl
IGRldmljZSB0cmVlIGlzIHVzZWQuIEFkZCBhIGZldyBjaGVja3MKICBmb3IgdGhhdC4gIAoKY2hh
bmdlcyBpbiB2NjoKLSB0cmltIHRoZSBsaXN0IG9mIGluY2x1ZGVkIGhlYWRlcnMKLSByZW1vdmUg
dXNlbGVzcyBkZWZpbml0aW9uIG9mIEJLTF9GVUxMX0JSSUdIVE5FU1MKCmNoYW5nZXMgaW4gdjU6
Ci0gcmVtb3ZlZCBMRUQgYnJpZ2h0bmVzcyBzY2FsaW5nCi0gZGlzYWJsZSBzeXNmcyB0aGUgaW50
ZXJmYWNlIG9mIHRoZSBMRURzIHdoZW4gdXNlZCBieSB0aGUgYmFja2xpZ2h0IGRldmljZQoKY2hh
bmdlcyBpbiB2NDoKLSBmaXggZGV2X2VycigpIG1lc3NhZ2VzIGFuZCBjb21taXQgbG9ncyBmb2xs
b3dpbmcgdGhlIGFkdmljZXMgb2YgUGF2ZWwKLSBjb3NtZXRpYyBjaGFuZ2VzIChpbmRlbnRzLCBn
ZXR0aW5nIHJpZCBvZiAgIj8gMSA6IDAiIGluCiAgbGVkX21hdGNoX2xlZF9ub2RlKCkpCgpjaGFu
Z2VzIGluIHYzOgotIGR0IGJpbmRpbmc6IGRvbid0IGxpbWl0IHRoZSBicmlnaHRuZXNzIHJhbmdl
IHRvIDAtMjU1LiBVc2UgdGhlIHJhbmdlIG9mCiAgdGhlIHVuZGVybHlpbmcgTEVEcy4gYXMgYSBz
aWRlLWVmZmVjdCwgYWxsIExFRHMgbXVzdCBub3cgaGF2ZSB0aGUgc2FtZQogIHJhbmdlCi0gZHJp
dmVyOiBBZGFwdCB0byBkdCBiaW5kaW5nIHVwZGF0ZS4KLSBkcml2ZXI6IHJld29yayBwcm9iZSgp
IGZvciBjbGFyaXR5IGFuZCByZW1vdmUgdGhlIHJlbWFpbmluZyBnb3RvLgoKY2hhbmdlcyBpbiB2
MjoKLSBoYW5kbGUgbW9yZSB0aGFuIG9uZSBMRUQuCi0gZG9uJ3QgbWFrZSB0aGUgYmFja2xpZ2h0
IGRldmljZSBhIGNoaWxkIG9mIHRoZSBMRUQgY29udHJvbGxlci4KLSBtYWtlIGJyaWdodG5lc3Mt
bGV2ZWxzIGFuZCBkZWZhdWx0LWJyaWdodG5lc3MtbGV2ZWwgb3B0aW9uYWwKLSByZW1vdmVkIHRo
ZSBvcHRpb24gdG8gdXNlIGEgR1BJTyBlbmFibGUuCi0gcmVtb3ZlZCB0aGUgb3B0aW9uIHRvIHVz
ZSBhIHJlZ3VsYXRvci4gSXQgc2hvdWxkIGJlIGhhbmRsZWQgYnkgdGhlIExFRAogIGNvcmUKLSBk
b24ndCBtYWtlIGFueSBjaGFuZ2UgdG8gdGhlIExFRCBjb3JlIChub3QgbmVlZGVkIGFueW1vcmUp
CgpKZWFuLUphY3F1ZXMgSGlibG90ICgzKToKICBsZWRzOiBwb3B1bGF0ZSB0aGUgZGV2aWNlJ3Mg
b2Zfbm9kZQogIGxlZHM6IEFkZCBtYW5hZ2VkIEFQSSB0byBnZXQgYSBMRUQgZnJvbSBhIGRldmlj
ZSBkcml2ZXIKICBkdC1iaW5kaW5nczogYmFja2xpZ2h0OiBBZGQgbGVkLWJhY2tsaWdodCBiaW5k
aW5nCgpUb21pIFZhbGtlaW5lbiAoMik6CiAgbGVkczogQWRkIG9mX2xlZF9nZXQoKSBhbmQgbGVk
X3B1dCgpCiAgYmFja2xpZ2h0OiBhZGQgbGVkLWJhY2tsaWdodCBkcml2ZXIKCiAuLi4vYmluZGlu
Z3MvbGVkcy9iYWNrbGlnaHQvbGVkLWJhY2tsaWdodC50eHQgfCAgMjggKysKIGRyaXZlcnMvbGVk
cy9sZWQtY2xhc3MuYyAgICAgICAgICAgICAgICAgICAgICB8IDEwMyArKysrKystCiBkcml2ZXJz
L3ZpZGVvL2JhY2tsaWdodC9LY29uZmlnICAgICAgICAgICAgICAgfCAgIDcgKwogZHJpdmVycy92
aWRlby9iYWNrbGlnaHQvTWFrZWZpbGUgICAgICAgICAgICAgIHwgICAxICsKIGRyaXZlcnMvdmlk
ZW8vYmFja2xpZ2h0L2xlZF9ibC5jICAgICAgICAgICAgICB8IDI1OCArKysrKysrKysrKysrKysr
KysKIGluY2x1ZGUvbGludXgvbGVkcy5oICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgNiAr
CiA2IGZpbGVzIGNoYW5nZWQsIDQwMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCiBjcmVh
dGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2xlZHMvYmFj
a2xpZ2h0L2xlZC1iYWNrbGlnaHQudHh0CiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy92aWRl
by9iYWNrbGlnaHQvbGVkX2JsLmMKCi0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
