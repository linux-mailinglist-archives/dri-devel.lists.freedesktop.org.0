Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B064148AC4
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2019 19:49:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B61A892B9;
	Mon, 17 Jun 2019 17:49:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B205892B1;
 Mon, 17 Jun 2019 17:49:28 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id z23so294065wma.4;
 Mon, 17 Jun 2019 10:49:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=7EubtHn6FXXgA3jp3gnDNmcdJP2fdmnFVCmC8qrn1B8=;
 b=UbxlbuIMNfGegKUIbCacfcnoL4U7hFJ5uh9FAF7UZpyfxJPpeVgDQV2PSAKVeGkU1D
 PMs/E6Fz2U3kDPagignS774UToNSjiLWr6pzyxpWfji3QicqsafLjicYCF8mAqMQno2U
 RrwIkYGpXaDcfChjMTKbbHPu+KZ0TO4qvDb/dBWFrwfM1FuHoAt1TMgjQNsqqArIW2We
 rbWKGpKkhOjZO8cS0uETIIWtLXCSSDj7hLhK7zQu3arsH6UbPosJCuyX7H3KW5n/n34K
 keisnekOAlCV4D28DaiTVON0bP836DrefH9S96mK6w1hKGl/X5RG9tvQbZ+9y8np2Yne
 H6QQ==
X-Gm-Message-State: APjAAAUIHTWMl5ETTEG82r9HC/miabunkP03I1o0x8Lu95CzK01FV0Dv
 4OHeKn2ChrWMOmXzck9W27vdfg/8
X-Google-Smtp-Source: APXvYqwYnIongBIiZOCD9BJ5/wV7VQxN/YZ441+nTgfNvU+VSrH0siViqY25UbtGMy6n+SnoG7MwAw==
X-Received: by 2002:a1c:a848:: with SMTP id r69mr19139000wme.12.1560793762995; 
 Mon, 17 Jun 2019 10:49:22 -0700 (PDT)
