Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B12A6E5CD
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jul 2019 14:37:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A2746E820;
	Fri, 19 Jul 2019 12:37:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com
 [IPv6:2607:f8b0:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52D0D6E820
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jul 2019 12:37:43 +0000 (UTC)
Received: by mail-ot1-x335.google.com with SMTP id l15so32580081otn.9
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jul 2019 05:37:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=/GLl95jFM9yUzDqA9W4KA1IeVnS0w6FmleG8jCMPTO0=;
 b=CToBfPRPpKwZl4qCQ8bJPCFZKXCHqXYBqxE0cKlA1IWbAwaQ/ygbQo3AxPTXYQbiEw
 1nKvMW7WbIuG0spQTKNr9v8dG49w6TqfgXMai6bSDr6WlrnhxZxnA2jCTuV8cWc3pmou
 YhMhUnqPIE/7WWAGtOMJzNwLJB+8EM/bkGVWrMXTzF75CU82sw6O+rNUF6h1mF0cDZMo
 RGwb6QeVbB2H74OaFRFQaSig2td/LiDHE8FyS2UDznxnaYZ6JvrU+JwBlmOFHcvUwG2i
 fipkYmrWu4Gtj2sCAtycONXvhI77axt/VumIxecf99AMBPh3wYga+A63Gee6XQjEtRNO
 Xbfw==
X-Gm-Message-State: APjAAAUzMx07r3DImLO2vjodw7ZBY19dTZBIn9pOtmyViuvNj9GEjy+B
 46N65Nh9lScYmOEg2FdSImJpLLz2bHzaikzedm8=
X-Google-Smtp-Source: APXvYqzzbOubKALApdiNg4uqzvLbT4C1vHh1LnSFfauXGwKx4QW2RqKk0OS2MbwwPUCvKHZU6t6bNPfgdyJxmxpOCHE=
X-Received: by 2002:a05:6830:4b:: with SMTP id
 d11mr1948261otp.106.1563539862602; 
 Fri, 19 Jul 2019 05:37:42 -0700 (PDT)
MIME-Version: 1.0
References: <20190718153737.28657-1-sam@ravnborg.org>
 <20190719060712.GA26070@ravnborg.org>
 <e2a3b772-96e7-0fed-d269-bb103057cafe@daenzer.net>
 <20190719113212.GC3247@ravnborg.org>
In-Reply-To: <20190719113212.GC3247@ravnborg.org>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Fri, 19 Jul 2019 14:37:31 +0200
Message-ID: <CAKMK7uFgOOJ2DhaLnUaeCGHcfATtDxMsx6XsnSHtmdpc4DQeRw@mail.gmail.com>
Subject: Re: [PATCH/RFT v1 0/6] drm/via: drop use of deprecated headers drmP.h
 and drm_os_linux.h
To: Sam Ravnborg <sam@ravnborg.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=/GLl95jFM9yUzDqA9W4KA1IeVnS0w6FmleG8jCMPTO0=;
 b=hEJLCZD0YxFzKEAliHt3byE1c7ZKKWP58QRE1/oU5agn6gV9i2WMKx43sHc5iDPRGl
 6hQAm3NXiqTrWhn9jep+dBXA15/WGEPYsgP590r7+jHRCj1htDvqQiJd62a3oPpkPUgA
 3Nt/MUlMHi76ThwrkkB0DPieAsGm8r9oMWe8s=
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
Cc: Thomas Hellstrom <thellstrom@vmware.com>, Kevin Brace <kevinbrace@gmx.com>,
 David Airlie <airlied@linux.ie>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Mike Marshall <hubcap@omnibond.com>, Ira Weiny <ira.weiny@intel.com>,
 openchrome-devel@lists.freedesktop.org,
 Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdWwgMTksIDIwMTkgYXQgMTozMiBQTSBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9y
Zy5vcmc+IHdyb3RlOgo+Cj4gSGkgTWljaGFlbC4KPgo+IE9uIEZyaSwgSnVsIDE5LCAyMDE5IGF0
IDExOjA1OjQ0QU0gKzAyMDAsIE1pY2hlbCBEw6RuemVyIHdyb3RlOgo+ID4gT24gMjAxOS0wNy0x
OSA4OjA3IGEubS4sIFNhbSBSYXZuYm9yZyB3cm90ZToKPiA+ID4gT24gVGh1LCBKdWwgMTgsIDIw
MTkgYXQgMDU6Mzc6MzFQTSArMDIwMCwgU2FtIFJhdm5ib3JnIHdyb3RlOgo+ID4gPj4gVGhpcyBp
cyBzb21lIGphbml0b3JpYWwgdXBkYXRlcyB0byB0aGUgdmlhIGRyaXZlcgo+ID4gPj4gdGhhdCBp
cyByZXF1aXJlZCB0byBnZXQgcmlkIG9mIGRlcHJlY2F0ZWQgaGVhZGVycwo+ID4gPj4gaW4gdGhl
IGRybSBzdWJzeXN0ZW0uCj4gPiA+Pgo+ID4gPj4gVGhlIGZpcnN0IHRocmVlIHBhdGNoZXMgYXJl
IHRyaXZpYWwsIHdoZXJlCj4gPiA+PiB0aGUgZGVwZW5kZW5jaWVzIG9uIGRybVAuaCBhbmQgZHJt
X29zX2xpbnV4IGFyZSBkcm9wcGVkLgo+ID4gPj4KPiA+ID4+IFRoZSByZW1haW5pbmcgdGhyZWUg
cGF0Y2hlcyBkcm9wIHVzZSBvZiBEUk1fV0FJVF9PTigpLgo+ID4gPj4gVGhleSBhcmUgcmVwbGFj
ZWQgYnkgd2FpdF9ldmVudF9pbnRlcnJ1cHRpYmxlX3RpbWVvdXQoKS4KPiA+ID4+IFRoZXNlIHBh
dGNoZXMgY291bGQgdXNlIGEgbW9yZSBjcml0aWNhbCByZXZpZXcuCj4gPiA+Cj4gPiA+IFRoZSBk
aWZmZXJlbmNlcyBiZXR3ZWVuIERSTV9XQUlUX09OKCkgYW5kCj4gPiA+IHdhaXRfZXZlbnRfaW50
ZXJydXB0aWJsZV90aW1lb3V0KCkgYXJlIGJpZ2dlciB0aGFuIGFudGljaXBhdGVkLgo+ID4gPgo+
ID4gPiBUaGUgY29udmVyc2lvbiBJIGRpZCBmb3IgZHJtX3ZibGFuay5jIGlzIGJvZ3VzIHRodXMg
SSBleHBlY3QKPiA+ID4gdGhlIGNvbnZlcnNpb24gZG9uZSBmb3IgdmlhIGlzIGFsc28gYm9ndXMu
Cj4gPgo+ID4gV2hhdCBleGFjdGx5IGlzIHRoZSBwcm9ibGVtIHRob3VnaD8gQ2FuIHlvdSBzaGFy
ZSBpbmZvcm1hdGlvbiBhYm91dCB0aGUKPiA+IGZhaWx1cmVzIHlvdSdyZSBzZWVpbmc/Cj4gPgo+
ID4gVGhlcmUgd2FzIHNvbWUgZGlzY3Vzc2lvbiBhYm91dCBEUk1fV0FJVF9PTigpICJwb2xsaW5n
IiBvbiBJUkMuIEkgYXNzdW1lCj4gPiB0aGF0IHJlZmVycyB0byBpdCBvbmx5IHNsZWVwaW5nIGZv
ciB1cCB0byAwLjAxcyBiZWZvcmUgY2hlY2tpbmcgdGhlCj4gPiBjb25kaXRpb24gYWdhaW4uIElu
IGNvbnRyYXN0LCB3YWl0X2V2ZW50X2ludGVycnVwdGlibGVfdGltZW91dCgpIGNoZWNrcwo+ID4g
dGhlIGNvbmRpdGlvbiBvbmNlLCB0aGVuIHNsZWVwcyB1cCB0byB0aGUgZnVsbCB0aW1lb3V0IGJl
Zm9yZSBjaGVja2luZwo+ID4gaXQgYWdhaW4uCj4gQ29ycmVjdCAtIGl0IHdhcyBiYXNlZCBvbiB0
aGUgZmVlZGJhY2sgb24gaXJjIGZyb20gYWlybGllZCBhbmQgaWNrbGUKPiB0aGF0IG1hZGUgbWUg
Y29uY2x1ZGUgdGhhdCB0aGUgdmlhIHBhcnQgbWF5IG5vdCBiZSBnb29kLgo+IEkgY2Fubm90IHNh
eSBpZiB0aGUgcG9sbGluZyB2ZXJzdXMgdGltZW91dCBpcyBwcm9wZXJseSBkZWFsdCB3aXRoIGlu
IHRoZQo+IHZpYSBkcml2ZXIgYW5kIEkgYW0gaW5jbGlkZWQgdG8ganVzdCBtb3ZlIERSTV9XQUlU
X09OKCkgdG8gdmlhX2Rydi5oIGFuZAo+IG5hbWUgaXQgVklBX1dBSVRfT04oKS4KPiBUaGVuIHRo
ZSBjaGFuZ2VzIHRvIHRoaXMgbGVnYWN5IGRyaXZlciBpcyBtaW5pbWFsIGFuZCBpdCB3aWxsIG5v
dAo+IHByZXZlbnQgdXMgZnJvbSBnZXR0dGluZyByaWQgb2YgZHJtX29zX2xpbnV4LmgKPgo+ID4K
PiA+IElmIHRoYXQgbWFrZXMgYSBkaWZmZXJlbmNlIGZvciBkcm1fd2FpdF92YmxhbmtfaW9jdGws
IGl0IGluZGljYXRlcyB0aGF0Cj4gPiBzb21lIG90aGVyIGNvZGUgd2hpY2ggdXBkYXRlcyB0aGUg
dmJsYW5rIGNvdW50IG9yIGNsZWFycyB2YmxhbmstPmVuYWJsZWQKPiA+IGRvZXNuJ3Qgd2FrZSB1
cCB0aGUgdmJsYW5rLT5xdWV1ZS4KPiBMZXQgbWUgYW5hbHlzZSBhIGxpdHRsZS4uLgo+Cj4gSW4g
ZHJtX2hhbmRsZV92YmxhbmsoKSB0aGVyZSBpcyBhIGNhbGwgdG8gd2FrZV91cCgmdmJsYW5rLT5x
dWV1ZSk7Cj4gQW5kIHRoaXMgaXMgY2FsbGVkIGZyb20gYW4gaW50ZXJydXB0IC0gT0suCj4KPiBk
cm1fdmJsYW5rX2VuYWJsZSgpIGlzIGNhbGxlZCBvdXRzaWRlIGFuIGludGVycnVwdCAtIG5vIG5l
ZWQgZm9yCj4gd2FrZV91cCgpCj4KPiBkcm1fY3J0Y19hY2N1cmF0ZV92YmxhbmtfY291bnQoKSBp
cyBjYWxsZWQgb3V0c2lkZSBpbnRlcnJ1cHQgLSBubyBuZWVkCj4gZm9yIHdha2VfdXAoKQo+Cj4g
ZHJtX3ZibGFua19kaXNhYmxlX2FuZF9zYXZlKCkgaXMgY2FsbGVkIG91dHNpZGUgaW50ZXJydXB0
IC0gbm8gbmVlZCBmb3IKPiB3YWtlX3VwKCknCj4KPiBUaGF0IGlzIGFsbCBmdW5jdGlvbnMgSSBj
b3VsZCBkaWcgdXAgdGhhdCB1cGRhdGVzIHRoZSB2YmxhbmsgY291bnRlci4KPgo+IFNvIGJhc2Vk
IG9uIHRoaXMgc2hvcnQgYW5hbHlzaXMgSSBhY3R1YWxseSBzdGFydCB0byB0aGluayB0aGF0Cj4g
SSBjYW4gdXNlIHRoZSB2YXJpYW50IHRoYXQgdXNlcyB3YWl0X2V2ZW50X2ludGVycnVwdGlibGVf
dGltZW91dCgpCj4gYW55d2F5Lgo+IEkgd2lsbCBwb3N0IGEgdjMgYW5kIGF3YWl0IGZlZWRiYWNr
IG9uIHRoYXQgdmVyc2lvbi4KCkZ1cnRoZXJtb3JlIHRoZSBuZXcgdmJsYW5rIHNlcXVlbmNlIGlv
Y3RscyB0aGF0IEtlaXRoIGFkZGVkIGRvbid0IHVzZQpEUk1fV0FJVF9PTigpLCBzbyBtYXliZSB0
aGF0IHNoaXAgc2FpbGVkIGFscmVhZHkuCi1EYW5pZWwKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdh
cmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCis0MSAoMCkgNzkgMzY1IDU3IDQ4IC0gaHR0
cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
