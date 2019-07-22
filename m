Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E42970570
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2019 18:27:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DADB789D39;
	Mon, 22 Jul 2019 16:27:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x944.google.com (mail-ua1-x944.google.com
 [IPv6:2607:f8b0:4864:20::944])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA13789D58;
 Mon, 22 Jul 2019 16:27:52 +0000 (UTC)
Received: by mail-ua1-x944.google.com with SMTP id c4so15560803uad.1;
 Mon, 22 Jul 2019 09:27:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=183FDYqDmXoe1oFLxj+iURDCwwd7wajjM/6APT/oG3U=;
 b=o5sltlcflWPD0ha4Dzdae3KmoqS/lGmi4sdsg1CE9vRXGdZ4MCEJIbzI5MwbdA5Y12
 yyw6yjMXfgO5fENA/eLJdxUWJfehXX+K7ab2opYnekLUxt1/+6uRlfQ3ECqAecKQwRjZ
 r75hQc/9POTnyfSJa99IbATtwJerWzLW8BsqEW6eMQa5ZbHVRx/SIzF1P+978WDX/n+F
 agxCl8+6BEl9jMt0JDM+V2ew9+Byxls2s3gprbhLZEpV7CkxCOPGVT7sTzF9/hcomaNJ
 UwUzZYhLfCd8R+zAtcwmsLa9PWbT0Jg7mC6z06atWXi+zdjCViV05Hqb2ebJtsD/MWVR
 DPXQ==
X-Gm-Message-State: APjAAAW+s/VT2n8LHfPllDij953+zJMwfUkr62LMFIwk5OdKxbHHLEUq
 I8Nl0VSFdlm1kf/2AWNoASC3NPw092hWf5Davpg=
X-Google-Smtp-Source: APXvYqzhGkKb01VSzRcVqLgcBEZTwpJ3+tGT2K4dsND1dz+uWBm4vggkjxAsFVUSdqVp2xzNgi6r/6qGZL1W/OPJUXY=
X-Received: by 2002:ab0:5973:: with SMTP id o48mr31848009uad.19.1563812871804; 
 Mon, 22 Jul 2019 09:27:51 -0700 (PDT)
MIME-Version: 1.0
References: <20190720084527.12593-1-sam@ravnborg.org>
 <20190720084527.12593-2-sam@ravnborg.org>
 <CACvgo52wD5pMjz4jEFMJXQ3kb-PDOkjyfGHhR5PeAT72otjv1g@mail.gmail.com>
 <20190722161720.GA14638@ravnborg.org>
In-Reply-To: <20190722161720.GA14638@ravnborg.org>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Mon, 22 Jul 2019 17:27:28 +0100
Message-ID: <CACvgo51_T1rcTnK7dYtQVdRTtcEd8am04THidD-CrHwdS3hk9w@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] drm/via: drop use of DRM(READ|WRITE) macros
To: Sam Ravnborg <sam@ravnborg.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=183FDYqDmXoe1oFLxj+iURDCwwd7wajjM/6APT/oG3U=;
 b=C6NG+KO3GFYAVibMBzytfkXMQ8Y/luo/zrlqC6MZ4XkasfgE+uz3lHp2/n+XbYIFhG
 vqQn4S08kBWP+Bct6OgRv/XNHW/hAIIVRA2K2oCosG7JcjAQJTL5EeLHvc0PTDvdaXEX
 dWW3KFVCgWP8kVJIy27ufvzcXllo1wK/nkX0o47G2rUeXgn7Zr1Q3UVcLn8VL92E6cqj
 gdLjiAVWhCm/mbUhE1Kkj7AG5jZjO1lGvo+T8uSaxTyJRxEP0VfrhfcYahobViJSz9ca
 FQjFdR3SFuJfDpDv5oJXyIWHrUOyE+MA45UgKzV0Vgwu+WZlcro1K+LSvKcRTnjYWk81
 WThQ==
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
Cc: Thomas Hellstrom <thellstrom@vmware.com>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 openchrome-devel@lists.freedesktop.org, Kevin Brace <kevinbrace@gmx.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Emil Velikov <emil.velikov@collabora.com>, Ira Weiny <ira.weiny@intel.com>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>,
 Mike Marshall <hubcap@omnibond.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCAyMiBKdWwgMjAxOSBhdCAxNzoxNywgU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcu
