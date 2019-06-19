Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5067C4C192
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2019 21:34:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80EAB6E457;
	Wed, 19 Jun 2019 19:34:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 834F589617;
 Wed, 19 Jun 2019 19:34:32 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id k8so935190eds.7;
 Wed, 19 Jun 2019 12:34:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=THobvFVL09XSyltyeDex0p205QhNWgK6SrrZ8MzneQA=;
 b=fPf09Wm8h1tU8AeWXB3gbJ0meOB2pl4Oe6wzXUXRgbZnXisZvd/fFZO+S3dp7yKLpu
 hMK554nZHyCMPxg2sOoygTk+NZjUvYwrR0Xlkp/u2hjW4FUNOL+LjBxZqiB2bAvupp35
 0kdJFocqquiQ/JUjjUUf090ErGyLZRKY8UO87KMny8lyXzWUgZD2NIPlx0palOukzFfu
 /yCg1UoLnnt4bzH6QmrWdROAh1BbgiwObbSLI7LCMukRO4AsXn6d0ipTwwo2Bv6Z/CMv
 iEvklLQDISO11k0eBYO217t8LjdnXFRvv0Ww+iK0QZ+v/09p7QNeJ7x4MIANbCoy2zfP
 JSaQ==
X-Gm-Message-State: APjAAAWD/DIVd1jXWFWJwf7NyzA9WM3uxay5sU6tGrJNy6Te5eixGWn8
 CFHB4HSrr67bgLoEZtaYFEAdRZuhOdG6deIf8zk=
X-Google-Smtp-Source: APXvYqxk9fS9U2I8X+hk8DhrqrHLwuYAa4HV2Cxkgcl/SZNyR0vvlgU2C434c4NqG47uDXxQ3ZSCXdwsooZq6+fez8k=
X-Received: by 2002:a50:c351:: with SMTP id q17mr3699542edb.264.1560972870960; 
 Wed, 19 Jun 2019 12:34:30 -0700 (PDT)
MIME-Version: 1.0
References: <20190619161913.102998-1-natechancellor@gmail.com>
 <20190619191722.25811-1-natechancellor@gmail.com>
 <20190619193237.GG25413@art_vandelay>
In-Reply-To: <20190619193237.GG25413@art_vandelay>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 19 Jun 2019 12:34:14 -0700
Message-ID: <CAF6AEGuf_88J6Airv2uJyiQSyk_4E2YCdYcb2eedQt6GXPpoLA@mail.gmail.com>
Subject: Re: [PATCH v2] drm/msm/dsi: Add parentheses to quirks check in
 dsi_phy_hw_v3_0_lane_settings
To: Sean Paul <sean@poorly.run>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=THobvFVL09XSyltyeDex0p205QhNWgK6SrrZ8MzneQA=;
 b=qkAU4lzVR8pD0q7s3wTMXWwwctgkn6AyecK1oGeEzPW544duJpM1T62XcuuWZ0d4Nl
 zRqdQ484DkC+4lw2RhVzt7wwKA9rjSxV/7J0NT4XBEABI4GnroLmimLQfKfi9OvurIjK
 9YMCaAJwm2ILCGqRmd8fNEp/PB0M+8ioVO+gYgTjN5dun9zKGo6iJxMbjtrzDkqom790
 uyB7lvatO9bTnBnWrfkS8RNXMfgZc0q4yoeZk3lW+gJe1eZ5+NrbHAjpGSydOs2IctDr
 kmOve+Ie0+Sp6xZF4khcebNAssYM89P/fmVg30bniNQjT6uW6kPk+rkwhIYTiXAigGFp
 /ieA==
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
Cc: kbuild test robot <lkp@intel.com>, Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 clang-built-linux@googlegroups.com,
 Nathan Chancellor <natechancellor@gmail.com>,
 freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdW4gMTksIDIwMTkgYXQgMTI6MzIgUE0gU2VhbiBQYXVsIDxzZWFuQHBvb3JseS5y
