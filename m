Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 26F50B19AA
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2019 10:31:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC6886EED9;
	Fri, 13 Sep 2019 08:30:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
 [209.85.167.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A099B6EED8
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2019 08:30:57 +0000 (UTC)
Received: by mail-oi1-f194.google.com with SMTP id w17so1488235oiw.8
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2019 01:30:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JZrVZS3TRiAi6B0nR+YVzqpc9AbnOshhzgNnESTo+HE=;
 b=qONr0p2yVKjbZiIsggjvB/el8JaX9OmXkmA5WkiG3V1tkU99WVqBa6VuMnL4+jVMNQ
 aX0wCkcYbCUPBjZxLMUNpTps3c2E19A1Y2ZOSDLck0RPADWX18o+VP5ok4Ye+F6rLBeB
 81GlWhJ7r2oZLBt/cONcXQGWpYxe8OpkqkXvFShi7xPAnYwBirxdkr1Ac1mqpMQMQkQL
 a0sRH9msoX6Sp7V1Q/R07pFB+EvXbFAIBUYoJ9sbNefpAbfaQxL725mOtzdihus7NkAZ
 rXa8uDGutjXUlaIjJu2NZPSFWwUsv8S/k3Y2w6uGqFM6siV26nPJz1XtCXnY1HlyTpm+
 HT7g==
X-Gm-Message-State: APjAAAUyBnBRhkhVGg2JGAHHSMBzwSszgCWAX7f9BSXKfVIWia9IbuNv
 yrB57U7ATfDgakadUIQkBOSiLv13CNq23JZY3SECYg==
X-Google-Smtp-Source: APXvYqyZc6bUus5bM4ajLOuNStwe1fxIICi5FZQbHrnZYT2316LpnT9EOtOUUKhjtBGtQMpYE9tImf+FrfJyqZHIJEY=
X-Received: by 2002:a05:6808:98a:: with SMTP id
 a10mr2296403oic.54.1568363456676; 
 Fri, 13 Sep 2019 01:30:56 -0700 (PDT)
MIME-Version: 1.0
References: <20190911192502.16609-1-kieran.bingham+renesas@ideasonboard.com>
 <70b94265-69f3-d18f-1b67-b5b814723b1b@cogentembedded.com>
 <20190913082129.lvusbp6pbcayqh5r@verge.net.au>
In-Reply-To: <20190913082129.lvusbp6pbcayqh5r@verge.net.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 13 Sep 2019 10:30:45 +0200
Message-ID: <CAMuHMdU5SgQhnfoeTc1Ur+dhjrUXkEfpk+9VRQR2EKxLzEnmGg@mail.gmail.com>
Subject: Re: [PATCH] drm: rcar-du: Add r8a77980 support
To: Simon Horman <horms@verge.net.au>
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
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
 David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS FOR RENESAS" <dri-devel@lists.freedesktop.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBTZXAgMTMsIDIwMTkgYXQgMTA6MjEgQU0gU2ltb24gSG9ybWFuIDxob3Jtc0B2ZXJn
ZS5uZXQuYXU+IHdyb3RlOgo+IE9uIFRodSwgU2VwIDEyLCAyMDE5IGF0IDAxOjAwOjQxUE0gKzAz
MDAsIFNlcmdlaSBTaHR5bHlvdiB3cm90ZToKPiA+IE9uIDExLjA5LjIwMTkgMjI6MjUsIEtpZXJh
biBCaW5naGFtIHdyb3RlOgo+ID4gPiBBZGQgZGlyZWN0IHN1cHBvcnQgZm9yIHRoZSByOGE3Nzk4
MCAoVjNIKS4KPiA+ID4gVGhlIFYzSCBzaGFyZXMgYSBjb21tb24sIGNvbXBhdGlibGUgY29uZmln
dXJhdGlvbiB3aXRoIHRoZSByOGE3Nzk3MAo+ID4gPiAoVjNNKSBzbyB0aGF0IGRldmljZSBpbmZv
IHN0cnVjdHVyZSBpcyByZXVzZWQuCj4gPgo+ID4gICAgRG8gd2UgcmVhbGx5IG5lZWQgdG8gYWRk
IHlldCBhbm90aGVyIGNvbXBhdGlibGUgaW4gdGhpcyBjYXNlPwo+ID4gSSBqdXN0IGFkZGVkIHI4
YTc3OTcwIHRvIHRoZSBjb21wYXRpYmxlIHByb3AgaW4gdGhlIHI4YTc3OTgwIERULiBUaGF0J3Mg
d2h5Cj4gPiBhIHBhdGNoIGxpa2UgdGhpcyBvbmUgZGlkbid0IGdldCBwb3N0ZWQgYnkgbWUuCj4K
PiBUaGUgcmVhc29uIGZvciBoYXZpbmcgcGVyLVNvQyBjb21wYXQgc3RyaW5ncyBpcyB0aGF0IHRo
ZSBJUCBibG9ja3MKPiBhcmUgbm90IHZlcnNpb25lZCBhbmQgd2hpbGUgd2UgY2FuIG9ic2VydmUg
dGhhdCB0aGVyZSBhcmUgc2ltaWxhcml0aWVzCj4gYmV0d2VlbiwgZi5lLiB0aGUgRFUgb24gdGhl
IHI4YTc3OTcwIGFuZCByOGE3Nzk4MCwgd2UgY2FuJ3QgYmUgY2VydGFpbiB0aGF0Cj4gZGlmZmVy
ZW5jZXMgbWF5IG5vdCBlbWVyZ2UgYXQgc29tZSBwb2ludC4gQnkgaGF2aW5nIHBlci1Tb0MgY29t
cGF0IHN0cmluZ3MKPiB3ZSBoYXZlIHRoZSBmbGV4aWJpbGl0eSBmb3IgdGhlIGRyaXZlciB0byBh
ZGRyZXNzIGFueSBzdWNoIGRpZmZlcmVuY2VzIGFzCj4gdGhlIG5lZWQgYXJpc2VzLgoKVGhhbmtz
LCB0aGF0IGlzIHRoZSBnZW5lcmljIHJlYXNvbiwgYXBwbGljYWJsZSB0byBhbGwgSVAgYmxvY2tz
IHdpdGhvdXQKdmVyc2lvbiByZWdpc3RlcnMuCgpGb3IgdGhlIERpc3BsYXkgVW5pdCwgdGhlcmUg
YXJlIGRvY3VtZW50ZWQgZGlmZmVyZW5jZXMgKGUuZy4gbnVtYmVyIGFuZCB0eXBlCm9mIHBvcnRz
KSwgc28gd2UgZGVmaW5pdGVseSBuZWVkIGl0IHRoZXJlLgoKPiBNeSByZWNvbGxlY3Rpb24gaXMg
dGhhdCB0aGlzIHNjaGVtZSBoYXMgYmVlbiBhZG9wdGVkIGZvciBub24tdmVyc2lvbmVkCj4gUmVu
ZXNhcyBJUCBibG9ja3Mgc2luY2UgSnVuZSAyMDE1IGFuZCB1c2VzIG9mIHRoaXMgc2NoZW1lIHdl
bGwgYmVmb3JlIHRoYXQuCj4KPiA+ID4gU2lnbmVkLW9mZi1ieTogS2llcmFuIEJpbmdoYW0gPGtp
ZXJhbi5iaW5naGFtK3JlbmVzYXNAaWRlYXNvbmJvYXJkLmNvbT4KPgo+IFJldmlld2VkLWJ5OiBT
aW1vbiBIb3JtYW4gPGhvcm1zK3JlbmVzYXNAdmVyZ2UubmV0LmF1PgoKR3J7b2V0amUsZWV0aW5n
fXMsCgogICAgICAgICAgICAgICAgICAgICAgICBHZWVydAoKLS0gCkdlZXJ0IFV5dHRlcmhvZXZl
biAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtbTY4
ay5vcmcKCkluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJ
IGNhbGwgbXlzZWxmIGEgaGFja2VyLiBCdXQKd2hlbiBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0
cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcgbGlrZSB0aGF0LgogICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRzCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
