Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 65339427D3
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2019 15:39:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C466892EE;
	Wed, 12 Jun 2019 13:39:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe43.google.com (mail-vs1-xe43.google.com
 [IPv6:2607:f8b0:4864:20::e43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BBE0892EE
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2019 13:39:49 +0000 (UTC)
Received: by mail-vs1-xe43.google.com with SMTP id l20so10247555vsp.3
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2019 06:39:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RHY18nWSNkEapshAZSGMydNFb3ZXYo62iqfMIbVDp6I=;
 b=RlLsmomh9BcWYuvgxgdnSeVLUR0dmoNn1L+6dMuIUt3Eu6qCaSL5gKnwEe/8/TYqIF
 eU+bZA/dkZwnB9TI4bpdYQrlda03jexrg8epE4UNcj/A/1UcQXyZm44hvalzxgoJOEkY
 b2wjhI3DCfvlVN6tj2xkB+sNj5BA0BQNNyMp7sOfApYuZFjBxpve7MiXw78voTIdR9Zu
 FDwAOLgkNiTrsqqPKQtKxHd8j5SRqWbnd6/7RhDn/x6o7pl4BGwcZ6k/t+fNmaC+a+AK
 80RU7uR15LE/Rd+fOyonhuongrUwRgrSrQ2znc7b37YG4ei+2HYoC8tIU418SozYH4BH
 8Mfw==
X-Gm-Message-State: APjAAAUnuTztmMzD92AGB7GF1d9PWdCw+d13DB135hiLL+dWkc6a1irB
 Nf30lD18BwWsfYKowAkKIJsSpJsevgNxccvqQfM=
X-Google-Smtp-Source: APXvYqwE5aCfBR6uHI5D4Thcc7wMDuWc9bhMLAqw8JS6AngZaeF19Hiz/nL69ZjkA/J8Ai9hY6/GVSQVpvDT8kL24LU=
X-Received: by 2002:a67:b14d:: with SMTP id z13mr5101971vsl.190.1560346788180; 
 Wed, 12 Jun 2019 06:39:48 -0700 (PDT)
MIME-Version: 1.0
References: <20190606222751.32567-1-daniel.vetter@ffwll.ch>
 <20190606222751.32567-5-daniel.vetter@ffwll.ch>
In-Reply-To: <20190606222751.32567-5-daniel.vetter@ffwll.ch>
From: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
Date: Wed, 12 Jun 2019 10:39:38 -0300
Message-ID: <CADKXj+4Ks2ZVYErhfTTGyLTrnJSp6CqWoi_SU7QuQcH1igj8QQ@mail.gmail.com>
Subject: Re: [PATCH 04/10] drm/vkms: Move format arrays to vkms_plane.c
To: Daniel Vetter <daniel.vetter@ffwll.ch>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=RHY18nWSNkEapshAZSGMydNFb3ZXYo62iqfMIbVDp6I=;
 b=FnW/QsdYf0rRJVtwhFlMcTdv36Du08Vq13dh6ptO3q3/eZR8IcxcvJ6GTLtg+W5ybY
 2qdeTmh/5vX8UfkTKreZ2ep8I6LWsSSSHlUFjxrFD5B1+SSO9zGob7W5dTPINZ2K8fBr
 ZaoVzVhhxelAtBmT6+Mf+iPYc7DPsU5XYRoTrhtEimdmJcx7zCnp129NgAr59H4+JCnN
 msk20ghX85COJyqUxMJhaiOrffPcysoamqjIZIA8ugLesPJt4/44VSk1GTJsNoJQqhKs
 lwYnzgOPq7gFw4HZZ/oL9ZTlw2BeQm+nPt+REytBoKzZhfCDBPgyTOTBaLtdP3jSuiSu
 ef0g==
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
 DRI Development <dri-devel@lists.freedesktop.org>,
 Haneen Mohammed <hamohammed.sa@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKdW4gNiwgMjAxOSBhdCA3OjI4IFBNIERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0
ZXJAZmZ3bGwuY2g+IHdyb3RlOgo+Cj4gTm8gbmVlZCB0byBoYXZlIHRoZW0gbXVsdGlwbGUgdGlt
ZXMuCj4KPiBTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGludGVs
LmNvbT4KPiBDYzogUm9kcmlnbyBTaXF1ZWlyYSA8cm9kcmlnb3NpcXVlaXJhbWVsb0BnbWFpbC5j
b20+Cj4gQ2M6IEhhbmVlbiBNb2hhbW1lZCA8aGFtb2hhbW1lZC5zYUBnbWFpbC5jb20+Cj4gQ2M6
IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJt
L3ZrbXMvdmttc19kcnYuaCAgIHwgOCAtLS0tLS0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vdmttcy92
a21zX3BsYW5lLmMgfCA4ICsrKysrKysrCj4gIDIgZmlsZXMgY2hhbmdlZCwgOCBpbnNlcnRpb25z
KCspLCA4IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS92a21z
L3ZrbXNfZHJ2LmggYi9kcml2ZXJzL2dwdS9kcm0vdmttcy92a21zX2Rydi5oCj4gaW5kZXggNDNk
M2Y5ODI4OWZlLi4yYTM1Mjk5YmZiODkgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3Zr
bXMvdmttc19kcnYuaAo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS92a21zL3ZrbXNfZHJ2LmgKPiBA
QCAtMjAsMTQgKzIwLDYgQEAKPgo+ICBleHRlcm4gYm9vbCBlbmFibGVfY3Vyc29yOwo+Cj4gLXN0
YXRpYyBjb25zdCB1MzIgdmttc19mb3JtYXRzW10gPSB7Cj4gLSAgICAgICBEUk1fRk9STUFUX1hS
R0I4ODg4LAo+IC19Owo+IC0KPiAtc3RhdGljIGNvbnN0IHUzMiB2a21zX2N1cnNvcl9mb3JtYXRz
W10gPSB7Cj4gLSAgICAgICBEUk1fRk9STUFUX0FSR0I4ODg4LAo+IC19Owo+IC0KPiAgc3RydWN0
IHZrbXNfY3JjX2RhdGEgewo+ICAgICAgICAgc3RydWN0IGRybV9mcmFtZWJ1ZmZlciBmYjsKPiAg
ICAgICAgIHN0cnVjdCBkcm1fcmVjdCBzcmMsIGRzdDsKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL3ZrbXMvdmttc19wbGFuZS5jIGIvZHJpdmVycy9ncHUvZHJtL3ZrbXMvdmttc19wbGFu
ZS5jCj4gaW5kZXggMGU2N2QyZDQyZjBjLi4wZmNlYjYyNTg0MjIgMTAwNjQ0Cj4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL3ZrbXMvdmttc19wbGFuZS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3Zr
bXMvdmttc19wbGFuZS5jCj4gQEAgLTYsNiArNiwxNCBAQAo+ICAjaW5jbHVkZSA8ZHJtL2RybV9h
dG9taWNfaGVscGVyLmg+Cj4gICNpbmNsdWRlIDxkcm0vZHJtX2dlbV9mcmFtZWJ1ZmZlcl9oZWxw
ZXIuaD4KPgo+ICtzdGF0aWMgY29uc3QgdTMyIHZrbXNfZm9ybWF0c1tdID0gewo+ICsgICAgICAg
RFJNX0ZPUk1BVF9YUkdCODg4OCwKPiArfTsKPiArCj4gK3N0YXRpYyBjb25zdCB1MzIgdmttc19j
dXJzb3JfZm9ybWF0c1tdID0gewo+ICsgICAgICAgRFJNX0ZPUk1BVF9BUkdCODg4OCwKPiArfTsK
PiArCj4gIHN0YXRpYyBzdHJ1Y3QgZHJtX3BsYW5lX3N0YXRlICoKPiAgdmttc19wbGFuZV9kdXBs
aWNhdGVfc3RhdGUoc3RydWN0IGRybV9wbGFuZSAqcGxhbmUpCj4gIHsKPiAtLQo+IDIuMjAuMQo+
ClJldmlld2VkLWJ5OiBSb2RyaWdvIFNpcXVlaXJhIDxyb2RyaWdvc2lxdWVpcmFtZWxvQGdtYWls
LmNvbT4KVGVzdGVkLWJ5OiBSb2RyaWdvIFNpcXVlaXJhIDxyb2RyaWdvc2lxdWVpcmFtZWxvQGdt
YWlsLmNvbT4KCi0tIAoKUm9kcmlnbyBTaXF1ZWlyYQpodHRwczovL3NpcXVlaXJhLnRlY2gKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
