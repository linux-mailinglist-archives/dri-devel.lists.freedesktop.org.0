Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5670A2DA8F7
	for <lists+dri-devel@lfdr.de>; Tue, 15 Dec 2020 09:07:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9D8A6E174;
	Tue, 15 Dec 2020 08:06:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD9A56E054
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Dec 2020 23:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=vMhvU7UzeNy1QTs5M35EIFjoiT74uF3HtGRCg1kwYRk=; b=ORVpSO/nEfmsI4jHjB10cRl2WC
 LRrMJieOdajYK6itsRxYbd2yUOrQcP783vyEa1gkCQy1oQiFFiyZCSb8xApIjrznibmWVGwIY0nQu
 vQybrWEzdUUZypWTO2dRfG7PqKswcVlbrV6gOCTUf5ERze/aPdoqOJC0u+Nd6Ll65WfUSfE6k6Llz
 RX+LkmqxFnTyB4KsEvLkGq6SofOPQU5/uE2QD13VfKXkQJPNtWG9rNSWrCO+nXzlg7/0dCB5N7Ekq
 cfZ5zrb+csAaGa5UKey+BIG74VaEMe4vM6ioEyjcD+xSl9ApEBhMusLAHOnzK1oXeBT3CNWav9qWf
 S34H1oOg==;
Received: from [2601:1c0:6280:3f0::1494] (helo=smtpauth.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1koxLG-0007d4-FX; Mon, 14 Dec 2020 23:33:23 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 -next] drm/rockchip: cdn-dp-core: fix function not used
 when PM_SLEEP is not set
Date: Mon, 14 Dec 2020 15:33:16 -0800
Message-Id: <20201214233316.19725-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 15 Dec 2020 08:06:55 +0000
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: David Airlie <airlied@linux.ie>, Randy Dunlap <rdunlap@infradead.org>,
 Sandy Huang <hjc@rock-chips.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4IGJ1aWxkIHdhcm5pbmcgd2hlbiBDT05GSUdfUE1fU0xFRVAgaXMgbm90IGVuYWJsZWQuCgou
Li9kcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvY2RuLWRwLWNvcmUuYzoxMTI0OjEyOiB3YXJuaW5n
OiDigJhjZG5fZHBfcmVzdW1l4oCZIGRlZmluZWQgYnV0IG5vdCB1c2VkIFstV3VudXNlZC1mdW5j
dGlvbl0KIHN0YXRpYyBpbnQgY2RuX2RwX3Jlc3VtZShzdHJ1Y3QgZGV2aWNlICpkZXYpCgpGaXhl
czogN2M0OWFiYjRjMmY4ICgiZHJtL3JvY2tjaGlwOiBjZG4tZHAtY29yZTogTWFrZSBjZG5fZHBf
Y29yZV9zdXNwZW5kL3Jlc3VtZSBzdGF0aWMiKQpTaWduZWQtb2ZmLWJ5OiBSYW5keSBEdW5sYXAg
PHJkdW5sYXBAaW5mcmFkZWFkLm9yZz4KQ2M6IFNhbmR5IEh1YW5nIDxoamNAcm9jay1jaGlwcy5j
b20+CkNjOiBIZWlrbyBTdMO8Ym5lciA8aGVpa29Ac250ZWNoLmRlPgpDYzogZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgpD
YzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgotLS0KdjI6IHVzZSBwcmVmZXJyZWQg
X19tYXliZV91bnVzZWQgaW5zdGVhZCBvZiBpZmRlZmZlcnk6CiAgICAgIGh0dHBzOi8vbG9yZS5r
ZXJuZWwub3JnL3BhdGNod29yay9wYXRjaC83MzI5ODEvCgogZHJpdmVycy9ncHUvZHJtL3JvY2tj
aGlwL2Nkbi1kcC1jb3JlLmMgfCAgICAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KyksIDEgZGVsZXRpb24oLSkKCi0tLSBsaW51eC1uZXh0LTIwMjAxMjE0Lm9yaWcvZHJpdmVycy9n
cHUvZHJtL3JvY2tjaGlwL2Nkbi1kcC1jb3JlLmMKKysrIGxpbnV4LW5leHQtMjAyMDEyMTQvZHJp
dmVycy9ncHUvZHJtL3JvY2tjaGlwL2Nkbi1kcC1jb3JlLmMKQEAgLTExMjEsNyArMTEyMSw3IEBA
IHN0YXRpYyBpbnQgY2RuX2RwX3N1c3BlbmQoc3RydWN0IGRldmljZQogCXJldHVybiByZXQ7CiB9
CiAKLXN0YXRpYyBpbnQgY2RuX2RwX3Jlc3VtZShzdHJ1Y3QgZGV2aWNlICpkZXYpCitzdGF0aWMg
X19tYXliZV91bnVzZWQgaW50IGNkbl9kcF9yZXN1bWUoc3RydWN0IGRldmljZSAqZGV2KQogewog
CXN0cnVjdCBjZG5fZHBfZGV2aWNlICpkcCA9IGRldl9nZXRfZHJ2ZGF0YShkZXYpOwogCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
