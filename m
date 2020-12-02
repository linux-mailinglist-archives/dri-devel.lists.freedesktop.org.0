Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0B8D2CBEEA
	for <lists+dri-devel@lfdr.de>; Wed,  2 Dec 2020 15:02:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B95666EA2E;
	Wed,  2 Dec 2020 14:02:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C3506EA62;
 Wed,  2 Dec 2020 14:02:37 +0000 (UTC)
Received: by mail-ot1-x341.google.com with SMTP id z23so1657938oti.13;
 Wed, 02 Dec 2020 06:02:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Du9mUxhlChBd+j85dYiOC01Q9CKt5cxvpq990GnuOJ0=;
 b=osvkDGjaqUALayNI+u49rXRdNI4M+tosotcu7S+3zHVv5g0UbphvBon68VXC93UiiZ
 KGsVx7aPAForq5oi6fHvD20KG9OFuDYTsSpwQjTXC1ffMYIWSLskZ+mmsQc7uI5x+RYI
 KzKcyzvXkFz2jjHFDtIgoKe4uLpI89RhCAHiw4NlvB7ihVn8wk57/2Ord/6Y/BpK2FIB
 xqutuy2Y4V87qowDaqo+nLFcHJLaLA1GgjOk0gf0n9VDYYIifBNUHlNAzW07wI2C9AH/
 rCN7RAG+ARFP+qkULGub7XGoTOE0D5bNBi0wup+wBNcIV71/u2HOUoElFxj5IUQVW6bt
 hLiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Du9mUxhlChBd+j85dYiOC01Q9CKt5cxvpq990GnuOJ0=;
 b=k92RSDi6PTlNcoNMzJz9rkpk6uO0zyy9t6w6btX5ey0DGeW6RGXfz1zWVtGmAiEY0t
 FRZHool4Z/YnbrrZ9E6VrdIyF7jWX55VT5HgxXpcQS9KXD2erLWFxL295qQMxt8+ob1A
 RbQIiWlwKIqGaMD2Yd92q9wugdlId2XbyfxiPiTgFbSgUQ0TM0VYDMbJKQKJvqUrk893
 6BgFlZlgWBY+D4DpcPDcXgOAzVYgDu6BzQTNpPq0ekKfmiAVWPolvogH2nLY7EpG0lsb
 nTBvMjeL6CTbOYJBKhvY3aXf2hiBgk+Lf8cfHDsJjCREC38smGCsYfpe9ESgyd2s13D7
 td8A==
X-Gm-Message-State: AOAM530hD6yUjwK1v6SvRKobnfw86tAZaGMiKSp0h7BN6Ioy/fKV+ehm
 Dwb8SsAOLMvtF+0Znl6PLgjI+ON15KaWqIG/P6Y=
X-Google-Smtp-Source: ABdhPJzEPQzMuezMrMuw6jbG62qFedqX54kkLTNCA7wvQoUe7e4z+jShqkktl7/V99qgrMa8BCa59jS1N/EH2AemVes=
X-Received: by 2002:a9d:5388:: with SMTP id w8mr1856624otg.311.1606917756331; 
 Wed, 02 Dec 2020 06:02:36 -0800 (PST)
MIME-Version: 1.0
References: <20201201103542.2182-1-tzimmermann@suse.de>
 <20201201103542.2182-2-tzimmermann@suse.de>
 <d79aa7c0-9b0b-4f1b-c4e5-54f53a8d2931@amd.com>
 <63150504-fda0-48fd-9ecd-fb19ea0ae9d7@suse.de>
 <997ad04d-2acb-1dfb-0733-78f79a45b453@amd.com>
 <99ce8db3-a53f-7432-6e05-428c414174a2@suse.de>
In-Reply-To: <99ce8db3-a53f-7432-6e05-428c414174a2@suse.de>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 2 Dec 2020 09:02:25 -0500
Message-ID: <CADnq5_O6X_kbdT8ZTzL1P35wgauVNc77voWf97LogDJXia5VTg@mail.gmail.com>
Subject: Re: [PATCH v2 01/20] drm/amdgpu: Fix trailing whitespaces
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: intel-gvt-dev@lists.freedesktop.org, Dave Airlie <airlied@linux.ie>,
 nouveau <nouveau@lists.freedesktop.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 "open list:VIRTIO CORE, NET..." <virtualization@lists.linux-foundation.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, spice-devel@lists.freedesktop.org,
 Sam Ravnborg <sam@ravnborg.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBEZWMgMiwgMjAyMCBhdCAzOjUzIEFNIFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVy
