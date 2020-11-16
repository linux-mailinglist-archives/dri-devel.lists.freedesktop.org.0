Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 28D4A2B533D
	for <lists+dri-devel@lfdr.de>; Mon, 16 Nov 2020 21:53:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 432AF6EA90;
	Mon, 16 Nov 2020 20:53:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0255A6EA90
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 20:53:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605560021;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YR8enLi5JJFBoVjhQ3YblKf2ADCNsqZnAlnJJM2+oc4=;
 b=SBq78PMQTG+CLYcQI8NknbxGksTPFeWcWxxQ3nK8bASDMkQVBuq/y/iniwURsWYBnP/weY
 QizFb9+QohjXzgp4dEri1Y9fn13otuRxTyCzt27qFCCCvkVhzGugxnJrQ473HQAxnufDR+
 rrwAbVRFaVoPBuH+HwtgHoEPglAuO1E=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-573-TQM4DODPPhCM2KFOR1K3-A-1; Mon, 16 Nov 2020 15:53:39 -0500
X-MC-Unique: TQM4DODPPhCM2KFOR1K3-A-1
Received: by mail-qk1-f199.google.com with SMTP id s9so12585797qks.2
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 12:53:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=YR8enLi5JJFBoVjhQ3YblKf2ADCNsqZnAlnJJM2+oc4=;
 b=SHL8ej64cEOra5A9pYSCZpIOrP4ODPqNOnOD6hL3DrIduOdXKshJ0D3Lzv/xHSdiOY
 iEQJM/sfr768xoceabUTwWOA2PieKfMitpD3uYPmiC9RQpVXuMMyV+zv96k+Mv+vpEIE
 cTtDV8uKgI3QU7oK/B/RUZ0c+BzyVavORrlckeU+6cDAjr8yCQUOjhTpKC9ww3ym2nE7
 XTXf3GiJ5oCsqtm9deg99vpv/4Y0M0pD/Ls4WtNuwhDYbt67CXJbPLQnwpQQ0wzLvNQO
 mX+McqoF0wvd1iOPRqsMckaXheB47z8DuN7WL4ygt+dLgDzGJobCqzy7qTadfQMgZXOI
 st2Q==
X-Gm-Message-State: AOAM532LWGWay/1iBYHmBl4IxSoEiv7WTNlYQ7eQm8j3q2e0QvFb3uwd
 pEtIHhzhVDj5pyeFM+CkUXzj+C2Z4bkNDBZ74hgH0cKaJvCftVgsn48gP51YXmXdlmaibq1s5ps
 oppoJZMR4ZUgihfVXGtIZcoZwP6wm
X-Received: by 2002:a0c:e24e:: with SMTP id x14mr17712003qvl.13.1605560019159; 
 Mon, 16 Nov 2020 12:53:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz2Ux/+NGQkATK4eCnsAGkyR7ehntTZwa+eSlhdMlVrTtRjRwsSKNuQ0I3Aj0hxq0AX9UDyzQ==
X-Received: by 2002:a0c:e24e:: with SMTP id x14mr17711978qvl.13.1605560018953; 
 Mon, 16 Nov 2020 12:53:38 -0800 (PST)
Received: from Ruby.lyude.net (pool-108-49-102-102.bstnma.fios.verizon.net.
 [108.49.102.102])
 by smtp.gmail.com with ESMTPSA id 199sm8596858qkj.61.2020.11.16.12.53.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 12:53:38 -0800 (PST)
Message-ID: <2dad68f011c7cd8a7c3754457c192f9dc2f504ed.camel@redhat.com>
Subject: Re: [PATCH 29/42] drm/selftests/test-drm_dp_mst_helper: Place
 'struct drm_dp_sideband_msg_req_body' onto the heap
From: Lyude Paul <lyude@redhat.com>
To: Lee Jones <lee.jones@linaro.org>
Date: Mon, 16 Nov 2020 15:53:37 -0500
In-Reply-To: <20201116174112.1833368-30-lee.jones@linaro.org>
References: <20201116174112.1833368-1-lee.jones@linaro.org>
 <20201116174112.1833368-30-lee.jones@linaro.org>
