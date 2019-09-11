Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AA1EB077A
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2019 06:13:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA8B16EB89;
	Thu, 12 Sep 2019 04:12:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
 [209.85.167.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32F656E02C
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Sep 2019 19:35:15 +0000 (UTC)
Received: by mail-oi1-f193.google.com with SMTP id w17so1921399oiw.8
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Sep 2019 12:35:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=penkjc+LnYL0IVOn0C5YqiNfiHGL74bK4bzlXB2bL6U=;
 b=BuQsheR1ZvsjrYudnpNTLWvtM/nuM7NBrP9RLOawof8pt+Lg7yD0n/TKrKtTC11cb+
 Jlha3d8d+pdkkeLa5mOGJE7kjeKCT/UwAdvjzGfPAVUdf2qkgiHq7pBaxnw1MB5+huX3
 +R7QiJJnpovLKvVMfsmXtPzVx4Wp8OLBj6eOb4AhaFocNrGpqVA8tYLTZXreb985CXcO
 DTlccWSm3M5A3DYJXXdNVbIvQtg9ngvOaYz3TwYNJYbVkc0KoPIgSZSaoQ61OGaiuEz5
 tMnRPssakEfA3jjpc3Rs5F5dBAONvXaiwPjP1G19PM/sPGoA9lJ/JXpDYaDeZF4YO8tK
 X2YA==
X-Gm-Message-State: APjAAAVx0fmioa9B+Ozwix0eUractVe5l59fVESGY3pKP5y4jjQv4icw
 qKvuHgPDORlvMm9Ory+WulAcOFUnEb3ojYRmK4A=
X-Google-Smtp-Source: APXvYqyJdRnqC2XFz9KVuyV7Z2Tg3fGD1B7L/xryD3+0MqDbsyKiCQF3MfIw1ksiQ17evudnCYwQkiCFnvpRB59HZWk=
X-Received: by 2002:aca:f305:: with SMTP id r5mr5436595oih.131.1568230514186; 
 Wed, 11 Sep 2019 12:35:14 -0700 (PDT)
MIME-Version: 1.0
References: <20190906135436.10622-1-jacopo+renesas@jmondi.org>
 <20190906135436.10622-10-jacopo+renesas@jmondi.org>
 <49012496-1a6e-d62c-2882-45ed8aeb88f7@ideasonboard.com>
In-Reply-To: <49012496-1a6e-d62c-2882-45ed8aeb88f7@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 11 Sep 2019 21:35:02 +0200
Message-ID: <CAMuHMdVfgsUVbsyH=Q9FGU_auLapUS-uTGgPDYzeX4wuXNd5cA@mail.gmail.com>
Subject: Re: [PATCH v4 9/9] arm64: dts: renesas: Add CMM units to Gen3 SoCs
To: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Jacopo Mondi <jacopo+renesas@jmondi.org>
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
Cc: muroya@ksk.co.jp, VenkataRajesh.Kalakodima@in.bosch.com,
 David Airlie <airlied@linux.ie>, Koji Matsuoka <koji.matsuoka.xm@renesas.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Simon Horman <horms@verge.net.au>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Harsha.ManjulaMallikarjun@in.bosch.com, Ulrich Hecht <uli+renesas@fpond.eu>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgS2llcmFuLCBKYWNvcG8sCgpPbiBXZWQsIFNlcCAxMSwgMjAxOSBhdCA4OjE2IFBNIEtpZXJh
biBCaW5naGFtCjxraWVyYW4uYmluZ2hhbStyZW5lc2FzQGlkZWFzb25ib2FyZC5jb20+IHdyb3Rl
Ogo+IE9uIDA2LzA5LzIwMTkgMTQ6NTQsIEphY29wbyBNb25kaSB3cm90ZToKPiA+IEFkZCBDTU0g
dW5pdHMgdG8gUmVuZXNhcyBSLUNhciBHZW4zIFNvQyB0aGF0IHN1cHBvcnQgaXQsIGFuZCByZWZl
cmVuY2UgdGhlbQo+ID4gZnJvbSB0aGUgRGlzcGxheSBVbml0IHRoZXkgYXJlIGNvbm5lY3RlZCB0
by4KPiA+Cj4gPiBTb3J0IHRoZSAndnNwcycgYW5kICdyZW5lc2FzLGNtbScgZW50cmllcyBpbiB0
aGUgRFUgdW5pdCBjb25zaXN0ZW50bHkKPiA+IGluIGFsbCB0aGUgaW52b2x2ZWQgRFRTLgo+Cj4g
SSB0aGluayBpZiB5b3UgY2hvc2UgdGhlIG9yZGVyaW5nIGluIHRoZSByOGE3Nzk1LCB0aGVuIHlv
dSBvbmx5IGhhdmUgdG8KPiBhZGp1c3QvY29ycmVjdCB0aGUgb3JkZXJpbmcgaW4gdGhlIHI4YTc3
OTYgYW5kIHI4YTc3OTY1IC4uLgo+Cj4gRXNwZWNpYWxseSBhcyB5b3UgaGF2ZW4ndCBjaGFuZ2Vk
IHRoZSBvcmRlcmluZyBvZiByOGE3Nzk3MCwgYW5kIHI4YTc3OTgwCj4gd2hpY2ggaGF2ZSB0aGUg
c3RhdHVzIGFmdGVyIHRoZSB2c3BzIGVudHJ5Lgo+Cj4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBK
YWNvcG8gTW9uZGkgPGphY29wbytyZW5lc2FzQGptb25kaS5vcmc+Cgo+ID4gLS0tIGEvYXJjaC9h
cm02NC9ib290L2R0cy9yZW5lc2FzL3I4YTc3OTUuZHRzaQo+ID4gKysrIGIvYXJjaC9hcm02NC9i
b290L2R0cy9yZW5lc2FzL3I4YTc3OTUuZHRzaQoKPiA+IEBAIC0zMTQyLDkgKzMxNzgsMTEgQEAK
PiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8JmNwZyBDUEdfTU9EIDcyMj4sCj4g
PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPCZjcGcgQ1BHX01PRCA3MjE+Owo+ID4g
ICAgICAgICAgICAgICAgICAgICAgIGNsb2NrLW5hbWVzID0gImR1LjAiLCAiZHUuMSIsICJkdS4y
IiwgImR1LjMiOwo+ID4gLSAgICAgICAgICAgICAgICAgICAgIHZzcHMgPSA8JnZzcGQwIDA+LCA8
JnZzcGQxIDA+LCA8JnZzcGQyIDA+LCA8JnZzcGQwIDE+Owo+ID4gICAgICAgICAgICAgICAgICAg
ICAgIHN0YXR1cyA9ICJkaXNhYmxlZCI7Cj4KPiBJJ20gbm90IHN1cmUgdGhlIHZzcHMgc2hvdWxk
IGJlIGJlbG93IHRoZSBzdGF0dXMgPSBkaXNhYmxlZCBsaW5lLgo+Cj4gSSdkIGhhdmUgdGhpcyBh
czoKPgo+ICAgICAgICAgY2xvY2stbmFtZXMuLi4KPiAgICAgICAgIHZzcHMuLi4KPiAgICAgICAg
IHJlbmVzYXMsY21tcy4uLgo+ICAgICAgICAgICAgICAgICA8YmxhbmsgbGluZT4KPiAgICAgICAg
IHN0YXR1cy4uLgo+ICAgICAgICAgICAgICAgICA8YmxhbmsgbGluZT4KPiAgICAgICAgIHBvcnRz
Li4uCgpJbmRlZWQuCgpBbmQgYmV0dGVyIHdyaXRlICJwb3J0cyB7IC4uLiB9Iiwgc28gaXQncyBj
bGVhciB0aGlzIGlzIGEgc3Vibm9kZS4KCj4KPiA+Cj4gPiArICAgICAgICAgICAgICAgICAgICAg
dnNwcyA9IDwmdnNwZDAgMD4sIDwmdnNwZDEgMD4sIDwmdnNwZDIgMD4sIDwmdnNwZDAgMT47CgpB
bmQgdGhlIGFib3ZlIHdpbGwgYmVjb21lICJyZW5lc2FzLHZzcHMiLCBuZWVkaW5nIGFub3RoZXIg
cmVvcmRlcmluZz8KCj4gPiArICAgICAgICAgICAgICAgICAgICAgcmVuZXNhcyxjbW1zID0gPCZj
bW0wICZjbW0xICZjbW0yICZjbW0zPjsKPgo+IEkgdGhpbmsgdGhlc2Ugc2hvdWxkIGJlIHNlcGFy
YXRlZCBieSBjb21tYSdzIHRvIHNob3cgdGhleSBhcmUgc2VwYXJhdGUKPiByZWZlcmVuY2VzLCBv
ciByZWZlcmVuY2VzIHRvIHNlcGFyYXRlIHBoYW5kbGVzIG9yIHN1Y2guCgpZZXAsIGxvb2tzIGJl
dHRlciwgYW5kIG1ha2VzIHRoZSBncm91cGluZyBjbGVhci4KCj4gVGhlIG9ubHkgcHJlY2VkZW5j
ZSBJIGNvdWxkIGZpbmQgd2FzIGluIHBtdV9hNTM6Cj4KPiAgICAgICAgICAgaW50ZXJydXB0LWFm
ZmluaXR5ID0gPCZhNTNfMD4sIDwmYTUzXzE+LCA8JmE1M18yPiwgPCZhNTNfMz47CgpUaGF0J3Mg
YmVjYXVzZSBtb3N0IG90aGVyIHBoYW5kbGUgc3R1ZmYgaGFzICM8Zm9vPi1jZWxscyBhcyBub24t
emVyby4KCldlIGRvIGhhdmUKCiAgICBjbG9ja3MgPSAuLi4gPCZhdWRpb19jbGtfYT4sIDwmYXVk
aW9fY2xrX2I+LCA8JmF1ZGlvX2Nsa19jPjsKCkdye29ldGplLGVldGluZ31zLAoKICAgICAgICAg
ICAgICAgICAgICAgICAgR2VlcnQKCi0tIApHZWVydCBVeXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBs
b3RzIG9mIExpbnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxpbnV4LW02OGsub3JnCgpJbiBwZXJz
b25hbCBjb252ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15c2VsZiBh
IGhhY2tlci4gQnV0CndoZW4gSSdtIHRhbGtpbmcgdG8gam91cm5hbGlzdHMgSSBqdXN0IHNheSAi
cHJvZ3JhbW1lciIgb3Igc29tZXRoaW5nIGxpa2UgdGhhdC4KICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAtLSBMaW51cyBUb3J2YWxkcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
