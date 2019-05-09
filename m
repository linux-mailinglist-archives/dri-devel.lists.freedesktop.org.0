Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78F88185F7
	for <lists+dri-devel@lfdr.de>; Thu,  9 May 2019 09:19:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C932489AC6;
	Thu,  9 May 2019 07:18:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from onstation.org (onstation.org [52.200.56.107])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6FB7895C3;
 Thu,  9 May 2019 07:12:44 +0000 (UTC)
Received: from localhost (c-98-239-145-235.hsd1.wv.comcast.net
 [98.239.145.235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: masneyb)
 by onstation.org (Postfix) with ESMTPSA id 57C7A3E93E;
 Thu,  9 May 2019 07:12:43 +0000 (UTC)
Date: Thu, 9 May 2019 03:12:43 -0400
From: Brian Masney <masneyb@onstation.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH RFC 4/6] ARM: dts: msm8974: add display support
Message-ID: <20190509071243.GA27143@basecamp>
References: <20190505130413.32253-1-masneyb@onstation.org>
 <20190505130413.32253-5-masneyb@onstation.org>
 <20190507063902.GA2085@tuxbook-pro>
 <20190509021616.GA26228@basecamp>
 <CAF6AEGsM382jB=h7oM3frhZ5fAp+qYUdgiiKSKo1RtR8+ffjrg@mail.gmail.com>
 <20190509030047.GE2085@tuxbook-pro>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190509030047.GE2085@tuxbook-pro>
