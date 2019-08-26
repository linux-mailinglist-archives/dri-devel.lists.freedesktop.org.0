Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE1F09CA5D
	for <lists+dri-devel@lfdr.de>; Mon, 26 Aug 2019 09:29:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D0CB6E1F4;
	Mon, 26 Aug 2019 07:29:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
 [209.85.210.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F42E6E1F4
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Aug 2019 07:29:08 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id m24so14259262otp.12
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Aug 2019 00:29:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bVAemWech0/N9j46salFy/chbSjzAsoD07I5FsrQwuc=;
 b=AgJsgTI6ob0MzvUGjL5+GAYA3rKAg7VHGhX8IFN8ishm1N0LWo1hTGX+b1BYS6ieFE
 iSXS+RSNHG4OY+qlZ+kdtxdbcIuZ9SFFj6ja0SOVFbaHrO1FhP+HYtClhhnxUCivinDJ
 qY9BW++RxthCHXovXDHmPtyogF7Dlc+OON2fnN4UooaO8gw7d05sfr92J0yDoA4SIogq
 bBDR7C7ZUnhIdcqUSg633ZEKDm5hlyulfknrlZMdTLMqkkRjdkWZd/ZyYoMcGD1vND5T
 azmP2/v4F2kr6/vgLXiTMu/90K/EXVBSbCCLZJRznbUwBJtAp+wGTdyg5Ymteyoh4f+f
 M8fQ==
X-Gm-Message-State: APjAAAWgvnl7mYuEVNaG61O+XdchMKK9m9pa6c0gc+qq8/Wu/METGAks
 orRGvn1GJmv+nuOV6qqi2JwHzjcPb2FFtZGJj9A=
X-Google-Smtp-Source: APXvYqzoCKdB/hIeBgXGceXns+/B+5wibRNIPKaLnLL/CiK1K2Rlx0LtZWGUpdJdqX71NMSi2o1ijtCVulsx3OX4ycg=
X-Received: by 2002:a9d:61c3:: with SMTP id h3mr14488208otk.39.1566804547272; 
 Mon, 26 Aug 2019 00:29:07 -0700 (PDT)
MIME-Version: 1.0
References: <20190825135154.11488-1-jacopo+renesas@jmondi.org>
 <20190825135154.11488-4-jacopo+renesas@jmondi.org>
In-Reply-To: <20190825135154.11488-4-jacopo+renesas@jmondi.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 26 Aug 2019 09:28:56 +0200
Message-ID: <CAMuHMdV6_VW-2BYYJ3yNi1i81n2Oeh+Hw+J6ohgqkmjsEjhX+w@mail.gmail.com>
Subject: Re: [PATCH v3 03/14] arm64: dts: renesas: r8a7796: Add CMM units
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

SGkgSmFjb3BvLAoKT24gU3VuLCBBdWcgMjUsIDIwMTkgYXQgMzo1MCBQTSBKYWNvcG8gTW9uZGkg
PGphY29wbytyZW5lc2FzQGptb25kaS5vcmc+IHdyb3RlOgo+IEFkZCBDTU0gdW5pdHMgdG8gUmVu
ZXNhcyBSLUNhciBNMy1XIGRldmljZSB0cmVlIGFuZCByZWZlcmVuY2UgdGhlbSBmcm9tCj4gdGhl
IERpc3BsYXkgVW5pdCB0aGV5IGFyZSBjb25uZWN0ZWQgdG8uCj4KPiBTaWduZWQtb2ZmLWJ5OiBK
YWNvcG8gTW9uZGkgPGphY29wbytyZW5lc2FzQGptb25kaS5vcmc+Cj4gLS0tCj4gIGFyY2gvYXJt
NjQvYm9vdC9kdHMvcmVuZXNhcy9yOGE3Nzk2LmR0c2kgfCAyNSArKysrKysrKysrKysrKysrKysr
KysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDI1IGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQg
YS9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjhhNzc5Ni5kdHNpIGIvYXJjaC9hcm02NC9i
b290L2R0cy9yZW5lc2FzL3I4YTc3OTYuZHRzaQo+IGluZGV4IDNkYzlkNzNmNTg5YS4uOGQ3OGUx
Zjk4YTIzIDEwMDY0NAo+IC0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yOGE3Nzk2
LmR0c2kKPiArKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjhhNzc5Ni5kdHNpCj4g
QEAgLTI2MTMsNiArMjYxMywzMCBAQAo+ICAgICAgICAgICAgICAgICAgICAgICAgIHJlbmVzYXMs
ZmNwID0gPCZmY3B2aTA+Owo+ICAgICAgICAgICAgICAgICB9Owo+Cj4gKyAgICAgICAgICAgICAg
IGNtbTA6IGNtbUBmZWE0MDAwMCB7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgY29tcGF0aWJs
ZSA9ICJyZW5lc2FzLGNtbS1yOGE3Nzk2IjsKClNob3VsZG4ndCB5b3UgYWRkICJyZW5lc2FzLHJj
YXItZ2VuMy1jbW0iIGFzIGEgZmFsbGJhY2s/Cihmb3IgYWxsIENNTSBub2RlcyBpbiBhbGwgRFQg
cGF0Y2hlcykKCkdye29ldGplLGVldGluZ31zLAoKICAgICAgICAgICAgICAgICAgICAgICAgR2Vl
cnQKCi0tIApHZWVydCBVeXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9u
ZCBpYTMyIC0tIGdlZXJ0QGxpbnV4LW02OGsub3JnCgpJbiBwZXJzb25hbCBjb252ZXJzYXRpb25z
IHdpdGggdGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4gQnV0CndoZW4g
SSdtIHRhbGtpbmcgdG8gam91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29t
ZXRoaW5nIGxpa2UgdGhhdC4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtLSBMaW51
cyBUb3J2YWxkcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
