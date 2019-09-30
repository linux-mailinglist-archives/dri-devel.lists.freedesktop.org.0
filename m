Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20155C24AB
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2019 17:51:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A20466E486;
	Mon, 30 Sep 2019 15:51:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 113CA89F73;
 Mon, 30 Sep 2019 15:51:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 931C63086272;
 Mon, 30 Sep 2019 15:51:49 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6A6A85D70E;
 Mon, 30 Sep 2019 15:51:49 +0000 (UTC)
Received: from zmail25.collab.prod.int.phx2.redhat.com
 (zmail25.collab.prod.int.phx2.redhat.com [10.5.83.31])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3A12A1808878;
 Mon, 30 Sep 2019 15:51:49 +0000 (UTC)
Date: Mon, 30 Sep 2019 11:51:48 -0400 (EDT)
From: Frediano Ziglio <fziglio@redhat.com>
To: Christian Koenig <Christian.Koenig@amd.com>
Message-ID: <1484627837.3728182.1569858708944.JavaMail.zimbra@redhat.com>
In-Reply-To: <18edbb52-d230-8e93-1808-586253d969de@amd.com>
References: <20190927132458.4359-1-christian.koenig@amd.com>
 <2008023935.3565992.1569601905303.JavaMail.zimbra@redhat.com>
 <3da66dc5-d78a-4aa7-4ecc-d28085d99502@amd.com>
 <859065241.3666996.1569837067022.JavaMail.zimbra@redhat.com>
 <18edbb52-d230-8e93-1808-586253d969de@amd.com>
Subject: Re: [Spice-devel] [PATCH 1/2] drm/qxl: stop abusing TTM to call
 driver internal functions
MIME-Version: 1.0
X-Originating-IP: [10.33.32.17, 10.4.195.27]
Thread-Topic: [Spice-devel] [PATCH 1/2] drm/qxl: stop abusing TTM to call
 driver internal functions
