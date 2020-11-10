Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E4412AD05B
	for <lists+dri-devel@lfdr.de>; Tue, 10 Nov 2020 08:22:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E3D28970B;
	Tue, 10 Nov 2020 07:22:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D58B8970B
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 07:22:46 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id b6so142478wrt.4
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Nov 2020 23:22:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=pgYTv/xDlwDGx17SGvB/gmIGQuabjes19DWEJkyXO6Y=;
 b=cwHDLKEkoU3j/6kaUgRxnWyiP409LDccPLWTOyHyBR0pT/tPbRhXPW9aCPehvwdKow
 1hVCnfPhvw0c29TtlfHBUl1QHajuqTtQnbN93IixMRcxlLLJWITG46Qd9L5T51+EBHz1
 WXOsGB9CbqRiZwVruhdW8wNXrIDqnI70w0NUbKmFDFgSdQB71aEV8cSUrz+v0Viwxy0s
 ldGSbxePw57Te9VGYcynnwfZqeNgVMNXkCa3we0adZQpcPkjRseKARXjj/GN9ZRafwXY
 j9/fg7Kr9azoWvLybrRKXCe+y3xhgWtyPAXg5kZ/NSlVgXadm4e1tPR5cW82icqTZYdx
 XjWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=pgYTv/xDlwDGx17SGvB/gmIGQuabjes19DWEJkyXO6Y=;
 b=SVwZYlJx9Kq6YmVT1se7soGXnSQZwcQMAJafkXoDMMfYsQw2wiG4t12qYF/SjGQp3J
 WJeZlkLsHRn4THiA2qCNdBQJe/5u+1q/DBVOa6lVbNQ06S2lo4ENLciVDT1rruNHiyOK
 FOb9eOFtbYIzCbialHgnGdjWxFiClnFqMkGN7MYsWwh4sZHi2j8TCjiKhgREs6q1pwxd
 Vfz6cLuhCw0epOxFJ2d32/v7+MoLWHNjBz3aHFUl6CoO1F3D42lxSw723pWxSuxvD70F
 CNTg+DVW8I0Un6NIeJGsgdOG3VecmgPmDUbQIY7dNFBiFJAHOSPL77OCSAVNg0V8fwDN
 +nZA==
X-Gm-Message-State: AOAM532EnRfkEQMmSCgTADqoa232aT/xdLqJ8hpQQu6aqN0FPS8QBu+C
 OnP/fxJINLRziFUN/ahA0rKk3Q==
X-Google-Smtp-Source: ABdhPJytbodfPNciSJGHPfGDtp2n8M8AqMAnaG/IPVy9kKlEQBc0JnB43SLpHstkACTrQQIVaCMtfQ==
X-Received: by 2002:adf:80cb:: with SMTP id 69mr21704418wrl.325.1604992965012; 
 Mon, 09 Nov 2020 23:22:45 -0800 (PST)
Received: from dell ([91.110.221.139])
 by smtp.gmail.com with ESMTPSA id n10sm5685079wrv.77.2020.11.09.23.22.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Nov 2020 23:22:44 -0800 (PST)
Date: Tue, 10 Nov 2020 07:22:42 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [PATCH 15/20] drm/radeon/r600d: Move 'rc600_*' prototypes into
 shared header
