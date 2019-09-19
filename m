Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F029B83BB
	for <lists+dri-devel@lfdr.de>; Thu, 19 Sep 2019 23:53:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52CCA6FBF0;
	Thu, 19 Sep 2019 21:53:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D7236FBEB;
 Thu, 19 Sep 2019 21:53:04 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id a6so53245wma.5;
 Thu, 19 Sep 2019 14:53:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LiC9VN7bT0DhZf+NDDCV4pCQeBnob2CMZdKYzKfRqZ0=;
 b=BM4jOFO1iw4IpD5xX+66nBS6idL8hsmdJ4lL7eyGL2te0e5H7552jrTG+AST42AXlH
 m4Rni6xULnd1v5Vj0ArrsJq6ZvUoBYRnfQV4i1mOl6vD5XoMUtNfmY3/mAXw/W6WjxQN
 d/io3KzwojF5CGDBAkyML2e3bTV15bgN9tmcfrPXFzQjkb2nHnzp4mmFjak3iPYCIZx4
 vWyajgb1Q9WWYz3dcgZnN+F30NazQ6siqZ6HKdR/EDco5En7Keoac20StiAssZQwPC5j
 4/u92o1BdDdxE+rRZHrnRrLGWaS93L+A4ZG7eYsQyLNQ4TsoPLDw9mP2x1o/q55hB+x9
 FjXA==
X-Gm-Message-State: APjAAAXA2omDnqMq6CGmCU59GyfTxHHNkgV3kTsByfJ81KdszPE3088p
 WyFLZyHySH5ZEbax1q5cGNw204T8CYAjGse45/xgmg==
X-Google-Smtp-Source: APXvYqzCZrQwLmXjxRuxnOhumLlCYo6qgQJXs/Z6uJi0aOfkJzfbJHNfp6YkfvlarLb0VyyjE0MnAkEX4K1sDTbMxxo=
X-Received: by 2002:a05:600c:54a:: with SMTP id
 k10mr29584wmc.127.1568929982740; 
 Thu, 19 Sep 2019 14:53:02 -0700 (PDT)
MIME-Version: 1.0
References: <20190828183758.11553-1-rrangel@chromium.org>
In-Reply-To: <20190828183758.11553-1-rrangel@chromium.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 19 Sep 2019 17:52:50 -0400
Message-ID: <CADnq5_PX852kyFtBX_caTfZyfW6agt90qWQ1m-csW37o-uNL6g@mail.gmail.com>
Subject: Re: [PATCH v2] drm/amd/display: fix struct init in update_bounding_box
To: Raul E Rangel <rrangel@chromium.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=LiC9VN7bT0DhZf+NDDCV4pCQeBnob2CMZdKYzKfRqZ0=;
 b=oaYhnKDkjDxXym+93Odu9FpUTOdlhuHb8kuDPqWfRctTObozWL0ag7B813jgRBMJOU
 +u3mGWZzJN/mkF0K6KgrVuOM3rg55ekWS+7yGes8kRYwShE/eytEz92+LrJ/h3FffDwa
 /uggRDfS1E2cFBiolgeYh2EH5Af7/LidAfakt3ONCkcoKEmZCJooaHR9hbrp/2n8/LQM
 eV4rh2I4HjOjhQ8Em6RJnd+HXP5i1UqEE2qw5+z3GIvJpVXSjW0/45FMoCvBoNgvi9rF
 geO8EweVTzW4EftTrhvaWaaTTw2PDU4RBy7t6CS/E3G7W2tG9U9NpeHDQf/d6nnglTfL
 UMHg==
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
Cc: Charlene Liu <charlene.liu@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Nikola Cornij <nikola.cornij@amd.com>, David Airlie <airlied@linux.ie>,
 Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>,
 hersen wu <hersenxs.wu@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, Jun Lei <Jun.Lei@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBBdWcgMjgsIDIwMTkgYXQgMjo1MSBQTSBSYXVsIEUgUmFuZ2VsIDxycmFuZ2VsQGNo
