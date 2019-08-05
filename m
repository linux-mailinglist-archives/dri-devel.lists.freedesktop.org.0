Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C7E8A81FDE
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2019 17:11:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2934989CD7;
	Mon,  5 Aug 2019 15:11:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 096EF89CD7
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Aug 2019 15:11:54 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AEE62337;
 Mon,  5 Aug 2019 08:11:53 -0700 (PDT)
Received: from DESKTOP-E1NTVVP.cambridge.arm.com
 (ubuntu-vbox.cambridge.arm.com [10.1.36.122])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 86B793F694;
 Mon,  5 Aug 2019 08:11:52 -0700 (PDT)
From: Brian Starkey <brian.starkey@arm.com>
To: Liviu Dudau <Liviu.Dudau@arm.com>,
 "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>,
 "Lowry Li (Arm Technology China)" <Lowry.Li@arm.com>, nd@arm.com,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/crc-debugfs: Add notes about CRC<->commit interactions
Date: Mon,  5 Aug 2019 16:11:43 +0100
Message-Id: <20190805151143.12317-1-brian.starkey@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190802140910.GN7444@phenom.ffwll.local>
References: <20190802140910.GN7444@phenom.ffwll.local>
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
Cc: LKML <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Q1JDIGdlbmVyYXRpb24gY2FuIGJlIGltcGFjdGVkIGJ5IGNvbW1pdHMgY29taW5nIGZyb20gdXNl
cnNwYWNlLCBhbmQKZW5hYmxpbmcgQ1JDIGdlbmVyYXRpb24gbWF5IGl0c2VsZiB0cmlnZ2VyIGEg
Y29tbWl0LiBBZGQgbm90ZXMgYWJvdXQKdGhpcyB0byB0aGUga2VybmVsZG9jLgoKU2lnbmVkLW9m
Zi1ieTogQnJpYW4gU3RhcmtleSA8YnJpYW4uc3RhcmtleUBhcm0uY29tPgotLS0KCkkgbWlnaHQg
aGF2ZSBnb3QgdGhlIHdyb25nIGVuZCBvZiB0aGUgc3RpY2ssIGJ1dCB0aGlzIGlzIHdoYXQgSQp1
bmRlcnN0b29kIGZyb20gd2hhdCB5b3Ugc2FpZC4KCkNoZWVycywKLUJyaWFuCgogZHJpdmVycy9n
cHUvZHJtL2RybV9kZWJ1Z2ZzX2NyYy5jIHwgMTUgKysrKysrKysrKystLS0tCiBpbmNsdWRlL2Ry
bS9kcm1fY3J0Yy5oICAgICAgICAgICAgfCAgMyArKysKIDIgZmlsZXMgY2hhbmdlZCwgMTQgaW5z
ZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
ZHJtX2RlYnVnZnNfY3JjLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2RlYnVnZnNfY3JjLmMKaW5k
ZXggN2NhNDg2ZDc1MGU5Li4xZGZmOTU2YmNjNzQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9kcm1fZGVidWdmc19jcmMuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2RlYnVnZnNfY3Jj
LmMKQEAgLTY1LDEwICs2NSwxNyBAQAogICogaXQgc3VibWl0cy4gSW4gdGhpcyBnZW5lcmFsIGNh
c2UsIHRoZSBtYXhpbXVtIHVzZXJzcGFjZSBjYW4gZG8gaXMgdG8gY29tcGFyZQogICogdGhlIHJl
cG9ydGVkIENSQ3Mgb2YgZnJhbWVzIHRoYXQgc2hvdWxkIGhhdmUgdGhlIHNhbWUgY29udGVudHMu
CiAgKgotICogT24gdGhlIGRyaXZlciBzaWRlIHRoZSBpbXBsZW1lbnRhdGlvbiBlZmZvcnQgaXMg
bWluaW1hbCwgZHJpdmVycyBvbmx5IG5lZWQgdG8KLSAqIGltcGxlbWVudCAmZHJtX2NydGNfZnVu
Y3Muc2V0X2NyY19zb3VyY2UuIFRoZSBkZWJ1Z2ZzIGZpbGVzIGFyZSBhdXRvbWF0aWNhbGx5Ci0g
KiBzZXQgdXAgaWYgdGhhdCB2ZnVuYyBpcyBzZXQuIENSQyBzYW1wbGVzIG5lZWQgdG8gYmUgY2Fw
dHVyZWQgaW4gdGhlIGRyaXZlciBieQotICogY2FsbGluZyBkcm1fY3J0Y19hZGRfY3JjX2VudHJ5
KCkuCisgKiBPbiB0aGUgZHJpdmVyIHNpZGUgdGhlIGltcGxlbWVudGF0aW9uIGVmZm9ydCBpcyBt
aW5pbWFsLCBkcml2ZXJzIG9ubHkgbmVlZAorICogdG8gaW1wbGVtZW50ICZkcm1fY3J0Y19mdW5j
cy5zZXRfY3JjX3NvdXJjZS4gVGhlIGRlYnVnZnMgZmlsZXMgYXJlCisgKiBhdXRvbWF0aWNhbGx5
IHNldCB1cCBpZiB0aGF0IHZmdW5jIGlzIHNldC4gQ1JDIHNhbXBsZXMgbmVlZCB0byBiZSBjYXB0
dXJlZAorICogaW4gdGhlIGRyaXZlciBieSBjYWxsaW5nIGRybV9jcnRjX2FkZF9jcmNfZW50cnko
KS4gRGVwZW5kaW5nIG9uIHRoZSBkcml2ZXIKKyAqIGFuZCBIVyByZXF1aXJlbWVudHMsICZkcm1f
Y3J0Y19mdW5jcy5zZXRfY3JjX3NvdXJjZSBtYXkgcmVzdWx0IGluIGEgY29tbWl0CisgKiAoZXZl
biBhIGZ1bGwgbW9kZXNldCkuCisgKgorICogSXQncyBhbHNvIHBvc3NpYmxlIHRoYXQgYSAibm9y
bWFsIiBjb21taXQgdmlhIERSTV9JT0NUTF9NT0RFX0FUT01JQyBvciB0aGUKKyAqIGxlZ2FjeSBw
YXRocyBtYXkgaW50ZXJmZXJlIHdpdGggQ1JDIGdlbmVyYXRpb24uIFNvLCBpbiB0aGUgZ2VuZXJh
bCBjYXNlLAorICogdXNlcnNwYWNlIGNhbid0IHJlbHkgb24gdGhlIHZhbHVlcyBpbiBjcnRjLU4v
Y3JjL2RhdGEgYmVpbmcgdmFsaWQKKyAqIGFjcm9zcyBhIGNvbW1pdC4KICAqLwogCiBzdGF0aWMg
aW50IGNyY19jb250cm9sX3Nob3coc3RydWN0IHNlcV9maWxlICptLCB2b2lkICpkYXRhKQpkaWZm
IC0tZ2l0IGEvaW5jbHVkZS9kcm0vZHJtX2NydGMuaCBiL2luY2x1ZGUvZHJtL2RybV9jcnRjLmgK
aW5kZXggMTI4ZDhiMjEwNjIxLi4wZjdlYTA5NGE5MDAgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvZHJt
L2RybV9jcnRjLmgKKysrIGIvaW5jbHVkZS9kcm0vZHJtX2NydGMuaApAQCAtNzU2LDYgKzc1Niw4
IEBAIHN0cnVjdCBkcm1fY3J0Y19mdW5jcyB7CiAJICogcHJvdmlkZWQgZnJvbSB0aGUgY29uZmln
dXJlZCBzb3VyY2UuIERyaXZlcnMgbXVzdCBhY2NlcHQgYW4gImF1dG8iCiAJICogc291cmNlIG5h
bWUgdGhhdCB3aWxsIHNlbGVjdCBhIGRlZmF1bHQgc291cmNlIGZvciB0aGlzIENSVEMuCiAJICoK
KwkgKiBUaGlzIG1heSB0cmlnZ2VyIGEgY29tbWl0IGlmIG5lY2Vzc2FyeSwgdG8gZW5hYmxlIENS
QyBnZW5lcmF0aW9uLgorCSAqCiAJICogTm90ZSB0aGF0ICJhdXRvIiBjYW4gZGVwZW5kIHVwb24g
dGhlIGN1cnJlbnQgbW9kZXNldCBjb25maWd1cmF0aW9uLAogCSAqIGUuZy4gaXQgY291bGQgcGlj
ayBhbiBlbmNvZGVyIG9yIG91dHB1dCBzcGVjaWZpYyBDUkMgc2FtcGxpbmcgcG9pbnQuCiAJICoK
QEAgLTc2Nyw2ICs3NjksNyBAQCBzdHJ1Y3QgZHJtX2NydGNfZnVuY3MgewogCSAqIDAgb24gc3Vj
Y2VzcyBvciBhIG5lZ2F0aXZlIGVycm9yIGNvZGUgb24gZmFpbHVyZS4KIAkgKi8KIAlpbnQgKCpz
ZXRfY3JjX3NvdXJjZSkoc3RydWN0IGRybV9jcnRjICpjcnRjLCBjb25zdCBjaGFyICpzb3VyY2Up
OworCiAJLyoqCiAJICogQHZlcmlmeV9jcmNfc291cmNlOgogCSAqCi0tIAoyLjE3LjEKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
