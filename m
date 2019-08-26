Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D6C19CA73
	for <lists+dri-devel@lfdr.de>; Mon, 26 Aug 2019 09:31:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 537C58952F;
	Mon, 26 Aug 2019 07:31:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FCDB8952F
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Aug 2019 07:31:14 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id r20so14287756ota.5
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Aug 2019 00:31:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=abhvVaOTv7qdR2buENiROg9GGD/qAIGiemfdRCUDpVc=;
 b=K/6m8onlk/UqRwbA9SD5Lrqe0EJ1CKc0myUiwlC3SkMhUnYNVHu7OWyzlsBQws07Jh
 B9X9GgyOx9Fe8ESJOOUl4SfNw13ACYlvVshqf488LGVeLfN3wCIOtmLABac5TZoknMBj
 oxNXbgiAoZ1J7L67GFbq097PfKL4T/KKWGKNfK2sklHcSV8qNBR3qFnTt09wQwomg++M
 f1SqcqRlF0cnS7QfqSCMLpscBB46/xy7QSN+vYfnAya3xStD5ZZ+rKbtmCWidzk35aan
 W5ZVy7twHvF4ZqGgM9IQQdTuugEdLWMgKHf9RuyfFmfPkLmNXZb0YQUD6964iswvapil
 EUtg==
X-Gm-Message-State: APjAAAXjvKjrEF3Ei3vbdm3TfWYaCyw0YCdyaMSd2HZkPDEsw/qEJeNB
 QLUdY/w/Yyn0q3NeECxH/djVBtSPy+utgos4Nr0=
X-Google-Smtp-Source: APXvYqwGSUko7fTyH6xUMnz8XMOWCsDcFWz2SrtHpmTycrnO0UU8UJwbJdJqLrNcjjb1kJDssLKXYH7hlHP//EIu2Kk=
X-Received: by 2002:a9d:7a90:: with SMTP id l16mr14310466otn.297.1566804673402; 
 Mon, 26 Aug 2019 00:31:13 -0700 (PDT)
MIME-Version: 1.0
References: <20190825135154.11488-1-jacopo+renesas@jmondi.org>
 <20190825135154.11488-9-jacopo+renesas@jmondi.org>
In-Reply-To: <20190825135154.11488-9-jacopo+renesas@jmondi.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 26 Aug 2019 09:31:02 +0200
Message-ID: <CAMuHMdUuWFGSTUcAR2aV6cg4hpfzMs5EQBJTNM+ym2k8Ht-bVA@mail.gmail.com>
Subject: Re: [PATCH v3 08/14] drm: rcar-du: Add support for CMM
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
 David Airlie <airlied@linux.ie>, Koji Matsuoka <koji.matsuoka.xm@renesas.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Harsha.ManjulaMallikarjun@in.bosch.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgSmFjb3BvLAoKT24gU3VuLCBBdWcgMjUsIDIwMTkgYXQgMzo1MSBQTSBKYWNvcG8gTW9uZGkg
PGphY29wbytyZW5lc2FzQGptb25kaS5vcmc+IHdyb3RlOgo+IEFkZCBhIGRyaXZlciBmb3IgdGhl
IFItQ2FyIERpc3BsYXkgVW5pdCBDb2xvciBDb3JyZWN0aW9uIE1vZHVsZS4KPiBJbiBtb3N0IG9m
IEdlbjMgU29DcywgZWFjaCBEVSBvdXRwdXQgY2hhbm5lbCBpcyBwcm92aWRlZCB3aXRoIGEgQ01N
IHVuaXQKPiB0byBwZXJmb3JtIGltYWdlIGVuaGFuY2VtZW50IGFuZCBjb2xvciBjb3JyZWN0aW9u
Lgo+Cj4gQWRkIHN1cHBvcnQgZm9yIENNTSB0aHJvdWdoIGEgZHJpdmVyIHRoYXQgc3VwcG9ydHMg
Y29uZmlndXJhdGlvbiBvZgo+IHRoZSAxLWRpbWVuc2lvbmFsIExVVCB0YWJsZS4gTW9yZSBhZHZh
bmNlZCBDTU0gZmVhdHVyZSB3aWxsIGJlCj4gaW1wbGVtZW50ZWQgb24gdG9wIG9mIHRoaXMgYmFz
aWMgb25lLgo+Cj4gU2lnbmVkLW9mZi1ieTogSmFjb3BvIE1vbmRpIDxqYWNvcG8rcmVuZXNhc0Bq
bW9uZGkub3JnPgoKVGhhbmtzIGZvciB5b3VyIHBhdGNoIQoKPiAtLS0gL2Rldi9udWxsCj4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL3JjYXItZHUvcmNhcl9jbW0uYwoKPiArc3RhdGljIGNvbnN0IHN0
cnVjdCBvZl9kZXZpY2VfaWQgcmNhcl9jbW1fb2ZfdGFibGVbXSA9IHsKPiArICAgICAgIHsgLmNv
bXBhdGlibGUgPSAicmVuZXNhcyxjbW0tcjhhNzc5NSIsIH0sCj4gKyAgICAgICB7IC5jb21wYXRp
YmxlID0gInJlbmVzYXMsY21tLXI4YTc3OTYiLCB9LAo+ICsgICAgICAgeyAuY29tcGF0aWJsZSA9
ICJyZW5lc2FzLGNtbS1yOGE3Nzk2NSIsIH0sCj4gKyAgICAgICB7IC5jb21wYXRpYmxlID0gInJl
bmVzYXMsY21tLXI4YTc3OTkwIiwgfSwKPiArICAgICAgIHsgLmNvbXBhdGlibGUgPSAicmVuZXNh
cyxjbW0tcjhhNzc5OTUiLCB9LAo+ICsgICAgICAgeyAuY29tcGF0aWJsZSA9ICJyZW5lc2FzLHJj
YXItZ2VuMy1jbW0iLCB9LAoKQXMgdGhleSdyZSBhbGwgaGFuZGxlZCB0aGUgc2FtZSwgeW91IGNh
biBkcm9wIHRoZSBTb0Mtc3BlY2lmaWMgdmFsdWVzCmZyb20gdGhlIGRyaXZlcidzIG1hdGNoIHRh
YmxlLgoKPiArICAgICAgIHsgLmNvbXBhdGlibGUgPSAicmVuZXNhcyxyY2FyLWdlbjItY21tIiwg
fSwKCkp1c3Qgd29uZGVyaW5nOiBoYXMgdGhpcyBiZWVuIHRlc3RlZCBvbiBSLUNhciBHZW4yPwoK
R3J7b2V0amUsZWV0aW5nfXMsCgogICAgICAgICAgICAgICAgICAgICAgICBHZWVydAoKLS0gCkdl
ZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0g
Z2VlcnRAbGludXgtbTY4ay5vcmcKCkluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNo
bmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLiBCdXQKd2hlbiBJJ20gdGFsa2lu
ZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcgbGlr
ZSB0aGF0LgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRz
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