b3JnPiB3cm90ZToKPgo+IEhpIEVtaWwuCj4KPiBPbiBNb24sIEp1bCAyMiwgMjAxOSBhdCAwNDoz
ODozOVBNICswMTAwLCBFbWlsIFZlbGlrb3Ygd3JvdGU6Cj4gPiBPbiBTYXQsIDIwIEp1bCAyMDE5
IGF0IDA5OjQ2LCBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+IHdyb3RlOgo+ID4gPgo+
ID4gPiBUaGUgRFJNX1JFQUQsIERSTV9XUklURSBtYWNyb3MgY29tZXMgZnJvbSB0aGUgZGVwcmVj
YXRlZCBkcm1fb3NfbGludXguaAo+ID4gPiBoZWFkZXIgZmlsZS4gUmVtb3ZlIHRoZWlyIHVzZSB0
byByZW1vdmUgdGhpcyBkZXBlbmRlbmN5Lgo+ID4gPgo+ID4gPiBSZXBsYWNlIHRoZSB1c2Ugb2Yg
dGhlIG1hY3JvcyB3aXRoIG9wZW4gY29kZWQgdmFyaWFudHMuCj4gPiA+Cj4gPiA+IFNpZ25lZC1v
ZmYtYnk6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KPiA+ID4gQ2M6IEtldmluIEJy
YWNlIDxrZXZpbmJyYWNlQGdteC5jb20+Cj4gPiA+IENjOiBUaG9tYXMgSGVsbHN0cm9tIDx0aGVs
bHN0cm9tQHZtd2FyZS5jb20+Cj4gPiA+IENjOiAiR3VzdGF2byBBLiBSLiBTaWx2YSIgPGd1c3Rh
dm9AZW1iZWRkZWRvci5jb20+Cj4gPiA+IENjOiBNaWtlIE1hcnNoYWxsIDxodWJjYXBAb21uaWJv
bmQuY29tPgo+ID4gPiBDYzogSXJhIFdlaW55IDxpcmEud2VpbnlAaW50ZWwuY29tPgo+ID4gPiBD
YzogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4KPiA+ID4gQ2M6IEVtaWwg
VmVsaWtvdiA8ZW1pbC52ZWxpa292QGNvbGxhYm9yYS5jb20+Cj4gPiA+IENjOiBNaWNoZWwgRMOk
bnplciA8bWljaGVsQGRhZW56ZXIubmV0Pgo+ID4gPiAtLS0KPiA+ID4gIGRyaXZlcnMvZ3B1L2Ry
bS92aWEvdmlhX2Rydi5oIHwgMTUgKysrKysrKysrKystLS0tCj4gPiA+ICAxIGZpbGUgY2hhbmdl
ZCwgMTEgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPiA+ID4KPiA+ID4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS92aWEvdmlhX2Rydi5oIGIvZHJpdmVycy9ncHUvZHJtL3ZpYS92
aWFfZHJ2LmgKPiA+ID4gaW5kZXggNmQxYWU4MzQ0ODRjLi5kNWEyYjFmZmQ4YzEgMTAwNjQ0Cj4g
PiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS92aWEvdmlhX2Rydi5oCj4gPiA+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS92aWEvdmlhX2Rydi5oCj4gPiA+IEBAIC0xMTUsMTAgKzExNSwxNyBAQCBlbnVt
IHZpYV9mYW1pbHkgewo+ID4gPiAgLyogVklBIE1NSU8gcmVnaXN0ZXIgYWNjZXNzICovCj4gPiA+
ICAjZGVmaW5lIFZJQV9CQVNFICgoZGV2X3ByaXYtPm1taW8pKQo+ID4gPgo+ID4gPiAtI2RlZmlu
ZSBWSUFfUkVBRChyZWcpICAgICAgICAgIERSTV9SRUFEMzIoVklBX0JBU0UsIHJlZykKPiA+ID4g
LSNkZWZpbmUgVklBX1dSSVRFKHJlZywgdmFsKSAgICBEUk1fV1JJVEUzMihWSUFfQkFTRSwgcmVn
LCB2YWwpCj4gPiA+IC0jZGVmaW5lIFZJQV9SRUFEOChyZWcpICAgICAgICAgRFJNX1JFQUQ4KFZJ
QV9CQVNFLCByZWcpCj4gPiA+IC0jZGVmaW5lIFZJQV9XUklURTgocmVnLCB2YWwpICAgRFJNX1dS
SVRFOChWSUFfQkFTRSwgcmVnLCB2YWwpCj4gPiA+ICsjZGVmaW5lIFZJQV9SRUFEKHJlZykgXAo+
ID4gPiArICAgICAgIHJlYWRsKCgodm9pZCBfX2lvbWVtICopVklBX0JBU0UtPmhhbmRsZSkgKyAo
cmVnKSkKPiA+ID4gKwo+ID4gPiArI2RlZmluZSBWSUFfV1JJVEUocmVnLCB2YWwpIFwKPiA+ID4g
KyAgICAgICB3cml0ZWwodmFsLCAoKHZvaWQgX19pb21lbSAqKVZJQV9CQVNFLT5oYW5kbGUpICsg
KHJlZykpCj4gPiA+ICsKPiA+ID4gKyNkZWZpbmUgVklBX1JFQUQ4KHJlZykgXAo+ID4gPiArICAg
ICAgIHJlYWRiKCgodm9pZCBfX2lvbWVtICopVklBX0JBU0UtPmhhbmRsZSkgKyAocmVnKSkKPiA+
ID4gKwo+ID4gPiArI2RlZmluZSBWSUFfV1JJVEU4KHJlZywgdmFsKSBcCj4gPiA+ICsgICAgICAg
d3JpdGViKHZhbCwgKCh2b2lkIF9faW9tZW0gKilWSUFfQkFTRS0+aGFuZGxlKSArIChyZWcpKQo+
ID4gPgo+ID4gSU1ITyBhIGZhciBiZXR0ZXIgaWRlYSBpcyB0byBleHBhbmQgdGhlc2UgbWFjcm9z
IGFzIHN0YXRpYyBpbmxpbmUgZnVuY3Rpb25zLgo+ID4gVGhlIGV4dHJhIGJvbnVzIGhlcmUgaXMg
dGhhdCB0aGUgcHNldWRvLW1hZ2ljYWwgVklBX0JBU0Ugd2lsbCBhbHNvIGRpc2FwcGVhci4KPiA+
Cj4gPiBTaW5jZSBhbGwgdGhlIFZJQV9SRUFEOCBhcmUgdXNlZCBmb3IgbWFza2luZywgb25lIG1p
Z2h0IGFzIHdlbGwgZHJvcAo+ID4gdGhlbSBpbiBmYXZvdXIgb2YgdmlhX21hc2soKS4KPiA+Cj4g
PiBXRFlUPwo+Cj4gQXMgdGhpcyBpcyBhIGxlZ2FjeSBkcml2ZXIgSSBsaWtlIHRoZSBzdGVwcyB0
byBiZSBzbWFsbC4KPiBTbyB3ZSBrZWVwIGl0IGxpa2UgdGhpcyBidXQgbWF5YmUgYWRkcmVzcyBp
dCBpbiBhIGZvbGxvdy11cCBwYXRjaD8KPgpTb3VuZHMgbGlrZSB1bm5lY2Vzc2FyeSBjaHVybiBC
VEguCgpMb29raW5nIGZyb20gYW5vdGhlciBhbmdsZSAtIG1hY2hpbmVzIHdpdGggc3VjaCBHUFVz
IGFyZSBsaWtlbHkgdG8gYmUKc2xvdyBhdCBidWlsZGluZyB0aGUga2VybmVsLgpTbyBwZW9wbGUg
dGVzdGluZyB0aGlzLCB0aGVuIGFub3RoZXIgc2VyaWVzIChvciB0d28/KSB3aGljaCBkb2VzIHRo
ZQphYm92ZSBwb2xpc2ggd291bGQgYmUgdGltZSBjb25zdW1pbmcuClBlcmhhcHMgZXZlbiBhIGJp
dCBhbm5veWluZy4KClRoYXQgc2FpZCwgSSBkb24ndCBoYXZlIGEgc3Ryb25nIHByZWZlcmVuY2Uu
CgotRW1pbApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
