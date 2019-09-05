Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3651AAA2A7
	for <lists+dri-devel@lfdr.de>; Thu,  5 Sep 2019 14:05:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0ACA86E092;
	Thu,  5 Sep 2019 12:05:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
 [209.85.167.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 651D06E092
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Sep 2019 12:05:46 +0000 (UTC)
Received: by mail-oi1-f193.google.com with SMTP id v7so1589928oib.4
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Sep 2019 05:05:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uDPcDY1i2jtjkqYWiRv99e2tz5csWw3OmT8nJpxEh5w=;
 b=Tda1dnknzsyz5z/gqMzuEyAcDwgYtBM0VZu0fMYJsn3zk+kKDzd78TUg2/03Dmg5sF
 yyTmnuw4RRPKLhuApambY6kiBgtbsOsBZxC8U1fig1ajrik+rQatYrjQ7XRg4YGqc+mH
 VUkMhJ5QXhKKncsjHJBeXUzd1YBleC+r0GtaP+huffLWkdgx9gzvARIVo1L/VTRMe8p1
 WAf+GwaL716flU6KkCfLiSgDjew6mupC5qB9enCiAsNQmVUL+lfG2QtwFrRrJxe6PIZd
 fLVewSVwreqsQhp5aPZwMvT1ADm5e2ujm19VFsQK/+Hb4hSwLZv3PsxBtKzwpALujd7Q
 aZNQ==
X-Gm-Message-State: APjAAAXACYRPp+7qwRaLzjTjVa6rPISSlNoAj/XZTITXjQnL20lJ0R3/
 HUqgj+V0e4+/yiGzqwrSJo306jx8W5HT9+jAlaw=
X-Google-Smtp-Source: APXvYqwpJ443LWGufLd3u3Kr3HTxqxfWDoGjtPVjZUudTj0e2WRY1jT2mf+lcBAhCcqSef0fzUV0E58hAN+JwMzXjDw=
X-Received: by 2002:a05:6808:98a:: with SMTP id
 a10mr2275766oic.54.1567685145527; 
 Thu, 05 Sep 2019 05:05:45 -0700 (PDT)
MIME-Version: 1.0
References: <20190825135154.11488-1-jacopo+renesas@jmondi.org>
 <20190825135154.11488-2-jacopo+renesas@jmondi.org>
 <CAMuHMdVvjrMXap5CQ-grNYpJfOG6QeN26EW4tR_YE=VFv5ozqw@mail.gmail.com>
 <20190826075943.h7ivwagape3glym5@uno.localdomain>
 <20190826101550.GB5031@pendragon.ideasonboard.com>
 <20190830180108.mlei4wbfn3mktj23@uno.localdomain>
 <20190905115017.GI5035@pendragon.ideasonboard.com>
In-Reply-To: <20190905115017.GI5035@pendragon.ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 5 Sep 2019 14:05:34 +0200
Message-ID: <CAMuHMdW-MEQvf7MgY7XQkKap-mm8=TO8V61BFtVv63oacFTfYQ@mail.gmail.com>
Subject: Re: [PATCH v3 01/14] dt-bindings: display: renesas,
 cmm: Add R-Car CMM documentation
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
Cc: muroya@ksk.co.jp, Ulrich Hecht <uli@fpond.eu>,
 Jacopo Mondi <jacopo@jmondi.org>, Simon Horman <horms@verge.net.au>,
 VenkataRajesh.Kalakodima@in.bosch.com, David Airlie <airlied@linux.ie>,
 Mark Rutland <mark.rutland@arm.com>,
 Koji Matsuoka <koji.matsuoka.xm@renesas.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Harsha.ManjulaMallikarjun@in.bosch.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTGF1cmVudCwKCk9uIFRodSwgU2VwIDUsIDIwMTkgYXQgMTo1MCBQTSBMYXVyZW50IFBpbmNo
YXJ0CjxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+IHdyb3RlOgo+IE9uIEZyaSwg
QXVnIDMwLCAyMDE5IGF0IDA4OjAxOjA5UE0gKzAyMDAsIEphY29wbyBNb25kaSB3cm90ZToKPiA+
IE9uIE1vbiwgQXVnIDI2LCAyMDE5IGF0IDAxOjE1OjUwUE0gKzAzMDAsIExhdXJlbnQgUGluY2hh
cnQgd3JvdGU6Cj4gPiA+IEhvdyBhYm91dCBjb252ZXJ0aW5nIHRoaXMgYmluZGluZyB0byB5YW1s
IGFscmVheSA/IEl0IHNob3VsZCBiZSBmYWlybHkKPiA+ID4gc2ltcGxlLgo+ID4KPiA+IEknbSB0
cnlpbmcgdG8sIGFuZCBJJ20gaGF2aW5nIG15IHBvcnRpb24gb2YgZnVuIHRpbWUgYXQgaXQuCj4g
Pgo+ID4gVGhlIGRlZmluaXRpb24gb2YgdGhlIHNjaGVtYSBpdHNlbGYgc2VlbXMgZ29vZCwgYnV0
IEkgd29uZGVyLCBpcyB0aGlzCj4gPiB0aGUgZmlyc3QgcmVuZXNhcyBzY2hlbWEgd2UgaGF2ZT8g
QmVjYXVzZSBpdCBzZWVtcyB0byBtZSB0aGUgc2NoZW1hCj4gPiB2YWxpZGF0b3IgaXMgaGF2aW5n
IGFuIGhhcmQgdGltZSB0byBkaWdlc3QgdGhlIGV4YW1wbGVhICdjbG9ja3MnIGFuZAo+ID4gJ3Bv
d2VyLWRvbWFpbnMnIHByb3BlcnRpZXMsIHdoaWNoIGhhdmUgMSBwaGFuZGxlIGFuZCAyIHNwZWNp
ZmllcnMgYW5kIDEKPiA+IHBoYW5kbGUgYW5kIDEgc3BlY2lmaWVyIHJlc3BlY3RpdmVseSBmb3Ig
UmVuc2FzIFNvQ3MuCj4gPgo+ID4gSW4gb3RoZXIgd29yZHMsIGlmIGluIHRoZSBleGFtcGxlIEkg
aGF2ZToKPiA+Cj4gPiAgZXhhbXBsZXM6Cj4gPiAgICAtIHwKPiA+ICAgICAgY21tMDogY21tQGZl
YTQwMDAwIHsKPiA+ICAgICAgICAgICBjb21wYXRpYmxlID0gInJlbmVzYXMscjhhNzc5Ni1jbW0i
Owo+ID4gICAgICAgICAgIHJlZyA9IDwwIDB4ZmVhNDAwMDAgMCAweDEwMDA+Owo+ID4gICAgICAg
ICAgIGNsb2NrcyA9IDwmY3BnIDcxMT4gICAgICAgICAgICAgIDwtLS0tIDEgcGhhbmRsZSArIDEg
c3BlY2lmaWVyCj4gPiAgICAgICAgICAgcmVzZXRzID0gPCZjcGcgNzExPjsKPiA+ICAgICAgICAg
ICBwb3dlci1kb21haW5zID0gPCZzeXNjPjsgICAgICAgICA8LS0tLSAxIHBoYW5kbGUKPiA+ICAg
ICAgfTsKPiA+Cj4gPiBUaGUgc2NoZW1hIHZhbGlkYXRpb24gaXMgZ29vZC4KPiA+Cj4gPiBXaGls
ZSBpZiBJIHVzZSBhbiBhY3R1YWwgZXhhbXBsZQo+ID4gICAgLSB8Cj4gPiAgICAgIGNtbTA6IGNt
bUBmZWE0MDAwMCB7Cj4gPiAgICAgICAgICAgY29tcGF0aWJsZSA9ICJyZW5lc2FzLHI4YTc3OTYt
Y21tIjsKPiA+ICAgICAgICAgICByZWcgPSA8MCAweGZlYTQwMDAwIDAgMHgxMDAwPjsKPiA+ICAg
ICAgICAgICBjbG9ja3MgPSA8JmNwZyBDUEdfTU9EIDcxMT4gICAgICAgICA8LS0tLSAxIHBoYW5k
bGUgKyAyIHNwZWNpZmllcgo+ID4gICAgICAgICAgIHJlc2V0cyA9IDwmY3BnIDcxMT47Cj4gPiAg
ICAgICAgICAgcG93ZXItZG9tYWlucyA9IDwmc3lzYyBSOEE3Nzk2X1BEX0FMV0FZU19PTj47IDwt
LS0tIDEgcGhhbmRsZQo+ID4gICAgICB9OyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICArIDEgc3BlY2ZpZXIKPiA+Cj4gPiBUaGUgc2NoZW1hIHZh
bGlkYXRpb24gZmFpbHMuLi4KPiA+IEVycm9yOiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvZGlzcGxheS9yZW5lc2FzLGNtbS5leGFtcGxlLmR0czoyMC4yOS0zMCBzeW50YXggZXJy
b3IKPiA+IEZBVEFMIEVSUk9SOiBVbmFibGUgdG8gcGFyc2UgaW5wdXQgdHJlZQo+ID4KPiA+IEFy
ZSBjbG9ja3MgcHJvcGVydGllcyB3aXRoID4gMiBlbnRyaWVzIGFuZCBwb3dlci1kb21haW5zIHBy
b3BlcnRpZXMgd2l0aAo+ID4gPiAxIGVudHJpZXMgc3VwcG9ydGVkPwo+ID4KPiA+IEJlY2F1c2Ug
ZnJvbSB3aGF0IEkgcmVhZCBoZXJlOgo+ID4gaHR0cHM6Ly9naXRodWIuY29tL3JvYmhlcnJpbmcv
eWFtbC1iaW5kaW5ncy9ibG9iL21hc3Rlci9zY2hlbWFzL2Nsb2NrL2Nsb2NrLnlhbWwKPiA+ICJU
aGUgbGVuZ3RoIG9mIGEgY2xvY2sgc3BlY2lmaWVyIGlzIGRlZmluZWQgYnkgdGhlIHZhbHVlIG9m
IGEgI2Nsb2NrLWNlbGxzCj4gPiBwcm9wZXJ0eSBpbiB0aGUgY2xvY2sgcHJvdmlkZXIgbm9kZS4i
Cj4gPgo+ID4gQW5kIHRoYXQncyBleHBlY3RlZCwgYnV0IGlzIHRoZSBleGFtcGxlcyBhY3R1YWxs
eSB2YWxpZGF0ZWQgYWdhaW5zdCB0aGUKPiA+IGNsb2NrIHByb3ZpZGVyIHBvaW50ZWQgYnkgdGhl
IHBoYW5kbGU/IEJlY2F1c2UgaW4gdGhhdCBjYXNlLCBpZiB3ZSBoYWQgYQo+ID4geWFtbCBzY2hl
bWEgZm9yIHRoZSBjcGctbXNzciBwcm92aWRlciwgaXQgd291bGQgaW5kZWVkIHNwZWNpZnkgY2xv
Y2stY2VsbHM9Mi4KPiA+Cj4gPiBEbyB3ZSBuZWVkIGEgc2NoZW1hIGZvciBjcGctbXNzciBmaXJz
dCwgb3IgYW0gSSBkb2luZyBzb21ldGhpbmcgZWxzZQo+ID4gd3Jvbmc/Cj4KPiBJIHRoaW5rIHlv
dSBqdXN0IG5lZWQgdG8gI2luY2x1ZGUgdGhlIGhlYWRlcnMgdGhhdCBkZWZpbmUgQ1BHX01PRCBh
bmQKPiBSOEE3Nzk2X1BEX0FMV0FZU19PTi4KCklmIHRoYXQgaGVscHMsIHlvdSBtaWdodCB3YW50
IHRvIHJlcGxhY2UgdGhlIHN5bWJvbHMgaW4gdGhlIGV4YW1wbGVzIGJ5IHRoZWlyCmFjdHVhbCB2
YWx1ZXMgKDEgcmVzcC4gMzIpLgoKQW5kIHBlcmhhcHMga2VlcCB0aGUgc3ltYm9scyBhcyBjb21t
ZW50cz8KCiAgICAgICAgY2xvY2tzID0gPCZjcGcgMSAvKiBDUEdfTU9EICovIDcxMT47CiAgICAg
ICAgcG93ZXItZG9tYWlucyA9IDwmc3lzYyAzMiAvKiBSOEE3Nzk2X1BEX0FMV0FZU19PTiAqLz47
CgpHcntvZXRqZSxlZXRpbmd9cywKCiAgICAgICAgICAgICAgICAgICAgICAgIEdlZXJ0CgotLSAK
R2VlcnQgVXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51eCBiZXlvbmQgaWEzMiAt
LSBnZWVydEBsaW51eC1tNjhrLm9yZwoKSW4gcGVyc29uYWwgY29udmVyc2F0aW9ucyB3aXRoIHRl
Y2huaWNhbCBwZW9wbGUsIEkgY2FsbCBteXNlbGYgYSBoYWNrZXIuIEJ1dAp3aGVuIEknbSB0YWxr
aW5nIHRvIGpvdXJuYWxpc3RzIEkganVzdCBzYXkgInByb2dyYW1tZXIiIG9yIHNvbWV0aGluZyBs
aWtlIHRoYXQuCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLS0gTGludXMgVG9ydmFs
ZHMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