cm9taXVtLm9yZz4gd3JvdGU6Cj4KPiBkY24yMF9yZXNvdXJjZS5jOjI2MzY6OTogZXJyb3I6IG1p
c3NpbmcgYnJhY2VzIGFyb3VuZCBpbml0aWFsaXplciBbLVdlcnJvcj1taXNzaW5nLWJyYWNlc10K
PiAgIHN0cnVjdCBfdmNzX2RwaV92b2x0YWdlX3NjYWxpbmdfc3QgY2FsY3VsYXRlZF9zdGF0ZXNb
TUFYX0NMT0NLX0xJTUlUX1NUQVRFU10gPSB7MH07Cj4gICAgICAgICAgXgo+IEZpeGVzOiA3ZWQ0
ZTYzNTJjMTZmICgiZHJtL2FtZC9kaXNwbGF5OiBBZGQgRENOMiBIVyBTZXF1ZW5jZXIgYW5kIFJl
c291cmNlIikKPgo+IFNpZ25lZC1vZmYtYnk6IFJhdWwgRSBSYW5nZWwgPHJyYW5nZWxAY2hyb21p
dW0ub3JnPgo+IC0tLQo+IFNvIGFwcGFyZW50bHkgYHt9YCBpcyBhIGdjYyBleHRlbnNpb24uIFRo
ZSBDIHN0YW5kYXJkIHJlcXVpcmVzIGF0IGxlYXN0Cj4gb25lIGV4cHJlc3Npb24uIFNvIHt7MH19
IGlzIGNvcnJlY3QuIEkgZ290IGEgbGludCBlcnJvciBhYm91dCB7ezB9fQo+IG5lZWRpbmcgYSBz
cGFjZSwgc28gaSB1c2UgYHsgezB9IH1gLgoKSSB0aGluayB0aGVyZSB3ZXJlIGlzc3VlcyB3aXRo
IHt7fX0gYXMgd2VsbC4gIEhvdyBhYm91dCBqdXN0IGEgbWVtc2V0PwoKQWxleAoKPgo+IENoYW5n
ZXMgaW4gdjI6Cj4gLSBVc2UgeyB7MH0gfSBpbnN0ZWFkIG9mIHt9Cj4KPiAgZHJpdmVycy9ncHUv
ZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX3Jlc291cmNlLmMgfCAyICstCj4gIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9yZXNvdXJjZS5jIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX3Jlc291cmNlLmMKPiBp
bmRleCBiOTQ5ZTIwMmQ2Y2IuLjhlNjQzM2JlMjI1MiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfcmVzb3VyY2UuYwo+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9yZXNvdXJjZS5jCj4gQEAgLTI2
MzMsNyArMjYzMyw3IEBAIHN0YXRpYyB2b2lkIGNhcF9zb2NfY2xvY2tzKAo+ICBzdGF0aWMgdm9p
ZCB1cGRhdGVfYm91bmRpbmdfYm94KHN0cnVjdCBkYyAqZGMsIHN0cnVjdCBfdmNzX2RwaV9zb2Nf
Ym91bmRpbmdfYm94X3N0ICpiYiwKPiAgICAgICAgICAgICAgICAgc3RydWN0IHBwX3NtdV9udl9j
bG9ja190YWJsZSAqbWF4X2Nsb2NrcywgdW5zaWduZWQgaW50ICp1Y2xrX3N0YXRlcywgdW5zaWdu
ZWQgaW50IG51bV9zdGF0ZXMpCj4gIHsKPiAtICAgICAgIHN0cnVjdCBfdmNzX2RwaV92b2x0YWdl
X3NjYWxpbmdfc3QgY2FsY3VsYXRlZF9zdGF0ZXNbTUFYX0NMT0NLX0xJTUlUX1NUQVRFU10gPSB7
MH07Cj4gKyAgICAgICBzdHJ1Y3QgX3Zjc19kcGlfdm9sdGFnZV9zY2FsaW5nX3N0IGNhbGN1bGF0
ZWRfc3RhdGVzW01BWF9DTE9DS19MSU1JVF9TVEFURVNdID0geyB7MH0gfTsKPiAgICAgICAgIGlu
dCBpOwo+ICAgICAgICAgaW50IG51bV9jYWxjdWxhdGVkX3N0YXRlcyA9IDA7Cj4gICAgICAgICBp
bnQgbWluX2RjZmNsayA9IDA7Cj4gLS0KPiAyLjIzLjAuMTg3LmcxN2Y1Yjc1NTZjLWdvb2cKPgo+
IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gYW1kLWdm
eCBtYWlsaW5nIGxpc3QKPiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeApfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
