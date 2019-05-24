Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 646462964C
	for <lists+dri-devel@lfdr.de>; Fri, 24 May 2019 12:48:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF65F6E0EF;
	Fri, 24 May 2019 10:48:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73A2D6E0EF
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2019 10:48:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 1673230821F8;
 Fri, 24 May 2019 10:48:34 +0000 (UTC)
Received: from [10.3.116.116] (ovpn-116-116.phx2.redhat.com [10.3.116.116])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5303561354;
 Fri, 24 May 2019 10:48:33 +0000 (UTC)
Subject: Re: [PATCH] drm: assure aux_dev is nonzero before using it
To: Jani Nikula <jani.nikula@linux.intel.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20190523110905.22445-1-tcamuso@redhat.com>
 <87v9y0mept.fsf@intel.com>
From: tony camuso <tcamuso@redhat.com>
Message-ID: <04ae1fb0-02ab-88e9-94b3-e36f48cc65d5@redhat.com>
Date: Fri, 24 May 2019 06:48:32 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <87v9y0mept.fsf@intel.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.47]); Fri, 24 May 2019 10:48:34 +0000 (UTC)
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
Cc: airlied@linux.ie, dkwon@redhat.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gNS8yNC8xOSA0OjM2IEFNLCBKYW5pIE5pa3VsYSB3cm90ZToKPiBPbiBUaHUsIDIzIE1heSAy
MDE5LCB0Y2FtdXNvIDx0Y2FtdXNvQHJlZGhhdC5jb20+IHdyb3RlOgo+PiAgRnJvbSBEYW5pZWwg
S3dvbiA8ZGt3b25AcmVkaGF0LmNvbT4KPj4KPj4gVGhlIHN5c3RlbSB3YXMgY3Jhc2hlZCBkdWUg
dG8gaW52YWxpZCBtZW1vcnkgYWNjZXNzIHdoaWxlIHRyeWluZyB0byBhY2Nlc3MKPj4gYXV4aWxp
YXJ5IGRldmljZS4KPj4KPj4gY3Jhc2g+IGJ0Cj4+IFBJRDogOTg2MyAgIFRBU0s6IGZmZmY4OWQx
YmRmMTEwNDAgIENQVTogMSAgIENPTU1BTkQ6ICJpcG1pdG9vbCIKPj4gICAjMCBbZmZmZjg5Y2Vk
ZDdmMzg2OF0gbWFjaGluZV9rZXhlYyBhdCBmZmZmZmZmZmIwNjYzNjc0Cj4+ICAgIzEgW2ZmZmY4
OWNlZGQ3ZjM4YzhdIF9fY3Jhc2hfa2V4ZWMgYXQgZmZmZmZmZmZiMDcxY2Y2Mgo+PiAgICMyIFtm
ZmZmODljZWRkN2YzOTk4XSBjcmFzaF9rZXhlYyBhdCBmZmZmZmZmZmIwNzFkMDUwCj4+ICAgIzMg
W2ZmZmY4OWNlZGQ3ZjM5YjBdIG9vcHNfZW5kIGF0IGZmZmZmZmZmYjBkNmQ3NTgKPj4gICAjNCBb
ZmZmZjg5Y2VkZDdmMzlkOF0gbm9fY29udGV4dCBhdCBmZmZmZmZmZmIwZDViY2RlCj4+ICAgIzUg
W2ZmZmY4OWNlZGQ3ZjNhMjhdIF9fYmFkX2FyZWFfbm9zZW1hcGhvcmUgYXQgZmZmZmZmZmZiMGQ1
YmQ3NQo+PiAgICM2IFtmZmZmODljZWRkN2YzYTc4XSBiYWRfYXJlYSBhdCBmZmZmZmZmZmIwZDVj
MDg1Cj4+ICAgIzcgW2ZmZmY4OWNlZGQ3ZjNhYTBdIF9fZG9fcGFnZV9mYXVsdCBhdCBmZmZmZmZm
ZmIwZDcwODBjCj4+ICAgIzggW2ZmZmY4OWNlZGQ3ZjNiMTBdIGRvX3BhZ2VfZmF1bHQgYXQgZmZm
ZmZmZmZiMGQ3MDkwNQo+PiAgICM5IFtmZmZmODljZWRkN2YzYjQwXSBwYWdlX2ZhdWx0IGF0IGZm
ZmZmZmZmYjBkNmM3NTgKPj4gICAgICBbZXhjZXB0aW9uIFJJUDogZHJtX2RwX2F1eF9kZXZfZ2V0
X2J5X21pbm9yKzB4M2RdCj4+ICAgICAgUklQOiBmZmZmZmZmZmMwYTU4OWJkICBSU1A6IGZmZmY4
OWNlZGQ3ZjNiZjAgIFJGTEFHUzogMDAwMTAyNDYKPj4gICAgICBSQVg6IDAwMDAwMDAwMDAwMDAw
MDAgIFJCWDogMDAwMDAwMDAwMDAwMDAwMCAgUkNYOiBmZmZmODljZWRkN2YzZmQ4Cj4+ICAgICAg
UkRYOiAwMDAwMDAwMDAwMDAwMDAwICBSU0k6IDAwMDAwMDAwMDAwMDAwMDAgIFJESTogZmZmZmZm
ZmZjMGE2MTNlMAo+PiAgICAgIFJCUDogZmZmZjg5Y2VkZDdmM2JmOCAgIFI4OiBmZmZmODlmMWJj
YmFiYmQwICAgUjk6IDAwMDAwMDAwMDAwMDAwMDAKPj4gICAgICBSMTA6IGZmZmY4OWYxYmU3YTFj
YzAgIFIxMTogMDAwMDAwMDAwMDAwMDAwMCAgUjEyOiAwMDAwMDAwMDAwMDAwMDAwCj4+ICAgICAg
UjEzOiBmZmZmODlmMWIzMmEyODMwICBSMTQ6IGZmZmY4OWQxOGZhZGZhMDAgIFIxNTogMDAwMDAw
MDAwMDAwMDAwMAo+PiAgICAgIE9SSUdfUkFYOiBmZmZmZmZmZmZmZmZmZmZmICBDUzogMDAxMCAg
U1M6IDAwMTgKPj4gICAgICBSSVA6IDAwMDAyYjQ1ZjBkODBkMzAgIFJTUDogMDAwMDdmZmM0MTYw
NjZhMCAgUkZMQUdTOiAwMDAxMDI0Ngo+PiAgICAgIFJBWDogMDAwMDAwMDAwMDAwMDAwMiAgUkJY
OiAwMDAwNTYwNjJlMjEyZDgwICBSQ1g6IDAwMDA3ZmZjNDE2MDY4MTAKPj4gICAgICBSRFg6IDAw
MDAwMDAwMDAwMDAwMDAgIFJTSTogMDAwMDAwMDAwMDAwMDAwMiAgUkRJOiAwMDAwN2ZmYzQxNjA2
ZWMwCj4+ICAgICAgUkJQOiAwMDAwMDAwMDAwMDAwMDAwICAgUjg6IDAwMDA1NjA2MmRmZWQyMjkg
ICBSOTogMDAwMDJiNDVmMGNkZjE0ZAo+PiAgICAgIFIxMDogMDAwMDAwMDAwMDAwMDAwMiAgUjEx
OiAwMDAwMDAwMDAwMDAwMjQ2ICBSMTI6IDAwMDA3ZmZjNDE2MDZlYzAKPj4gICAgICBSMTM6IDAw
MDA3ZmZjNDE2MDZlZDAgIFIxNDogMDAwMDdmZmM0MTYwNmVlMCAgUjE1OiAwMDAwMDAwMDAwMDAw
MDAwCj4+ICAgICAgT1JJR19SQVg6IDAwMDAwMDAwMDAwMDAwMDIgIENTOiAwMDMzICBTUzogMDAy
Ygo+Pgo+PiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4+Cj4+IEl0IHdhcyB0cnlpbmcgdG8gb3BlbiAn
L2Rldi9pcG1pMCcsIGJ1dCBhcyBubyBlbnRyeSBpbiBhdXhfZGlyLCBpdCByZXR1cm5lZAo+PiBO
VUxMIGZyb20gJ2lkcl9maW5kKCknLiBUaGlzIGRybV9kcF9hdXhfZGV2X2dldF9ieV9taW5vcigp
IHNob3VsZCBoYXZlIGRvbmUgYQo+PiBjaGVjayBvbiB0aGlzLCBidXQgaGFkIGZhaWxlZCB0byBk
byBpdC4KPiAKPiBJIHRoaW5rIHRoZSBiZXR0ZXIgcXVlc3Rpb24gaXMsICp3aHkqIGRvZXMgdGhl
IGlkcl9maW5kKCkgcmV0dXJuIE5VTEw/IEkKPiBkb24ndCB0aGluayBpdCBzaG91bGQsIHVuZGVy
IGFueSBjaXJjdW1zdGFuY2VzLiBJIGZlYXIgYWRkaW5nIHRoZSBjaGVjawo+IGhlcmUgcGFwZXJz
IG92ZXIgc29tZSBvdGhlciBwcm9ibGVtLCB0YWtpbmcgdXMgZnVydGhlciBhd2F5IGZyb20gdGhl
Cj4gcm9vdCBjYXVzZS4KClRoYXQncyBhIHZlcnkgZ29vZCBxdWVzdGlvbi4KCj4gQWxzbywgY2Fu
IHlvdSByZXByb2R1Y2UgdGhpcyBvbiBhIHJlY2VudCB1cHN0cmVhbSBrZXJuZWw/IFRoZSBhdXgg
ZGV2aWNlCj4gbm9kZXMgd2VyZSBpbnRyb2R1Y2VkIGluIGtlcm5lbCB2NC42LiBXaGF0ZXZlciB5
b3UgcmVwcm9kdWNlZCBvbiB2My4xMAo+IGlzIHByZXR0eSBtdWNoIGlycmVsZXZhbnQgZm9yIHVw
c3RyZWFtLgoKSSB3aWxsIGxvb2sgaW50byB0aGlzIGRlZXBlciwgdXNpbmcgdGhlIHVwc3RyZWFt
IGtlcm5lbC4KCj4gCj4gCj4gQlIsCj4gSmFuaS4KCi0tIHNuaXAgLS0KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
