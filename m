Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C75CAF2942
	for <lists+dri-devel@lfdr.de>; Thu,  7 Nov 2019 09:36:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23F776EF02;
	Thu,  7 Nov 2019 08:36:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B8B96EF00
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Nov 2019 08:36:11 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id f2so1929869wrs.11
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Nov 2019 00:36:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=HWIoT8goX9nWw4xqk3N22AuY4QSVAqESsGvxOoiE4Sg=;
 b=RzMg5EvRdbCpllCCvKG9f3ou3ZPekOF8tcDpVxtuKOy4KboMIgUoClxtYMV8xdpA37
 Wg9byY0etG3uZgZMdX61FtEqSO0lw/Xqwq8B6+uBQmuXUpQntbbCBM7obuv9EDJ2Ropm
 BW3ZoVWZ6hlDUtiNDJxSHQg5O8NgGueuh1TFX11kAfWaF7blAqwd54Q+VPyVoomrtOKF
 mwNVJcjvHdIGRtvx7D/M61smMlI1Z/Og4LEZAuV58YiSkpVbs9s0SHa7cnnWSc0eyTsm
 LBuHPI9A8yDW1E2J18sX2+PgWas4M1o1m/jgmSav3Tn+imq/5PjL7/cpHDcrnRmUW00D
 L/OA==
X-Gm-Message-State: APjAAAWk5gzMwyQPmBAk0+acHPvK5GV1xF2dhUrslqskgv82gtzTjBKU
 wS/2ZL1F/2Z5hLLkh/vkXDZVJg==
X-Google-Smtp-Source: APXvYqxyEQuh5ulGEYRhzVreBrojezCrU9vH9m9rznKAjt/gnmouHzf/7OUZ1JxNkssWzTP0+3qJ/Q==
X-Received: by 2002:adf:f4c9:: with SMTP id h9mr1210191wrp.354.1573115770195; 
 Thu, 07 Nov 2019 00:36:10 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id f143sm2341025wme.40.2019.11.07.00.36.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Nov 2019 00:36:09 -0800 (PST)
Date: Thu, 7 Nov 2019 09:36:07 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Chris Wilson <chris@chris-wilson.co.uk>
Subject: Re: [PATCH v3 2/5] drm: Expose a method for creating anonymous
 struct file around drm_minor
Message-ID: <20191107083607.GM23790@phenom.ffwll.local>
References: <20191106142432.14022-1-chris@chris-wilson.co.uk>
 <20191106142432.14022-3-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191106142432.14022-3-chris@chris-wilson.co.uk>
