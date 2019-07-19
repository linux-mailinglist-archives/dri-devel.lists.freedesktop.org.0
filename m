Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 753446E340
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jul 2019 11:17:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C53C36E5D7;
	Fri, 19 Jul 2019 09:17:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 767D76E5D7
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jul 2019 09:17:33 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id w20so33834701edd.2
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jul 2019 02:17:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to:user-agent;
 bh=jVcbwyloEPNARDUfzct2O+G0YN6kG1dYJkygmRSmnkE=;
 b=FNrHVQR7s3yBCOLxfFGSuuwiFgyq5ZVf4FZdIT/Ai3ZmPESHmHSPQW0KJwgSo+eGRn
 K3tq3vEAnUVULqUFSp1ezOCHJ+85YJMDX21nQZhBwOODWWYkxnjAR/E1tCHBkY9KltDy
 F5KKVC5l9Nmgyw6hH4db7qIDz+HXkU5tCFJ4/txlckRfMxdu7f4BgOBm6hUPXH11wB9j
 Xt2X4pllNDCu94erxcfI4N+2+OLSNb4ixL5QW+Whb98Zr1XecBYOhP8l9eZupiJ8vJA6
 EWZl77ZxsAgfoIs01mbZJdjvefUyNdxPgJ2aoXxLlkWHowqaoSnOQnnCysyfY0fZtLV/
 GG1w==
X-Gm-Message-State: APjAAAV15CumzajFYbcK/BUCOxuQJWNclhUSmuZJQ+1CrMYXUl4RjgDf
 1EjGz8eBZkqF3zGkd5IcDGcr8kbT
