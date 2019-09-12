Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 06FD3B0B9C
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2019 11:40:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70FC86EC82;
	Thu, 12 Sep 2019 09:40:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DBB36EBEC;
 Thu, 12 Sep 2019 09:40:32 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 9D954308FBFC;
 Thu, 12 Sep 2019 09:40:31 +0000 (UTC)
Received: from jason-ThinkPad-X1-Carbon-6th.redhat.com
 (ovpn-12-89.pek2.redhat.com [10.72.12.89])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 376B860852;
 Thu, 12 Sep 2019 09:40:14 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: kvm@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 kwankhede@nvidia.com, alex.williamson@redhat.com
Subject: [RFC PATCH 0/2] Mdev: support mutiple kinds of devices
Date: Thu, 12 Sep 2019 17:40:10 +0800
Message-Id: <20190912094012.29653-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.43]); Thu, 12 Sep 2019 09:40:32 +0000 (UTC)
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
Cc: sebott@linux.ibm.com, mst@redhat.com, airlied@linux.ie,
 Jason Wang <jasowang@redhat.com>, heiko.carstens@de.ibm.com,
 virtualization@lists.linux-foundation.org, rob.miller@broadcom.com,
 pasic@linux.ibm.com, borntraeger@de.ibm.com, zhi.a.wang@intel.com,
 farman@linux.ibm.com, idos@mellanox.com, gor@linux.ibm.com,
 cunming.liang@intel.com, xiao.w.wang@intel.com, freude@linux.ibm.com,
 rodrigo.vivi@intel.com, lingshan.zhu@intel.com, akrowiak@linux.ibm.com,
 tiwei.bie@intel.com, pmorel@linux.ibm.com, cohuck@redhat.com,
 oberpar@linux.ibm.com, maxime.coquelin@redhat.com, zhihong.wang@intel.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgYWxsOgoKRHVyaW5nIHRoZSBkZXZlbG9wbWVudCBvZiB2aXJ0aW8tbWRldlsxXS4gSSBmaW5k
IHRoYXQgbWRldiBuZWVkcyB0byBiZQpleHRlbmRlZCB0byBzdXBwb3J0IGRldmljZXMgb3RoZXIg
dGhhbiB2ZmlvIG1kZXYgZGV2aWNlLiBTbyB0aGlzCnNlcmllcyB0cmllcyB0byBleHRlbmQgdGhl
IG1kZXYgdG8gYmUgYWJsZSB0byBkaWZmZXIgZnJvbSBkaWZmZXJlbnQKZGV2aWNlcyBieToKCi0g
ZGV2aWNlIGlkIGFuZCBtYXRjaGluZyBmb3IgbWRldiBidXMKLSBkZXZpY2Ugc3BlaWNmaWMgY2Fs
bGJhY2tzIGFuZCBtb3ZlIHZmaW8gY2FsbGJhY2tzIHRoZXJlCgpTZW50IGZvciBlYXJseSByZWl2
ZXcsIGNvbXBpbGUgdGVzdCBvbmx5IQoKVGhhbmtzCgpbMV0gaHR0cHM6Ly9sa21sLm9yZy9sa21s
LzIwMTkvOS8xMC8xMzUKCkphc29uIFdhbmcgKDIpOgogIG1kZXY6IGRldmljZSBpZCBzdXBwb3J0
CiAgbWRldjogaW50cm9kdWNlIGRldmljZSBzcGVjaWZpYyBvcHMKCiBkcml2ZXJzL2dwdS9kcm0v
aTkxNS9ndnQva3ZtZ3QuYyAgfCAxNiArKysrLS0tCiBkcml2ZXJzL3MzOTAvY2lvL3ZmaW9fY2N3
X29wcy5jICAgfCAxNiArKysrLS0tCiBkcml2ZXJzL3MzOTAvY3J5cHRvL3ZmaW9fYXBfb3BzLmMg
fCAxMyArKysrLS0KIGRyaXZlcnMvdmZpby9tZGV2L21kZXZfY29yZS5jICAgICB8IDE0ICsrKysr
LQogZHJpdmVycy92ZmlvL21kZXYvbWRldl9kcml2ZXIuYyAgIHwgMTQgKysrKysrCiBkcml2ZXJz
L3ZmaW8vbWRldi9tZGV2X3ByaXZhdGUuaCAgfCAgMSArCiBkcml2ZXJzL3ZmaW8vbWRldi92Zmlv
X21kZXYuYyAgICAgfCAzNiArKysrKysrKysrLS0tLS0KIGluY2x1ZGUvbGludXgvbWRldi5oICAg
ICAgICAgICAgICB8IDc2ICsrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0KIGluY2x1ZGUv
bGludXgvbW9kX2RldmljZXRhYmxlLmggICB8ICA2ICsrKwogc2FtcGxlcy92ZmlvLW1kZXYvbWJv
Y2hzLmMgICAgICAgIHwgMTggKysrKystLS0KIHNhbXBsZXMvdmZpby1tZGV2L21kcHkuYyAgICAg
ICAgICB8IDE4ICsrKysrLS0tCiBzYW1wbGVzL3ZmaW8tbWRldi9tdHR5LmMgICAgICAgICAgfCAx
NiArKysrLS0tCiAxMiBmaWxlcyBjaGFuZ2VkLCAxNjMgaW5zZXJ0aW9ucygrKSwgODEgZGVsZXRp
b25zKC0pCgotLSAKMi4xOS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
