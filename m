Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 157CE21004F
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jul 2020 01:02:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2CCF6E02C;
	Tue, 30 Jun 2020 23:02:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A8C06E2BD
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jun 2020 23:02:40 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9871920826
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jun 2020 23:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593558159;
 bh=QkyR9JiwolvElGEGF/cV1+0xBBGtnLf0/3SbL34qgpI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=bsZzqAs/CQsUje3SYIxEeJr3nJwN9lvEK2Iun7NjgBPNamVd8XFpfPejuEpSIMq3t
 vfgKg02hOmdYFmlosepYDy8AGJY4hWVus/w4WzEMGu+Sc2qy2GtyGpQwlr76Hck1tN
 NnBOtgNtnFVYnjmr0VSn4OsE6HJRVzE+hhaCrlok=
Received: by mail-ed1-f46.google.com with SMTP id dm19so11577477edb.13
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jun 2020 16:02:39 -0700 (PDT)
X-Gm-Message-State: AOAM533S/K2n5Xuut+O3ASVvY+LrxdyksaFW4xRdyIDINPVQlXGCitW0
 cIVyPkYhQEIbAULE/v/eNl4+eLsLgxrsngCkbQ==
X-Google-Smtp-Source: ABdhPJyd7wUB7S5V0t31ySZM0YeWDlaeEMvY3ludSAy+MeqYX3ItuaiYsdmmkpUrY0ZQ3WoSwWDazpYXnVgFsZwNSzI=
X-Received: by 2002:a05:6402:203c:: with SMTP id
 ay28mr15041128edb.271.1593558158062; 
 Tue, 30 Jun 2020 16:02:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200615203108.786083-1-enric.balletbo@collabora.com>
 <20200620213302.GC74146@ravnborg.org>
 <593a4666-d6aa-7d16-f3a0-ba3713047d84@collabora.com>
 <CAAOTY_9ZHemp0U76_oPjwy-XoTRXW108UMD_9JVnNXndNNsiTw@mail.gmail.com>
 <43e5b273-d156-beea-bcfb-cc61b190a671@collabora.com>
