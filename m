Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57A2176746
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jul 2019 15:24:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C4936ED57;
	Fri, 26 Jul 2019 13:24:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37D006ED56
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jul 2019 13:24:32 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9982922BEF;
 Fri, 26 Jul 2019 13:24:31 +0000 (UTC)
Subject: Patch "dma-buf: balance refcount inbalance" has been added to the
 5.1-stable tree
To: 20181206161840.6578-1-jglisse@redhat.com, christian.koenig@amd.com,
 daniel.vetter@ffwll.ch, dri-devel@lists.freedesktop.org,
 gregkh@linuxfoundation.org, jglisse@redhat.com, linaro-mm-sig@lists.linaro.org,
 marcheu@chromium.org, sumit.semwal@linaro.org
From: <gregkh@linuxfoundation.org>
Date: Fri, 26 Jul 2019 15:24:02 +0200
Message-ID: <1564147442121239@kroah.com>
MIME-Version: 1.0
X-stable: commit
X-Patchwork-Hint: ignore 
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1564147472;
 bh=gsHKwub/bsgkLvscv5yqwYalV5c24RHnPDnwDDVmtz8=;
 h=Subject:To:Cc:From:Date:From;
 b=qv59lPbScMORMciJ3/Cr2EU9aDCCvEiq8mpirq0YCPUoSh4aZfCO886/cziFUJWXb
 SlJLLThaXYTmB42b9IzjE16oeaHooTcQAPK8MDbIxE89JufXFrdEg6X4LHr3CRxwzJ
 6AP7i3jAwAfNtwPnniWOQrxqqfNu4K5VRLZZ5jMQ=
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
Cc: stable-commits@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ClRoaXMgaXMgYSBub3RlIHRvIGxldCB5b3Uga25vdyB0aGF0IEkndmUganVzdCBhZGRlZCB0aGUg
cGF0Y2ggdGl0bGVkCgogICAgZG1hLWJ1ZjogYmFsYW5jZSByZWZjb3VudCBpbmJhbGFuY2UKCnRv
IHRoZSA1LjEtc3RhYmxlIHRyZWUgd2hpY2ggY2FuIGJlIGZvdW5kIGF0OgogICAgaHR0cDovL3d3
dy5rZXJuZWwub3JnL2dpdC8/cD1saW51eC9rZXJuZWwvZ2l0L3N0YWJsZS9zdGFibGUtcXVldWUu
Z2l0O2E9c3VtbWFyeQoKVGhlIGZpbGVuYW1lIG9mIHRoZSBwYXRjaCBpczoKICAgICBkbWEtYnVm
LWJhbGFuY2UtcmVmY291bnQtaW5iYWxhbmNlLnBhdGNoCmFuZCBpdCBjYW4gYmUgZm91bmQgaW4g
dGhlIHF1ZXVlLTUuMSBzdWJkaXJlY3RvcnkuCgpJZiB5b3UsIG9yIGFueW9uZSBlbHNlLCBmZWVs
cyBpdCBzaG91bGQgbm90IGJlIGFkZGVkIHRvIHRoZSBzdGFibGUgdHJlZSwKcGxlYXNlIGxldCA8
c3RhYmxlQHZnZXIua2VybmVsLm9yZz4ga25vdyBhYm91dCBpdC4KCgpGcm9tIDVlMzgzYTk3OTg5
OTBjNjlmYzc1OWE0OTMwZGUyMjRiYjQ5N2U2MmMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCkZy
b206ID0/VVRGLTg/cT9KPUMzPUE5cj1DMz1CNG1lPTIwR2xpc3NlPz0gPGpnbGlzc2VAcmVkaGF0
LmNvbT4KRGF0ZTogVGh1LCA2IERlYyAyMDE4IDExOjE4OjQwIC0wNTAwClN1YmplY3Q6IGRtYS1i
dWY6IGJhbGFuY2UgcmVmY291bnQgaW5iYWxhbmNlCk1JTUUtVmVyc2lvbjogMS4wCkNvbnRlbnQt
VHlwZTogdGV4dC9wbGFpbjsgY2hhcnNldD1VVEYtOApDb250ZW50LVRyYW5zZmVyLUVuY29kaW5n
OiA4Yml0CgpGcm9tOiBKw6lyw7RtZSBHbGlzc2UgPGpnbGlzc2VAcmVkaGF0LmNvbT4KCmNvbW1p
dCA1ZTM4M2E5Nzk4OTkwYzY5ZmM3NTlhNDkzMGRlMjI0YmI0OTdlNjJjIHVwc3RyZWFtLgoKVGhl
IGRlYnVnZnMgdGFrZSByZWZlcmVuY2Ugb24gZmVuY2Ugd2l0aG91dCBkcm9wcGluZyB0aGVtLgoK
U2lnbmVkLW9mZi1ieTogSsOpcsO0bWUgR2xpc3NlIDxqZ2xpc3NlQHJlZGhhdC5jb20+CkNjOiBD
aHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+CkNjOiBEYW5pZWwgVmV0
dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPgpDYzogU3VtaXQgU2Vtd2FsIDxzdW1pdC5zZW13
YWxAbGluYXJvLm9yZz4KQ2M6IGxpbnV4LW1lZGlhQHZnZXIua2VybmVsLm9yZwpDYzogZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpDYzogbGluYXJvLW1tLXNpZ0BsaXN0cy5saW5hcm8u
b3JnCkNjOiBTdMOpcGhhbmUgTWFyY2hlc2luIDxtYXJjaGV1QGNocm9taXVtLm9yZz4KQ2M6IHN0
YWJsZUB2Z2VyLmtlcm5lbC5vcmcKUmV2aWV3ZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlz
dGlhbi5rb2VuaWdAYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogU3VtaXQgU2Vtd2FsIDxzdW1pdC5z
ZW13YWxAbGluYXJvLm9yZz4KTGluazogaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3Jn
L3BhdGNoL21zZ2lkLzIwMTgxMjA2MTYxODQwLjY1NzgtMS1qZ2xpc3NlQHJlZGhhdC5jb20KU2ln
bmVkLW9mZi1ieTogR3JlZyBLcm9haC1IYXJ0bWFuIDxncmVna2hAbGludXhmb3VuZGF0aW9uLm9y
Zz4KCi0tLQogZHJpdmVycy9kbWEtYnVmL2RtYS1idWYuYyB8ICAgIDEgKwogMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspCgotLS0gYS9kcml2ZXJzL2RtYS1idWYvZG1hLWJ1Zi5jCisrKyBi
L2RyaXZlcnMvZG1hLWJ1Zi9kbWEtYnVmLmMKQEAgLTEwNjgsNiArMTA2OCw3IEBAIHN0YXRpYyBp
bnQgZG1hX2J1Zl9kZWJ1Z19zaG93KHN0cnVjdCBzZXEKIAkJCQkgICBmZW5jZS0+b3BzLT5nZXRf
ZHJpdmVyX25hbWUoZmVuY2UpLAogCQkJCSAgIGZlbmNlLT5vcHMtPmdldF90aW1lbGluZV9uYW1l
KGZlbmNlKSwKIAkJCQkgICBkbWFfZmVuY2VfaXNfc2lnbmFsZWQoZmVuY2UpID8gIiIgOiAidW4i
KTsKKwkJCWRtYV9mZW5jZV9wdXQoZmVuY2UpOwogCQl9CiAJCXJjdV9yZWFkX3VubG9jaygpOwog
CgoKUGF0Y2hlcyBjdXJyZW50bHkgaW4gc3RhYmxlLXF1ZXVlIHdoaWNoIG1pZ2h0IGJlIGZyb20g
amdsaXNzZUByZWRoYXQuY29tIGFyZQoKcXVldWUtNS4xL2RtYS1idWYtYmFsYW5jZS1yZWZjb3Vu
dC1pbmJhbGFuY2UucGF0Y2gKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
