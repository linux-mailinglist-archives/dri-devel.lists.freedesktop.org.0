Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D35BA1322
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2019 10:01:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA68A89452;
	Thu, 29 Aug 2019 08:01:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58D1B89D3E;
 Wed, 28 Aug 2019 15:05:52 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id E3DE3AC10;
 Wed, 28 Aug 2019 15:05:50 +0000 (UTC)
Date: Wed, 28 Aug 2019 17:05:57 +0200
From: Jean Delvare <jdelvare@suse.de>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH] drm/amdgpu/si: fix ASIC tests
Message-ID: <20190828170557.37df0d7a@endymion>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 29 Aug 2019 08:01:00 +0000
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Ken Wang <Qingqing.Wang@amd.com>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Q29tcGFyaW5nIGFkZXYtPmZhbWlseSB3aXRoIENISVAgY29uc3RhbnRzIGlzIG5vdCBjb3JyZWN0
LgphZGV2LT5mYW1pbHkgY2FuIG9ubHkgYmUgY29tcGFyZWQgd2l0aCBBTURHUFVfRkFNSUxZIGNv
bnN0YW50cyBhbmQKYWRldi0+YXNpY190eXBlIGlzIHRoZSBzdHJ1Y3QgbWVtYmVyIHRvIGNvbXBh
cmUgd2l0aCBDSElQIGNvbnN0YW50cy4KVGhleSBhcmUgc2VwYXJhdGUgaWRlbnRpZmljYXRpb24g
c3BhY2VzLgoKU2lnbmVkLW9mZi1ieTogSmVhbiBEZWx2YXJlIDxqZGVsdmFyZUBzdXNlLmRlPgpG
aXhlczogNjJhMzc1NTM0MTRhICgiZHJtL2FtZGdwdTogYWRkIHNpIGltcGxlbWVudGF0aW9uIHYx
MCIpCkNjOiBLZW4gV2FuZyA8UWluZ3FpbmcuV2FuZ0BhbWQuY29tPgpDYzogQWxleCBEZXVjaGVy
IDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgpDYzogIkNocmlzdGlhbiBLw7ZuaWciIDxjaHJp
c3RpYW4ua29lbmlnQGFtZC5jb20+CkNjOiAiRGF2aWQgKENodW5NaW5nKSBaaG91IiA8RGF2aWQx
Llpob3VAYW1kLmNvbT4KLS0tCkkgc3R1bWJsZWQgdXBvbiB0aGlzIHdoaWxlIHJlYWRpbmcgdGhl
IGNvZGUuIFRoZSBjb21wYXJpc29ucyBsb29rCm9idmlvdXNseSBpbmNvcnJlY3QsIGJ1dCBvbiB0
aGUgb3RoZXIgaGFuZCBpdCdzIGhhcmQgdG8gYmVsaWV2ZSB0aGF0CnRoZSBidWcgaGFzIGJlZW4g
dGhlcmUgZm9yIGFsbW9zdCA0IHllYXJzIHdpdGhvdXQgYW55IHVzZXIgcmVwb3J0aW5nCmFueSBh
Y3R1YWwgcHJvYmxlbSBjYXVzZWQgYnkgaXQuIFNvIHRoaXMgcHJvYmFibHkgcmVxdWlyZXMgYSBt
b3JlCmluLWRlcHRoIGFuYWx5c2lzIGJ5IHNvbWVvbmUgZmFtaWxpYXIgd2l0aCB0aGUgY29kZS4K
CkkgdGVzdGVkIHRoZXNlIGNoYW5nZXMgb24gbXkgT2xhbmQgY2FyZCBhbmQgZGlkIG5vdCBub3Rp
Y2UgYW55CmRpZmZlcmVuY2UsIGJ1dCBJIGRvbid0IGtub3cgd2hhdCBJIHNob3VsZCBiZSBsb29r
aW5nIGF0LgoKIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NpLmMgfCAgICA2ICsrKy0tLQog
MSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCi0tLSBsaW51
eC01LjIub3JpZy9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zaS5jCTIwMTktMDctMDggMDA6
NDE6NTYuMDAwMDAwMDAwICswMjAwCisrKyBsaW51eC01LjIvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvc2kuYwkyMDE5LTA4LTI4IDEwOjI5OjQzLjU0NDE4MDEzMSArMDIwMApAQCAtMTg2Nyw3
ICsxODY3LDcgQEAgc3RhdGljIHZvaWQgc2lfcHJvZ3JhbV9hc3BtKHN0cnVjdCBhbWRncAogCQkJ
aWYgKG9yaWcgIT0gZGF0YSkKIAkJCQlzaV9waWZfcGh5MV93cmVnKGFkZXYsUEIxX1BJRl9QV1JE
T1dOXzEsIGRhdGEpOwogCi0JCQlpZiAoKGFkZXYtPmZhbWlseSAhPSBDSElQX09MQU5EKSAmJiAo
YWRldi0+ZmFtaWx5ICE9IENISVBfSEFJTkFOKSkgeworCQkJaWYgKChhZGV2LT5hc2ljX3R5cGUg
IT0gQ0hJUF9PTEFORCkgJiYgKGFkZXYtPmFzaWNfdHlwZSAhPSBDSElQX0hBSU5BTikpIHsKIAkJ
CQlvcmlnID0gZGF0YSA9IHNpX3BpZl9waHkwX3JyZWcoYWRldixQQjBfUElGX1BXUkRPV05fMCk7
CiAJCQkJZGF0YSAmPSB+UExMX1JBTVBfVVBfVElNRV8wX01BU0s7CiAJCQkJaWYgKG9yaWcgIT0g
ZGF0YSkKQEAgLTE5MTYsMTQgKzE5MTYsMTQgQEAgc3RhdGljIHZvaWQgc2lfcHJvZ3JhbV9hc3Bt
KHN0cnVjdCBhbWRncAogCiAJCQlvcmlnID0gZGF0YSA9IHNpX3BpZl9waHkwX3JyZWcoYWRldixQ
QjBfUElGX0NOVEwpOwogCQkJZGF0YSAmPSB+TFMyX0VYSVRfVElNRV9NQVNLOwotCQkJaWYgKChh
ZGV2LT5mYW1pbHkgPT0gQ0hJUF9PTEFORCkgfHwgKGFkZXYtPmZhbWlseSA9PSBDSElQX0hBSU5B
TikpCisJCQlpZiAoKGFkZXYtPmFzaWNfdHlwZSA9PSBDSElQX09MQU5EKSB8fCAoYWRldi0+YXNp
Y190eXBlID09IENISVBfSEFJTkFOKSkKIAkJCQlkYXRhIHw9IExTMl9FWElUX1RJTUUoNSk7CiAJ
CQlpZiAob3JpZyAhPSBkYXRhKQogCQkJCXNpX3BpZl9waHkwX3dyZWcoYWRldixQQjBfUElGX0NO
VEwsIGRhdGEpOwogCiAJCQlvcmlnID0gZGF0YSA9IHNpX3BpZl9waHkxX3JyZWcoYWRldixQQjFf
UElGX0NOVEwpOwogCQkJZGF0YSAmPSB+TFMyX0VYSVRfVElNRV9NQVNLOwotCQkJaWYgKChhZGV2
LT5mYW1pbHkgPT0gQ0hJUF9PTEFORCkgfHwgKGFkZXYtPmZhbWlseSA9PSBDSElQX0hBSU5BTikp
CisJCQlpZiAoKGFkZXYtPmFzaWNfdHlwZSA9PSBDSElQX09MQU5EKSB8fCAoYWRldi0+YXNpY190
eXBlID09IENISVBfSEFJTkFOKSkKIAkJCQlkYXRhIHw9IExTMl9FWElUX1RJTUUoNSk7CiAJCQlp
ZiAob3JpZyAhPSBkYXRhKQogCQkJCXNpX3BpZl9waHkxX3dyZWcoYWRldixQQjFfUElGX0NOVEws
IGRhdGEpOwoKCi0tIApKZWFuIERlbHZhcmUKU1VTRSBMMyBTdXBwb3J0Cl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
