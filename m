Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 130BF9A268
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2019 23:55:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C34A96EB4A;
	Thu, 22 Aug 2019 21:55:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AFC36EB4A
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2019 21:55:51 +0000 (UTC)
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id D1188CF22
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2019 21:55:50 +0000 (UTC)
Received: by mail-qk1-f197.google.com with SMTP id d203so7303101qke.4
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2019 14:55:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=xb2aQlbqkl2FnmDOsmR6AogMqVrVtWokZc7k83xSGi4=;
 b=XHP/SrJHm8T0XfudLzAozVXnF10FF8+oma50s0Kka6KJtzelvx1pYtKnyLcw/1ImF6
 o3H/ROXcRXVbakc3FcSPQvHBg8d2NiaS0aFXC7bBwesq5De4Ri7fNbczAwf00Q8Kzakl
 /FJokhpBDnlBUJEu6Is1FvzNgKl/cWHJzY+SbC3/0BOLJu5BNT2JGlyq8b0JRAit2l2S
 rEjkW9KQEd+lVXj1cbgnoeKRSitufVm+wggHPuz7sj+OKvPYEGRVhAO19kNItsW6kHi8
 R3d/rxr9lFmpeUX3ZMxTl1dgESNg/vWn3g3ixlFSxlHw+tZkyj5QeFh1XBHq4qClS7K7
 LnSw==
X-Gm-Message-State: APjAAAWSoqXSWux8eMV0W6uuxjVFhVAfXxCneiAn/6ygbqYYrsX4jjtg
 /gEcmlHSuSyEPBxi/nr3g5O5zk8ALbo1xmmmKO5WtdEpxQAtQGZzpZVQUAMrxh0ND2AGeixSakz
 c9ANRWdVES6VZeetQr0RHYAeS4ee7
X-Received: by 2002:a0c:b209:: with SMTP id x9mr1439239qvd.217.1566510950030; 
 Thu, 22 Aug 2019 14:55:50 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwFTP03u+U6ouw3i8DknTV10ZInQDqdftToWEnhCpr1/kd9YtbAqGbVMLyES2v9I2Px+UfEgQ==
X-Received: by 2002:a0c:b209:: with SMTP id x9mr1439230qvd.217.1566510949793; 
 Thu, 22 Aug 2019 14:55:49 -0700 (PDT)
Received: from dhcp-10-20-1-11.bss.redhat.com ([144.121.20.162])
 by smtp.gmail.com with ESMTPSA id x8sm416832qtb.73.2019.08.22.14.55.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Aug 2019 14:55:49 -0700 (PDT)
Message-ID: <797d5a92cbcf2f3de9e2ee6be92e34a2d26f1bcb.camel@redhat.com>
Subject: Re: [PATCH v4 4/5] drm/dp-mst: Fill branch->num_ports
From: Lyude Paul <lyude@redhat.com>
To: David Francis <David.Francis@amd.com>, dri-devel@lists.freedesktop.org
Date: Thu, 22 Aug 2019 17:55:48 -0400
In-Reply-To: <20190822135741.12923-5-David.Francis@amd.com>
References: <20190822135741.12923-1-David.Francis@amd.com>
 <20190822135741.12923-5-David.Francis@amd.com>