In-Reply-To: <43e5b273-d156-beea-bcfb-cc61b190a671@collabora.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 1 Jul 2020 07:02:27 +0800
X-Gmail-Original-Message-ID: <CAAOTY__633cG2ki088ozN3f_seLBv9MkRSSsGudCWgP2GBKGmg@mail.gmail.com>
Message-ID: <CAAOTY__633cG2ki088ozN3f_seLBv9MkRSSsGudCWgP2GBKGmg@mail.gmail.com>
Subject: Re: [RESEND PATCH v4 0/7] Convert mtk-dsi to drm_bridge API and get
 EDID for ps8640 bridge
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Nicolas Boichat <drinkcat@chromium.org>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Collabora Kernel ML <kernel@collabora.com>, Sam Ravnborg <sam@ravnborg.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIEVucmljOgoKRW5yaWMgQmFsbGV0Ym8gaSBTZXJyYSA8ZW5yaWMuYmFsbGV0Ym9AY29sbGFi
b3JhLmNvbT4g5pa8IDIwMjDlubQ35pyIMeaXpSDpgLHkuIkg5LiK5Y2INTowMuWvq+mBk++8mgo+
Cj4gSGkgQ2h1bi1LdWFuZywKPgo+IE9uIDMwLzYvMjAgMTg6MjYsIENodW4tS3VhbmcgSHUgd3Jv
dGU6Cj4gPiBIaSwgRW5yaWM6Cj4gPgo+ID4gRW5yaWMgQmFsbGV0Ym8gaSBTZXJyYSA8ZW5yaWMu
YmFsbGV0Ym9AY29sbGFib3JhLmNvbT4g5pa8IDIwMjDlubQ25pyIMzDml6Ug6YCx5LqMIOS4i+WN
iDEwOjM05a+r6YGT77yaCj4gPj4KPiA+PiBIaSBTYW0sIENodW4tS3VhbiwKPiA+Pgo+ID4+IE9u
IDIwLzYvMjAgMjM6MzMsIFNhbSBSYXZuYm9yZyB3cm90ZToKPiA+Pj4gSGkgRW5yaWMKPiA+Pj4K
PiA+Pj4gT24gTW9uLCBKdW4gMTUsIDIwMjAgYXQgMTA6MzE6MDFQTSArMDIwMCwgRW5yaWMgQmFs
bGV0Ym8gaSBTZXJyYSB3cm90ZToKPiA+Pj4+IChUaGlzIHJlc2VuZCBpcyB0byBmaXggc29tZSB0
cml2aWFsIGNvbmZsaWN0cyBkdWUgdGhlIG1lcmdlIHdpbmRvdykKPiA+Pj4+Cj4gPj4+PiBUaGUg
UFM4NjQwIGRzaS10by1lRFAgYnJpZGdlIGRyaXZlciBpcyB1c2luZyB0aGUgcGFuZWwgYnJpZGdl
IEFQSSwKPiA+Pj4+IGhvd2V2ZXIsIG5vdCBhbGwgdGhlIGNvbXBvbmVudHMgaW4gdGhlIGNoYWlu
IGhhdmUgYmVlbiBwb3J0ZWQgdG8gdGhlCj4gPj4+PiBkcm1fYnJpZGdlIEFQSS4gQWN0dWFsbHks
IHdoZW4gYSBwYW5lbCBpcyBhdHRhY2hlZCB0aGUgZGVmYXVsdCBwYW5lbCdzIG1vZGUKPiA+Pj4+
IGlzIHVzZWQsIGJ1dCBpbiBzb21lIGNhc2VzIHdlIGNhbid0IGdldCBkaXNwbGF5IHVwIGlmIG1v
ZGUgZ2V0dGluZyBmcm9tCj4gPj4+PiBlRFAgY29udHJvbCBFRElEIGlzIG5vdCBjaG9zZW4uCj4g
Pj4+Pgo+ID4+Pj4gVGhpcyBzZXJpZXMgYWRkcmVzcyB0aGF0IHByb2JsZW0sIGZpcnN0IGltcGxl
bWVudHMgdGhlIC5nZXRfZWRpZCgpCj4gPj4+PiBjYWxsYmFjayBpbiB0aGUgUFM4NjQwIGRyaXZl
ciAod2hpY2ggaXMgbm90IHVzZWQgdW50aWwgdGhlIGNvbnZlcnNpb24gaXMKPiA+Pj4+IGRvbmUp
IGFuZCB0aGVuLCBjb252ZXJ0cyB0aGUgTWVkaWF0ZWsgRFNJIGRyaXZlciB0byB1c2UgdGhlIGRy
bV9icmlkZ2UKPiA+Pj4+IEFQSS4KPiA+Pj4+Cj4gPj4+PiBBcyBmYXIgYXMgSSBrbm93LCB3ZSdy
ZSB0aGUgb25seSB1c2VycyBvZiB0aGUgbWVkaWF0ZWsgZHNpIGRyaXZlciBpbgo+ID4+Pj4gbWFp
bmxpbmUsIHNvIHNob3VsZCBiZSBzYWZlIHRvIHN3aXRjaCB0byB0aGUgbmV3IGNoYWluIG9mIGRy
bV9icmlkZ2UgQVBJCj4gPj4+PiB1bmNvbmRpdGlvbmFsbHkuCj4gPj4+Pgo+ID4+Pj4gVGhlIHBh
dGNoZXMgaGFzIGJlZW4gdGVzdGVkIG9uIGEgQWNlciBDaHJvbWVib29rIFIxMyAoRWxtKSBydW5u
aW5nIGEKPiA+Pj4+IENocm9tZSBPUyB1c2Vyc3BhY2UgYW5kIGNoZWNraW5nIHRoYXQgdGhlIHZh
bGlkIEVESUQgbW9kZSByZXBvcnRlZCBieQo+ID4+Pj4gdGhlIGJyaWRnZSBpcyBzZWxlY3RlZC4K
PiA+Pj4+Cj4gPj4+PiBDaGFuZ2VzIGluIHY0Ogo+ID4+Pj4gLSBSZW1vdmUgZG91YmxlIGNhbGwg
dG8gZHJtX2VuY29kZXJfaW5pdCgpLiAoQ2h1bi1LdWFuZyBIdSkKPiA+Pj4+IC0gQ2xlYW51cCB0
aGUgZW5jb2RlciBpbiBtdGtfZHNpX3VuYmluZCgpLiAoQ2h1bi1LdWFuZyBIdSkKPiA+Pj4+Cj4g
Pj4+PiBDaGFuZ2VzIGluIHYzOgo+ID4+Pj4gLSBSZXBsYWNlIHMvYnJpZGdlL25leHQgYnJpZGdl
LyBmb3IgY29tbWVudC4gKExhdXJlbnQgUGluY2hhcnQpCj4gPj4+PiAtIEFkZCB0aGUgYnJpZGdl
LnR5cGUuIChMYXVyZW50IFBpbmNoYXJ0KQo+ID4+Pj4gLSBVc2UgbmV4dF9icmlkZ2UgZmllbGQg
dG8gc3RvcmUgdGhlIHBhbmVsIGJyaWRnZS4gKExhdXJlbnQgUGluY2hhcnQpCj4gPj4+PiAtIEFk
ZCB0aGUgYnJpZGdlLnR5cGUgZmllbGQuIChMYXVyZW50IFBpbmNoYXJ0KQo+ID4+Pj4gLSBUaGlz
IHBhdGNoIHJlcXVpcmVzIGh0dHBzOi8vbGttbC5vcmcvbGttbC8yMDIwLzQvMTYvMjA4MCB0byB3
b3JrCj4gPj4+PiAgIHByb3Blcmx5Lgo+ID4+Pj4gLSBNb3ZlIHRoZSBicmlkZ2UudHlwZSBsaW5l
IHRvIHRoZSBwYXRjaCB0aGF0IGFkZHMgZHJtX2JyaWRnZSBzdXBwb3J0LiAoTGF1cmVudCBQaW5j
aGFydCkKPiA+Pj4+Cj4gPj4+PiBDaGFuZ2VzIGluIHYyOgo+ID4+Pj4gLSBEbyBub3Qgc2V0IGNv
bm5lY3Rvcl90eXBlIGZvciBwYW5lbCBoZXJlLiAoU2FtIFJhdm5ib3JnKQo+ID4+Pj4KPiA+Pj4+
IEVucmljIEJhbGxldGJvIGkgU2VycmEgKDcpOgo+ID4+Pj4gICBkcm0vYnJpZGdlOiBwczg2NDA6
IEdldCB0aGUgRURJRCBmcm9tIGVEUCBjb250cm9sCj4gPj4+PiAgIGRybS9icmlkZ2VfY29ubmVj
dG9yOiBTZXQgZGVmYXVsdCBzdGF0dXMgY29ubmVjdGVkIGZvciBlRFAgY29ubmVjdG9ycwo+ID4+
Pj4gICBkcm0vbWVkaWF0ZWs6IG10a19kc2k6IFJlbmFtZSBicmlkZ2UgdG8gbmV4dF9icmlkZ2UK
PiA+Pj4+ICAgZHJtL21lZGlhdGVrOiBtdGtfZHNpOiBDb252ZXJ0IHRvIGJyaWRnZSBkcml2ZXIK
PiA+Pj4+ICAgZHJtL21lZGlhdGVrOiBtdGtfZHNpOiBVc2Ugc2ltcGxlIGVuY29kZXIKPiA+Pj4+
ICAgZHJtL21lZGlhdGVrOiBtdGtfZHNpOiBVc2UgdGhlIGRybV9wYW5lbF9icmlkZ2UgQVBJCj4g
Pj4+PiAgIGRybS9tZWRpYXRlazogbXRrX2RzaTogQ3JlYXRlIGNvbm5lY3RvciBmb3IgYnJpZGdl
cwo+ID4+Pgo+ID4+PiBQYXRjaCBzZWVtcyByZWFkeSB0byBhcHBseS4gV2lsbCB0aGV5IGJlIGFw
cGxpZWQgdG8gYSBtZWRpYXRlayB0cmVlCj4gPj4+IG9yIHRvIGRybS1taXNjLW5leHQ/Cj4gPj4+
IE9yIHNoYWxsIHdlIHRha2UgdGhlIGZpcnN0IHR3byBwYXRjaGVzIHZpYSBkcm0tbWlzYy1uZXh0
LCBhbmQgdGhlCj4gPj4+IHJlbWFuaW5nIHZpYSBhIG1lZGlhdGVrIHRyZWU/IChJIGhvcGUgbm90
KQo+ID4+Pgo+ID4+Cj4gPj4gSSB0aGluayB0aGUgb25seSBjb25jZXJuIGlzIGZyb20gQ2h1bi1L
dWFuIHJlZ2FyZGluZyBwYXRjaCA3LzcgImRybS9tZWRpYXRlazoKPiA+PiBtdGtfZHNpOiBDcmVh
dGUgY29ubmVjdG9yIGZvciBicmlkZ2VzIiB3aGV0aGVyIHdlIHNob3VsZCBzdXBwb3J0IHRoZSBv
bGQgQVBJIG9yCj4gPj4gbm90LCBidXQgdGhlIGRpc2N1c3Npb24gc3RhbGxlZC4KPiA+Pgo+ID4K
PiA+IEkgZ2V0IG1vcmUgY2xlYXIgbm93LiBJbiBwYXRjaCA3LzcsCj4gPgo+ID4gcmV0ID0gZHJt
X2JyaWRnZV9hdHRhY2goJmRzaS0+ZW5jb2RlciwgJmRzaS0+YnJpZGdlLCBOVUxMLAo+ID4gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIERSTV9CUklER0VfQVRUQUNIX05P
X0NPTk5FQ1RPUik7Cj4gPgo+ID4gdGhpcyB3b3VsZCBjYWxsIGludG8gbXRrX2RzaV9icmlkZ2Vf
YXR0YWNoKCkgZmlyc3QsIGFuZCB0aGVuIGNhbGwgaW50bwo+ID4gcGFuZWxfYnJpZGdlX2F0dGFj
aCgpIG5leHQuIFNvIHBhbmVsX2JyaWRnZV9hdHRhY2goKSB3b3VsZCByZWNlaXZlCj4gPiBEUk1f
QlJJREdFX0FUVEFDSF9OT19DT05ORUNUT1IgYW5kIGl0IHJldHVybiBpbW1lZGlhdGVseSBzbyBp
dCBkb2VzCj4gPiBub3QgY2FsbCBkcm1fcGFuZWxfYXR0YWNoKCkuIFNvIHdoZXJlIGRvIHlvdSBj
YWxsIGRybV9wYW5lbF9hdHRhY2goKT8KPiA+Cj4KPiBXaHkgSSBuZWVkIHRvIGNhbGwgZHJtX3Bh
bmVsX2F0dGFjaD8KPgo+IEkgYmVsaWV2ZSBkcm1fcGFuZWxfYXR0YWNoKCkgd2FzIHRvIGF0dGFj
aCBhIHBhbmVsIHRvIGEgY29ubmVjdG9yLCBidXQgd2UgZG9uJ3QKPiBuZWVkIHRvIGRvIHRoaXMg
d2l0aCB0aGUgbmV3IEFQSSBhcyB0aGUgY29ubmVjdG9yIGlzIGFscmVhZHkgY3JlYXRlZCBhbmQK
PiBhdHRhY2hlZCB0byB0aGUgImR1bW15IiBlbmNvZGVyLgo+Cj4gTWFrZXMgdGhhdCBzZW5zZSB0
byB5b3U/IFdoYXQgZG8geW91IHRoaW5rIHdpbGwgbm90IHdvcmsgaWYgSSBkb24ndCBjYWxsCj4g
ZHJtX3BhbmVsX2F0dGFjaD8KPgo+IFsxXQo+IGh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xp
bnV4L3Y1LjgtcmMzL3NvdXJjZS9kcml2ZXJzL2dwdS9kcm0vZHJtX3BhbmVsLmMjTDEwMQo+CgpT
b3JyeSwgSSBkbyBub3Qgbm90aWNlIHRoaXMuIFNvIGZvciBwYXRjaCA3LzcsCgpSZXZpZXdlZC1i
eTogQ2h1bi1LdWFuZyBIdSA8Y2h1bmt1YW5nLmh1QGtlcm5lbC5vcmc+CgphbmQgSSB3b3VsZCB0
YWtlIHRoaXMgc2VyaWVzIGludG8gbXkgdHJlZSBsYXRlciwgdGhhbmtzLgoKUmVnYXJkcywKQ2h1
bi1LdWFuZy4KCj4gUmVnYXJkcywKPiAgRW5yaWMKPgo+Cj4gPiBSZWdhcmRzLAo+ID4gQ2h1bi1L
dWFuZy4KPiA+Cj4gPj4gVGhhbmtzLAo+ID4+ICBFbnJpYwo+ID4+Cj4gPj4KPiA+Pgo+ID4+PiAg
ICAgICBTYW0KPiA+Pj4KPiA+Pj4KPiA+Pj4+Cj4gPj4+PiAgZHJpdmVycy9ncHUvZHJtL2JyaWRn
ZS9wYXJhZGUtcHM4NjQwLmMgfCAgMTIgKysKPiA+Pj4+ICBkcml2ZXJzL2dwdS9kcm0vZHJtX2Jy
aWRnZV9jb25uZWN0b3IuYyB8ICAgMSArCj4gPj4+PiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVr
L210a19kc2kuYyAgICAgfCAyNjkgKysrKysrKystLS0tLS0tLS0tLS0tLS0tLQo+ID4+Pj4gIDMg
ZmlsZXMgY2hhbmdlZCwgOTcgaW5zZXJ0aW9ucygrKSwgMTg1IGRlbGV0aW9ucygtKQo+ID4+Pj4K
PiA+Pj4+IC0tCj4gPj4+PiAyLjI3LjAKPiA+Pj4+Cj4gPj4+PiBfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+ID4+Pj4gZHJpLWRldmVsIG1haWxpbmcgbGlz
dAo+ID4+Pj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+ID4+Pj4gaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwKPiA+Pj4KPiA+
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
