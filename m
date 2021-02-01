Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D946430B26A
	for <lists+dri-devel@lfdr.de>; Mon,  1 Feb 2021 22:58:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6E856E88A;
	Mon,  1 Feb 2021 21:58:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2252C6E887
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Feb 2021 21:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612216711;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pAv56oszImRnWuGI/mjFlmDAjkrJfHgnXQKipCrtRz4=;
 b=ZxPrN0ETvLqZAPWB2xpa7p2XpbF62co53vUWvDI/ZkQX7B7kyd48hJ1Mb4wlOLFOeSPPsa
 N4ZUyixlQ9QAzkjvsthrN/TFnZGh3Q4W2OqNvGaj6My1sxnRQ5gGbUzDBlsLwLzf5OJyhC
 uGHnce5/fwy6TIJXyplNNIVmS5OJ3zw=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-422-RwdwVNerNz-bl6v0G019aQ-1; Mon, 01 Feb 2021 16:58:27 -0500
X-MC-Unique: RwdwVNerNz-bl6v0G019aQ-1
Received: by mail-qt1-f199.google.com with SMTP id r18so11659680qta.19
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Feb 2021 13:58:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:reply-to:to:cc:date
 :in-reply-to:references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=pAv56oszImRnWuGI/mjFlmDAjkrJfHgnXQKipCrtRz4=;
 b=PzDLQPgRTDU6ZAe9Kvex7zxtORZ46XO4bM969RgwkpTqMf7oIXZarOEQUgM7misqp4
 eS/stVpkjgWZdYCiX1PkJBmgxAaiw7/hiPr2a2TcAZc/OJqD8PPcCxLC5AkL7nEZsL5d
 fwBWWJENxrNafSviGk0q1LDZAjgVq/P3oZMvtFnq+WMcrWhvs3v+ALrvlZGdKgRIzvi0
 7NyWSARh7ffEKZmwKq8Zz5afRbDnGLjffvncBEAuvoXavgzOwEnY8GASaC/bY82GMO0S
 mmtiluQJovJpM/wwYvoSllvPUFXOQK23TlDRY5MhqyuADm36gCICrrAN3Ozy22ecO+YG
 VX7A==
X-Gm-Message-State: AOAM533ZHaZaG9OWgCGPzfHRtXzI05rWdSZrGu6XBOTN7aW823GsvelA
 nLSG2X8Y4CuhFh1t2SGzpADP1yRs9cy2ozX8/Ft3WOTYJ7y9Y9lRncNtqToC+PQHx/+phRbHo25
 RubsfrXjUQpkZZLVH81xu5eSa1/p3
X-Received: by 2002:a0c:a819:: with SMTP id w25mr17274553qva.6.1612216706995; 
 Mon, 01 Feb 2021 13:58:26 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwGyF7f7x2RmxXI8G7IMQJG+Z8oD/nTW3p2NHQwvns5+ePaKwqtdiFtS+Qd9r3JMb4BC7MPEA==
X-Received: by 2002:a0c:a819:: with SMTP id w25mr17274539qva.6.1612216706848; 
 Mon, 01 Feb 2021 13:58:26 -0800 (PST)
Received: from Whitewolf.lyude.net
 (pool-108-49-102-102.bstnma.fios.verizon.net. [108.49.102.102])
 by smtp.gmail.com with ESMTPSA id 186sm15487568qkh.30.2021.02.01.13.58.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Feb 2021 13:58:26 -0800 (PST)