dW4+IHdyb3RlOgo+Cj4gT24gV2VkLCBKdW4gMTksIDIwMTkgYXQgMTI6MTc6MjNQTSAtMDcwMCwg
TmF0aGFuIENoYW5jZWxsb3Igd3JvdGU6Cj4gPiBDbGFuZyB3YXJuczoKPiA+Cj4gPiBkcml2ZXJz
L2dwdS9kcm0vbXNtL2RzaS9waHkvZHNpX3BoeV8xMG5tLmM6ODA6Njogd2FybmluZzogbG9naWNh
bCBub3QgaXMKPiA+IG9ubHkgYXBwbGllZCB0byB0aGUgbGVmdCBoYW5kIHNpZGUgb2YgdGhpcyBi
aXR3aXNlIG9wZXJhdG9yCj4gPiBbLVdsb2dpY2FsLW5vdC1wYXJlbnRoZXNlc10KPiA+ICAgICAg
ICAgaWYgKCFwaHktPmNmZy0+cXVpcmtzICYgVjNfMF8wXzEwTk1fT0xEX1RJTUlOR1NfUVVJUksp
IHsKPiA+ICAgICAgICAgICAgIF4gICAgICAgICAgICAgICAgIH4KPiA+IGRyaXZlcnMvZ3B1L2Ry
bS9tc20vZHNpL3BoeS9kc2lfcGh5XzEwbm0uYzo4MDo2OiBub3RlOiBhZGQgcGFyZW50aGVzZXMK
PiA+IGFmdGVyIHRoZSAnIScgdG8gZXZhbHVhdGUgdGhlIGJpdHdpc2Ugb3BlcmF0b3IgZmlyc3QK
PiA+ICAgICAgICAgaWYgKCFwaHktPmNmZy0+cXVpcmtzICYgVjNfMF8wXzEwTk1fT0xEX1RJTUlO
R1NfUVVJUkspIHsKPiA+ICAgICAgICAgICAgIF4KPiA+ICAgICAgICAgICAgICAoICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICApCj4gPiBkcml2ZXJzL2dwdS9k
cm0vbXNtL2RzaS9waHkvZHNpX3BoeV8xMG5tLmM6ODA6Njogbm90ZTogYWRkIHBhcmVudGhlc2Vz
Cj4gPiBhcm91bmQgbGVmdCBoYW5kIHNpZGUgZXhwcmVzc2lvbiB0byBzaWxlbmNlIHRoaXMgd2Fy
bmluZwo+ID4gICAgICAgICBpZiAoIXBoeS0+Y2ZnLT5xdWlya3MgJiBWM18wXzBfMTBOTV9PTERf
VElNSU5HU19RVUlSSykgewo+ID4gICAgICAgICAgICAgXgo+ID4gICAgICAgICAgICAgKCAgICAg
ICAgICAgICAgICApCj4gPiAxIHdhcm5pbmcgZ2VuZXJhdGVkLgo+ID4KPiA+IEFkZCBwYXJlbnRo
ZXNlcyBhcm91bmQgdGhlIGJpdHdpc2UgQU5EIHNvIGl0IGlzIGV2YWx1YXRlZCBmaXJzdCB0aGVu
Cj4gPiBuZWdhdGVkLgo+ID4KPiA+IEZpeGVzOiAzZGJiZjhmMDllODMgKCJkcm0vbXNtL2RzaTog
QWRkIG9sZCB0aW1pbmdzIHF1aXJrIGZvciAxMG5tIHBoeSIpCj4KPiBIbW0sIHNvIGl0IGxvb2tz
IGxpa2UgdGhpcyBwYXRjaCBpc24ndCB1cHN0cmVhbS4gV2hhdCB0cmVlIGFyZSB5b3UgYmFzaW5n
IHRoaXMKPiBvbj8KCml0IGlzIGluIG1zbS1uZXh0LXN0YWdpbmcuLiAod2hpY2ggd2lsbCBiZSBw
dXNoZWQgdG8gbXNtLW5leHQgYWZ0ZXIKc29tZSB0ZXN0aW5nKQoKSSd2ZSBwdWxsZWQgTmF0aGFu
J3MgcGF0Y2ggaW4gb24gdG9wLi4KCkJSLAotUgoKPgo+IFNlYW4KPgo+ID4gTGluazogaHR0cHM6
Ly9naXRodWIuY29tL0NsYW5nQnVpbHRMaW51eC9saW51eC9pc3N1ZXMvNTQ3Cj4gPiBSZXBvcnRl
ZC1ieToga2J1aWxkIHRlc3Qgcm9ib3QgPGxrcEBpbnRlbC5jb20+Cj4gPiBSZXZpZXdlZC1ieTog
SmVmZnJleSBIdWdvIDxqZWZmcmV5LmwuaHVnb0BnbWFpbC5jb20+Cj4gPiBSZXZpZXdlZC1ieTog
U2VhbiBQYXVsIDxzZWFuQHBvb3JseS5ydW4+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBOYXRoYW4gQ2hh
bmNlbGxvciA8bmF0ZWNoYW5jZWxsb3JAZ21haWwuY29tPgo+ID4gLS0tCj4gPgo+ID4gdjEgLT4g
djI6Cj4gPgo+ID4gKiBGaXggYnJva2VuIGxpbmsgKHRoYW5rcyB0byBTZWFuIGZvciBwb2ludGlu
ZyBpdCBvdXQpCj4gPiAqIEFkZCBTZWFuJ3MgcmV2aWV3ZWQtYnkKPiA+Cj4gPiAgZHJpdmVycy9n
cHUvZHJtL21zbS9kc2kvcGh5L2RzaV9waHlfMTBubS5jIHwgMiArLQo+ID4gIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vbXNtL2RzaS9waHkvZHNpX3BoeV8xMG5tLmMgYi9kcml2ZXJzL2dwdS9k
cm0vbXNtL2RzaS9waHkvZHNpX3BoeV8xMG5tLmMKPiA+IGluZGV4IGViMjg5MzdmNGIzNC4uNDc0
MDNkNGYyZDI4IDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21zbS9kc2kvcGh5L2Rz
aV9waHlfMTBubS5jCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2RzaS9waHkvZHNpX3Bo
eV8xMG5tLmMKPiA+IEBAIC03Nyw3ICs3Nyw3IEBAIHN0YXRpYyB2b2lkIGRzaV9waHlfaHdfdjNf
MF9sYW5lX3NldHRpbmdzKHN0cnVjdCBtc21fZHNpX3BoeSAqcGh5KQo+ID4gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHR4X2RjdHJsW2ldKTsKPiA+ICAgICAgIH0KPiA+Cj4gPiAtICAgICBp
ZiAoIXBoeS0+Y2ZnLT5xdWlya3MgJiBWM18wXzBfMTBOTV9PTERfVElNSU5HU19RVUlSSykgewo+
ID4gKyAgICAgaWYgKCEocGh5LT5jZmctPnF1aXJrcyAmIFYzXzBfMF8xME5NX09MRF9USU1JTkdT
X1FVSVJLKSkgewo+ID4gICAgICAgICAgICAgICAvKiBUb2dnbGUgQklUIDAgdG8gcmVsZWFzZSBm
cmVlemUgSS8wICovCj4gPiAgICAgICAgICAgICAgIGRzaV9waHlfd3JpdGUobGFuZV9iYXNlICsg
UkVHX0RTSV8xMG5tX1BIWV9MTl9UWF9EQ1RSTCgzKSwgMHgwNSk7Cj4gPiAgICAgICAgICAgICAg
IGRzaV9waHlfd3JpdGUobGFuZV9iYXNlICsgUkVHX0RTSV8xMG5tX1BIWV9MTl9UWF9EQ1RSTCgz
KSwgMHgwNCk7Cj4gPiAtLQo+ID4gMi4yMi4wCj4gPgo+Cj4gLS0KPiBTZWFuIFBhdWwsIFNvZnR3
YXJlIEVuZ2luZWVyLCBHb29nbGUgLyBDaHJvbWl1bSBPUwpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