Organization: Red Hat
User-Agent: Evolution 3.38.1 (3.38.1-1.fc33)
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
Cc: David Airlie <airlied@linux.ie>, David Francis <David.Francis@amd.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SHVoLWNvdWxkIGhhdmUgc3dvcm4gSSBoYWQgcmV2aWV3ZWQgdGhpcyBvbmUgYWxyZWFkeS4KClJl
dmlld2VkLWJ5OiBMeXVkZSBQYXVsIDxseXVkZUByZWRoYXQuY29tPgoKT24gTW9uLCAyMDIwLTEx
LTE2IGF0IDE3OjQwICswMDAwLCBMZWUgSm9uZXMgd3JvdGU6Cj4gVGhlIHN0YWNrIGlzIHRvbyBm
dWxsLgo+IAo+IEZpeGVzIHRoZSBmb2xsb3dpbmcgVz0xIGtlcm5lbCBidWlsZCB3YXJuaW5nKHMp
Ogo+IAo+IMKgZHJpdmVycy9ncHUvZHJtL3NlbGZ0ZXN0cy90ZXN0LWRybV9kcF9tc3RfaGVscGVy
LmM6IEluIGZ1bmN0aW9uCj4g4oCYc2lkZWJhbmRfbXNnX3JlcV9lbmNvZGVfZGVjb2Rl4oCZOgo+
IMKgZHJpdmVycy9ncHUvZHJtL3NlbGZ0ZXN0cy90ZXN0LWRybV9kcF9tc3RfaGVscGVyLmM6MTYx
OjE6IHdhcm5pbmc6IHRoZQo+IGZyYW1lIHNpemUgb2YgMTE3NiBieXRlcyBpcyBsYXJnZXIgdGhh
biAxMDI0IGJ5dGVzIFstV2ZyYW1lLWxhcmdlci10aGFuPV0KPiAKPiBDYzogRGF2aWQgQWlybGll
IDxhaXJsaWVkQGxpbnV4LmllPgo+IENjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+
Cj4gQ2M6IEx5dWRlIFBhdWwgPGx5dWRlQHJlZGhhdC5jb20+Cj4gQ2M6IERhdmlkIEZyYW5jaXMg
PERhdmlkLkZyYW5jaXNAYW1kLmNvbT4KPiBDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwo+IFNpZ25lZC1vZmYtYnk6IExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+Cj4g
LS0tCj4gwqAuLi4vZHJtL3NlbGZ0ZXN0cy90ZXN0LWRybV9kcF9tc3RfaGVscGVyLmPCoMKgwqAg
fCAzMSArKysrKysrKysrKystLS0tLS0tCj4gwqAxIGZpbGUgY2hhbmdlZCwgMjAgaW5zZXJ0aW9u
cygrKSwgMTEgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9z
ZWxmdGVzdHMvdGVzdC1kcm1fZHBfbXN0X2hlbHBlci5jCj4gYi9kcml2ZXJzL2dwdS9kcm0vc2Vs
ZnRlc3RzL3Rlc3QtZHJtX2RwX21zdF9oZWxwZXIuYwo+IGluZGV4IDFkNjk2ZWMwMDFjZmYuLmUw
MGJkYzU1N2Y4ODAgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3NlbGZ0ZXN0cy90ZXN0
LWRybV9kcF9tc3RfaGVscGVyLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vc2VsZnRlc3RzL3Rl
c3QtZHJtX2RwX21zdF9oZWxwZXIuYwo+IEBAIC0xMjAsNDQgKzEyMCw1MyBAQCBzaWRlYmFuZF9t
c2dfcmVxX2VxdWFsKGNvbnN0IHN0cnVjdAo+IGRybV9kcF9zaWRlYmFuZF9tc2dfcmVxX2JvZHkg
KmluLAo+IMKgc3RhdGljIGJvb2wKPiDCoHNpZGViYW5kX21zZ19yZXFfZW5jb2RlX2RlY29kZShz
dHJ1Y3QgZHJtX2RwX3NpZGViYW5kX21zZ19yZXFfYm9keSAqaW4pCj4gwqB7Cj4gLcKgwqDCoMKg
wqDCoMKgc3RydWN0IGRybV9kcF9zaWRlYmFuZF9tc2dfcmVxX2JvZHkgb3V0ID0gezB9Owo+ICvC
oMKgwqDCoMKgwqDCoHN0cnVjdCBkcm1fZHBfc2lkZWJhbmRfbXNnX3JlcV9ib2R5ICpvdXQ7Cj4g
wqDCoMKgwqDCoMKgwqDCoHN0cnVjdCBkcm1fcHJpbnRlciBwID0gZHJtX2Vycl9wcmludGVyKFBS
RUZJWF9TVFIpOwo+IMKgwqDCoMKgwqDCoMKgwqBzdHJ1Y3QgZHJtX2RwX3NpZGViYW5kX21zZ190
eCB0eG1zZzsKPiDCoMKgwqDCoMKgwqDCoMKgaW50IGksIHJldDsKPiArwqDCoMKgwqDCoMKgwqBi
b29sIHJlc3VsdCA9IHRydWU7Cj4gKwo+ICvCoMKgwqDCoMKgwqDCoG91dCA9IGt6YWxsb2Moc2l6
ZW9mKCpvdXQpLCBHRlBfS0VSTkVMKTsKPiArwqDCoMKgwqDCoMKgwqBpZiAoIW91dCkKPiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIGZhbHNlOwo+IMKgCj4gwqDCoMKgwqDC
oMKgwqDCoGRybV9kcF9lbmNvZGVfc2lkZWJhbmRfcmVxKGluLCAmdHhtc2cpOwo+IC3CoMKgwqDC
oMKgwqDCoHJldCA9IGRybV9kcF9kZWNvZGVfc2lkZWJhbmRfcmVxKCZ0eG1zZywgJm91dCk7Cj4g
K8KgwqDCoMKgwqDCoMKgcmV0ID0gZHJtX2RwX2RlY29kZV9zaWRlYmFuZF9yZXEoJnR4bXNnLCBv
dXQpOwo+IMKgwqDCoMKgwqDCoMKgwqBpZiAocmV0IDwgMCkgewo+IMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgZHJtX3ByaW50ZigmcCwgIkZhaWxlZCB0byBkZWNvZGUgc2lkZWJhbmQg
cmVxdWVzdDogJWRcbiIsCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCByZXQpOwo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXR1
cm4gZmFsc2U7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJlc3VsdCA9IGZhbHNl
Owo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBnb3RvIG91dDsKPiDCoMKgwqDCoMKg
wqDCoMKgfQo+IMKgCj4gLcKgwqDCoMKgwqDCoMKgaWYgKCFzaWRlYmFuZF9tc2dfcmVxX2VxdWFs
KGluLCAmb3V0KSkgewo+ICvCoMKgwqDCoMKgwqDCoGlmICghc2lkZWJhbmRfbXNnX3JlcV9lcXVh
bChpbiwgb3V0KSkgewo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZHJtX3ByaW50
ZigmcCwgIkVuY29kZS9kZWNvZGUgZmFpbGVkLCBleHBlY3RlZDpcbiIpOwo+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgZHJtX2RwX2R1bXBfc2lkZWJhbmRfbXNnX3JlcV9ib2R5KGlu
LCAxLCAmcCk7Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBkcm1fcHJpbnRmKCZw
LCAiR290OlxuIik7Cj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGRybV9kcF9kdW1w
X3NpZGViYW5kX21zZ19yZXFfYm9keSgmb3V0LCAxLCAmcCk7Cj4gLcKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoHJldHVybiBmYWxzZTsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgZHJtX2RwX2R1bXBfc2lkZWJhbmRfbXNnX3JlcV9ib2R5KG91dCwgMSwgJnApOwo+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXN1bHQgPSBmYWxzZTsKPiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgZ290byBvdXQ7Cj4gwqDCoMKgwqDCoMKgwqDCoH0KPiDCoAo+IMKg
wqDCoMKgwqDCoMKgwqBzd2l0Y2ggKGluLT5yZXFfdHlwZSkgewo+IMKgwqDCoMKgwqDCoMKgwqBj
YXNlIERQX1JFTU9URV9EUENEX1dSSVRFOgo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqBrZnJlZShvdXQudS5kcGNkX3dyaXRlLmJ5dGVzKTsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKga2ZyZWUob3V0LT51LmRwY2Rfd3JpdGUuYnl0ZXMpOwo+IMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgYnJlYWs7Cj4gwqDCoMKgwqDCoMKgwqDCoGNhc2UgRFBfUkVNT1RF
X0kyQ19SRUFEOgo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBmb3IgKGkgPSAwOyBp
IDwgb3V0LnUuaTJjX3JlYWQubnVtX3RyYW5zYWN0aW9uczsgaSsrKQo+IC3CoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKga2ZyZWUob3V0LnUuaTJjX3JlYWQudHJh
bnNhY3Rpb25zW2ldLmJ5dGVzKTsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZm9y
IChpID0gMDsgaSA8IG91dC0+dS5pMmNfcmVhZC5udW1fdHJhbnNhY3Rpb25zOyBpKyspCj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBrZnJlZShvdXQtPnUu
aTJjX3JlYWQudHJhbnNhY3Rpb25zW2ldLmJ5dGVzKTsKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoGJyZWFrOwo+IMKgwqDCoMKgwqDCoMKgwqBjYXNlIERQX1JFTU9URV9JMkNfV1JJ
VEU6Cj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGtmcmVlKG91dC51LmkyY193cml0
ZS5ieXRlcyk7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGtmcmVlKG91dC0+dS5p
MmNfd3JpdGUuYnl0ZXMpOwo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgYnJlYWs7
Cj4gwqDCoMKgwqDCoMKgwqDCoH0KPiDCoAo+IMKgwqDCoMKgwqDCoMKgwqAvKiBDbGVhciBldmVy
eXRoaW5nIGJ1dCB0aGUgcmVxX3R5cGUgZm9yIHRoZSBpbnB1dCAqLwo+IMKgwqDCoMKgwqDCoMKg
wqBtZW1zZXQoJmluLT51LCAwLCBzaXplb2YoaW4tPnUpKTsKPiDCoAo+IC3CoMKgwqDCoMKgwqDC
oHJldHVybiB0cnVlOwo+ICtvdXQ6Cj4gK8KgwqDCoMKgwqDCoMKga2ZyZWUob3V0KTsKPiArwqDC
oMKgwqDCoMKgwqByZXR1cm4gcmVzdWx0Owo+IMKgfQo+IMKgCj4gwqBpbnQgaWd0X2RwX21zdF9z
aWRlYmFuZF9tc2dfcmVxX2RlY29kZSh2b2lkICp1bnVzZWQpCgotLSAKQ2hlZXJzLAogTHl1ZGUg
UGF1bCAoc2hlL2hlcikKIFNvZnR3YXJlIEVuZ2luZWVyIGF0IFJlZCBIYXQKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
