Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90E32361A1
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2019 18:47:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AEB089D7B;
	Wed,  5 Jun 2019 16:47:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE87189D7B
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2019 16:47:50 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id w13so6723112eds.4
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Jun 2019 09:47:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=ZF6+ek6K1/cxW+TV038YTfK4l0WQDNG1quVjYBgfMNk=;
 b=rnBOlKyUauHayr9v8ax9uLQdkg/j5AH2pb7TaEohOOsBYLVxwqiBKXV0Aqyrjqyflq
 hDBssUquwyHmxlGlVwHo8isQ9dFVWCOttinclpI5bMRSdfnHOWw8MlkUt+CynTyG79u1
 81oMml0q3315NW6CTCpG8LtPUp36d3khyxUNjx+DRf8EUlNebd84KMlEVQCy5sslYAmm
 K3IyKlcEmMgI5RvKwt7RId+VZ3IJ5w9JZCdtTxtGY5pg9uGCEwfp25teh/OEM2lzaXJ/
 QDLm46VMHOqAX56hgUUbr5nPlIT2rG3P/AdqB6drvjPEeiBmTHtd6UnPfTp1Xc/vSblM
 GxFw==
X-Gm-Message-State: APjAAAU/OzAsAK+eHydT09pIWufLIDo7GTeXpAFrIxKcf3naxFi03HIr
 aUlZAMStVxZFna2zwEUN/5u9dgWRb6A=
X-Google-Smtp-Source: APXvYqxP+Tan6v54TOwgQ1i10jFtvRGt64pR4jSFSthwKwTK3cvRDzE7OWZ+TvhkhM2gyuRfJ7SK3w==
X-Received: by 2002:a50:8dc5:: with SMTP id s5mr44434745edh.138.1559753269528; 
 Wed, 05 Jun 2019 09:47:49 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id b45sm5712615edb.28.2019.06.05.09.47.46
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 05 Jun 2019 09:47:46 -0700 (PDT)
Date: Wed, 5 Jun 2019 18:47:44 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v1 2/2] drm/r128: drop use of drmP.h
Message-ID: <20190605164744.GX21222@phenom.ffwll.local>
References: <20190605141321.17819-1-sam@ravnborg.org>
 <20190605141321.17819-3-sam@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190605141321.17819-3-sam@ravnborg.org>
