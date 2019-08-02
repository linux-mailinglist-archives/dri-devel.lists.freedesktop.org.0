Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D00B97EFBE
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2019 11:01:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 773B96ED61;
	Fri,  2 Aug 2019 09:01:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
 [209.85.128.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CA036ED61
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Aug 2019 09:01:44 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id l2so65557596wmg.0
 for <dri-devel@lists.freedesktop.org>; Fri, 02 Aug 2019 02:01:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kvvlW+uIUrUdNjqlOT5P3qO2zeClOhr+R8v8gEKY+6Y=;
 b=ihmYKbNqmQPc4bps9ngIaz/4ODTug3G3SsWwXn20XABxydDOd03sIQWLSIFCfUYVta
 9wMcjhQ4CmYOpvssi34BApCMtDHpmKm/Szy+VNdEVw23stewHJmfw2phXNLC2fAZoR/u
 NRuackgiYyrcBP94ehrLY3oB9VCe1VEch7LgWoqtFxEHdWTsWIo+BdKRYtK11ntQKEGB
 tA2USjztuKOK3vvQodQFWqwpSJMsZ/P1KcLtgJUjuUPrnfVwdvhRZXBeX3HkwO5x8LFK
 lOu9qTBuHxM372brzxg1AheQ2wSFlMu81OZipK71DBxAAYBrcuLgIHbFgEbJ3CEwVKqu
 xzPw==
X-Gm-Message-State: APjAAAX00qWF+icMcHR7D7qH+H2k/og4SG6WT1xmGb4kuTICLq3F2syg
 ee13X/9kJvqHXvsvCGS7dOHhJEd1xK/4cJWExps=
X-Google-Smtp-Source: APXvYqzlYNYU0pjvulT5Kn0ylbMvd7827Mu+1m9924pu/nWD4wXojl+caY4NoCY9bFexyT8l7fkwqjioGghgcgQKFeU=
X-Received: by 2002:a1c:1f4e:: with SMTP id f75mr3363459wmf.137.1564736503038; 
 Fri, 02 Aug 2019 02:01:43 -0700 (PDT)
MIME-Version: 1.0
References: <1564731249-22671-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1564731249-22671-6-git-send-email-fabrizio.castro@bp.renesas.com>
 <20190802080613.GF5008@pendragon.ideasonboard.com>
In-Reply-To: <20190802080613.GF5008@pendragon.ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 2 Aug 2019 11:01:30 +0200
Message-ID: <CAMuHMdWw5SyP=jfwTpA=+qheTh1ckhiP_etn1J4PrRVdL4R1Pg@mail.gmail.com>
Subject: Re: [PATCH/RFC 05/12] drm: rcar-du: lvds: Add data swap support
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
 Chris Paterson <Chris.Paterson2@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Simon Horman <horms@verge.net.au>, David Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Biju Das <biju.das@bp.renesas.com>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTGF1cmVudCwKCk9uIEZyaSwgQXVnIDIsIDIwMTkgYXQgMTA6MDYgQU0gTGF1cmVudCBQaW5j
aGFydAo8bGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tPiB3cm90ZToKPiBPbiBGcmks
IEF1ZyAwMiwgMjAxOSBhdCAwODozNDowMkFNICswMTAwLCBGYWJyaXppbyBDYXN0cm8gd3JvdGU6
Cj4gPiBXaGVuIGluIHZlcnRpY2FsIHN0cmlwZSBtb2RlIG9mIG9wZXJhdGlvbiwgdGhlcmUgaXMg
dGhlIG9wdGlvbgo+ID4gb2Ygc3dhcHBpbmcgZXZlbiBkYXRhIGFuZCBvZGQgZGF0YSBvbiB0aGUg
dHdvIExWRFMgaW50ZXJmYWNlcwo+ID4gdXNlZCB0byBkcml2ZSB0aGUgdmlkZW8gb3V0cHV0Lgo+
ID4gQWRkIGRhdGEgc3dhcCBzdXBwb3J0IGJ5IGV4cG9zaW5nIGEgbmV3IERUIHByb3BlcnR5IG5h
bWVkCj4gPiAicmVuZXNhcyxzd2FwLWRhdGEiLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEZhYnJp
emlvIENhc3RybyA8ZmFicml6aW8uY2FzdHJvQGJwLnJlbmVzYXMuY29tPgoKPiA+IC0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJfbHZkcy5jCj4gPiArKysgYi9kcml2ZXJzL2dwdS9k
cm0vcmNhci1kdS9yY2FyX2x2ZHMuYwoKPiA+IEBAIC00MzksMTIgKzQ0MCwxNiBAQCBzdGF0aWMg
dm9pZCByY2FyX2x2ZHNfZW5hYmxlKHN0cnVjdCBkcm1fYnJpZGdlICpicmlkZ2UpCj4gPiAgICAg
ICByY2FyX2x2ZHNfd3JpdGUobHZkcywgTFZEQ0hDUiwgbHZkaGNyKTsKPiA+Cj4gPiAgICAgICBp
ZiAobHZkcy0+aW5mby0+cXVpcmtzICYgUkNBUl9MVkRTX1FVSVJLX0RVQUxfTElOSykgewo+ID4g
LSAgICAgICAgICAgICAvKgo+ID4gLSAgICAgICAgICAgICAgKiBDb25maWd1cmUgdmVydGljYWwg
c3RyaXBlIGJhc2VkIG9uIHRoZSBtb2RlIG9mIG9wZXJhdGlvbiBvZgo+ID4gLSAgICAgICAgICAg
ICAgKiB0aGUgY29ubmVjdGVkIGRldmljZS4KPiA+IC0gICAgICAgICAgICAgICovCj4gPiAtICAg
ICAgICAgICAgIHJjYXJfbHZkc193cml0ZShsdmRzLCBMVkRTVFJJUEUsCj4gPiAtICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBsdmRzLT5kdWFsX2xpbmsgPyBMVkRTVFJJUEVfU1RfT04gOiAw
KTsKPiA+ICsgICAgICAgICAgICAgdTMyIGx2ZHN0cmlwZSA9IDA7Cj4gPiArCj4gPiArICAgICAg
ICAgICAgIGlmIChsdmRzLT5kdWFsX2xpbmspCj4gPiArICAgICAgICAgICAgICAgICAgICAgLyoK
PiA+ICsgICAgICAgICAgICAgICAgICAgICAgKiBDb25maWd1cmUgdmVydGljYWwgc3RyaXBlIGJh
c2VkIG9uIHRoZSBtb2RlIG9mCj4gPiArICAgICAgICAgICAgICAgICAgICAgICogb3BlcmF0aW9u
IG9mIHRoZSBjb25uZWN0ZWQgZGV2aWNlLgo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAqLwo+
ID4gKyAgICAgICAgICAgICAgICAgICAgIGx2ZHN0cmlwZSA9IExWRFNUUklQRV9TVF9PTiB8IChs
dmRzLT5zdHJpcGVfc3dhcF9kYXRhID8KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgTFZEU1RSSVBFX1NUX1NXQVAgOiAwKTsKPgo+IFdvdWxk
IHRoZSBmb2xsb3dpbmcgYmUgc2ltcGxlciA/Cj4KPiAgICAgICAgICAgICAgICAgbHZkc3RyaXBl
ID0gKGx2ZHMtPmR1YWxfbGluayA/IExWRFNUUklQRV9TVF9PTiA6IDApCj4gICAgICAgICAgICAg
ICAgICAgICAgICAgICB8IChsdmRzLT5zdHJpcGVfc3dhcF9kYXRhID8gTFZEU1RSSVBFX1NUX1NX
QVAgOiAwKTsKCkZyb20gdGhlIHBvaW50IG9mIHZpZXcgb2YgIndjIC1sIjogeWVzLgpGcm9tIHRo
ZSBwb2ludCBvZiB2aWV3IG9mIHJlYWRhYmlsaXR5LCBJJ2QgZ28gZm9yOgoKICAgIGlmIChsdmRz
LT5kdWFsX2xpbmspCiAgICAgICAgICAgIGx2ZHN0cmlwZSB8PSBMVkRTVFJJUEVfU1RfT047CiAg
ICBpZiAobHZkcy0+c3RyaXBlX3N3YXBfZGF0YSkKICAgICAgICAgICAgbHZkc3RyaXBlIHw9IExW
RFNUUklQRV9TVF9TV0FQOwoKPiA+ICsgICAgICAgICAgICAgcmNhcl9sdmRzX3dyaXRlKGx2ZHMs
IExWRFNUUklQRSwgbHZkc3RyaXBlKTsKPiA+ICAgICAgIH0KPiA+Cj4gPiAgICAgICAvKgo+ID4g
QEAgLTc3MCw4ICs3NzUsMTIgQEAgc3RhdGljIGludCByY2FyX2x2ZHNfcGFyc2VfZHQoc3RydWN0
IHJjYXJfbHZkcyAqbHZkcykKCkdye29ldGplLGVldGluZ31zLAoKICAgICAgICAgICAgICAgICAg
ICAgICAgR2VlcnQKCi0tIApHZWVydCBVeXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExp
bnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxpbnV4LW02OGsub3JnCgpJbiBwZXJzb25hbCBjb252
ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4g
QnV0CndoZW4gSSdtIHRhbGtpbmcgdG8gam91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1l
ciIgb3Igc29tZXRoaW5nIGxpa2UgdGhhdC4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAtLSBMaW51cyBUb3J2YWxkcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
