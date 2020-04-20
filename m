Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E334F1B1A0F
	for <lists+dri-devel@lfdr.de>; Tue, 21 Apr 2020 01:19:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 605D46E863;
	Mon, 20 Apr 2020 23:19:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb43.google.com (mail-yb1-xb43.google.com
 [IPv6:2607:f8b0:4864:20::b43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25A086E288;
 Mon, 20 Apr 2020 23:19:52 +0000 (UTC)
Received: by mail-yb1-xb43.google.com with SMTP id b17so6198713ybq.13;
 Mon, 20 Apr 2020 16:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Ya7uPvz33k/Th0rFLYZRsOz9/2PUgpVSR6JbNYzn6GM=;
 b=ej6B8RV6ya2ZJBQQJntXMJUFXJE8+aV+G1o5ioTh/RHRkcfhHTwsaW+D4xfUqHodYk
 /auAau/cK5vj3MnL2O2LBcq6AfpOIhimpAJjXIMm/qeR20gFcmHKJ9hZqQ8Dz3lFr2b4
 Hjl4fThhii55qtQuEVj15ofas/xStHKxjXImBXkpZpmszWhI2H4of/0fwLXosY4mw7RR
 Ro6HXYradnxMnuDMfAoobzenOcHA5JrZSsxvchk5tgXFFymCbtHuq5Nqyw2LNRZIO1mL
 pSDYATkJLdXZ5zi2mT4H0tRIya6CTgg9Ao7Ym55+TGWrT8b2gt9cAsytpM/WEroXsRBO
 Mosw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Ya7uPvz33k/Th0rFLYZRsOz9/2PUgpVSR6JbNYzn6GM=;
 b=n+6LKyVn5t4fVmBs/hpWQUltMC3qFV9RhwW5Pwt1Be3dMyfCBoKdPta5Hc4R6gcSli
 KEanUtEW19TS8+OXJvUM801gx9TYLsvf/18MjCpWXynNcnmI3knrhBHqkn8IO2OkSJpd
 76Z9D2Iimt3f/EGW4vSxDYTNc0BELz8vzES2Kurq5NchtcsCL6XpZ92vPKhMNhk+O9S2
 +dxyfZWks2KOmK7tLfYwVdY4qdaEQjhMmaIzGO0F7Byds4jJozgxD85L4jY/nEx3rcXs
 tzkbiAmgWjSJ6JMqD6luSTEqhQeZWZwHt7oxujbtI6I4pfuXmUnlA4dIAQHuxsWA1TBX
 7xtg==
X-Gm-Message-State: AGi0PuaPS7GYHQ+aJ0cG3zX4Rw8q01waz32ls7cSf8ef+ubig/C+OuE8
 roryd39ARDEfNyX09wkQO6DEHoxwj/uwYAscgkA=
X-Google-Smtp-Source: APiQypKza0fwVPVxFR5MdqPuNVTaaebdpuiZ+G8iyVCfL23ES5mQHCTrrzb0ymiDhrHAq6J+sngc7XaB/esudjqPt9M=
X-Received: by 2002:a25:12c1:: with SMTP id 184mr13309861ybs.162.1587424791265; 
 Mon, 20 Apr 2020 16:19:51 -0700 (PDT)
MIME-Version: 1.0
References: <20200417194145.36350-1-lyude@redhat.com>
In-Reply-To: <20200417194145.36350-1-lyude@redhat.com>
From: Ben Skeggs <skeggsb@gmail.com>
Date: Tue, 21 Apr 2020 09:19:40 +1000
Message-ID: <CACAvsv7i+f1EnOB6HngisnexVc2jVVyJqfQk4kRk63uxuTG18w@mail.gmail.com>
Subject: Re: [RFC v3 00/11] drm/nouveau: Introduce CRC support for gf119+
To: Lyude Paul <lyude@redhat.com>
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
Cc: Kate Stewart <kstewart@linuxfoundation.org>,
 David Airlie <airlied@linux.ie>, ML nouveau <nouveau@lists.freedesktop.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Sam Ravnborg <sam@ravnborg.org>,
 "Peter Zijlstra \(Intel\)" <peterz@infradead.org>,
 Ben Dooks <ben.dooks@codethink.co.uk>, Ben Skeggs <bskeggs@redhat.com>,
 Liang Chen <cl@rock-chips.com>, Petr Mladek <pmladek@suse.com>,
 Jani Nikula <jani.nikula@intel.com>, Johannes Weiner <hannes@cmpxchg.org>,
 Peteris Rudzusiks <peteris.rudzusiks@gmail.com>, Tejun Heo <tj@kernel.org>,
 Sean Paul <seanpaul@chromium.org>, Thomas Gleixner <tglx@linutronix.de>,
 Suren Baghdasaryan <surenb@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 LKML <linux-kernel@vger.kernel.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU2F0LCAxOCBBcHIgMjAyMCBhdCAwNTo0MiwgTHl1ZGUgUGF1bCA8bHl1ZGVAcmVkaGF0LmNv
bT4gd3JvdGU6Cj4KPiBOdmlkaWEgcmVsZWFzZWQgc29tZSBkb2N1bWVudGF0aW9uIG9uIGhvdyBD
UkMgc3VwcG9ydCB3b3JrcyBvbiB0aGVpcgo+IEdQVXMsIGhvb3JheSEKPgo+IFNvOiB0aGlzIHBh
dGNoIHNlcmllcyBpbXBsZW1lbnRzIHNhaWQgQ1JDIHN1cHBvcnQgaW4gbm91dmVhdSwgYWxvbmcg
d2l0aAo+IGFkZGluZyBzb21lIHNwZWNpYWwgZGVidWdmcyBpbnRlcmZhY2VzIGZvciBzb21lIHJl
bGV2YW50IGlndC1ncHUtdG9vbHMKPiB0ZXN0cyB0aGF0IHdlJ2xsIGJlIHNlbmRpbmcgaW4ganVz
dCBhIHNob3J0IGJpdC4KPgo+IFRoaXMgYWRkaXRpb25hbGx5IGFkZHMgYSBmZWF0dXJlIHRoYXQg
VmlsbGUgU3lyasOkbMOkIGNhbWUgdXAgd2l0aDogdmJsYW5rCj4gd29ya3MuIEJhc2ljYWxseSwg
dGhpcyBpcyBqdXN0IGEgZ2VuZXJpYyBEUk0gaW50ZXJmYWNlIHRoYXQgYWxsb3dzIGZvcgo+IHNj
aGVkdWxpbmcgaGlnaC1wcmlvcml0eSB3b3JrZXJzIHRoYXQgc3RhcnQgb24gYSBnaXZlbiB2Ymxh
bmsgaW50ZXJydXB0Lgo+IE5vdGUgdGhhdCB3aGlsZSB3ZSdyZSBjdXJyZW50bHkgb25seSB1c2lu
ZyB0aGlzIGluIG5vdXZlYXUsIEludGVsIGhhcwo+IHBsYW5zIHRvIHVzZSB0aGlzIGZvciBpOTE1
IGFzIHdlbGwgKGhlbmNlIHdoeSB0aGV5IGNhbWUgdXAgd2l0aCBpdCEpLgo+Cj4gQW5kIGZpbmFs
bHk6IGluIG9yZGVyIHRvIGltcGxlbWVudCB0aGUgbGFzdCBmZWF0dXJlLCB3ZSBleHBvc2Ugc29t
ZSBuZXcKPiBmdW5jdGlvbnMgaW4gdGhlIGtlcm5lbCdzIGt0aHJlYWRfd29ya2VyIGluZnJhc3Ry
dWN0dXJlIHNvIHRoYXQgd2UgY2FuCj4gZGUtY29tcGxpY2F0ZSBvdXIgaW1wbGVtZW50YXRpb24g
b2YgdGhpcy4KPgo+IEFueXdheS13ZWxjb21lIHRvIHRoZSBmdXR1cmUhIDopClRoZSBOb3V2ZWF1
IGJpdHMgbG9vayBhbHJpZ2h0IHRvIG1lLCBJJ2xsIHRha2UgdGhlbSBvbmNlIHRoZSBwYXRjaGVz
Cml0IGRlcGVuZHMgb24gaGF2ZSBiZWVuIGFja2VkLgoKQmVuLgoKPgo+IE1ham9yIGNoYW5nZXMg
c2luY2UgdjI6Cj4gKiBVc2Uga3RocmVhZF93b3JrZXIgaW5zdGVhZCBvZiBrdGhyZWFkZCBmb3Ig
dmJsYW5rIHdvcmtlcnMKPiAqIERvbid0IGNoZWNrIGRlYnVnZnMgcmV0dXJuIHZhbHVlcwo+Cj4g
THl1ZGUgUGF1bCAoMTEpOgo+ICAgZHJtL3ZibGFuazogUmVnaXN0ZXIgZHJtbSBjbGVhbnVwIGFj
dGlvbiBvbmNlIHBlciBkcm1fdmJsYW5rX2NydGMKPiAgIGt0aHJlYWQ6IEludHJvZHVjZSBfX2t0
aHJlYWRfcXVldWVfd29yaygpCj4gICBkcm0vdmJsYW5rOiBBZGQgdmJsYW5rIHdvcmtzCj4gICBk
cm0vbm91dmVhdS9rbXMvbnY1MC06IFVucm9sbCBlcnJvciBjbGVhbnVwIGluIG52NTBfaGVhZF9j
cmVhdGUoKQo+ICAgZHJtL25vdXZlYXUva21zL252MTQwLTogRG9uJ3QgbW9kaWZ5IGRlcHRoIGlu
IHN0YXRlIGR1cmluZyBhdG9taWMKPiAgICAgY29tbWl0Cj4gICBkcm0vbm91dmVhdS9rbXMvbnY1
MC06IEZpeCBkaXNhYmxpbmcgZGl0aGVyaW5nCj4gICBkcm0vbm91dmVhdS9rbXMvbnY1MC06IHMv
aGFybS9hcm1oL2cKPiAgIGRybS9ub3V2ZWF1L2ttcy9udjE0MC06IFRyYWNrIHduZHcgbWFwcGlu
Z3MgaW4gbnY1MF9oZWFkX2F0b20KPiAgIGRybS9ub3V2ZWF1L2ttcy9udjUwLTogRXhwb3NlIG52
NTBfb3V0cF9hdG9tIGluIGRpc3AuaAo+ICAgZHJtL25vdXZlYXUva21zL252NTAtOiBNb3ZlIGhh
cmQtY29kZWQgb2JqZWN0IGhhbmRsZXMgaW50byBoZWFkZXIKPiAgIGRybS9ub3V2ZWF1L2ttcy9u
dmQ5LTogQWRkIENSQyBzdXBwb3J0Cj4KPiAgZHJpdmVycy9ncHUvZHJtL2RybV92YmxhbmsuYyAg
ICAgICAgICAgICAgICB8IDMxNCArKysrKysrKy0KPiAgZHJpdmVycy9ncHUvZHJtL25vdXZlYXUv
ZGlzcG52MDQvY3J0Yy5jICAgICB8ICAyNSArLQo+ICBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9k
aXNwbnY1MC9LYnVpbGQgICAgIHwgICA0ICsKPiAgZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvZGlz
cG52NTAvYXRvbS5oICAgICB8ICAyMSArCj4gIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rpc3Bu
djUwL2NvcmUuaCAgICAgfCAgIDQgKwo+ICBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9kaXNwbnY1
MC9jb3JlOTA3ZC5jIHwgICAzICsKPiAgZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvZGlzcG52NTAv
Y29yZTkxN2QuYyB8ICAgMyArCj4gIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rpc3BudjUwL2Nv
cmVjMzdkLmMgfCAgIDMgKwo+ICBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9kaXNwbnY1MC9jb3Jl
YzU3ZC5jIHwgICAzICsKPiAgZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvZGlzcG52NTAvY3JjLmMg
ICAgICB8IDcxNSArKysrKysrKysrKysrKysrKysrKwo+ICBkcml2ZXJzL2dwdS9kcm0vbm91dmVh
dS9kaXNwbnY1MC9jcmMuaCAgICAgIHwgMTI1ICsrKysKPiAgZHJpdmVycy9ncHUvZHJtL25vdXZl
YXUvZGlzcG52NTAvY3JjOTA3ZC5jICB8IDEzOSArKysrCj4gIGRyaXZlcnMvZ3B1L2RybS9ub3V2
ZWF1L2Rpc3BudjUwL2NyY2MzN2QuYyAgfCAxNTMgKysrKysKPiAgZHJpdmVycy9ncHUvZHJtL25v
dXZlYXUvZGlzcG52NTAvZGlzcC5jICAgICB8ICA2NSArLQo+ICBkcml2ZXJzL2dwdS9kcm0vbm91
dmVhdS9kaXNwbnY1MC9kaXNwLmggICAgIHwgIDI0ICsKPiAgZHJpdmVycy9ncHUvZHJtL25vdXZl
YXUvZGlzcG52NTAvaGFuZGxlcy5oICB8ICAxNiArCj4gIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1
L2Rpc3BudjUwL2hlYWQuYyAgICAgfCAxNDIgKysrLQo+ICBkcml2ZXJzL2dwdS9kcm0vbm91dmVh
dS9kaXNwbnY1MC9oZWFkLmggICAgIHwgIDEzICstCj4gIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1
L2Rpc3BudjUwL2hlYWQ5MDdkLmMgfCAgMTQgKy0KPiAgZHJpdmVycy9ncHUvZHJtL25vdXZlYXUv
ZGlzcG52NTAvaGVhZGMzN2QuYyB8ICAyNyArLQo+ICBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9k
aXNwbnY1MC9oZWFkYzU3ZC5jIHwgIDIwICstCj4gIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rp
c3BudjUwL3duZHcuYyAgICAgfCAgMTUgKy0KPiAgZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91
dmVhdV9kaXNwbGF5LmMgICB8ICA2MCArLQo+ICBpbmNsdWRlL2RybS9kcm1fdmJsYW5rLmggICAg
ICAgICAgICAgICAgICAgIHwgIDMxICsKPiAgaW5jbHVkZS9saW51eC9rdGhyZWFkLmggICAgICAg
ICAgICAgICAgICAgICB8ICAgMyArCj4gIGtlcm5lbC9rdGhyZWFkLmMgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgfCAgMzQgKy0KPiAgMjYgZmlsZXMgY2hhbmdlZCwgMTgzMSBpbnNlcnRpb25z
KCspLCAxNDUgZGVsZXRpb25zKC0pCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9k
cm0vbm91dmVhdS9kaXNwbnY1MC9jcmMuYwo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9n
cHUvZHJtL25vdXZlYXUvZGlzcG52NTAvY3JjLmgKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZl
cnMvZ3B1L2RybS9ub3V2ZWF1L2Rpc3BudjUwL2NyYzkwN2QuYwo+ICBjcmVhdGUgbW9kZSAxMDA2
NDQgZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvZGlzcG52NTAvY3JjYzM3ZC5jCj4gIGNyZWF0ZSBt
b2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9kaXNwbnY1MC9oYW5kbGVzLmgKPgo+
IC0tCj4gMi4yNS4xCj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwo+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
Cg==
