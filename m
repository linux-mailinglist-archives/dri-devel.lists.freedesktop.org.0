Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 65926215333
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jul 2020 09:20:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 840BA6E33F;
	Mon,  6 Jul 2020 07:19:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x144.google.com (mail-il1-x144.google.com
 [IPv6:2607:f8b0:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA92D6E405
 for <dri-devel@lists.freedesktop.org>; Sat,  4 Jul 2020 10:30:19 +0000 (UTC)
Received: by mail-il1-x144.google.com with SMTP id r12so21939524ilh.4
 for <dri-devel@lists.freedesktop.org>; Sat, 04 Jul 2020 03:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=JDeRcZVfoGltA90a8QgS/WtwNssRIDNDM42hl2S6T40=;
 b=WQWAZEqY2SEvvUEpbpybpsA1iqcSo4g7dAPos+7kEhULe/quJpQy+GmGrPKCNXOE4m
 2RZFf352j2ywRHbPAVM4jljwAExie/6fAsCm409gFn75HKif0LoBlH9UZd57wzH3lafc
 uQ/G2PBalUel/DmLEXARMZVb7hMaYMtJAwcxZx4z62K0/qPw0ntlv6EUWRoxy+AwjprN
 j9AWmMj77qOfsrA0VMhsRx4rZUYbxA1LlSD9Z2oeNPMquOqqvQhp8A6/cRcLNZrTc2Ai
 tO/KRjPjwzqK7u01SF9JYQNAcvuPscmZuAXUoYnEA/Hupox36paHKtg8foQkUbyEnQ76
 FkXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=JDeRcZVfoGltA90a8QgS/WtwNssRIDNDM42hl2S6T40=;
 b=Ot0igG2+kAXjINg93toeFLwU2PTFYapMj9sUOTzNbnPw+ZAqfXRJwPByBUi2YKvTtR
 VNFUvQ/jb+fc2XbcSSsiESV/qxYo1ov9419E6iX/W/2UkP+nqipmfaBfc386FJVlcxi5
 jyqcz/12FLPQwSyuWyzTjkhz8Ips1C96vHFdCwgjsQZdzPtB+389hV9sljpkokrULCku
 JTxZNluBL/3XmvdLlLftcBjUPOkDDhEcco7wj92y4+/ROr9jHc0wIZqmNFhSCuXzTPiZ
 hiLQYcstCQE6dJRi5dfey9xBd6oOj+KpjwloqJOomBoZxH10YFtWYN9T4KsfTnxQ6XP6
 i0zw==
X-Gm-Message-State: AOAM531FeCv2dF1K7tqkeHRA4A4Plfrzt/z0NboH+EizHHcFEfXY9sHQ
 bNwv3Su0oVdD82IOb5ewrFT8cXpb0+//SOKUGxGTfy2Gdvc=
X-Google-Smtp-Source: ABdhPJztSdHZBJE7E1SqDWxQkz41nlFR4XcRudO7iI1w/ncHQvv1MpqmX5X9N0kyjGV6PNYEiETKIS3CH4KD2W90xYA=
X-Received: by 2002:a92:d811:: with SMTP id y17mr19822262ilm.35.1593858619275; 
 Sat, 04 Jul 2020 03:30:19 -0700 (PDT)
MIME-Version: 1.0
References: <20200704102535.189647-1-peron.clem@gmail.com>
 <20200704102535.189647-15-peron.clem@gmail.com>
In-Reply-To: <20200704102535.189647-15-peron.clem@gmail.com>
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date: Sat, 4 Jul 2020 12:30:08 +0200
Message-ID: <CAJiuCcf8fi_w0-Xo=MMMv=5jBqcS68jEbjbo4NvVR24b4BuZHg@mail.gmail.com>
Subject: Re: [PATCH v2 14/14] [DO NOT MERGE] arm64: dts: allwinner: force GPU
 regulator to be always
To: Rob Herring <robh@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, 
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>, 
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>, 
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>
X-Mailman-Approved-At: Mon, 06 Jul 2020 07:19:17 +0000
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpPbiBTYXQsIDQgSnVsIDIwMjAgYXQgMTI6MjUsIENsw6ltZW50IFDDqXJvbiA8cGVyb24u
Y2xlbUBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gU2lnbmVkLW9mZi1ieTogQ2zDqW1lbnQgUMOpcm9u
IDxwZXJvbi5jbGVtQGdtYWlsLmNvbT4KPiAtLS0KPiAgYXJjaC9hcm02NC9ib290L2R0cy9hbGx3
aW5uZXIvc3VuNTBpLWg2LWJlZWxpbmstZ3MxLmR0cyB8IDEgKwo+ICAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKykKPgo+IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2FsbHdp
bm5lci9zdW41MGktaDYtYmVlbGluay1nczEuZHRzIGIvYXJjaC9hcm02NC9ib290L2R0cy9hbGx3
aW5uZXIvc3VuNTBpLWg2LWJlZWxpbmstZ3MxLmR0cwo+IGluZGV4IDNmN2NlZWIxYTc2Ny4uMTQy
NTdmNzQ3NmI4IDEwMDY0NAo+IC0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvYWxsd2lubmVyL3N1
bjUwaS1oNi1iZWVsaW5rLWdzMS5kdHMKPiArKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2FsbHdp
bm5lci9zdW41MGktaDYtYmVlbGluay1nczEuZHRzCj4gQEAgLTI0NSw2ICsyNDUsNyBAQCByZWdf
ZGNkY2E6IGRjZGNhIHsKPiAgICAgICAgICAgICAgICAgICAgICAgICB9Owo+Cj4gICAgICAgICAg
ICAgICAgICAgICAgICAgcmVnX2RjZGNjOiBkY2RjYyB7Cj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICByZWd1bGF0b3ItYWx3YXlzLW9uOwoKVGhpcyBwYXRjaCBpcyBub3JtYWxseSBu
byBtb3JlIHJlcXVpcmVkIHNpbmNlIHRoaXMgc2VyaWU6Cmh0dHBzOi8vbG9yZS5rZXJuZWwub3Jn
L2xpbnV4LXBtL2NvdmVyLjE1ODk1Mjg0OTEuZ2l0LnZpcmVzaC5rdW1hckBsaW5hcm8ub3JnLwoK
PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJlZ3VsYXRvci1lbmFibGUtcmFtcC1k
ZWxheSA9IDwzMjAwMD47Cj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICByZWd1bGF0
b3ItbWluLW1pY3Jvdm9sdCA9IDw4MTAwMDA+Owo+ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgcmVndWxhdG9yLW1heC1taWNyb3ZvbHQgPSA8MTA4MDAwMD47Cj4gLS0KPiAyLjI1LjEK
PgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
