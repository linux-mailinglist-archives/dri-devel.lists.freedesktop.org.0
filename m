Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 19849E97E1
	for <lists+dri-devel@lfdr.de>; Wed, 30 Oct 2019 09:15:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AF906ECCF;
	Wed, 30 Oct 2019 08:14:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 485866E8A7;
 Wed, 30 Oct 2019 07:36:44 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 30 Oct 2019 00:36:43 -0700
X-IronPort-AV: E=Sophos;i="5.68,246,1569308400"; d="scan'208";a="193881565"
Received: from lingshan-mobl5.ccr.corp.intel.com (HELO [10.238.129.48])
 ([10.238.129.48])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-SHA;
 30 Oct 2019 00:36:33 -0700
Subject: Re: [PATCH V5 4/6] mdev: introduce virtio device and its device ops
To: Jason Wang <jasowang@redhat.com>, kvm@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, kwankhede@nvidia.com,
 alex.williamson@redhat.com, mst@redhat.com, tiwei.bie@intel.com
References: <20191023130752.18980-1-jasowang@redhat.com>
 <20191023130752.18980-5-jasowang@redhat.com>
 <df1eb77c-d159-da11-bb8f-df2c19089ac6@linux.intel.com>
 <14410ac9-cc01-185a-5dcf-7f6c78aefd65@redhat.com>
From: Zhu Lingshan <lingshan.zhu@linux.intel.com>
Message-ID: <bc6b2565-b0b6-bf0a-812f-d0bb157be086@linux.intel.com>
Date: Wed, 30 Oct 2019 15:36:24 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <14410ac9-cc01-185a-5dcf-7f6c78aefd65@redhat.com>
Content-Language: en-US
X-Mailman-Approved-At: Wed, 30 Oct 2019 08:14:00 +0000
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
 heiko.carstens@de.ibm.com, kevin.tian@intel.com,
 virtualization@lists.linux-foundation.org, rob.miller@broadcom.com,
 lulu@redhat.com, eperezma@redhat.com, pasic@linux.ibm.com,
 borntraeger@de.ibm.com, haotian.wang@sifive.com, zhi.a.wang@intel.com,
 farman@linux.ibm.com, idos@mellanox.com, gor@linux.ibm.com,
 cunming.liang@intel.com, rodrigo.vivi@intel.com, xiao.w.wang@intel.com,
 freude@linux.ibm.com, parav@mellanox.com, zhihong.wang@intel.com,
 stefanha@redhat.com, akrowiak@linux.ibm.com, netdev@vger.kernel.org,
 cohuck@redhat.com, oberpar@linux.ibm.com, maxime.coquelin@redhat.com,
 lingshan.zhu@intel.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTAvMjkvMjAxOSA2OjQyIFBNLCBKYXNvbiBXYW5nIHdyb3RlOgo+IE9uIDIwMTkvMTAvMjkg
5LiL5Y2IMzo0MiwgWmh1IExpbmdzaGFuIHdyb3RlOgo+Pj4gK8KgwqDCoCB2b2lkICgqc2V0X3N0
YXR1cykoc3RydWN0IG1kZXZfZGV2aWNlICptZGV2LCB1OCBzdGF0dXMpOwo+PiBIaSBKYXNvbgo+
Pgo+PiBJcyBpdCBwb3NzaWJsZSB0byBtYWtlIHNldF9zdGF0dXMoKSByZXR1cm4gYW4gdTggb3Ig
Ym9vbCwgYmVjYXVzZSB0aGlzCj4+IG1heSBmYWlsIGluIHJlYWwgaGFyZHdhcmUuIFdpdGhvdXQg
YSByZXR1cm5lZCBjb2RlLCBJIGFtIG5vdCBzdXJlCj4+IHdoZXRoZXIgaXQgaXMgYSBnb29kIGlk
ZWEgdG8gc2V0IHRoZSBzdGF0dXMgfCBORUVEX1JFU0VUIHdoZW4gZmFpbC4KPj4KPj4gVGhhbmtz
LAo+PiBCUgo+PiBaaHUgTGluZ3NoYW4KPgo+IEhpOgo+Cj4KPiBJdCdzIHBvc3NpYmxlIGJ1dCBJ
J20gbm90IHN1cmUgd2hldGhlciBhbnkgdXNlciB3aWxsIGNhcmUgYWJvdXQgaXQuIEUuZwo+IHNl
ZSB2aXJ0aW9fYWRkX3N0YXR1cygpOgo+Cj4gdm9pZCB2aXJ0aW9fYWRkX3N0YXR1cyhzdHJ1Y3Qg
dmlydGlvX2RldmljZSAqZGV2LCB1bnNpZ25lZCBpbnQgc3RhdHVzKQo+IHsKPiAgwqDCoMKgIG1p
Z2h0X3NsZWVwKCk7Cj4gIMKgwqDCoCBkZXYtPmNvbmZpZy0+c2V0X3N0YXR1cyhkZXYsIGRldi0+
Y29uZmlnLT5nZXRfc3RhdHVzKGRldikgfCBzdGF0dXMpOwo+IH0KPiBFWFBPUlRfU1lNQk9MX0dQ
TCh2aXJ0aW9fYWRkX3N0YXR1cyk7Cj4KPiBBbmQgSSBiZWxpZXZlIGhvdyBpdCB3b3JrIHNob3Vs
ZCBiZToKPgo+IHZpcnRpb19hZGRfc3RhdHVzKHh5eik7Cj4KPiBzdGF0dXMgPSB2aXJ0aW9fZ2V0
X3N0YXR1cygpOwo+Cj4gaWYgKCEoc3RhdHVzICYgeHl6KSkKPgo+ICDCoMKgwqAgZXJyb3I7Cj4K
PiBUaGFua3MKPgpUaGFua3MgSmFzb24sIHRoZW4gSSBiZWxpZXZlIHVwcGVyIGxheWVyIGNhbiBo
YW5kbGUgdGhpcyB3ZWxsLgo+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
