Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E696DA75F
	for <lists+dri-devel@lfdr.de>; Thu, 17 Oct 2019 10:28:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03B8D6E462;
	Thu, 17 Oct 2019 08:28:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B4326E456;
 Thu, 17 Oct 2019 08:28:12 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 6813018CB90E;
 Thu, 17 Oct 2019 08:28:11 +0000 (UTC)
Received: from [10.72.12.185] (ovpn-12-185.pek2.redhat.com [10.72.12.185])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6719F60BE1;
 Thu, 17 Oct 2019 08:27:43 +0000 (UTC)
Subject: Re: [PATCH V3 1/7] mdev: class id support
To: Parav Pandit <parav@mellanox.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "kwankhede@nvidia.com" <kwankhede@nvidia.com>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "mst@redhat.com" <mst@redhat.com>, "tiwei.bie@intel.com"
 <tiwei.bie@intel.com>
References: <20191011081557.28302-1-jasowang@redhat.com>
 <20191011081557.28302-2-jasowang@redhat.com>
 <AM0PR05MB4866481AEE614FDF766C6A25D1920@AM0PR05MB4866.eurprd05.prod.outlook.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <67b645a6-1b70-094d-6a12-fc6591e07a13@redhat.com>
Date: Thu, 17 Oct 2019 16:27:41 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <AM0PR05MB4866481AEE614FDF766C6A25D1920@AM0PR05MB4866.eurprd05.prod.outlook.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.63]); Thu, 17 Oct 2019 08:28:12 +0000 (UTC)
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
Cc: "christophe.de.dinechin@gmail.com" <christophe.de.dinechin@gmail.com>,
 "sebott@linux.ibm.com" <sebott@linux.ibm.com>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "heiko.carstens@de.ibm.com" <heiko.carstens@de.ibm.com>,
 "kevin.tian@intel.com" <kevin.tian@intel.com>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 "rob.miller@broadcom.com" <rob.miller@broadcom.com>,
 "lulu@redhat.com" <lulu@redhat.com>,
 "eperezma@redhat.com" <eperezma@redhat.com>,
 "pasic@linux.ibm.com" <pasic@linux.ibm.com>,
 "borntraeger@de.ibm.com" <borntraeger@de.ibm.com>,
 "haotian.wang@sifive.com" <haotian.wang@sifive.com>,
 "zhi.a.wang@intel.com" <zhi.a.wang@intel.com>,
 "farman@linux.ibm.com" <farman@linux.ibm.com>, Ido Shamay <idos@mellanox.com>,
 "gor@linux.ibm.com" <gor@linux.ibm.com>,
 "cunming.liang@intel.com" <cunming.liang@intel.com>,
 "rodrigo.vivi@intel.com" <rodrigo.vivi@intel.com>,
 "xiao.w.wang@intel.com" <xiao.w.wang@intel.com>,
 "freude@linux.ibm.com" <freude@linux.ibm.com>,
 "zhihong.wang@intel.com" <zhihong.wang@intel.com>,
 "akrowiak@linux.ibm.com" <akrowiak@linux.ibm.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "oberpar@linux.ibm.com" <oberpar@linux.ibm.com>,
 "maxime.coquelin@redhat.com" <maxime.coquelin@redhat.com>,
 "lingshan.zhu@intel.com" <lingshan.zhu@intel.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDIwMTkvMTAvMTYg5LiL5Y2IMTI6NTcsIFBhcmF2IFBhbmRpdCB3cm90ZToKPj4gK3N0YXRp
YyBzdHJ1Y3QgbWRldl9jbGFzc19pZCBpZF90YWJsZVtdID0gewo+IHN0YXRpYyBjb25zdAo+Cj4+
ICsJeyBNREVWX0lEX1ZGSU8gfSwKPiBJIGd1ZXNzIHlvdSBkb24ndCBuZWVkIGV4dHJhIGJyYWNl
cyBmb3IgZWFjaCBlbnRyeS4KPiBTaW5jZSB0aGlzIGVudW0gcmVwcmVzZW50cyBNREVWIGNsYXNz
IGlkLCBpdCBiZXR0ZXIgdG8gbmFtZSBpdCBhcyBNREVWX0NMQVNTX0lEX1ZGSU8uCj4gKFNpbWls
YXIgdG8gIFBDSV9WRU5ET1JfSUQsIFBDSV9ERVZJQ0VfSUQpLi4KPgoKR2NjIHN0YXJ0IHRvIGNv
bXBsYWluIGxpa2U6Cgp3YXJuaW5nOiBtaXNzaW5nIGJyYWNlcyBhcm91bmQgaW5pdGlhbGl6ZXIg
Wy1XbWlzc2luZy1icmFjZXNdCiDCoHN0YXRpYyBjb25zdCBzdHJ1Y3QgbWRldl9jbGFzc19pZCBp
ZF90YWJsZVtdID0gewogwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBeCiDC
oCBNREVWX0lEX1ZGSU8sIDAsCiDCoCB7wqDCoMKgwqDCoMKgwqDCoMKgwqAgfSB7CiDCoH07CiDC
oH0KClNvIEkgd2lsbCBrZWVwIHRoaXMgcGFydCB1bnRvdWNoZWQuCgpUaGFua3MKCgo+PiArCXsg
MCB9LAo+PiArfTsKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
