Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3215730B278
	for <lists+dri-devel@lfdr.de>; Mon,  1 Feb 2021 23:03:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 090726E887;
	Mon,  1 Feb 2021 22:03:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 522 seconds by postgrey-1.36 at gabe;
 Mon, 01 Feb 2021 22:03:01 UTC
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 117796E887
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Feb 2021 22:03:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612216980;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uesdFeV6nckloOu0OQR9RdXWao3qQEYo5FYIRPhkjlE=;
 b=ESa8yO52g8Uus+0gSw9pZcxK/DWUJlvOKLnb2cC6+r5BTOk5kWxWRyq4L+gvWzWLfvLzJA
 8Bk75Gkkeh8bDWZK8R5Qwn2UXS4CbS8lsCBTZ1Id1P2+ZAL0CecJCy7UI7wTj3ZIidhKep
 Lb5BltwH/IHE7eUJjFvoNXCYBnmfSKM=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-20-Zy64kqvSP2OCdhdf_yYXVg-1; Mon, 01 Feb 2021 17:02:57 -0500
X-MC-Unique: Zy64kqvSP2OCdhdf_yYXVg-1
Received: by mail-qv1-f72.google.com with SMTP id j13so6807596qvy.19
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Feb 2021 14:02:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:reply-to:to:cc:date
 :in-reply-to:references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=uesdFeV6nckloOu0OQR9RdXWao3qQEYo5FYIRPhkjlE=;
 b=rZ3Smq3P4nZtdOEHQw8KArekci0mY3Q0woRdaJBTwjaEs1Z3hy362/L8ZRCMOMNwA7
 O79PEZ4wC0WBPbYK/1p/PwruJMQAN7g4K6p3hJar1IwSLBMQGTrMJxQbwdtVfeHIaCrz
 EmyVBp3WDsCbUEra60qFntaYYJi5S6ZHJz38fzId3qQH0gPSOdQnrx+mCRPUca9ilVIB
 F8BffJMWH9M5izUMCKF2ukSDvnfBtrWK/8VR4JDkoLTZQo8b1+xLDboWF8IQ4W5CX+uE
 6ACaRhXxy+kCp+qHiDjCN300qF92bZ0TUeiZK4MJIkYNtafDqvklwc5blvHKgktPTVU6
 ttsQ==
X-Gm-Message-State: AOAM5306xbOlaHHcX+G5bD9obVq/dQjtIZNff4gUdoW3AhLphMKOxEXt
 qfIEd+fhj+JcR7nadY4MtqP2OUXK6FRvB2Wbx/2fa5VLGNRzQ1Cx27tTZMF/UYD67BFKcyAhdZi
 g5scBMOeGoyJMzx3zr+mNlQz0MfBz
X-Received: by 2002:a05:6214:b2c:: with SMTP id
 w12mr17340610qvj.54.1612216976678; 
 Mon, 01 Feb 2021 14:02:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxzhKAQ22FHQtYQZXUUQ8oLzHZz+Wt78eyKQdBKRM4/o3r0mMg0+7/qj9XrmuIRIkXX8485Mg==
X-Received: by 2002:a05:6214:b2c:: with SMTP id
 w12mr17340595qvj.54.1612216976501; 
 Mon, 01 Feb 2021 14:02:56 -0800 (PST)
Received: from Whitewolf.lyude.net
 (pool-108-49-102-102.bstnma.fios.verizon.net. [108.49.102.102])
 by smtp.gmail.com with ESMTPSA id h144sm1676401qke.95.2021.02.01.14.02.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Feb 2021 14:02:55 -0800 (PST)
Message-ID: <a4a9ec24a6d4a646e22fb5c63e285d4d1bb50a0d.camel@redhat.com>
Subject: Re: [PATCH v3 3/4] drm_dp_mst_topology: export two functions
From: Lyude Paul <lyude@redhat.com>
To: Sam McNally <sammc@chromium.org>, LKML <linux-kernel@vger.kernel.org>
Date: Mon, 01 Feb 2021 17:02:55 -0500
In-Reply-To: <20200923121320.v3.3.I6c917ff82a1d2ae2253a3bd4d750d58879387cac@changeid>
References: <20200923121320.v3.1.I8693156f555875e5c8342e86ab37ce968dfdd277@changeid>
 <20200923121320.v3.3.I6c917ff82a1d2ae2253a3bd4d750d58879387cac@changeid>
Organization: Red Hat
User-Agent: Evolution 3.38.3 (3.38.3-1.fc33)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Reply-To: lyude@redhat.com
Cc: David Airlie <airlied@linux.ie>, Hans Verkuil <hverkuil@xs4all.nl>,
 Hans Verkuil <hans.verkuil@cisco.com>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAyMDIwLTA5LTIzIGF0IDEyOjEzICsxMDAwLCBTYW0gTWNOYWxseSB3cm90ZToKPiBG
