Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6C4630D61
	for <lists+dri-devel@lfdr.de>; Fri, 31 May 2019 13:36:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFCE2892FD;
	Fri, 31 May 2019 11:36:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com
 [IPv6:2607:f8b0:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41B57892FD
 for <dri-devel@lists.freedesktop.org>; Fri, 31 May 2019 11:36:28 +0000 (UTC)
Received: by mail-oi1-x243.google.com with SMTP id b21so3497907oic.8
 for <dri-devel@lists.freedesktop.org>; Fri, 31 May 2019 04:36:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=QsIPuiBf4S4n9Vgw/Jv6239QwAJnCO/NeT62+GxjaL4=;
 b=jNO4ytbSdM+btCUHKxHJT4uYYEfPDZPKmvZvXeL0CSQwUURgTFgtykCc3D7UviCeyW
 QOkwb5uSRC8yVrx5B9Q3ZDEcdu7L1fFThWLxKXnYJ2nHlLuPNschSOom4L9cUjq1dj6k
 gvUZLvJSibZ3uMArWE53/MCdbNtoiAAJh7k2x/bBPP9IE7E2QqcxROjAfXRB9NE54xy2
 zmrmE5qjRYxFsWdKIOeOStZLNGnk6x57kffiUkjph11qHznDZF2zSapJ3IMVmU5n8q3F
 MwXPbTufUGsu4DQsmCEaEgh2phanyN/QjPHq29j7sh4TqAztl4i6tRRaD1r/kMKn2VsM
 znIA==
X-Gm-Message-State: APjAAAUUu1sc2QAsQsjbHs1ZOjG+r5Reh1R9/KtuZ2Oi9Z2bq2uzVN+e
 bGU0sDPWaATUqIRx4Ta2f6yKfJPNyfkmGR1amCO+Tw==
X-Google-Smtp-Source: APXvYqwiS0Hxh6+jeB6MCdtKZvfWH4McRwQS9lnvuqEBQlchDT5WwfQjHvdy5kkNNqDaHFG2+UGdhUylob1nxU6zGSU=
X-Received: by 2002:aca:6208:: with SMTP id w8mr5965287oib.128.1559302587412; 
 Fri, 31 May 2019 04:36:27 -0700 (PDT)
MIME-Version: 1.0
References: <96fb4e89-2721-90bb-ce76-69667c2cf78a@st.com>
 <2a6c0803-b386-c8cc-78f8-26faa230ac44@tronnes.org>
In-Reply-To: <2a6c0803-b386-c8cc-78f8-26faa230ac44@tronnes.org>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Fri, 31 May 2019 13:36:16 +0200
Message-ID: <CAKMK7uH=Lo+Ewc6UpjF_pEPB+O0NR4VOeDtM1mdpoAdV4HR6xQ@mail.gmail.com>
Subject: Re: drm_gem_dumb_map_offset patch
To: =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=QsIPuiBf4S4n9Vgw/Jv6239QwAJnCO/NeT62+GxjaL4=;
 b=OCyw9DpgCxOhMGR9pUbF55CKy9nxc/jUGxpZ98pnyXMyo8OvQRBFmjh+ReJzNnT2z4
 p/k6X2JC++giTTYd5Fo7LRqqGUvg8VdHgL58PgV5LJNYr7CQkdtw7YtjZw+CKxiV8ham
 uZnHRQoX4cmllxIeWt+Qx7qSGzJ+qBDjcJkaw=
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
Cc: DRI Development <dri-devel@lists.freedesktop.org>,
 Pierre Yves MORDRET <pierre-yves.mordret@st.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBNYXkgMzEsIDIwMTkgYXQgMToyOCBQTSBOb3JhbGYgVHLDuG5uZXMgPG5vcmFsZkB0
cm9ubmVzLm9yZz4gd3JvdGU6Cj4KPiBIaSwKPgo+IFthZGQgRGFuaWVsIFZldHRlcl0KPiBbY2Mg
ZHJpLWRldmVsXQo+Cj4gRGVuIDI5LjA1LjIwMTkgMTUuMDksIHNrcmV2IFBpZXJyZSBZdmVzIE1P
UkRSRVQ6Cj4gPiBIZWxsbyBOb3JhbGYsCj4gPgo+ID4gU29ycnkgZm9yIGJvdGhlcmluZyB5b3Ug
d2l0aCBxdWVzdGlvbiBidXQgSSBuZWVkIHRvIGJldHRlciB1bmRlcnN0YW5kIHRoZQo+ID4gcmF0
aW9uYWwgYWJvdXQgYSBwYXRjaCB5b3UgZGlkIGluIERSTS9HRU0uCj4gPgo+ID4gRmlyc3Qgb2Yg
YWxsLCBsZXQgbWUgaW50cm9kdWNlIG15c2VsZi4KPiA+IEknbSBjdXJyZW50bHkgZW1wbG95ZWUg
dG8gU1RNaWNyb2VsZWN0cm9uaWNzIGNvbXBhbnkgYW5kIGluIGNoYXJnZSBvZiBHUFUKPiA+IGlu
dGVncmF0aW9uIHdpdGhpbiBTVE0zMiBNUFUgKENvcnRleCBBNyArIENvcnRleCBNNCkKPiA+Cj4g
PiBPbiBDb3J0ZXggQTcgaXMgcnVubmluZyBhIExpbnV4IEtlcm5lbCA0LjE5IGFzIGZvciB0b2Rh
eS4KPiA+Cj4gPiBXZSBjYW1lIGFjcm9zcyBzb21lIHRyb3VibGUgd2hlbiB3ZSBzd2l0Y2ggZnJv
bSBLZXJuZWwgNC4xNCB0byA0LjE5IGZvciBHUFUKPiA+IHN0YWNrLiBPbiBhdWd1c3QgeW91IHN1
Ym1pdCB0aGlzIGNvbW1pdCA6Cj4gPgo+ID4gICAgICAgOTAzNzhlNTg5MTkyODU2MzdhYTBmMDYz
YzA0YmEwYzY0NDlkOThiMQo+ID4gICAgICAgICAgIGRybS9nZW06IGRybV9nZW1fZHVtYl9tYXBf
b2Zmc2V0KCk6IHJlamVjdCBkbWEtYnVmCj4gPgo+ID4gICAgICAgICAgIFJlamVjdCBtYXBwaW5n
IGFuIGltcG9ydGVkIGRtYS1idWYgc2luY2UgaXMncyBhbiBpbnZhbGlkIHVzZS1jYXNlLgo+ID4K
PiA+IEluIFVzZXJsYW5kIEdQVSBzdGFjayB3ZSBoYXZlIHN1Y2ggc3RhdGVtZW50cyA6Cj4gPiAg
ICBib19tYXBfZmQKPiA+ICAgICAgICBEUk1fSU9DVExfTU9ERV9NQVBfRFVNQgo+ID4gICAgICAg
IG1tYXAgKG9mZnNldCkKPiA+Cj4gPiBXaXRoIHRoZSBwYXRjaCBhYm92ZSwgaW9jdGwgcmV0dXJu
cyBhbiBlcnJvciBFSU5WQUwgYW5kIHByZXZlbnRzIHRoZSBubWFwLgo+ID4gQXMgZm9yIHRvZGF5
IHdlIHJldmVydCB0aGlzIHBhdGNoIGFuZCBpdCB3b3JrcyBmaW5lIGluIG91ciBlbmQuCgpMaW5r
IHRvIHNvdXJjZSBjb2RlIHdvdWxkIGJlIGdvb2QuCgo+ID4gVGh1cyB0aGUgcXVlc3Rpb25zIGFy
ZSA6Cj4gPiAgLSB3aGF0IGlzIHRoZSByYXRpb25hbCBiZWhpbmQgdGhpcyBmaXggPwo+ID4gIC0g
V2hhdCB3ZSBkb2luZyB3cm9uZyB0aGlzIHNpdHVhdGlvbiA/Cj4gPiAgLSBXaGF0IGRvIHdlIG5l
ZWQgaW4gc3VjaCBzaXR1YXRpb24gPwo+ID4KPgo+IEkgbmVlZCB0byBwYXNzIHRob3NlIG9uIHRv
IERhbmllbCBWZXR0ZXIgKERSTSBtYWludGFpbmVyKSBzaW5jZSBoZQo+IHdhbnRlZCB0aGUgY2hh
bmdlLiBUaGUgZGV0YWlscyB3ZXJlIG5ldmVyIGNsZWFyIHRvIG1lLgo+IFNvbWUgb2YgdGhlIGRp
c2N1c3Npb24gaXMgaGVyZToKPiBodHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvcGF0
Y2gvMTcyMjQyLwoKRHVtYiBtbWFwIGlzIGZvciBidWZmZXIgY3JlYXRlZCB1c2luZyBkdW1iX2Ny
ZWF0ZSBpb2N0bCwgYW5kIG5vdGhpbmcKZWxzZS4gQW55dGhpbmcgZWxzZSByZWFsbHkgaGFzIGF0
IGJlc3QgdW5kZWZpbmVkIGJlaGF2aW91ci4gRS5nLiBmb3IKZG1hLWJ1ZiB5b3UgcmVhbGx5IG5l
ZWQgdG8gY2FsbCB0aGUgYmVnaW4vZW5kX2NwdV9hY2Nlc3MgaW9jdGwsIGFuZApkdW1iIGJ1ZmZl
cnMgc2ltcGx5IGhhdmUgbm8gcHJvdmlzaW9uIGZvciB0aGF0LiBIZW5jZSB3aHkgd2UgY2FuJ3QK
c3VwcG9ydCB0aGlzIGluIGdlbmVyYWwuCgpUaGFua3MsIERhbmllbAotLSAKRGFuaWVsIFZldHRl
cgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KKzQxICgwKSA3OSAzNjUgNTcg
NDggLSBodHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
