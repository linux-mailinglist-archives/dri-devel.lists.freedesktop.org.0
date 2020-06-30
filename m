Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E587B20F96A
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jun 2020 18:27:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7670A89D2F;
	Tue, 30 Jun 2020 16:27:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CACD089D2F
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jun 2020 16:27:01 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 66758206BE
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jun 2020 16:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593534421;
 bh=PpAnJn1XJ0kKZXszzmeCK2//lTYa5JNojd5Sw6KrTkE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=gts96HYbjen9gTCki14zS8VQMLWdrTPAbFAKJ5yAbAf0efCkpK880dXgpwF1iUO3G
 Y15s9ff6tJA1bpsV2vkRwS8QnGGKc+xZvewQsqunGKS9nOrQ4Rqb4OQyQ604t3NJO4
 +nejn1DOtYixqD+xWpStdaTf7VpphBCXOWkIZ2OQ=
Received: by mail-ed1-f47.google.com with SMTP id by13so6933004edb.11
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jun 2020 09:27:01 -0700 (PDT)
X-Gm-Message-State: AOAM530LovSzVHN48AZfMOSiWZj60gmmEGVcf4r35sgMGbh+w+2WeCQX
 suOPAETit8YRyhujHkTfbC/WhM/mH6iYW4Zu9A==
X-Google-Smtp-Source: ABdhPJzzR0lmC6L/tSPZZNNP3p4O+oe/PeEBeNY5QR0PicjAWxxqEBWX6AKJHjWXCakLYt6gaZibUhu/HomQIBzuFzs=
X-Received: by 2002:a05:6402:1766:: with SMTP id
 da6mr23156696edb.48.1593534419986; 
 Tue, 30 Jun 2020 09:26:59 -0700 (PDT)
MIME-Version: 1.0
References: <20200615203108.786083-1-enric.balletbo@collabora.com>
 <20200620213302.GC74146@ravnborg.org>
 <593a4666-d6aa-7d16-f3a0-ba3713047d84@collabora.com>
