Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA193AC715
	for <lists+dri-devel@lfdr.de>; Sat,  7 Sep 2019 16:58:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3339789D86;
	Sat,  7 Sep 2019 14:58:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBB2089D86;
 Sat,  7 Sep 2019 14:58:17 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id l16so9347833wrv.12;
 Sat, 07 Sep 2019 07:58:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=1COcKaS2HXJAJL3v76zzn2hj7Bwkz387tvnsFY+Qqwo=;
 b=kJ+pGmYaaUsOaPWr82MbcJ6anycmZ+A0ubzV1E5MhWXxS9szpu6ZcR8WfRcMwzjDRP
 wDugGR/nJdlInmw2J4Y3Z8M1n/U0Inj5ju5ALQueW+N2Xu1UDeWNcneaLuxiFjBguZng
 JRyCmY1uduEZ+MyzN54iuPH1Ao5H94Tz1/+YJOFl8EwN2wtZw3BWOoMNjAkGJgstQWv0
 NS0SVAiS8FvTunqE3AbzbDnv+Xq1+gWtgVB6J9wiONfY9OCV4RK0WRbCxAYqIUy7id+V
 7J1L77XVhUnn84m0x2ig33640mGSLy5XMDUoGFCJHTiD/Qx6ooKa3zH82QfUTLZLsAkD
 GWIQ==
X-Gm-Message-State: APjAAAVJr6y3Z5hL3TbbDYUTcqDS+zoIg3FbOUz+QUYYPwU6+Lv1qrGJ
 BclY+zf7hqZQHDfqoepgPucBf1QuZuNUbKrMq7M=
X-Google-Smtp-Source: APXvYqzSXDuicK9cIB3YHlgQmu0ZhC7GmzlZl5Qjwb/WQCt4v0+9tJb5jpYKC073HCxRSWvKDYp3DpEEhmnzeKDshIA=
X-Received: by 2002:adf:e286:: with SMTP id v6mr11989190wri.4.1567868296438;
 Sat, 07 Sep 2019 07:58:16 -0700 (PDT)
MIME-Version: 1.0
References: <20190903162519.7136-1-sashal@kernel.org>
 <20190903162519.7136-44-sashal@kernel.org>
 <7957107d-634f-4771-327e-99fdd5e6474e@daenzer.net>
 <20190903170347.GA24357@kroah.com> <20190903200139.GJ5281@sasha-vm>
 <CAKMK7uFpBnkF4xABdkDMZ8TYhL4jg6ZuGyHGyVeBxc9rkyUtXQ@mail.gmail.com>
In-Reply-To: <CAKMK7uFpBnkF4xABdkDMZ8TYhL4jg6ZuGyHGyVeBxc9rkyUtXQ@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Sat, 7 Sep 2019 10:58:03 -0400
Message-ID: <CADnq5_Mfee4xmzMJ-Hmw251QCMfabWPKd8PX+o70D97qdCDJ8g@mail.gmail.com>
Subject: Re: [PATCH AUTOSEL 4.19 044/167] drm/amdgpu: validate user pitch
 alignment
To: Daniel Vetter <daniel@ffwll.ch>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=1COcKaS2HXJAJL3v76zzn2hj7Bwkz387tvnsFY+Qqwo=;
 b=KniegP04d/AhcqE+5LUIynxWrj4CHnLgNRFGgR7j8m829cSrKRqZLjBci1iMhrN9+x
 cqyDDhNpm9roTgyItEoJBj9jYmhcfmOiEyJecJy+xX17N141k3tCye93e+hJxq2oXIDB
 2x2zNGykFoX/BoI0c03XYb1SW0e2rtEpH2DysWWXHRAgWNMQz7SLWGUisP3CVuaoBXJk
 hoNFQ2uHsjflydICv0dD6BWPs46wkgceQ9aSvnBXiTjZ/E1aAz0wzza4n/sDf/D3+icV
 6KW8/8E0Wg/nkvsmHWe0k2DE4bzBIRAbzjsS5SLleqiJXKabVZqL4pFk1s9IvWhS8sqE
 RrpA==
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
Cc: Sasha Levin <sashal@kernel.org>, Yu Zhao <yuzhao@google.com>,
 Dave Airlie <airlied@linux.ie>, Greg KH <gregkh@linuxfoundation.org>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, stable <stable@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBTZXAgMywgMjAxOSBhdCA0OjE2IFBNIERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZnds
bC5jaD4gd3JvdGU6Cj4KPiBPbiBUdWUsIFNlcCAzLCAyMDE5IGF0IDEwOjAxIFBNIFNhc2hhIExl
dmluIDxzYXNoYWxAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPgo+ID4gT24gVHVlLCBTZXAgMDMsIDIw
MTkgYXQgMDc6MDM6NDdQTSArMDIwMCwgR3JlZyBLSCB3cm90ZToKPiA+ID5PbiBUdWUsIFNlcCAw
MywgMjAxOSBhdCAwNjo0MDo0M1BNICswMjAwLCBNaWNoZWwgRMOkbnplciB3cm90ZToKPiA+ID4+
IE9uIDIwMTktMDktMDMgNjoyMyBwLm0uLCBTYXNoYSBMZXZpbiB3cm90ZToKPiA+ID4+ID4gRnJv
bTogWXUgWmhhbyA8eXV6aGFvQGdvb2dsZS5jb20+Cj4gPiA+PiA+Cj4gPiA+PiA+IFsgVXBzdHJl
YW0gY29tbWl0IDg5ZjIzYjZlZmVmNTU0NzY2MTc3YmY1MWFhNzU0YmNlMTRjM2U3ZGEgXQo+ID4g
Pj4KPiA+ID4+IEhvbGQgeW91ciBob3JzZXMhCj4gPiA+Pgo+ID4gPj4gVGhpcyBjb21taXQgYW5k
IGM0YTMyYjI2NmRhN2JiNzAyZTYwMzgxY2EwYzM1ZWFkZGJjODlhNmMgaGFkIHRvIGJlCj4gPiA+
PiByZXZlcnRlZCwgYXMgdGhleSBjYXVzZWQgcmVncmVzc2lvbnMuIFNlZSBjb21taXRzCj4gPiA+
PiAyNWVjNDI5ZTg2YmI3OTBlNDAzODdhNTUwZjA1MDFkMGFjNTVhNDdjICYKPiA+ID4+IDkyYjA3
MzBlYWYyZDU0OWZkZmIxMGVjYzhiNzFmMzRiOWY0NzJjMTIgLgo+ID4gPj4KPiA+ID4+Cj4gPiA+
PiBUaGlzIGlzbid0IGJvbHN0ZXJpbmcgY29uZmlkZW5jZSBpbiBob3cgdGhlc2UgcGF0Y2hlcyBh
cmUgc2VsZWN0ZWQuLi4KPiA+ID4KPiA+ID5UaGUgcGF0Y2ggX2l0c2VsZl8gc2FpZCB0byBiZSBi
YWNrcG9ydGVkIHRvIHRoZSBzdGFibGUgdHJlZXMgZnJvbSA0LjIKPiA+ID5hbmQgbmV3ZXIuICBX
aHkgd291bGRuJ3Qgd2UgYmUgY29uZmlkZW50IGluIGRvaW5nIHRoaXM/Cj4gPiA+Cj4gPiA+SWYg
dGhlIHBhdGNoIGRvZXNuJ3Qgd2FudCB0byBiZSBiYWNrcG9ydGVkLCB0aGVuIGRvIG5vdCBhZGQg
dGhlIGNjOgo+ID4gPnN0YWJsZSBsaW5lIHRvIGl0Li4uCj4gPgo+ID4gVGhpcyBwYXRjaCB3YXMg
cGlja2VkIGJlY2F1c2UgaXQgaGFzIGEgc3RhYmxlIHRhZywgd2hpY2ggeW91IHByZXN1bWFibHkK
PiA+IHNhdyBhcyB5b3VyIFJldmlld2VkLWJ5IHRhZyBpcyBpbiB0aGUgcGF0Y2guIFRoaXMgaXMg
d2h5IGl0IHdhcwo+ID4gYmFja3BvcnRlZDsgaXQgZG9lc24ndCB0YWtlIEFJIHRvIGJhY2twb3J0
IHBhdGNoZXMgdGFnZ2VkIGZvciBzdGFibGUuLi4KPiA+Cj4gPiBUaGUgcmV2ZXJ0IG9mIHRoaXMg
cGF0Y2gsIGhvd2V2ZXI6Cj4gPgo+ID4gIDEuIERpZG4ndCBoYXZlIGEgc3RhYmxlIHRhZy4KPiA+
ICAyLiBEaWRuJ3QgaGF2ZSBhICJGaXhlczoiIHRhZy4KPiA+ICAzLiBEaWRuJ3QgaGF2ZSB0aGUg
dXN1YWwgInRoZSByZXZlcnRzIGNvbW1pdCAuLi4iIHN0cmluZyBhZGRlZCBieSBnaXQKPiA+ICB3
aGVuIG9uZSBkb2VzIGEgcmV2ZXJ0Lgo+ID4KPiA+IFdoaWNoIGlzIHdoeSB3ZSBzdGlsbCBraWNr
IHBhdGNoZXMgZm9yIHJldmlldywgZXZlbiB0aG91Z2ggdGhleSBoYWQgYQo+ID4gc3RhYmxlIHRh
ZywganVzdCBzbyBwZW9wbGUgY291bGQgdGFrZSBhIGxvb2sgYW5kIGNvbmZpcm0gd2UncmUgbm90
Cj4gPiBtaXNzaW5nIGFueXRoaW5nIC0gbGlrZSB3ZSBkaWQgaGVyZS4KPiA+Cj4gPiBJJ20gbm90
IHN1cmUgd2hhdCB5b3UgZXhwZWN0ZWQgbWUgdG8gZG8gZGlmZmVyZW50bHkgaGVyZS4KPgo+IFll
YWggdGhpcyBsb29rcyBsaWtlIGZhaWwgb24gdGhlIHJldmVydCBzaWRlLCB0aGV5IG5lZWQgdG8g
cmVmZXJlbmNlCj4gdGhlIHJldmVydGVkIGNvbW1pdCBzb21laG93IC4uLgo+Cj4gQWxleCwgd2h5
IGdvdCB0aGlzIGRyb3BwZWQ/IElzIHRoaXMgbW9yZSBmYWxsb3V0IGZyb20gdGhlIGJhY2smZm9y
dGgKPiBzaHVmZmxpbmcgeW91J3JlIGRvaW5nIGJldHdlZW4geW91ciBpbnRlcm5hbCBicmFuY2hl
cyBiZWhpbmQgdGhlCj4gZmlyZXdhbGwsIGFuZCB0aGUgcHVibGljIGhpc3Rvcnk/CgpUaGUgYmVo
aW5kIHRoZSBmaXJld2FsbCBjb21tZW50cyBhcmUgbm90IHJlYWxseSBoZWxwZnVsLiAgVGhlcmUg
YXJlbid0CmFueSAiYmVoaW5kIHRoZSBmaXJld2FsbCIgdHJlZXMuICBFdmVyeXRoaW5nIGlzIG1p
cnJvcmVkIGluIHB1YmxpYy4KWWVzIGl0IGlzIGFubm95aW5nIHRoYXQgd2UgZG9uJ3QgaGF2ZSBh
IGRpcmVjdCBjb21taXR0ZXIgdHJlZSwgYnV0IHRoZQpvbmx5IHNodWZmbGluZyBpcyBiZXR3ZWVu
IHB1YmxpYyB0cmVlcy4gIFRoZSBwcm9ibGVtIGlzIDkwJSBvZiBvdXIKY3VzdG9tZXJzIHdhbnQg
cGFja2FnZWQgb3V0IG9mIHRyZWUgZHJpdmVycyByYXRoZXIgdGhhbiBpbiB0cmVlCmRyaXZlcnMg
YmVjYXVzZSB0aGV5IGFyZSB1c2luZyBhbiBvbGQgZGlzdHJvIG9yIGEgY3VzdG9tIGRpc3RybyBv
cgpzb21ldGhpbmcgZWxzZSBzbyB3ZSBoYXZlIHRvIGRvIHRoaXMgZGFuY2UuICBJIHJlYWxpemUg
dGhlcmUgYXJlIG90aGVyCmRhbmNlcyB3ZSBjb3VsZCBkbyB0byBzb2x2ZSB0aGlzIHByb2JsZW0s
IGJ1dCB0aGV5IGFsbCBoYXZlIHRoZWlyIG93bgpzZXQgb2YgY29zdHMgYW5kIHRoaXMgaXMgd2hh
dCB3ZSBoYXZlIG5vdy4gIFRoZSBwYXRjaCBzaHVmZmxpbmcKZG9lc24ndCBoZWxwLCBidXQgcmVn
YXJkbGVzcywgdGhlIHNhbWUgdGhpbmcgY291bGQgaGFwcGVuIGV2ZW4gd2l0aCBhCmRpcmVjdCBj
b21taXR0ZXIgdHJlZSBpZiBzb21lb25lIG1pc3NlZCB0aGUgdGFnIHdoZW4gY29tbWl0dGluZy4K
CkFsZXgKCj4KPiBBbHNvIGFkZGluZyBEYXZlIEFpcmxpZS4KPiAtRGFuaWVsCj4gLS0KPiBEYW5p
ZWwgVmV0dGVyCj4gU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCj4gKzQxICgw
KSA3OSAzNjUgNTcgNDggLSBodHRwOi8vYmxvZy5mZndsbC5jaAo+IF9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+
IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbApfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
