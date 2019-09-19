Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4771B8834
	for <lists+dri-devel@lfdr.de>; Fri, 20 Sep 2019 01:46:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41F3C6FC14;
	Thu, 19 Sep 2019 23:46:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25A2C6FC13
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Sep 2019 23:46:04 +0000 (UTC)
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-309-RKsUCzYDO-qnrvL86yntgg-1; Thu, 19 Sep 2019 19:44:32 -0400
Received: by mail-qt1-f198.google.com with SMTP id d1so6002641qtq.3
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Sep 2019 16:44:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=71ffCnR41g9eUHADpSSyhwQT0MSKqM6+8yW7cpq+uug=;
 b=tw6BsItZewrATj9SKK5Vl/4hyDDTf2/yypkNzs725dWwZoMiGbijwmFGDwGRWRCh06
 hs17o/DWHtp55bHMzD4D3cjLkZF08kKioOIxJivXcLKBkXbduiXbqAtQSmQIE/iTsCI1
 iETu2fIqjcJJYEDZDWznZG3WcDpk7GDp8zWUWdsSypa4szEA69QrjrKU3trIfDffsXL1
 Pmqf7sLhIawljQOmq5IZo/pnOkFAZCNCztqofQ+HylHwYXyyIE+/TQyCK2K5gp5K8mhC
 HzWXlNaR/D54YLYjs9u40xkXLiaeO+BT+W3AR21QQblKXsHjgH7AEncjzNiwXoqvGGrf
 KveA==
X-Gm-Message-State: APjAAAXiwHmy8N/ubCU6pxqhxrfl4AGDlfe5qOpjuBD74LjqZ9zsJcO5
 b+ubXZfIQSC3APqS3xbH9v4c3odd0Io8fFHOh1AwtbzTJtOeEhp8xwDBFx4Rhg98Ne6y7HZQ4Xz
 yhhTIR8rvFBWZDFrYKwl5hF+ifWsD
X-Received: by 2002:a37:9e57:: with SMTP id h84mr468878qke.226.1568936670582; 
 Thu, 19 Sep 2019 16:44:30 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzXi9QzRb2IFxjv5+1Wf9GdVP+igr/ePBZVr5yMvukObghlo/u3i2TRS8AWVOa+ldX7InyTyQ==
X-Received: by 2002:a37:9e57:: with SMTP id h84mr468868qke.226.1568936670388; 
 Thu, 19 Sep 2019 16:44:30 -0700 (PDT)
Received: from dhcp-10-20-1-34.bss.redhat.com ([144.121.20.162])
 by smtp.gmail.com with ESMTPSA id 56sm200277qty.15.2019.09.19.16.44.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Sep 2019 16:44:29 -0700 (PDT)
Message-ID: <1ceffe460c57ed74df7cc03a9dd7238102be2cf0.camel@redhat.com>
Subject: Re: [PATCH 09/15] drm/dp_mst: Add new quirk for Synaptics MST hubs
From: Lyude Paul <lyude@redhat.com>
To: mikita.lipski@amd.com, amd-gfx@lists.freedesktop.org
Date: Thu, 19 Sep 2019 19:44:28 -0400
In-Reply-To: <6b11214d7aaa5bff6ba60846a1569b6f2ac25b0b.1568833906.git.mikita.lipski@amd.com>
References: <cover.1568833906.git.mikita.lipski@amd.com>
 <6b11214d7aaa5bff6ba60846a1569b6f2ac25b0b.1568833906.git.mikita.lipski@amd.com>
Organization: Red Hat
User-Agent: Evolution 3.32.4 (3.32.4-1.fc30)
MIME-Version: 1.0
X-MC-Unique: RKsUCzYDO-qnrvL86yntgg-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1568936763;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Pgp6/fZ9R2+n/N2IU7yg2BIR99H2/1zQ5aNF9NLmk50=;
 b=MaMCn6jDcuMjEH9E0Co5vRE+yeyqPPDmqDMpTi1eng0ZLCKnL0q3Pu0NCU+flBHoXCCrKJ
 Vt/3Dw/Wty0DHFo338afxDlRjfnrpZ/iPx7D1mRGyJAB9PevR3XFIFf6nrkyUiObKfMWC8
 1PuHXn/VBa31dw5kX/0/w5STKyVHEto=
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
Cc: David Francis <David.Francis@amd.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

