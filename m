Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B07ADA7AF
	for <lists+dri-devel@lfdr.de>; Thu, 17 Oct 2019 10:46:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 288786EA0C;
	Thu, 17 Oct 2019 08:46:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B551D6EA0A;
 Thu, 17 Oct 2019 08:46:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id B183918C8933;
 Thu, 17 Oct 2019 08:46:40 +0000 (UTC)
Received: from [10.72.12.185] (ovpn-12-185.pek2.redhat.com [10.72.12.185])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5716B600CC;
 Thu, 17 Oct 2019 08:46:22 +0000 (UTC)
Subject: Re: [PATCH V3 4/7] mdev: introduce device specific ops
To: Cornelia Huck <cohuck@redhat.com>
References: <20191011081557.28302-1-jasowang@redhat.com>
 <20191011081557.28302-5-jasowang@redhat.com>
 <20191015124137.4f948bd2.cohuck@redhat.com>
 <eb7ecd99-7465-6be4-7ecd-84c11f66e0ac@redhat.com>
 <20191015112646.3776dc29@x1.home>
 <AM0PR05MB4866954855AF080639ED2384D1920@AM0PR05MB4866.eurprd05.prod.outlook.com>
 <20191016105232.663dd3c9.cohuck@redhat.com>
 <AM0PR05MB486625E53B8ADBA2BBAA80F6D1920@AM0PR05MB4866.eurprd05.prod.outlook.com>
 <20191016105303.6e01936f@x1.home>
 <4886a6cd-a165-05b7-9f62-175076bbb2ba@redhat.com>
 <20191017104516.52374ab6.cohuck@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <08e67f0d-adb3-a99c-a14d-4fec6d52209f@redhat.com>
Date: Thu, 17 Oct 2019 16:46:20 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191017104516.52374ab6.cohuck@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.70]); Thu, 17 Oct 2019 08:46:41 +0000 (UTC)
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
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>, "mst@redhat.com" <mst@redhat.com>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "heiko.carstens@de.ibm.com" <heiko.carstens@de.ibm.com>,
 "kevin.tian@intel.com" <kevin.tian@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 "kwankhede@nvidia.com" <kwankhede@nvidia.com>,
 "rob.miller@broadcom.com" <rob.miller@broadcom.com>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "sebott@linux.ibm.com" <sebott@linux.ibm.com>,
 "lulu@redhat.com" <lulu@redhat.com>,
 "eperezma@redhat.com" <eperezma@redhat.com>,
 "pasic@linux.ibm.com" <pasic@linux.ibm.com>,
 "borntraeger@de.ibm.com" <borntraeger@de.ibm.com>,
 "haotian.wang@sifive.com" <haotian.wang@sifive.com>,
 "cunming.liang@intel.com" <cunming.liang@intel.com>,
 "zhi.a.wang@intel.com" <zhi.a.wang@intel.com>,
 "farman@linux.ibm.com" <farman@linux.ibm.com>,
 Parav Pandit <parav@mellanox.com>, "gor@linux.ibm.com" <gor@linux.ibm.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 "xiao.w.wang@intel.com" <xiao.w.wang@intel.com>,
 "freude@linux.ibm.com" <freude@linux.ibm.com>,
 "zhihong.wang@intel.com" <zhihong.wang@intel.com>,
 "rodrigo.vivi@intel.com" <rodrigo.vivi@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "akrowiak@linux.ibm.com" <akrowiak@linux.ibm.com>,
 "oberpar@linux.ibm.com" <oberpar@linux.ibm.com>,
 "tiwei.bie@intel.com" <tiwei.bie@intel.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "maxime.coquelin@redhat.com" <maxime.coquelin@redhat.com>,
 "lingshan.zhu@intel.com" <lingshan.zhu@intel.com>,
 Ido Shamay <idos@mellanox.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDIwMTkvMTAvMTcg5LiL5Y2INDo0NSwgQ29ybmVsaWEgSHVjayB3cm90ZToKPiBPbiBUaHUs