Thread-Index: AQHVd3FePLizV3BOzkihcGVBzkmeldDquPb51ll8tIBao3VA6g==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.49]); Mon, 30 Sep 2019 15:51:49 +0000 (UTC)
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
Cc: dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 kraxel@redhat.com, airlied@redhat.com, spice-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PiBBbSAzMC4wOS4xOSB1bSAxMTo1MSBzY2hyaWViIEZyZWRpYW5vIFppZ2xpbzoKPiA+PiBBbSAy
Ny4wOS4xOSB1bSAxODozMSBzY2hyaWViIEZyZWRpYW5vIFppZ2xpbzoKPiA+Pj4+IFRoZSB0dG1f
bWVtX2lvXyogZnVuY3Rpb25zIGFyZSBhY3R1YWxseSBpbnRlcm5hbCB0byBUVE0gYW5kIHNob3Vs
ZG4ndCBiZQo+ID4+Pj4gdXNlZCBpbiBhIGRyaXZlci4KPiA+Pj4+Cj4gPj4+IEFzIGZhciBhcyBJ
IGNhbiBzZWUgYnkgeW91ciBzZWNvbmQgcGF0Y2ggUVhMIGlzIGp1c3QgdXNpbmcgZXhwb3J0ZWQK
PiA+Pj4gKHRoYXQgaXMgbm90IGludGVybmFsKSBmdW5jdGlvbnMuCj4gPj4+IE5vdCB0aGF0IHRo
ZSBpZGVhIG9mIG1ha2luZyB0aGVtIGludGVybmFsIGlzIGJhZCBidXQgdGhpcyBjb21tZW50IGlz
Cj4gPj4+IGEgd3Jvbmcgc3RhdGVtZW50Lgo+ID4+IFNlZSB0aGUgaGlzdG9yeSBvZiBleHBvcnRp
bmcgdGhvc2UsIHRoYXQgd2FzIGRvbmUgc3BlY2lmaWNhbGx5IHNvIHRoYXQKPiA+PiBRWEwgY2Fu
IGNhbGwgdGhlbSAoY29tbWl0IGFmZTY4MDRjMDQ1ZmJkNjlhMWI3NWM2ODExMDdiNWQ2ZGY5MTkw
ZGUpLgo+ID4+Cj4gPj4gQnV0IHRob3NlIGFyZSB0aGUgaW50ZXJuYWwgZnVuY3Rpb25zIHdoaWNo
IFRUTSB1c2VzIHRvIGNhbGwgaW50byB0aGUKPiA+PiBkcml2ZXIuIFRoYXQgYSBkcml2ZXIgdXNl
cyB0aGVtIHRvIGNhbGwgaW50byBpdHNlbGYgZG9lc24ndCBzZWVtIHRvIG1ha2UKPiA+PiBzZW5z
ZS4KPiA+Pgo+ID4gVGhlIGNvbW1pdCB3YXMgbWVyZ2VkIGFuZCByZWxlYXNlIGluIExpbnV4IDMu
MTAgNiB5ZWFycyBhZ28sIHNpbmNlCj4gPiB0aGVuIHRoZXNlIGZ1bmN0aW9ucyBoYXZlIGJlZW4g
ZXhwb3J0ZWQuIE5vdCBzYXlpbmcgdGhhdCB0aGUgUVhMIGNoYW5nZQo+ID4gd2FzIHdyb25nIGFu
ZCBzaG91bGQgbm90IGhhdmUgYmVlbiBhY2tlZCBhbmQgbWVyZ2VkIGJ1dCBhZnRlciA2IHllYXJz
Cj4gPiBzYXlpbmcgdGhhdCB0aGVzZSBmdW5jdGlvbnMgYXJlIGludGVybmFsIGl0J3Mgbm90IGNv
cnJlY3QuCj4gCj4gV2h5PyBJZiBhIGZ1bmN0aW9uIGlzIGludGVybmFsIG9yIG5vdCBpcyBkZWZp
bmVkIGJ5IHRoZSBkZXNpZ24gYW5kIG5vdAo+IHRoZSBhY3R1YWwgaW1wbGVtZW50YXRpb24uCj4g
CgpXaGVyZSdzIGRvY3VtZW50ZWQ/IEkgY2Fubm90IGZpbmQgaXQuIFByb2JhYmx5IG15IGtlcm5l
bCBkZXZlbCBpcyBhIGJpdApydXN0eS4KCj4gPiBTb21ldGhpbmcgbGlrZQo+ID4KPiA+ICJUaGUg
dHRtX21lbV9pb18qIGZ1bmN0aW9ucyB3ZXJlIGludGVuZGVkIHRvIGJlIGludGVybmFsIHRvIFRU
TSBhbmQKPiA+IHNob3VsZG4ndCBoYXZlIGJlZW4gdXNlZCBpbiBhIGRyaXZlci4gVGhleSB3ZXJl
IGV4cG9ydGVkIGluIGNvbW1pdAo+ID4gYWZlNjgwNGMwNDVmYmQ2OWExYjc1YzY4MTEwN2I1ZDZk
ZjkxOTBkZSBqdXN0IGZvciBRWEwuIgo+IAo+IEdvb2QgcG9pbnQgbWVudGlvbmluZyB0aGUgY29t
bWl0IGFkZGluZyB0aGF0LCBnb2luZyB0byB1c2UgdGhpcyBmb3IgdGhlCj4gY29tbWl0IG1lc3Nh
Z2UuCj4gCj4gQ2hyaXN0aWFuLgo+IAo+ID4KPiA+Pj4+IEluc3RlYWQgY2FsbCB0aGUgcXhsX3R0
bV9pb19tZW1fcmVzZXJ2ZSgpIGZ1bmN0aW9uIGRpcmVjdGx5Lgo+ID4+Pj4KPiA+Pj4gSSB3b3Vs
ZCBhZGQgdGhhdCBxeGxfdHRtX2lvX21lbV9mcmVlIGlzIGVtcHR5IHNvIHRoZSByZW1vdmFsIG9m
Cj4gPj4+IHR0bV9tZW1faW9fZnJlZSBpcyBmaW5lLgo+ID4+IEdvb2QgcG9pbnQsIGdvaW5nIHRv
IGFkZCB0aGF0Lgo+ID4+Cj4gPj4gVGhhbmtzLAo+ID4+IENocmlzdGlhbi4KPiA+Pgo+ID4gRnJl
ZGlhbm8KPiA+Cj4gPj4+PiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3Rp
YW4ua29lbmlnQGFtZC5jb20+Cj4gPj4+PiAtLS0KPiA+Pj4+ICAgIGRyaXZlcnMvZ3B1L2RybS9x
eGwvcXhsX2Rydi5oICAgIHwgIDIgKysKPiA+Pj4+ICAgIGRyaXZlcnMvZ3B1L2RybS9xeGwvcXhs
X29iamVjdC5jIHwgMTEgKy0tLS0tLS0tLS0KPiA+Pj4+ICAgIGRyaXZlcnMvZ3B1L2RybS9xeGwv
cXhsX3R0bS5jICAgIHwgIDQgKystLQo+ID4+Pj4gICAgMyBmaWxlcyBjaGFuZ2VkLCA1IGluc2Vy
dGlvbnMoKyksIDEyIGRlbGV0aW9ucygtKQo+ID4+Pj4KPiA+Pj4+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vcXhsL3F4bF9kcnYuaAo+ID4+Pj4gYi9kcml2ZXJzL2dwdS9kcm0vcXhsL3F4
bF9kcnYuaAo+ID4+Pj4gaW5kZXggOWUwMzRjNWZhODdkLi44YTI0ZjhlMTAxZGEgMTAwNjQ0Cj4g
Pj4+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vcXhsL3F4bF9kcnYuaAo+ID4+Pj4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL3F4bC9xeGxfZHJ2LmgKPiA+Pj4+IEBAIC0zNTQsNiArMzU0LDggQEAgaW50
IHF4bF9tb2RlX2R1bWJfbW1hcChzdHJ1Y3QgZHJtX2ZpbGUgKmZpbHAsCj4gPj4+PiAgICAvKiBx
eGwgdHRtICovCj4gPj4+PiAgICBpbnQgcXhsX3R0bV9pbml0KHN0cnVjdCBxeGxfZGV2aWNlICpx
ZGV2KTsKPiA+Pj4+ICAgIHZvaWQgcXhsX3R0bV9maW5pKHN0cnVjdCBxeGxfZGV2aWNlICpxZGV2
KTsKPiA+Pj4+ICtpbnQgcXhsX3R0bV9pb19tZW1fcmVzZXJ2ZShzdHJ1Y3QgdHRtX2JvX2Rldmlj
ZSAqYmRldiwKPiA+Pj4+ICsJCQkgICBzdHJ1Y3QgdHRtX21lbV9yZWcgKm1lbSk7Cj4gPj4+PiAg
ICBpbnQgcXhsX21tYXAoc3RydWN0IGZpbGUgKmZpbHAsIHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAq
dm1hKTsKPiA+Pj4+ICAgIAo+ID4+Pj4gICAgLyogcXhsIGltYWdlICovCj4gPj4+PiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL3F4bC9xeGxfb2JqZWN0LmMKPiA+Pj4+IGIvZHJpdmVycy9n
cHUvZHJtL3F4bC9xeGxfb2JqZWN0LmMKPiA+Pj4+IGluZGV4IDU0OGRmZTZmM2IyNi4uMjk5ZTYz
YTk1MWM1IDEwMDY0NAo+ID4+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3F4bC9xeGxfb2JqZWN0
LmMKPiA+Pj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9xeGwvcXhsX29iamVjdC5jCj4gPj4+PiBA
QCAtMTQ4LDcgKzE0OCw2IEBAIGludCBxeGxfYm9fa21hcChzdHJ1Y3QgcXhsX2JvICpibywgdm9p
ZCAqKnB0cikKPiA+Pj4+ICAgIHZvaWQgKnF4bF9ib19rbWFwX2F0b21pY19wYWdlKHN0cnVjdCBx
eGxfZGV2aWNlICpxZGV2LAo+ID4+Pj4gICAgCQkJICAgICAgc3RydWN0IHF4bF9ibyAqYm8sIGlu
dCBwYWdlX29mZnNldCkKPiA+Pj4+ICAgIHsKPiA+Pj4+IC0Jc3RydWN0IHR0bV9tZW1fdHlwZV9t
YW5hZ2VyICptYW4gPQo+ID4+Pj4gJmJvLT50Ym8uYmRldi0+bWFuW2JvLT50Ym8ubWVtLm1lbV90
eXBlXTsKPiA+Pj4+ICAgIAl2b2lkICpycHRyOwo+ID4+Pj4gICAgCWludCByZXQ7Cj4gPj4+PiAg
ICAJc3RydWN0IGlvX21hcHBpbmcgKm1hcDsKPiA+Pj4+IEBAIC0xNjAsOSArMTU5LDcgQEAgdm9p
ZCAqcXhsX2JvX2ttYXBfYXRvbWljX3BhZ2Uoc3RydWN0IHF4bF9kZXZpY2UKPiA+Pj4+ICpxZGV2
LAo+ID4+Pj4gICAgCWVsc2UKPiA+Pj4+ICAgIAkJZ290byBmYWxsYmFjazsKPiA+Pj4+ICAgIAo+
ID4+Pj4gLQkodm9pZCkgdHRtX21lbV9pb19sb2NrKG1hbiwgZmFsc2UpOwo+ID4+Pj4gLQlyZXQg
PSB0dG1fbWVtX2lvX3Jlc2VydmUoYm8tPnRiby5iZGV2LCAmYm8tPnRiby5tZW0pOwo+ID4+Pj4g
LQl0dG1fbWVtX2lvX3VubG9jayhtYW4pOwo+ID4+Pj4gKwlyZXQgPSBxeGxfdHRtX2lvX21lbV9y
ZXNlcnZlKGJvLT50Ym8uYmRldiwgJmJvLT50Ym8ubWVtKTsKPiA+Pj4+ICAgIAo+ID4+Pj4gICAg
CXJldHVybiBpb19tYXBwaW5nX21hcF9hdG9taWNfd2MobWFwLCBiby0+dGJvLm1lbS5idXMub2Zm
c2V0ICsKPiA+Pj4+ICAgIAlwYWdlX29mZnNldCk7Cj4gPj4+PiAgICBmYWxsYmFjazoKPiA+Pj4+
IEBAIC0xOTMsMTcgKzE5MCwxMSBAQCB2b2lkIHF4bF9ib19rdW5tYXAoc3RydWN0IHF4bF9ibyAq
Ym8pCj4gPj4+PiAgICB2b2lkIHF4bF9ib19rdW5tYXBfYXRvbWljX3BhZ2Uoc3RydWN0IHF4bF9k
ZXZpY2UgKnFkZXYsCj4gPj4+PiAgICAJCQkgICAgICAgc3RydWN0IHF4bF9ibyAqYm8sIHZvaWQg
KnBtYXApCj4gPj4+PiAgICB7Cj4gPj4+PiAtCXN0cnVjdCB0dG1fbWVtX3R5cGVfbWFuYWdlciAq
bWFuID0KPiA+Pj4+ICZiby0+dGJvLmJkZXYtPm1hbltiby0+dGJvLm1lbS5tZW1fdHlwZV07Cj4g
Pj4+PiAtCj4gPj4+PiAgICAJaWYgKChiby0+dGJvLm1lbS5tZW1fdHlwZSAhPSBUVE1fUExfVlJB
TSkgJiYKPiA+Pj4+ICAgIAkgICAgKGJvLT50Ym8ubWVtLm1lbV90eXBlICE9IFRUTV9QTF9QUklW
KSkKPiA+Pj4+ICAgIAkJZ290byBmYWxsYmFjazsKPiA+Pj4+ICAgIAo+ID4+Pj4gICAgCWlvX21h
cHBpbmdfdW5tYXBfYXRvbWljKHBtYXApOwo+ID4+Pj4gLQo+ID4+Pj4gLQkodm9pZCkgdHRtX21l
bV9pb19sb2NrKG1hbiwgZmFsc2UpOwo+ID4+Pj4gLQl0dG1fbWVtX2lvX2ZyZWUoYm8tPnRiby5i
ZGV2LCAmYm8tPnRiby5tZW0pOwo+ID4+Pj4gLQl0dG1fbWVtX2lvX3VubG9jayhtYW4pOwo+ID4+
Pj4gICAgCXJldHVybjsKPiA+Pj4+ICAgICBmYWxsYmFjazoKPiA+Pj4+ICAgIAlxeGxfYm9fa3Vu
bWFwKGJvKTsKPiA+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcXhsL3F4bF90dG0u
Ywo+ID4+Pj4gYi9kcml2ZXJzL2dwdS9kcm0vcXhsL3F4bF90dG0uYwo+ID4+Pj4gaW5kZXggOWIy
NDUxNGM3NWFhLi5jYjgwZTUxMmRkNDYgMTAwNjQ0Cj4gPj4+PiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0vcXhsL3F4bF90dG0uYwo+ID4+Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3F4bC9xeGxfdHRt
LmMKPiA+Pj4+IEBAIC0xNTksOCArMTU5LDggQEAgc3RhdGljIGludCBxeGxfdmVyaWZ5X2FjY2Vz
cyhzdHJ1Y3QKPiA+Pj4+IHR0bV9idWZmZXJfb2JqZWN0Cj4gPj4+PiAqYm8sIHN0cnVjdCBmaWxl
ICpmaWxwKQo+ID4+Pj4gICAgCQkJCQkgIGZpbHAtPnByaXZhdGVfZGF0YSk7Cj4gPj4+PiAgICB9
Cj4gPj4+PiAgICAKPiA+Pj4+IC1zdGF0aWMgaW50IHF4bF90dG1faW9fbWVtX3Jlc2VydmUoc3Ry
dWN0IHR0bV9ib19kZXZpY2UgKmJkZXYsCj4gPj4+PiAtCQkJCSAgc3RydWN0IHR0bV9tZW1fcmVn
ICptZW0pCj4gPj4+PiAraW50IHF4bF90dG1faW9fbWVtX3Jlc2VydmUoc3RydWN0IHR0bV9ib19k
ZXZpY2UgKmJkZXYsCj4gPj4+PiArCQkJICAgc3RydWN0IHR0bV9tZW1fcmVnICptZW0pCj4gPj4+
PiAgICB7Cj4gPj4+PiAgICAJc3RydWN0IHR0bV9tZW1fdHlwZV9tYW5hZ2VyICptYW4gPSAmYmRl
di0+bWFuW21lbS0+bWVtX3R5cGVdOwo+ID4+Pj4gICAgCXN0cnVjdCBxeGxfZGV2aWNlICpxZGV2
ID0gcXhsX2dldF9xZGV2KGJkZXYpOwo+ID4+PiBPdGhlcndpc2UgZmluZSBmb3IgbWUuCj4gPj4+
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
