Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A2692CA7F
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2019 17:42:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7D2889F2D;
	Tue, 28 May 2019 15:42:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E99E89F2D
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2019 15:42:52 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id c2so5580203wrm.8
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2019 08:42:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=DiCvclcV4pfDX/W7uV9bjfQv6oFftWEtoepwUAy+Dq4=;
 b=uA5HwbLUmLBz4WorE7slmS0XSPR3r74DYOo953KZJWCRaIDrigm34b8nIbiSg5+FYJ
 ZS07AOlTd2SOyNdu2RIvHcKZ3JdvvV3IvYJ6xsiHaK3VdEuzWCxUW1Yw9sHVAR3YX96i
 BtprEe3zS13r6KU+61zufLDaqF/Xm7vy+vKrNhmCPPV7nH0cdBJ7G3RrPjDFBt44ARxP
 vOwhY8cgSdoSyVff5ubY3N6P7g07qTglwTHbfKby0aS5gyxEfldXMpCzkRN/cns++cPd
 iwb6mI3bsefzLu8ohHAQWIOGSWkhizf8VGVqBahNamIJh5PiHBDAlnkQ6T1g7hUJrstz
 Dv3Q==
X-Gm-Message-State: APjAAAWSxAYoSC/fmqpDPDCyGR1FLPDioaz8GmuAOddMVxErN6EsI5Qw
 N1OYKeOFeVaZQBOkKT3dJF4=
X-Google-Smtp-Source: APXvYqzqA26oxlOzjOTL1ZzWhGFHA+iDTgYBi5t6DFpCm412dpEw8Zfhrb5tukg154TfwrWanV3gcQ==
X-Received: by 2002:a5d:6248:: with SMTP id m8mr341458wrv.141.1559058170961;
 Tue, 28 May 2019 08:42:50 -0700 (PDT)