Received: from arch-x1c3 ([2a00:5f00:102:0:9665:9cff:feee:aa4d])
 by smtp.gmail.com with ESMTPSA id r2sm16858619wma.26.2019.06.17.10.49.21
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 10:49:21 -0700 (PDT)
Date: Mon, 17 Jun 2019 18:47:20 +0100
From: Emil Velikov <emil.l.velikov@gmail.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [Intel-gfx] [PATCH 03/59] drm/prime: Update docs
Message-ID: <20190617174720.GC26766@arch-x1c3>
References: <20190614203615.12639-1-daniel.vetter@ffwll.ch>
 <20190614203615.12639-4-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190614203615.12639-4-daniel.vetter@ffwll.ch>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=7EubtHn6FXXgA3jp3gnDNmcdJP2fdmnFVCmC8qrn1B8=;
 b=E6LaiDsn9hqRza00XaLohk74XiT17+xXYeZu/G/JTF77+w82nuvTsKF51YX8KFsEaB
 2H3gCXwZkkaSUej+ckOIvfS9ykNYK7kLVqofrBzbitDxEYYnnzcAODVnNqDjjWnW/2u6
 fE+ZrgMUtvl5o9U3DBfaOv2paSnZDIezI2ooNLxINt18fV2ff8c9g05locmKmTHmqVS+
 /M84J+fJRa/ICUlSAcZ8og2ZchTxXN+eqWGyhZqMldhzpZccrCmvZmeRoF1SsGGqDfsl
 1Kzz1wkbSoiuULyl1sWrWAzXfN9rhLycE9uoNuu3EODTxAqLX8fs9xg0KzteSrfW+wZ2
 +V7Q==
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS8wNi8xNCwgRGFuaWVsIFZldHRlciB3cm90ZToKPiBZZXMgdGhpcyBpcyBhIGJpdCBh
IGJpZyBwYXRjaCwgYnV0IHNpbmNlIGl0J3MgZXNzZW50aWFsbHkgYSBjb21wbGV0ZQo+IHJld3Jp
dGUgb2YgYWxsIHRoZSBwcmltZSBkb2NzIEkgZGlkbid0IHNlZSBob3cgdG8gYmV0dGVyIHNwbGl0
IGl0IHVwLgo+IAo+IENoYW5nZXM6Cj4gLSBDb25zaXN0ZW50bHkgcG9pbnQgdG8gZHJtX2dlbV9v
YmplY3RfZnVuY3MgYXMgdGhlIHByZWZlcnJlZCBob29rcywKPiAgIHdoZXJlIGFwcGxpY2FibGUu
Cj4gCj4gLSBSZW9yZGVyIGFsbCB0aGUgZnVuY3Rpb25zIGluIGRybV9wcmltZS5baGNdIGludG8g
dGhyZWUgZ3JvdXBzOiBjb3JlLAo+ICAgZXhwb3J0IGhlbHBlcnMsIGltcG9ydCBoZWxwZXJzLgo+
IAo+IC0gRG9jdW1lbnQgYWxsIHRoZSBob29rcyBpbiAmZHJtX2RyaXZlciB0aGF0IGxhY2tlZCBr
ZXJuZWxkb2MuCj4gCj4gLSBDb21wbGV0ZWx5IG5ldyBvdmVydmlldyBzZWN0aW9uLCB3aGljaCBu
b3cgYWxzbyBpbmNsdWRlcyB0aGUgY2xlYW5lZAo+ICAgdXAgbGlmZXRpbWUvcmVmZXJlbmNlIGNv
dW50aW5nIHN1YmNoYXB0ZXIuIEkgYWxzbyBtZW50aW9uZWQgdGhlIHdlYWsKPiAgIHJlZmVyZW5j
ZXMgaW4gdGhlcmUgZHVlIHRvIHRoZSBsb29rdXAgY2FjaGVzLgo+IAo+IC0gQ29tcGxldGVseSBy
ZXdyaXR0ZW4gaGVscGVyIGludHJvIHNlY3Rpb24sIGhpZ2hsaWdodCB0aGUKPiAgIGltcG9ydC9l
eHBvcnQgcmVsYXRlZCBmdW5jdGlvbmFsaXR5Lgo+IAo+IC0gUG9saXNoIGZvciBhbGwgdGhlIGZ1
bmN0aW9ucyBhbmQgbW9yZSBjcm9zcyByZWZlcmVuY2VzLgo+IAo+IEkgYWxzbyBzcHJpbmtsZWQg
YSBidW5jaCBvZiB0b2RvcyBhbGwgb3Zlci4KPiAKPiBNb3N0IGltcG9ydGFudDogMCBjb2RlIGNo
YW5nZXMgaW4gaGVyZS4gVGhlIGNsZWFudXAgbW90aXZhdGVkIGJ5Cj4gcmVhZGluZyBhbmQgaW1w
cm92aW5nIGFsbCB0aGlzIHdpbGwgZm9sbG93IGxhdGVyIG9uLgo+IAo+IHYyOiBBY3R1YWxseSB1
cGRhdGUgdGhlIHByaW1lIGhlbHBlciBkb2NzLiBQbHVzIGFkZCBhIGZldyBGSVhNRXMgdGhhdAo+
IEkgd29uJ3QgYWRkcmVzcyByaWdodCBhd2F5IGluIHN1YnNlcXVlbnQgY2xlYW51cCBwYXRjaGVz
Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAaW50ZWwu
Y29tPgo+IC0tLQo+ICBEb2N1bWVudGF0aW9uL2dwdS9kcm0tbW0ucnN0IHwgIDQwICstCj4gIGRy
aXZlcnMvZ3B1L2RybS9kcm1fcHJpbWUuYyAgfCA4NTEgKysrKysrKysrKysrKysrKysrLS0tLS0t
LS0tLS0tLS0tLS0KPiAgaW5jbHVkZS9kcm0vZHJtX2Rydi5oICAgICAgICB8IDEwNCArKysrLQo+
ICBpbmNsdWRlL2RybS9kcm1fZ2VtLmggICAgICAgIHwgIDE4ICstCj4gIGluY2x1ZGUvZHJtL2Ry
bV9wcmltZS5oICAgICAgfCAgNDIgKy0KPiAgNSBmaWxlcyBjaGFuZ2VkLCA1NzYgaW5zZXJ0aW9u
cygrKSwgNDc5IGRlbGV0aW9ucygtKQo+IApSZXN1ZmZsZSBpcyBvay4gQ3VycmVudGx5IHRoZSBj
b21taXQgc3VtbWFyeSBzYXlzICJjb21tZW50cyIgYW5kIHdlIGhhdmUKODUxICsvLSBmb3IgYSB+
OTYwIGxvYyBmaWxlIC0gbm90IHRoZSBleGFtcGxlIHdlIHdhbnQgdG8gc2V0IGZvciBvdGhlcnMu
CgpDYW4gd2UgZ2V0IHRoaXMgaW50byBtb3JlIG1hbmFnYWJsZSBodW5rcz8KCi1FbWlsCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
