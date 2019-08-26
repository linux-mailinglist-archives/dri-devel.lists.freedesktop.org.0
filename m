Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 297799CAA9
	for <lists+dri-devel@lfdr.de>; Mon, 26 Aug 2019 09:34:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C139489DA2;
	Mon, 26 Aug 2019 07:34:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
 [209.85.210.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF21489DFD
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Aug 2019 07:34:52 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id r20so14295081ota.5
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Aug 2019 00:34:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ay8N/faohD0Lm5RaNx+jFCWBPDb56qWI9o+yg7jXEF4=;
 b=UIjQRY1RCoOrf9NL1LQhEfVRsmRFsTtfvRepJAQBsHeVV9UUGcRO6HH3yR3R5W8RS0
 d9PyfmV/cOFgxEql2zfoCfSfMLkLro063zVpWoiC3ECVLFmUX9/VCjIHmGvUlr+W20VC
 P9EGBt/5ahK8ufUbbCOTngnx3TIAphbhmXYswqZcBv2P0opVHXA4ShCChRYW29/Cysk4
 FM8Gx2UlK3Iav/pq6QntR60sOlPQRBV3x5jZp2bTqs+tABVEJE1Z0+p1YDNESTfm9LGN
 k2I0dngmESZvq366zGDAvvBxHOSgdshub8LM1gFEMfOQcMTwfvLFQMJGxN916tjVBy6A
 GdJg==
X-Gm-Message-State: APjAAAXLOwot0FjQtHqG62pNijZlaucDpNj0Zf8sk5P90kAVKywHqRAE
 fEBtTyGFHG/cQplINJnZqSIIvFCk1S/bzBjysmo=
X-Google-Smtp-Source: APXvYqzy1veDPd3iL/NVpS6ZbZGKhvD5DPUadhwD8wnxhM0EWUPvpHpdeCesQKBpWxzo5eBHxKlovNB9O0GVLTmCxSE=
X-Received: by 2002:a9d:68c5:: with SMTP id i5mr14294327oto.250.1566804892097; 
 Mon, 26 Aug 2019 00:34:52 -0700 (PDT)
MIME-Version: 1.0
References: <20190825135154.11488-1-jacopo+renesas@jmondi.org>
 <20190825135154.11488-2-jacopo+renesas@jmondi.org>
In-Reply-To: <20190825135154.11488-2-jacopo+renesas@jmondi.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 26 Aug 2019 09:34:41 +0200
Message-ID: <CAMuHMdVvjrMXap5CQ-grNYpJfOG6QeN26EW4tR_YE=VFv5ozqw@mail.gmail.com>
Subject: Re: [PATCH v3 01/14] dt-bindings: display: renesas,
 cmm: Add R-Car CMM documentation
To: Jacopo Mondi <jacopo+renesas@jmondi.org>
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
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Harsha.ManjulaMallikarjun@in.bosch.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgSmFjb3BvLAoKT24gU3VuLCBBdWcgMjUsIDIwMTkgYXQgMzo1MCBQTSBKYWNvcG8gTW9uZGkg
PGphY29wbytyZW5lc2FzQGptb25kaS5vcmc+IHdyb3RlOgo+IEFkZCBkZXZpY2UgdHJlZSBiaW5k
aW5ncyBkb2N1bWVudGF0aW9uIGZvciB0aGUgUmVuZXNhcyBSLUNhciBEaXNwbGF5Cj4gVW5pdCBD
b2xvciBNYW5hZ2VtZW50IE1vZHVsZS4KPgo+IENNTSBpcyB0aGUgaW1hZ2UgZW5oYW5jZW1lbnQg
bW9kdWxlIGF2YWlsYWJsZSBvbiBlYWNoIFItQ2FyIERVIHZpZGVvCj4gY2hhbm5lbCBvbiBSLUNh
ciBHZW4yIGFuZCBHZW4zIFNvQ3MgKFYzSCBhbmQgVjNNIGV4Y2x1ZGVkKS4KPgo+IFNpZ25lZC1v
ZmYtYnk6IEphY29wbyBNb25kaSA8amFjb3BvK3JlbmVzYXNAam1vbmRpLm9yZz4KClRoYW5rcyBm
b3IgeW91ciBwYXRjaCEKCj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3JlbmVzYXMsY21tLnR4dAo+IEBAIC0wLDAgKzEsMzMg
QEAKPiArKiBSZW5lc2FzIFItQ2FyIENvbG9yIE1hbmFnZW1lbnQgTW9kdWxlIChDTU0pCj4gKwo+
ICtSZW5lc2FzIFItQ2FyIGltYWdlIGVuaGFuY2VtZW50IG1vZHVsZSBjb25uZWN0ZWQgdG8gUi1D
YXIgRFUgdmlkZW8gY2hhbm5lbHMuCj4gKwo+ICtSZXF1aXJlZCBwcm9wZXJ0aWVzOgo+ICsgLSBj
b21wYXRpYmxlOiBzaGFsbCBiZSBvbmUgb3IgbW9yZSBvZiB0aGUgZm9sbG93aW5nOgo+ICsgICAt
ICJyZW5lc2FzLGNtbS1yOGE3Nzk1IjogZm9yIFI4QTc3OTUgKFItQ2FyIEgzKSBjb21wYXRpYmxl
IENNTS4KPiArICAgLSAicmVuZXNhcyxjbW0tcjhhNzc5NiI6IGZvciBSOEE3Nzk2IChSLUNhciBN
My1XKSBjb21wYXRpYmxlIENNTS4KPiArICAgLSAicmVuZXNhcyxjbW0tcjhhNzc5NjUiOiBmb3Ig
UjhBNzc5NjUgKFItQ2FyIE0zLU4pIGNvbXBhdGlibGUgQ01NLgo+ICsgICAtICJyZW5lc2FzLGNt
bS1yOGE3Nzk5MCI6IGZvciBSOEE3Nzk5MCAoUi1DYXIgRTMpIGNvbXBhdGlibGUgQ01NLgo+ICsg
ICAtICJyZW5lc2FzLGNtbS1yOGE3Nzk5NSI6IGZvciBSOEE3Nzk5NSAoUi1DYXIgRDMpIGNvbXBh
dGlibGUgQ01NLgoKUGxlYXNlIHVzZSAicmVuZXNhcyw8c29jeXBlLT4tY21tIiBpbnN0ZWFkIG9m
ICJyZW5lc2FzLGNtbS08c29jdHlwZT4iLgoKPiArICAgLSAicmVuZXNhcyxyY2FyLWdlbjMtY21t
IjogZm9yIGEgZ2VuZXJpYyBSLUNhciBHZW4zIGNvbXBhdGlibGUgQ01NLgo+ICsgICAtICJyZW5l
c2FzLHJjYXItZ2VuMi1jbW0iOiBmb3IgYSBnZW5lcmljIFItQ2FyIEdlbjIgY29tcGF0aWJsZSBD
TU0uCj4gKwo+ICsgICBXaGVuIHRoZSBnZW5lcmljIGNvbXBhdGlibGUgc3RyaW5nIGlzIHNwZWNp
ZmllZCwgdGhlIFNvQy1zcGVjaWZpYwo+ICsgICB2ZXJzaW9uIGNvcnJlc3BvbmRpbmcgdG8gdGhl
IHBsYXRmb3JtIHNob3VsZCBiZSBsaXN0ZWQgZmlyc3QuCj4gKwo+ICsgLSByZWc6IHRoZSBhZGRy
ZXNzIGJhc2UgYW5kIGxlbmd0aCBvZiB0aGUgbWVtb3J5IGFyZWEgd2hlcmUgQ01NIGNvbnRyb2wK
PiArICAgcmVnaXN0ZXJzIGFyZSBtYXBwZWQgdG8uCj4gKwo+ICsgLSBjbG9ja3M6IHBoYW5kbGUg
YW5kIGNsb2NrLXNwZWNpZmllciBwYWlyIHRvIHRoZSBDTU0gZnVuY3Rpb25hbCBjbG9jawo+ICsg
ICBzdXBwbGllci4KClRoaW5raW5nIGFib3V0IHlhbWwgdmFsaWRhdGlvbjoKCnBvd2VyLWRvbWFp
bnM/CnJlc2V0cz8KCj4gK0V4YW1wbGU6Cj4gKy0tLS0tLS0tCj4gKwo+ICsgICAgICAgY21tMDog
Y21tQGZlYTQwMDAwIHsKPiArICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJyZW5lc2FzLGNt
bS1yOGE3Nzk2IjsKPiArICAgICAgICAgICAgICAgcmVnID0gPDAgMHhmZWE0MDAwMCAwIDB4MTAw
MD47Cj4gKyAgICAgICAgICAgICAgIHBvd2VyLWRvbWFpbnMgPSA8JnN5c2MgUjhBNzc5Nl9QRF9B
TFdBWVNfT04+Owo+ICsgICAgICAgICAgICAgICBjbG9ja3MgPSA8JmNwZyBDUEdfTU9EIDcxMT47
Cj4gKyAgICAgICAgICAgICAgIHJlc2V0cyA9IDwmY3BnIDcxMT47Cj4gKyAgICAgICB9OwoKR3J7
b2V0amUsZWV0aW5nfXMsCgogICAgICAgICAgICAgICAgICAgICAgICBHZWVydAoKLS0gCkdlZXJ0
IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2Vl
cnRAbGludXgtbTY4ay5vcmcKCkluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmlj
YWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLiBCdXQKd2hlbiBJJ20gdGFsa2luZyB0
byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcgbGlrZSB0
aGF0LgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRzCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
