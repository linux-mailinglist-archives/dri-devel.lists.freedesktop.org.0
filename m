Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEE97A6E2D
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2019 18:25:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3A4B89688;
	Tue,  3 Sep 2019 16:25:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99330895C1;
 Tue,  3 Sep 2019 16:25:12 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8033C23891;
 Tue,  3 Sep 2019 16:25:11 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.2 21/23] drm/i915: whitelist
 PS_(DEPTH|INVOCATION)_COUNT
Date: Tue,  3 Sep 2019 12:24:22 -0400
Message-Id: <20190903162424.6877-21-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190903162424.6877-1-sashal@kernel.org>
References: <20190903162424.6877-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1567527912;
 bh=nToPhXUj90HieWOjQ0yRqNGpYJt6WrnFeBUHuwMdMz8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=TB8ykN43HSrnGhuM3rZFYy/ZFojIHnVIp9SEL0nuA3jsPaf2NDepnEyZJY1VU5B2U
 jd32kXXufxGi5idjRg3LwcAaf7CjQmdYmARlbEHFwxERz33aqVRij7UDyESMdCkk5h
 eJlXO5G2VIqdolzKxLxmJIfaD52aqn6p4Ojwmc1k=
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
Cc: Sasha Levin <sashal@kernel.org>, Jani Nikula <jani.nikula@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogTGlvbmVsIExhbmR3ZXJsaW4gPGxpb25lbC5nLmxhbmR3ZXJsaW5AaW50ZWwuY29tPgoK
WyBVcHN0cmVhbSBjb21taXQgNmNlNWJmZTkzNmFjMzFkNWM1MmM0YjEzMjhkMGJmZGE1Zjk3ZTdj
YSBdCgpDRkw6QzArIGNoYW5nZWQgdGhlIHN0YXR1cyBvZiB0aG9zZSByZWdpc3RlcnMgd2hpY2gg
YXJlIG5vdwpibGFja2xpc3RlZCBieSBkZWZhdWx0LgoKVGhpcyBpcyBicmVha2luZyBhIG51bWJl
ciBvZiBDVFMgdGVzdHMgb24gR0wgJiBWdWxrYW4gOgoKICBLSFItR0w0NS5waXBlbGluZV9zdGF0
aXN0aWNzX3F1ZXJ5X3Rlc3RzX0FSQi5mdW5jdGlvbmFsX2ZyYWdtZW50X3NoYWRlcl9pbnZvY2F0
aW9ucyAoR0wpCgogIGRFUVAtVksucXVlcnlfcG9vbC5zdGF0aXN0aWNzX3F1ZXJ5LmZyYWdtZW50
X3NoYWRlcl9pbnZvY2F0aW9ucy4qIChWdWxrYW4pCgp2MjogT25seSB1c2Ugb25lIHdoaXRlbGlz
dCBlbnRyeSAoTGlvbmVsKQoKQnNwZWM6IDE0MDkxClNpZ25lZC1vZmYtYnk6IExpb25lbCBMYW5k
d2VybGluIDxsaW9uZWwuZy5sYW5kd2VybGluQGludGVsLmNvbT4KQ2M6IHN0YWJsZUB2Z2VyLmtl
cm5lbC5vcmcgIyA2ODgzZWFiMjc0ODE6IGRybS9pOTE1OiBTdXBwb3J0IGZsYWdzIGluIHdoaXRs
aXN0IFdBcwpDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZwpBY2tlZC1ieTogQ2hyaXMgV2lsc29u
IDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+ClNpZ25lZC1vZmYtYnk6IENocmlzIFdpbHNvbiA8
Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVrPgpMaW5rOiBodHRwczovL3BhdGNod29yay5mcmVlZGVz
a3RvcC5vcmcvcGF0Y2gvbXNnaWQvMjAxOTA2MjgxMjA3MjAuMjE2ODItMy1saW9uZWwuZy5sYW5k
d2VybGluQGludGVsLmNvbQooY2hlcnJ5IHBpY2tlZCBmcm9tIGNvbW1pdCAyYzkwM2RhNTBmNWE5
NTIyYjEzNGU0ODhiZDBmOTI2NDZjNDZmM2MwKQpTaWduZWQtb2ZmLWJ5OiBKYW5pIE5pa3VsYSA8
amFuaS5uaWt1bGFAaW50ZWwuY29tPgpTaWduZWQtb2ZmLWJ5OiBTYXNoYSBMZXZpbiA8c2FzaGFs
QGtlcm5lbC5vcmc+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2k5MTUvaW50ZWxfd29ya2Fyb3VuZHMu
YyB8IDE3ICsrKysrKysrKysrKysrKystCiAxIGZpbGUgY2hhbmdlZCwgMTYgaW5zZXJ0aW9ucygr
KSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2ludGVs
X3dvcmthcm91bmRzLmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pbnRlbF93b3JrYXJvdW5kcy5j
CmluZGV4IDBiODBmZGU5Mjc4OTkuLmJlMzY4ODkwOGYwY2UgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9pOTE1L2ludGVsX3dvcmthcm91bmRzLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5
MTUvaW50ZWxfd29ya2Fyb3VuZHMuYwpAQCAtMTA2MSwxMCArMTA2MSwyNSBAQCBzdGF0aWMgdm9p
ZCBnbGtfd2hpdGVsaXN0X2J1aWxkKHN0cnVjdCBpbnRlbF9lbmdpbmVfY3MgKmVuZ2luZSkKIAog
c3RhdGljIHZvaWQgY2ZsX3doaXRlbGlzdF9idWlsZChzdHJ1Y3QgaW50ZWxfZW5naW5lX2NzICpl
bmdpbmUpCiB7CisJc3RydWN0IGk5MTVfd2FfbGlzdCAqdyA9ICZlbmdpbmUtPndoaXRlbGlzdDsK
KwogCWlmIChlbmdpbmUtPmNsYXNzICE9IFJFTkRFUl9DTEFTUykKIAkJcmV0dXJuOwogCi0JZ2Vu
OV93aGl0ZWxpc3RfYnVpbGQoJmVuZ2luZS0+d2hpdGVsaXN0KTsKKwlnZW45X3doaXRlbGlzdF9i
dWlsZCh3KTsKKworCS8qCisJICogV2FBbGxvd1BNRGVwdGhBbmRJbnZvY2F0aW9uQ291bnRBY2Nl
c3NGcm9tVU1EOmNmbCx3aGwsY21sLGFtbAorCSAqCisJICogVGhpcyBjb3ZlcnMgNCByZWdpc3Rl
ciB3aGljaCBhcmUgbmV4dCB0byBvbmUgYW5vdGhlciA6CisJICogICAtIFBTX0lOVk9DQVRJT05f
Q09VTlQKKwkgKiAgIC0gUFNfSU5WT0NBVElPTl9DT1VOVF9VRFcKKwkgKiAgIC0gUFNfREVQVEhf
Q09VTlQKKwkgKiAgIC0gUFNfREVQVEhfQ09VTlRfVURXCisJICovCisJd2hpdGVsaXN0X3JlZ19l
eHQodywgUFNfSU5WT0NBVElPTl9DT1VOVCwKKwkJCSAgUklOR19GT1JDRV9UT19OT05QUklWX1JE
IHwKKwkJCSAgUklOR19GT1JDRV9UT19OT05QUklWX1JBTkdFXzQpOwogfQogCiBzdGF0aWMgdm9p
ZCBjbmxfd2hpdGVsaXN0X2J1aWxkKHN0cnVjdCBpbnRlbF9lbmdpbmVfY3MgKmVuZ2luZSkKLS0g
CjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