X-Operating-System: Linux phenom 5.2.0-3-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=HWIoT8goX9nWw4xqk3N22AuY4QSVAqESsGvxOoiE4Sg=;
 b=cs+fhkbCq3Q5NxhOU3laC8Toim5CIv0RnamXVZSj/RqjQBs8o1ETVpEVBMFKQ6rnXo
 5hES+1kbUEwpG27K7GdHYE4/bX/vhg5d8AV0TdZ57i5E3MD3GeIigCQqaHit9Ug5T55C
 NLA7fpBdEqfsrTyawZZah4MHqrPdLQ9TnT1Uc=
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBOb3YgMDYsIDIwMTkgYXQgMDI6MjQ6MjlQTSArMDAwMCwgQ2hyaXMgV2lsc29uIHdy
b3RlOgo+IFNvbWV0aW1lcyB3ZSBuZWVkIHRvIGNyZWF0ZSBhIHN0cnVjdCBmaWxlIHRvIHdyYXAg
YSBkcm1fZGV2aWNlLCBhcyBpdAo+IHRoZSB1c2VyIHdlcmUgdG8gaGF2ZSBvcGVuZWQgL2Rldi9k
cmkvY2FyZDAgYnV0IHRvIGRvIHNvIGFub255bW91c2x5Cj4gKGkuZS4gZm9yIGludGVybmFsIHVz
ZSkuIFByb3ZpZGUgYSB1dGlsaXR5IG1ldGhvZCB0byBjcmVhdGUgYSBzdHJ1Y3QKPiBmaWxlIHdp
dGggdGhlIGRybV9kZXZpY2UtPmRyaXZlci5mb3BzLCB0aGF0IHdyYXAgdGhlIGRybV9kZXZpY2Uu
Cj4gCj4gdjI6IFJlc3RyaWN0IHVzYWdlIHRvIHNlbGZ0ZXN0cwo+IAo+IFNpZ25lZC1vZmYtYnk6
IENocmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVrPgo+IENjOiBEYW5pZWwgVmV0
dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPgoKUmV2aWV3ZWQtYnk6IERhbmllbCBWZXR0ZXIg
PGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+Cgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vZHJtX2Zp
bGUuYyB8IDQyICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gIGluY2x1
ZGUvZHJtL2RybV9maWxlLmggICAgIHwgIDMgKysrCj4gIDIgZmlsZXMgY2hhbmdlZCwgNDUgaW5z
ZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2ZpbGUuYyBi
L2RyaXZlcnMvZ3B1L2RybS9kcm1fZmlsZS5jCj4gaW5kZXggZWEzNGJjOTkxODU4Li40ZDkzODVk
MWJmMmQgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9maWxlLmMKPiArKysgYi9k
cml2ZXJzL2dwdS9kcm0vZHJtX2ZpbGUuYwo+IEBAIC0zMSw3ICszMSw5IEBACj4gICAqIE9USEVS
IERFQUxJTkdTIElOIFRIRSBTT0ZUV0FSRS4KPiAgICovCj4gIAo+ICsjaW5jbHVkZSA8bGludXgv
YW5vbl9pbm9kZXMuaD4KPiAgI2luY2x1ZGUgPGxpbnV4L2RtYS1mZW5jZS5oPgo+ICsjaW5jbHVk
ZSA8bGludXgvZmlsZS5oPgo+ICAjaW5jbHVkZSA8bGludXgvbW9kdWxlLmg+Cj4gICNpbmNsdWRl
IDxsaW51eC9wY2kuaD4KPiAgI2luY2x1ZGUgPGxpbnV4L3BvbGwuaD4KPiBAQCAtNzU0LDMgKzc1
Niw0MyBAQCB2b2lkIGRybV9zZW5kX2V2ZW50KHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHN0cnVj
dCBkcm1fcGVuZGluZ19ldmVudCAqZSkKPiAgCXNwaW5fdW5sb2NrX2lycXJlc3RvcmUoJmRldi0+
ZXZlbnRfbG9jaywgaXJxZmxhZ3MpOwo+ICB9Cj4gIEVYUE9SVF9TWU1CT0woZHJtX3NlbmRfZXZl
bnQpOwo+ICsKPiArLyoqCj4gKyAqIG1vY2tfZHJtX2dldGZpbGUgLSBDcmVhdGUgYSBuZXcgc3Ry
dWN0IGZpbGUgZm9yIHRoZSBkcm0gZGV2aWNlCj4gKyAqIEBtaW5vcjogZHJtIG1pbm9yIHRvIHdy
YXAgKGUuZy4gI2RybV9kZXZpY2UucHJpbWFyeSkKPiArICogQGZsYWdzOiBmaWxlIGNyZWF0aW9u
IG1vZGUgKE9fUkRXUiBldGMpCj4gKyAqCj4gKyAqIFRoaXMgY3JlYXRlIGEgbmV3IHN0cnVjdCBm
aWxlIHRoYXQgd3JhcHMgYSBEUk0gZmlsZSBjb250ZXh0IGFyb3VuZCBhCj4gKyAqIERSTSBtaW5v
ci4gVGhpcyBtaW1pY2tzIHVzZXJzcGFjZSBvcGVuaW5nIGUuZy4gL2Rldi9kcmkvY2FyZDAsIGJ1
dCB3aXRob3V0Cj4gKyAqIGludm9raW5nIHVzZXJzcGFjZS4gVGhlIHN0cnVjdCBmaWxlIG1heSBi
ZSBvcGVyYXRlZCBvbiB1c2luZyBpdHMgZl9vcAo+ICsgKiAodGhlIGRybV9kZXZpY2UuZHJpdmVy
LmZvcHMpIHRvIG1pbWljayB1c2Vyc3BhY2Ugb3BlcmF0aW9ucywgb3IgYmUgc3VwcGxpZWQKPiAr
ICogdG8gdXNlcnNwYWNlIGZhY2luZyBmdW5jdGlvbnMgYXMgYW4gaW50ZXJuYWwvYW5vbnltb3Vz
IGNsaWVudC4KPiArICoKPiArICogUkVUVVJOUzoKPiArICogUG9pbnRlciB0byBuZXdseSBjcmVh
dGVkIHN0cnVjdCBmaWxlLCBFUlJfUFRSIG9uIGZhaWx1cmUuCj4gKyAqLwo+ICtzdHJ1Y3QgZmls
ZSAqbW9ja19kcm1fZ2V0ZmlsZShzdHJ1Y3QgZHJtX21pbm9yICptaW5vciwgdW5zaWduZWQgaW50
IGZsYWdzKQo+ICt7Cj4gKwlzdHJ1Y3QgZHJtX2RldmljZSAqZGV2ID0gbWlub3ItPmRldjsKPiAr
CXN0cnVjdCBkcm1fZmlsZSAqcHJpdjsKPiArCXN0cnVjdCBmaWxlICpmaWxlOwo+ICsKPiArCXBy
aXYgPSBkcm1fZmlsZV9hbGxvYyhtaW5vcik7Cj4gKwlpZiAoSVNfRVJSKHByaXYpKQo+ICsJCXJl
dHVybiBFUlJfQ0FTVChwcml2KTsKPiArCj4gKwlmaWxlID0gYW5vbl9pbm9kZV9nZXRmaWxlKCJk
cm0iLCBkZXYtPmRyaXZlci0+Zm9wcywgcHJpdiwgZmxhZ3MpOwo+ICsJaWYgKElTX0VSUihmaWxl
KSkgewo+ICsJCWRybV9maWxlX2ZyZWUocHJpdik7Cj4gKwkJcmV0dXJuIGZpbGU7Cj4gKwl9Cj4g
Kwo+ICsJLyogRXZlcnlvbmUgc2hhcmVzIGEgc2luZ2xlIGdsb2JhbCBhZGRyZXNzIHNwYWNlICov
Cj4gKwlmaWxlLT5mX21hcHBpbmcgPSBkZXYtPmFub25faW5vZGUtPmlfbWFwcGluZzsKPiArCj4g
Kwlkcm1fZGV2X2dldChkZXYpOwo+ICsJcHJpdi0+ZmlscCA9IGZpbGU7Cj4gKwo+ICsJcmV0dXJu
IGZpbGU7Cj4gK30KPiArRVhQT1JUX1NZTUJPTF9GT1JfVEVTVFNfT05MWShtb2NrX2RybV9nZXRm
aWxlKTsKPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vZHJtX2ZpbGUuaCBiL2luY2x1ZGUvZHJt
L2RybV9maWxlLmgKPiBpbmRleCA2N2FmNjBiYjUyN2EuLjhiMDk5YjM0NzgxNyAxMDA2NDQKPiAt
LS0gYS9pbmNsdWRlL2RybS9kcm1fZmlsZS5oCj4gKysrIGIvaW5jbHVkZS9kcm0vZHJtX2ZpbGUu
aAo+IEBAIC00Miw2ICs0Miw3IEBAIHN0cnVjdCBkbWFfZmVuY2U7Cj4gIHN0cnVjdCBkcm1fZmls
ZTsKPiAgc3RydWN0IGRybV9kZXZpY2U7Cj4gIHN0cnVjdCBkZXZpY2U7Cj4gK3N0cnVjdCBmaWxl
Owo+ICAKPiAgLyoKPiAgICogRklYTUU6IE5vdCBzdXJlIHdlIHdhbnQgdG8gaGF2ZSBkcm1fbWlu
b3IgaGVyZSBpbiB0aGUgZW5kLCBidXQgdG8gYXZvaWQKPiBAQCAtMzg3LDQgKzM4OCw2IEBAIHZv
aWQgZHJtX2V2ZW50X2NhbmNlbF9mcmVlKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsCj4gIHZvaWQg
ZHJtX3NlbmRfZXZlbnRfbG9ja2VkKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHN0cnVjdCBkcm1f
cGVuZGluZ19ldmVudCAqZSk7Cj4gIHZvaWQgZHJtX3NlbmRfZXZlbnQoc3RydWN0IGRybV9kZXZp
Y2UgKmRldiwgc3RydWN0IGRybV9wZW5kaW5nX2V2ZW50ICplKTsKPiAgCj4gK3N0cnVjdCBmaWxl
ICptb2NrX2RybV9nZXRmaWxlKHN0cnVjdCBkcm1fbWlub3IgKm1pbm9yLCB1bnNpZ25lZCBpbnQg
ZmxhZ3MpOwo+ICsKPiAgI2VuZGlmIC8qIF9EUk1fRklMRV9IXyAqLwo+IC0tIAo+IDIuMjQuMAo+
IAoKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9u
Cmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