Received: from arch-x1c3 ([2a00:5f00:102:0:9665:9cff:feee:aa4d])
 by smtp.gmail.com with ESMTPSA id l18sm38533743wrh.54.2019.05.28.08.42.49
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 28 May 2019 08:42:50 -0700 (PDT)
Date: Tue, 28 May 2019 16:41:23 +0100
From: Emil Velikov <emil.l.velikov@gmail.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH 1/2] drm/omap: remove open-coded drm_invalid_op()
Message-ID: <20190528154123.GA2768@arch-x1c3>
References: <20190522150219.13913-1-emil.l.velikov@gmail.com>
 <7f87a082-8b38-e46a-50bb-51a26efc4ab2@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7f87a082-8b38-e46a-50bb-51a26efc4ab2@ti.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=DiCvclcV4pfDX/W7uV9bjfQv6oFftWEtoepwUAy+Dq4=;
 b=J59z59ZVoRWcQ4nyc2khzwi0ObUCbNFD+8VgJWRsK2Dx5d1LOheWmXTtaGvPqtmd5e
 9XMpih4MX5Vydkk5S8V0otOOziLb0XkdabELIOb43XJY3ER/uPrQh6veXJa4Y8Q3aSm8
 5gnpHhIDwJH8Ob94e42gTNQY9daG8xPj6rTedOCIZdfW4Z3Xt7wtd4iJCLig2XpLPUAU
 iSYjN3YhEaaJjPF4ytX71aeK8kd/8xKJ5YHl48o/CExjrjgA0Q15raFws5DsGKHgUNWm
 YOg/0WpWjFEGrF3ztg6n590qM/RQ5JYQ6sxa3qKMmPMqJ+AlMULFQFXpa/VTi3snpQUK
 ikhQ==
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS8wNS8yOCwgVG9taSBWYWxrZWluZW4gd3JvdGU6Cj4gT24gMjIvMDUvMjAxOSAxODow
MiwgRW1pbCBWZWxpa292IHdyb3RlOgo+ID4gRnJvbTogRW1pbCBWZWxpa292IDxlbWlsLnZlbGlr
b3ZAY29sbGFib3JhLmNvbT4KPiA+IAo+ID4gQ2M6IFRvbWkgVmFsa2VpbmVuIDx0b21pLnZhbGtl
aW5lbkB0aS5jb20+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBFbWlsIFZlbGlrb3YgPGVtaWwudmVsaWtv
dkBjb2xsYWJvcmEuY29tPgo+ID4gLS0tCj4gPiAgIGRyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL29t
YXBfZHJ2LmMgfCAxNiArLS0tLS0tLS0tLS0tLS0tCj4gPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKSwgMTUgZGVsZXRpb25zKC0pCj4gPiAKPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vb21hcGRybS9vbWFwX2Rydi5jIGIvZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vb21h
cF9kcnYuYwo+ID4gaW5kZXggMWI5YjZmNWU0OGUxLi42NzJlMGY4YWQxMWMgMTAwNjQ0Cj4gPiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0vb21hcGRybS9vbWFwX2Rydi5jCj4gPiArKysgYi9kcml2ZXJz
L2dwdS9kcm0vb21hcGRybS9vbWFwX2Rydi5jCj4gPiBAQCAtNDM5LDIwICs0MzksNiBAQCBzdGF0
aWMgaW50IGlvY3RsX2dldF9wYXJhbShzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCB2b2lkICpkYXRh
LAo+ID4gICAJcmV0dXJuIDA7Cj4gPiAgIH0KPiA+IC1zdGF0aWMgaW50IGlvY3RsX3NldF9wYXJh
bShzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCB2b2lkICpkYXRhLAo+ID4gLQkJc3RydWN0IGRybV9m
aWxlICpmaWxlX3ByaXYpCj4gPiAtewo+ID4gLQlzdHJ1Y3QgZHJtX29tYXBfcGFyYW0gKmFyZ3Mg
PSBkYXRhOwo+ID4gLQo+ID4gLQlzd2l0Y2ggKGFyZ3MtPnBhcmFtKSB7Cj4gPiAtCWRlZmF1bHQ6
Cj4gPiAtCQlEQkcoInVua25vd24gcGFyYW1ldGVyICVsbGQiLCBhcmdzLT5wYXJhbSk7Cj4gPiAt
CQlyZXR1cm4gLUVJTlZBTDsKPiA+IC0JfQo+ID4gLQo+ID4gLQlyZXR1cm4gMDsKPiA+IC19Cj4g
PiAtCj4gPiAgICNkZWZpbmUgT01BUF9CT19VU0VSX01BU0sJMHgwMGZmZmZmZgkvKiBmbGFncyBz
ZXR0YWJsZSBieSB1c2Vyc3BhY2UgKi8KPiA+ICAgc3RhdGljIGludCBpb2N0bF9nZW1fbmV3KHN0
cnVjdCBkcm1fZGV2aWNlICpkZXYsIHZvaWQgKmRhdGEsCj4gPiBAQCAtNDkyLDcgKzQ3OCw3IEBA
IHN0YXRpYyBpbnQgaW9jdGxfZ2VtX2luZm8oc3RydWN0IGRybV9kZXZpY2UgKmRldiwgdm9pZCAq
ZGF0YSwKPiA+ICAgc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1faW9jdGxfZGVzYyBpb2N0bHNbRFJN
X0NPTU1BTkRfRU5EIC0gRFJNX0NPTU1BTkRfQkFTRV0gPSB7Cj4gPiAgIAlEUk1fSU9DVExfREVG
X0RSVihPTUFQX0dFVF9QQVJBTSwgaW9jdGxfZ2V0X3BhcmFtLAo+ID4gICAJCQkgIERSTV9BVVRI
IHwgRFJNX1JFTkRFUl9BTExPVyksCj4gPiAtCURSTV9JT0NUTF9ERUZfRFJWKE9NQVBfU0VUX1BB
UkFNLCBpb2N0bF9zZXRfcGFyYW0sCj4gPiArCURSTV9JT0NUTF9ERUZfRFJWKE9NQVBfU0VUX1BB
UkFNLCBkcm1faW52YWxpZF9vcCwKPiA+ICAgCQkJICBEUk1fQVVUSCB8IERSTV9NQVNURVIgfCBE
Uk1fUk9PVF9PTkxZKSwKPiA+ICAgCURSTV9JT0NUTF9ERUZfRFJWKE9NQVBfR0VNX05FVywgaW9j
dGxfZ2VtX25ldywKPiA+ICAgCQkJICBEUk1fQVVUSCB8IERSTV9SRU5ERVJfQUxMT1cpLAo+ID4g
Cj4gCj4gVGhhbmtzISBEbyB5b3Ugd2FudCB0byB0YWtlIHRoaXMgdmlhIGRybS1taXNjIHRvbywg
b3IgY2FuIEkgcGljayBpdCB1cD8KPiAKSG9waW5nIHRvIHBpY2sgdGhpcyB2aWEgZHJtLW1pc2Ms
IGFsYmVpdCBJIGZvcmdvdCB0byBtZW50aW9uIGVhcmxpZXIuCgpUaGFua3MKRW1pbApfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