bWFubkBzdXNlLmRlPiB3cm90ZToKPgo+IEhpCj4KPiBBbSAwMi4xMi4yMCB1bSAwOTo0MyBzY2hy
aWViIENocmlzdGlhbiBLw7ZuaWc6Cj4gPiBBbSAwMi4xMi4yMCB1bSAwODo1OSBzY2hyaWViIFRo
b21hcyBaaW1tZXJtYW5uOgo+ID4+IEhpCj4gPj4KPiA+PiBBbSAwMS4xMi4yMCB1bSAxMTo0MCBz
Y2hyaWViIENocmlzdGlhbiBLw7ZuaWc6Cj4gPj4+IFJldmlld2VkLWJ5OiBDaHJpc3RpYW4gS8O2
bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+IG9uIHBhdGNoICMxCj4gPj4+IGFuZCAjMTUu
Cj4gPj4+Cj4gPj4+IEFja2VkLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmln
QGFtZC5jb20+IG9uIHBhdGNoICMyIGFuZAo+ID4+PiAjMTYuCj4gPj4KPiA+PiBDb3VsZCB5b3Ug
YWRkIHRoZXNlIHBhdGNoZXMgdG8gdGhlIEFNRCB0cmVlPwo+ID4KPiA+IEFsZXggaXMgdXN1YWxs
eSB0aGUgb25lIHdobyBwaWNrcyBzdWNoIHN0dWZmIHVwLgo+ID4KPiA+IEJ1dCB3aGVuIHBlb3Bs
ZSBzZW5kIG91dCBwYXRjaCBzZXRzIHdoaWNoIG1peCBjaGFuZ2VzIGZyb20gZGlmZmVyZW50Cj4g
PiBkcml2ZXJzIGl0IGlzIG1vcmUgY29tbW9uIHRvIHB1c2ggdGhlbSB0aHJvdWdoIGRybS1taXNj
LW5leHQuCj4KPiBJJ20gT0sgd2l0aCBkcm0tbWlzYy1uZXh0LiBJIGp1c3QgZG9uJ3Qgd2FudCB0
byBhZGQgdG9vIG1hbnkgbWVyZ2UKPiBjb25mbGljdHMgaW4geW91ciBzaWRlLgoKWWVhaCwgaXQg
ZG9lc24ndCBtYXR0ZXIgdG8gbWUuICBJIGFzc3VtZWQgeW91IHdhbnRlZCB0byBsYW5kIHRoaXMK
d2hvbGUgc2VyaWVzIHNvIHlvdSBjb3VsZCBtb3ZlIGZvcndhcmQgd2l0aCBmdXJ0aGVyIGNsZWFu
dXBzLiAgSWYgd2UKbWVyZ2UgdmlhIGRpZmZlcmVudCB0cmVlcywgeW91J2xsIGhhdmUgdG8gd2Fp
dCBmb3IgYWxsIG9mIHRoaXMgdG8gY29tZQp0b2dldGhlciBhZ2FpbiBpbiBkcm0tbmV4dC4KCkFs
ZXgKCgo+Cj4gQmVzdCByZWdhcmRzCj4gVGhvbWFzCj4KPiA+Cj4gPiBSZWdhcmRzLAo+ID4gQ2hy
aXN0aWFuLgo+ID4KPiA+Pgo+ID4+IEJlc3QgcmVnYXJkcwo+ID4+IFRob21hcwo+ID4+Cj4gPj4+
Cj4gPj4+IFJlZ2FyZHMsCj4gPj4+IENocmlzdGlhbi4KPiA+Pj4KPiA+Pj4gQW0gMDEuMTIuMjAg
dW0gMTE6MzUgc2NocmllYiBUaG9tYXMgWmltbWVybWFubjoKPiA+Pj4+IEFkaGVyZSB0byBrZXJu
ZWwgY29kaW5nIHN0eWxlLgo+ID4+Pj4KPiA+Pj4+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBaaW1t
ZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPgo+ID4+Pj4gQWNrZWQtYnk6IEFsZXggRGV1Y2hl
ciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KPiA+Pj4+IEFja2VkLWJ5OiBTYW0gUmF2bmJv
cmcgPHNhbUByYXZuYm9yZy5vcmc+Cj4gPj4+PiBDYzogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIu
ZGV1Y2hlckBhbWQuY29tPgo+ID4+Pj4gQ2M6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5r
b2VuaWdAYW1kLmNvbT4KPiA+Pj4+IC0tLQo+ID4+Pj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfZGV2aWNlLmMgfCA2ICsrKy0tLQo+ID4+Pj4gICAxIGZpbGUgY2hhbmdlZCwg
MyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+ID4+Pj4KPiA+Pj4+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMKPiA+Pj4+IGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jCj4gPj4+PiBpbmRleCA1ZjMw
NDQyNWM5NDguLmRhMjNjMGYyMTMxMSAxMDA2NDQKPiA+Pj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYwo+ID4+Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jCj4gPj4+PiBAQCAtNDkyMiw4ICs0OTIyLDggQEAg
cGNpX2Vyc19yZXN1bHRfdAo+ID4+Pj4gYW1kZ3B1X3BjaV9lcnJvcl9kZXRlY3RlZChzdHJ1Y3Qg
cGNpX2RldiAqcGRldiwgcGNpX2NoYW5uZWxfc3RhCj4gPj4+PiAgICAgICBjYXNlIHBjaV9jaGFu
bmVsX2lvX25vcm1hbDoKPiA+Pj4+ICAgICAgICAgICByZXR1cm4gUENJX0VSU19SRVNVTFRfQ0FO
X1JFQ09WRVI7Cj4gPj4+PiAgICAgICAvKiBGYXRhbCBlcnJvciwgcHJlcGFyZSBmb3Igc2xvdCBy
ZXNldCAqLwo+ID4+Pj4gLSAgICBjYXNlIHBjaV9jaGFubmVsX2lvX2Zyb3plbjoKPiA+Pj4+IC0g
ICAgICAgIC8qCj4gPj4+PiArICAgIGNhc2UgcGNpX2NoYW5uZWxfaW9fZnJvemVuOgo+ID4+Pj4g
KyAgICAgICAgLyoKPiA+Pj4+ICAgICAgICAgICAgKiBDYW5jZWwgYW5kIHdhaXQgZm9yIGFsbCBU
RFJzIGluIHByb2dyZXNzIGlmIGZhaWxpbmcgdG8KPiA+Pj4+ICAgICAgICAgICAgKiBzZXQgIGFk
ZXYtPmluX2dwdV9yZXNldCBpbiBhbWRncHVfZGV2aWNlX2xvY2tfYWRldgo+ID4+Pj4gICAgICAg
ICAgICAqCj4gPj4+PiBAQCAtNTAxNCw3ICs1MDE0LDcgQEAgcGNpX2Vyc19yZXN1bHRfdCBhbWRn
cHVfcGNpX3Nsb3RfcmVzZXQoc3RydWN0Cj4gPj4+PiBwY2lfZGV2ICpwZGV2KQo+ID4+Pj4gICAg
ICAgICAgIGdvdG8gb3V0Owo+ID4+Pj4gICAgICAgfQo+ID4+Pj4gLSAgICBhZGV2LT5pbl9wY2lf
ZXJyX3JlY292ZXJ5ID0gdHJ1ZTsKPiA+Pj4+ICsgICAgYWRldi0+aW5fcGNpX2Vycl9yZWNvdmVy
eSA9IHRydWU7Cj4gPj4+PiAgICAgICByID0gYW1kZ3B1X2RldmljZV9wcmVfYXNpY19yZXNldChh
ZGV2LCBOVUxMLCAmbmVlZF9mdWxsX3Jlc2V0KTsKPiA+Pj4+ICAgICAgIGFkZXYtPmluX3BjaV9l
cnJfcmVjb3ZlcnkgPSBmYWxzZTsKPiA+Pj4+ICAgICAgIGlmIChyKQo+ID4+Pgo+ID4+Cj4gPgo+
Cj4gLS0KPiBUaG9tYXMgWmltbWVybWFubgo+IEdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXIKPiBT
VVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgKPiBNYXhmZWxkc3RyLiA1LCA5MDQw
OSBOw7xybmJlcmcsIEdlcm1hbnkKPiAoSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpCj4gR2VzY2jD
pGZ0c2bDvGhyZXI6IEZlbGl4IEltZW5kw7ZyZmZlcgo+Cj4gX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KPiBhbWQtZ2Z4IG1haWxpbmcgbGlzdAo+IGFtZC1n
ZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbAo=
