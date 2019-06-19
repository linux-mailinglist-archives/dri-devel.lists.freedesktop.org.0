Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D19094C233
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2019 22:17:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CD2A6E460;
	Wed, 19 Jun 2019 20:17:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 815FD6E45F;
 Wed, 19 Jun 2019 20:17:11 +0000 (UTC)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com
 [209.85.160.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 40F23217D7;
 Wed, 19 Jun 2019 20:17:11 +0000 (UTC)
Received: by mail-qt1-f171.google.com with SMTP id n11so610274qtl.5;
 Wed, 19 Jun 2019 13:17:11 -0700 (PDT)
X-Gm-Message-State: APjAAAUI2ERqbvbcVPUJP9ONOEM6p45MytG92oBVB9li7kgAQh9+8/g9
 Q2APw4mpngfhOhfFuwlCBh0T/NFX6tNfInMigA==
X-Google-Smtp-Source: APXvYqxlXaUhYK7Rc1Fe1p9kGyCNNEK0+tjQBq7joBikhFVY5XwyssWYCZlgH1+7TyA7AeG2N/Rd9++exvETdBgfXxg=
X-Received: by 2002:a0c:8a43:: with SMTP id 3mr36153698qvu.138.1560975430399; 
 Wed, 19 Jun 2019 13:17:10 -0700 (PDT)
MIME-Version: 1.0
References: <20190616132930.6942-1-masneyb@onstation.org>
 <20190616132930.6942-3-masneyb@onstation.org>
In-Reply-To: <20190616132930.6942-3-masneyb@onstation.org>
From: Rob Herring <robh+dt@kernel.org>
Date: Wed, 19 Jun 2019 14:16:57 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+Ne=NEcLbO6C19iOny4bwm_m5QEtcsM78ZDeBmDUVO_Q@mail.gmail.com>
Message-ID: <CAL_Jsq+Ne=NEcLbO6C19iOny4bwm_m5QEtcsM78ZDeBmDUVO_Q@mail.gmail.com>
Subject: Re: [PATCH 2/6] dt-bindings: display: msm: gmu: add optional ocmem
 property
To: Brian Masney <masneyb@onstation.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1560975431;
 bh=541XiS0AbaClh3nYwpHX5EEggdOh+N+d4mSDoxX/Rpg=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=YVVZo+x89SxPwT5avxM6SUocpzWOqaV1fttnSeTufy/f48lKwzYOPqQV0k6yp4Ixf
 GYbD1O/Lg6MbfB6VUF6kG2MAP8QOp3B2cucQt2I/CtVGotYf/GsYzQ2gSRnHctarOg
 +VmQNytdY3f/ykQO4q1Ij6clsBS3a+LvOI0ddnQw=
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 freedreno <freedreno@lists.freedesktop.org>,
 Jonathan Marek <jonathan@marek.ca>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 David Brown <david.brown@linaro.org>, Andy Gross <agross@kernel.org>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU3VuLCBKdW4gMTYsIDIwMTkgYXQgNzoyOSBBTSBCcmlhbiBNYXNuZXkgPG1hc25leWJAb25z
dGF0aW9uLm9yZz4gd3JvdGU6Cj4KPiBTb21lIEEzeHggYW5kIEE0eHggQWRyZW5vIEdQVXMgZG8g
bm90IGhhdmUgR01FTSBpbnNpZGUgdGhlIEdQVSBjb3JlIGFuZAo+IG11c3QgdXNlIHRoZSBPbiBD
aGlwIE1FTW9yeSAoT0NNRU0pIGluIG9yZGVyIHRvIGJlIGZ1bmN0aW9uYWwuIEFkZCB0aGUKPiBv
cHRpb25hbCBvY21lbSBwcm9wZXJ0eSB0byB0aGUgQWRyZW5vIEdyYXBoaWNzIE1hbmFnZW1lbnQg
VW5pdCBiaW5kaW5ncy4KPgo+IFNpZ25lZC1vZmYtYnk6IEJyaWFuIE1hc25leSA8bWFzbmV5YkBv
bnN0YXRpb24ub3JnPgo+IC0tLQo+ICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
ZGlzcGxheS9tc20vZ211LnR4dCB8IDQgKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRp
b25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L2Rpc3BsYXkvbXNtL2dtdS50eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
ZGlzcGxheS9tc20vZ211LnR4dAo+IGluZGV4IDkwYWY1YjBhNTZhOS4uYzc0NmI5NWU5NWQ0IDEw
MDY0NAo+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21z
bS9nbXUudHh0Cj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3Bs
YXkvbXNtL2dtdS50eHQKPiBAQCAtMzEsNiArMzEsMTAgQEAgUmVxdWlyZWQgcHJvcGVydGllczoK
PiAgLSBpb21tdXM6IHBoYW5kbGUgdG8gdGhlIGFkcmVubyBpb21tdQo+ICAtIG9wZXJhdGluZy1w
b2ludHMtdjI6IHBoYW5kbGUgdG8gdGhlIE9QUCBvcGVyYXRpbmcgcG9pbnRzCj4KPiArT3B0aW9u
YWwgcHJvcGVydGllczoKPiArLSBvY21lbTogcGhhbmRsZSB0byB0aGUgT24gQ2hpcCBNZW1vcnkg
KE9DTUVNKSB0aGF0J3MgcHJlc2VudCBvbiBzb21lIFNuYXBkcmFnb24KPiArICAgICAgICAgU29D
cy4gU2VlIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zb2MvcWNvbS9xY29tLG9j
bWVtLnlhbWwuCgpXZSBhbHJlYWR5IGhhdmUgYSBjb3VwbGUgb2Ygc2ltaWxhciBwcm9wZXJ0aWVz
LiBMZXRzIHN0YW5kYXJkaXplIG9uCidzcmFtJyBhcyB0aGF0IGlzIHdoYXQgVEkgYWxyZWFkeSB1
c2VzLgoKQWxzbywgaXMgdGhlIHdob2xlIE9DTUVNIGFsbG9jYXRlZCB0byB0aGUgR01VPyBJZiBu
b3QgeW91IHNob3VsZCBoYXZlCmNoaWxkIG5vZGVzIHRvIHN1YmRpdmlkZSB0aGUgbWVtb3J5LgoK
Um9iCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
