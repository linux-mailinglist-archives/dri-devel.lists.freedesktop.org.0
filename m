Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CBEEDF5119
	for <lists+dri-devel@lfdr.de>; Fri,  8 Nov 2019 17:29:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 525A06F9FA;
	Fri,  8 Nov 2019 16:29:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71EAA6F9FA;
 Fri,  8 Nov 2019 16:29:48 +0000 (UTC)
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <colin.king@canonical.com>)
 id 1iT78s-0006ft-4s; Fri, 08 Nov 2019 16:29:46 +0000
From: Colin King <colin.king@canonical.com>
To: Leo Li <sunpeng.li@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Zhou <David1.Zhou@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH][next] drm/amd/display: remove redundant variable status
Date: Fri,  8 Nov 2019 16:29:45 +0000
Message-Id: <20191108162945.180624-1-colin.king@canonical.com>
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

RnJvbTogQ29saW4gSWFuIEtpbmcgPGNvbGluLmtpbmdAY2Fub25pY2FsLmNvbT4KClZhcmlhYmxl
IHN0YXR1cyBpcyByZWR1bmRhbnQsIGl0IGlzIGJlaW5nIGluaXRpYWxpemVkIHdpdGggYSB2YWx1
ZQp0aGF0IGlzIG92ZXItd3JpdHRlbiBsYXRlciBhbmQgdGhpcyBpcyBiZWluZyByZXR1cm5lZCBp
bW1lZGlhdGVseQphZnRlciB0aGUgYXNzaWdubWVudC4gIENsZWFuIHVwIHRoZSBjb2RlIGJ5IHJl
bW92aW5nIHN0YXR1cyBhbmQKanVzdCByZXR1cm5pbmcgdGhlIHZhbHVlIHJldHVybmVkIGZyb20g
dGhlIGNhbGwgdG8gZnVuY3Rpb24KZGMtPmh3c3MuZG1kYXRhX3N0YXR1c19kb25lLgoKQWRkcmVz
c2VzLUNvdmVyaXR5OiAoIlVudXNlZCB2YWx1ZSIpClNpZ25lZC1vZmYtYnk6IENvbGluIElhbiBL
aW5nIDxjb2xpbi5raW5nQGNhbm9uaWNhbC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9k
aXNwbGF5L2RjL2NvcmUvZGNfc3RyZWFtLmMgfCA0ICstLS0KIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2Rpc3BsYXkvZGMvY29yZS9kY19zdHJlYW0uYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlz
cGxheS9kYy9jb3JlL2RjX3N0cmVhbS5jCmluZGV4IDM3MWQ0OWU5Yjc0NS4uODhhODRiZmFlYTZm
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kY19zdHJl
YW0uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kY19zdHJlYW0u
YwpAQCAtNTY1LDcgKzU2NSw2IEBAIGJvb2wgZGNfc3RyZWFtX2dldF9zY2Fub3V0cG9zKGNvbnN0
IHN0cnVjdCBkY19zdHJlYW1fc3RhdGUgKnN0cmVhbSwKIAogYm9vbCBkY19zdHJlYW1fZG1kYXRh
X3N0YXR1c19kb25lKHN0cnVjdCBkYyAqZGMsIHN0cnVjdCBkY19zdHJlYW1fc3RhdGUgKnN0cmVh
bSkKIHsKLQlib29sIHN0YXR1cyA9IHRydWU7CiAJc3RydWN0IHBpcGVfY3R4ICpwaXBlID0gTlVM
TDsKIAlpbnQgaTsKIApAQCAtNTgxLDggKzU4MCw3IEBAIGJvb2wgZGNfc3RyZWFtX2RtZGF0YV9z
dGF0dXNfZG9uZShzdHJ1Y3QgZGMgKmRjLCBzdHJ1Y3QgZGNfc3RyZWFtX3N0YXRlICpzdHJlYW0p
CiAJaWYgKGkgPT0gTUFYX1BJUEVTKQogCQlyZXR1cm4gdHJ1ZTsKIAotCXN0YXR1cyA9IGRjLT5o
d3NzLmRtZGF0YV9zdGF0dXNfZG9uZShwaXBlKTsKLQlyZXR1cm4gc3RhdHVzOworCXJldHVybiBk
Yy0+aHdzcy5kbWRhdGFfc3RhdHVzX2RvbmUocGlwZSk7CiB9CiAKIGJvb2wgZGNfc3RyZWFtX3Nl
dF9keW5hbWljX21ldGFkYXRhKHN0cnVjdCBkYyAqZGMsCi0tIAoyLjIwLjEKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