In-Reply-To: <593a4666-d6aa-7d16-f3a0-ba3713047d84@collabora.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 1 Jul 2020 00:26:49 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9ZHemp0U76_oPjwy-XoTRXW108UMD_9JVnNXndNNsiTw@mail.gmail.com>
Message-ID: <CAAOTY_9ZHemp0U76_oPjwy-XoTRXW108UMD_9JVnNXndNNsiTw@mail.gmail.com>
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
b3JhLmNvbT4g5pa8IDIwMjDlubQ25pyIMzDml6Ug6YCx5LqMIOS4i+WNiDEwOjM05a+r6YGT77ya
Cj4KPiBIaSBTYW0sIENodW4tS3VhbiwKPgo+IE9uIDIwLzYvMjAgMjM6MzMsIFNhbSBSYXZuYm9y
ZyB3cm90ZToKPiA+IEhpIEVucmljCj4gPgo+ID4gT24gTW9uLCBKdW4gMTUsIDIwMjAgYXQgMTA6
MzE6MDFQTSArMDIwMCwgRW5yaWMgQmFsbGV0Ym8gaSBTZXJyYSB3cm90ZToKPiA+PiAoVGhpcyBy
ZXNlbmQgaXMgdG8gZml4IHNvbWUgdHJpdmlhbCBjb25mbGljdHMgZHVlIHRoZSBtZXJnZSB3aW5k
b3cpCj4gPj4KPiA+PiBUaGUgUFM4NjQwIGRzaS10by1lRFAgYnJpZGdlIGRyaXZlciBpcyB1c2lu
ZyB0aGUgcGFuZWwgYnJpZGdlIEFQSSwKPiA+PiBob3dldmVyLCBub3QgYWxsIHRoZSBjb21wb25l
bnRzIGluIHRoZSBjaGFpbiBoYXZlIGJlZW4gcG9ydGVkIHRvIHRoZQo+ID4+IGRybV9icmlkZ2Ug
QVBJLiBBY3R1YWxseSwgd2hlbiBhIHBhbmVsIGlzIGF0dGFjaGVkIHRoZSBkZWZhdWx0IHBhbmVs
J3MgbW9kZQo+ID4+IGlzIHVzZWQsIGJ1dCBpbiBzb21lIGNhc2VzIHdlIGNhbid0IGdldCBkaXNw
bGF5IHVwIGlmIG1vZGUgZ2V0dGluZyBmcm9tCj4gPj4gZURQIGNvbnRyb2wgRURJRCBpcyBub3Qg
Y2hvc2VuLgo+ID4+Cj4gPj4gVGhpcyBzZXJpZXMgYWRkcmVzcyB0aGF0IHByb2JsZW0sIGZpcnN0
IGltcGxlbWVudHMgdGhlIC5nZXRfZWRpZCgpCj4gPj4gY2FsbGJhY2sgaW4gdGhlIFBTODY0MCBk
cml2ZXIgKHdoaWNoIGlzIG5vdCB1c2VkIHVudGlsIHRoZSBjb252ZXJzaW9uIGlzCj4gPj4gZG9u
ZSkgYW5kIHRoZW4sIGNvbnZlcnRzIHRoZSBNZWRpYXRlayBEU0kgZHJpdmVyIHRvIHVzZSB0aGUg
ZHJtX2JyaWRnZQo+ID4+IEFQSS4KPiA+Pgo+ID4+IEFzIGZhciBhcyBJIGtub3csIHdlJ3JlIHRo
ZSBvbmx5IHVzZXJzIG9mIHRoZSBtZWRpYXRlayBkc2kgZHJpdmVyIGluCj4gPj4gbWFpbmxpbmUs
IHNvIHNob3VsZCBiZSBzYWZlIHRvIHN3aXRjaCB0byB0aGUgbmV3IGNoYWluIG9mIGRybV9icmlk
Z2UgQVBJCj4gPj4gdW5jb25kaXRpb25hbGx5Lgo+ID4+Cj4gPj4gVGhlIHBhdGNoZXMgaGFzIGJl
ZW4gdGVzdGVkIG9uIGEgQWNlciBDaHJvbWVib29rIFIxMyAoRWxtKSBydW5uaW5nIGEKPiA+PiBD
aHJvbWUgT1MgdXNlcnNwYWNlIGFuZCBjaGVja2luZyB0aGF0IHRoZSB2YWxpZCBFRElEIG1vZGUg
cmVwb3J0ZWQgYnkKPiA+PiB0aGUgYnJpZGdlIGlzIHNlbGVjdGVkLgo+ID4+Cj4gPj4gQ2hhbmdl
cyBpbiB2NDoKPiA+PiAtIFJlbW92ZSBkb3VibGUgY2FsbCB0byBkcm1fZW5jb2Rlcl9pbml0KCku
IChDaHVuLUt1YW5nIEh1KQo+ID4+IC0gQ2xlYW51cCB0aGUgZW5jb2RlciBpbiBtdGtfZHNpX3Vu
YmluZCgpLiAoQ2h1bi1LdWFuZyBIdSkKPiA+Pgo+ID4+IENoYW5nZXMgaW4gdjM6Cj4gPj4gLSBS
ZXBsYWNlIHMvYnJpZGdlL25leHQgYnJpZGdlLyBmb3IgY29tbWVudC4gKExhdXJlbnQgUGluY2hh
cnQpCj4gPj4gLSBBZGQgdGhlIGJyaWRnZS50eXBlLiAoTGF1cmVudCBQaW5jaGFydCkKPiA+PiAt
IFVzZSBuZXh0X2JyaWRnZSBmaWVsZCB0byBzdG9yZSB0aGUgcGFuZWwgYnJpZGdlLiAoTGF1cmVu
dCBQaW5jaGFydCkKPiA+PiAtIEFkZCB0aGUgYnJpZGdlLnR5cGUgZmllbGQuIChMYXVyZW50IFBp
bmNoYXJ0KQo+ID4+IC0gVGhpcyBwYXRjaCByZXF1aXJlcyBodHRwczovL2xrbWwub3JnL2xrbWwv
MjAyMC80LzE2LzIwODAgdG8gd29yawo+ID4+ICAgcHJvcGVybHkuCj4gPj4gLSBNb3ZlIHRoZSBi
cmlkZ2UudHlwZSBsaW5lIHRvIHRoZSBwYXRjaCB0aGF0IGFkZHMgZHJtX2JyaWRnZSBzdXBwb3J0
LiAoTGF1cmVudCBQaW5jaGFydCkKPiA+Pgo+ID4+IENoYW5nZXMgaW4gdjI6Cj4gPj4gLSBEbyBu
b3Qgc2V0IGNvbm5lY3Rvcl90eXBlIGZvciBwYW5lbCBoZXJlLiAoU2FtIFJhdm5ib3JnKQo+ID4+
Cj4gPj4gRW5yaWMgQmFsbGV0Ym8gaSBTZXJyYSAoNyk6Cj4gPj4gICBkcm0vYnJpZGdlOiBwczg2
NDA6IEdldCB0aGUgRURJRCBmcm9tIGVEUCBjb250cm9sCj4gPj4gICBkcm0vYnJpZGdlX2Nvbm5l
Y3RvcjogU2V0IGRlZmF1bHQgc3RhdHVzIGNvbm5lY3RlZCBmb3IgZURQIGNvbm5lY3RvcnMKPiA+
PiAgIGRybS9tZWRpYXRlazogbXRrX2RzaTogUmVuYW1lIGJyaWRnZSB0byBuZXh0X2JyaWRnZQo+
ID4+ICAgZHJtL21lZGlhdGVrOiBtdGtfZHNpOiBDb252ZXJ0IHRvIGJyaWRnZSBkcml2ZXIKPiA+
PiAgIGRybS9tZWRpYXRlazogbXRrX2RzaTogVXNlIHNpbXBsZSBlbmNvZGVyCj4gPj4gICBkcm0v
bWVkaWF0ZWs6IG10a19kc2k6IFVzZSB0aGUgZHJtX3BhbmVsX2JyaWRnZSBBUEkKPiA+PiAgIGRy
bS9tZWRpYXRlazogbXRrX2RzaTogQ3JlYXRlIGNvbm5lY3RvciBmb3IgYnJpZGdlcwo+ID4KPiA+
IFBhdGNoIHNlZW1zIHJlYWR5IHRvIGFwcGx5LiBXaWxsIHRoZXkgYmUgYXBwbGllZCB0byBhIG1l
ZGlhdGVrIHRyZWUKPiA+IG9yIHRvIGRybS1taXNjLW5leHQ/Cj4gPiBPciBzaGFsbCB3ZSB0YWtl
IHRoZSBmaXJzdCB0d28gcGF0Y2hlcyB2aWEgZHJtLW1pc2MtbmV4dCwgYW5kIHRoZQo+ID4gcmVt
YW5pbmcgdmlhIGEgbWVkaWF0ZWsgdHJlZT8gKEkgaG9wZSBub3QpCj4gPgo+Cj4gSSB0aGluayB0
aGUgb25seSBjb25jZXJuIGlzIGZyb20gQ2h1bi1LdWFuIHJlZ2FyZGluZyBwYXRjaCA3LzcgImRy
bS9tZWRpYXRlazoKPiBtdGtfZHNpOiBDcmVhdGUgY29ubmVjdG9yIGZvciBicmlkZ2VzIiB3aGV0
aGVyIHdlIHNob3VsZCBzdXBwb3J0IHRoZSBvbGQgQVBJIG9yCj4gbm90LCBidXQgdGhlIGRpc2N1
c3Npb24gc3RhbGxlZC4KPgoKSSBnZXQgbW9yZSBjbGVhciBub3cuIEluIHBhdGNoIDcvNywKCnJl
dCA9IGRybV9icmlkZ2VfYXR0YWNoKCZkc2ktPmVuY29kZXIsICZkc2ktPmJyaWRnZSwgTlVMTCwK
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIERSTV9CUklER0VfQVRUQUNI
X05PX0NPTk5FQ1RPUik7Cgp0aGlzIHdvdWxkIGNhbGwgaW50byBtdGtfZHNpX2JyaWRnZV9hdHRh
Y2goKSBmaXJzdCwgYW5kIHRoZW4gY2FsbCBpbnRvCnBhbmVsX2JyaWRnZV9hdHRhY2goKSBuZXh0
LiBTbyBwYW5lbF9icmlkZ2VfYXR0YWNoKCkgd291bGQgcmVjZWl2ZQpEUk1fQlJJREdFX0FUVEFD
SF9OT19DT05ORUNUT1IgYW5kIGl0IHJldHVybiBpbW1lZGlhdGVseSBzbyBpdCBkb2VzCm5vdCBj
YWxsIGRybV9wYW5lbF9hdHRhY2goKS4gU28gd2hlcmUgZG8geW91IGNhbGwgZHJtX3BhbmVsX2F0
dGFjaCgpPwoKUmVnYXJkcywKQ2h1bi1LdWFuZy4KCj4gVGhhbmtzLAo+ICBFbnJpYwo+Cj4KPgo+
ID4gICAgICAgU2FtCj4gPgo+ID4KPiA+Pgo+ID4+ICBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3Bh
cmFkZS1wczg2NDAuYyB8ICAxMiArKwo+ID4+ICBkcml2ZXJzL2dwdS9kcm0vZHJtX2JyaWRnZV9j
b25uZWN0b3IuYyB8ICAgMSArCj4gPj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHNp
LmMgICAgIHwgMjY5ICsrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0KPiA+PiAgMyBmaWxlcyBjaGFu
Z2VkLCA5NyBpbnNlcnRpb25zKCspLCAxODUgZGVsZXRpb25zKC0pCj4gPj4KPiA+PiAtLQo+ID4+
IDIuMjcuMAo+ID4+Cj4gPj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KPiA+PiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gPj4gZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwo+ID4+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVsCj4gPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWwK
