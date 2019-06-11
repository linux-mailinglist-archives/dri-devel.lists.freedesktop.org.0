Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B85593C6B6
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2019 10:57:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 890778910E;
	Tue, 11 Jun 2019 08:57:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2788F890C5
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2019 08:57:27 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id c26so18907172edt.1
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2019 01:57:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=bTkOEfoVS8xqoBdJMHWo3E+Rkaj2bpqidMUiZcDnoAk=;
 b=f6DE2awVODZ9UvHxJLN/I132m/HxbQTwAXN+D2jR9b1Ldr9F8NuSL0u3DBBwv6X1+5
 ALa0SNbUA6RWMoJOyMdjLrALCWkMQUrNtJhy57MZLCqRXTQKC1nc7wtLdZYduZCD3LsA
 6ipil1XLS1KhQIQIrhRpi1UFeOTfryGv/8ztfwvGqsrcZPwFTU3o4rnVgbgdldWaADoI
 u9JirQ9+/aQum0E2Tj6LU9DiVopYIpDdBWOqPZc0uGxhKhrE/+AJ/vvc/td7cqKmvuet
 jaxh+U65bFmGaEUrvjSxiYWGNDmNFN8vR+Pt81RrKCVS02QCgihPxhiA+gLqPigbCwbR
 IxAg==
X-Gm-Message-State: APjAAAUg0/WYhH8ompdZ9Ma2NaiNher9i3oR7GqwNapqe//CFhK6dKev
 MLu4kZ/rGJs/U4LX76SEW2930Q==
X-Google-Smtp-Source: APXvYqyYSiI8MCmhIFP5093eoXLHoiUXmUjorUOjoDyQgA+DoU3k97SYd9dqfm+MFflJC285PU1vqQ==
X-Received: by 2002:a05:6402:8d7:: with SMTP id
 d23mr37696956edz.17.1560243445858; 
 Tue, 11 Jun 2019 01:57:25 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id m3sm3498364edi.33.2019.06.11.01.57.24
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 11 Jun 2019 01:57:25 -0700 (PDT)
Date: Tue, 11 Jun 2019 10:57:22 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Derek Basehore <dbasehore@chromium.org>
Subject: Re: [PATCH 3/5] drm/panel: Add attach/detach callbacks
Message-ID: <20190611085722.GX21222@phenom.ffwll.local>
Mail-Followup-To: Derek Basehore <dbasehore@chromium.org>,
 linux-kernel@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@linux.ie>,
 Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Sean Paul <sean@poorly.run>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, CK Hu <ck.hu@mediatek.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 intel-gfx@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20190611040350.90064-1-dbasehore@chromium.org>
 <20190611040350.90064-4-dbasehore@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190611040350.90064-4-dbasehore@chromium.org>
X-Operating-System: Linux phenom 4.14.0-3-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=bTkOEfoVS8xqoBdJMHWo3E+Rkaj2bpqidMUiZcDnoAk=;
 b=ZiTDkJRVzn+jc565v456AsNS1x9g3BjkYr7za4w5jSGUMvN0zRkNbwrjz+WKcjgJ7G
 nVEabfR7lwPxQPzOWNyhTaNeCZNmuZbiS/yoZmcFwLZx8+TklX/CEVM6W8dFxldKtroS
 fKKE1lLtvvPaX/DCq4LqhJjtJN0r4j+0DpEZc=
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Sean Paul <sean@poorly.run>,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Maxime Ripard <maxime.ripard@bootlin.com>, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, linux-mediatek@lists.infradead.org,
 Sam Ravnborg <sam@ravnborg.org>, linux-arm-kernel@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBKdW4gMTAsIDIwMTkgYXQgMDk6MDM6NDhQTSAtMDcwMCwgRGVyZWsgQmFzZWhvcmUg
