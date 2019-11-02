Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC5FAECE7E
	for <lists+dri-devel@lfdr.de>; Sat,  2 Nov 2019 12:40:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB8BD6E435;
	Sat,  2 Nov 2019 11:39:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03A0C6E435;
 Sat,  2 Nov 2019 11:39:58 +0000 (UTC)
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <colin.king@canonical.com>)
 id 1iQrl5-0004g7-2H; Sat, 02 Nov 2019 11:39:55 +0000
From: Colin King <colin.king@canonical.com>
To: Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
Subject: [PATCH] drm/nouveau/bios/init: make const arrays probe_order static,
 makes object smaller
Date: Sat,  2 Nov 2019 11:39:54 +0000
Message-Id: <20191102113954.25555-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.20.1
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogQ29saW4gSWFuIEtpbmcgPGNvbGluLmtpbmdAY2Fub25pY2FsLmNvbT4KCkRvbid0IHBv
cHVsYXRlIGNvbnN0IGFycmF5cyBvbiB0aGUgc3RhY2sgYnV0IGluc3RlYWQgbWFrZSB0aGVtCnN0
YXRpYy4gTWFrZXMgdGhlIG9iamVjdCBjb2RlIHNtYWxsZXIgYnkgNiBieXRlcy4KCkJlZm9yZToK
ICAgdGV4dAkgICBkYXRhCSAgICBic3MJICAgIGRlYwkgICAgaGV4CWZpbGVuYW1lCiAxMDMwNzUJ
ICAgOTY5MgkgICAgICAwCSAxMTI3NjcJICAxYjg3ZgludmttL3N1YmRldi9iaW9zL2luaXQubwoK
QWZ0ZXI6CiAgIHRleHQJICAgZGF0YQkgICAgYnNzCSAgICBkZWMJICAgIGhleAlmaWxlbmFtZQog
MTAyOTA5CSAgIDk4NTIJICAgICAgMAkgMTEyNzYxCSAgMWI4NzkJbnZrbS9zdWJkZXYvYmlvcy9p
bml0Lm8KCihnY2MgdmVyc2lvbiA5LjIuMSwgYW1kNjQpCgpTaWduZWQtb2ZmLWJ5OiBDb2xpbiBJ
YW4gS2luZyA8Y29saW4ua2luZ0BjYW5vbmljYWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9u
b3V2ZWF1L252a20vc3ViZGV2L2Jpb3MvaW5pdC5jIHwgNCArKy0tCiAxIGZpbGUgY2hhbmdlZCwg
MiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9ub3V2ZWF1L252a20vc3ViZGV2L2Jpb3MvaW5pdC5jIGIvZHJpdmVycy9ncHUvZHJtL25v
dXZlYXUvbnZrbS9zdWJkZXYvYmlvcy9pbml0LmMKaW5kZXggOWRlNzRmNDFkY2QyLi5kYzg2MjVl
ZmYyMGEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L252a20vc3ViZGV2L2Jp
b3MvaW5pdC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L252a20vc3ViZGV2L2Jpb3Mv
aW5pdC5jCkBAIC01NDYsOSArNTQ2LDkgQEAgaW5pdF90bWRzX3JlZyhzdHJ1Y3QgbnZiaW9zX2lu
aXQgKmluaXQsIHU4IHRtZHMpCiAJICogQ1I1OCBmb3IgQ1I1NyA9IDAgdG8gaW5kZXggYSB0YWJs
ZSBvZiBvZmZzZXRzIHRvIHRoZSBiYXNpYwogCSAqIDB4NjgwOGIwIGFkZHJlc3MsIGFuZCB0aGVu
IGZsaXAgdGhlIG9mZnNldCBieSA4LgogCSAqLwotCWNvbnN0IGludCBwcmFtZGFjX29mZnNldFsx
M10gPSB7CisJc3RhdGljIGNvbnN0IGludCBwcmFtZGFjX29mZnNldFsxM10gPSB7CiAJCTAsIDAs
IDB4OCwgMCwgMHgyMDAwLCAwLCAwLCAwLCAweDIwMDgsIDAsIDAsIDAsIDB4MjAwMCB9OwotCWNv
bnN0IHUzMiBwcmFtZGFjX3RhYmxlWzRdID0geworCXN0YXRpYyBjb25zdCB1MzIgcHJhbWRhY190
YWJsZVs0XSA9IHsKIAkJMHg2ODA4YjAsIDB4NjgwOGI4LCAweDY4MjhiMCwgMHg2ODI4YjggfTsK
IAogCWlmICh0bWRzID49IDB4ODApIHsKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