IDE3IE9jdCAyMDE5IDE2OjMwOjQzICswODAwCj4gSmFzb24gV2FuZyA8amFzb3dhbmdAcmVkaGF0
LmNvbT4gd3JvdGU6Cj4KPj4gT24gMjAxOS8xMC8xNyDkuIrljYgxMjo1MywgQWxleCBXaWxsaWFt
c29uIHdyb3RlOgo+Pj4+PiBZZXQgYW5vdGhlciBzdWdnZXN0aW9uOiBoYXZlIHRoZSBjbGFzcyBp
ZCBkZXJpdmUgZnJvbSB0aGUgZnVuY3Rpb24KPj4+Pj4geW91IHVzZSB0byBzZXQgdXAgdGhlIG9w
cy4KPj4+Pj4KPj4+Pj4gdm9pZCBtZGV2X3NldF92ZmlvX29wcyhzdHJ1Y3QgbWRldl9kZXZpY2Ug
Km1kZXYsIGNvbnN0IHN0cnVjdAo+Pj4+PiB2ZmlvX21kZXZfb3BzICp2ZmlvX29wcykgewo+Pj4+
PiAJbWRldi0+ZGV2aWNlX29wcyA9IHZmaW9fb3BzOwo+Pj4+PiAJbWRldi0+Y2xhc3NfaWQgPSBN
REVWX0lEX1ZGSU87Cj4+Pj4+IH0KPj4+Pj4KPj4+Pj4gdm9pZCBtZGV2X3NldF92aXJ0aW9fb3Bz
KHN0cnVjdCBtZGV2X2RldmljZSAqbWRldiwgY29uc3Qgc3RydWN0Cj4+Pj4+IHZpcnRpb19tZGV2
X29wcyAqdmlydGlvX29wcykgewo+Pj4+PiAJbWRldi0+ZGV2aWNlX29wcyA9IHZpcnRpb19vcHM7
Cj4+Pj4+IAltZGV2LT5jbGFzc19pZCA9IE1ERVZfSURfVklSVElPOwo+Pj4+PiB9Cj4+Pj4+Cj4+
Pj4+IHZvaWQgbWRldl9zZXRfdmhvc3Rfb3BzKHN0cnVjdCBtZGV2X2RldmljZSAqbWRldiwgY29u
c3Qgc3RydWN0Cj4+Pj4+IHZpcnRpb19tZGV2X29wcyAqdmlydGlvX29wcykgewo+Pj4+PiAJbWRl
di0+ZGV2aWNlX29wcyA9IHZpcnRpb19vcHM7Cj4+Pj4+IAltZGV2LT5jbGFzc19pZCA9IE1ERVZf
SURfVkhPU1Q7Cj4+Pj4+IH0KPj4+Pj4KPj4+Pj4gdm9pZCBtZGV2X3NldF92ZW5kb3Jfb3BzKHN0
cnVjdCBtZGV2X2RldmljZSAqbWRldikgLyogbm8gb3BzICovIHsKPj4+Pj4gCW1kZXYtPmNsYXNz
X2lkID0gTURFVl9JRF9WRU5ET1I7Cj4+Pj4+IH0KPj4+IE9uZSBmdXJ0aGVyIHN0ZXAgdG93YXJk
cyBtYWtpbmcgdGhpcyBoYXJkIHRvIHVzZSBpbmNvcnJlY3RseSBtaWdodCBiZQo+Pj4gdG8gcmV0
dXJuIGFuIGVycm9yIGlmIGNsYXNzX2lkIGlzIGFscmVhZHkgc2V0LiAgVGhhbmtzLAo+Pj4KPj4+
IEFsZXgKPj4KPj4gSSB3aWxsIGFkZCBhIEJVR19PTigpIHdoZW4gY2xhc3NfaWQgaGFzIGFscmVh
ZHkgc2V0Lgo+IFByb2JhYmx5IGJldHRlciBhIFdBUk5fT04oKT8KCgpSaWdodC4KClRoYW5rcwoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
