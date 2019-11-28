Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 114C810C49A
	for <lists+dri-devel@lfdr.de>; Thu, 28 Nov 2019 08:56:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EF9B6E58A;
	Thu, 28 Nov 2019 07:56:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 692496E58A
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Nov 2019 07:56:26 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id n23so21447234otr.13
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Nov 2019 23:56:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=o3hCFZ6+p7EcgiW/0t4v3r/wkobHJ7w7wfnwP0j/QsY=;
 b=Z3n2pI5rEz5aUB9Ky5dGgXDzgyeHRQkYPCna+AyVBeHuuXhKgCSHjKpWUjsAEX2RSU
 YzV7C1kagOaBwH8Je7H3dURey5HuIi30q5A9Qz4AvegyoVqEnQ7hj4OYQeF5CbQdfRsA
 8SIzGbyGLfsgqCTdZzgLzlg12z7qni/BtGnqB47JGf0X+SsFMcY5C47NpyHqUQbIbVz/
 wrk6RNvDGFL/j6KUGtVhkqJTQEdoMRth+fW0lcoXfFfsasVQ+/lCJUjbJYIIM3nIqmnl
 ttVsXBMN8qna4v9i5gE8oRRaLCh3tNmCrLSkJDh/0xF6u+mQf58DfwmNfEGpN2ORL9On
 +0EQ==
X-Gm-Message-State: APjAAAWeDHYcnx1EMls8DNW8YYUULbHX5thAd68MsJoeHd7kKa806IRA
 /F7ZbyB50BI9qnryZnDKcT+p0OCQTkUQprUj8mY=
X-Google-Smtp-Source: APXvYqwqkh/+m7CvwkKLpgmQVtVdyb2UFLRo1oNsNbjJ4rhfL6gGn9lIs/GN0Fr5g34/udViAXGDfuOsZi8Slv5+ukw=
X-Received: by 2002:a9d:5d10:: with SMTP id b16mr1438412oti.250.1574927785474; 
 Wed, 27 Nov 2019 23:56:25 -0800 (PST)
MIME-Version: 1.0
References: <20191113100556.15616-1-jacopo+renesas@jmondi.org>
 <20191113100556.15616-4-jacopo+renesas@jmondi.org>
In-Reply-To: <20191113100556.15616-4-jacopo+renesas@jmondi.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 28 Nov 2019 08:56:14 +0100
Message-ID: <CAMuHMdWS2bv=RhQ3y5gNzZFT6CeH-a+h7xc6KYvcv0Anht6zGw@mail.gmail.com>
Subject: Re: [PATCH v7 3/7] drm: rcar-du: Add support for CMM
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
Cc: Simon Horman <horms@verge.net.au>, David Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Ulrich Hecht <uli+renesas@fpond.eu>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgSmFjb3BvLAoKT24gV2VkLCBOb3YgMTMsIDIwMTkgYXQgMTE6MDQgQU0gSmFjb3BvIE1vbmRp
IDxqYWNvcG8rcmVuZXNhc0BqbW9uZGkub3JnPiB3cm90ZToKPiBBZGQgYSBkcml2ZXIgZm9yIHRo
ZSBSLUNhciBEaXNwbGF5IFVuaXQgQ29sb3IgQ29ycmVjdGlvbiBNb2R1bGUuCj4gSW4gbW9zdCBv
ZiBHZW4zIFNvQ3MsIGVhY2ggRFUgb3V0cHV0IGNoYW5uZWwgaXMgcHJvdmlkZWQgd2l0aCBhIENN
TSB1bml0Cj4gdG8gcGVyZm9ybSBpbWFnZSBlbmhhbmNlbWVudCBhbmQgY29sb3IgY29ycmVjdGlv
bi4KPgo+IEFkZCBzdXBwb3J0IGZvciBDTU0gdGhyb3VnaCBhIGRyaXZlciB0aGF0IHN1cHBvcnRz
IGNvbmZpZ3VyYXRpb24gb2YKPiB0aGUgMS1kaW1lbnNpb25hbCBMVVQgdGFibGUuIE1vcmUgYWR2
YW5jZWQgQ01NIGZlYXR1cmVzIHdpbGwgYmUKPiBpbXBsZW1lbnRlZCBvbiB0b3Agb2YgdGhpcyBp
bml0aWFsIG9uZS4KPgo+IFJldmlld2VkLWJ5OiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBp
bmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+Cj4gUmV2aWV3ZWQtYnk6IEtpZXJhbiBCaW5naGFtIDxr
aWVyYW4uYmluZ2hhbStyZW5lc2FzQGlkZWFzb25ib2FyZC5jb20+Cj4gU2lnbmVkLW9mZi1ieTog
SmFjb3BvIE1vbmRpIDxqYWNvcG8rcmVuZXNhc0BqbW9uZGkub3JnPgoKPiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0vcmNhci1kdS9LY29uZmlnCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3JjYXItZHUv
S2NvbmZpZwo+IEBAIC01LDYgKzUsNyBAQCBjb25maWcgRFJNX1JDQVJfRFUKPiAgICAgICAgIGRl
cGVuZHMgb24gQVJNIHx8IEFSTTY0Cj4gICAgICAgICBkZXBlbmRzIG9uIEFSQ0hfUkVORVNBUyB8
fCBDT01QSUxFX1RFU1QKPiAgICAgICAgIGltcGx5IERSTV9SQ0FSX0xWRFMKPiArICAgICAgIGlt
cGx5IERSTV9SQ0FSX0NNTQo+ICAgICAgICAgc2VsZWN0IERSTV9LTVNfSEVMUEVSCj4gICAgICAg
ICBzZWxlY3QgRFJNX0tNU19DTUFfSEVMUEVSCj4gICAgICAgICBzZWxlY3QgRFJNX0dFTV9DTUFf
SEVMUEVSCj4gQEAgLTEzLDYgKzE0LDEzIEBAIGNvbmZpZyBEUk1fUkNBUl9EVQo+ICAgICAgICAg
ICBDaG9vc2UgdGhpcyBvcHRpb24gaWYgeW91IGhhdmUgYW4gUi1DYXIgY2hpcHNldC4KPiAgICAg
ICAgICAgSWYgTSBpcyBzZWxlY3RlZCB0aGUgbW9kdWxlIHdpbGwgYmUgY2FsbGVkIHJjYXItZHUt
ZHJtLgo+Cj4gK2NvbmZpZyBEUk1fUkNBUl9DTU0KPiArICAgICAgIHRyaXN0YXRlICJSLUNhciBE
VSBDb2xvciBNYW5hZ2VtZW50IE1vZHVsZSAoQ01NKSBTdXBwb3J0Igo+ICsgICAgICAgZGVwZW5k
cyBvbiBEUk0gJiYgT0YKPiArICAgICAgIGRlcGVuZHMgb24gRFJNX1JDQVJfRFUKCkRSTV9SQ0FS
X0RVIGFscmVhZHkgZGVwZW5kcyBvbiBEUk0gJiYgT0YsIHNvIHRoZSBsaW5lIGFib3ZlCmNhbiBi
ZSByZW1vdmVkLgoKR3J7b2V0amUsZWV0aW5nfXMsCgogICAgICAgICAgICAgICAgICAgICAgICBH
ZWVydAoKLS0gCkdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5
b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtbTY4ay5vcmcKCkluIHBlcnNvbmFsIGNvbnZlcnNhdGlv
bnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLiBCdXQKd2hl
biBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBz
b21ldGhpbmcgbGlrZSB0aGF0LgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0tIExp
bnVzIFRvcnZhbGRzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
