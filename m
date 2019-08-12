Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23C928E6BA
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2019 10:36:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 045436E91D;
	Thu, 15 Aug 2019 08:35:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E56FB6E43C
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2019 03:22:34 +0000 (UTC)
Received: by mail-pl1-x644.google.com with SMTP id g4so854761plo.3
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Aug 2019 20:22:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=C0f2/EXB7NqcYJjjPv7AE+EoAfNRVdW1uMm9Rfr1wmE=;
 b=DjUqTMzlpOSpZ5fHYUiYKeG48Fl25geFgGGDki8ZCGtilVmnR/aFLsA1fyLtKgj8+R
 IaTzLRKlrHMleaH77vBNdhUF/19NM3RB29VVnBE7NUVd0xf+g9P80c4ArhSJDTWAsouX
 h04VrQU4w7RJwW7oQx/v2m/0o0nlETlLidBvfKCJkQGslHjqksZpgQokEDGEW/EZ29m2
 HMTsHEITxxwgaEuCoglv+O1WEg7t6tHiD5AhoN6FfjIiZH1w7ouRK6Z/eM/o40cXrBrC
 IGiTuV6YNW+KI1vKkM/pJbx1C/Ud/JRN4PrfrVQwP5WHSaTsQ1Qbs1/TEyxyOkb3Dt/8
 burA==
X-Gm-Message-State: APjAAAV3AgNWMQQAmvC+Qr/0kitt13fLGydxQuWN+3MldL2giekYPPR/
 SrNqsgcOpGFzbf0PsRHb7sMhh7X0ZJbgKS8tZTk=
X-Google-Smtp-Source: APXvYqxg3wPeEx6umxyPlZSRFd/8gUSnH97HlUrWu6es4rjpJbFzCBwyDBMIS8qBzq1ffh0L3eku7prLhdt2HPxuO/Y=
X-Received: by 2002:a17:902:4683:: with SMTP id
 p3mr28778913pld.31.1565580154512; 
 Sun, 11 Aug 2019 20:22:34 -0700 (PDT)
MIME-Version: 1.0
References: <CA+quO7LqwH4UTZ=Azqo96rkZX4mCvMaJ19TgBQ06=Vdw-Fudqg@mail.gmail.com>
 <20190803143706.GA23157@ravnborg.org>
 <CACvgo50fVLODj0k8twd7tfVnOFv1s_veKxD+=ZGbD9cmNuLFSQ@mail.gmail.com>
In-Reply-To: <CACvgo50fVLODj0k8twd7tfVnOFv1s_veKxD+=ZGbD9cmNuLFSQ@mail.gmail.com>
From: Jerry Han <jerry.han.hq@gmail.com>
Date: Mon, 12 Aug 2019 11:22:23 +0800
Message-ID: <CA+quO7Lsm1qbh+cTbE9buXjk+VRHaGTMh6gTDPu-YqNyoiij+g@mail.gmail.com>
Subject: Re: [PATCH 10/10] [v10] drm/panel: Add Boe Himax8279d MIPI-DSI LCD
 panel
To: Emil Velikov <emil.l.velikov@gmail.com>
X-Mailman-Approved-At: Thu, 15 Aug 2019 08:34:55 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=C0f2/EXB7NqcYJjjPv7AE+EoAfNRVdW1uMm9Rfr1wmE=;
 b=HqNw3R65edioZ9y9tP8IuZvGT3Gm6pmPESN9rneuSJmZqVof79sKl+kt/zz1ZCaM2u
 5+pSHGZhiEZJxm8PYOC4tnGGzLrEpNIXT7LeMLZtI1tPhWgI2E7x+jyRbWV1VyQG0BU4
 HeNBXKtOnjnpuZKuz50+5suAJIVcUCp5Q5UivR7NSsSDbFO8L7GXjo/f7LvVyHA+Z3SV
 H648EDhmU2cwLVNvnTDQqo/rsRjqaHgB96fe00vpbqXyi4gbOwj4rm+TBrqMAXPkmrxn
 oF/xr3Aj9zvtgPnGXEq6I9mafWlRXY3dk/JEc28EDzObcpeIOwnI/xRuaHdVahhbIccY
 6vvA==
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
Cc: Jerry Han <hanxu5@huaqin.corp-partner.google.com>,
 Jitao Shi <jitao.shi@mediatek.com>, Derek Basehore <dbasehore@chromium.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Sam Ravnborg <sam@ravnborg.org>, Rock wang <rock_wang@himax.com.cn>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRW1pbDoKClRoZXNlIGNoYW5nZXMgYXJlIG5vdCBkdWUgdG8gcHJldmlvdXMgYnVncy4KVGhl
