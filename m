Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B39E01AD33
	for <lists+dri-devel@lfdr.de>; Sun, 12 May 2019 18:57:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7CF1899B0;
	Sun, 12 May 2019 16:57:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 400 seconds by postgrey-1.36 at gabe;
 Sun, 12 May 2019 16:57:33 UTC
Received: from lechuck.jsg.id.au (jsg.id.au [210.15.216.215])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5630E899B0
 for <dri-devel@lists.freedesktop.org>; Sun, 12 May 2019 16:57:33 +0000 (UTC)
Received: from largo.jsg.id.au (largo.jsg.id.au [192.168.1.43])
 by lechuck.jsg.id.au (OpenSMTPD) with ESMTPS id 565b3543
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <dri-devel@lists.freedesktop.org>;
 Mon, 13 May 2019 02:50:50 +1000 (AEST)
Received: from largo.jsg.id.au (localhost [127.0.0.1])
 by largo.jsg.id.au (OpenSMTPD) with ESMTP id 532b68c4
 for <dri-devel@lists.freedesktop.org>;
 Mon, 13 May 2019 02:50:49 +1000 (AEST)
From: Jonathan Gray <jsg@jsg.id.au>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH libdrm] xf86drm: test for render nodes before primary nodes
Date: Mon, 13 May 2019 02:50:49 +1000
Message-Id: <20190512165049.5780-1-jsg@jsg.id.au>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VW5saWtlIExpbnV4IHRoZSBPcGVuQlNEIHByaW1hcnkgImRybSIgZGV2aWNlIG5hbWUgaXMgc3Vi
c3RyaW5nIG9mIHRoZQoiZHJtUiIgcmVuZGVyIG5vZGUgZGV2aWNlIG5hbWUgYW5kIHN0cm5jbXAo
KSB0ZXN0cyByZXN1bHRlZCBpbiByZW5kZXIKbm9kZXMgYmVpbmcgZmxhZ2dlZCBhcyBwcmltYXJ5
IG5vZGVzLgoKU2lnbmVkLW9mZi1ieTogSm9uYXRoYW4gR3JheSA8anNnQGpzZy5pZC5hdT4KLS0t
CiB4Zjg2ZHJtLmMgfCA4ICsrKystLS0tCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCsp
LCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hmODZkcm0uYyBiL3hmODZkcm0uYwppbmRl
eCAyODU4ZDgyNi4uNDIwMjJjYWMgMTAwNjQ0Ci0tLSBhL3hmODZkcm0uYworKysgYi94Zjg2ZHJt
LmMKQEAgLTMxNjgsMTAgKzMxNjgsNiBAQCBkcm1fcHVibGljIGludCBkcm1EZXZpY2VzRXF1YWwo
ZHJtRGV2aWNlUHRyIGEsIGRybURldmljZVB0ciBiKQogCiBzdGF0aWMgaW50IGRybUdldE5vZGVU
eXBlKGNvbnN0IGNoYXIgKm5hbWUpCiB7Ci0gICAgaWYgKHN0cm5jbXAobmFtZSwgRFJNX1BSSU1B
UllfTUlOT1JfTkFNRSwKLSAgICAgICAgc2l6ZW9mKERSTV9QUklNQVJZX01JTk9SX05BTUUpIC0g
MSkgPT0gMCkKLSAgICAgICAgcmV0dXJuIERSTV9OT0RFX1BSSU1BUlk7Ci0KICAgICBpZiAoc3Ry
bmNtcChuYW1lLCBEUk1fQ09OVFJPTF9NSU5PUl9OQU1FLAogICAgICAgICBzaXplb2YoRFJNX0NP
TlRST0xfTUlOT1JfTkFNRSApIC0gMSkgPT0gMCkKICAgICAgICAgcmV0dXJuIERSTV9OT0RFX0NP
TlRST0w7CkBAIC0zMTgwLDYgKzMxNzYsMTAgQEAgc3RhdGljIGludCBkcm1HZXROb2RlVHlwZShj
b25zdCBjaGFyICpuYW1lKQogICAgICAgICBzaXplb2YoRFJNX1JFTkRFUl9NSU5PUl9OQU1FKSAt
IDEpID09IDApCiAgICAgICAgIHJldHVybiBEUk1fTk9ERV9SRU5ERVI7CiAKKyAgICBpZiAoc3Ry
bmNtcChuYW1lLCBEUk1fUFJJTUFSWV9NSU5PUl9OQU1FLAorICAgICAgICBzaXplb2YoRFJNX1BS
SU1BUllfTUlOT1JfTkFNRSkgLSAxKSA9PSAwKQorICAgICAgICByZXR1cm4gRFJNX05PREVfUFJJ
TUFSWTsKKwogICAgIHJldHVybiAtRUlOVkFMOwogfQogCi0tIAoyLjIxLjAKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
