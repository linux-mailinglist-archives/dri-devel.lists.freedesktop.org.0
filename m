Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EDA4F41EA
	for <lists+dri-devel@lfdr.de>; Fri,  8 Nov 2019 09:14:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 983566F89C;
	Fri,  8 Nov 2019 08:14:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate15.nvidia.com (hqemgate15.nvidia.com [216.228.121.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41D6C6E4EC;
 Thu,  7 Nov 2019 19:37:12 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5dc4722b0000>; Thu, 07 Nov 2019 11:36:11 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Thu, 07 Nov 2019 11:37:11 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Thu, 07 Nov 2019 11:37:11 -0800
Received: from [10.25.75.102] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 7 Nov
 2019 19:36:46 +0000
Subject: Re: [PATCH V11 2/6] modpost: add support for mdev class id
To: Jason Wang <jasowang@redhat.com>, <kvm@vger.kernel.org>,
 <linux-s390@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <intel-gvt-dev@lists.freedesktop.org>, <alex.williamson@redhat.com>,
 <mst@redhat.com>, <tiwei.bie@intel.com>
References: <20191107151109.23261-1-jasowang@redhat.com>
 <20191107151109.23261-3-jasowang@redhat.com>
X-Nvconfidentiality: public
From: Kirti Wankhede <kwankhede@nvidia.com>
Message-ID: <89d87e49-e7ee-f3c4-0b81-1c5fba14959b@nvidia.com>
Date: Fri, 8 Nov 2019 01:06:40 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <20191107151109.23261-3-jasowang@redhat.com>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
X-Mailman-Approved-At: Fri, 08 Nov 2019 08:12:31 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1573155371; bh=C2IiKLCi5MxuqQL+UTo7qPQFnl5cEfi56SIRvfy2YGM=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=ifafetc69TFDlF+u0W/mHtbNzRQR/osuovOIreTBgk1lhGdLJNjFu5Bk9mrqxjrEb
 d1FRJReVeAsawZC6zhQags+JTG3PbB4NaENHsEBOVclHToJF9KJYSdYyTM3Z7wqYR5
 Cu9861xR9tSSBHvKUTxcCRHz5x9gpw5qk6WPOuXEMV72OgwdkmPUN3jeB+StDQGHhb
 +wKc7iPQF/2NZVTfiK+OWuFpP8SvJP0SX8lNSbUxipwIAHaqMSicwHEX95dJVMXWfD
 AOKSQbVbqm5uT31bTnxX1B7X9/QhlnNUl9r6dHEo7JVXMUWexHbp1Po2Kr1dgK4HFH
 UhKKQJREHZIgQ==
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
Cc: rdunlap@infradead.org, christophe.de.dinechin@gmail.com,
 sebott@linux.ibm.com, airlied@linux.ie, heiko.carstens@de.ibm.com,
 kevin.tian@intel.com, virtualization@lists.linux-foundation.org,
 rob.miller@broadcom.com, lulu@redhat.com, eperezma@redhat.com,
 pasic@linux.ibm.com, borntraeger@de.ibm.com, haotian.wang@sifive.com,
 zhi.a.wang@intel.com, farman@linux.ibm.com, parav@mellanox.com,
 gor@linux.ibm.com, cunming.liang@intel.com, rodrigo.vivi@intel.com,
 xiao.w.wang@intel.com, freude@linux.ibm.com, stefanha@redhat.com,
 zhihong.wang@intel.com, akrowiak@linux.ibm.com, netdev@vger.kernel.org,
 cohuck@redhat.com, oberpar@linux.ibm.com, maxime.coquelin@redhat.com,
 lingshan.zhu@intel.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpPbiAxMS83LzIwMTkgODo0MSBQTSwgSmFzb24gV2FuZyB3cm90ZToKPiBBZGQgc3VwcG9ydCB0
byBwYXJzZSBtZGV2IGNsYXNzIGlkIHRhYmxlLgo+IAo+IFJldmlld2VkLWJ5OiBQYXJhdiBQYW5k
aXQgPHBhcmF2QG1lbGxhbm94LmNvbT4KPiBSZXZpZXdlZC1ieTogQ29ybmVsaWEgSHVjayA8Y29o
dWNrQHJlZGhhdC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogSmFzb24gV2FuZyA8amFzb3dhbmdAcmVk
aGF0LmNvbT4KClJldmlld2VkLWJ5OiBLaXJ0aSBXYW5raGVkZSA8a3dhbmtoZWRlQG52aWRpYS5j
b20+CgpUaGFua3MsCktpcnRpCgo+IC0tLQo+ICAgZHJpdmVycy92ZmlvL21kZXYvdmZpb19tZGV2
LmMgICAgIHwgIDIgKysKPiAgIHNjcmlwdHMvbW9kL2RldmljZXRhYmxlLW9mZnNldHMuYyB8ICAz
ICsrKwo+ICAgc2NyaXB0cy9tb2QvZmlsZTJhbGlhcy5jICAgICAgICAgIHwgMTEgKysrKysrKysr
KysKPiAgIDMgZmlsZXMgY2hhbmdlZCwgMTYgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL3ZmaW8vbWRldi92ZmlvX21kZXYuYyBiL2RyaXZlcnMvdmZpby9tZGV2L3ZmaW9f
bWRldi5jCj4gaW5kZXggMzg0MzFlOWVmN2Y1Li5hNjY0MWNkOGI1YTMgMTAwNjQ0Cj4gLS0tIGEv
ZHJpdmVycy92ZmlvL21kZXYvdmZpb19tZGV2LmMKPiArKysgYi9kcml2ZXJzL3ZmaW8vbWRldi92
ZmlvX21kZXYuYwo+IEBAIC0xMjUsNiArMTI1LDggQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBtZGV2
X2NsYXNzX2lkIHZmaW9faWRfdGFibGVbXSA9IHsKPiAgIAl7IDAgfSwKPiAgIH07Cj4gICAKPiAr
TU9EVUxFX0RFVklDRV9UQUJMRShtZGV2LCB2ZmlvX2lkX3RhYmxlKTsKPiArCj4gICBzdGF0aWMg
c3RydWN0IG1kZXZfZHJpdmVyIHZmaW9fbWRldl9kcml2ZXIgPSB7Cj4gICAJLm5hbWUJPSAidmZp
b19tZGV2IiwKPiAgIAkucHJvYmUJPSB2ZmlvX21kZXZfcHJvYmUsCj4gZGlmZiAtLWdpdCBhL3Nj
cmlwdHMvbW9kL2RldmljZXRhYmxlLW9mZnNldHMuYyBiL3NjcmlwdHMvbW9kL2RldmljZXRhYmxl
LW9mZnNldHMuYwo+IGluZGV4IDA1NDQwNWI5MGJhNC4uNmNiYjEwNjI0ODhhIDEwMDY0NAo+IC0t
LSBhL3NjcmlwdHMvbW9kL2RldmljZXRhYmxlLW9mZnNldHMuYwo+ICsrKyBiL3NjcmlwdHMvbW9k
L2RldmljZXRhYmxlLW9mZnNldHMuYwo+IEBAIC0yMzEsNSArMjMxLDggQEAgaW50IG1haW4odm9p
ZCkKPiAgIAlERVZJRCh3bWlfZGV2aWNlX2lkKTsKPiAgIAlERVZJRF9GSUVMRCh3bWlfZGV2aWNl
X2lkLCBndWlkX3N0cmluZyk7Cj4gICAKPiArCURFVklEKG1kZXZfY2xhc3NfaWQpOwo+ICsJREVW
SURfRklFTEQobWRldl9jbGFzc19pZCwgaWQpOwo+ICsKPiAgIAlyZXR1cm4gMDsKPiAgIH0KPiBk
aWZmIC0tZ2l0IGEvc2NyaXB0cy9tb2QvZmlsZTJhbGlhcy5jIGIvc2NyaXB0cy9tb2QvZmlsZTJh
bGlhcy5jCj4gaW5kZXggYzkxZWJhNzUxODA0Li40NWYxYzIyZjQ5YmUgMTAwNjQ0Cj4gLS0tIGEv
c2NyaXB0cy9tb2QvZmlsZTJhbGlhcy5jCj4gKysrIGIvc2NyaXB0cy9tb2QvZmlsZTJhbGlhcy5j
Cj4gQEAgLTEzMzUsNiArMTMzNSwxNiBAQCBzdGF0aWMgaW50IGRvX3dtaV9lbnRyeShjb25zdCBj
aGFyICpmaWxlbmFtZSwgdm9pZCAqc3ltdmFsLCBjaGFyICphbGlhcykKPiAgIAlyZXR1cm4gMTsK
PiAgIH0KPiAgIAo+ICsvKiBsb29rcyBsaWtlOiAibWRldjpjTiIgKi8KPiArc3RhdGljIGludCBk
b19tZGV2X2VudHJ5KGNvbnN0IGNoYXIgKmZpbGVuYW1lLCB2b2lkICpzeW12YWwsIGNoYXIgKmFs
aWFzKQo+ICt7Cj4gKwlERUZfRklFTEQoc3ltdmFsLCBtZGV2X2NsYXNzX2lkLCBpZCk7Cj4gKwo+
ICsJc3ByaW50ZihhbGlhcywgIm1kZXY6YyUwMlgiLCBpZCk7Cj4gKwlhZGRfd2lsZGNhcmQoYWxp
YXMpOwo+ICsJcmV0dXJuIDE7Cj4gK30KPiArCj4gICAvKiBEb2VzIG5hbWVsZW4gYnl0ZXMgb2Yg
bmFtZSBleGFjdGx5IG1hdGNoIHRoZSBzeW1ib2w/ICovCj4gICBzdGF0aWMgYm9vbCBzeW1faXMo
Y29uc3QgY2hhciAqbmFtZSwgdW5zaWduZWQgbmFtZWxlbiwgY29uc3QgY2hhciAqc3ltYm9sKQo+
ICAgewo+IEBAIC0xNDA3LDYgKzE0MTcsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGRldnRhYmxl
IGRldnRhYmxlW10gPSB7Cj4gICAJeyJ0eXBlYyIsIFNJWkVfdHlwZWNfZGV2aWNlX2lkLCBkb190
eXBlY19lbnRyeX0sCj4gICAJeyJ0ZWUiLCBTSVpFX3RlZV9jbGllbnRfZGV2aWNlX2lkLCBkb190
ZWVfZW50cnl9LAo+ICAgCXsid21pIiwgU0laRV93bWlfZGV2aWNlX2lkLCBkb193bWlfZW50cnl9
LAo+ICsJeyJtZGV2IiwgU0laRV9tZGV2X2NsYXNzX2lkLCBkb19tZGV2X2VudHJ5fSwKPiAgIH07
Cj4gICAKPiAgIC8qIENyZWF0ZSBNT0RVTEVfQUxJQVMoKSBzdGF0ZW1lbnRzLgo+IApfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