cm9tOiBIYW5zIFZlcmt1aWwgPGhhbnMudmVya3VpbEBjaXNjby5jb20+Cj4gCj4gVGhlc2UgYXJl
IHJlcXVpcmVkIGZvciB0aGUgQ0VDIE1TVCBzdXBwb3J0Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IEhh
bnMgVmVya3VpbCA8aGFucy52ZXJrdWlsQGNpc2NvLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBTYW0g
TWNOYWxseSA8c2FtbWNAY2hyb21pdW0ub3JnPgo+IC0tLQo+IAo+IChubyBjaGFuZ2VzIHNpbmNl
IHYxKQo+IAo+IMKgZHJpdmVycy9ncHUvZHJtL2RybV9kcF9tc3RfdG9wb2xvZ3kuYyB8IDYgKyst
LS0tCj4gwqBpbmNsdWRlL2RybS9kcm1fZHBfbXN0X2hlbHBlci5owqDCoMKgwqDCoMKgIHwgNCAr
KysrCj4gwqAyIGZpbGVzIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkK
PiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9tc3RfdG9wb2xvZ3kuYwo+
IGIvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9tc3RfdG9wb2xvZ3kuYwo+IGluZGV4IDBkNzUzMjAx
YWRiZC4uYzc4M2EyYTFjMTE0IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBf
bXN0X3RvcG9sb2d5LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9n
eS5jCj4gQEAgLTYyLDggKzYyLDYgQEAgc3RydWN0IGRybV9kcF9wZW5kaW5nX3VwX3JlcSB7Cj4g
wqBzdGF0aWMgYm9vbCBkdW1wX2RwX3BheWxvYWRfdGFibGUoc3RydWN0IGRybV9kcF9tc3RfdG9w
b2xvZ3lfbWdyICptZ3IsCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNoYXIgKmJ1Zik7Cj4gwqAKPiAtc3RhdGljIHZv
aWQgZHJtX2RwX21zdF90b3BvbG9neV9wdXRfcG9ydChzdHJ1Y3QgZHJtX2RwX21zdF9wb3J0ICpw
b3J0KTsKPiAtCj4gwqBzdGF0aWMgaW50IGRybV9kcF9kcGNkX3dyaXRlX3BheWxvYWQoc3RydWN0
IGRybV9kcF9tc3RfdG9wb2xvZ3lfbWdyICptZ3IsCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGludCBpZCwK
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgc3RydWN0IGRybV9kcF9wYXlsb2FkICpwYXlsb2FkKTsKPiBAQCAt
MTg2NCw3ICsxODYyLDcgQEAgc3RhdGljIHZvaWQgZHJtX2RwX21zdF90b3BvbG9neV9nZXRfcG9y
dChzdHJ1Y3QKPiBkcm1fZHBfbXN0X3BvcnQgKnBvcnQpCj4gwqAgKiBkcm1fZHBfbXN0X3RvcG9s
b2d5X3RyeV9nZXRfcG9ydCgpCj4gwqAgKiBkcm1fZHBfbXN0X3RvcG9sb2d5X2dldF9wb3J0KCkK
PiDCoCAqLwo+IC1zdGF0aWMgdm9pZCBkcm1fZHBfbXN0X3RvcG9sb2d5X3B1dF9wb3J0KHN0cnVj
dCBkcm1fZHBfbXN0X3BvcnQgKnBvcnQpCj4gK3ZvaWQgZHJtX2RwX21zdF90b3BvbG9neV9wdXRf
cG9ydChzdHJ1Y3QgZHJtX2RwX21zdF9wb3J0ICpwb3J0KQoKTWhoaGhoaC1jYW4geW91IHRoaW5r
IG9mIHNvbWUgd2F5IGFyb3VuZCB0aGlzPyBJIHJlYWxseSBkb24ndCB0aGluayBpdCdzIGEgZ29v
ZAppZGVhIGZvciB1cyB0byBiZSBleHBvc2luZyB0b3BvbG9neSByZWZlcmVuY2VzIHRvIHRoaW5n
cyBhcy1pcywgdGhlIHRoaW5nIGlzCnRoZXkncmUgcmVhbGx5IG1lYW50IHRvIGJlIHVzZWQgZm9y
IGNyaXRpY2FsIHNlY3Rpb25zIGluIGNvZGUgd2hlcmUgaXQnZCBiZWNvbWUKdmVyeSBwYWluZnVs
IHRvIGRlYWwgd2l0aCBhbiBtc3QgcG9ydCBkaXNhcHBlYXJpbmcgZnJvbSB1bmRlciB1cy4gT3V0
c2lkZSBvZiBNU1QKaGVscGVycywgZXZlcnlvbmUgZWxzZSBzaG91bGQgYmUgZGVhbGluZyB3aXRo
IHRoZSBleHBlY3RhdGlvbiB0aGF0IHRoZXNlIHRoaW5ncwpjYW4gZGlzYXBwZWFyIGFzIGEgcmVz
dWx0IG9mIGhvdHBsdWdzIGF0IGFueSBtb21lbnQuCgpOb3RlIHRoYXQgd2UgZG8gZXhwb3NlIG1h
bGxvYyByZWZzLCBidXQgdGhhdCdzIGludGVudGlvbmFsIGFzIGhvbGRpbmcgYSBtYWxsb2MKcmVm
IHRvIHNvbWV0aGluZyBkb2Vzbid0IGNhdXNlIGl0IHRvIHN0YXkgYXJvdW5kIGV2ZW4gd2hlbiBp
dCdzIHVucGx1Z2dlZCAtIGl0Cmp1c3Qgc3RvcHMgaXQgZnJvbSBiZWluZyB1bmFsbG9jYXRlZC4K
Cgo+IMKgewo+IMKgwqDCoMKgwqDCoMKgwqB0b3BvbG9neV9yZWZfaGlzdG9yeV9sb2NrKHBvcnQt
Pm1ncik7Cj4gwqAKPiBAQCAtMTkzNSw3ICsxOTMzLDcgQEAgZHJtX2RwX21zdF90b3BvbG9neV9n
ZXRfcG9ydF92YWxpZGF0ZWRfbG9ja2VkKHN0cnVjdAo+IGRybV9kcF9tc3RfYnJhbmNoICptc3Ri
LAo+IMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gTlVMTDsKPiDCoH0KPiDCoAo+IC1zdGF0aWMgc3Ry
dWN0IGRybV9kcF9tc3RfcG9ydCAqCj4gK3N0cnVjdCBkcm1fZHBfbXN0X3BvcnQgKgo+IMKgZHJt
X2RwX21zdF90b3BvbG9neV9nZXRfcG9ydF92YWxpZGF0ZWQoc3RydWN0IGRybV9kcF9tc3RfdG9w
b2xvZ3lfbWdyICptZ3IsCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzdHJ1Y3QgZHJtX2RwX21zdF9w
b3J0ICpwb3J0KQo+IMKgewo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS9kcm1fZHBfbXN0X2hl
bHBlci5oIGIvaW5jbHVkZS9kcm0vZHJtX2RwX21zdF9oZWxwZXIuaAo+IGluZGV4IGM3Yzc5ZTBj
ZWQxOC4uZDAzNjIyMmUwZDY0IDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUvZHJtL2RybV9kcF9tc3Rf
aGVscGVyLmgKPiArKysgYi9pbmNsdWRlL2RybS9kcm1fZHBfbXN0X2hlbHBlci5oCj4gQEAgLTc1
NCw2ICs3NTQsMTAgQEAgZHJtX2RwX21zdF9kZXRlY3RfcG9ydChzdHJ1Y3QgZHJtX2Nvbm5lY3Rv
ciAqY29ubmVjdG9yLAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIHN0cnVjdCBkcm1fZHBfbXN0X3RvcG9sb2d5X21nciAqbWdyLAo+IMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN0cnVjdCBkcm1fZHBfbXN0X3BvcnQgKnBv
cnQpOwo+IMKgCj4gK3N0cnVjdCBkcm1fZHBfbXN0X3BvcnQgKmRybV9kcF9tc3RfdG9wb2xvZ3lf
Z2V0X3BvcnRfdmFsaWRhdGVkCj4gKyhzdHJ1Y3QgZHJtX2RwX21zdF90b3BvbG9neV9tZ3IgKm1n
ciwgc3RydWN0IGRybV9kcF9tc3RfcG9ydCAqcG9ydCk7Cj4gK3ZvaWQgZHJtX2RwX21zdF90b3Bv
bG9neV9wdXRfcG9ydChzdHJ1Y3QgZHJtX2RwX21zdF9wb3J0ICpwb3J0KTsKPiArCj4gwqBzdHJ1
Y3QgZWRpZCAqZHJtX2RwX21zdF9nZXRfZWRpZChzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVj
dG9yLCBzdHJ1Y3QKPiBkcm1fZHBfbXN0X3RvcG9sb2d5X21nciAqbWdyLCBzdHJ1Y3QgZHJtX2Rw
X21zdF9wb3J0ICpwb3J0KTsKPiDCoAo+IMKgCgotLSAKU2luY2VyZWx5LAogICBMeXVkZSBQYXVs
IChzaGUvaGVyKQogICBTb2Z0d2FyZSBFbmdpbmVlciBhdCBSZWQgSGF0CiAgIApOb3RlOiBJIGRl
YWwgd2l0aCBhIGxvdCBvZiBlbWFpbHMgYW5kIGhhdmUgYSBsb3Qgb2YgYnVncyBvbiBteSBwbGF0
ZS4gSWYgeW91J3ZlCmFza2VkIG1lIGEgcXVlc3Rpb24sIGFyZSB3YWl0aW5nIGZvciBhIHJldmll
dy9tZXJnZSBvbiBhIHBhdGNoLCBldGMuIGFuZCBJCmhhdmVuJ3QgcmVzcG9uZGVkIGluIGEgd2hp
bGUsIHBsZWFzZSBmZWVsIGZyZWUgdG8gc2VuZCBtZSBhbm90aGVyIGVtYWlsIHRvIGNoZWNrCm9u
IG15IHN0YXR1cy4gSSBkb24ndCBiaXRlIQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVsCg==
