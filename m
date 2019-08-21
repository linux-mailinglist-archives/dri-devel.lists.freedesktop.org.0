Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86D3798D58
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2019 10:16:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0A7B6EAC7;
	Thu, 22 Aug 2019 08:15:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ste-pvt-msa1.bahnhof.se (ste-pvt-msa1.bahnhof.se
 [213.80.101.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52478896AF;
 Wed, 21 Aug 2019 14:30:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTP id 853013F670;
 Wed, 21 Aug 2019 16:30:40 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level: 
X-Spam-Status: No, score=-2.099 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, URIBL_BLOCKED=0.001]
 autolearn=ham autolearn_force=no
Received: from ste-pvt-msa1.bahnhof.se ([127.0.0.1])
 by localhost (ste-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JKoDIXUQMhSZ; Wed, 21 Aug 2019 16:30:39 +0200 (CEST)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id B5A223F367;
 Wed, 21 Aug 2019 16:30:36 +0200 (CEST)
Received: from localhost.localdomain (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id B4AA33602D6;
 Wed, 21 Aug 2019 16:30:36 +0200 (CEST)
Subject: Re: [PATCH 3/3] drm/ttm: remove ttm_bo_wait_unreserved
To: Daniel Vetter <daniel.vetter@ffwll.ch>
References: <20190820145336.15649-1-daniel.vetter@ffwll.ch>
 <20190820145336.15649-4-daniel.vetter@ffwll.ch>
 <dbe0e8a6-573f-6628-0b9e-1c978611efce@shipmail.org>
 <CAKMK7uH93XWbz7X6VJsvRB+pbgFEjH=iYAAgQc42gcAON8YXVw@mail.gmail.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28VMware=29?= <thomas_os@shipmail.org>
Organization: VMware Inc.
Message-ID: <d1574611-e51d-e08c-5305-175e0375813e@shipmail.org>
Date: Wed, 21 Aug 2019 16:30:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAKMK7uH93XWbz7X6VJsvRB+pbgFEjH=iYAAgQc42gcAON8YXVw@mail.gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Thu, 22 Aug 2019 08:14:56 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=shipmail.org; s=mail; 
 t=1566397836; bh=bRHbjwHb5lMIRtDDS8NbAkX3tV3HtERFA+PBYp7G6qg=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=FGEgqlI5DXLBnnP9nGJY+9xdmBubeO3jQo+qKGhTw9/rs8ohIvNO5P/iMryQEieOp
 YrQBkoQKDIidbQ/jpOiLOppt5Lfx7ppP6+lyGntc0WmkQ2mEa5qa4I37iLOXyV/Uys
 0YmSZZUNezbqImsb4Eqp+gPenLPWaKdDne9BfBn4=
X-Mailman-Original-Authentication-Results: ste-pvt-msa1.bahnhof.se;
 dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=FGEgqlI5; 
 dkim-atps=neutral
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
Cc: Thomas Hellstrom <thellstrom@vmware.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Huang Rui <ray.huang@amd.com>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Daniel Vetter <daniel.vetter@intel.com>,
 Christian Koenig <christian.koenig@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gOC8yMS8xOSA0OjEwIFBNLCBEYW5pZWwgVmV0dGVyIHdyb3RlOgo+IE9uIFdlZCwgQXVnIDIx
LCAyMDE5IGF0IDM6MTYgUE0gVGhvbWFzIEhlbGxzdHLDtm0gKFZNd2FyZSkKPiA8dGhvbWFzX29z
QHNoaXBtYWlsLm9yZz4gd3JvdGU6Cj4+IE9uIDgvMjAvMTkgNDo1MyBQTSwgRGFuaWVsIFZldHRl
ciB3cm90ZToKPj4+IFdpdGggbm91dmVhdSBmaXhlZCBhbGwgdHRtLXVzaW5nIGRyaXZlcyBoYXZl
IHRoZSBjb3JyZWN0IG5lc3Rpbmcgb2YKPj4+IG1tYXBfc2VtIHZzIGRtYV9yZXN2LCBhbmQgd2Ug
Y2FuIGp1c3QgbG9jayB0aGUgYnVmZmVyLgo+Pj4KPj4+IEFzc3VtaW5nIEkgZGlkbid0IHNjcmV3
IHVwIGFueXRoaW5nIHdpdGggbXkgYXVkaXQgb2YgY291cnNlLgo+Pj4KPj4+IFNpZ25lZC1vZmYt
Ynk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAaW50ZWwuY29tPgo+Pj4gQ2M6IENocmlz
dGlhbiBLb2VuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KPj4+IENjOiBIdWFuZyBSdWkg
PHJheS5odWFuZ0BhbWQuY29tPgo+Pj4gQ2M6IEdlcmQgSG9mZm1hbm4gPGtyYXhlbEByZWRoYXQu
Y29tPgo+Pj4gQ2M6ICJWTXdhcmUgR3JhcGhpY3MiIDxsaW51eC1ncmFwaGljcy1tYWludGFpbmVy
QHZtd2FyZS5jb20+Cj4+PiBDYzogVGhvbWFzIEhlbGxzdHJvbSA8dGhlbGxzdHJvbUB2bXdhcmUu
Y29tPgo+Pj4gLS0tCj4+PiAgICBkcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jICAgIHwgMzQg
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4+PiAgICBkcml2ZXJzL2dwdS9kcm0v
dHRtL3R0bV9ib192bS5jIHwgMjYgKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+Pj4gICAgaW5j
bHVkZS9kcm0vdHRtL3R0bV9ib19hcGkuaCAgICB8ICAxIC0KPj4+ICAgIDMgZmlsZXMgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDYwIGRlbGV0aW9ucygtKQo+Pj4KPj4+Cj4+PiArICAgICBkbWFf
cmVzdl9sb2NrKGJvLT5iYXNlLnJlc3YsIE5VTEwpOwo+PiBpbnRlcnJ1cHRpYmxlLCBvciBhdCBs
ZWFzdCBraWxsYWJsZS4gKElJUkMgdGhpbmsga2lsbGFibGUgaXMgdGhlIHJpZ2h0Cj4+IGNob2lj
ZSBpbiBmYXVsdCBjb2RlLCBldmVuIGlmIFRUTSBpbml0aWFsbHkgaW1wbGVtZW50ZWQgaW50ZXJy
dXB0aWJsZSB0bwo+PiBnZXQgcmVhc29uYWJsZSBYb3JnICJzaWxrZW4gbW91c2UiIGxhdGVuY3kp
Lgo+IEkgdGhpbmsgaW50ZXJydXB0aWJsZSBpcyBmaW5lLiBJIGNoaWNrZW5kIG91dCBvZiB0aGF0
IGZvciB2MSBiZWNhdXNlIEkKPiBhbHdheXMgbWl4IHVwIHRoZSByZXR1cm4gY29kZSBmb3IgX2xv
Y2tfaW50ZXJydXB0aWJsKCkgOi0pCgo6KS4gSUlSQyBJIHRoaW5rIHRoZSBpbi1rZXJuZWwgdXNl
cnMgb2YgZmF1bHQoKSB3ZXJlIHVuaGFwcHkgd2l0aCAKaW50ZXJydXB0aWJsZS7CoCAoR1VQPyks
IGJ1dCBJIGd1ZXNzIGl0J3MgYmV0dGVyIHRvIHVzZSBhIGJ1bGsgY2hhbmdlIGF0IApzb21lIHBv
aW50IGlmIG5lY2Vzc2FyeS4KCi9UaG9tYXMKCj4gSSdsbCBhZGQgdGhhdCBmb3IgdGhlIG5leHQg
dmVyc2lvbiB0b28uCj4gLURhbmllbAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
