Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2D3AA8641
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2019 17:58:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 725A489C07;
	Wed,  4 Sep 2019 15:58:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 837EA89BFF
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Sep 2019 15:58:31 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AB24C233FF;
 Wed,  4 Sep 2019 15:58:30 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.2 36/94] drm/virtio: use virtio_max_dma_size
Date: Wed,  4 Sep 2019 11:56:41 -0400
Message-Id: <20190904155739.2816-36-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190904155739.2816-1-sashal@kernel.org>
References: <20190904155739.2816-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1567612711;
 bh=pk8YjyyRwMJOPfCa/yxcD7L3OlLFFCTVp2VRhcwJ2fw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=BU/ttMNS9pIUITNNX+AKHx9sdp45Y9CGYaVNBFKfmkklIIaaEocGx6KVx7Lg+Q+mC
 aIeGWhYjSo+8MygE6j83u4cA1vSdIpwzeKRayDcvJQbi+Zh5jzwLIQxyy/cttd+4yr
 ekkCU3r4CcJJJEETONTE/SfpCY2f+PFkbeJ4cDDg=
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
Cc: Sasha Levin <sashal@kernel.org>, Laszlo Ersek <lersek@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogR2VyZCBIb2ZmbWFubiA8a3JheGVsQHJlZGhhdC5jb20+CgpbIFVwc3RyZWFtIGNvbW1p
dCA5YjJhMGExZWY2NmY5NmJmMzQ5MjFhMzg2NTU4MWVjYTMyZmYwNWVjIF0KCldlIG11c3QgbWFr
ZSBzdXJlIG91ciBzY2F0dGVybGlzdCBzZWdtZW50cyBhcmUgbm90IHRvbyBiaWcsIG90aGVyd2lz
ZQp3ZSBtaWdodCBzZWUgc3dpb3RsYiBmYWlsdXJlcyAoaGFwcGVucyB3aXRoIHNldiwgYWxzbyBy
ZXByb2R1Y2FibGUgd2l0aApzd2lvdGxiPWZvcmNlKS4KClN1Z2dlc3RlZC1ieTogTGFzemxvIEVy
c2VrIDxsZXJzZWtAcmVkaGF0LmNvbT4KU2lnbmVkLW9mZi1ieTogR2VyZCBIb2ZmbWFubiA8a3Jh
eGVsQHJlZGhhdC5jb20+ClJldmlld2VkLWJ5OiBMYXN6bG8gRXJzZWsgPGxlcnNla0ByZWRoYXQu
Y29tPgpMaW5rOiBodHRwOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9wYXRjaC9tc2dpZC8y
MDE5MDgyMTExMTIxMC4yNzE2NS0xLWtyYXhlbEByZWRoYXQuY29tClNpZ25lZC1vZmYtYnk6IFNh
c2hhIExldmluIDxzYXNoYWxAa2VybmVsLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vdmlydGlv
L3ZpcnRncHVfb2JqZWN0LmMgfCAxMCArKysrKysrKy0tCiAxIGZpbGUgY2hhbmdlZCwgOCBpbnNl
cnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS92
aXJ0aW8vdmlydGdwdV9vYmplY3QuYyBiL2RyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9v
YmplY3QuYwppbmRleCBiMmRhMzEzMTBkMjRjLi4wOWI1MjY1MThmNWE2IDEwMDY0NAotLS0gYS9k
cml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfb2JqZWN0LmMKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL3ZpcnRpby92aXJ0Z3B1X29iamVjdC5jCkBAIC0yMDQsNiArMjA0LDcgQEAgaW50IHZpcnRp
b19ncHVfb2JqZWN0X2dldF9zZ190YWJsZShzdHJ1Y3QgdmlydGlvX2dwdV9kZXZpY2UgKnFkZXYs
CiAJCS5pbnRlcnJ1cHRpYmxlID0gZmFsc2UsCiAJCS5ub193YWl0X2dwdSA9IGZhbHNlCiAJfTsK
KwlzaXplX3QgbWF4X3NlZ21lbnQ7CiAKIAkvKiB3dGYgc3dhcHBpbmcgKi8KIAlpZiAoYm8tPnBh
Z2VzKQpAQCAtMjE1LDggKzIxNiwxMyBAQCBpbnQgdmlydGlvX2dwdV9vYmplY3RfZ2V0X3NnX3Rh
YmxlKHN0cnVjdCB2aXJ0aW9fZ3B1X2RldmljZSAqcWRldiwKIAlpZiAoIWJvLT5wYWdlcykKIAkJ
Z290byBvdXQ7CiAKLQlyZXQgPSBzZ19hbGxvY190YWJsZV9mcm9tX3BhZ2VzKGJvLT5wYWdlcywg
cGFnZXMsIG5yX3BhZ2VzLCAwLAotCQkJCQlucl9wYWdlcyA8PCBQQUdFX1NISUZULCBHRlBfS0VS
TkVMKTsKKwltYXhfc2VnbWVudCA9IHZpcnRpb19tYXhfZG1hX3NpemUocWRldi0+dmRldik7CisJ
bWF4X3NlZ21lbnQgJj0gUEFHRV9NQVNLOworCWlmIChtYXhfc2VnbWVudCA+IFNDQVRURVJMSVNU
X01BWF9TRUdNRU5UKQorCQltYXhfc2VnbWVudCA9IFNDQVRURVJMSVNUX01BWF9TRUdNRU5UOwor
CXJldCA9IF9fc2dfYWxsb2NfdGFibGVfZnJvbV9wYWdlcyhiby0+cGFnZXMsIHBhZ2VzLCBucl9w
YWdlcywgMCwKKwkJCQkJICBucl9wYWdlcyA8PCBQQUdFX1NISUZULAorCQkJCQkgIG1heF9zZWdt
ZW50LCBHRlBfS0VSTkVMKTsKIAlpZiAocmV0KQogCQlnb3RvIG91dDsKIAlyZXR1cm4gMDsKLS0g
CjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
