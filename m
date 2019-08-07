Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3395852B0
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2019 20:09:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 925076E753;
	Wed,  7 Aug 2019 18:09:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 847276E753;
 Wed,  7 Aug 2019 18:09:05 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id s49so52496674edb.1;
 Wed, 07 Aug 2019 11:09:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QwJtWVakiEP96kTbkFoUqxH1WvOLhFPnnG3gbiyDKlk=;
 b=gGZM5WHDLYh/2uJBqURC6+yWSQiHve6A8PY/105nL0R7Hg4eyIi0Jw6Xt6d0GudZzR
 H9aHrQG2/i3rGASDshvIR96OYr9spHDXuS0NtMDuKys3CsMpcKk7Ezlosg2Im74F64mb
 A2VdQ5LK8W+e2WXQSRsu6r9KwaMCOTsGhpaoKYE2TdKCwzjKyyY6OGhLe9+FrB7ErOnP
 cOgsYKw5sSh0jq/TcSw0UAUfN2gPI04ez4PJeWeCzZyFIw0YQu5jpO9EK7CRPANVOfg3
 E7toX5yU92g/Mm6mqIaM2vrAe0ZkGg3od2VAYvpIwESKJ3zqGJ14fTdHZUWjGhffnFiT
 DNnw==
X-Gm-Message-State: APjAAAUdcfdqPPJOaGulBd/Ft2/Ky619xeDXiU5/tB6Odct0ns4Td+o/
 iKO8qaU6sM9VjDZUbbi+saKSC4N6AYIvWVUV0Lg=
X-Google-Smtp-Source: APXvYqwNSW7qT7c14KaVkJ6ZlQvzKS1pNZqmXqcTIV2GCqWc+nIWGWtfR6JORaHchzzgwHd/UZI6g3dEbNkRdUCK5oQ=
X-Received: by 2002:a17:906:e241:: with SMTP id
 gq1mr9491438ejb.265.1565201344021; 
 Wed, 07 Aug 2019 11:09:04 -0700 (PDT)
MIME-Version: 1.0
References: <1565198667-4300-1-git-send-email-jcrouse@codeaurora.org>
 <20190807173838.GB30025@ravnborg.org>
