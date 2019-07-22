Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E9A6708D8
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2019 20:47:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0680A89D4B;
	Mon, 22 Jul 2019 18:47:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1797989D4B
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2019 18:47:43 +0000 (UTC)
Received: by mail-ot1-x342.google.com with SMTP id b7so2867097otl.11
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2019 11:47:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aC1MLxLbjDg5tOzPiyVil8Be4/KhIGolhfOdnXDjtBE=;
 b=cmHPJDM8Qz1GoVB4OY0gjveTWn3EGJjkHvnrs1110WtKkaLK/pTU7/Dd039DgQhY4V
 O+pGkrmUrO7HC19WYa37thSBXfIfLBLsncoyjLQVp859M9Bz/eeh6FoYZb16jMU5n0ER
 41AHgGHWb6B9yNsSBiIam9HFiDeDuPsTYocPFI/YEBcjfuz9DCu/Shp7KRkcpfnSUqvc
 8AwTuTr5jB6FqOfL8eJ0esD+8/u4tfd7RYgQlw07Se4Dhpv0Rc9fWVpV7EnGIg3usGwx
 SVaIhsSbWdVcsjYivif5Cfy//tLOfKhZyrHFXy/cffKymmiEhf1ybeZb2uLuef+niZQz
 QD1A==
X-Gm-Message-State: APjAAAVt1ClSvmDNJHirXNzkfPUYe5t/u8IOiYD71rPhWlCUVAH47KE2
 pfZK+pw56i/5mVKtSg/y1cOYFIVFzEMuaD1bHJ0=
X-Google-Smtp-Source: APXvYqz7FTaxBbgoBulSD/5MeRxUZjfIzP2icEYwqRHNrphiJ8v0/gXcEbEuwHUZ6peLJ89JG8ockAPkEj2/P6ileAw=
X-Received: by 2002:a9d:4109:: with SMTP id o9mr29072586ote.353.1563821262309; 
 Mon, 22 Jul 2019 11:47:42 -0700 (PDT)
MIME-Version: 1.0
References: <20190722150414.9F97668B20@verein.lst.de>
In-Reply-To: <20190722150414.9F97668B20@verein.lst.de>
From: Vasily Khoruzhick <anarsoul@gmail.com>
Date: Mon, 22 Jul 2019 11:47:33 -0700
Message-ID: <CA+E=qVdoqkpLvRULOQLLY6heOCNYEizfqBCV4iTrCMEj6HfDZg@mail.gmail.com>
Subject: Re: [PATCH v2 0/7] Add anx6345 DP/eDP bridge for Olimex Teres-I
To: Torsten Duwe <duwe@lst.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=aC1MLxLbjDg5tOzPiyVil8Be4/KhIGolhfOdnXDjtBE=;
 b=a/SPgKgtMHEdYvP1ujLe27UWsqf7cBVVME1tq3pKmJc6b83inBBubiAdSQckX+VKbG
 NMiOeacyFUgN0Qt19RTEwwPT60/w8OyT7FsZutliKE1iXT7iAB5PXEBx7BYKXiNZfH8q
 MF7lGbAelaec9OuYlnC4Mp9B7PfHQpJ7fUA99cfrk5ijZizuyFAhxRAvDekrMOOz3Gen
 7qV5snjmYlHafHWT2AQK/LeRCwUiqhg0Vlar9IN/RRt8Ktr5nA+9wRIxopDqu+I+xDwV
 Jc3FCInW4B1XPn3GIvYd+4BICjqmE09mOcrVpVYrSXl+ID0WjJJqVUA2r0N2FDhpOdQS
 2oGw==
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 devicetree <devicetree@vger.kernel.org>, "Bcc:duwe"@lst.de,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Harald Geyer <harald@ccbib.org>, Sean Paul <seanpaul@chromium.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 arm-linux <linux-arm-kernel@lists.infradead.org>,
 Icenowy Zheng <icenowy@aosc.io>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBKdWwgMjIsIDIwMTkgYXQgODowNCBBTSBUb3JzdGVuIER1d2UgPGR1d2VAbHN0LmRl