Message-ID: <20201110072242.GF2063125@dell>
References: <20201109211855.3340030-1-lee.jones@linaro.org>
 <20201109211855.3340030-16-lee.jones@linaro.org>
 <CADnq5_NvitEQWH3Z+5EgOH3zJn=P5YTqwHQo4LLQLi0Hj0Dpww@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CADnq5_NvitEQWH3Z+5EgOH3zJn=P5YTqwHQo4LLQLi0Hj0Dpww@mail.gmail.com>
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
Cc: David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCAwOSBOb3YgMjAyMCwgQWxleCBEZXVjaGVyIHdyb3RlOgoKPiBPbiBNb24sIE5vdiA5
LCAyMDIwIGF0IDQ6MTkgUE0gTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4gd3JvdGU6
Cj4gPgo+ID4gRml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6
Cj4gPgo+ID4gIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vcjYwMF9oZG1pLmM6MTc3OjY6IHdhcm5p
bmc6IG5vIHByZXZpb3VzIHByb3RvdHlwZSBmb3Ig4oCYcjYwMF9oZG1pX3VwZGF0ZV9hY3LigJkg
Wy1XbWlzc2luZy1wcm90b3R5cGVzXQo+ID4gIDE3NyB8IHZvaWQgcjYwMF9oZG1pX3VwZGF0ZV9h
Y3Ioc3RydWN0IGRybV9lbmNvZGVyICplbmNvZGVyLCBsb25nIG9mZnNldCwKPiA+ICB8IF5+fn5+
fn5+fn5+fn5+fn5+fn5+Cj4gPiAgZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yNjAwX2hkbWkuYzoy
MTc6Njogd2FybmluZzogbm8gcHJldmlvdXMgcHJvdG90eXBlIGZvciDigJhyNjAwX3NldF9hdmlf
cGFja2V04oCZIFstV21pc3NpbmctcHJvdG90eXBlc10KPiA+ICAyMTcgfCB2b2lkIHI2MDBfc2V0
X2F2aV9wYWNrZXQoc3RydWN0IHJhZGVvbl9kZXZpY2UgKnJkZXYsIHUzMiBvZmZzZXQsCj4gPiAg
fCBefn5+fn5+fn5+fn5+fn5+fn5+Cj4gPiAgZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yNjAwX2hk
bWkuYzozMTQ6Njogd2FybmluZzogbm8gcHJldmlvdXMgcHJvdG90eXBlIGZvciDigJhyNjAwX2hk
bWlfYXVkaW9fc2V0X2R0b+KAmSBbLVdtaXNzaW5nLXByb3RvdHlwZXNdCj4gPiAgMzE0IHwgdm9p
ZCByNjAwX2hkbWlfYXVkaW9fc2V0X2R0byhzdHJ1Y3QgcmFkZW9uX2RldmljZSAqcmRldiwKPiA+
ICB8IF5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+Cj4gPiAgZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9y
NjAwX2hkbWkuYzozNDA6Njogd2FybmluZzogbm8gcHJldmlvdXMgcHJvdG90eXBlIGZvciDigJhy
NjAwX3NldF92YmlfcGFja2V04oCZIFstV21pc3NpbmctcHJvdG90eXBlc10KPiA+ICAzNDAgfCB2
b2lkIHI2MDBfc2V0X3ZiaV9wYWNrZXQoc3RydWN0IGRybV9lbmNvZGVyICplbmNvZGVyLCB1MzIg
b2Zmc2V0KQo+ID4gIHwgXn5+fn5+fn5+fn5+fn5+fn5+fgo+ID4gIGRyaXZlcnMvZ3B1L2RybS9y
YWRlb24vcjYwMF9oZG1pLmM6MzUxOjY6IHdhcm5pbmc6IG5vIHByZXZpb3VzIHByb3RvdHlwZSBm
b3Ig4oCYcjYwMF9zZXRfYXVkaW9fcGFja2V04oCZIFstV21pc3NpbmctcHJvdG90eXBlc10KPiA+
ICAzNTEgfCB2b2lkIHI2MDBfc2V0X2F1ZGlvX3BhY2tldChzdHJ1Y3QgZHJtX2VuY29kZXIgKmVu
Y29kZXIsIHUzMiBvZmZzZXQpCj4gPiAgfCBefn5+fn5+fn5+fn5+fn5+fn5+fn4KPiA+ICBkcml2
ZXJzL2dwdS9kcm0vcmFkZW9uL3I2MDBfaGRtaS5jOjM5Mzo2OiB3YXJuaW5nOiBubyBwcmV2aW91
cyBwcm90b3R5cGUgZm9yIOKAmHI2MDBfc2V0X211dGXigJkgWy1XbWlzc2luZy1wcm90b3R5cGVz
XQo+ID4gIDM5MyB8IHZvaWQgcjYwMF9zZXRfbXV0ZShzdHJ1Y3QgZHJtX2VuY29kZXIgKmVuY29k
ZXIsIHUzMiBvZmZzZXQsIGJvb2wgbXV0ZSkKPiA+ICB8IF5+fn5+fn5+fn5+fn4KPiA+ICBkcml2
ZXJzL2dwdS9kcm0vcmFkZW9uL3I2MDBfaGRtaS5jOjQ2OTo2OiB3YXJuaW5nOiBubyBwcmV2aW91
cyBwcm90b3R5cGUgZm9yIOKAmHI2MDBfaGRtaV9lbmFibGXigJkgWy1XbWlzc2luZy1wcm90b3R5
cGVzXQo+ID4gIDQ2OSB8IHZvaWQgcjYwMF9oZG1pX2VuYWJsZShzdHJ1Y3QgZHJtX2VuY29kZXIg
KmVuY29kZXIsIGJvb2wgZW5hYmxlKQo+ID4gIHwgXn5+fn5+fn5+fn5+fn5+fgo+ID4KPiA+IENj
OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Cj4gPiBDYzogIkNocmlz
dGlhbiBLw7ZuaWciIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cj4gPiBDYzogRGF2aWQgQWly
bGllIDxhaXJsaWVkQGxpbnV4LmllPgo+ID4gQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZnds
bC5jaD4KPiA+IENjOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+ID4gQ2M6IGRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiA+IFNpZ25lZC1vZmYtYnk6IExlZSBKb25lcyA8
bGVlLmpvbmVzQGxpbmFyby5vcmc+Cj4gPiAtLS0KPiA+ICBkcml2ZXJzL2dwdS9kcm0vcmFkZW9u
L3I2MDBkLmggICAgICAgIHwgMTQgKysrKysrKysrKysrKysKPiA+ICBkcml2ZXJzL2dwdS9kcm0v
cmFkZW9uL3JhZGVvbl9hdWRpby5jIHwgMTEgKy0tLS0tLS0tLS0KPiA+ICAyIGZpbGVzIGNoYW5n
ZWQsIDE1IGluc2VydGlvbnMoKyksIDEwIGRlbGV0aW9ucygtKQo+ID4KPiA+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3I2MDBkLmggYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9u
L3I2MDBkLmgKPiA+IGluZGV4IDJlMDBhNTI4N2JkMmQuLmRiNGJjYzhiZWU0ZTUgMTAwNjQ0Cj4g
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3I2MDBkLmgKPiA+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS9yYWRlb24vcjYwMGQuaAo+ID4gQEAgLTI3LDYgKzI3LDIwIEBACj4gPiAgI2lmbmRl
ZiBSNjAwRF9ICj4gPiAgI2RlZmluZSBSNjAwRF9ICj4gPgo+ID4gK3N0cnVjdCByYWRlb25fY3J0
YzsKPiA+ICtzdHJ1Y3QgcmFkZW9uX2hkbWlfYWNyOwo+ID4gKwo+ID4gK3ZvaWQgcjYwMF9zZXRf
YXVkaW9fcGFja2V0KHN0cnVjdCBkcm1fZW5jb2RlciAqZW5jb2RlciwgdTMyIG9mZnNldCk7Cj4g
PiArdm9pZCByNjAwX3NldF9tdXRlKHN0cnVjdCBkcm1fZW5jb2RlciAqZW5jb2RlciwgdTMyIG9m
ZnNldCwgYm9vbCBtdXRlKTsKPiA+ICt2b2lkIHI2MDBfaGRtaV9hdWRpb19zZXRfZHRvKHN0cnVj
dCByYWRlb25fZGV2aWNlICpyZGV2LAo+ID4gKyAgICAgICBzdHJ1Y3QgcmFkZW9uX2NydGMgKmNy
dGMsIHVuc2lnbmVkIGludCBjbG9jayk7Cj4gPiArdm9pZCByNjAwX3NldF9hdmlfcGFja2V0KHN0
cnVjdCByYWRlb25fZGV2aWNlICpyZGV2LCB1MzIgb2Zmc2V0LAo+ID4gKyAgICAgICB1bnNpZ25l
ZCBjaGFyICpidWZmZXIsIHNpemVfdCBzaXplKTsKPiA+ICt2b2lkIHI2MDBfaGRtaV91cGRhdGVf
YWNyKHN0cnVjdCBkcm1fZW5jb2RlciAqZW5jb2RlciwgbG9uZyBvZmZzZXQsCj4gPiArICAgICAg
IGNvbnN0IHN0cnVjdCByYWRlb25faGRtaV9hY3IgKmFjcik7Cj4gPiArdm9pZCByNjAwX3NldF92
YmlfcGFja2V0KHN0cnVjdCBkcm1fZW5jb2RlciAqZW5jb2RlciwgdTMyIG9mZnNldCk7Cj4gPiAr
dm9pZCByNjAwX2hkbWlfZW5hYmxlKHN0cnVjdCBkcm1fZW5jb2RlciAqZW5jb2RlciwgYm9vbCBl
bmFibGUpOwo+ID4gKwo+IAo+IHRoZSAqZC5oIGhlYWRlcnMgYXJlIHN1cHBvc2VkIHRvIGp1c3Qg
YmUgaGFyZHdhcmUgZGVmaW5pdGlvbnMuICBJJ2QKPiBwcmVmZXIgdG8ga2VlcCBkcml2ZXIgc3R1
ZmYgb3V0IG9mIHRoZW0uCgpUaGF0J3MgZmluZSAoSSBkaWQgd29uZGVyIGlmIHRoYXQgd2VyZSB0
aGUgY2FzZSkuCgpJIG5lZWQgYW4gYW5zd2VyIGZyb20geW91IGFuZCBTYW0gd2hldGhlciBJIGNh
biBjcmVhdGUgbmV3IGhlYWRlcnMuCgpGb3IgbWUsIGl0IGlzIHRoZSByaWdodCB0aGluZyB0byBk
by4KCi0tIApMZWUgSm9uZXMgW+adjueQvOaWr10KU2VuaW9yIFRlY2huaWNhbCBMZWFkIC0gRGV2
ZWxvcGVyIFNlcnZpY2VzCkxpbmFyby5vcmcg4pSCIE9wZW4gc291cmNlIHNvZnR3YXJlIGZvciBB
cm0gU29DcwpGb2xsb3cgTGluYXJvOiBGYWNlYm9vayB8IFR3aXR0ZXIgfCBCbG9nCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