In-Reply-To: <20190807173838.GB30025@ravnborg.org>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 7 Aug 2019 11:08:53 -0700
Message-ID: <CAF6AEGv6EY5UBYF8D9tuSaMDvkdrBt+zvRxQA+V4PG6ZfKhUAg@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH] drm/msm: Make DRM_MSM default to 'm'
To: Sam Ravnborg <sam@ravnborg.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=QwJtWVakiEP96kTbkFoUqxH1WvOLhFPnnG3gbiyDKlk=;
 b=QH+xHLDZ8h7jAONg1Dh/3Ql+72SyGAQz1LfNGCnJM1+xeo9YGSGSpEq6CINv1ZUTN3
 dnOcMxwTS4iNO2ND8CYtXDKVvgaEEQdThDijSve89oBokk0Wb4Uah/6vaWrFna1YhuD/
 4Qlf+/g4khOYm7OxaOS8RNpOrq+qSFfhQnGyP3fOuaHAQMskx+PbHPGPbvGQSsMQsOrt
 FtneiDcCb/ROHvOC3HduArDTEURsMp7O4n/AjqzUrqEPp5RWjOMO8iSY7uXwPQZhbEFi
 cML2UlAqmv2BDOwrGrCAmSJ/vLrYvCdl7naVBPysHNWVoe0bxxqbdDdk0OgrXKMSKg9d
 PuHQ==
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
Cc: Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBBdWcgNywgMjAxOSBhdCAxMDozOCBBTSBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9y
Zy5vcmc+IHdyb3RlOgo+Cj4gSGkgSm9yZGFuLgo+IE9uIFdlZCwgQXVnIDA3LCAyMDE5IGF0IDEx
OjI0OjI3QU0gLTA2MDAsIEpvcmRhbiBDcm91c2Ugd3JvdGU6Cj4gPiBNb3N0IHVzZSBjYXNlcyBm
b3IgRFJNX01TTSB3aWxsIHByZWZlciB0byBidWlsZCBib3RoIERSTSBhbmQgTVNNX0RSTSBhcwo+
ID4gbW9kdWxlcyBidXQgdGhlcmUgYXJlIHNvbWUgY2FzZXMgd2hlcmUgRFJNIG1pZ2h0IGJlIGJ1
aWx0IGluIGZvciB3aGF0ZXZlcgo+ID4gcmVhc29uIGFuZCBpbiB0aG9zZSBzaXR1YXRpb25zIGl0
IGlzIHByZWZlcmFibGUgdG8gc3RpbGwga2VlcCBNU00gYXMgYQo+ID4gbW9kdWxlIGJ5IGRlZmF1
bHQgYW5kIGxldCB0aGUgdXNlciBkZWNpZGUgaWYgdGhleSBfcmVhbGx5XyB3YW50IHRvIGJ1aWxk
Cj4gPiBpdCBpbi4KPiA+Cj4gPiBBZGRpdGlvbmFsbHkgc2VsZWN0IFFDT01fQ09NTUFORF9EQiBm
b3IgQVJDSF9RQ09NIHRhcmdldHMgdG8gbWFrZSBzdXJlCj4gPiBpdCBkb2Vzbid0IGdldCBtaXNz
ZWQgd2hlbiB3ZSBuZWVkIGl0IGZvciBhNnh4IHRhcmV0cy4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5
OiBKb3JkYW4gQ3JvdXNlIDxqY3JvdXNlQGNvZGVhdXJvcmEub3JnPgo+ID4gLS0tCj4gPgo+ID4g
IGRyaXZlcnMvZ3B1L2RybS9tc20vS2NvbmZpZyB8IDMgKystCj4gPiAgMSBmaWxlIGNoYW5nZWQs
IDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vbXNtL0tjb25maWcgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL0tjb25maWcKPiA+
IGluZGV4IDljMzdlNGQuLjNiMjMzNGIgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
bXNtL0tjb25maWcKPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vS2NvbmZpZwo+ID4gQEAg
LTE0LDExICsxNCwxMiBAQCBjb25maWcgRFJNX01TTQo+ID4gICAgICAgc2VsZWN0IFNITUVNCj4g
PiAgICAgICBzZWxlY3QgVE1QRlMKPiA+ICAgICAgIHNlbGVjdCBRQ09NX1NDTSBpZiBBUkNIX1FD
T00KPiA+ICsgICAgIHNlbGVjdCBRQ09NX0NPTU1BTkRfREIgaWYgQVJDSF9RQ09NCj4gPiAgICAg
ICBzZWxlY3QgV0FOVF9ERVZfQ09SRURVTVAKPiA+ICAgICAgIHNlbGVjdCBTTkRfU09DX0hETUlf
Q09ERUMgaWYgU05EX1NPQwo+ID4gICAgICAgc2VsZWN0IFNZTkNfRklMRQo+ID4gICAgICAgc2Vs
ZWN0IFBNX09QUAo+ID4gLSAgICAgZGVmYXVsdCB5Cj4gPiArICAgICBkZWZhdWx0IG0KPgo+IEFz
IGEgZ2VuZXJhbCBjb21tZW50IHRoZSByaWdodCB0aGluZyB3b3VsZCBiZSB0byBkcm9wIHRoaXMg
ZGVmYXVsdC4KPiBBcyBpdCBpcyBub3cgdGhlIEtjb25maWcgc2F5cyB0aGF0IHdoZW4gRFJNIGlz
IHNlbGVjdGVkIHRoZW4gYWxsIG9mIHRoZQo+IHdvcmxkIHdvdWxkIHRoZW4gYWxzbyBnZXQgRFJN
X01TTSwgd2hpY2ggb25seSBhIHNtYWxsIHBhcnQgb2YgdGhpcyB3b3JsZAo+IHlvdSBzZWUgYW55
IGJlbmVmaXQgaW4uCj4gU28gdGhleSBub3cgaGF2ZSB0byBkZS1zZWxlY3QgTVNNLgoKSWYgdGhl
IGRlZmF1bHQgaXMgZHJvcHBlZCwgaXQgc2hvdWxkIHByb2JhYmx5IGJlIGFjY29tcGFuaWVkIGJ5
IGFkZGluZwpDT05GSUdfRFJNX01TTT1tIHRvIGRlZmNvbmZpZydzLCBJIHRoaW5rCgpCUiwKLVIK
Cj4gS2NvbmZpZyBoYXM6Cj4gICAgIGRlcGVuZHMgb24gQVJDSF9RQ09NIHx8IFNPQ19JTVg1IHx8
IChBUk0gJiYgQ09NUElMRV9URVNUKQo+Cj4gU28gbWF5YmUgbm90IGFsbCBvZiB0aGUgd29ybGQg
YnV0IGFsbCBRQ09NIG9yIElNWDUgdXNlcnMuIE1heWJlIHRoZXkgYXJlIGFsbAo+IGludGVyZXN0
ZWQgaW4gTVNNLiBPdGhlcndpc2UgdGhlIGRlZmF1bHQgc2hvdWxkIHJhdGhlciBiZSBkcm9wcGVk
Lgo+IElmIHRoZXJlIGlzIGFueSBnb29kIGhpbnRzIHRoZW4gdGhlIGhlbHAgdGV4dCBjb3VsZCBh
bnl3YXkgdXNlIHNvbWUKPiBsb3ZlLCBhbmQgdGhlbiBhZGQgdGhlIGluZm8gdGhlcmUuCj4KPiBU
aGUgb3RoZXIgY2hhbmdlIHdpdGggUUNPTV9DT01NQU5EX0RCIHNlZW1zIG9uIHRoZSBvdGhlciBo
YW5kIHRvIG1ha2UKPiBzZW5zZSBidXQgdGhlbiB0aGlzIGlzIGFub3RoZXIgcGF0Y2guCj4KPiAg
ICAgICAgIFNhbQo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCj4gRnJlZWRyZW5vIG1haWxpbmcgbGlzdAo+IEZyZWVkcmVub0BsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Zy
ZWVkcmVubwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
