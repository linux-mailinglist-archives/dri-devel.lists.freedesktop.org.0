Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69535DD0C
	for <lists+dri-devel@lfdr.de>; Mon, 29 Apr 2019 09:40:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7217188E46;
	Mon, 29 Apr 2019 07:40:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 742C488E46
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Apr 2019 07:40:51 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id a6so8275317edv.1
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Apr 2019 00:40:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=cR/Ec4vlE+X0Q9Ok0IFawlzdAj+EmfR3ChCRLcZ/ulo=;
 b=YN8KUSU+llZnHCEX+dpk01Xq7grjlzB9I7mNY6pfZ+0emsUgY16b/1ZQWPbC6h5ARq
 hfyF9aeUcm3kqFeGGrKe05ArayiBGQkxrU+QRQxgJJ4tejfXGS3v0IhGJaoYuVNVAnCK
 qFNmoOE+SRunu4Q6b94ae/snuS9zSUFfwRdRVO4vRLpyk4HL1/dhjLHY9RPzgTlsNNsQ
 jRMZU09ySpm3sPQYbx7YLtSmoiJRRI8WwIWvn05V9uiqJGNmLyNLdQyDrSGxA3VaT5C7
 K3R5VrKrA0kU1L0nlaWK8BWMVuhrPwm332KFm57DxKFhRWFEXAgaYvdK1U74ZBHbT+WM
 9NhA==
X-Gm-Message-State: APjAAAV6CsKFz9b/v/j/6CxlTfd9tFMrGBkNtaxvAk6GAIx89MQDk53g
 2POPyATnFppQEzdzSJddMJLuCA==
X-Google-Smtp-Source: APXvYqyamfeC0VDCz3uc3J7R7UkR4tbLJux/+a07AHsJfdjm2ugURBFwopOn5nLJ9FRLCID5f7b7Rw==
X-Received: by 2002:aa7:dc44:: with SMTP id g4mr37840116edu.268.1556523650136; 
 Mon, 29 Apr 2019 00:40:50 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id u10sm8782904edj.22.2019.04.29.00.40.48
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 29 Apr 2019 00:40:49 -0700 (PDT)
Date: Mon, 29 Apr 2019 09:40:47 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Hellstrom <thomas@shipmail.org>
Subject: Re: [PATCH] Revert "drm/qxl: drop prime import/export callbacks"
Message-ID: <20190429074047.GJ3271@phenom.ffwll.local>
Mail-Followup-To: Thomas Hellstrom <thomas@shipmail.org>,
 Gerd Hoffmann <kraxel@redhat.com>, David Airlie <airlied@linux.ie>,
 open list <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "open list:DRM DRIVER FOR QXL VIRTUAL GPU"
 <virtualization@lists.linux-foundation.org>, 
 "open list:DRM DRIVER FOR QXL VIRTUAL GPU" <spice-devel@lists.freedesktop.org>,
 David Airlie <airlied@redhat.com>
References: <20190426053324.26443-1-kraxel@redhat.com>
 <CAKMK7uG+vMU0hqqiKAswu=LqpkcXtLPqbYLRWgoAPpsQQV4qzA@mail.gmail.com>
 <8ae152fe-7811-4de3-e26f-350650a8f992@shipmail.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8ae152fe-7811-4de3-e26f-350650a8f992@shipmail.org>
X-Operating-System: Linux phenom 4.14.0-3-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=cR/Ec4vlE+X0Q9Ok0IFawlzdAj+EmfR3ChCRLcZ/ulo=;
 b=Yvz5MKIw4ZC5qQmsVZshla4AGaxfZIkBuWlgR8PFsij1idit2Hg9pf2BY9X4YfNeP3
 0q/OaZHtVMvHVNJgHFZHNFVsd0ifJTRDRyvokNYW0ozxAb1Va4b1IMM0D/HUCYlZsuXw
 R7XvyxOE825SE4PFlQvLU61RelsDsB9+qbxZg=
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
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "open list:DRM DRIVER FOR QXL VIRTUAL GPU"
 <virtualization@lists.linux-foundation.org>, Gerd Hoffmann <kraxel@redhat.com>,
 David Airlie <airlied@redhat.com>,
 "open list:DRM DRIVER FOR QXL VIRTUAL GPU" <spice-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBBcHIgMjYsIDIwMTkgYXQgMDU6NDI6MjNQTSArMDIwMCwgVGhvbWFzIEhlbGxzdHJv