PiB3cm90ZToKPgo+IEFOWDYzNDUgTFZUVEwtPmVEUCB2aWRlbyBicmlkZ2UsIGRyaXZlciB3aXRo
IGRldmljZSB0cmVlIGJpbmRpbmdzLgo+Cj4gQ2hhbmdlcyBmcm9tIHYyOgo+Cj4gKiB1c2UgU1BE
WC1JRHMgdGhyb3VnaG91dAo+Cj4gKiByZW1vdmVkIHRoZSBwYW5lbCBvdXRwdXQgYWdhaW4sIGFz
IGl0IHdhcyBub3Qgd2hhdCBNYXhpbWUgaGFkIGluIG1pbmQuCj4gICBBdCBsZWFzdCB0aGUgVGVy
ZXMtSSBkb2VzIHZlcnkgd2VsbCB3aXRob3V0LiBObyBjb25uZWN0b3Igc3BlYywgbm8gInF1aXJr
cyJbMV0sCj4gICBqdXN0IHBsYWluIEVESUQgYXQgd29yay4KCllvdSBzdGlsbCBuZWVkIGEgcGFu
ZWwgdG8gcHV0IGJhY2tsaWdodCBpbiB0aGVyZS4gT3RoZXJ3aXNlIGJhY2tsaWdodAp3aWxsIHN0
YXkgb24gd2hlbiBkaXNwbGF5IGlzIHR1cm5lZCBvZmYuCgo+Cj4gKiBiaW5kaW5nIGNsYXJpZmlj
YXRpb25zIGFuZCBjb3NtZXRpYyBjaGFuZ2VzIGFzIHN1Z2dlc3RlZCBieSBBbmRyemVqCj4KPiBD
aGFuZ2VzIGZyb20gdjE6Cj4KPiAqIGZpeGVkIHVwIGNvcHlyaWdodCBpbmZvcm1hdGlvbi4gTW9z
dCBjb2RlIGNoYW5nZXMgYXJlIG9ubHkgbW92ZXMgYW5kIHRodXMKPiAgIHJldGFpbiBjb3B5cmln
aHQgYW5kIG1vZHVsZSBvd25lcnNoaXAuIEV2ZW4gdGhlIG5ldyBhbmFsb2dpeC1hbng2MzQ1LmMg
b3JpZ2luYXRlcwo+ICAgZnJvbSB0aGUgb2xkIDE0OTUtbGluZSBhbmFsb2dpeC1hbng3OHh4LmMs
IHdpdGggMzA2IGluc2VydGlvbnMgYW5kIDk4NyBkZWxldGlvbnMKPiAgIChpZ25vcmluZyB0aGUg
dHJpdmlhbCBhbng3OHh4IC0+IGFueDYzNDUgcmVwbGFjZW1lbnRzKSAzMDYgbmV3IHZzLiA1MDgg
b2xkLi4uCj4KPiAqIGZpeGVkIGFsbCBtaW5vciBmb3JtYXR0aW5nIGlzc3VlcyBicm91Z2h0IHVw
Cj4KPiAqIG1lcmdlZCBwcmV2aW91c2x5IHNlcGFyYXRlIG5ldyBhbmFsb2dpeF9kcF9pMmMgbW9k
dWxlIGludG8gZXhpc3RpbmcgYW5hbG9naXhfZHAKPgo+ICogc3BsaXQgYWRkaXRpb25hbCBkZWZp
bmVzIGludG8gYSBwcmVwYXJhdG9yeSBwYXRjaAo+Cj4gKiByZW5hbWVkIHRoZSBmYWN0b3JlZC1v
dXQgY29tbW9uIGZ1bmN0aW9ucyBhbnhfYXV4XyogLT4gYW54X2RwX2F1eF8qLCBiZWNhdXNlCj4g
ICBhbnhfLi4uYXV4X3RyYW5zZmVyIHdhcyBleHBvcnRlZCBnbG9iYWxseS4gQmVzaWRlcywgaXQg
aXMgbm93IEdQTC1vbmx5IGV4cG9ydGVkLgo+Cj4gKiBtb3ZlZCBjaGlwIElEIHJlYWQgaW50byBh
IHNlcGFyYXRlIGZ1bmN0aW9uLgo+Cj4gKiBrZWVwIHRoZSBjaGlwIHBvd2VyZWQgYWZ0ZXIgYSBz
dWNjZXNzZnVsIHByb2JlLgo+ICAgKFRoZXJlJ3MgYSBnb29kIGNoYW5jZSB0aGF0IHRoaXMgaXMg
dGhlIG9ubHkgZGlzcGxheSBkdXJpbmcgYm9vdCEpCj4KPiAqIHVwZGF0ZWQgdGhlIGJpbmRpbmcg
ZG9jdW1lbnQ6IExWVFRMIGlucHV0IGlzIG5vdyByZXF1aXJlZCwgb25seSB0aGUgb3V0cHV0IHNp
ZGUKPiAgIGRlc2NyaXB0aW9uIGlzIG9wdGlvbmFsLgo+Cj4gIExhdXJlbnQ6IEkgaGF2ZSBhbHNv
IGxvb2tlZCBpbnRvIHRoZSBkcm1fcGFuZWxfYnJpZGdlIGluZnJhc3RydWN0dXJlLAo+ICBidXQg
aXQncyBub3QgdGhhdCB0cml2aWFsIHRvIGNvbnZlcnQgdGhlc2UgZHJpdmVycyB0byBpdC4KPgo+
IENoYW5nZXMgZnJvbSB0aGUgcmVzcGVjdGl2ZSBwcmV2aW91cyB2ZXJzaW9uczoKPgo+ICogdGhl
IHJlc2V0IHBvbGFyaXR5IGlzIGNvcnJlY3RlZCBpbiBEVCBhbmQgdGhlIGRyaXZlcjsKPiAgIHRo
aW5ncyBzaG91bGQgYmUgY2xlYXJlciBub3cuCj4KPiAqIGFzIHJlcXVlc3RlZCwgYWRkIGEgcGFu
ZWwgKHRoZSBrbm93biBpbm5vbHV4LG4xMTZiZ2UpIGFuZCBjb25uZWN0Cj4gICB0aGUgcG9ydHMu
Cj4KPiAqIHJlbmFtZWQgZHZkZD8/IHRvICotc3VwcGx5IHRvIG1hdGNoIHRoZSBlc3RhYmxpc2hl
ZCBzY2hlbWUKPgo+ICogdHJpdmlhbCB1cGRhdGUgdG8gdGhlICNpbmNsdWRlIGxpc3QsIHRvIG1h
a2UgaXQgY29tcGlsZSBpbiA1LjIKPgo+IC0tLS0tLS0tLS0tLS0tCj4gWzFdIEkgaGVzaXRhdGUg
dG8gYXNzb2NpYXRlIGluZm9ybWF0aW9uIGFib3V0IGEgY29ubmVjdGVkIHBhbmVsIHdpdGggdGhh
dCB0ZXJtLgo+ICAgICBCdXQgc2hvdWxkIGl0IGJlIG5lY2Nlc3NhcnkgZm9yIG1heGltdW0gcG93
ZXIgc2F2aW5nIChlLmcuIHBpbmVib29rcyksCj4gICAgIGl0IHdvdWxkIGJlIGdvb2QgdG8gaGF2
ZSBzb21ldGhpbmcgaGVyZSwgcmVnYXJkbGVzcyBvZiBub21lbmNsYXR1cmUuCj4KPiAgICAgICAg
IFRvcnN0ZW4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
