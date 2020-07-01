Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D08B211CCC
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jul 2020 09:25:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82A0B6EA85;
	Thu,  2 Jul 2020 07:24:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from vps.xff.cz (vps.xff.cz [195.181.215.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAB506E9B1
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jul 2020 18:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=megous.com; s=mail;
 t=1593629862; bh=6Z4SBIMcF6Jx3VXG/1PL+4vEJ0Qm28Mfr5ilIHdjHfw=;
 h=Date:From:To:Cc:Subject:References:X-My-GPG-KeyId:From;
 b=E5fTkIrR8oXuyozxosnFCsaP3zz8CaqTTmyfOX7Qq/Tk1+H7X2JPzVkAmx/hn4E1N
 E9MS+7jieub7R3oXm9FLKUWyQ6aaFFHZhZvJ1zUkhYtTjLtfyZyqb+LQ+fQ8SO9+LR
 6KtgZTk1FZE7J7E43U5231hKWXwLus06UJbm15vw=
Date: Wed, 1 Jul 2020 20:57:41 +0200
From: =?utf-8?Q?Ond=C5=99ej?= Jirman <megous@megous.com>
To: Icenowy Zheng <icenowy@aosc.io>
Subject: Re: [PATCH v6 13/13] arm64: dts: sun50i-a64-pinephone: Add
 touchscreen support
Message-ID: <20200701185741.z5cga3b7z4gmba6u@core.my.home>
Mail-Followup-To: =?utf-8?Q?Ond=C5=99ej?= Jirman <megous@megous.com>,
 Icenowy Zheng <icenowy@aosc.io>, linux-sunxi@googlegroups.com,
 Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 Guido =?utf-8?Q?G=C3=BCnther?= <agx@sigxcpu.org>,
 Purism Kernel Team <kernel@puri.sm>,
 Rob Herring <robh+dt@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Samuel Holland <samuel@sholland.org>,
 Martijn Braam <martijn@brixit.nl>, Luca Weiss <luca@z3ntu.xyz>,
 Bhushan Shah <bshah@kde.org>
References: <20200701103126.1512615-1-megous@megous.com>
 <20200701103126.1512615-14-megous@megous.com>
 <78C72279-99DB-4FDE-81B3-1CF6BEF80BBF@aosc.io>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <78C72279-99DB-4FDE-81B3-1CF6BEF80BBF@aosc.io>
X-My-GPG-KeyId: EBFBDDE11FB918D44D1F56C1F9F0A873BE9777ED
 <https://xff.cz/key.txt>
X-Mailman-Approved-At: Thu, 02 Jul 2020 07:24:22 +0000
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
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 Purism Kernel Team <kernel@puri.sm>, Samuel Holland <samuel@sholland.org>,
 David Airlie <airlied@linux.ie>,
 Guido =?utf-8?Q?G=C3=BCnther?= <agx@sigxcpu.org>, Bhushan Shah <bshah@kde.org>,
 Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
 linux-kernel@vger.kernel.org, Martijn Braam <martijn@brixit.nl>,
 linux-sunxi@googlegroups.com, Thierry Reding <thierry.reding@gmail.com>,
 Luca Weiss <luca@z3ntu.xyz>, Sam Ravnborg <sam@ravnborg.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgSWNlbm93eSwKCk9uIFdlZCwgSnVsIDAxLCAyMDIwIGF0IDA4OjAxOjE0UE0gKzA4MDAsIElj
ZW5vd3kgWmhlbmcgd3JvdGU6Cj4gCj4gCj4g5LqOIDIwMjDlubQ35pyIMeaXpSBHTVQrMDg6MDAg
5LiL5Y2INjozMToyNiwgT25kcmVqIEppcm1hbiA8bWVnb3VzQG1lZ291cy5jb20+IOWGmeWIsDoK
PiA+UGluZXBob25lIGhhcyBhIEdvb2RpeCBHVDkxN1MgY2FwYWNpdGl2ZSB0b3VjaHNjcmVlbiBj
b250cm9sbGVyIG9uCj4gPkkyQzAgYnVzLiBBZGQgc3VwcG9ydCBmb3IgaXQuCj4gPgo+ID5TaWdu
ZWQtb2ZmLWJ5OiBPbmRyZWogSmlybWFuIDxtZWdvdXNAbWVnb3VzLmNvbT4KPiA+QWNrZWQtYnk6
IExpbnVzIFdhbGxlaWogPGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZz4KPiA+LS0tCj4gPiAuLi4v
ZHRzL2FsbHdpbm5lci9zdW41MGktYTY0LXBpbmVwaG9uZS5kdHNpICAgfCAxOSArKysrKysrKysr
KysrKysrKysrCj4gPiAxIGZpbGUgY2hhbmdlZCwgMTkgaW5zZXJ0aW9ucygrKQo+ID4KPiA+ZGlm
ZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvYWxsd2lubmVyL3N1bjUwaS1hNjQtcGluZXBo
b25lLmR0c2kKPiA+Yi9hcmNoL2FybTY0L2Jvb3QvZHRzL2FsbHdpbm5lci9zdW41MGktYTY0LXBp
bmVwaG9uZS5kdHNpCj4gPmluZGV4IDg1YTdhYTVlZmQzMi4uMmQ1Njk0NDQ2ZDE3IDEwMDY0NAo+
ID4tLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2FsbHdpbm5lci9zdW41MGktYTY0LXBpbmVwaG9u
ZS5kdHNpCj4gPisrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvYWxsd2lubmVyL3N1bjUwaS1hNjQt
cGluZXBob25lLmR0c2kKPiA+QEAgLTEyMyw2ICsxMjMsMjUgQEAgJmVoY2kxIHsKPiA+IAlzdGF0
dXMgPSAib2theSI7Cj4gPiB9Owo+ID4gCj4gPismaTJjMCB7Cj4gPisJcGluY3RybC1uYW1lcyA9
ICJkZWZhdWx0IjsKPiA+KwlwaW5jdHJsLTAgPSA8JmkyYzBfcGlucz47Cj4gPisJc3RhdHVzID0g
Im9rYXkiOwo+ID4rCj4gPisJdG91Y2hzY3JlZW5ANWQgewo+ID4rCQljb21wYXRpYmxlID0gImdv
b2RpeCxndDkxN3MiLCAiZ29vZGl4LGd0OTExIjsKPiAKPiBQbGVhc2UgZHJvcCBndDkxMSBoZXJl
LiBHVDkxN1MgYmVsb25nIHRvIHRoZSBHVDF4IHByb2R1Y3QgbGluZSwgbm90IHRoZSBzYW1lIGxp
bmUgd2l0aCBHVDkxMS4KPiAKPiBZb3Ugd2lsbCBzZWUgdGhpcyBpbiB0aGUgZHJpdmVyLgoKUmln
aHQuIEknbGwgZG8gc28gaW4gdjguCgp0aG5rIHlvdSBhbmQgcmVnYXJkcywKCW8uCgo+ID4rCQly
ZWcgPSA8MHg1ZD47Cj4gPisJCWludGVycnVwdC1wYXJlbnQgPSA8JnBpbz47Cj4gPisJCWludGVy
cnVwdHMgPSA8NyA0IElSUV9UWVBFX0xFVkVMX0hJR0g+OyAvKiBQSDQgKi8KPiA+KwkJaXJxLWdw
aW9zID0gPCZwaW8gNyA0IEdQSU9fQUNUSVZFX0hJR0g+OyAvKiBQSDQgKi8KPiA+KwkJcmVzZXQt
Z3Bpb3MgPSA8JnBpbyA3IDExIEdQSU9fQUNUSVZFX0hJR0g+OyAvKiBQSDExICovCj4gPisJCUFW
REQyOC1zdXBwbHkgPSA8JnJlZ19sZG9faW8wPjsKPiA+KwkJVkRESU8tc3VwcGx5ID0gPCZyZWdf
bGRvX2lvMD47Cj4gPisJCXRvdWNoc2NyZWVuLXNpemUteCA9IDw3MjA+Owo+ID4rCQl0b3VjaHNj
cmVlbi1zaXplLXkgPSA8MTQ0MD47Cj4gPisJfTsKPiA+K307Cj4gPisKPiA+ICZpMmMxIHsKPiA+
IAlzdGF0dXMgPSAib2theSI7Cj4gPiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVsCg==
