Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF09310A034
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2019 15:25:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B1AA6E165;
	Tue, 26 Nov 2019 14:25:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mblankhorst.nl (mblankhorst.nl [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23E1F6E111
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Nov 2019 14:25:20 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] udmabuf: Remove deleted map/unmap handlers.
Date: Tue, 26 Nov 2019 15:25:16 +0100
Message-Id: <20191126142516.630200-1-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.24.0
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
Cc: linaro-mm-sig@lists.linaro.org, Daniel Vetter <daniel.vetter@intel.com>,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Q29tbWl0IDdmMGRlOGQ4MDgxNiAoImRtYS1idWY6IERyb3AgZG1hX2J1Zl9rKHVuKW1hcCIpIHJl
bW92ZWQgbWFwL3VubWFwCmhhbmRsZXJzLCBidXQgdGhleSBzdGlsbCBleGlzdGVkIGluIHVkbWFi
dWYuIFJlbW92ZSB0aGVtIHRoZXJlIGFzIHdlbGwKClNpZ25lZC1vZmYtYnk6IE1hYXJ0ZW4gTGFu
a2hvcnN0IDxtYWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRlbC5jb20+CkZpeGVzOiA3ZjBkZThk
ODA4MTYgKCJkbWEtYnVmOiBEcm9wIGRtYV9idWZfayh1biltYXAiKQpDYzogU3VtaXQgU2Vtd2Fs
IDxzdW1pdC5zZW13YWxAbGluYXJvLm9yZz4KQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0
ZXJAaW50ZWwuY29tPgpDYzogbGludXgtbWVkaWFAdmdlci5rZXJuZWwub3JnCkNjOiBsaW5hcm8t
bW0tc2lnQGxpc3RzLmxpbmFyby5vcmcKQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKLS0tCiBkcml2ZXJzL2RtYS1idWYvdWRtYWJ1Zi5jIHwgMTYgLS0tLS0tLS0tLS0tLS0tLQog
MSBmaWxlIGNoYW5nZWQsIDE2IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZG1h
LWJ1Zi91ZG1hYnVmLmMgYi9kcml2ZXJzL2RtYS1idWYvdWRtYWJ1Zi5jCmluZGV4IDk2MzU4OTc0
NThhMC4uOWRlNTM5YzFkZWY0IDEwMDY0NAotLS0gYS9kcml2ZXJzL2RtYS1idWYvdWRtYWJ1Zi5j
CisrKyBiL2RyaXZlcnMvZG1hLWJ1Zi91ZG1hYnVmLmMKQEAgLTkzLDI2ICs5MywxMCBAQCBzdGF0
aWMgdm9pZCByZWxlYXNlX3VkbWFidWYoc3RydWN0IGRtYV9idWYgKmJ1ZikKIAlrZnJlZSh1YnVm
KTsKIH0KIAotc3RhdGljIHZvaWQgKmttYXBfdWRtYWJ1ZihzdHJ1Y3QgZG1hX2J1ZiAqYnVmLCB1
bnNpZ25lZCBsb25nIHBhZ2VfbnVtKQotewotCXN0cnVjdCB1ZG1hYnVmICp1YnVmID0gYnVmLT5w
cml2OwotCXN0cnVjdCBwYWdlICpwYWdlID0gdWJ1Zi0+cGFnZXNbcGFnZV9udW1dOwotCi0JcmV0
dXJuIGttYXAocGFnZSk7Ci19Ci0KLXN0YXRpYyB2b2lkIGt1bm1hcF91ZG1hYnVmKHN0cnVjdCBk
bWFfYnVmICpidWYsIHVuc2lnbmVkIGxvbmcgcGFnZV9udW0sCi0JCQkgICB2b2lkICp2YWRkcikK
LXsKLQlrdW5tYXAodmFkZHIpOwotfQotCiBzdGF0aWMgY29uc3Qgc3RydWN0IGRtYV9idWZfb3Bz
IHVkbWFidWZfb3BzID0gewogCS5tYXBfZG1hX2J1ZgkgID0gbWFwX3VkbWFidWYsCiAJLnVubWFw
X2RtYV9idWYJICA9IHVubWFwX3VkbWFidWYsCiAJLnJlbGVhc2UJICA9IHJlbGVhc2VfdWRtYWJ1
ZiwKLQkubWFwCQkgID0ga21hcF91ZG1hYnVmLAotCS51bm1hcAkJICA9IGt1bm1hcF91ZG1hYnVm
LAogCS5tbWFwCQkgID0gbW1hcF91ZG1hYnVmLAogfTsKIAotLSAKMi4yNC4wCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
