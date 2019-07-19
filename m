Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 933596D9AF
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jul 2019 05:57:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7DC66E4A2;
	Fri, 19 Jul 2019 03:57:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 118736E49D;
 Fri, 19 Jul 2019 03:57:43 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0914A21852;
 Fri, 19 Jul 2019 03:57:41 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.2 021/171] drm/amd/display: Disable cursor when
 offscreen in negative direction
Date: Thu, 18 Jul 2019 23:54:12 -0400
Message-Id: <20190719035643.14300-21-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190719035643.14300-1-sashal@kernel.org>
References: <20190719035643.14300-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1563508663;
 bh=fnhJtHhZ7psncufqizd+johqm8CCDOQCcGb61BQAxMg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=vRqbRgIf84hL8vDyIJkdhQECnhmt84w9FjXKgcYDw8dAZktKWlox09LVdr+FWX4zU
 fkZ3QnsUq5DfHCDTExcfkLlQmR8G+5Bfhuq18/TTm+Yv5GXKqHipuzYQTPUrGRJkpV
 dqURjNRGLLsRgZPSKFsXAlduSr3AKhWBr3/RzxMs=
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
Cc: Sasha Levin <sashal@kernel.org>, Sun peng Li <Sunpeng.Li@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogTmljaG9sYXMgS2F6bGF1c2thcyA8bmljaG9sYXMua2F6bGF1c2thc0BhbWQuY29tPgoK
WyBVcHN0cmVhbSBjb21taXQgZTM3MWUxOWMxMGEyNjRiZDcyYzJmZjFkMjFlMjE2N2I5OTQ3MTBk
MSBdCgpbV2h5XQpXaGVuIHggb3IgeSBpcyBuZWdhdGl2ZSB3ZSBzZXQgdGhlIHggYW5kIHkgdmFs
dWVzIHRvIDAgYW5kIGNvbXBlbnNhdGUKd2l0aCBhIHBvc2l0aXZlIGN1cnNvciBob3RzcG90IGlu
IERNIHNpbmNlIERDIGV4cGVjdHMgcG9zaXRpdmUgY3Vyc29yCnZhbHVlcy4KCldoZW4geCBvciB5
IGlzIGxlc3MgdGhhbiBvciBlcXVhbCB0byB0aGUgbWF4aW11bSBjdXJzb3Igd2lkdGggb3IgaGVp
Z2h0CnRoZSBjdXJzb3IgaG90c3BvdCBpcyBjbGFtcGVkIHNvIHRoZSBob3RzcG90IGRvZXNuJ3Qg
ZXhjZWVkIHRoZQpjdXJzb3Igc2l6ZToKCmlmICh4IDwgMCkgewogICAgICAgIHhvcmlnaW4gPSBt
aW4oLXgsIGFtZGdwdV9jcnRjLT5tYXhfY3Vyc29yX3dpZHRoIC0gMSk7CiAgICAgICAgeCA9IDA7
Cn0KCmlmICh5IDwgMCkgewogICAgICAgIHlvcmlnaW4gPSBtaW4oLXksIGFtZGdwdV9jcnRjLT5t
YXhfY3Vyc29yX2hlaWdodCAtIDEpOwogICAgICAgIHkgPSAwOwp9CgpUaGlzIGluY29ycmVjdGx5
IGZvcmNlcyB0aGUgY3Vyc29yIHRvIGJlIGF0IGxlYXN0IDEgcGl4ZWwgb24gdGhlIHNjcmVlbgpp
biBlaXRoZXIgZGlyZWN0aW9uIHdoZW4geCBvciB5IGlzIHN1ZmZpY2llbnRseSBuZWdhdGl2ZS4K
CltIb3ddCkp1c3QgZGlzYWJsZSB0aGUgY3Vyc29yIHdoZW4gaXQgZ29lcyBmYXIgZW5vdWdoIG9m
ZiB0aGUgc2NyZWVuIGluIG9uZQpvZiB0aGVzZSBkaXJlY3Rpb25zLgoKVGhpcyBmaXhlcyBrbXNf
Y3Vyc29yX2NyY0BjdXJzb3ItMjU2eDI1Ni1vZmZzY3JlZW4uCgpTaWduZWQtb2ZmLWJ5OiBOaWNo
b2xhcyBLYXpsYXVza2FzIDxuaWNob2xhcy5rYXpsYXVza2FzQGFtZC5jb20+ClJldmlld2VkLWJ5
OiBTdW4gcGVuZyBMaSA8U3VucGVuZy5MaUBhbWQuY29tPgpBY2tlZC1ieTogQmhhd2FucHJlZXQg
TGFraGEgPEJoYXdhbnByZWV0Lkxha2hhQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1
Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogU2FzaGEgTGV2
aW4gPHNhc2hhbEBrZXJuZWwub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9h
bWRncHVfZG0vYW1kZ3B1X2RtLmMgfCAxNCArKysrKysrKystLS0tLQogMSBmaWxlIGNoYW5nZWQs
IDkgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYwppbmRleCBhYjdjNWMzMDA0ZWUuLmZh
MjY4ZGQ3MzZmNCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdw
dV9kbS9hbWRncHVfZG0uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1
X2RtL2FtZGdwdV9kbS5jCkBAIC00OTUyLDEyICs0OTUyLDEyIEBAIHN0YXRpYyBpbnQgZ2V0X2N1
cnNvcl9wb3NpdGlvbihzdHJ1Y3QgZHJtX3BsYW5lICpwbGFuZSwgc3RydWN0IGRybV9jcnRjICpj
cnRjLAogCWludCB4LCB5OwogCWludCB4b3JpZ2luID0gMCwgeW9yaWdpbiA9IDA7CiAKLQlpZiAo
IWNydGMgfHwgIXBsYW5lLT5zdGF0ZS0+ZmIpIHsKLQkJcG9zaXRpb24tPmVuYWJsZSA9IGZhbHNl
OwotCQlwb3NpdGlvbi0+eCA9IDA7Ci0JCXBvc2l0aW9uLT55ID0gMDsKKwlwb3NpdGlvbi0+ZW5h
YmxlID0gZmFsc2U7CisJcG9zaXRpb24tPnggPSAwOworCXBvc2l0aW9uLT55ID0gMDsKKworCWlm
ICghY3J0YyB8fCAhcGxhbmUtPnN0YXRlLT5mYikKIAkJcmV0dXJuIDA7Ci0JfQogCiAJaWYgKChw
bGFuZS0+c3RhdGUtPmNydGNfdyA+IGFtZGdwdV9jcnRjLT5tYXhfY3Vyc29yX3dpZHRoKSB8fAog
CSAgICAocGxhbmUtPnN0YXRlLT5jcnRjX2ggPiBhbWRncHVfY3J0Yy0+bWF4X2N1cnNvcl9oZWln
aHQpKSB7CkBAIC00OTcxLDYgKzQ5NzEsMTAgQEAgc3RhdGljIGludCBnZXRfY3Vyc29yX3Bvc2l0
aW9uKHN0cnVjdCBkcm1fcGxhbmUgKnBsYW5lLCBzdHJ1Y3QgZHJtX2NydGMgKmNydGMsCiAJeCA9
IHBsYW5lLT5zdGF0ZS0+Y3J0Y194OwogCXkgPSBwbGFuZS0+c3RhdGUtPmNydGNfeTsKIAorCWlm
ICh4IDw9IC1hbWRncHVfY3J0Yy0+bWF4X2N1cnNvcl93aWR0aCB8fAorCSAgICB5IDw9IC1hbWRn
cHVfY3J0Yy0+bWF4X2N1cnNvcl9oZWlnaHQpCisJCXJldHVybiAwOworCiAJaWYgKGNydGMtPnBy
aW1hcnktPnN0YXRlKSB7CiAJCS8qIGF2aXZvIGN1cnNvciBhcmUgb2Zmc2V0IGludG8gdGhlIHRv
dGFsIHN1cmZhY2UgKi8KIAkJeCArPSBjcnRjLT5wcmltYXJ5LT5zdGF0ZS0+c3JjX3ggPj4gMTY7
Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
