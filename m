Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 51783DAA66
	for <lists+dri-devel@lfdr.de>; Thu, 17 Oct 2019 12:50:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1154A6E480;
	Thu, 17 Oct 2019 10:50:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54ED96E480;
 Thu, 17 Oct 2019 10:50:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 76A7A3083363;
 Thu, 17 Oct 2019 10:50:33 +0000 (UTC)
Received: from jason-ThinkPad-X1-Carbon-6th.redhat.com
 (ovpn-12-185.pek2.redhat.com [10.72.12.185])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 001F561F40;
 Thu, 17 Oct 2019 10:49:58 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: kvm@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 kwankhede@nvidia.com, alex.williamson@redhat.com, mst@redhat.com,
 tiwei.bie@intel.com
Subject: [PATCH V4 2/6] modpost: add support for mdev class id
Date: Thu, 17 Oct 2019 18:48:32 +0800
Message-Id: <20191017104836.32464-3-jasowang@redhat.com>
In-Reply-To: <20191017104836.32464-1-jasowang@redhat.com>
References: <20191017104836.32464-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.44]); Thu, 17 Oct 2019 10:50:33 +0000 (UTC)
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
Cc: christophe.de.dinechin@gmail.com, sebott@linux.ibm.com, airlied@linux.ie,
 Jason Wang <jasowang@redhat.com>, heiko.carstens@de.ibm.com,
 kevin.tian@intel.com, virtualization@lists.linux-foundation.org,
 rob.miller@broadcom.com, lulu@redhat.com, eperezma@redhat.com,
 pasic@linux.ibm.com, borntraeger@de.ibm.com, haotian.wang@sifive.com,
 zhi.a.wang@intel.com, farman@linux.ibm.com, idos@mellanox.com,
 gor@linux.ibm.com, cunming.liang@intel.com, rodrigo.vivi@intel.com,
 xiao.w.wang@intel.com, freude@linux.ibm.com, parav@mellanox.com,
 zhihong.wang@intel.com, stefanha@redhat.com, akrowiak@linux.ibm.com,
 netdev@vger.kernel.org, cohuck@redhat.com, oberpar@linux.ibm.com,
 maxime.coquelin@redhat.com, lingshan.zhu@intel.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIHN1cHBvcnQgdG8gcGFyc2UgbWRldiBjbGFzcyBpZCB0YWJsZS4KClNpZ25lZC1vZmYtYnk6
