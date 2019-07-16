Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D7886B721
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jul 2019 09:08:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FED96E252;
	Wed, 17 Jul 2019 07:08:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe42.google.com (mail-vs1-xe42.google.com
 [IPv6:2607:f8b0:4864:20::e42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 573686E0CD
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2019 08:00:06 +0000 (UTC)
Received: by mail-vs1-xe42.google.com with SMTP id 2so13257281vso.8
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2019 01:00:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0k1aHf58/gxem57t+/HJk9SNpX74KfXqdFRssCgasHQ=;
 b=fkmodcZ9eF81GT71Rj7nw+/TxaYeZ3m6NViyx8Q8uwmsJu4ER6fS7XXehJhZjmywpj
 l4Xg9g1gW6Hg/aUB46drVmH2jSYJbrwCvOdlRII2ccM8XLpalC7SSnF3Uka3u2MMNGbZ
 iF61SZXRxTHO6BDbXnZZS/HpZnIM1jSF2VDyzEl03GY/SS3vhIXBYYXSdvgY1X7wFlHP
 pZcP18nVLHMLnptnsBefmC3Cc59KvwZVvSeWMtTcwO5tLipBXKUG86JMyr9fw6KE8pUH
 kS6gxW7fhutfYRFolF3cwrYgzmrdBMGrXRHIBT5nJJP3wgiCnTeJvj+R/EmG/hVH9hdu
 GSbg==
X-Gm-Message-State: APjAAAWJAXtuXKob4FoSs7QyRar95K4ktV5KywCt8oBgaGqFxvk2cFL2
 a1Dp6NkQ7KniI98H7lCbdMS+6GdGRh+hOmtjvIZ9Eg==
X-Google-Smtp-Source: APXvYqz3UlcLWtTzFizosrgSxqzhf3bbaJZCfMhWBpiXfCrTTv26BLTLvewBhZnAiR6udq4k9bpOekTvU0tfbVw4RAQ=
X-Received: by 2002:a67:ebcb:: with SMTP id y11mr9527514vso.138.1563264004214; 
 Tue, 16 Jul 2019 01:00:04 -0700 (PDT)
MIME-Version: 1.0
References: <20190712100443.221322-1-cychiang@chromium.org>
 <20190712100443.221322-2-cychiang@chromium.org>
 <20190712105745.xr7jxc626lwoaajx@shell.armlinux.org.uk>
 <CA+Px+wWbmUemETY3OMk1T9XS2w8ZXvZUhVEGzw_w6AxtU8R0rw@mail.gmail.com>
In-Reply-To: <CA+Px+wWbmUemETY3OMk1T9XS2w8ZXvZUhVEGzw_w6AxtU8R0rw@mail.gmail.com>
From: Cheng-yi Chiang <cychiang@chromium.org>
Date: Tue, 16 Jul 2019 15:59:36 +0800
Message-ID: <CAFv8NwKwd8Yf4UmqUhcaP1pL2K_d_FSZm9JyY_Azy13017RWgg@mail.gmail.com>
Subject: Re: [PATCH v3 1/5] ASoC: hdmi-codec: Add an op to set callback
 function for plug event
To: Tzung-Bi Shih <tzungbi@google.com>
X-Mailman-Approved-At: Wed, 17 Jul 2019 07:08:01 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=0k1aHf58/gxem57t+/HJk9SNpX74KfXqdFRssCgasHQ=;
 b=WkIXGD93vnc7/jgdUJCOyAhWfQWj4JwZxZhvfijDRISLuLx4yflZHTDWWSxx7WAFgi
 P/75eR1ocFjiim/HAtaQ/hHHMdj/AJhGCoGv3O1KDMwV3amytYQ+kgBq/LAKt+YymIQH
 cgPBdjhd4eTA/OcE54ml3PqvteVAcATrUZsBw=
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
Cc: ALSA development <alsa-devel@alsa-project.org>, tzungbi@chromium.org,
 Liam Girdwood <lgirdwood@gmail.com>, David Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 Russell King - ARM Linux admin <linux@armlinux.org.uk>,
 Hans Verkuil <hverkuil@xs4all.nl>, linux-rockchip@lists.infradead.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Dylan Reid <dgreid@chromium.org>, Jaroslav Kysela <perex@perex.cz>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBKdWwgMTUsIDIwMTkgYXQgMTE6NTYgUE0gVHp1bmctQmkgU2hpaCA8dHp1bmdiaUBn
b29nbGUuY29tPiB3cm90ZToKPgo+IE9uIEZyaSwgSnVsIDEyLCAyMDE5IGF0IDY6NTggUE0gUnVz
c2VsbCBLaW5nIC0gQVJNIExpbnV4IGFkbWluCj4gPGxpbnV4QGFybWxpbnV4Lm9yZy51az4gd3Jv
dGU6Cj4gPgo+ID4gT24gRnJpLCBKdWwgMTIsIDIwMTkgYXQgMDY6MDQ6MzlQTSArMDgwMCwgQ2hl
bmctWWkgQ2hpYW5nIHdyb3RlOgo+ID4gPiBBZGQgYW4gb3AgaW4gaGRtaV9jb2RlY19vcHMgc28g
Y29kZWMgZHJpdmVyIGNhbiByZWdpc3RlciBjYWxsYmFjawo+ID4gPiBmdW5jdGlvbiB0byBoYW5k
bGUgcGx1ZyBldmVudC4KPiA+ID4KPiA+ID4gRHJpdmVyIGluIERSTSBjYW4gdXNlIHRoaXMgY2Fs
bGJhY2sgZnVuY3Rpb24gdG8gcmVwb3J0IGNvbm5lY3RvciBzdGF0dXMuCj4gPiA+Cj4gPiA+IFNp
Z25lZC1vZmYtYnk6IENoZW5nLVlpIENoaWFuZyA8Y3ljaGlhbmdAY2hyb21pdW0ub3JnPgo+ID4g
PiAtLS0KPiA+ID4gIGluY2x1ZGUvc291bmQvaGRtaS1jb2RlYy5oICAgIHwgMTYgKysrKysrKysr
KysrKwo+ID4gPiAgc291bmQvc29jL2NvZGVjcy9oZG1pLWNvZGVjLmMgfCA0NSArKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKwo+ID4gPiAgMiBmaWxlcyBjaGFuZ2VkLCA2MSBpbnNl
cnRpb25zKCspCj4gPiA+Cj4gPiA+IGRpZmYgLS1naXQgYS9pbmNsdWRlL3NvdW5kL2hkbWktY29k
ZWMuaCBiL2luY2x1ZGUvc291bmQvaGRtaS1jb2RlYy5oCj4gPiA+IGluZGV4IDdmZWE0OTZmMWYz
NC4uOWE4NjYxNjgwMjU2IDEwMDY0NAo+ID4gPiAtLS0gYS9pbmNsdWRlL3NvdW5kL2hkbWktY29k
ZWMuaAo+ID4gPiArKysgYi9pbmNsdWRlL3NvdW5kL2hkbWktY29kZWMuaAo+ID4gPiBAQCAtNDcs
NiArNDcsOSBAQCBzdHJ1Y3QgaGRtaV9jb2RlY19wYXJhbXMgewo+ID4gPiAgICAgICBpbnQgY2hh
bm5lbHM7Cj4gPiA+ICB9Owo+ID4gPgo+ID4gPiArdHlwZWRlZiB2b2lkICgqaGRtaV9jb2RlY19w
bHVnZ2VkX2NiKShzdHJ1Y3QgZGV2aWNlICpkZXYsCj4gPiA+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIGJvb2wgcGx1Z2dlZCk7Cj4gPiA+ICsKPiA+Cj4gPiBJJ2QgbGlrZSB0
byBwb3NlIGEgcXVlc3Rpb24gZm9yIHBlb3BsZSB0byB0aGluayBhYm91dC4KPiA+Cj4gPiBGaXJz
dGx5LCB0eXBlZGVmcyBhcmUgZ2VuZXJhbGx5IHNodW5uZWQgaW4gdGhlIGtlcm5lbC4gIEhvd2V2
ZXIsIGZvcgo+ID4gdGhlc2UgY2FzZXMgaXQgc2VlbXMgdG8gbWFrZSBzZW5zZS4KPiA+Cj4gPiBI
b3dldmVyLCBzaG91bGQgdGhlICJwb2ludGVyIi1uZXNzIGJlIHBhcnQgb2YgdGhlIHR5cGVkZWYg
b3Igbm90PyAgVG8KPiA+IHNlZSB3aGF0IEkgbWVhbiwgY29uc2lkZXI6Cj4gPgo+ID4gICAgICAg
ICB0eXBlZGVmIHZvaWQgKCpoZG1pX2Zvbykodm9pZCk7Cj4gPgo+ID4gICAgICAgICBpbnQgcmVn
aXN0ZXJfZm9vKGhkbWlfZm9vIGZvbyk7Cj4gPgo+ID4gdnMKPiA+Cj4gPiAgICAgICAgIHR5cGVk
ZWYgdm9pZCBoZG1pX2Zvbyh2b2lkKTsKPiA+Cj4gPiAgICAgICAgIGludCByZWdpc3Rlcl9mb28o
aGRtaV9mb28gKmZvbyk7Cj4gPgo+ID4gd2hpY2ggaXMgbW9yZSBpbiBrZWVwaW5nIHdpdGggaG93
IHdlIGNvZGUgbm9uLXR5cGVkZWYnZCBjb2RlIC0gaXQncwo+ID4gb2J2aW91cyB0aGF0IGZvbyBp
cyBhIHBvaW50ZXIgd2hpbGUgcmVhZGluZyB0aGUgY29kZS4KPiBJIGhhdmUgYSBkaWZmZXJlbnQg
b3Bpbmlvbi4gIEl0cyBzdWZmaXggIl9jYiIgc2VsZi1kZXNjcmliZWQgaXQgaXMgYQo+IGNhbGxi
YWNrIGZ1bmN0aW9uLiAgU2luY2UgZnVuY3Rpb24gYW5kIGZ1bmN0aW9uIHBvaW50ZXIgYXJlIGVx
dWl2YWxlbnQKPiBpbiB0aGUgbGFuZ3VhZ2UsIEkgdGhpbmsgd2UgZG9uJ3QgbmVlZCB0byBlbXBo
YXNpemUgdGhhdCBpdCBpcyBhCj4gZnVuY3Rpb24gInBvaW50ZXIiLgo+Cj4KCkhpIFJ1c3NlbGwg
YW5kIFR6dW5nYmksIHRoYW5rIHlvdSBmb3IgdGhlIHJldmlldy4KUmVnYXJkaW5nIHRoaXMgdHlw
ZWRlZiBvZiBjYWxsYmFjayBmdW5jdGlvbiwgSSBmb3VuZCBhIHRocmVhZApkaXNjdXNzaW5nIHRo
aXMgdmVyeSBsb25nIHRpbWUgYWdvOgoKaHR0cHM6Ly95YXJjaGl2ZS5uZXQvY29tcC9saW51eC90
eXBlZGVmcy5odG1sCgpGcm9tIHRoYXQgdGhyZWFkLCBMaW51cyBnYXZlIGFuIGV4YW1wbGUgb2Yg
dXNpbmcgdHlwZWRlZiBmb3IgZnVuY3Rpb24KcG9pbnRlciB0aGF0IGlzIGZvbGxvd2luZyB0byB0
aGlzIHBhdHRlcm4uCkkgYWxzbyBsb29rZWQgYXJvdW5kIGhvdyBvdGhlciBkcml2ZXIgdXNlIGl0
OgokIGdpdCBncmVwIHR5cGVkZWYgfCBncmVwIF9jYiB8IGxlc3MgfCB3YyAtbAoxMzgKJCBnaXQg
Z3JlcCB0eXBlZGVmIHwgZ3JlcCBfY2IgfCBncmVwICIoXCoiIHwgd2MgLWwKMTE1Ck1vc3Qgb2Yg
dGhlIHR5cGVkZWYgb2YgY2FsbGJhY2sgZnVuY3Rpb24gdXNlIHRoaXMgcGF0dGVybi4KU28gSSB0
aGluayB0aGlzIHNob3VsZCBiZSBmaW5lLgpUaGFua3MhCgoKPiA+IEl0IHNlZW1zIHRvIG1lIHRo
YXQgdGhlIGxhdHRlciBiZXR0ZXIgbWF0Y2hlcyB3aGF0IGlzIGluIHRoZSBrZXJuZWwncwo+ID4g
Y29kaW5nIHN0eWxlLCB3aGljaCBzdGF0ZXM6Cj4gPgo+ID4gICBJbiBnZW5lcmFsLCBhIHBvaW50
ZXIsIG9yIGEgc3RydWN0IHRoYXQgaGFzIGVsZW1lbnRzIHRoYXQgY2FuCj4gPiAgIHJlYXNvbmFi
bHkgYmUgZGlyZWN0bHkgYWNjZXNzZWQgc2hvdWxkICoqbmV2ZXIqKiBiZSBhIHR5cGVkZWYuCj4g
Pgo+ID4gb3IgbWF5YmUgRG9jdW1lbnRhdGlvbi9wcm9jZXNzL2NvZGluZy1zdHlsZS5yc3QgbmVl
ZHMgdXBkYXRpbmc/Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
