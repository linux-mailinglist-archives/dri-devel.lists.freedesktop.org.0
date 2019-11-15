Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05E30FD89B
	for <lists+dri-devel@lfdr.de>; Fri, 15 Nov 2019 10:18:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB9D86E1D5;
	Fri, 15 Nov 2019 09:18:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C94FD6E193
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Nov 2019 09:18:38 +0000 (UTC)
Received: by mail-ot1-x342.google.com with SMTP id u13so7471845ote.0
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Nov 2019 01:18:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=w8wP0ZY9LCngCsG6lYOgpTy0umUPPDlr5BYzOsq44s8=;
 b=XgQHZoRQZzFuTAe+4JsGlzdmwcMCzR1IPAQ+fpvzZyc74uvzoMjqodw+BTqAlBLvPI
 p9MMymn+Y6a5kIfKTLrLsDRHelr0Ys3PnwvNZ97CLXult/0/F0z9E6CaxK17Htgle3eO
 G2d0VpnkuIzPU1Kk6H3jLmlGu+ikLfpCPDAkvG/jNI7/Ase3xp6yUbLkHLaV6jR9/5YN
 HjsCc/ceDw64WvHmRF/tdW4DWGL5siS7BKm8aLi0uhgiyH6IgCX0VLmW2iQKwPJMXrLQ
 dfN5edNI4fif1L4OEvXdR5ji8PfvCypXnaSPSdqEBHmnMTsge4IypNU9jjwFYqU7Ywie
 0xuQ==
X-Gm-Message-State: APjAAAUT+840sLc+X51NTXJMe5fu39ygj1MgTCLf4vOagCPVu980P5fY
 4QgIFV3Zz5ixrcVoRGcDPsfbZ8rMWiwuYI4gAtnZWw==
X-Google-Smtp-Source: APXvYqy60/UKaHMf27LCQARYfCnt4I0as99LvUCG72zhU3Rs2wkkjNPfV47AMDrT5A4FBG2mBeTQiZH95rLmg+6eeHs=
X-Received: by 2002:a9d:4c15:: with SMTP id l21mr11021821otf.204.1573809518108; 
 Fri, 15 Nov 2019 01:18:38 -0800 (PST)
MIME-Version: 1.0
References: <20191114204413.457504-1-chris@chris-wilson.co.uk>
 <20191115100421.22fe2c1a@endymion>
In-Reply-To: <20191115100421.22fe2c1a@endymion>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Fri, 15 Nov 2019 10:18:26 +0100
Message-ID: <CAKMK7uHp0LnTVD-_+ZktEkzxqgTUtXvCy+SbneGnnKOqYV+Udg@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH] drm/amdgpu/dm: Do not throw an error for a
 display with no audio
