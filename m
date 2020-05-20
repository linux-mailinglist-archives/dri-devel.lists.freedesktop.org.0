Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A7F651DB524
	for <lists+dri-devel@lfdr.de>; Wed, 20 May 2020 15:36:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1BB46E199;
	Wed, 20 May 2020 13:36:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x944.google.com (mail-ua1-x944.google.com
 [IPv6:2607:f8b0:4864:20::944])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDEB56E199
 for <dri-devel@lists.freedesktop.org>; Wed, 20 May 2020 13:36:23 +0000 (UTC)
Received: by mail-ua1-x944.google.com with SMTP id b13so1261514uav.3
 for <dri-devel@lists.freedesktop.org>; Wed, 20 May 2020 06:36:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=MObFPknbedJLiFI6/N4LyGocHeHcFOkg08MJ/+9XxIU=;
 b=QJQT62OOgyBjhQvU7EpugulJMEpKqJl7OMWj49/Nju7kBSrWzlKj7JVQifm8XDXIi5
 cRHoA7dzbTr0d+HR3W0B8JRAhODQBSZdLsv/SdXSCPE/u/Wp5+cT3Y+2XeyhZVb0C771
 EtDHoRQ0CkCkJOBGR921VIwY51G4g5DyBSmA+ikHgi83gFXLpJz9pWj6IbwjsnqtJmyz
 ZGpeDIT4CuDB12+hfstgue2YeJcPSiVPO/HPiFeyjHPUqpzDTk5ue+gSDH0iyLQyrCLP
 149vxpB3ZDCNsmCc/DHwmhQkmn5spmLzmgfmSpklm0zXVzO4LU01TsLtsTfsoBNN25q7
 bvPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=MObFPknbedJLiFI6/N4LyGocHeHcFOkg08MJ/+9XxIU=;
 b=FrC6QDSr9b7elrkww7J+rVtr99+x/FJ0QmTu7q2vQ4uc/YWAkE2uauoUUUzkJUfF2s
 CZ959Wxophm/Lnp8rOjnGR8ta8FGjxDZawQ+ch56i6+6EtTAv2eyiAPB1dKkIRHO+hrh
 z+c1WhxjYhHJuxOgddRk5IfefQ8qRltOtcSAbwkUWbZvT49FbNOACFBem9NeFTu23CMh
 T7k0G5iaDVBzJe2aLWuajAAR6YbJ0d3MAxVtPO2hNRPeQebE7r12NMKweumuXHGCq0RZ
 Tf1jhFgscAvB3XXy1VCcVaYJ6TTAShZOuDYWKmmiLLxmnf7KtrWqzogSmED6nnKxm5ax
 xcBA==
X-Gm-Message-State: AOAM533TEUzYPZuyrWRiyvfIcT/kOBhlU0dcwIggEK50jZSESbzEmWyr
 n2GTmzLqCoF+ERwdgME8WWFoLuKI7H7Y4CZcYhc=
X-Google-Smtp-Source: ABdhPJxzz/xmbok5XSRdgzCv++ocHw5UHlK0IwUsqf9FYPHNtWThhD/weIUAOknLhZPxS6fXFjw5n6eMoIHVfY/U9XM=
X-Received: by 2002:ab0:113:: with SMTP id 19mr732955uak.19.1589981782946;
 Wed, 20 May 2020 06:36:22 -0700 (PDT)
MIME-Version: 1.0
References: <20200520121450.79340-1-nirmoy.das@amd.com>
 <96a01388-7d91-56b5-4cd4-16052aba7a60@amd.com>
 <158997895740.8153.16875812670855148581@build.alporthouse.com>
 <b2284cd6-56cb-847a-1b6f-e4825c4ec1d3@amd.com>
 <158998064926.8153.3458194049597605952@build.alporthouse.com>
 <CACvgo52LSA9P-ifqFN8pgaTVC805vfbAsCV0rPbGyZQveTyAnw@mail.gmail.com>