R3JlYXQgd29yayEKClJldmlld2VkLWJ5OiBMeXVkZSBQYXVsIDxseXVkZUByZWRoYXQuY29tPgoK
T24gV2VkLCAyMDE5LTA5LTE4IGF0IDE2OjI2IC0wNDAwLCBtaWtpdGEubGlwc2tpQGFtZC5jb20g
d3JvdGU6Cj4gRnJvbTogRGF2aWQgRnJhbmNpcyA8RGF2aWQuRnJhbmNpc0BhbWQuY29tPgo+IAo+
IFN5bmFwdGljcyBEUDEuNCBodWJzIChCUkFOQ0hfSUQgMHg5MENDMjQpIGRvIG5vdAo+IHN1cHBv
cnQgdmlydHVhbCBEUENEIHJlZ2lzdGVycywgYnV0IGRvIHN1cHBvcnQgRFNDLgo+IFRoZSBEU0Mg
Y2FwcyBjYW4gYmUgcmVhZCBmcm9tIHRoZSBwaHlzaWNhbCBhdXgsCj4gbGlrZSBpbiBTU1QgRFND
LiBUaGVzZSBodWJzIGhhdmUgbWFueSBkaWZmZXJlbnQKPiBERVZJQ0VfSURzLiAgQWRkIGEgbmV3
IHF1aXJrIHRvIGRldGVjdCB0aGlzIGNhc2UuCj4gCj4gQ2hhbmdlLUlkOiBJOWQzMzJmMjczZGZj
YTBjZmJjZWQxMTFlNjJmNWEwNmM1YzMxMjg5Mwo+IENjOiBMeXVkZSBQYXVsIDxseXVkZUByZWRo
YXQuY29tPgo+IENjOiBKYW5pIE5pa3VsYSA8amFuaS5uaWt1bGFAbGludXguaW50ZWwuY29tPgo+
IENjOiBIYXJyeSBXZW50bGFuZCA8aGFycnkud2VudGxhbmRAYW1kLmNvbT4KPiBSZXZpZXdlZC1i
eTogV2VuamluZyBMaXUgPFdlbmppbmcuTGl1QGFtZC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogRGF2
aWQgRnJhbmNpcyA8RGF2aWQuRnJhbmNpc0BhbWQuY29tPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9k
cm0vZHJtX2RwX2hlbHBlci5jICAgICAgIHwgIDQgKysrLQo+ICBkcml2ZXJzL2dwdS9kcm0vZHJt
X2RwX21zdF90b3BvbG9neS5jIHwgMjcgKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gIGlu
Y2x1ZGUvZHJtL2RybV9kcF9oZWxwZXIuaCAgICAgICAgICAgfCAgNyArKysrKysrCj4gIDMgZmls
ZXMgY2hhbmdlZCwgMzcgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX2hlbHBlci5jCj4gYi9kcml2ZXJzL2dwdS9kcm0v
ZHJtX2RwX2hlbHBlci5jCj4gaW5kZXggMGNiZjEwNzI3YmQ2Li5jM2UxZGE3OGU0NDIgMTAwNjQ0
Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9oZWxwZXIuYwo+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS9kcm1fZHBfaGVscGVyLmMKPiBAQCAtMTI4OCw3ICsxMjg4LDkgQEAgc3RhdGljIGNv
bnN0IHN0cnVjdCBkcGNkX3F1aXJrIGRwY2RfcXVpcmtfbGlzdFtdID0gewo+ICAJLyogTEcgTFAx
NDBXRjYtU1BNMSBlRFAgcGFuZWwgKi8KPiAgCXsgT1VJKDB4MDAsIDB4MjIsIDB4YjkpLCBERVZJ
Q0VfSUQoJ3MnLCAnaScsICd2JywgJ2EnLCAncicsICdUJyksCj4gZmFsc2UsIEJJVChEUF9EUENE
X1FVSVJLX0NPTlNUQU5UX04pIH0sCj4gIAkvKiBBcHBsZSBwYW5lbHMgbmVlZCBzb21lIGFkZGl0
aW9uYWwgaGFuZGxpbmcgdG8gc3VwcG9ydCBQU1IgKi8KPiAtCXsgT1VJKDB4MDAsIDB4MTAsIDB4
ZmEpLCBERVZJQ0VfSURfQU5ZLCBmYWxzZSwKPiBCSVQoRFBfRFBDRF9RVUlSS19OT19QU1IpIH0K
PiArCXsgT1VJKDB4MDAsIDB4MTAsIDB4ZmEpLCBERVZJQ0VfSURfQU5ZLCBmYWxzZSwKPiBCSVQo
RFBfRFBDRF9RVUlSS19OT19QU1IpIH0sCj4gKwkvKiBTeW5hcHRpY3MgRFAxLjQgTVNUIGh1YnMg
Y2FuIHN1cHBvcnQgRFNDIHdpdGhvdXQgdmlydHVhbCBEUENEICovCj4gKwl7IE9VSSgweDkwLCAw
eENDLCAweDI0KSwgREVWSUNFX0lEX0FOWSwgdHJ1ZSwKPiBCSVQoRFBfRFBDRF9RVUlSS19EU0Nf
V0lUSE9VVF9WSVJUVUFMX0RQQ0QpIH0sCj4gIH07Cj4gIAo+ICAjdW5kZWYgT1VJCj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMKPiBiL2RyaXZlcnMv
Z3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMKPiBpbmRleCBkZDJjYTA2NWNjOTIuLjRlNDkz
ZDhhZjI4OCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9n
eS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9tc3RfdG9wb2xvZ3kuYwo+IEBAIC00
MjE5LDYgKzQyMTksNyBAQCBzdHJ1Y3QgZHJtX2RwX2F1eCAqZHJtX2RwX21zdF9kc2NfYXV4X2Zv
cl9wb3J0KHN0cnVjdAo+IGRybV9kcF9tc3RfcG9ydCAqcG9ydCkKPiAgewo+ICAJc3RydWN0IGRy
bV9kcF9tc3RfcG9ydCAqaW1tZWRpYXRlX3Vwc3RyZWFtX3BvcnQ7Cj4gIAlzdHJ1Y3QgZHJtX2Rw
X21zdF9wb3J0ICpmZWNfcG9ydDsKPiArCXN0cnVjdCBkcm1fZHBfZGVzYyBkZXNjID0geyAwIH07
Cj4gIAo+ICAJaWYgKCFwb3J0KQo+ICAJCXJldHVybiBOVUxMOwo+IEBAIC00MjcxLDYgKzQyNzIs
MzIgQEAgc3RydWN0IGRybV9kcF9hdXggKmRybV9kcF9tc3RfZHNjX2F1eF9mb3JfcG9ydChzdHJ1
Y3QKPiBkcm1fZHBfbXN0X3BvcnQgKnBvcnQpCj4gIAlpZiAoZHJtX2RwX21zdF9pc192aXJ0dWFs
X2RwY2QocG9ydCkpCj4gIAkJcmV0dXJuICZwb3J0LT5hdXg7Cj4gIAo+ICsJLyoKPiArCSAqIFN5
bmFwdGljcyBxdWlyawo+ICsJICogQXBwbGllcyB0byBwb3J0cyBmb3Igd2hpY2g6Cj4gKwkgKiAt
IFBoeXNpY2FsIGF1eCBoYXMgU3luYXB0aWNzIE9VSQo+ICsJICogLSBEUHYxLjQgb3IgaGlnaGVy
Cj4gKwkgKiAtIFBvcnQgaXMgb24gcHJpbWFyeSBicmFuY2ggZGV2aWNlCj4gKwkgKiAtIE5vdCBh
IFZHQSBhZGFwdGVyIChEUF9EV05fU1RSTV9QT1JUX1RZUEVfQU5BTE9HKQo+ICsJICovCj4gKwlp
ZiAoIWRybV9kcF9yZWFkX2Rlc2MocG9ydC0+bWdyLT5hdXgsICZkZXNjLCB0cnVlKSkKPiArCQly
ZXR1cm4gTlVMTDsKPiArCj4gKwlpZiAoZHJtX2RwX2hhc19xdWlyaygmZGVzYywgRFBfRFBDRF9R
VUlSS19EU0NfV0lUSE9VVF9WSVJUVUFMX0RQQ0QpICYmCj4gKwkgICAgcG9ydC0+bWdyLT5kcGNk
W0RQX0RQQ0RfUkVWXSA+PSBEUF9EUENEX1JFVl8xNCAmJgo+ICsJICAgIHBvcnQtPnBhcmVudCA9
PSBwb3J0LT5tZ3ItPm1zdF9wcmltYXJ5KSB7Cj4gKwkJdTggZG93bnN0cmVhbXBvcnQ7Cj4gKwo+
ICsJCWlmIChkcm1fZHBfZHBjZF9yZWFkKCZwb3J0LT5hdXgsIERQX0RPV05TVFJFQU1QT1JUX1BS
RVNFTlQsCj4gKwkJCQkgICAgICZkb3duc3RyZWFtcG9ydCwgMSkgPCAwKQo+ICsJCQlyZXR1cm4g
TlVMTDsKPiArCj4gKwkJaWYgKChkb3duc3RyZWFtcG9ydCAmIERQX0RXTl9TVFJNX1BPUlRfUFJF
U0VOVCkgJiYKPiArCQkgICAoKGRvd25zdHJlYW1wb3J0ICYgRFBfRFdOX1NUUk1fUE9SVF9UWVBF
X01BU0spCj4gKwkJICAgICAhPSBEUF9EV05fU1RSTV9QT1JUX1RZUEVfQU5BTE9HKSkKPiArCQkJ
cmV0dXJuIHBvcnQtPm1nci0+YXV4Owo+ICsJfQo+ICsKPiAgCXJldHVybiBOVUxMOwo+ICB9Cj4g
IEVYUE9SVF9TWU1CT0woZHJtX2RwX21zdF9kc2NfYXV4X2Zvcl9wb3J0KTsKPiBkaWZmIC0tZ2l0
IGEvaW5jbHVkZS9kcm0vZHJtX2RwX2hlbHBlci5oIGIvaW5jbHVkZS9kcm0vZHJtX2RwX2hlbHBl
ci5oCj4gaW5kZXggNmFlMWE2NzY1ZjYzLi45MTlhZDk0MGJmYjEgMTAwNjQ0Cj4gLS0tIGEvaW5j
bHVkZS9kcm0vZHJtX2RwX2hlbHBlci5oCj4gKysrIGIvaW5jbHVkZS9kcm0vZHJtX2RwX2hlbHBl
ci5oCj4gQEAgLTE0MTQsNiArMTQxNCwxMyBAQCBlbnVtIGRybV9kcF9xdWlyayB7Cj4gIAkgKiBk
cml2ZXIgc3RpbGwgbmVlZCB0byBpbXBsZW1lbnQgcHJvcGVyIGhhbmRsaW5nIGZvciBzdWNoIGRl
dmljZS4KPiAgCSAqLwo+ICAJRFBfRFBDRF9RVUlSS19OT19QU1IsCj4gKwkvKioKPiArCSAqIEBE
UF9EUENEX1FVSVJLX0RTQ19XSVRIT1VUX1ZJUlRVQUxfRFBDRDoKPiArCSAqCj4gKwkgKiBUaGUg
ZGV2aWNlIHN1cHBvcnRzIE1TVCBEU0MgZGVzcGl0ZSBub3Qgc3VwcG9ydGluZyBWaXJ0dWFsIERQ
Q0QuCj4gKwkgKiBUaGUgRFNDIGNhcHMgY2FuIGJlIHJlYWQgZnJvbSB0aGUgcGh5c2ljYWwgYXV4
IGluc3RlYWQuCj4gKwkgKi8KPiArCURQX0RQQ0RfUVVJUktfRFNDX1dJVEhPVVRfVklSVFVBTF9E
UENELAo+ICB9Owo+ICAKPiAgLyoqCi0tIApDaGVlcnMsCglMeXVkZSBQYXVsCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