IGluaXQgY29kZSBjaGFuZ2VzIGZvciBhIGNvdXBsZSBvZiByZWFzb25zOgpEdXJpbmcgdGhlIGRl
dmVsb3BtZW50IG9mIHRoZSBwcm9qZWN0LAoxOiBTdXBwbGllcnMgb2YgTENEUyBrZWVwIGNoYW5n
aW5nIHRoZSBwcm9jZXNzLCBvcHRpbWl6aW5nIHRoZQpjaXJjdWl0cnksIGFuZCBjaGFuZ2luZyB0
aGUgdmFsdWVzIG9mIGNlcnRhaW4gcmVnaXN0ZXJzLgoyOiBDaGFuZ2luZyBkaXNwbGF5IGVmZmVj
dHMsIHN1Y2ggYXMgY29sb3IgdGVtcGVyYXR1cmUsIHdoaXRlIGJhbGFuY2UsCmdhbW1hIHZhbHVl
cywgd2lsbCBhbHNvIGNoYW5nZSB0aGUgdmFsdWVzIG9mIHNvbWUgcmVnaXN0ZXJzLgozOiA4IGFu
ZCAxMCBpbmNoIGRldmljZXMgYXJlIGRpZmZlcmVudC4gQXMgdGhleSBjb250aW51ZSB0byBvcHRp
bWl6ZQp0aGVpciBpbml0IGNvZGUgdGhlcmUgd2lsbCBiZSBiaWcgZGlmZmVyZW5jZXMuCgpBbmQg
d2UncmUgZ29pbmcgdG8gY29udGludWUgdG8gcHJvdmlkZSBhbiBvcHRpbWl6ZWQgaW5pdCBjb2Rl
LgoKVGhhbmtzLgoKRW1pbCBWZWxpa292IDxlbWlsLmwudmVsaWtvdkBnbWFpbC5jb20+IOS6jjIw
MTnlubQ45pyINeaXpeWRqOS4gCDkuIvljYg2OjE35YaZ6YGT77yaCj4KPiBPbiBTYXQsIDMgQXVn
IDIwMTkgYXQgMTU6MzcsIFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4gd3JvdGU6Cj4g
Pgo+ID4gSGkgSmVycnkuCj4gPgo+ID4gT24gU2F0LCBBdWcgMDMsIDIwMTkgYXQgMTA6NDA6NDRB
TSArMDgwMCwgSmVycnkgSGFuIHdyb3RlOgo+ID4gPiBWMTogaHR0cHM6Ly9wYXRjaHdvcmsuZnJl
ZWRlc2t0b3Aub3JnL3BhdGNoLzI4NzQyNS8KPiA+ID4gVjI6IGh0dHBzOi8vcGF0Y2h3b3JrLmZy
ZWVkZXNrdG9wLm9yZy9wYXRjaC8yODk4NDMvCj4gPiA+IFYzOiBodHRwczovL3BhdGNod29yay5m
cmVlZGVza3RvcC5vcmcvcGF0Y2gvMjkwMzkzLwo+ID4gPiBWNDogaHR0cHM6Ly9wYXRjaHdvcmsu
ZnJlZWRlc2t0b3Aub3JnL3BhdGNoLzI5MDM5Ni8KPiA+ID4gVjU6IGh0dHBzOi8vcGF0Y2h3b3Jr
LmZyZWVkZXNrdG9wLm9yZy9wYXRjaC8yOTExMzEvICAgKG9ubHkgbW9kaWZ5Cj4gPiA+IGNvbW1p
dCBtZXNzYWdlIEFkZGVkIGNoYW5nZWxvZywgbm8gZmlsZXMgbW9kaWZpZWQpCj4gPiA+IFY2OiBo
dHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvcGF0Y2gvMjkxNjUwLwo+ID4gPiBWNzog
aHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3BhdGNoLzI5NDE0MS8KPiA+ID4gVjg6
IGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9wYXRjaC8zMDE5MjUvCj4gPiA+IFY5
OiBodHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvcGF0Y2gvMzIwNTE0Lwo+ID4KPiA+
ID4gRnJvbSA2M2JjYzRmMWU3MjcxM2VjYTE0YzRiMDhlNjJiYzNjMDdlNjc5MDRhIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQo+ID4gPiBGcm9tOiBKZXJyeSBIYW4gPGhhbnh1NUBodWFxaW4uY29y
cC1wYXJ0bmVyLmdvb2dsZS5jb20+Cj4gPiA+IERhdGU6IFRodSwgMSBBdWcgMjAxOSAxNTo1Mjoz
NSArMDgwMAo+ID4gPiBTdWJqZWN0OiBbUEFUQ0ggMDIvMTBdIFt2MiwyLzJdIGRybS9wYW5lbDog
QWRkIEJvZSBIaW1heDgyNzlkIE1JUEktRFNJIExDRAo+ID4gPiAgcGFuZWwKPiA+ID4KPiA+ID4g
U3VwcG9ydCBCb2UgSGltYXg4Mjc5ZCA4LjAiIDEyMDB4MTkyMCBURlQgTENEIHBhbmVsLCBpdCBp
cyBhIE1JUEkgRFNJCj4gPiA+IHBhbmVsLgo+ID4gPgo+ID4gPiBWMjoKPiA+ID4gLSBVc2UgU1BE
WCBpZGVudGlmaWVyIChTYW0pCj4gPiA+IC0gVXNlIG5lY2Vzc2FyeSBoZWFkZXIgZmlsZXMgcmVw
bGFjZSBkcm1QLmggKFNhbSkKPiA+ID4gLSBEZWxldGUgdW5uZWNlc3NhcnkgaGVhZGVyIGZpbGVz
ICNpbmNsdWRlIDxsaW51eC9lcnIuaD4gKFNhbSkKPiA+ID4gLSBTcGVjaWZpZXMgYSBHUElPcyBh
cnJheSB0byBjb250cm9sIHRoZSByZXNldCB0aW1pbmcsCj4gPiA+ICAgICBpbnN0ZWFkIG9mIHJl
YWRpbmcgImRzaS1yZXNldC1zZXF1ZW5jZSIgZGF0YSBmcm9tIERUUyAoU2FtKQo+ID4gPiAtIERl
bGV0ZSBiYWNrbGlnaHRfZGlzYWJsZSgpIGZ1bmN0aW9uIHdoZW4gYWxyZWFkeSBkaXNhYmxlZCAo
U2FtKQo+ID4gPiAtIFVzZSBkZXZtX29mX2ZpbmRfYmFja2xpZ2h0KCkgcmVwbGFjZSBvZl9maW5k
X2JhY2tsaWdodF9ieV9ub2RlKCkKPiA+ID4gICAgIChTYW0pCj4gPiA+IC0gTW92ZSB0aGUgbmVj
ZXNzYXJ5IGRhdGEgaW4gdGhlIERUUyB0byB0aGUgY3VycmVudCBmaWxlLAo+ID4gPiAgICAgbGlr
ZSBwb3JjaCwgZGlzcGxheV9tb2RlIGFuZCBJbml0IGNvZGUgZXRjLiAoU2FtKQo+ID4gPiAtIEFk
ZCBjb21wYXRpYmxlIGRldmljZSAiYm9lLGhpbWF4ODI3OWQxMHAiIChTYW0pCj4gPiA+Cj4gPiA+
IFYxOgo+ID4gPiAtIFN1cHBvcnQgQm9lIEhpbWF4ODI3OWQgOC4wIiAxMjAweDE5MjAgVEZUIExD
RCBwYW5lbCwgaXQgaXMgYSBNSVBJIERTSQo+ID4gPiAgICAgcGFuZWwuCj4gPgo+ID4gU29tZXRo
aW5nIHdlbnQgd3Jvbmcgd2hlbiB5b3UgdHJpZWQgdG8gc3VibWl0IHYxMC4KPiA+IFBsZWFzZSB0
cnkgYWdhaW4uCj4gPgo+IEFwYXJ0IGZyb20gdGhhdCwgc2VlbXMgbGlrZSB0aGUgaW5pdCBzZXF1
ZW5jZSBoYXMgY2hhbmdlZCBkcmFzdGljYWxseS4KPgo+IFdoYXQgaXMgdGhlIHJlYXNvbiBiZWhp
bmQgdGhpcz8gV2FzIHRoZXJlIGEgYnVnIHdpdGggcHJldmlvdXMgcGF0Y2hlcz8KPgo+IEZvciBy
ZWZlcmVuY2UgaW4gdjggdGhlIHNlcXVlbmNlIHdhcyBuZWFybHkgaWRlbnRpY2FsIGZvciA4IGFu
ZCAxMAo+IGluY2ggZGV2aWNlcyAtIDgtMTAgbGluZSBkaWZmZXJlbmNlLgo+IE5vdyB3ZSdyZSBs
b29raW5nIGF0IH4yNTAgLi4uCj4KPiAtRW1pbApfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