bSB3cm90ZToKPiBPbiA0LzI2LzE5IDQ6MjEgUE0sIERhbmllbCBWZXR0ZXIgd3JvdGU6Cj4gPiBP
biBGcmksIEFwciAyNiwgMjAxOSBhdCA3OjMzIEFNIEdlcmQgSG9mZm1hbm4gPGtyYXhlbEByZWRo
YXQuY29tPiB3cm90ZToKPiA+ID4gVGhpcyByZXZlcnRzIGNvbW1pdCBmNGMzNGIxZTJhMzdkNTY3
NjE4MDkwMWZhNmZmMTg4YmNiNjM3MWY4Lgo+ID4gPiAKPiA+ID4gU2ltbGlhciB0byBjb21taXQg
YTBjZWNjMjNjZmNiIFJldmVydCAiZHJtL3ZpcnRpbzogZHJvcCBwcmltZQo+ID4gPiBpbXBvcnQv
ZXhwb3J0IGNhbGxiYWNrcyIuICBXZSBoYXZlIHRvIGRvIHRoZSBzYW1lIHdpdGggcXhsLAo+ID4g
PiBmb3IgdGhlIHNhbWUgcmVhc29ucyAoaXQgYnJlYWtzIERSSTMpLgo+ID4gPiAKPiA+ID4gRHJv
cCB0aGUgV0FSTl9PTl9PTkNFKCkuCj4gPiA+IAo+ID4gPiBGaXhlczogZjRjMzRiMWUyYTM3ZDU2
NzYxODA5MDFmYTZmZjE4OGJjYjYzNzFmOAo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBHZXJkIEhvZmZt
YW5uIDxrcmF4ZWxAcmVkaGF0LmNvbT4KPiA+IE1heWJlIHdlIG5lZWQgc29tZSBoZWxwZXJzIGZv
ciB2aXJ0dWFsIGRyaXZlcnMgd2hpY2ggb25seSBhbGxvdwo+ID4gc2VsZi1yZWltcG9ydCBhbmQg
bm90aGluZyBlbHNlIGF0IGFsbD8gSSB0aGluayB0aGVyZSdzIHF4bCwgdmlyZ2wsCj4gPiB2bXdn
ZnggYW5kIG1heWJlIGFsc28gdmJveCBvbmUgd2hvIGNvdWxkIHVzZSB0aGlzIC4uLiBKdXN0IGEg
cXVpY2sKPiA+IGlkZWEuCj4gPiAtRGFuaWVsCj4gCj4gSSB0aGluayB2bXdnZnggY291bGQsIGlu
IHRoZW9yeSwgc3VwcG9ydCB0aGUgZnVsbCByYW5nZSBvZiBvcGVyYXRpb25zLAo+IGF0IGxlYXN0
IGZvciByZWFzb25hYmx5IHJlY2VudCBkZXZpY2UgdmVyc2lvbnMuIEhvd2V2ZXIsIGl0IHdvdWxk
bid0IGJlCj4gdGVycmlibHkgZWZmaWNpZW50IHNpbmNlIHRoZSBleHBvcnRlZCBkbWEtYnVmIHNn
bGlzdCB3b3VsZCBiYXNpY2FsbHkgYmUgYQo+IGJvdW5jZS1idWZmZXIuCgpZZWFoIG5vdCBzdXJl
IHRoYXQgbWFrZXMgc2Vuc2UgdG8gc3VwcG9ydCByZWFsbHkgLi4uCi1EYW5pZWwKCj4gCj4gL1Ro
b21hcwo+IAo+IAo+ID4gPiAtLS0KPiA+ID4gICBkcml2ZXJzL2dwdS9kcm0vcXhsL3F4bF9kcnYu
YyAgIHwgIDQgKysrKwo+ID4gPiAgIGRyaXZlcnMvZ3B1L2RybS9xeGwvcXhsX3ByaW1lLmMgfCAx
MiArKysrKysrKysrKysKPiA+ID4gICAyIGZpbGVzIGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKykK
PiA+ID4gCj4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcXhsL3F4bF9kcnYuYyBi
L2RyaXZlcnMvZ3B1L2RybS9xeGwvcXhsX2Rydi5jCj4gPiA+IGluZGV4IDU3OGQ4NjdhODFkNS4u
ZjMzZTM0OWM0ZWM1IDEwMDY0NAo+ID4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vcXhsL3F4bF9k
cnYuYwo+ID4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vcXhsL3F4bF9kcnYuYwo+ID4gPiBAQCAt
MjU1LDEwICsyNTUsMTQgQEAgc3RhdGljIHN0cnVjdCBkcm1fZHJpdmVyIHF4bF9kcml2ZXIgPSB7
Cj4gPiA+ICAgI2lmIGRlZmluZWQoQ09ORklHX0RFQlVHX0ZTKQo+ID4gPiAgICAgICAgICAuZGVi
dWdmc19pbml0ID0gcXhsX2RlYnVnZnNfaW5pdCwKPiA+ID4gICAjZW5kaWYKPiA+ID4gKyAgICAg
ICAucHJpbWVfaGFuZGxlX3RvX2ZkID0gZHJtX2dlbV9wcmltZV9oYW5kbGVfdG9fZmQsCj4gPiA+
ICsgICAgICAgLnByaW1lX2ZkX3RvX2hhbmRsZSA9IGRybV9nZW1fcHJpbWVfZmRfdG9faGFuZGxl
LAo+ID4gPiAgICAgICAgICAuZ2VtX3ByaW1lX2V4cG9ydCA9IGRybV9nZW1fcHJpbWVfZXhwb3J0
LAo+ID4gPiAgICAgICAgICAuZ2VtX3ByaW1lX2ltcG9ydCA9IGRybV9nZW1fcHJpbWVfaW1wb3J0
LAo+ID4gPiAgICAgICAgICAuZ2VtX3ByaW1lX3BpbiA9IHF4bF9nZW1fcHJpbWVfcGluLAo+ID4g
PiAgICAgICAgICAuZ2VtX3ByaW1lX3VucGluID0gcXhsX2dlbV9wcmltZV91bnBpbiwKPiA+ID4g
KyAgICAgICAuZ2VtX3ByaW1lX2dldF9zZ190YWJsZSA9IHF4bF9nZW1fcHJpbWVfZ2V0X3NnX3Rh
YmxlLAo+ID4gPiArICAgICAgIC5nZW1fcHJpbWVfaW1wb3J0X3NnX3RhYmxlID0gcXhsX2dlbV9w
cmltZV9pbXBvcnRfc2dfdGFibGUsCj4gPiA+ICAgICAgICAgIC5nZW1fcHJpbWVfdm1hcCA9IHF4
bF9nZW1fcHJpbWVfdm1hcCwKPiA+ID4gICAgICAgICAgLmdlbV9wcmltZV92dW5tYXAgPSBxeGxf
Z2VtX3ByaW1lX3Z1bm1hcCwKPiA+ID4gICAgICAgICAgLmdlbV9wcmltZV9tbWFwID0gcXhsX2dl
bV9wcmltZV9tbWFwLAo+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3F4bC9xeGxf
cHJpbWUuYyBiL2RyaXZlcnMvZ3B1L2RybS9xeGwvcXhsX3ByaW1lLmMKPiA+ID4gaW5kZXggOGI0
NDhlY2ExY2Q5Li4xMTQ2NTNiNDcxYzYgMTAwNjQ0Cj4gPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9xeGwvcXhsX3ByaW1lLmMKPiA+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3F4bC9xeGxfcHJp
bWUuYwo+ID4gPiBAQCAtNDIsNiArNDIsMTggQEAgdm9pZCBxeGxfZ2VtX3ByaW1lX3VucGluKHN0
cnVjdCBkcm1fZ2VtX29iamVjdCAqb2JqKQo+ID4gPiAgICAgICAgICBxeGxfYm9fdW5waW4oYm8p
Owo+ID4gPiAgIH0KPiA+ID4gCj4gPiA+ICtzdHJ1Y3Qgc2dfdGFibGUgKnF4bF9nZW1fcHJpbWVf
Z2V0X3NnX3RhYmxlKHN0cnVjdCBkcm1fZ2VtX29iamVjdCAqb2JqKQo+ID4gPiArewo+ID4gPiAr
ICAgICAgIHJldHVybiBFUlJfUFRSKC1FTk9TWVMpOwo+ID4gPiArfQo+ID4gPiArCj4gPiA+ICtz
dHJ1Y3QgZHJtX2dlbV9vYmplY3QgKnF4bF9nZW1fcHJpbWVfaW1wb3J0X3NnX3RhYmxlKAo+ID4g
PiArICAgICAgIHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHN0cnVjdCBkbWFfYnVmX2F0dGFjaG1l
bnQgKmF0dGFjaCwKPiA+ID4gKyAgICAgICBzdHJ1Y3Qgc2dfdGFibGUgKnRhYmxlKQo+ID4gPiAr
ewo+ID4gPiArICAgICAgIHJldHVybiBFUlJfUFRSKC1FTk9TWVMpOwo+ID4gPiArfQo+ID4gPiAr
Cj4gPiA+ICAgdm9pZCAqcXhsX2dlbV9wcmltZV92bWFwKHN0cnVjdCBkcm1fZ2VtX29iamVjdCAq
b2JqKQo+ID4gPiAgIHsKPiA+ID4gICAgICAgICAgc3RydWN0IHF4bF9ibyAqYm8gPSBnZW1fdG9f
cXhsX2JvKG9iaik7Cj4gPiA+IC0tCj4gPiA+IDIuMTguMQo+ID4gPiAKPiA+IAo+IAoKLS0gCkRh
bmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCmh0dHA6Ly9i
bG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