Organization: Red Hat
User-Agent: Evolution 3.32.4 (3.32.4-1.fc30) 
MIME-Version: 1.0
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAyMDE5LTA4LTIyIGF0IDA5OjU3IC0wNDAwLCBEYXZpZCBGcmFuY2lzIHdyb3RlOgo+
IFRoaXMgZmllbGQgb24gZHJtX2RwX21zdF9icmFuY2ggd2FzIG5ldmVyIGZpbGxlZAo+IAo+IElu
aXRpYWxpemUgaXQgdG8gemVybyB3aGVuIHRoZSBsaXN0IG9mIHBvcnRzIGlzIGNyZWF0ZWQuCj4g
V2hlbiBhIHBvcnQgaXMgYWRkZWQgdG8gdGhlIGxpc3QsIGluY3JlbWVudCBudW1fcG9ydHMsCj4g
YW5kIHdoZW4gYSBwb3J0IGlzIHJlbW92ZWQgZnJvbSB0aGUgbGlzdCwgZGVjcmVtZW50IG51bV9w
b3J0cy4KPiAKPiB2MjogcmVtZW1iZXIgdG8gZGVjcmVtZW50IG9uIHBvcnQgcmVtb3ZhbAo+IAo+
IFNpZ25lZC1vZmYtYnk6IERhdmlkIEZyYW5jaXMgPERhdmlkLkZyYW5jaXNAYW1kLmNvbT4KPiBS
ZXZpZXdlZC1ieTogTHl1ZGUgUGF1bCA8bHl1ZGVAcmVkaGF0LmNvbT4KPiAtLS0KPiAgZHJpdmVy
cy9ncHUvZHJtL2RybV9kcF9tc3RfdG9wb2xvZ3kuYyB8IDMgKysrCj4gIDEgZmlsZSBjaGFuZ2Vk
LCAzIGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9k
cF9tc3RfdG9wb2xvZ3kuYwo+IGIvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9tc3RfdG9wb2xvZ3ku
Ywo+IGluZGV4IDUwYTA0NDcxODQzOS4uYWY0YjVjZWM3Yzg0IDEwMDY0NAo+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
ZHJtX2RwX21zdF90b3BvbG9neS5jCj4gQEAgLTkxOSw2ICs5MTksNyBAQCBzdGF0aWMgc3RydWN0
IGRybV9kcF9tc3RfYnJhbmNoCj4gKmRybV9kcF9hZGRfbXN0X2JyYW5jaF9kZXZpY2UodTggbGN0
LCB1OCAqcmFkKQo+ICAJSU5JVF9MSVNUX0hFQUQoJm1zdGItPnBvcnRzKTsKPiAgCWtyZWZfaW5p
dCgmbXN0Yi0+dG9wb2xvZ3lfa3JlZik7Cj4gIAlrcmVmX2luaXQoJm1zdGItPm1hbGxvY19rcmVm
KTsKPiArCW1zdGItPm51bV9wb3J0cyA9IDA7CgpKdXN0IHJlYWxpemVkIGFzIHdlbGwsIHdlIGNh
biBkcm9wIHRoZSBtc3RiLT5udW1fcG9ydHMgPSAwOyBoZXJlLCBzaW5jZSB3ZSdyZQphbGxvY2F0
aW5nIHRoZSBzdHJ1Y3Qgd2l0aCBremFsbG9jKCkKCj4gIAlyZXR1cm4gbXN0YjsKPiAgfQo+ICAK
PiBAQCAtMTY2OSw2ICsxNjcwLDcgQEAgc3RhdGljIHZvaWQgZHJtX2RwX2FkZF9wb3J0KHN0cnVj
dCBkcm1fZHBfbXN0X2JyYW5jaAo+ICptc3RiLAo+ICAJCW11dGV4X2xvY2soJm1zdGItPm1nci0+
bG9jayk7Cj4gIAkJZHJtX2RwX21zdF90b3BvbG9neV9nZXRfcG9ydChwb3J0KTsKPiAgCQlsaXN0
X2FkZCgmcG9ydC0+bmV4dCwgJm1zdGItPnBvcnRzKTsKPiArCQltc3RiLT5udW1fcG9ydHMrKzsK
PiAgCQltdXRleF91bmxvY2soJm1zdGItPm1nci0+bG9jayk7Cj4gIAl9Cj4gIAo+IEBAIC0xNzAz
LDYgKzE3MDUsNyBAQCBzdGF0aWMgdm9pZCBkcm1fZHBfYWRkX3BvcnQoc3RydWN0IGRybV9kcF9t
c3RfYnJhbmNoCj4gKm1zdGIsCj4gIAkJCS8qIHJlbW92ZSBpdCBmcm9tIHRoZSBwb3J0IGxpc3Qg
Ki8KPiAgCQkJbXV0ZXhfbG9jaygmbXN0Yi0+bWdyLT5sb2NrKTsKPiAgCQkJbGlzdF9kZWwoJnBv
cnQtPm5leHQpOwo+ICsJCQltc3RiLT5udW1fcG9ydHMtLTsKPiAgCQkJbXV0ZXhfdW5sb2NrKCZt
c3RiLT5tZ3ItPmxvY2spOwo+ICAJCQkvKiBkcm9wIHBvcnQgbGlzdCByZWZlcmVuY2UgKi8KPiAg
CQkJZHJtX2RwX21zdF90b3BvbG9neV9wdXRfcG9ydChwb3J0KTsKLS0gCkNoZWVycywKCUx5dWRl
IFBhdWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