X-Google-Smtp-Source: APXvYqz3WmqfEqeuxk7W0wC428nBcsXn4xlTWZBnXhF/qcokVVpU590HKCoSl2v4zq7vhV5rFJuZJg==
X-Received: by 2002:a05:6402:12d2:: with SMTP id
 k18mr40062910edx.197.1563527852151; 
 Fri, 19 Jul 2019 02:17:32 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id j30sm8489436edb.8.2019.07.19.02.17.31
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 19 Jul 2019 02:17:31 -0700 (PDT)
Date: Fri, 19 Jul 2019 11:17:29 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>
Subject: Re: [PATCH 01/10] drm: Add SPI connector type
Message-ID: <20190719091729.GI15868@phenom.ffwll.local>
References: <20190717115817.30110-1-noralf@tronnes.org>
 <20190717115817.30110-2-noralf@tronnes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190717115817.30110-2-noralf@tronnes.org>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=jVcbwyloEPNARDUfzct2O+G0YN6kG1dYJkygmRSmnkE=;
 b=NDJs5592ChcCsolBz2bZYDUEyzzT7+qmMhGFC2ZhRBb4l4/qz/+04EW/lAjECPaZdW
 9WqSOFebhVoX+nycgMEJfhBfsFznTMGmSIxdCVZfqYMFqwDeA2juQs0iKFN8rAtOLmtP
 Sm1nYrp4Lvuht16TntolnjJC1LRi88wsyFOgo=
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
Cc: david@lechnology.com, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdWwgMTcsIDIwMTkgYXQgMDE6NTg6MDhQTSArMDIwMCwgTm9yYWxmIFRyw7hubmVz
IHdyb3RlOgo+IHRpbnlkcm0gZHJpdmVycyBhbm5vdW5jZSBEUk1fTU9ERV9DT05ORUNUT1JfVklS
VFVBTCBmb3IgaXRzIFNQSSBkcml2ZXJzLgo+IFN0b3AgbHlpbmcgYW5kIGFkZCBhIFNQSSBjb25u
ZWN0b3IgdHlwZQo+IAo+IENjOiBEYXZpZCBMZWNobmVyIDxkYXZpZEBsZWNobm9sb2d5LmNvbT4K
PiBTaWduZWQtb2ZmLWJ5OiBOb3JhbGYgVHLDuG5uZXMgPG5vcmFsZkB0cm9ubmVzLm9yZz4KCk5v
dGUgdGhpcyB3aWxsIGJyZWFrIFggKGFuZCBwcm9iYWJseSBhIHBpbGUgb2Ygb3RoZXJzKSwgd2hp
Y2ggaXMgd2h5IHdlCnRyaWVkIGhhcmQgdG8gYXZvaWQgYWRkaW5nIG5ldyBjb25uZWN0b3IgdHlw
ZXMuIE9yIGRpZCB0aGlzIGFsbCBnZXQgZml4ZWQKYnkgbm93PwotRGFuaWVsCgo+IC0tLQo+ICBk
cml2ZXJzL2dwdS9kcm0vZHJtX2Nvbm5lY3Rvci5jICAgIHwgMSArCj4gIGRyaXZlcnMvZ3B1L2Ry
bS90aW55ZHJtL21pcGktZGJpLmMgfCAzICstLQo+ICBkcml2ZXJzL2dwdS9kcm0vdGlueWRybS9y
ZXBhcGVyLmMgIHwgMiArLQo+ICBkcml2ZXJzL2dwdS9kcm0vdGlueWRybS9zdDc1ODYuYyAgIHwg
MiArLQo+ICBpbmNsdWRlL3VhcGkvZHJtL2RybV9tb2RlLmggICAgICAgIHwgMSArCj4gIDUgZmls
ZXMgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2Nvbm5lY3Rvci5jIGIvZHJpdmVycy9ncHUvZHJtL2Ry
bV9jb25uZWN0b3IuYwo+IGluZGV4IDA2OGQ0YjA1ZjFiZS4uY2JiNTQ4YjM3MDhmIDEwMDY0NAo+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fY29ubmVjdG9yLmMKPiArKysgYi9kcml2ZXJzL2dw
dS9kcm0vZHJtX2Nvbm5lY3Rvci5jCj4gQEAgLTkyLDYgKzkyLDcgQEAgc3RhdGljIHN0cnVjdCBk
cm1fY29ubl9wcm9wX2VudW1fbGlzdCBkcm1fY29ubmVjdG9yX2VudW1fbGlzdFtdID0gewo+ICAJ
eyBEUk1fTU9ERV9DT05ORUNUT1JfRFNJLCAiRFNJIiB9LAo+ICAJeyBEUk1fTU9ERV9DT05ORUNU
T1JfRFBJLCAiRFBJIiB9LAo+ICAJeyBEUk1fTU9ERV9DT05ORUNUT1JfV1JJVEVCQUNLLCAiV3Jp
dGViYWNrIiB9LAo+ICsJeyBEUk1fTU9ERV9DT05ORUNUT1JfU1BJLCAiU1BJIiB9LAo+ICB9Owo+
ICAKPiAgdm9pZCBkcm1fY29ubmVjdG9yX2lkYV9pbml0KHZvaWQpCj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS90aW55ZHJtL21pcGktZGJpLmMgYi9kcml2ZXJzL2dwdS9kcm0vdGlueWRy
bS9taXBpLWRiaS5jCj4gaW5kZXggY2E5ZGE2NTRmYzZmLi43OTFhMGI0M2JlZWYgMTAwNjQ0Cj4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL3Rpbnlkcm0vbWlwaS1kYmkuYwo+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS90aW55ZHJtL21pcGktZGJpLmMKPiBAQCAtNDQ1LDkgKzQ0NSw4IEBAIGludCBtaXBp
X2RiaV9pbml0KHN0cnVjdCBtaXBpX2RiaSAqbWlwaSwKPiAgCWlmICghbWlwaS0+dHhfYnVmKQo+
ICAJCXJldHVybiAtRU5PTUVNOwo+ICAKPiAtCS8qIFRPRE86IE1heWJlIGFkZCBEUk1fTU9ERV9D
T05ORUNUT1JfU1BJICovCj4gIAlyZXQgPSB0aW55ZHJtX2Rpc3BsYXlfcGlwZV9pbml0KGRybSwg
Jm1pcGktPnBpcGUsIGZ1bmNzLAo+IC0JCQkJCURSTV9NT0RFX0NPTk5FQ1RPUl9WSVJUVUFMLAo+
ICsJCQkJCURSTV9NT0RFX0NPTk5FQ1RPUl9TUEksCj4gIAkJCQkJbWlwaV9kYmlfZm9ybWF0cywK
PiAgCQkJCQlBUlJBWV9TSVpFKG1pcGlfZGJpX2Zvcm1hdHMpLCBtb2RlLAo+ICAJCQkJCXJvdGF0
aW9uKTsKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3Rpbnlkcm0vcmVwYXBlci5jIGIv
ZHJpdmVycy9ncHUvZHJtL3Rpbnlkcm0vcmVwYXBlci5jCj4gaW5kZXggODVhY2ZjY2VmY2RiLi40
MGFmYTY2MTA3ZTUgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3Rpbnlkcm0vcmVwYXBl
ci5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3Rpbnlkcm0vcmVwYXBlci5jCj4gQEAgLTExMTAs
NyArMTExMCw3IEBAIHN0YXRpYyBpbnQgcmVwYXBlcl9wcm9iZShzdHJ1Y3Qgc3BpX2RldmljZSAq
c3BpKQo+ICAJCXJldHVybiAtRU5PTUVNOwo+ICAKPiAgCXJldCA9IHRpbnlkcm1fZGlzcGxheV9w
aXBlX2luaXQoZHJtLCAmZXBkLT5waXBlLCAmcmVwYXBlcl9waXBlX2Z1bmNzLAo+IC0JCQkJCURS
TV9NT0RFX0NPTk5FQ1RPUl9WSVJUVUFMLAo+ICsJCQkJCURSTV9NT0RFX0NPTk5FQ1RPUl9TUEks
Cj4gIAkJCQkJcmVwYXBlcl9mb3JtYXRzLAo+ICAJCQkJCUFSUkFZX1NJWkUocmVwYXBlcl9mb3Jt
YXRzKSwgbW9kZSwgMCk7Cj4gIAlpZiAocmV0KQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vdGlueWRybS9zdDc1ODYuYyBiL2RyaXZlcnMvZ3B1L2RybS90aW55ZHJtL3N0NzU4Ni5jCj4g
aW5kZXggMjA0ZmFjZTdiMzExLi43YWUzOTAwNGFhODggMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL3Rpbnlkcm0vc3Q3NTg2LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vdGlueWRybS9z
dDc1ODYuYwo+IEBAIC0zODQsNyArMzg0LDcgQEAgc3RhdGljIGludCBzdDc1ODZfcHJvYmUoc3Ry
dWN0IHNwaV9kZXZpY2UgKnNwaSkKPiAgCW1pcGktPnN3YXBfYnl0ZXMgPSB0cnVlOwo+ICAKPiAg
CXJldCA9IHRpbnlkcm1fZGlzcGxheV9waXBlX2luaXQoZHJtLCAmbWlwaS0+cGlwZSwgJnN0NzU4
Nl9waXBlX2Z1bmNzLAo+IC0JCQkJCURSTV9NT0RFX0NPTk5FQ1RPUl9WSVJUVUFMLAo+ICsJCQkJ
CURSTV9NT0RFX0NPTk5FQ1RPUl9TUEksCj4gIAkJCQkJc3Q3NTg2X2Zvcm1hdHMsIEFSUkFZX1NJ
WkUoc3Q3NTg2X2Zvcm1hdHMpLAo+ICAJCQkJCSZzdDc1ODZfbW9kZSwgcm90YXRpb24pOwo+ICAJ
aWYgKHJldCkKPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS91YXBpL2RybS9kcm1fbW9kZS5oIGIvaW5j
bHVkZS91YXBpL2RybS9kcm1fbW9kZS5oCj4gaW5kZXggNWFiMzMxZTVkYzIzLi43MzVjOGNmZGFh
YTEgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS91YXBpL2RybS9kcm1fbW9kZS5oCj4gKysrIGIvaW5j
bHVkZS91YXBpL2RybS9kcm1fbW9kZS5oCj4gQEAgLTM2MSw2ICszNjEsNyBAQCBlbnVtIGRybV9t
b2RlX3N1YmNvbm5lY3RvciB7Cj4gICNkZWZpbmUgRFJNX01PREVfQ09OTkVDVE9SX0RTSQkJMTYK
PiAgI2RlZmluZSBEUk1fTU9ERV9DT05ORUNUT1JfRFBJCQkxNwo+ICAjZGVmaW5lIERSTV9NT0RF
X0NPTk5FQ1RPUl9XUklURUJBQ0sJMTgKPiArI2RlZmluZSBEUk1fTU9ERV9DT05ORUNUT1JfU1BJ
CQkxOQo+ICAKPiAgc3RydWN0IGRybV9tb2RlX2dldF9jb25uZWN0b3Igewo+ICAKPiAtLSAKPiAy
LjIwLjEKPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Xwo+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWwKCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3Jh
dGlvbgpodHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