In-Reply-To: <CACvgo52LSA9P-ifqFN8pgaTVC805vfbAsCV0rPbGyZQveTyAnw@mail.gmail.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Wed, 20 May 2020 14:33:27 +0100
Message-ID: <CACvgo51fM1K2Fg=stC2_cz_pnJypi50Lu_OGs0utGH9QEMS3wQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] drm: check for NULL pointer in drm_gem_object_put
To: Chris Wilson <chris@chris-wilson.co.uk>
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
Cc: Nirmoy Das <nirmoy.das@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Nirmoy Das <nirmoy.aiemd@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAyMCBNYXkgMjAyMCBhdCAxNDozMCwgRW1pbCBWZWxpa292IDxlbWlsLmwudmVsaWtv
dkBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gT24gV2VkLCAyMCBNYXkgMjAyMCBhdCAxNDoxNywgQ2hy
aXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+IHdyb3RlOgo+ID4KPiA+IFF1b3Rp
bmcgQ2hyaXN0aWFuIEvDtm5pZyAoMjAyMC0wNS0yMCAxMzo1NDo1NSkKPiA+ID4gQW0gMjAuMDUu
MjAgdW0gMTQ6NDkgc2NocmllYiBDaHJpcyBXaWxzb246Cj4gPiA+ID4gUXVvdGluZyBDaHJpc3Rp
YW4gS8O2bmlnICgyMDIwLTA1LTIwIDEzOjE5OjQyKQo+ID4gPiA+PiBBbSAyMC4wNS4yMCB1bSAx
NDoxNCBzY2hyaWViIE5pcm1veSBEYXM6Cj4gPiA+ID4+PiBkcm1fZ2VtX2ZiX2Rlc3Ryb3koKSBj
YWxscyBkcm1fZ2VtX29iamVjdF9wdXQoKSB3aXRoIE5VTEwgb2JqIGNhdXNpbmc6Cj4gPiA+ID4+
PiBbICAgMTEuNTg0MjA5XSBCVUc6IGtlcm5lbCBOVUxMIHBvaW50ZXIgZGVyZWZlcmVuY2UsIGFk
ZHJlc3M6IDAwMDAwMDAwMDAwMDAwMDAKPiA+ID4gPj4+IFsgICAxMS41ODQyMTNdICNQRjogc3Vw
ZXJ2aXNvciB3cml0ZSBhY2Nlc3MgaW4ga2VybmVsIG1vZGUKPiA+ID4gPj4+IFsgICAxMS41ODQy
MTVdICNQRjogZXJyb3JfY29kZSgweDAwMDIpIC0gbm90LXByZXNlbnQgcGFnZQo+ID4gPiA+Pj4g
WyAgIDExLjU4NDIxNl0gUEdEIDAgUDREIDAKPiA+ID4gPj4+IFsgICAxMS41ODQyMjBdIE9vcHM6
IDAwMDIgWyMxXSBTTVAgTk9QVEkKPiA+ID4gPj4+IFsgICAxMS41ODQyMjNdIENQVTogNyBQSUQ6
IDE1NzEgQ29tbTogZ25vbWUtc2hlbGwgVGFpbnRlZDogRyAgICAgICAgICAgIEUgICAgIDUuNy4w
LXJjMS0xLWRlZmF1bHQrICMyNwo+ID4gPiA+Pj4gWyAgIDExLjU4NDIyNV0gSGFyZHdhcmUgbmFt
ZTogTWljcm8tU3RhciBJbnRlcm5hdGlvbmFsIENvLiwgTHRkLiBNUy03QTMxL1gzNzAgWFBPV0VS
IEdBTUlORyBUSVRBTklVTSAoTVMtN0EzMSksIEJJT1MgMS5NUiAxMi8wMy8yMDE5Cj4gPiA+ID4+
PiBbICAgMTEuNTg0MjM3XSBSSVA6IDAwMTA6ZHJtX2dlbV9mYl9kZXN0cm95KzB4MjgvMHg3MCBb
ZHJtX2ttc19oZWxwZXJdCj4gPiA+ID4+PiA8c25pcD4KPiA+ID4gPj4+IFsgICAxMS41ODQyNTZd
IENhbGwgVHJhY2U6Cj4gPiA+ID4+PiBbICAgMTEuNTg0Mjc5XSAgZHJtX21vZGVfcm1mYisweDE4
OS8weDFjMCBbZHJtXQo+ID4gPiA+Pj4gWyAgIDExLjU4NDI5OV0gID8gZHJtX21vZGVfcm1mYisw
eDFjMC8weDFjMCBbZHJtXQo+ID4gPiA+Pj4gWyAgIDExLjU4NDMxNF0gIGRybV9pb2N0bF9rZXJu
ZWwrMHhhYS8weGYwIFtkcm1dCj4gPiA+ID4+PiBbICAgMTEuNTg0MzI5XSAgZHJtX2lvY3RsKzB4
MWZmLzB4M2IwIFtkcm1dCj4gPiA+ID4+PiBbICAgMTEuNTg0MzQ3XSAgPyBkcm1fbW9kZV9ybWZi
KzB4MWMwLzB4MWMwIFtkcm1dCj4gPiA+ID4+PiBbICAgMTEuNTg0NDIxXSAgYW1kZ3B1X2RybV9p
b2N0bCsweDQ5LzB4ODAgW2FtZGdwdV0KPiA+ID4gPj4+IFsgICAxMS41ODQ0MjddICBrc3lzX2lv
Y3RsKzB4ODcvMHhjMAo+ID4gPiA+Pj4gWyAgIDExLjU4NDQzMF0gIF9feDY0X3N5c19pb2N0bCsw
eDE2LzB4MjAKPiA+ID4gPj4+IFsgICAxMS41ODQ0MzRdICBkb19zeXNjYWxsXzY0KzB4NWYvMHgy
NDAKPiA+ID4gPj4+IFsgICAxMS41ODQ0MzhdICBlbnRyeV9TWVNDQUxMXzY0X2FmdGVyX2h3ZnJh
bWUrMHg0NC8weGE5Cj4gPiA+ID4+PiBbICAgMTEuNTg0NDQwXSBSSVA6IDAwMzM6MHg3ZjBlZjgw
ZjcyMjcKPiA+ID4gPj4+Cj4gPiA+ID4+PiBTaWduZWQtb2ZmLWJ5OiBOaXJtb3kgRGFzIDxuaXJt
b3kuZGFzQGFtZC5jb20+Cj4gPiA+ID4+IEZpeGVzOiAuLi4uIG1pc3NpbmcgaGVyZS4gQXBhcnQg
ZnJvbSB0aGF0IFJldmlld2VkLWJ5OiBDaHJpc3RpYW4gS8O2bmlnCj4gPiA+ID4+IDxjaHJpc3Rp
YW4ua29lbmlnQGFtZC5jb20+Lgo+ID4gPiA+Pgo+ID4gPiA+PiBQbGVhc2UgcmVzZW5kIHdpdGgg
dGhlIHRhZyBhZGRlZCwgdGhlbiBJJ20gZ29pbmcgdG8gcHVzaCB0aGlzIHRvCj4gPiA+ID4+IGRy
bS1taXNjLW5leHQgYXNhcC4KPiA+ID4gPj4KPiA+ID4gPj4gQ2hyaXN0aWFuLgo+ID4gPiA+Pgo+
ID4gPiA+Pj4gLS0tCj4gPiA+ID4+PiAgICBpbmNsdWRlL2RybS9kcm1fZ2VtLmggfCAzICsrKwo+
ID4gPiA+Pj4gICAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQo+ID4gPiA+Pj4KPiA+
ID4gPj4+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS9kcm1fZ2VtLmggYi9pbmNsdWRlL2RybS9k
cm1fZ2VtLmgKPiA+ID4gPj4+IGluZGV4IDUyMTczYWJkZjUwMC4uYTEzNTEwMzQ2YTliIDEwMDY0
NAo+ID4gPiA+Pj4gLS0tIGEvaW5jbHVkZS9kcm0vZHJtX2dlbS5oCj4gPiA+ID4+PiArKysgYi9p
bmNsdWRlL2RybS9kcm1fZ2VtLmgKPiA+ID4gPj4+IEBAIC0zNzIsNiArMzcyLDkgQEAgc3RhdGlj
IGlubGluZSB2b2lkIGRybV9nZW1fb2JqZWN0X2dldChzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKm9i
aikKPiA+ID4gPj4+ICAgIHN0YXRpYyBpbmxpbmUgdm9pZAo+ID4gPiA+Pj4gICAgZHJtX2dlbV9v
YmplY3RfcHV0KHN0cnVjdCBkcm1fZ2VtX29iamVjdCAqb2JqKQo+ID4gPiA+Pj4gICAgewo+ID4g
PiA+Pj4gKyAgICAgaWYgKCFvYmopCj4gPiA+ID4+PiArICAgICAgICAgICAgIHJldHVybjsKPiA+
ID4gPj4+ICsKPiA+ID4gPiBUaGlzIGFkZHMgc2V2ZXJhbCB0aG91c2FuZCBOVUxMIGNoZWNrcyB3
aGVyZSB0aGVyZSB3ZXJlIHByZXZpb3VzbHkgbm9uZS4KPiA+ID4gPiBJIGRvdWJ0IHRoZSBjb21w
aWxlciBlbGltaW5hdGVzIHRoZW0gYWxsLgo+ID4gPiA+Cj4gPiA+ID4gSSdkIHN1Z2dlc3QgcmV2
ZXJ0aW5nCj4gPiA+ID4gYjVkMjUwNzQ0Y2NjICgiZHJtL2dlbTogZm9sZCBkcm1fZ2VtX29iamVj
dF9wdXRfdW5sb2NrZWQgYW5kIF9fZHJtX2dlbV9vYmplY3RfcHV0KCkiKQo+ID4gPgo+ID4gPiBJ
IGRpZG4ndCBsb29rZWQgaW50byB0aGlzIHBhdGNoIGluIGRldGFpbCwgYnV0IGFsbG93aW5nIHRv
IGNhbGwgKl9wdXQoKQo+ID4gPiBmdW5jdGlvbnMgd2l0aCBOVUxMIGFuZCBub3RoaW5nIGJhZCBo
YXBwZW5zIGlzIHJhdGhlciBjb21tb24gcHJhY3RpY2UuCj4gPiA+Cj4gPiA+IE9uIHRoZSBvdGhl
ciBoYW5kIEkgYWdyZWUgdGhhdCB0aGlzIG1pZ2h0IGNhdXNlIGEgcGVyZm9ybWFuY2UgcHJvYmxl
bS4KPiA+ID4gSG93IG1hbnkgc2l0ZXMgZG8gd2UgaGF2ZSB3aGljaCBjb3VsZCBjYWxsIGRybV9n
ZW1fb2JqZWN0X3B1dCgpIHdpdGggTlVMTD8KPiA+Cj4gPiBKdXN0IHRvIHB1dCB0aGlzIGluIGEg
dGlueSBiaXQgb2YgcGVyc3BlY3RpdmUsIGZvciBpOTE1LmtvCj4gPgo+ID4gYWRkL3JlbW92ZTog
MC8wIGdyb3cvc2hyaW5rOiAxNDEvMjAgdXAvZG93bjogMjIxMS8tNTI1ICgxNjg2KQo+ID4KPiA+
IFdlJ3ZlIGhhZCBmbGFtZSB3YXJzIGZvciBsZXNzLiAoQmVjYXVzZSBpdCdzIGVhc3kgdG8gYXJn
dWUgb3ZlciBsaXR0bGUKPiA+IGNoYW5nZXMuKSBOb3cgdGhpcyBpcyBqdXN0IGZyb20gdGhpcyBw
YXRjaCBhbmQgbm90IHRoZSByZXZlcnQuLi4KPiA+IFRoZSByZXZlcnQgaGFzIG5vIGVmZmVjdCBv
biBjb2RlIHNpemUuCj4KPiBJZiB3ZSBwbGF5IHRoZSByZXZlcnQgZ2FtZSB0aGluZyB3aWxsIG5l
dmVyIGVuZCB3aXRoIGhhdmluZyBpdCBmaXhlZCA6LSgKPiBJJ2Qgc3VnZ2VzdCBzdGlja2luZyB3
aXRoIHRoZSBOVUxMIGNoZWNrLCBtYXliZSBldmVuIGEgV0FSTiB0byBhaWQKPiBkZWJ1ZyB0aGUg
MjQwIHVzZWNhc2VzLgo+Cj4gRm9yIHRoZSBwYXRjaDoKPiBGaXhlczogYjVkMjUwNzQ0Y2NjICgi
ZHJtL2dlbTogZm9sZCBkcm1fZ2VtX29iamVjdF9wdXRfdW5sb2NrZWQgYW5kCj4gX19kcm1fZ2Vt
X29iamVjdF9wdXQoKSIpCj4gUmV2aWV3ZWQtYnk6IEVtaWwgVmVsaWtvdiA8ZW1pbC52ZWxpa292
QGNvbGxhYm9yYS5jb20+Cj4KQWx0ZXJuYXRpdmVseSwgaWYgeW91IGdpdmUgbWUgMzAgbWludXRl
cyBJIHNob3VsZCBiZSBhYmxlIHRvIGZpbmlzaAphdWRpdGluZyB0aGUgdXNlcnMgOy0pCgotRW1p
bApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
