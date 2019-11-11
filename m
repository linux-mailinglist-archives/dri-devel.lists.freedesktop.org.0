Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A188CF8131
	for <lists+dri-devel@lfdr.de>; Mon, 11 Nov 2019 21:28:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BD9C89CF1;
	Mon, 11 Nov 2019 20:28:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B2F189CF1;
 Mon, 11 Nov 2019 20:27:59 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id i10so16091795wrs.7;
 Mon, 11 Nov 2019 12:27:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HjO3wpyXChJA5PmnGO3S7mu0IDsvrhSOfFW6HY6JRng=;
 b=si9zw7w9juji0EAiY+N0hEy2vEQd//go1dqyiRR78jHlUwlzUlrHxzLSAtVOUvYxGc
 DNPzkk5aAXVSt/G5VhKwHaacfSgy9UWxGlBajTZIdpZaocl3jZfxc4rk8PP9+vaoQdBL
 E1ZshxEw4gZA+BGAH8ivacxAi15JDmsJk1MNeiDG9KsWLgwRt2wLRd3jUHOqn/uKgNT3
 MgJcYWd02bJ4hZgeFauelmzMehrGR5XGVJgR4bT5nLVxAphrr1e41D18ANIBKYCsHPrO
 HPV60WZ+wgCHamA3lPUBtxsp+o8uUxb4X0Js1IJ6BwtS3BQ+x5f2ZM2lM3AwxbM9sk7t
 xOKg==
X-Gm-Message-State: APjAAAWJiHvNsBa6zjI/njd92j0Qh5pbfx2vmRLxWQPEQesd5HLRBzCJ
 6cxniHwMtpySlV5t89bA3n/I5cOVrpEMfi34q8E=
X-Google-Smtp-Source: APXvYqyzkmEt6fi7JOGp2anojIJLKQx7itUXqg21AcQlR+RI6alcVjkV6y6iLzku5qGFU2JWFHn8ifqUKm9QifF2ofI=
X-Received: by 2002:adf:fb0b:: with SMTP id c11mr23322063wrr.50.1573504077928; 
 Mon, 11 Nov 2019 12:27:57 -0800 (PST)
MIME-Version: 1.0
References: <20191109093538.23964-1-yuehaibing@huawei.com>
 <CADnq5_O7JwQd4+ncEe+KusqNqPBGXgkcUBX6VHP5OjhNwUseWg@mail.gmail.com>
In-Reply-To: <CADnq5_O7JwQd4+ncEe+KusqNqPBGXgkcUBX6VHP5OjhNwUseWg@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 11 Nov 2019 15:27:45 -0500
Message-ID: <CADnq5_NoPmDe-aVZbk5H-212C=hPDytZ35DrOi5k_rU671_LaA@mail.gmail.com>
Subject: Re: [PATCH -next] drm/amd/display: remove set but not used variable
 'bpc'
To: YueHaibing <yuehaibing@huawei.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=HjO3wpyXChJA5PmnGO3S7mu0IDsvrhSOfFW6HY6JRng=;
 b=MXCmfpX6xIgnpHdiLiAp/jGtPQ/WGqtKNl6J4jKMXpkR+et+hixwSZjPLAufCBsHRe
 pcN6DW3AbQPYF7tswU6BrhK5emQLx6k8FR9WbcSCQicH9phvbHnpeUzUvYAIpLlkTw74
 QThBUnDM/pfY9lD2yc2fcjdQdmHaf8XYDbmF2M3wn1/zlS7wdXt/BiSOdu+LC6aN8pXt
 UxX8MIxAOvp87WZCkBe2Z7/Cmkm5/4ViFktvOcLSrByfoICRxwXXP4NNR0kTLRMMCSyl
 exUUXBCZDywur0uL5alEsqmsgQHFiKmHxmpf0ZAlCurJyo1fkKb5XlRBe06/AaLoxYFT
 l/EA==
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
Cc: "Leo \(Sunpeng\) Li" <sunpeng.li@amd.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>, Zhan Liu <Zhan.Liu@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Dave Airlie <airlied@linux.ie>, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 "Deucher, Alexander" <alexander.deucher@amd.com>, Jun Lei <Jun.Lei@amd.com>,
 Christian Koenig <christian.koenig@amd.com>, Anthony Koo <Anthony.Koo@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBOb3YgMTEsIDIwMTkgYXQgMTowMSBQTSBBbGV4IERldWNoZXIgPGFsZXhkZXVjaGVy
QGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBBcHBsaWVkLiAgVGhhbmtzIQoKSSd2ZSBkcm9wcGVkIHRo
aXMgYXMgaXQgbGVhZHMgdG8gYSB3YXJuaW5nIGluIHRoZSBjb2RlIHNpbmNlCmdldF9jb2xvcl9k
ZXB0aCBpcyBubyBsb25nZXIgdXNlZC4gIENhcmUgdG8gZml4IHRoYXQgdXAgYXMgd2VsbD8KClRo
YW5rcyEKCkFsZXgKCj4KPiBBbGV4Cj4KPiBPbiBTdW4sIE5vdiAxMCwgMjAxOSBhdCA5OjMwIFBN
IFl1ZUhhaWJpbmcgPHl1ZWhhaWJpbmdAaHVhd2VpLmNvbT4gd3JvdGU6Cj4gPgo+ID4gRml4ZXMg
Z2NjICctV3VudXNlZC1idXQtc2V0LXZhcmlhYmxlJyB3YXJuaW5nOgo+ID4KPiA+IGRyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1Ly4uL2Rpc3BsYXkvZGMvY29yZS9kY19saW5rLmM6IEluIGZ1bmN0
aW9uIGdldF9wYm5fZnJvbV90aW1pbmc6Cj4gPiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8u
Li9kaXNwbGF5L2RjL2NvcmUvZGNfbGluay5jOjIzNjQ6MTE6IHdhcm5pbmc6Cj4gPiAgdmFyaWFi
bGUgYnBjIHNldCBidXQgbm90IHVzZWQgWy1XdW51c2VkLWJ1dC1zZXQtdmFyaWFibGVdCj4gPgo+
ID4gSXQgaXMgbm90IHVzZWQgc2luY2UgY29tbWl0IGU0OWY2OTM2M2FkZiAoImRybS9hbWQvZGlz
cGxheTogdXNlCj4gPiBwcm9wZXIgZm9ybXVsYSB0byBjYWxjdWxhdGUgYmFuZHdpZHRoIGZyb20g
dGltaW5nIikKPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBZdWVIYWliaW5nIDx5dWVoYWliaW5nQGh1
YXdlaS5jb20+Cj4gPiAtLS0KPiA+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29y
ZS9kY19saW5rLmMgfCAyIC0tCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDIgZGVsZXRpb25zKC0pCj4g
Pgo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2Rj
X2xpbmsuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjX2xpbmsuYwo+
ID4gaW5kZXggYmRjOGJlMy4uNTMzOTRlMiAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjX2xpbmsuYwo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9kaXNwbGF5L2RjL2NvcmUvZGNfbGluay5jCj4gPiBAQCAtMjY1MywxMyArMjY1MywxMSBA
QCBzdGF0aWMgaW50IGdldF9jb2xvcl9kZXB0aChlbnVtIGRjX2NvbG9yX2RlcHRoIGNvbG9yX2Rl
cHRoKQo+ID4KPiA+ICBzdGF0aWMgc3RydWN0IGZpeGVkMzFfMzIgZ2V0X3Bibl9mcm9tX3RpbWlu
ZyhzdHJ1Y3QgcGlwZV9jdHggKnBpcGVfY3R4KQo+ID4gIHsKPiA+IC0gICAgICAgdWludDMyX3Qg
YnBjOwo+ID4gICAgICAgICB1aW50NjRfdCBrYnBzOwo+ID4gICAgICAgICBzdHJ1Y3QgZml4ZWQz
MV8zMiBwZWFrX2ticHM7Cj4gPiAgICAgICAgIHVpbnQzMl90IG51bWVyYXRvcjsKPiA+ICAgICAg
ICAgdWludDMyX3QgZGVub21pbmF0b3I7Cj4gPgo+ID4gLSAgICAgICBicGMgPSBnZXRfY29sb3Jf
ZGVwdGgocGlwZV9jdHgtPnN0cmVhbV9yZXMucGl4X2Nsa19wYXJhbXMuY29sb3JfZGVwdGgpOwo+
ID4gICAgICAgICBrYnBzID0gZGNfYmFuZHdpZHRoX2luX2ticHNfZnJvbV90aW1pbmcoJnBpcGVf
Y3R4LT5zdHJlYW0tPnRpbWluZyk7Cj4gPgo+ID4gICAgICAgICAvKgo+ID4gLS0KPiA+IDIuNy40
Cj4gPgo+ID4KPiA+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCj4gPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCj4gPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