IEphc29uIFdhbmcgPGphc293YW5nQHJlZGhhdC5jb20+Ci0tLQogZHJpdmVycy92ZmlvL21kZXYv
dmZpb19tZGV2LmMgICAgIHwgIDIgKysKIHNjcmlwdHMvbW9kL2RldmljZXRhYmxlLW9mZnNldHMu
YyB8ICAzICsrKwogc2NyaXB0cy9tb2QvZmlsZTJhbGlhcy5jICAgICAgICAgIHwgMTAgKysrKysr
KysrKwogMyBmaWxlcyBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJp
dmVycy92ZmlvL21kZXYvdmZpb19tZGV2LmMgYi9kcml2ZXJzL3ZmaW8vbWRldi92ZmlvX21kZXYu
YwppbmRleCA3YjI0ZWU5Y2I4ZGQuLmNiNzAxY2Q2NDZmMCAxMDA2NDQKLS0tIGEvZHJpdmVycy92
ZmlvL21kZXYvdmZpb19tZGV2LmMKKysrIGIvZHJpdmVycy92ZmlvL21kZXYvdmZpb19tZGV2LmMK
QEAgLTEyNSw2ICsxMjUsOCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IG1kZXZfY2xhc3NfaWQgaWRf
dGFibGVbXSA9IHsKIAl7IDAgfSwKIH07CiAKK01PRFVMRV9ERVZJQ0VfVEFCTEUobWRldiwgaWRf
dGFibGUpOworCiBzdGF0aWMgc3RydWN0IG1kZXZfZHJpdmVyIHZmaW9fbWRldl9kcml2ZXIgPSB7
CiAJLm5hbWUJPSAidmZpb19tZGV2IiwKIAkucHJvYmUJPSB2ZmlvX21kZXZfcHJvYmUsCmRpZmYg
LS1naXQgYS9zY3JpcHRzL21vZC9kZXZpY2V0YWJsZS1vZmZzZXRzLmMgYi9zY3JpcHRzL21vZC9k
ZXZpY2V0YWJsZS1vZmZzZXRzLmMKaW5kZXggMDU0NDA1YjkwYmE0Li42Y2JiMTA2MjQ4OGEgMTAw
NjQ0Ci0tLSBhL3NjcmlwdHMvbW9kL2RldmljZXRhYmxlLW9mZnNldHMuYworKysgYi9zY3JpcHRz
L21vZC9kZXZpY2V0YWJsZS1vZmZzZXRzLmMKQEAgLTIzMSw1ICsyMzEsOCBAQCBpbnQgbWFpbih2
b2lkKQogCURFVklEKHdtaV9kZXZpY2VfaWQpOwogCURFVklEX0ZJRUxEKHdtaV9kZXZpY2VfaWQs
IGd1aWRfc3RyaW5nKTsKIAorCURFVklEKG1kZXZfY2xhc3NfaWQpOworCURFVklEX0ZJRUxEKG1k
ZXZfY2xhc3NfaWQsIGlkKTsKKwogCXJldHVybiAwOwogfQpkaWZmIC0tZ2l0IGEvc2NyaXB0cy9t
b2QvZmlsZTJhbGlhcy5jIGIvc2NyaXB0cy9tb2QvZmlsZTJhbGlhcy5jCmluZGV4IGM5MWViYTc1
MTgwNC4uZDM2NWRmZTdjNzE4IDEwMDY0NAotLS0gYS9zY3JpcHRzL21vZC9maWxlMmFsaWFzLmMK
KysrIGIvc2NyaXB0cy9tb2QvZmlsZTJhbGlhcy5jCkBAIC0xMzM1LDYgKzEzMzUsMTUgQEAgc3Rh
dGljIGludCBkb193bWlfZW50cnkoY29uc3QgY2hhciAqZmlsZW5hbWUsIHZvaWQgKnN5bXZhbCwg
Y2hhciAqYWxpYXMpCiAJcmV0dXJuIDE7CiB9CiAKKy8qIGxvb2tzIGxpa2U6ICJtZGV2OmNOIiAq
Lworc3RhdGljIGludCBkb19tZGV2X2VudHJ5KGNvbnN0IGNoYXIgKmZpbGVuYW1lLCB2b2lkICpz
eW12YWwsIGNoYXIgKmFsaWFzKQoreworCURFRl9GSUVMRChzeW12YWwsIG1kZXZfY2xhc3NfaWQs
IGlkKTsKKworCXNwcmludGYoYWxpYXMsICJtZGV2OmMlMDJYIiwgaWQpOworCXJldHVybiAxOwor
fQorCiAvKiBEb2VzIG5hbWVsZW4gYnl0ZXMgb2YgbmFtZSBleGFjdGx5IG1hdGNoIHRoZSBzeW1i
b2w/ICovCiBzdGF0aWMgYm9vbCBzeW1faXMoY29uc3QgY2hhciAqbmFtZSwgdW5zaWduZWQgbmFt
ZWxlbiwgY29uc3QgY2hhciAqc3ltYm9sKQogewpAQCAtMTQwNyw2ICsxNDE2LDcgQEAgc3RhdGlj
IGNvbnN0IHN0cnVjdCBkZXZ0YWJsZSBkZXZ0YWJsZVtdID0gewogCXsidHlwZWMiLCBTSVpFX3R5
cGVjX2RldmljZV9pZCwgZG9fdHlwZWNfZW50cnl9LAogCXsidGVlIiwgU0laRV90ZWVfY2xpZW50
X2RldmljZV9pZCwgZG9fdGVlX2VudHJ5fSwKIAl7IndtaSIsIFNJWkVfd21pX2RldmljZV9pZCwg
ZG9fd21pX2VudHJ5fSwKKwl7Im1kZXYiLCBTSVpFX21kZXZfY2xhc3NfaWQsIGRvX21kZXZfZW50
cnl9LAogfTsKIAogLyogQ3JlYXRlIE1PRFVMRV9BTElBUygpIHN0YXRlbWVudHMuCi0tIAoyLjE5
LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
