Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E76A9FCF7
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2019 10:28:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A7ED8999C;
	Wed, 28 Aug 2019 08:28:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from shell.v3.sk (shell.v3.sk [90.176.6.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 516E889864
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2019 08:06:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by zimbra.v3.sk (Postfix) with ESMTP id 771B8D8339;
 Wed, 28 Aug 2019 10:00:07 +0200 (CEST)
Received: from shell.v3.sk ([127.0.0.1])
 by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id rI3QCcU_MYZa; Wed, 28 Aug 2019 09:59:54 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zimbra.v3.sk (Postfix) with ESMTP id 90E85D832A;
 Wed, 28 Aug 2019 09:59:47 +0200 (CEST)
X-Virus-Scanned: amavisd-new at zimbra.v3.sk
Received: from shell.v3.sk ([127.0.0.1])
 by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id R9xUsqNyz4m0; Wed, 28 Aug 2019 09:59:45 +0200 (CEST)
Received: from belphegor.brq.redhat.com (nat-pool-brq-t.redhat.com
 [213.175.37.10])
 by zimbra.v3.sk (Postfix) with ESMTPSA id 31212D8330;
 Wed, 28 Aug 2019 09:59:42 +0200 (CEST)
From: Lubomir Rintel <lkundrak@v3.sk>
To: Russell King <linux@armlinux.org.uk>
Subject: [PATCH v4 5/5] dt-bindings: display: armada: Document bus-width
 property
Date: Wed, 28 Aug 2019 09:59:38 +0200
Message-Id: <20190828075938.318028-6-lkundrak@v3.sk>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190828075938.318028-1-lkundrak@v3.sk>
References: <20190828075938.318028-1-lkundrak@v3.sk>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 28 Aug 2019 08:28:09 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Lubomir Rintel <lkundrak@v3.sk>, Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBtYWtlcyBpdCBwb3NzaWJsZSB0byBjaG9vc2UgYSBkaWZmZXJlbnQgcGl4ZWwgZm9ybWF0
IGZvciB0aGUKZW5kcG9pbnQuIE1vZGVsbGVkIGFmdGVyIHdoYXQgb3RoZXIgTENEIGNvbnRyb2xs
ZXJzIHVzZSwgaW5jbHVkaW5nCm1hcnZlbGwscHhhMnh4LWxjZGMgYW5kIGF0bWVsLGhsY2RjLWRp
c3BsYXktY29udHJvbGxlciBhbmQgcGVyaGFwcyBtb3JlLgoKU2lnbmVkLW9mZi1ieTogTHVib21p
ciBSaW50ZWwgPGxrdW5kcmFrQHYzLnNrPgpSZXZpZXdlZC1ieTogUm9iIEhlcnJpbmcgPHJvYmhA
a2VybmVsLm9yZz4KCi0tLQpDaGFuZ2VzIHNpbmNlIHYyOgotIENvbGxlY3RlZCB0aGUgUmV2aWV3
ZWQtYnkgdGFnCgogLi4uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tYXJ2ZWxsLGFybWFk
YS1sY2RjLnR4dCAgICAgfCA2ICsrKysrKwogMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygr
KQoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5
L21hcnZlbGwsYXJtYWRhLWxjZGMudHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL2Rpc3BsYXkvbWFydmVsbCxhcm1hZGEtbGNkYy50eHQKaW5kZXggMGVhNGNiZTVhMzJlZS4u
ZDFkYWRhYWVlZTczNCAxMDA2NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL2Rpc3BsYXkvbWFydmVsbCxhcm1hZGEtbGNkYy50eHQKKysrIGIvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbWFydmVsbCxhcm1hZGEtbGNkYy50eHQKQEAgLTI1
LDYgKzI1LDExIEBAIFJlcXVpcmVkIGNoaWxkIG5vZGVzOgogCiAtIHBvcnQ6IHZpZGVvIG91dHB1
dCBwb3J0IHdpdGggZW5kcG9pbnRzLCBhcyBkZXNjcmliZWQgYnkKICAgRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL2dyYXBoLnR4dAorICBUaGUgZW5kcG9pbnRzIGNhbiBvcHRpb25h
bGx5IHNwZWNpZnkgdGhlIGZvbGxvd2luZyBwcm9wZXJ0eToKKworICAtIGJ1cy13aWR0aDogcmVj
b2duaXplZCB2YWx1ZXMgYXJlIDwxMj4sIDwxNj4sIDwxOD4gYW5kIDwyND4sIHRoYXQKKyAgICBz
ZWxlY3QgInJnYjQ0NCIsICJyZ2I1NjUiLCAicmdiNjY2IiBvciAicmdiODg4IiBwaXhlbCBmb3Jt
YXQKKyAgICByZXNwZWN0aXZlbHkuIERlZmF1bHRzIHRvIDwyND4gaWYgdW5zcGVjaWZpZWQuCiAK
IEV4YW1wbGU6CiAKQEAgLTM3LDYgKzQyLDcgQEAgRXhhbXBsZToKIAogCQlsY2QwX3BvcnQ6IHBv
cnQgewogCQkJbGNkMF9yZ2Jfb3V0OiBlbmRwb2ludCB7CisJCQkJYnVzLXdpZHRoID0gPDI0PjsK
IAkJCQlyZW1vdGUtZW5kcG9pbnQgPSA8JmVuY29kZXJfcmdiX2luPjsKIAkJCX07CiAJCX07Ci0t
IAoyLjIxLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
