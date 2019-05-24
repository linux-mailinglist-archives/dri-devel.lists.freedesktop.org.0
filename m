Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24D8929D4B
	for <lists+dri-devel@lfdr.de>; Fri, 24 May 2019 19:39:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5599C6E135;
	Fri, 24 May 2019 17:39:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1340 seconds by postgrey-1.36 at gabe;
 Fri, 24 May 2019 17:38:57 UTC
Received: from gateway20.websitewelcome.com (gateway20.websitewelcome.com
 [192.185.63.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BD8A6E135
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2019 17:38:57 +0000 (UTC)
Received: from cm13.websitewelcome.com (cm13.websitewelcome.com [100.42.49.6])
 by gateway20.websitewelcome.com (Postfix) with ESMTP id 8B771400D1918
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2019 11:14:35 -0500 (CDT)
Received: from gator4166.hostgator.com ([108.167.133.22]) by cmsmtp with SMTP
 id UDmChowU0YTGMUDmChpKbO; Fri, 24 May 2019 12:14:40 -0500
X-Authority-Reason: nr=8
Received: from [189.250.47.159] (port=51574 helo=embeddedor)
 by gator4166.hostgator.com with esmtpa (Exim 4.91)
 (envelope-from <gustavo@embeddedor.com>)
 id 1hUDlt-002A7a-UC; Fri, 24 May 2019 12:14:39 -0500
Date: Fri, 24 May 2019 12:14:21 -0500
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/i915/kvmgt: Use struct_size() helper
Message-ID: <20190524171421.GA20808@embeddedor>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - lists.freedesktop.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 189.250.47.159
X-Source-L: No
X-Exim-ID: 1hUDlt-002A7a-UC
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: (embeddedor) [189.250.47.159]:51574
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 10
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
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
Cc: intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TWFrZSB1c2Ugb2YgdGhlIHN0cnVjdF9zaXplKCkgaGVscGVyIGluc3RlYWQgb2YgYW4gb3Blbi1j
b2RlZCB2ZXJzaW9uCmluIG9yZGVyIHRvIGF2b2lkIGFueSBwb3RlbnRpYWwgdHlwZSBtaXN0YWtl
cywgaW4gcGFydGljdWxhciBpbiB0aGUKY29udGV4dCBpbiB3aGljaCB0aGlzIGNvZGUgaXMgYmVp
bmcgdXNlZC4KClNvLCByZXBsYWNlIHRoZSBmb2xsb3dpbmcgZm9ybToKCnNpemVvZigqc3BhcnNl
KSArIChucl9hcmVhcyAqIHNpemVvZigqc3BhcnNlLT5hcmVhcykKCndpdGg6CgpzdHJ1Y3Rfc2l6
ZShzcGFyc2UsIGFyZWFzLCBzcGFyc2UtPm5yX2FyZWFzKQoKYW5kIHNvIG9uLi4uCgpBbHNvLCBu
b3RpY2UgdGhhdCB2YXJpYWJsZSBzaXplIGlzIHVubmVjZXNzYXJ5LCBoZW5jZSBpdCBpcyByZW1v
dmVkLgoKVGhpcyBjb2RlIHdhcyBkZXRlY3RlZCB3aXRoIHRoZSBoZWxwIG9mIENvY2NpbmVsbGUu
CgpTaWduZWQtb2ZmLWJ5OiBHdXN0YXZvIEEuIFIuIFNpbHZhIDxndXN0YXZvQGVtYmVkZGVkb3Iu
Y29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9rdm1ndC5jIHwgMTIgKysrKystLS0t
LS0tCiAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQoKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9rdm1ndC5jIGIvZHJpdmVycy9ncHUv
ZHJtL2k5MTUvZ3Z0L2t2bWd0LmMKaW5kZXggMTQ0MzAxYjc3OGRmLi45Njc0NzM4Yjg5ZGYgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9rdm1ndC5jCisrKyBiL2RyaXZlcnMv
Z3B1L2RybS9pOTE1L2d2dC9rdm1ndC5jCkBAIC0xMzA2LDcgKzEzMDYsNiBAQCBzdGF0aWMgbG9u
ZyBpbnRlbF92Z3B1X2lvY3RsKHN0cnVjdCBtZGV2X2RldmljZSAqbWRldiwgdW5zaWduZWQgaW50
IGNtZCwKIAkJdW5zaWduZWQgaW50IGk7CiAJCWludCByZXQ7CiAJCXN0cnVjdCB2ZmlvX3JlZ2lv
bl9pbmZvX2NhcF9zcGFyc2VfbW1hcCAqc3BhcnNlID0gTlVMTDsKLQkJc2l6ZV90IHNpemU7CiAJ
CWludCBucl9hcmVhcyA9IDE7CiAJCWludCBjYXBfdHlwZV9pZDsKIApAQCAtMTM0OSw5ICsxMzQ4
LDggQEAgc3RhdGljIGxvbmcgaW50ZWxfdmdwdV9pb2N0bChzdHJ1Y3QgbWRldl9kZXZpY2UgKm1k
ZXYsIHVuc2lnbmVkIGludCBjbWQsCiAJCQkJCVZGSU9fUkVHSU9OX0lORk9fRkxBR19XUklURTsK
IAkJCWluZm8uc2l6ZSA9IGd2dF9hcGVydHVyZV9zeih2Z3B1LT5ndnQpOwogCi0JCQlzaXplID0g
c2l6ZW9mKCpzcGFyc2UpICsKLQkJCQkJKG5yX2FyZWFzICogc2l6ZW9mKCpzcGFyc2UtPmFyZWFz
KSk7Ci0JCQlzcGFyc2UgPSBremFsbG9jKHNpemUsIEdGUF9LRVJORUwpOworCQkJc3BhcnNlID0g
a3phbGxvYyhzdHJ1Y3Rfc2l6ZShzcGFyc2UsIGFyZWFzLCBucl9hcmVhcyksCisJCQkJCSBHRlBf
S0VSTkVMKTsKIAkJCWlmICghc3BhcnNlKQogCQkJCXJldHVybiAtRU5PTUVNOwogCkBAIC0xNDE2
LDkgKzE0MTQsOSBAQCBzdGF0aWMgbG9uZyBpbnRlbF92Z3B1X2lvY3RsKHN0cnVjdCBtZGV2X2Rl
dmljZSAqbWRldiwgdW5zaWduZWQgaW50IGNtZCwKIAkJCXN3aXRjaCAoY2FwX3R5cGVfaWQpIHsK
IAkJCWNhc2UgVkZJT19SRUdJT05fSU5GT19DQVBfU1BBUlNFX01NQVA6CiAJCQkJcmV0ID0gdmZp
b19pbmZvX2FkZF9jYXBhYmlsaXR5KCZjYXBzLAotCQkJCQkmc3BhcnNlLT5oZWFkZXIsIHNpemVv
Zigqc3BhcnNlKSArCi0JCQkJCShzcGFyc2UtPm5yX2FyZWFzICoKLQkJCQkJCXNpemVvZigqc3Bh
cnNlLT5hcmVhcykpKTsKKwkJCQkJJnNwYXJzZS0+aGVhZGVyLAorCQkJCQlzdHJ1Y3Rfc2l6ZShz
cGFyc2UsIGFyZWFzLAorCQkJCQkJICAgIHNwYXJzZS0+bnJfYXJlYXMpKTsKIAkJCQlpZiAocmV0
KSB7CiAJCQkJCWtmcmVlKHNwYXJzZSk7CiAJCQkJCXJldHVybiByZXQ7Ci0tIAoyLjIxLjAKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