X-Mailman-Approved-At: Thu, 09 May 2019 07:18:00 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=onstation.org; s=default; t=1557385963;
 bh=Jb3P351PcNcvj6RN68GVuceqLFPSl29qLpr7PA9LBkI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=T6AQPGcd6DudjY2velB/ZZ5XXAJ8cIHX9sjlYmzwHNrit2iKxINLDAugSQrGe+HHD
 qkHUXbu/zRWVy6kdw6TAJuJ2CFoOWcrVg251Dfo8Px+nsp+C48v6w4oP5+Jf3xuFcB
 IPJUj1RpNsNKuGEE2VzV59bh7KMGuIuk8yZI2dIs=
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
Cc: Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBNYXkgMDgsIDIwMTkgYXQgMDg6MDA6NDdQTSAtMDcwMCwgQmpvcm4gQW5kZXJzc29u
IHdyb3RlOgo+IE9uIFdlZCAwOCBNYXkgMTk6MjUgUERUIDIwMTksIFJvYiBDbGFyayB3cm90ZToK
PiAKPiA+IE9uIFdlZCwgTWF5IDgsIDIwMTkgYXQgNzoxNiBQTSBCcmlhbiBNYXNuZXkgPG1hc25l
eWJAb25zdGF0aW9uLm9yZz4gd3JvdGU6Cj4gPiA+Cj4gPiA+IE9uIE1vbiwgTWF5IDA2LCAyMDE5
IGF0IDExOjM5OjAyUE0gLTA3MDAsIEJqb3JuIEFuZGVyc3NvbiB3cm90ZToKPiA+ID4gPiBPbiBT
dW4gMDUgTWF5IDA2OjA0IFBEVCAyMDE5LCBCcmlhbiBNYXNuZXkgd3JvdGU6Cj4gPiA+ID4gPiBk
aWZmIC0tZ2l0IGEvYXJjaC9hcm0vYm9vdC9kdHMvcWNvbS1tc204OTc0LmR0c2kgYi9hcmNoL2Fy
bS9ib290L2R0cy9xY29tLW1zbTg5NzQuZHRzaQo+ID4gPiA+IFsuLl0KPiA+ID4gPiA+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICBjbG9ja3MgPSA8Jm1tY2MgTURTU19NRFBfQ0xLPiwKPiA+
ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8Jm1tY2MgTURTU19B
SEJfQ0xLPiwKPiA+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8
Jm1tY2MgTURTU19BWElfQ0xLPiwKPiA+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICA8Jm1tY2MgTURTU19CWVRFMF9DTEs+LAo+ID4gPiA+ID4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIDwmbW1jYyBNRFNTX1BDTEswX0NMSz4sCj4gPiA+ID4g
PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPCZtbWNjIE1EU1NfRVNDMF9D
TEs+LAo+ID4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDwmbW1j
YyBNTVNTX01JU0NfQUhCX0NMSz47Cj4gPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgY2xvY2stbmFtZXMgPSAibWRwX2NvcmUiLAo+ID4gPiA+ID4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgImlmYWNlIiwKPiA+ID4gPiA+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICJidXMiLAo+ID4gPiA+ID4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgImJ5dGUiLAo+ID4gPiA+ID4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgInBpeGVsIiwKPiA+ID4gPiA+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICJjb3JlIiwKPiA+ID4gPiA+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICJjb3JlX21tc3MiOwo+ID4g
PiA+Cj4gPiA+ID4gVW5sZXNzIEkgZW5hYmxlIE1NU1NfTU1TU05PQ19BWElfQ0xLIGFuZCBNTVNT
X1MwX0FYSV9DTEsgSSBnZXQgc29tZQo+ID4gPiA+IHVuZGVycnVuIGVycm9yIGZyb20gRFNJLiBZ
b3UgZG9uJ3Qgc2VlIGFueXRoaW5nIGxpa2UgdGhpcz8KPiA+ID4gPgo+ID4gPiA+IChUaGVzZSBj
bG9ja3MgYXJlIGNvbnRyb2xsZWQgYnkgbXNtX2J1cyBkb3duc3RyZWFtIGFuZCBzaG91bGQgYmUg
ZHJpdmVuCj4gPiA+ID4gYnkgaW50ZXJjb25uZWN0IHVwc3RyZWFtKQo+ID4gPiA+Cj4gPiA+ID4K
PiA+ID4gPiBBcGFydCBmcm9tIHRoaXMsIEkgdGhpbmsgdGhpcyBsb29rcyBuaWNlLiBIYXBweSB0
byBzZWUgdGhlIHByb2dyZXNzLgo+ID4gPgo+ID4gPiBObywgSSdtIG5vdCBzZWVpbmcgYW4gdW5k
ZXJydW4gZXJyb3JzIGZyb20gdGhlIERTSS4gSSB0aGluayB0aGUgY2xvY2tzCj4gPiA+IGFyZSBm
aW5lIHNpbmNlIEknbSBhYmxlIHRvIGdldCB0aGlzIHdvcmtpbmcgd2l0aCA0LjE3IHVzaW5nIHRo
ZXNlIHNhbWUKPiA+ID4gY2xvY2tzLiBJIGp1c3Qgc2VudCBvdXQgdjIgYW5kIHRoZSBjb3ZlciBs
ZXR0ZXIgaGFzIHNvbWUgZGV0YWlscywgYWxvbmcKPiA+ID4gd2l0aCB0aGUgZnVsbCBkbWVzZy4K
PiA+IAo+ID4gc2luY2Ugd2UgZG9uJ3QgaGF2ZSBpbnRlcmNvbm5lY3QgZHJpdmVyIGZvciA4OTc0
LCBJIGd1ZXNzIHRoZXJlIGlzCj4gPiBzb21lIGNoYW5jZSB0aGF0IHRoaW5ncyB3b3JrIG9yIG5v
dCBiYXNlZCBvbiBob3cgbGsgbGVhdmVzIHRoaW5ncz8KPiA+IAo+IAo+IFJpZ2h0LCBJIGd1ZXNz
IHRoZSBib290bG9hZGVyIG9uIG15IGRldmljZSBkb2VzIG5vdCBsZWF2ZSB0aGUgYnVzc2VzCj4g
dGlja2luZyAtIHBlcmhhcHMgdGhlcmUncyBhIGJvb3Qgc3BsYXNoIGludm9sdmVkIG9uIEJyaWFu
J3MgZGV2aWNlPwo+IAo+IFJlZ2FyZGxlc3MsIHRoaXMgd29ya3Mgb24gTmV4dXMgNSBhbmQgYWxs
b3dzIEJyaWFuIHRvIG1ha2UgZnVydGhlcgo+IHByb2dyZXNzIHNvIEknbSBhbGwgZm9yIG1lcmdp
bmcgaXQuCgpUaGVyZSBpcyBhIGJvb3Qgc3BsYXNoIG9uIHRoZSBOZXh1cyA1IGFuZCB0aGF0IG1h
eSBleHBsYWluIGEgYmVoYXZpb3IKdGhhdCBJIG9ic2VydmVkLiBJIGF0dGVtcHRlZCB0byBhZGQg
cmVzZXQgR1BJTyBzdXBwb3J0IHRvIHRoZSBzaW1wbGUKcGFuZWwgZHJpdmVyIGFuZCB0aGUgc2Ny
ZWVuIHdpbGwgY2xlYXIgYnV0IG5vdGhpbmcgd2lsbCBjb21lIG9uIHRoZQpzY3JlZW4gYWZ0ZXIg
YSBoYXJkIHJlc2V0LCBldmVuIG9uIDQuMTcuIFRvIGJlIHN1cmUsIEkgZ290IHRoZSB0aW1pbmcK
aW5mb3JtYXRpb24gZm9yIGhvdyBsb25nIHRvIGxlYXZlIHRoZSBHUElPIGhpZ2ggYW5kIGxvdyBm
cm9tIHRoZQpkb3duc3RyZWFtIE1TTSAzLjQgc291cmNlcy4gVGhhdCdzIHdoZW4gSSBoYWQgYSBz
Y3JpcHQgcG9ydCBhbGwgb2YgdGhlCn40MDAgcGFuZWwgb24gY29tbWFuZHMgaW4gdGhlIGRvd25z
dHJlYW0gZGV2aWNlIHRyZWUgdG8gYSBuZXcgcGFuZWwKZHJpdmVyLgoKV2l0aCB0aGUgbGF0ZXN0
IGtlcm5lbCBrZXJuZWwgaGF2aW5nIGEgZGVsYXkgc2hvd2luZyB0aGUgY29uc29sZSB0ZXh0LApJ
IG9ic2VydmUgYSBicmllZiBzZWNvbmQgd2hlcmUgdGhlIGJvb3Qgc3BsYXNoIGlzIHNob3duIGFs
b25nIHdpdGggdGhlCnN0YXJ0dXAgdGV4dCBmcm9tIExpbnV4LiBBIGZ1bGwgcmVmcmVzaCBpcyBw
ZXJmb3JtZWQgYW5kIHRoZSBib290CnNwbGFzaCBnb2VzIGF3YXkuIEkgZG9uJ3Qgc2VlIHRoaXMg
d2l0aCB0aGUgNC4xNyBrZXJuZWw7IHBlcmhhcHMgbWF5YmUKdGhlIGZ1bGwgcmVmcmVzaCBvY2N1
cnMgcXVpY2sgZW5vdWdoIHRoYXQgaXRzIG5vdCBub3RpY2VhYmxlLgoKQ2FuIHlvdSBwb2ludCBt
ZSB0byB3aGVyZSB0aGUgaW50ZXJjb25uZWN0IEFQSSBpcyBpbiB0aGUgZG93bnN0cmVhbQpNU00g
My40IHNvdXJjZXM/IGh0dHBzOi8vZ2l0aHViLmNvbS9BSUNQL2tlcm5lbF9sZ2VfaGFtbWVyaGVh
ZApJdCBsb29rcyBsaWtlIGl0cyBpbiBkcml2ZXJzL2ludGVyY29ubmVjdC8gaW4gdGhlIHVwc3Ry
ZWFtIHNvdXJjZXMuCgpCcmlhbgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
