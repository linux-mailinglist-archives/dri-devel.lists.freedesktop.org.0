Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E321A6EF65
	for <lists+dri-devel@lfdr.de>; Sat, 20 Jul 2019 14:52:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E5966E89F;
	Sat, 20 Jul 2019 12:51:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E01F6E7F1
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jul 2019 10:08:06 +0000 (UTC)
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 00CA01A0144;
 Fri, 19 Jul 2019 12:08:05 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 41D0A1A0187;
 Fri, 19 Jul 2019 12:07:59 +0200 (CEST)
Received: from titan.ap.freescale.net (TITAN.ap.freescale.net [10.192.208.233])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id F38B0402D5;
 Fri, 19 Jul 2019 18:07:51 +0800 (SGT)
From: Wen He <wen.he_1@nxp.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, mark.rutland@arm.com, liviu.dudau@arm.com,
 brian.starkey@arm.com, airlied@linux.ie, daniel@ffwll.ch,
 robh+dt@kernel.org
Subject: [v2 2/3] dt/bindings: display: Add optional property node defined for
 Mali DP500
Date: Fri, 19 Jul 2019 17:58:42 +0800
Message-Id: <20190719095842.11683-1-wen.he_1@nxp.com>
X-Mailer: git-send-email 2.9.5
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Approved-At: Sat, 20 Jul 2019 12:51:43 +0000
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
Cc: Wen He <wen.he_1@nxp.com>, leoyang.li@nxp.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIG9wdGlvbmFsIHByb3BlcnR5IG5vZGUgJ2FybSxtYWxpZHAtYXJxb3MtdmFsdWUnIGZvciB0
aGUgTWFsaSBEUDUwMC4KVGhpcyBwcm9wZXJ0eSBkZXNjcmliZSB0aGUgQVJRb1MgbGV2ZWxzIG9m
IERQNTAwJ3MgUW9TIHNpZ25hbGluZy4KClNpZ25lZC1vZmYtYnk6IFdlbiBIZSA8d2VuLmhlXzFA
bnhwLmNvbT4KLS0tCiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9h
cm0sbWFsaWRwLnR4dCB8IDMgKysrCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCgpk
aWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYXJt
LG1hbGlkcC50eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9h
cm0sbWFsaWRwLnR4dAppbmRleCAyZjc4NzA5ODNlZjEuLjc2YTBlNzI1MTI1MSAxMDA2NDQKLS0t
IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYXJtLG1hbGlkcC50
eHQKKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYXJtLG1h
bGlkcC50eHQKQEAgLTM3LDYgKzM3LDggQEAgT3B0aW9uYWwgcHJvcGVydGllczoKICAgICBEb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmVzZXJ2ZWQtbWVtb3J5L3Jlc2VydmVkLW1l
bW9yeS50eHQpCiAgICAgdG8gYmUgdXNlZCBmb3IgdGhlIGZyYW1lYnVmZmVyOyBpZiBub3QgcHJl
c2VudCwgdGhlIGZyYW1lYnVmZmVyIG1heQogICAgIGJlIGxvY2F0ZWQgYW55d2hlcmUgaW4gbWVt
b3J5LgorICAtIGFybSxtYWxpZHAtYXJxb3MtaGlnaC1sZXZlbDogaW50ZWdlciBvZiB1MzIgdmFs
dWUgZGVzY3JpYmluZyB0aGUgQVJRb1MKKyAgICBsZXZlbHMgb2YgRFA1MDAncyBRb1Mgc2lnbmFs
aW5nLgogCiAKIEV4YW1wbGU6CkBAIC01NCw2ICs1Niw3IEBAIEV4YW1wbGU6CiAJCWNsb2NrcyA9
IDwmb3NjY2xrMj4sIDwmZnBnYW9zYzA+LCA8JmZwZ2Fvc2MxPiwgPCZmcGdhb3NjMT47CiAJCWNs
b2NrLW5hbWVzID0gInB4bGNsayIsICJtY2xrIiwgImFjbGsiLCAicGNsayI7CiAJCWFybSxtYWxp
ZHAtb3V0cHV0LXBvcnQtbGluZXMgPSAvYml0cy8gOCA8OCA4IDg+OworCQlhcm0sbWFsaWRwLWFy
cW9zLWhpZ2gtbGV2ZWwgPSA8JnJxb3N2YWx1ZT47CiAJCXBvcnQgewogCQkJZHAwX291dHB1dDog
ZW5kcG9pbnQgewogCQkJCXJlbW90ZS1lbmRwb2ludCA9IDwmdGRhOTk4eF8yX2lucHV0PjsKLS0g
CjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
