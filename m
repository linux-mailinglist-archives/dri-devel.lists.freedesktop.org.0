Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 410A41B01EC
	for <lists+dri-devel@lfdr.de>; Mon, 20 Apr 2020 08:55:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4023C6E1CF;
	Mon, 20 Apr 2020 06:55:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com
 [IPv6:2607:f8b0:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3D016E451
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Apr 2020 09:25:20 +0000 (UTC)
Received: by mail-il1-x134.google.com with SMTP id f82so6618911ilh.8
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Apr 2020 02:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=IVfVaIgVGlSNv1IAtMUZwjF1hn02HfUDYJcRcSDSIrU=;
 b=kTS24IdLWHMBDGq+NpCb4YCezSTjPOT3lXb0FhNdXiPmK5NrZGGK52haVSfXEU6Ndj
 4hqhpbZlaYEpA9yzxLFB17W3ye3e1gJd7soL0Qs8lKKAzvTCpLm3LmK/xTymwN9/4+so
 GQPQEUYla4HxNT/DwhdhoM7vjrjuFQojP2ml5em2pgpWQVeT+36kc3XwZxjS+XX19ezH
 IlszYdd8hFN8ApV/RdQwbzGA3kZYPM7svi5cJnEAfqpYuwiZEq1uXeujAk3kezStnPBC
 kOpKxevP79//eZH2QTfm7mX2wFGQlugSyw2JTgQ7lV1oQEGugBOxxJEjT1DhSw9R38xZ
 0shg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=IVfVaIgVGlSNv1IAtMUZwjF1hn02HfUDYJcRcSDSIrU=;
 b=jbsHPhaEBAc3muz2xhNmC80C5U+tKHoDw1WUEN/UcKWQb5jy2nb+HEE9127nJvQaeW
 Hi+Fzv8ZCH74JkDUWB6Y6AkV2ESBcKf8MSXMYnSLYCyJ85e3adnYzv+uaR9JgQQyZsJV
 Nqmd5cuqS7aPSx57pnUkitvD0I70lPJ5Qv+jYU8aioBSOZRMBt1ZxWmHDYPRl9k+jegL
 VbI/3fkK6ytwgKmrFtBZB3jk2zA8b1SoYHMVNXysgy/F7zw50QecX6Uu1wtz1tMo9tgO
 +vwBUX2czsROxNTekgzYVHaTK0jy6Ogg28gV2Cjunfk+7YkO6qJZ7WU12lMfZAFKhAh8
 qzLA==
X-Gm-Message-State: AGi0PubKIxbQLqHaHKTIJtc6JWDa7ojEZxTboW2NqId6zkeWDv+oRzmc
 kg9cuPFP7Feqc+7D486gwKriZr7j88TQQYtaTwQ=
X-Google-Smtp-Source: APiQypJBoKtsP+3E2TKCkI9VLQhvM6cPmwbZtxSn9QoLSzwFZyzeWjXdAytf78HSH+qeMUpvBnp3KUuWObpUallXbAA=
X-Received: by 2002:a92:d8ca:: with SMTP id l10mr131258ilo.118.1587288319958; 
 Sun, 19 Apr 2020 02:25:19 -0700 (PDT)
MIME-Version: 1.0
References: <20200411200632.4045-1-peron.clem@gmail.com>
 <20200411200632.4045-2-peron.clem@gmail.com>
 <c96f31a2-6ff4-31aa-aaac-2ce9eafb3bfe@arm.com>
 <CAJiuCcegkNGQ7j4jcT1rBpSLqG1c-nb8g0wq+Nbvt-dGj7am2Q@mail.gmail.com>
 <CAJiuCceU662o7QGJ=mmT3pzVWK7uJUN=6+NKQnZ=Cfj9c2nw7A@mail.gmail.com>
 <d6465e7e-8e05-8b7d-16bd-f40877969089@arm.com>
 <CAJiuCccv2XPLY6sjcgvvrG5a8ONYHa_xn9i-YUDKUDK5a0DY=A@mail.gmail.com>
 <CAJiuCcfa9ro1V4nBzfD48cCuHpEsLaNA5P0bb-tQ3hcWUCtpkA@mail.gmail.com>
 <000f26f4-3640-797f-c7f6-4b31a5e2669e@arm.com>
 <CAJiuCccF3tmbmMWNh0nC5WRJ1_iPdj6f1oH1zYMSue_pFrXsPQ@mail.gmail.com>
 <20200414185523.GO5412@sirena.org.uk>
 <CAJiuCce5ekAed6RF8+x_ehruCXW3900wkFNKRXN_Xo_62MPXew@mail.gmail.com>
 <5e15e7ac-1d9c-d614-8fd9-27525c88cafb@arm.com>
 <5290a7a8-2a0a-cb89-9d62-270393123054@arm.com>
 <CAJiuCccm4gTAUWhTy+gK0kt4of=8yWcz2n_JtnmeAJofcpBKeQ@mail.gmail.com>
In-Reply-To: <CAJiuCccm4gTAUWhTy+gK0kt4of=8yWcz2n_JtnmeAJofcpBKeQ@mail.gmail.com>
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date: Sun, 19 Apr 2020 11:25:08 +0200
Message-ID: <CAJiuCceECTKqTecq5KGayzNqOvQfOctR8RqnncKU66ieU7hH1w@mail.gmail.com>
Subject: Re: Multiple regulators for one device [was drm/panfrost: add devfreq
 regulator support]
To: Robin Murphy <robin.murphy@arm.com>
X-Mailman-Approved-At: Mon, 20 Apr 2020 06:55:01 +0000
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
Cc: Nishanth Menon <nm@ti.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Stephen Boyd <sboyd@kernel.org>, Viresh Kumar <vireshk@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>, Mark Brown <broonie@kernel.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpPbiBGcmksIDE3IEFwciAyMDIwIGF0IDE0OjMzLCBDbMOpbWVudCBQw6lyb24gPHBlcm9u
LmNsZW1AZ21haWwuY29tPiB3cm90ZToKPgo+IEhpIFJvYmluLAo+Cj4gT24gRnJpLCAxNyBBcHIg
MjAyMCBhdCAxMzoxMCwgUm9iaW4gTXVycGh5IDxyb2Jpbi5tdXJwaHlAYXJtLmNvbT4gd3JvdGU6
Cj4gPgo+ID4gT24gMjAyMC0wNC0xNiAyOjQyIHBtLCBTdGV2ZW4gUHJpY2Ugd3JvdGU6Cj4gPiBb
Li4uXQo+ID4gPiBQZXJoYXBzIGEgYmV0dGVyIGFwcHJvYWNoIHdvdWxkIGJlIGZvciBQYW5mcm9z
dCB0byBoYW5kIG92ZXIgdGhlIHN0cnVjdAo+ID4gPiByZWd1bGF0b3Igb2JqZWN0cyBpdCBoYXMg
YWxyZWFkeSBnb3QgdG8gdGhlIE9QUCBmcmFtZXdvcmsuIEkuZS4gb3Blbgo+ID4gPiBjb2RlIGRl
dl9wbV9vcHBfc2V0X3JlZ3VsYXRvcnMoKSwgYnV0IGluc3RlYWQgb2YgY2FsbGluZwo+ID4gPiBy
ZWd1bGF0b3JfZ2V0X29wdGlvbmFsKCkgc2ltcGx5IHBvcHVsYXRlIHRoZSByZWd1bGF0b3JzIHdl
IGFscmVhZHkgaGF2ZT8KCkp1c3Qgc2F3IHRoYXQgYSBMaW1hIGRldmZyZXFbMF0gaGFzIGJlZW4g
YWxzbyBpbnRyb2R1Y2VkIHdpdGggSSB0aGluawpleGFjdGx5IHRoZSBzYW1lIGxvZ2ljLgoKSXMg
dGhpcyBzb21ldGhpbmcgdGhhdCBoYXNuJ3QgYmVlbiB0cmlnZ2VyZWQgYnkgTWFpbnRhaW5lciBv
ciBJIGFtCm1pc3Npbmcgc29tZXRoaW5nPwoKSSB3aWxsIGJhY2twb3J0IHNvbWUgcmVtYXJrcyBt
YWRlIG9uIHRoZSBsaW1hIGRldmZyZXEgdG8gaW1wcm92ZSBwYW5mcm9zdCBvbmUuClRoZXkgYXJl
IGFsbW9zdCBpZGVudGljYWwuCgpSZWdhcmRzLApDbGVtZW50CgowOiBodHRwczovL2NnaXQuZnJl
ZWRlc2t0b3Aub3JnL2RybS1taXNjL2NvbW1pdC8/aWQ9MTk5Njk3MDc3M2EzMjM1MzNlMWNjMWI2
Yjk3ZjAwYTk1ZDY3NWYzMgoKPiA+ID4KPiA+ID4gVGhlIG90aGVyIGJlbmVmaXQgb2YgdGhhdCBp
cyBpdCB3b3VsZCBwcm92aWRlIGEgY2xlYXIgaGFuZC1vdmVyIG9mCj4gPiA+IHJlc3BvbnNpYmls
aXR5IGJldHdlZW4gUGFuZnJvc3QgaGFuZGxpbmcgaXQncyBvd24gcmVndWxhdG9ycyBhbmQgdGhl
IE9QUAo+ID4gPiBmcmFtZXdvcmsgcGlja2luZyB1cCB0aGUgd29yay4gVGhlIGRpc2FkdmFudGFn
ZSBpcyB0aGF0IFBhbmZyb3N0IHdvdWxkCj4gPiA+IGhhdmUgdG8gdHJhY2sgd2hldGhlciB0aGUg
cmVndWxhdG9ycyBoYXZlIGJlZW4gaGFuZGVkIG92ZXIgb3Igbm90Lgo+ID4KPiA+IFNvdW5kcyBs
aWtlIHRoZSBtb3N0IGxvZ2ljYWwgdGhpbmcgdG8gZG8gaXMgdG8gc2h1ZmZsZSB0aGluZ3MgYXJv
dW5kIHNvCj4gPiB3ZSBzdGFydCBieSB0cnlpbmcgdG8gc2V0IHVwIGFuIE9QUCB0YWJsZSwgdGhl
biBmYWxsIGJhY2sgdG8gZXhwbGljaXRseQo+ID4gY2xhaW1pbmcgY2xvY2tzIGFuZCByZWd1bGF0
b3JzIGlmIG5lY2Vzc2FyeS4gVGhlbiB3ZSBjYW4gZWFzaWx5IG1ha2UgdGhlCj4gPiBkZXZmcmVx
IGRlY2lzaW9uIGxhdGVyIGluIHByb2JlIGJhc2VkIG9uIGhvdyB0aGF0IHR1cm5lZCBvdXQuCj4K
PiBPayBJIHdpbGwgcHJvcG9zZSBhIG5ldyBzZXJpZSB3aXRoIHRoaXMgYmVoYXZpb3IsCj4KPiBU
aGFua3MKPiBDbGVtZW50Cj4KPiA+Cj4gPiBSb2Jpbi4KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVsCg==