X-Operating-System: Linux phenom 4.14.0-3-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=ZF6+ek6K1/cxW+TV038YTfK4l0WQDNG1quVjYBgfMNk=;
 b=V8rNrDKuMMx0fORCnxY1K3y8LEMaFYlGvD99t3eWbas0rKc17Iii6fy7ABkdahM7/8
 gLK/HSKDgzPnzp4OzlY5tqsH+rYIUgb2n3YujWApBPXzOqOw7gsBve2x1DpNX8x39lHv
 2nNoOd5BrELcEmeA3U0UaedH/5VoSI/L2NUig=
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdW4gMDUsIDIwMTkgYXQgMDQ6MTM6MjFQTSArMDIwMCwgU2FtIFJhdm5ib3JnIHdy
b3RlOgo+IERyb3AgdXNlIG9mIHRoZSBkZXByZWNhdGVkIGRybVAuaCBoZWFkZXIgZmlsZS4KPiBS
ZXBsYWNlIGl0IHdpdGggcmVsZXZhbnQgaW5jbHVkZSBmaWxlcy4KPiBTb3J0IGluY2x1ZGUgZmls
ZXMgaW4gZmlsZXMgdG91Y2hlZC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBTYW0gUmF2bmJvcmcgPHNh
bUByYXZuYm9yZy5vcmc+Cj4gQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KPiBD
YzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgoKT24gYm90aCBwYXRjaGVzOgoKUmV2
aWV3ZWQtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+CgpBZ2FpbiBy
MTI4IGlzIHVubWFpbnRhaW5lZCwgSSB0aGluayB5b3UgY2FuIGp1c3QgZ28gYWhlYWQgYW5kIHB1
c2guCi1EYW5pZWwKCj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9yMTI4L3IxMjhfY2NlLmMgICB8
IDEyICsrKysrKysrKystLQo+ICBkcml2ZXJzL2dwdS9kcm0vcjEyOC9yMTI4X2Rydi5jICAgfCAg
OSArKysrKystLS0KPiAgZHJpdmVycy9ncHUvZHJtL3IxMjgvcjEyOF9kcnYuaCAgIHwgIDYgKysr
KysrCj4gIGRyaXZlcnMvZ3B1L2RybS9yMTI4L3IxMjhfc3RhdGUuYyB8ICA5ICsrKysrKysrLQo+
ICA0IGZpbGVzIGNoYW5nZWQsIDMwIGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCj4gCj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yMTI4L3IxMjhfY2NlLmMgYi9kcml2ZXJzL2dw
dS9kcm0vcjEyOC9yMTI4X2NjZS5jCj4gaW5kZXggNmY0MjZiYjA2OTM0Li4xMzhhZjMyNDgwZDQg
MTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3IxMjgvcjEyOF9jY2UuYwo+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9yMTI4L3IxMjhfY2NlLmMKPiBAQCAtMjksMTMgKzI5LDIxIEBACj4gICAq
ICAgIEdhcmV0aCBIdWdoZXMgPGdhcmV0aEB2YWxpbnV4LmNvbT4KPiAgICovCj4gIAo+ICsjaW5j
bHVkZSA8bGludXgvZGVsYXkuaD4KPiArI2luY2x1ZGUgPGxpbnV4L2RtYS1tYXBwaW5nLmg+Cj4g
ICNpbmNsdWRlIDxsaW51eC9maXJtd2FyZS5oPgo+ICsjaW5jbHVkZSA8bGludXgvbW9kdWxlLmg+
Cj4gICNpbmNsdWRlIDxsaW51eC9wbGF0Zm9ybV9kZXZpY2UuaD4KPiAgI2luY2x1ZGUgPGxpbnV4
L3NsYWIuaD4KPiAtI2luY2x1ZGUgPGxpbnV4L21vZHVsZS5oPgo+ICsjaW5jbHVkZSA8bGludXgv
dWFjY2Vzcy5oPgo+ICAKPiAtI2luY2x1ZGUgPGRybS9kcm1QLmg+Cj4gKyNpbmNsdWRlIDxkcm0v
ZHJtX2FncHN1cHBvcnQuaD4KPiArI2luY2x1ZGUgPGRybS9kcm1fZGV2aWNlLmg+Cj4gKyNpbmNs
dWRlIDxkcm0vZHJtX2ZpbGUuaD4KPiArI2luY2x1ZGUgPGRybS9kcm1faXJxLmg+Cj4gKyNpbmNs
dWRlIDxkcm0vZHJtX3ByaW50Lmg+Cj4gICNpbmNsdWRlIDxkcm0vcjEyOF9kcm0uaD4KPiArCj4g
ICNpbmNsdWRlICJyMTI4X2Rydi5oIgo+ICAKPiAgI2RlZmluZSBSMTI4X0ZJRk9fREVCVUcJCTAK
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3IxMjgvcjEyOF9kcnYuYyBiL2RyaXZlcnMv
Z3B1L2RybS9yMTI4L3IxMjhfZHJ2LmMKPiBpbmRleCA0YjFhNTA1YWIzNTMuLmZkNzRmNzQ0NjA0
ZiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vcjEyOC9yMTI4X2Rydi5jCj4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL3IxMjgvcjEyOF9kcnYuYwo+IEBAIC0zMSwxMSArMzEsMTQgQEAKPiAg
Cj4gICNpbmNsdWRlIDxsaW51eC9tb2R1bGUuaD4KPiAgCj4gLSNpbmNsdWRlIDxkcm0vZHJtUC5o
Pgo+ICsjaW5jbHVkZSA8ZHJtL2RybV9kcnYuaD4KPiArI2luY2x1ZGUgPGRybS9kcm1fZmlsZS5o
Pgo+ICsjaW5jbHVkZSA8ZHJtL2RybV9wY2kuaD4KPiArI2luY2x1ZGUgPGRybS9kcm1fcGNpaWRz
Lmg+Cj4gKyNpbmNsdWRlIDxkcm0vZHJtX3ZibGFuay5oPgo+ICAjaW5jbHVkZSA8ZHJtL3IxMjhf
ZHJtLmg+Cj4gLSNpbmNsdWRlICJyMTI4X2Rydi5oIgo+ICAKPiAtI2luY2x1ZGUgPGRybS9kcm1f
cGNpaWRzLmg+Cj4gKyNpbmNsdWRlICJyMTI4X2Rydi5oIgo+ICAKPiAgc3RhdGljIHN0cnVjdCBw
Y2lfZGV2aWNlX2lkIHBjaWlkbGlzdFtdID0gewo+ICAJcjEyOF9QQ0lfSURTCj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9yMTI4L3IxMjhfZHJ2LmggYi9kcml2ZXJzL2dwdS9kcm0vcjEy
OC9yMTI4X2Rydi5oCj4gaW5kZXggMTE1YmIyODZkZDJhLi5iYThjMzBlZDkxZDEgMTAwNjQ0Cj4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL3IxMjgvcjEyOF9kcnYuaAo+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS9yMTI4L3IxMjhfZHJ2LmgKPiBAQCAtMzUsOCArMzUsMTQgQEAKPiAgI2lmbmRlZiBfX1Ix
MjhfRFJWX0hfXwo+ICAjZGVmaW5lIF9fUjEyOF9EUlZfSF9fCj4gIAo+ICsjaW5jbHVkZSA8bGlu
dXgvZGVsYXkuaD4KPiArI2luY2x1ZGUgPGxpbnV4L2lvLmg+Cj4gKyNpbmNsdWRlIDxsaW51eC9p
cnFyZXR1cm4uaD4KPiArCj4gICNpbmNsdWRlIDxkcm0vYXRpX3BjaWdhcnQuaD4KPiArI2luY2x1
ZGUgPGRybS9kcm1faW9jdGwuaD4KPiAgI2luY2x1ZGUgPGRybS9kcm1fbGVnYWN5Lmg+Cj4gKyNp
bmNsdWRlIDxkcm0vcjEyOF9kcm0uaD4KPiAgCj4gIC8qIEdlbmVyYWwgY3VzdG9taXphdGlvbjoK
PiAgICovCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yMTI4L3IxMjhfc3RhdGUuYyBi
L2RyaXZlcnMvZ3B1L2RybS9yMTI4L3IxMjhfc3RhdGUuYwo+IGluZGV4IDI1MzVlYThkMmQ5Yi4u
OWQ3NGM5ZDkxNGNiIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9yMTI4L3IxMjhfc3Rh
dGUuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9yMTI4L3IxMjhfc3RhdGUuYwo+IEBAIC0yOCw4
ICsyOCwxNSBAQAo+ICAgKiAgICBHYXJldGggSHVnaGVzIDxnYXJldGhAdmFsaW51eC5jb20+Cj4g
ICAqLwo+ICAKPiAtI2luY2x1ZGUgPGRybS9kcm1QLmg+Cj4gKyNpbmNsdWRlIDxsaW51eC9wY2ku
aD4KPiArI2luY2x1ZGUgPGxpbnV4L3NsYWIuaD4KPiArI2luY2x1ZGUgPGxpbnV4L3VhY2Nlc3Mu
aD4KPiArCj4gKyNpbmNsdWRlIDxkcm0vZHJtX2RldmljZS5oPgo+ICsjaW5jbHVkZSA8ZHJtL2Ry
bV9maWxlLmg+Cj4gKyNpbmNsdWRlIDxkcm0vZHJtX3ByaW50Lmg+Cj4gICNpbmNsdWRlIDxkcm0v
cjEyOF9kcm0uaD4KPiArCj4gICNpbmNsdWRlICJyMTI4X2Rydi5oIgo+ICAKPiAgLyogPT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PQo+IC0tIAo+IDIuMjAuMQo+IAoKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIs
IEludGVsIENvcnBvcmF0aW9uCmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
