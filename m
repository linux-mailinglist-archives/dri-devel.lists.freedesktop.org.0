Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E701D3AB6
	for <lists+dri-devel@lfdr.de>; Fri, 11 Oct 2019 10:18:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE9B36EBD3;
	Fri, 11 Oct 2019 08:18:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46B736E069;
 Fri, 11 Oct 2019 08:18:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 7D43618CB8E8;
 Fri, 11 Oct 2019 08:18:36 +0000 (UTC)
Received: from jason-ThinkPad-X1-Carbon-6th.redhat.com
 (ovpn-12-241.pek2.redhat.com [10.72.12.241])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C97D21001B08;
 Fri, 11 Oct 2019 08:18:10 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: kvm@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 kwankhede@nvidia.com, alex.williamson@redhat.com, mst@redhat.com,
 tiwei.bie@intel.com
Subject: [PATCH V3 3/7] modpost: add support for mdev class id
Date: Fri, 11 Oct 2019 16:15:53 +0800
Message-Id: <20191011081557.28302-4-jasowang@redhat.com>
In-Reply-To: <20191011081557.28302-1-jasowang@redhat.com>
References: <20191011081557.28302-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.63]); Fri, 11 Oct 2019 08:18:36 +0000 (UTC)
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
 zhihong.wang@intel.com, akrowiak@linux.ibm.com, netdev@vger.kernel.org,
 cohuck@redhat.com, oberpar@linux.ibm.com, maxime.coquelin@redhat.com,
 lingshan.zhu@intel.com
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
YwppbmRleCBmZDJhNGQ5YTNmMjYuLjg5MWNmODNhMmQ5YSAxMDA2NDQKLS0tIGEvZHJpdmVycy92
ZmlvL21kZXYvdmZpb19tZGV2LmMKKysrIGIvZHJpdmVycy92ZmlvL21kZXYvdmZpb19tZGV2LmMK
QEAgLTEyNSw2ICsxMjUsOCBAQCBzdGF0aWMgc3RydWN0IG1kZXZfY2xhc3NfaWQgaWRfdGFibGVb
XSA9IHsKIAl7IDAgfSwKIH07CiAKK01PRFVMRV9ERVZJQ0VfVEFCTEUobWRldiwgaWRfdGFibGUp
OworCiBzdGF0aWMgc3RydWN0IG1kZXZfZHJpdmVyIHZmaW9fbWRldl9kcml2ZXIgPSB7CiAJLm5h
bWUJPSAidmZpb19tZGV2IiwKIAkucHJvYmUJPSB2ZmlvX21kZXZfcHJvYmUsCmRpZmYgLS1naXQg
YS9zY3JpcHRzL21vZC9kZXZpY2V0YWJsZS1vZmZzZXRzLmMgYi9zY3JpcHRzL21vZC9kZXZpY2V0
YWJsZS1vZmZzZXRzLmMKaW5kZXggMDU0NDA1YjkwYmE0Li42Y2JiMTA2MjQ4OGEgMTAwNjQ0Ci0t
LSBhL3NjcmlwdHMvbW9kL2RldmljZXRhYmxlLW9mZnNldHMuYworKysgYi9zY3JpcHRzL21vZC9k
ZXZpY2V0YWJsZS1vZmZzZXRzLmMKQEAgLTIzMSw1ICsyMzEsOCBAQCBpbnQgbWFpbih2b2lkKQog
CURFVklEKHdtaV9kZXZpY2VfaWQpOwogCURFVklEX0ZJRUxEKHdtaV9kZXZpY2VfaWQsIGd1aWRf
c3RyaW5nKTsKIAorCURFVklEKG1kZXZfY2xhc3NfaWQpOworCURFVklEX0ZJRUxEKG1kZXZfY2xh
c3NfaWQsIGlkKTsKKwogCXJldHVybiAwOwogfQpkaWZmIC0tZ2l0IGEvc2NyaXB0cy9tb2QvZmls
ZTJhbGlhcy5jIGIvc2NyaXB0cy9tb2QvZmlsZTJhbGlhcy5jCmluZGV4IGM5MWViYTc1MTgwNC4u
ZDM2NWRmZTdjNzE4IDEwMDY0NAotLS0gYS9zY3JpcHRzL21vZC9maWxlMmFsaWFzLmMKKysrIGIv
c2NyaXB0cy9tb2QvZmlsZTJhbGlhcy5jCkBAIC0xMzM1LDYgKzEzMzUsMTUgQEAgc3RhdGljIGlu
dCBkb193bWlfZW50cnkoY29uc3QgY2hhciAqZmlsZW5hbWUsIHZvaWQgKnN5bXZhbCwgY2hhciAq
YWxpYXMpCiAJcmV0dXJuIDE7CiB9CiAKKy8qIGxvb2tzIGxpa2U6ICJtZGV2OmNOIiAqLworc3Rh
dGljIGludCBkb19tZGV2X2VudHJ5KGNvbnN0IGNoYXIgKmZpbGVuYW1lLCB2b2lkICpzeW12YWws
IGNoYXIgKmFsaWFzKQoreworCURFRl9GSUVMRChzeW12YWwsIG1kZXZfY2xhc3NfaWQsIGlkKTsK
KworCXNwcmludGYoYWxpYXMsICJtZGV2OmMlMDJYIiwgaWQpOworCXJldHVybiAxOworfQorCiAv
KiBEb2VzIG5hbWVsZW4gYnl0ZXMgb2YgbmFtZSBleGFjdGx5IG1hdGNoIHRoZSBzeW1ib2w/ICov
CiBzdGF0aWMgYm9vbCBzeW1faXMoY29uc3QgY2hhciAqbmFtZSwgdW5zaWduZWQgbmFtZWxlbiwg
Y29uc3QgY2hhciAqc3ltYm9sKQogewpAQCAtMTQwNyw2ICsxNDE2LDcgQEAgc3RhdGljIGNvbnN0
IHN0cnVjdCBkZXZ0YWJsZSBkZXZ0YWJsZVtdID0gewogCXsidHlwZWMiLCBTSVpFX3R5cGVjX2Rl
dmljZV9pZCwgZG9fdHlwZWNfZW50cnl9LAogCXsidGVlIiwgU0laRV90ZWVfY2xpZW50X2Rldmlj
ZV9pZCwgZG9fdGVlX2VudHJ5fSwKIAl7IndtaSIsIFNJWkVfd21pX2RldmljZV9pZCwgZG9fd21p
X2VudHJ5fSwKKwl7Im1kZXYiLCBTSVpFX21kZXZfY2xhc3NfaWQsIGRvX21kZXZfZW50cnl9LAog
fTsKIAogLyogQ3JlYXRlIE1PRFVMRV9BTElBUygpIHN0YXRlbWVudHMuCi0tIAoyLjE5LjEKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
