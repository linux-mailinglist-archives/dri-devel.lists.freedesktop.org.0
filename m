Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 894CA9CBB2
	for <lists+dri-devel@lfdr.de>; Mon, 26 Aug 2019 10:38:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A40E89FC9;
	Mon, 26 Aug 2019 08:38:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
 [209.85.167.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F7AF897E4
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Aug 2019 08:38:16 +0000 (UTC)
Received: by mail-oi1-f193.google.com with SMTP id h21so11504664oie.7
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Aug 2019 01:38:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=S97RvsRiKIiK8t6HN0Bo20TQZGEw922DDvAZ31Eixeg=;
 b=opyep3cpJg/2zbBD8MXQhLWBA+5EjnCO9lFzkwDMkhBkbO+InMVfrCgmQgFydWGj3z
 y3ZJyKEe/6IjmJIIBcJZBVO+U97nY0hpvFp7nCyzc+ZBEz1AVRNV4pHIHHMELadRyzI9
 LoeNoHMOnQTOGY4XZ//LWIe7iZglOXLNCRS6VQ0l5aiEdtzULhtkEWyj9vKlQnevjD7t
 Hs+Lt3vOOAWFc9WfGw2+shSI6bgkt2xuNbBcNP01AvuelsRG8pp/E10Q5CDVCFu7o0B4
 ycjGF2pDtm+PtsiEzyzPPS5AZRViXdVOR7PpyVkfCCxF0fTWmv1K0TSS1IkB/9oyJL9x
 ELBQ==
X-Gm-Message-State: APjAAAV3YyEQKgZwJ4vP0asxoOgG8KvHXuCA3bdUA4EVwp1jfA2N+zSP
 4I0acKsvDpv3XHFt7VvDZVM68X5EUWKniQqqsqM=
X-Google-Smtp-Source: APXvYqwS8pPXQBTu7rOA7Ra36ZN5byF9JEUVZwQ88s7wxrXqb3PQ6w+mwoiH0MbAT1cJodMEFqRUkvdBUISj1SUi2yc=
X-Received: by 2002:aca:b154:: with SMTP id a81mr10921390oif.148.1566808695135; 
 Mon, 26 Aug 2019 01:38:15 -0700 (PDT)
MIME-Version: 1.0
References: <20190825135154.11488-1-jacopo+renesas@jmondi.org>
 <20190825135154.11488-2-jacopo+renesas@jmondi.org>
 <CAMuHMdVvjrMXap5CQ-grNYpJfOG6QeN26EW4tR_YE=VFv5ozqw@mail.gmail.com>
 <20190826075943.h7ivwagape3glym5@uno.localdomain>
In-Reply-To: <20190826075943.h7ivwagape3glym5@uno.localdomain>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 26 Aug 2019 10:38:04 +0200
Message-ID: <CAMuHMdWgc2QQu38mqcYrutwKzED-e0-cMUV-vEwa5njqGTB=mg@mail.gmail.com>
Subject: Re: [PATCH v3 01/14] dt-bindings: display: renesas,
 cmm: Add R-Car CMM documentation
To: Jacopo Mondi <jacopo@jmondi.org>
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
 Simon Horman <horms@verge.net.au>, VenkataRajesh.Kalakodima@in.bosch.com,
 David Airlie <airlied@linux.ie>, Mark Rutland <mark.rutland@arm.com>,
 Koji Matsuoka <koji.matsuoka.xm@renesas.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Harsha.ManjulaMallikarjun@in.bosch.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgSmFjb3BvLAoKT24gTW9uLCBBdWcgMjYsIDIwMTkgYXQgOTo1OCBBTSBKYWNvcG8gTW9uZGkg
PGphY29wb0BqbW9uZGkub3JnPiB3cm90ZToKPiBPbiBNb24sIEF1ZyAyNiwgMjAxOSBhdCAwOToz
NDo0MUFNICswMjAwLCBHZWVydCBVeXR0ZXJob2V2ZW4gd3JvdGU6Cj4gPiBPbiBTdW4sIEF1ZyAy
NSwgMjAxOSBhdCAzOjUwIFBNIEphY29wbyBNb25kaSA8amFjb3BvK3JlbmVzYXNAam1vbmRpLm9y
Zz4gd3JvdGU6Cj4gPiA+IEFkZCBkZXZpY2UgdHJlZSBiaW5kaW5ncyBkb2N1bWVudGF0aW9uIGZv
ciB0aGUgUmVuZXNhcyBSLUNhciBEaXNwbGF5Cj4gPiA+IFVuaXQgQ29sb3IgTWFuYWdlbWVudCBN
b2R1bGUuCj4gPiA+Cj4gPiA+IENNTSBpcyB0aGUgaW1hZ2UgZW5oYW5jZW1lbnQgbW9kdWxlIGF2
YWlsYWJsZSBvbiBlYWNoIFItQ2FyIERVIHZpZGVvCj4gPiA+IGNoYW5uZWwgb24gUi1DYXIgR2Vu
MiBhbmQgR2VuMyBTb0NzIChWM0ggYW5kIFYzTSBleGNsdWRlZCkuCj4gPiA+Cj4gPiA+IFNpZ25l
ZC1vZmYtYnk6IEphY29wbyBNb25kaSA8amFjb3BvK3JlbmVzYXNAam1vbmRpLm9yZz4KPiA+Cj4g
PiBUaGFua3MgZm9yIHlvdXIgcGF0Y2ghCj4gPgo+ID4gPiAtLS0gL2Rldi9udWxsCj4gPiA+ICsr
KyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3JlbmVzYXMsY21t
LnR4dAo+ID4gPiBAQCAtMCwwICsxLDMzIEBACj4gPiA+ICsqIFJlbmVzYXMgUi1DYXIgQ29sb3Ig
TWFuYWdlbWVudCBNb2R1bGUgKENNTSkKPiA+ID4gKwo+ID4gPiArUmVuZXNhcyBSLUNhciBpbWFn
ZSBlbmhhbmNlbWVudCBtb2R1bGUgY29ubmVjdGVkIHRvIFItQ2FyIERVIHZpZGVvIGNoYW5uZWxz
Lgo+ID4gPiArCj4gPiA+ICtSZXF1aXJlZCBwcm9wZXJ0aWVzOgo+ID4gPiArIC0gY29tcGF0aWJs
ZTogc2hhbGwgYmUgb25lIG9yIG1vcmUgb2YgdGhlIGZvbGxvd2luZzoKPiA+ID4gKyAgIC0gInJl
bmVzYXMsY21tLXI4YTc3OTUiOiBmb3IgUjhBNzc5NSAoUi1DYXIgSDMpIGNvbXBhdGlibGUgQ01N
Lgo+ID4gPiArICAgLSAicmVuZXNhcyxjbW0tcjhhNzc5NiI6IGZvciBSOEE3Nzk2IChSLUNhciBN
My1XKSBjb21wYXRpYmxlIENNTS4KPiA+ID4gKyAgIC0gInJlbmVzYXMsY21tLXI4YTc3OTY1Ijog
Zm9yIFI4QTc3OTY1IChSLUNhciBNMy1OKSBjb21wYXRpYmxlIENNTS4KPiA+ID4gKyAgIC0gInJl
bmVzYXMsY21tLXI4YTc3OTkwIjogZm9yIFI4QTc3OTkwIChSLUNhciBFMykgY29tcGF0aWJsZSBD
TU0uCj4gPiA+ICsgICAtICJyZW5lc2FzLGNtbS1yOGE3Nzk5NSI6IGZvciBSOEE3Nzk5NSAoUi1D
YXIgRDMpIGNvbXBhdGlibGUgQ01NLgo+ID4KPiA+IFBsZWFzZSB1c2UgInJlbmVzYXMsPHNvY3lw
ZS0+LWNtbSIgaW5zdGVhZCBvZiAicmVuZXNhcyxjbW0tPHNvY3R5cGU+Ii4KPiA+Cj4KPiBJIGFj
dHVhbGx5IGNvcGllZCBpdCBmcm9tIHRoZSByLWNhciBncGlvIGJpbmRpbmdzLCBhbmQgSSBsaWtl
ZAo+IGNtbS08c29jdHlwZT4gYmV0dGVyLiBJZiB5b3UgcHJlZmVyIEkgY2FuIGNoYW5nZSBpdCB0
aG91Z2guCgpXZSBzd2l0Y2hlZCBmcm9tICJyZW5lc2FzLGNtbS08c29jdHlwZT4iIHRvICJyZW5l
c2FzLDxzb2N5cGUtPi1jbW0iCmEgZmV3IHllYXJzIGFnbywgdXBvbiByZXF1ZXN0IGZyb20gdGhl
IERUIHBlb3BsZToKCiAgICB2ZW5kb3IgLT4gZmFtaWx5L1NvQyAtPiBJUCBjb3JlCgpVbmZvcnR1
bmF0ZWx5IHdlIGNhbm5vdCBjaGFuZ2UgdGhlIG9sZCBzdHlsZSBpbiBleGlzdGluZyBiaW5kaW5n
cywgd2l0aG91dApncmVhdCBlZmZvcnQgYW5kIGJhY2t3YXJkcyBjb21wYXRpYmlsaXR5IHJhbWlm
aWNhdGlvbnMuCgpHcntvZXRqZSxlZXRpbmd9cywKCiAgICAgICAgICAgICAgICAgICAgICAgIEdl
ZXJ0CgotLSAKR2VlcnQgVXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51eCBiZXlv
bmQgaWEzMiAtLSBnZWVydEBsaW51eC1tNjhrLm9yZwoKSW4gcGVyc29uYWwgY29udmVyc2F0aW9u
cyB3aXRoIHRlY2huaWNhbCBwZW9wbGUsIEkgY2FsbCBteXNlbGYgYSBoYWNrZXIuIEJ1dAp3aGVu
IEknbSB0YWxraW5nIHRvIGpvdXJuYWxpc3RzIEkganVzdCBzYXkgInByb2dyYW1tZXIiIG9yIHNv
bWV0aGluZyBsaWtlIHRoYXQuCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLS0gTGlu
dXMgVG9ydmFsZHMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
