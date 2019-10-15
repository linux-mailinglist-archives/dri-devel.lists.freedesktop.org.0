Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 280ADD762D
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2019 14:13:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D506D6E228;
	Tue, 15 Oct 2019 12:13:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 370E76E228;
 Tue, 15 Oct 2019 12:13:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 6C5E2306F4AE;
 Tue, 15 Oct 2019 12:13:53 +0000 (UTC)
Received: from [10.72.12.168] (ovpn-12-168.pek2.redhat.com [10.72.12.168])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5B70B608C0;
 Tue, 15 Oct 2019 12:13:31 +0000 (UTC)
Subject: Re: [PATCH V3 2/7] mdev: bus uevent support
To: Cornelia Huck <cohuck@redhat.com>
References: <20191011081557.28302-1-jasowang@redhat.com>
 <20191011081557.28302-3-jasowang@redhat.com>
 <20191015122707.1fd52240.cohuck@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <515d31c5-a7d9-5a22-b570-2035ecf03c09@redhat.com>
Date: Tue, 15 Oct 2019 20:13:29 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191015122707.1fd52240.cohuck@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.42]); Tue, 15 Oct 2019 12:13:53 +0000 (UTC)
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
Cc: christophe.de.dinechin@gmail.com, kvm@vger.kernel.org, mst@redhat.com,
 airlied@linux.ie, heiko.carstens@de.ibm.com, kevin.tian@intel.com,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 kwankhede@nvidia.com, rob.miller@broadcom.com, linux-s390@vger.kernel.org,
 sebott@linux.ibm.com, lulu@redhat.com, eperezma@redhat.com,
 pasic@linux.ibm.com, borntraeger@de.ibm.com, haotian.wang@sifive.com,
 cunming.liang@intel.com, zhi.a.wang@intel.com, farman@linux.ibm.com,
 idos@mellanox.com, gor@linux.ibm.com, intel-gfx@lists.freedesktop.org,
 alex.williamson@redhat.com, xiao.w.wang@intel.com, freude@linux.ibm.com,
 parav@mellanox.com, zhihong.wang@intel.com, rodrigo.vivi@intel.com,
 intel-gvt-dev@lists.freedesktop.org, akrowiak@linux.ibm.com,
 oberpar@linux.ibm.com, tiwei.bie@intel.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, maxime.coquelin@redhat.com,
 lingshan.zhu@intel.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDIwMTkvMTAvMTUg5LiL5Y2INjoyNywgQ29ybmVsaWEgSHVjayB3cm90ZToKPiBPbiBGcmks
IDExIE9jdCAyMDE5IDE2OjE1OjUyICswODAwCj4gSmFzb24gV2FuZyA8amFzb3dhbmdAcmVkaGF0
LmNvbT4gd3JvdGU6Cj4KPj4gVGhpcyBwYXRjaCBhZGRzIGJ1cyB1ZXZlbnQgc3VwcG9ydCBmb3Ig
bWRldiBidXMgaW4gb3JkZXIgdG8gYWxsb3cKPj4gY29vcGVyYXRpb24gd2l0aCB1c2Vyc3BhY2Uu
Cj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEphc29uIFdhbmcgPGphc293YW5nQHJlZGhhdC5jb20+Cj4+
IC0tLQo+PiAgIGRyaXZlcnMvdmZpby9tZGV2L21kZXZfZHJpdmVyLmMgfCA4ICsrKysrKysrCj4+
ICAgMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy92ZmlvL21kZXYvbWRldl9kcml2ZXIuYyBiL2RyaXZlcnMvdmZpby9tZGV2L21kZXZfZHJp
dmVyLmMKPj4gaW5kZXggYjdjNDBjZTg2ZWUzLi4zMTlkODg2ZmZhZjcgMTAwNjQ0Cj4+IC0tLSBh
L2RyaXZlcnMvdmZpby9tZGV2L21kZXZfZHJpdmVyLmMKPj4gKysrIGIvZHJpdmVycy92ZmlvL21k
ZXYvbWRldl9kcml2ZXIuYwo+PiBAQCAtODIsOSArODIsMTcgQEAgc3RhdGljIGludCBtZGV2X21h
dGNoKHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IGRldmljZV9kcml2ZXIgKmRydikKPj4gICAJ
cmV0dXJuIDA7Cj4+ICAgfQo+PiAgIAo+PiArc3RhdGljIGludCBtZGV2X3VldmVudChzdHJ1Y3Qg
ZGV2aWNlICpkZXYsIHN0cnVjdCBrb2JqX3VldmVudF9lbnYgKmVudikKPj4gK3sKPj4gKwlzdHJ1
Y3QgbWRldl9kZXZpY2UgKm1kZXYgPSB0b19tZGV2X2RldmljZShkZXYpOwo+PiArCj4+ICsJcmV0
dXJuIGFkZF91ZXZlbnRfdmFyKGVudiwgIk1PREFMSUFTPW1kZXY6YyUwMlgiLCBtZGV2LT5jbGFz
c19pZCk7Cj4+ICt9Cj4+ICsKPj4gICBzdHJ1Y3QgYnVzX3R5cGUgbWRldl9idXNfdHlwZSA9IHsK
Pj4gICAJLm5hbWUJCT0gIm1kZXYiLAo+PiAgIAkubWF0Y2gJCT0gbWRldl9tYXRjaCwKPj4gKwku
dWV2ZW50CQk9IG1kZXZfdWV2ZW50LAo+PiAgIAkucHJvYmUJCT0gbWRldl9wcm9iZSwKPj4gICAJ
LnJlbW92ZQkJPSBtZGV2X3JlbW92ZSwKPj4gICB9Owo+IEknZCBtZXJnZSB0aGF0IGludG8gdGhl
IHByZXZpb3VzIHBhdGNoLgoKCldpbGwgZG8uCgpUaGFua3MKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