d3JvdGU6Cj4gVGhpcyBhZGRzIHRoZSBhdHRhY2gvZGV0YWNoIGNhbGxiYWNrcy4gVGhlc2UgYXJl
IGZvciBzZXR0aW5nIHVwCj4gaW50ZXJuYWwgc3RhdGUgZm9yIHRoZSBjb25uZWN0b3IvcGFuZWwg
cGFpciB0aGF0IGNhbid0IGJlIGRvbmUgYXQKPiBwcm9iZSAoc2luY2UgdGhlIGNvbm5lY3RvciBk
b2Vzbid0IGV4aXN0KSBhbmQgd2hpY2ggZG9uJ3QgbmVlZCB0byBiZQo+IHJlcGVhdGVkbHkgZG9u
ZSBmb3IgZXZlcnkgZ2V0L21vZGVzLCBwcmVwYXJlLCBvciBlbmFibGUgY2FsbGJhY2suCj4gVmFs
dWVzIHN1Y2ggYXMgdGhlIHBhbmVsIG9yaWVudGF0aW9uLCBhbmQgZGlzcGxheSBzaXplIGNhbiBi
ZSBmaWxsZWQKPiBpbiBmb3IgdGhlIGNvbm5lY3Rvci4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBEZXJl
ayBCYXNlaG9yZSA8ZGJhc2Vob3JlQGNocm9taXVtLm9yZz4KPiAtLS0KPiAgZHJpdmVycy9ncHUv
ZHJtL2RybV9wYW5lbC5jIHwgMTQgKysrKysrKysrKysrKysKPiAgaW5jbHVkZS9kcm0vZHJtX3Bh
bmVsLmggICAgIHwgIDQgKysrKwo+ICAyIGZpbGVzIGNoYW5nZWQsIDE4IGluc2VydGlvbnMoKykK
PiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9wYW5lbC5jIGIvZHJpdmVycy9n
cHUvZHJtL2RybV9wYW5lbC5jCj4gaW5kZXggM2I2ODljZTRhNTFhLi43MmY2NzY3OGQ5ZDUgMTAw
NjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9wYW5lbC5jCj4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL2RybV9wYW5lbC5jCj4gQEAgLTEwNCwxMiArMTA0LDIzIEBAIEVYUE9SVF9TWU1CT0wo
ZHJtX3BhbmVsX3JlbW92ZSk7Cj4gICAqLwo+ICBpbnQgZHJtX3BhbmVsX2F0dGFjaChzdHJ1Y3Qg
ZHJtX3BhbmVsICpwYW5lbCwgc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3RvcikKPiAgewo+
ICsJaW50IHJldDsKPiArCj4gIAlpZiAocGFuZWwtPmNvbm5lY3RvcikKPiAgCQlyZXR1cm4gLUVC
VVNZOwo+ICAKPiAgCXBhbmVsLT5jb25uZWN0b3IgPSBjb25uZWN0b3I7Cj4gIAlwYW5lbC0+ZHJt
ID0gY29ubmVjdG9yLT5kZXY7Cj4gIAo+ICsJaWYgKHBhbmVsLT5mdW5jcy0+YXR0YWNoKSB7Cj4g
KwkJcmV0ID0gcGFuZWwtPmZ1bmNzLT5hdHRhY2gocGFuZWwpOwo+ICsJCWlmIChyZXQgPCAwKSB7
Cj4gKwkJCXBhbmVsLT5jb25uZWN0b3IgPSBOVUxMOwo+ICsJCQlwYW5lbC0+ZHJtID0gTlVMTDsK
PiArCQkJcmV0dXJuIHJldDsKPiArCQl9Cj4gKwl9CgpXaHkgY2FuJ3Qgd2UganVzdCBpbXBsZW1l
bnQgdGhpcyBpbiB0aGUgZHJtIGhlbHBlcnMgZm9yIGV2ZXJ5b25lLCBieSBlLmcuCnN0b3Jpbmcg
YSBkdCBub2RlIGluIGRybV9wYW5lbD8gRmVlbHMgYSBiaXQgb3ZlcmtpbGwgdG8gaGF2ZSB0aGVz
ZSBuZXcKaG9va3MgaGVyZS4KCkFsc28sIG15IHVuZGVyc3RhbmRpbmcgaXMgdGhhdCB0aGlzIGR0
IHN0dWZmIGlzIHN1cHBvc2VkIHRvIGJlCnN0YW5kYXJkaXplZCwgc28gdGhpcyBzaG91bGQgd29y
ay4KLURhbmllbAoKPiArCj4gIAlyZXR1cm4gMDsKPiAgfQo+ICBFWFBPUlRfU1lNQk9MKGRybV9w
YW5lbF9hdHRhY2gpOwo+IEBAIC0xMjgsNiArMTM5LDkgQEAgRVhQT1JUX1NZTUJPTChkcm1fcGFu
ZWxfYXR0YWNoKTsKPiAgICovCj4gIGludCBkcm1fcGFuZWxfZGV0YWNoKHN0cnVjdCBkcm1fcGFu
ZWwgKnBhbmVsKQo+ICB7Cj4gKwlpZiAocGFuZWwtPmZ1bmNzLT5kZXRhY2gpCj4gKwkJcGFuZWwt
PmZ1bmNzLT5kZXRhY2gocGFuZWwpOwo+ICsKPiAgCXBhbmVsLT5jb25uZWN0b3IgPSBOVUxMOwo+
ICAJcGFuZWwtPmRybSA9IE5VTEw7Cj4gIAo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS9kcm1f
cGFuZWwuaCBiL2luY2x1ZGUvZHJtL2RybV9wYW5lbC5oCj4gaW5kZXggMTM2MzFiMmVmYmFhLi5l
MTM2ZTNhM2M5OTYgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS9kcm0vZHJtX3BhbmVsLmgKPiArKysg
Yi9pbmNsdWRlL2RybS9kcm1fcGFuZWwuaAo+IEBAIC0zNyw2ICszNyw4IEBAIHN0cnVjdCBkaXNw
bGF5X3RpbWluZzsKPiAgICogc3RydWN0IGRybV9wYW5lbF9mdW5jcyAtIHBlcmZvcm0gb3BlcmF0
aW9ucyBvbiBhIGdpdmVuIHBhbmVsCj4gICAqIEBkaXNhYmxlOiBkaXNhYmxlIHBhbmVsICh0dXJu
IG9mZiBiYWNrIGxpZ2h0LCBldGMuKQo+ICAgKiBAdW5wcmVwYXJlOiB0dXJuIG9mZiBwYW5lbAo+
ICsgKiBAZGV0YWNoOiBkZXRhY2ggcGFuZWwtPmNvbm5lY3RvciAoY2xlYXIgaW50ZXJuYWwgc3Rh
dGUsIGV0Yy4pCj4gKyAqIEBhdHRhY2g6IGF0dGFjaCBwYW5lbC0+Y29ubmVjdG9yICh1cGRhdGUg
aW50ZXJuYWwgc3RhdGUsIGV0Yy4pCj4gICAqIEBwcmVwYXJlOiB0dXJuIG9uIHBhbmVsIGFuZCBw
ZXJmb3JtIHNldCB1cAo+ICAgKiBAZW5hYmxlOiBlbmFibGUgcGFuZWwgKHR1cm4gb24gYmFjayBs
aWdodCwgZXRjLikKPiAgICogQGdldF9tb2RlczogYWRkIG1vZGVzIHRvIHRoZSBjb25uZWN0b3Ig
dGhhdCB0aGUgcGFuZWwgaXMgYXR0YWNoZWQgdG8gYW5kCj4gQEAgLTcwLDYgKzcyLDggQEAgc3Ry
dWN0IGRpc3BsYXlfdGltaW5nOwo+ICBzdHJ1Y3QgZHJtX3BhbmVsX2Z1bmNzIHsKPiAgCWludCAo
KmRpc2FibGUpKHN0cnVjdCBkcm1fcGFuZWwgKnBhbmVsKTsKPiAgCWludCAoKnVucHJlcGFyZSko
c3RydWN0IGRybV9wYW5lbCAqcGFuZWwpOwo+ICsJdm9pZCAoKmRldGFjaCkoc3RydWN0IGRybV9w
YW5lbCAqcGFuZWwpOwo+ICsJaW50ICgqYXR0YWNoKShzdHJ1Y3QgZHJtX3BhbmVsICpwYW5lbCk7
Cj4gIAlpbnQgKCpwcmVwYXJlKShzdHJ1Y3QgZHJtX3BhbmVsICpwYW5lbCk7Cj4gIAlpbnQgKCpl
bmFibGUpKHN0cnVjdCBkcm1fcGFuZWwgKnBhbmVsKTsKPiAgCWludCAoKmdldF9tb2Rlcykoc3Ry
dWN0IGRybV9wYW5lbCAqcGFuZWwpOwo+IC0tIAo+IDIuMjIuMC5yYzIuMzgzLmdmNGZiYmYzMGMy
LWdvb2cKPiAKCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jw
b3JhdGlvbgpodHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