To: Jean Delvare <jdelvare@suse.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=w8wP0ZY9LCngCsG6lYOgpTy0umUPPDlr5BYzOsq44s8=;
 b=TU5Pk8MAXy9y1beHaWcd1KPp6t0tO9XU8B7F9ACg6H+WTw/tjSVkPyt0EHX5MC9Nw+
 0gcBA8J7Zj8uy33tKEwbOdM6EFKsqpVcEeo/8EeTfHMNU+ueii/5vEv5BcoBJJ6f1rTL
 hMBPRq9qGxrCZ42T2bMq1AxcP8+lhpcq2FCP4=
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBOb3YgMTUsIDIwMTkgYXQgMTA6MDQgQU0gSmVhbiBEZWx2YXJlIDxqZGVsdmFyZUBz
dXNlLmRlPiB3cm90ZToKPgo+IEhpIENocmlzLAo+Cj4gT24gVGh1LCAxNCBOb3YgMjAxOSAyMDo0
NDoxMyArMDAwMCwgQ2hyaXMgV2lsc29uIHdyb3RlOgo+ID4gQW4gb2xkIGRpc3BsYXkgd2l0aCBu
byBhdWRpbyBtYXkgbm90IGhhdmUgYW4gRURJRCB3aXRoIGEgQ0VBIGJsb2NrLCBvcgo+ID4gaXQg
bWF5IHNpbXBseSBiZSB0b28gb2xkIHRvIHN1cHBvcnQgYXVkaW8uIFRoaXMgaXMgbm90IGEgZHJp
dmVyIGVycm9yLAo+ID4gc28gZG9uJ3QgZmxhZyBpdCBhcyBzdWNoLgo+ID4KPiA+IEJ1Z3ppbGxh
OiBodHRwczovL2J1Z3MuZnJlZWRlc2t0b3Aub3JnL3Nob3dfYnVnLmNnaT9pZD0xMTIxNDAKPiA+
IFJlZmVyZW5jZXM6IGFlMmEzNDk1OTczZSAoImRybS9hbWQ6IGJlIHF1aWV0IHdoZW4gbm8gU0FE
IGJsb2NrIGlzIGZvdW5kIikKPiA+IFNpZ25lZC1vZmYtYnk6IENocmlzIFdpbHNvbiA8Y2hyaXNA
Y2hyaXMtd2lsc29uLmNvLnVrPgo+ID4gQ2M6IEhhcnJ5IFdlbnRsYW5kIDxoYXJyeS53ZW50bGFu
ZEBhbWQuY29tPgo+ID4gQ2M6IEplYW4gRGVsdmFyZSA8amRlbHZhcmVAc3VzZS5kZT4KPiA+IENj
OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Cj4gPiAtLS0KPiA+ICBk
cml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9oZWxwZXJzLmMg
fCAyIC0tCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDIgZGVsZXRpb25zKC0pCj4gPgo+ID4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtX2hl
bHBlcnMuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2Rt
X2hlbHBlcnMuYwo+ID4gaW5kZXggMTFlNTc4NGFhNjJhLi4wNDgwOGRiZWNhYjMgMTAwNjQ0Cj4g
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9o
ZWxwZXJzLmMKPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0v
YW1kZ3B1X2RtX2hlbHBlcnMuYwo+ID4gQEAgLTk3LDggKzk3LDYgQEAgZW51bSBkY19lZGlkX3N0
YXR1cyBkbV9oZWxwZXJzX3BhcnNlX2VkaWRfY2FwcygKPiA+ICAgICAgICAgICAgICAgICAgICAg
ICAoc3RydWN0IGVkaWQgKikgZWRpZC0+cmF3X2VkaWQpOwo+ID4KPiA+ICAgICAgIHNhZF9jb3Vu
dCA9IGRybV9lZGlkX3RvX3NhZCgoc3RydWN0IGVkaWQgKikgZWRpZC0+cmF3X2VkaWQsICZzYWRz
KTsKPiA+IC0gICAgIGlmIChzYWRfY291bnQgPCAwKQo+ID4gLSAgICAgICAgICAgICBEUk1fRVJS
T1IoIkNvdWxkbid0IHJlYWQgU0FEczogJWRcbiIsIHNhZF9jb3VudCk7Cj4gPiAgICAgICBpZiAo
c2FkX2NvdW50IDw9IDApCj4gPiAgICAgICAgICAgICAgIHJldHVybiByZXN1bHQ7Cj4gPgo+Cj4g
SSBzdGlsbCBiZWxpZXZlIHRoYXQgbXkgYXBwcm9hY2ggd2FzIGEgYmV0dGVyIHdheSB0byBzb2x2
ZSB0aGlzIHByb2JsZW06Cj4KPiBodHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvcGF0
Y2gvMzI5MDY2Lwo+Cj4gWW91ciBhcHByb2FjaCB3b3VsZCBoYXZlIHRvIGJlIGFwcGxpZWQgdG8g
YWxsIGluZGl2aWR1YWwgZHJpdmVycyAoYWxsCj4gY2FsbGVycyBvZiBkcm1fZWRpZF90b19zYWQp
LiBJdCBhbHNvIHByZXZlbnRzIHJlcG9ydGluZyBhY3R1YWwgZXJyb3JzLgo+Cj4gU2hvdWxkIEkg
cmVzZW5kIG15IHBhdGNoPwoKSSB0aGluayB3ZSBjYW4gZG8gYm90aCwganVzdCBhc2sgVmlsbGUg
dG8gYXBwbHkgdGhlIHBhdGNoIGZvciB5b3UgKGhlCmhhcyBjb21taXQgcmlnaHRzIHRvIGRybS1t
aXNjKS4gT3IgcmVzZW5kIGFuZCB0aGVuIHBpbmcgVmlsbGUgb24gaXJjLgotRGFuaWVsCgo+Cj4g
LS0KPiBKZWFuIERlbHZhcmUKPiBTVVNFIEwzIFN1cHBvcnQKPiBfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IEludGVsLWdmeCBtYWlsaW5nIGxpc3QKPiBJ
bnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1nZngKCgoKLS0gCkRhbmllbCBWZXR0ZXIKU29m
dHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCis0MSAoMCkgNzkgMzY1IDU3IDQ4IC0g
aHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
