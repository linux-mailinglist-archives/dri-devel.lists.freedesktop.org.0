Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 30A949DECA
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2019 09:30:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A35B08991D;
	Tue, 27 Aug 2019 07:30:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA11488071;
 Tue, 27 Aug 2019 07:09:57 +0000 (UTC)
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 1E48B97A03B8D482BE85;
 Tue, 27 Aug 2019 15:09:45 +0800 (CST)
Received: from localhost (10.133.213.239) by DGGEMS402-HUB.china.huawei.com
 (10.3.19.202) with Microsoft SMTP Server id 14.3.439.0; Tue, 27 Aug 2019
 15:09:38 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: <harry.wentland@amd.com>, <sunpeng.li@amd.com>,
 <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <David1.Zhou@amd.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <Bhawanpreet.Lakha@amd.com>, <Anthony.Koo@amd.com>, <ahmad.othman@amd.com>,
 <eric.bernstein@amd.com>, <yuehaibing@huawei.com>, <aric.cyr@amd.com>,
 <alvin.lee3@amd.com>, <Harmanprit.Tatla@amd.com>
Subject: [PATCH 2/3] drm/amd/display: remove unused function setFieldWithMask
Date: Tue, 27 Aug 2019 15:09:25 +0800
Message-ID: <20190827070925.16080-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
X-Originating-IP: [10.133.213.239]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Tue, 27 Aug 2019 07:29:19 +0000
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWZ0ZXIgY29tbWl0IGE5ZjU0Y2UzYzYwMyAoImRybS9hbWQvZGlzcGxheTogUmVmYWN0b3Jpbmcg
VlRFTSIpLAp0aGVyZSBpcyBubyBjYWxsZXIgaW4gdHJlZS4KClJlcG9ydGVkLWJ5OiBIdWxrIFJv
Ym90IDxodWxrY2lAaHVhd2VpLmNvbT4KU2lnbmVkLW9mZi1ieTogWXVlSGFpYmluZyA8eXVlaGFp
YmluZ0BodWF3ZWkuY29tPgotLS0KIC4uLi9kcm0vYW1kL2Rpc3BsYXkvbW9kdWxlcy9pbmZvX3Bh
Y2tldC9pbmZvX3BhY2tldC5jIHwgMTkgLS0tLS0tLS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5n
ZWQsIDE5IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlz
cGxheS9tb2R1bGVzL2luZm9fcGFja2V0L2luZm9fcGFja2V0LmMgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2Rpc3BsYXkvbW9kdWxlcy9pbmZvX3BhY2tldC9pbmZvX3BhY2tldC5jCmluZGV4IDVmNGI5
OGQuLmQ4ODVkNjQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9tb2R1
bGVzL2luZm9fcGFja2V0L2luZm9fcGFja2V0LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9k
aXNwbGF5L21vZHVsZXMvaW5mb19wYWNrZXQvaW5mb19wYWNrZXQuYwpAQCAtMTE0LDI1ICsxMTQs
NiBAQCBlbnVtIENvbG9yaW1ldHJ5WUNDRFAgewogCUNvbG9yaW1ldHJ5WUNDX0RQX0lUVTIwMjBZ
Q2JDciAgPSA3LAogfTsKIAotdm9pZCBzZXRGaWVsZFdpdGhNYXNrKHVuc2lnbmVkIGNoYXIgKmRl
c3QsIHVuc2lnbmVkIGludCBtYXNrLCB1bnNpZ25lZCBpbnQgdmFsdWUpCi17Ci0JdW5zaWduZWQg
aW50IHNoaWZ0ID0gMDsKLQotCWlmICghbWFzayB8fCAhZGVzdCkKLQkJcmV0dXJuOwotCi0Jd2hp
bGUgKCEoKG1hc2sgPj4gc2hpZnQpICYgMSkpCi0JCXNoaWZ0Kys7Ci0KLQkvL3Jlc2V0Ci0JKmRl
c3QgPSAqZGVzdCAmIH5tYXNrOwotCS8vc2V0Ci0JLy9kb250IGxldCB2YWx1ZSBzcGFuIHBhc3Qg
bWFzawotCXZhbHVlID0gdmFsdWUgJiAobWFzayA+PiBzaGlmdCk7Ci0JLy9pbnNlcnQgdmFsdWUK
LQkqZGVzdCA9ICpkZXN0IHwgKHZhbHVlIDw8IHNoaWZ0KTsKLX0KLQogdm9pZCBtb2RfYnVpbGRf
dnNjX2luZm9wYWNrZXQoY29uc3Qgc3RydWN0IGRjX3N0cmVhbV9zdGF0ZSAqc3RyZWFtLAogCQlz
dHJ1Y3QgZGNfaW5mb19wYWNrZXQgKmluZm9fcGFja2V0KQogewotLSAKMi43LjQKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