Message-ID: <5f2e7207e5227bdeb3c8e8cf453757cfbb5a4344.camel@redhat.com>
Subject: Re: [PATCH v3 2/4] drm_dp_mst_topology: use correct AUX channel
From: Lyude Paul <lyude@redhat.com>
To: Sam McNally <sammc@chromium.org>, LKML <linux-kernel@vger.kernel.org>
Date: Mon, 01 Feb 2021 16:58:25 -0500
In-Reply-To: <20200923121320.v3.2.Ided0ab0808c4908238bd2eb9ebb6ffb2c9312789@changeid>
References: <20200923121320.v3.1.I8693156f555875e5c8342e86ab37ce968dfdd277@changeid>
 <20200923121320.v3.2.Ided0ab0808c4908238bd2eb9ebb6ffb2c9312789@changeid>
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
cm9tOiBIYW5zIFZlcmt1aWwgPGhhbnMudmVya3VpbEBjaXNjby5jb20+Cj4gCj4gRm9yIGFkYXB0
ZXJzIGJlaGluZCBhbiBNU1QgaHViIHVzZSB0aGUgY29ycmVjdCBBVVggY2hhbm5lbC4KPiAKPiBT
aWduZWQtb2ZmLWJ5OiBIYW5zIFZlcmt1aWwgPGhhbnMudmVya3VpbEBjaXNjby5jb20+Cj4gW3Nh
bW1jQGNocm9taXVtLm9yZzogcmViYXNlZCwgcmVtb3ZpbmcgcmVkdW5kYW50IGNoYW5nZXNdCj4g
U2lnbmVkLW9mZi1ieTogU2FtIE1jTmFsbHkgPHNhbW1jQGNocm9taXVtLm9yZz4KPiAtLS0KPiAK
PiAobm8gY2hhbmdlcyBzaW5jZSB2MSkKPiAKPiDCoGRyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0
X3RvcG9sb2d5LmMgfCAzNiArKysrKysrKysrKysrKysrKysrKysrKysrKysKPiDCoDEgZmlsZSBj
aGFuZ2VkLCAzNiBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMKPiBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3Rv
cG9sb2d5LmMKPiBpbmRleCAxNWI2Y2MzOWE3NTQuLjBkNzUzMjAxYWRiZCAxMDA2NDQKPiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jCj4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL2RybV9kcF9tc3RfdG9wb2xvZ3kuYwo+IEBAIC0yMjU1LDYgKzIyNTUsOSBAQCBkcm1f
ZHBfbXN0X3RvcG9sb2d5X3VubGlua19wb3J0KHN0cnVjdAo+IGRybV9kcF9tc3RfdG9wb2xvZ3lf
bWdyICptZ3IsCj4gwqDCoMKgwqDCoMKgwqDCoGRybV9kcF9tc3RfdG9wb2xvZ3lfcHV0X3BvcnQo
cG9ydCk7Cj4gwqB9Cj4gwqAKPiArc3RhdGljIHNzaXplX3QKPiArZHJtX2RwX21zdF9hdXhfdHJh
bnNmZXIoc3RydWN0IGRybV9kcF9hdXggKmF1eCwgc3RydWN0IGRybV9kcF9hdXhfbXNnICptc2cp
Owo+ICsKPiDCoHN0YXRpYyBzdHJ1Y3QgZHJtX2RwX21zdF9wb3J0ICoKPiDCoGRybV9kcF9tc3Rf
YWRkX3BvcnQoc3RydWN0IGRybV9kZXZpY2UgKmRldiwKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBzdHJ1Y3QgZHJtX2RwX21zdF90b3BvbG9neV9tZ3IgKm1nciwKPiBA
QCAtMjI3MSw5ICsyMjc0LDEzIEBAIGRybV9kcF9tc3RfYWRkX3BvcnQoc3RydWN0IGRybV9kZXZp
Y2UgKmRldiwKPiDCoMKgwqDCoMKgwqDCoMKgcG9ydC0+cG9ydF9udW0gPSBwb3J0X251bWJlcjsK
PiDCoMKgwqDCoMKgwqDCoMKgcG9ydC0+bWdyID0gbWdyOwo+IMKgwqDCoMKgwqDCoMKgwqBwb3J0
LT5hdXgubmFtZSA9ICJEUE1TVCI7Cj4gK8KgwqDCoMKgwqDCoMKgbXV0ZXhfaW5pdCgmcG9ydC0+
YXV4Lmh3X211dGV4KTsKPiArwqDCoMKgwqDCoMKgwqBtdXRleF9pbml0KCZwb3J0LT5hdXguY2Vj
LmxvY2spOwoKWW91J3JlIG1pc3NpbmcgYSBtYXRjaGluZyBtdXRleF9kZXN0cm95KCkgZm9yIGJv
dGggb2YgdGhlc2UKCldpdGggdGhhdCBmaXhlZDoKClJldmlld2VkLWJ5OiBMeXVkZSBQYXVsIDxs
eXVkZUByZWRoYXQuY29tPgoKPiDCoMKgwqDCoMKgwqDCoMKgcG9ydC0+YXV4LmRldiA9IGRldi0+
ZGV2Owo+IMKgwqDCoMKgwqDCoMKgwqBwb3J0LT5hdXguaXNfcmVtb3RlID0gdHJ1ZTsKPiDCoAo+
ICvCoMKgwqDCoMKgwqDCoHBvcnQtPmF1eC50cmFuc2ZlciA9IGRybV9kcF9tc3RfYXV4X3RyYW5z
ZmVyOwo+ICsKPiDCoMKgwqDCoMKgwqDCoMKgLyogaW5pdGlhbGl6ZSB0aGUgTVNUIGRvd25zdHJl
YW0gcG9ydCdzIEFVWCBjcmMgd29yayBxdWV1ZSAqLwo+IMKgwqDCoMKgwqDCoMKgwqBkcm1fZHBf
cmVtb3RlX2F1eF9pbml0KCZwb3J0LT5hdXgpOwo+IMKgCj4gQEAgLTM1MDMsNiArMzUxMCwzNSBA
QCBzdGF0aWMgaW50IGRybV9kcF9zZW5kX3VwX2Fja19yZXBseShzdHJ1Y3QKPiBkcm1fZHBfbXN0
X3RvcG9sb2d5X21nciAqbWdyLAo+IMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gMDsKPiDCoH0KPiDC
oAo+ICtzdGF0aWMgc3NpemVfdAo+ICtkcm1fZHBfbXN0X2F1eF90cmFuc2ZlcihzdHJ1Y3QgZHJt
X2RwX2F1eCAqYXV4LCBzdHJ1Y3QgZHJtX2RwX2F1eF9tc2cgKm1zZykKPiArewo+ICvCoMKgwqDC
oMKgwqDCoHN0cnVjdCBkcm1fZHBfbXN0X3BvcnQgKnBvcnQgPQo+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqBjb250YWluZXJfb2YoYXV4LCBzdHJ1Y3QgZHJtX2RwX21zdF9wb3J0LCBh
dXgpOwo+ICvCoMKgwqDCoMKgwqDCoGludCByZXQ7Cj4gKwo+ICvCoMKgwqDCoMKgwqDCoHN3aXRj
aCAobXNnLT5yZXF1ZXN0ICYgfkRQX0FVWF9JMkNfTU9UKSB7Cj4gK8KgwqDCoMKgwqDCoMKgY2Fz
ZSBEUF9BVVhfTkFUSVZFX1dSSVRFOgo+ICvCoMKgwqDCoMKgwqDCoGNhc2UgRFBfQVVYX0kyQ19X
UklURToKPiArwqDCoMKgwqDCoMKgwqBjYXNlIERQX0FVWF9JMkNfV1JJVEVfU1RBVFVTX1VQREFU
RToKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0ID0gZHJtX2RwX3NlbmRfZHBj
ZF93cml0ZShwb3J0LT5tZ3IsIHBvcnQsIG1zZy0+YWRkcmVzcywKPiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgbXNnLT5zaXplLCBtc2ctPmJ1ZmZlcik7Cj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoGJyZWFrOwo+ICsKPiArwqDCoMKgwqDCoMKgwqBjYXNlIERQX0FVWF9O
QVRJVkVfUkVBRDoKPiArwqDCoMKgwqDCoMKgwqBjYXNlIERQX0FVWF9JMkNfUkVBRDoKPiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0ID0gZHJtX2RwX3NlbmRfZHBjZF9yZWFkKHBv
cnQtPm1nciwgcG9ydCwgbXNnLT5hZGRyZXNzLAo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgbXNnLT5zaXplLCBtc2ctPmJ1ZmZlcik7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoGJyZWFrOwo+ICsKPiArwqDCoMKgwqDCoMKgwqBkZWZhdWx0Ogo+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqByZXQgPSAtRUlOVkFMOwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqBicmVhazsKPiArwqDCoMKgwqDCoMKgwqB9Cj4gKwo+ICvCoMKgwqDCoMKgwqDCoHJl
dHVybiByZXQ7Cj4gK30KPiArCj4gwqBzdGF0aWMgaW50IGRybV9kcF9nZXRfdmNfcGF5bG9hZF9i
dyh1OCBkcF9saW5rX2J3LCB1OMKgIGRwX2xpbmtfY291bnQpCj4gwqB7Cj4gwqDCoMKgwqDCoMKg
wqDCoGlmIChkcF9saW5rX2J3ID09IDAgfHwgZHBfbGlua19jb3VudCA9PSAwKQoKLS0gClNpbmNl
cmVseSwKICAgTHl1ZGUgUGF1bCAoc2hlL2hlcikKICAgU29mdHdhcmUgRW5naW5lZXIgYXQgUmVk
IEhhdAogICAKTm90ZTogSSBkZWFsIHdpdGggYSBsb3Qgb2YgZW1haWxzIGFuZCBoYXZlIGEgbG90
IG9mIGJ1Z3Mgb24gbXkgcGxhdGUuIElmIHlvdSd2ZQphc2tlZCBtZSBhIHF1ZXN0aW9uLCBhcmUg
d2FpdGluZyBmb3IgYSByZXZpZXcvbWVyZ2Ugb24gYSBwYXRjaCwgZXRjLiBhbmQgSQpoYXZlbid0
IHJlc3BvbmRlZCBpbiBhIHdoaWxlLCBwbGVhc2UgZmVlbCBmcmVlIHRvIHNlbmQgbWUgYW5vdGhl
ciBlbWFpbCB0byBjaGVjawpvbiBteSBzdGF0dXMuIEkgZG9uJ3QgYml0ZSEKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
