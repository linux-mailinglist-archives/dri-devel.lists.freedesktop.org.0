Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF253F424A
	for <lists+dri-devel@lfdr.de>; Fri,  8 Nov 2019 09:39:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78C376E092;
	Fri,  8 Nov 2019 08:39:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
 [209.85.167.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75FD36F8A9
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Nov 2019 08:39:05 +0000 (UTC)
Received: by mail-oi1-f194.google.com with SMTP id y194so4582886oie.4
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Nov 2019 00:39:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ab7roXemwsexQ4pZVt0+wLuisyumzWp4nsGXFOH95TE=;
 b=kQ3lux4fECaYKx3qh0yQYv1E13Zgmx+sGZKGlLdV37izf/TwPAhxbsJyUMBv93zoak
 AGnqGm1MATDBzUfJuOzPIUGZEelzAtIb1LyRw/C6F4f8XO7gtxXjRfrff9KBvl0CSyhl
 7ER2WiyxpD8tHI5zJHPvcoPhp7yAohaR08mhXF3oG2aE/z/evi0XCb2h4bSUHpII2ypV
 9gap4AtaIvUAUbMirzcLREAYXLKxsVHOIrcN8j0uc6EY3cD1shLIZNfDNpepdGeTd3A+
 tH6c/hboEL/er/OmD9VKXNfb3BzANPniis9VqIeZ+zZCnUrdm5v35f+/QWkUZEQpLYGA
 wzbg==
X-Gm-Message-State: APjAAAU2oB/j/sZLKCXtn9eFILGVgrm29XcUXCjDRS5vPEnrcs6+uLMd
 HkgFzsXT68kIyx8T37Qimb3FEY7oRy94q7Jgs68=
X-Google-Smtp-Source: APXvYqx1pYglmvIlKKi2hmb01xlG+jxOqv5ULo4mbjRsK0Uyjgk44sHfMZS77WJg/zzTBmxr52XsKToqRgTubSJYBag=
X-Received: by 2002:a05:6808:b17:: with SMTP id
 s23mr8565059oij.102.1573202344561; 
 Fri, 08 Nov 2019 00:39:04 -0800 (PST)
MIME-Version: 1.0
References: <1573157463-14070-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1573157463-14070-8-git-send-email-fabrizio.castro@bp.renesas.com>
 <20191107205618.GS24983@pendragon.ideasonboard.com>
In-Reply-To: <20191107205618.GS24983@pendragon.ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 8 Nov 2019 09:38:53 +0100
Message-ID: <CAMuHMdXePqHtaBqocXLPd0WPsNK_CyQMwGnGL=oUVPx=HM-8wQ@mail.gmail.com>
Subject: Re: [PATCH v3 7/7] ARM: shmobile_defconfig: Enable support for panels
 from EDT
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
 Mark Rutland <mark.rutland@arm.com>,
 Chris Paterson <Chris.Paterson2@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Simon Horman <horms@verge.net.au>, Neil Armstrong <narmstrong@baylibre.com>,
 David Airlie <airlied@linux.ie>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Magnus Damm <magnus.damm@gmail.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Biju Das <biju.das@bp.renesas.com>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>, Peter Rosin <peda@axentia.se>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTGF1cmVudCwKCk9uIFRodSwgTm92IDcsIDIwMTkgYXQgOTo1NiBQTSBMYXVyZW50IFBpbmNo
YXJ0CjxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+IHdyb3RlOgo+IE9uIFRodSwg
Tm92IDA3LCAyMDE5IGF0IDA4OjExOjAzUE0gKzAwMDAsIEZhYnJpemlvIENhc3RybyB3cm90ZToK
PiA+IFRoZSBpd2cyMGQgY29tZXMgd2l0aCBhbiBMQ0QgcGFuZWwgZnJvbSBFbWVyZ2luZyBEaXNw
bGF5Cj4gPiBUZWNobm9sb2dpZXMgQ29ycG9yYXRpb24gKEVEVCksIHRoZXJlZm9yZSBlbmFibGUg
d2hhdCdzCj4gPiByZXF1aXJlZCB0byBzdXBwb3J0IGl0Lgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6
IEZhYnJpemlvIENhc3RybyA8ZmFicml6aW8uY2FzdHJvQGJwLnJlbmVzYXMuY29tPgo+ID4KPiA+
IC0tLQo+ID4gdjItPnYzOgo+ID4gKiBObyBjaGFuZ2UKPiA+IHYxLT52MjoKPiA+ICogTm8gY2hh
bmdlCj4gPiAtLS0KPiA+ICBhcmNoL2FybS9jb25maWdzL3NobW9iaWxlX2RlZmNvbmZpZyB8IDMg
KysrCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQo+ID4KPiA+IGRpZmYgLS1n
aXQgYS9hcmNoL2FybS9jb25maWdzL3NobW9iaWxlX2RlZmNvbmZpZyBiL2FyY2gvYXJtL2NvbmZp
Z3Mvc2htb2JpbGVfZGVmY29uZmlnCj4gPiBpbmRleCBjNmM3MDM1Li5hYjQxNmE1IDEwMDY0NAo+
ID4gLS0tIGEvYXJjaC9hcm0vY29uZmlncy9zaG1vYmlsZV9kZWZjb25maWcKPiA+ICsrKyBiL2Fy
Y2gvYXJtL2NvbmZpZ3Mvc2htb2JpbGVfZGVmY29uZmlnCj4gPiBAQCAtNjYsNiArNjYsNyBAQCBD
T05GSUdfSU5QVVRfRVZERVY9eQo+ID4gIENPTkZJR19LRVlCT0FSRF9HUElPPXkKPiA+ICAjIENP
TkZJR19JTlBVVF9NT1VTRSBpcyBub3Qgc2V0Cj4gPiAgQ09ORklHX0lOUFVUX1RPVUNIU0NSRUVO
PXkKPiA+ICtDT05GSUdfVE9VQ0hTQ1JFRU5fRURUX0ZUNVgwNj15Cj4KPiBEbyB0aGVzZSBvcHRp
b25zIG5lZWQgdG8gYmUgYnVpbHQtaW4sIG9yIGNvdWxkIG1vZHVsZXMgd29yayB0b28gPwoKQWxs
IFJlbmVzYXMtc3BlY2lmaWMgY29uZmlnIG9wdGlvbnMgaW4gc2htb2JpbGVfZGVmY29uZmlnIGFy
ZSBidWlsdGluLAp1bmxpa2UgaW4gbXVsdGlfdjdfZGVmY29uZmlnIGFuZCBhcm02NF9kZWZjb25m
aWcuCgpHcntvZXRqZSxlZXRpbmd9cywKCiAgICAgICAgICAgICAgICAgICAgICAgIEdlZXJ0Cgot
LSAKR2VlcnQgVXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51eCBiZXlvbmQgaWEz
MiAtLSBnZWVydEBsaW51eC1tNjhrLm9yZwoKSW4gcGVyc29uYWwgY29udmVyc2F0aW9ucyB3aXRo
IHRlY2huaWNhbCBwZW9wbGUsIEkgY2FsbCBteXNlbGYgYSBoYWNrZXIuIEJ1dAp3aGVuIEknbSB0
YWxraW5nIHRvIGpvdXJuYWxpc3RzIEkganVzdCBzYXkgInByb2dyYW1tZXIiIG9yIHNvbWV0aGlu
ZyBsaWtlIHRoYXQuCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLS0gTGludXMgVG9y
dmFsZHMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
