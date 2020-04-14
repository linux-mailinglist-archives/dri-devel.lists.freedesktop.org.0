Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 697181A93F4
	for <lists+dri-devel@lfdr.de>; Wed, 15 Apr 2020 09:18:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CBEF6E5D3;
	Wed, 15 Apr 2020 07:17:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com
 [IPv6:2607:f8b0:4864:20::d43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78E666E0CE
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 19:16:51 +0000 (UTC)
Received: by mail-io1-xd43.google.com with SMTP id i3so14433116ioo.13
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 12:16:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=+1oMW+73zk/UZsuvxoLBAtK4iQfyId+yP/pRZMyvftU=;
 b=tyyZshw7bi1xv4INHCsKppsByOssHMw5Hd7CChfUn5fyS1quMU/wi/0vSvbLRN5Q0Z
 r7/t/Nqn3DgGrPZ6Jy/twcQR9eVD5ut3IZ5y95BBYziXbcHSsWHD8PEn8Khsi4aK9HQR
 AbD3EZZXzOUzdC1O48m+N7JWA/ToQYtJQeE7IZDY9hkLAn8b+VHP086jenTJFWFmSqLf
 iNoEZhJVGtkAnCxQ2m1r1WTrKgcWCw+2RlRZMPDjaMfjsdwTCc3Q5UbacoLyeHYtWnxV
 N2bzPBr6iuhTgBiKWew8o30nyelngep2WnqwIHjZD8DDvzJfoXbpev800Kwjvd+0p1lw
 LifQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=+1oMW+73zk/UZsuvxoLBAtK4iQfyId+yP/pRZMyvftU=;
 b=Gxd1CLr9B/Tf8Nl8FlUMafy0JDRoczxb3xyEoPi1q7+CDQrLbE36zVSnOLPlqNyvqB
 R0dU0Tw2C8wgKKqPyJ+7xhD9pI6POMdx2EpwMqRRM1os2L2OpVNgh4q6hMiTME8rtwD0
 pJNff7HMABsxqcKRlATZB8U2nfaRm2SdoHXmC53+3HMeAM8Hp0GLGDen1z3zUtFZ4T8E
 6MaoaMz4v0iF8Fffwmb5tOYDtXOgKVzf2ndDbKvMzcQHvywZ66UUMkCQAmbFAvzCgQvu
 G6y1o5hXg+za6Bky/Pj/wZFFGIq+ISbJ4PECK50uVwzlFttEEje4aRjt091Kp95ARFyK
 VPxg==
X-Gm-Message-State: AGi0PuZdyrjgw4Ap3PMOfugZNh5oDUba4qCd1dT+jUy3QoQz0joYCZm4
 G9KzcnCxs9McC9AQ51vCXSRmfimYYv6w76FbJKA=
X-Google-Smtp-Source: APiQypLvVvaTJ20aRKds80SKfsfkdBP/7YX1znqZgfJflhsOKwwQiDSz+3hfYAWKl5ISCQaexOI42mWWAQkQ2dRBER0=
X-Received: by 2002:a6b:dd16:: with SMTP id f22mr11506998ioc.178.1586891810616; 
 Tue, 14 Apr 2020 12:16:50 -0700 (PDT)
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
In-Reply-To: <20200414185523.GO5412@sirena.org.uk>
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date: Tue, 14 Apr 2020 21:16:39 +0200
Message-ID: <CAJiuCce5ekAed6RF8+x_ehruCXW3900wkFNKRXN_Xo_62MPXew@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/panfrost: add devfreq regulator support
To: Mark Brown <broonie@kernel.org>
X-Mailman-Approved-At: Wed, 15 Apr 2020 07:17:53 +0000
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
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTWFyaywKCk9uIFR1ZSwgMTQgQXByIDIwMjAgYXQgMjA6NTUsIE1hcmsgQnJvd24gPGJyb29u
aWVAa2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBUdWUsIEFwciAxNCwgMjAyMCBhdCAwODoyMDoy
M1BNICswMjAwLCBDbMOpbWVudCBQw6lyb24gd3JvdGU6Cj4gPiBIaSBMaWFtIGFuZCBNYXJrLAo+
Cj4gWW91IG1pZ2h0IHdhbnQgdG8gZmxhZyBzdHVmZiBsaWtlIHRoaXMgaW4gdGhlIHN1YmplY3Qg
bGluZSwgSSB2ZXJ5Cj4gbmVhcmx5IGRlbGV0ZWQgdGhpcyB3aXRob3V0IG9wZW5pbmcgaXQgc2lu
Y2UgbW9zdCBvZiB0aGUgZW1haWwgSSBnZXQKPiBhYm91dCBwYW5mcm9zdCBhcHBlYXJzIHRvIGJl
IGNvbWluZyBmcm9tIG1lIGhhdmluZyBzZW50IHBhdGNoZXMgcmF0aGVyCj4gdGhhbiBiZWluZyBy
ZWxldmFudC4KCk9rIHdpbGwgZG8gbmV4dCB0aW1lLAoKPgo+ID4gV2UgYXJlIGhhdmluZyBhbiBp
c3N1ZSB3aXRoIFBhbmZyb3N0IGRyaXZlciByZWdpc3RlcmluZyB0d28gdGltZXMgdGhlCj4gPiBz
YW1lIHJlZ3VsYXRvciBhbmQgZ2l2aW5nIGFuIGVycm9yIHdoZW4gdHJ5aW5nIHRvIGNyZWF0ZSB0
aGUgZGVidWdmcwo+ID4gZm9sZGVyLgo+Cj4gPiBDb3VsZCB5b3UgY2xhcmlmeSBpZiBpdCBpcyBh
bGxvd2VkIGZvciBhIGRldmljZSB0byByZWdpc3RlciB0d28gdGltZXMKPiA+IHRoZSBzYW1lIHJl
Z3VsYXRvcj8KPgo+ID4gSSBjaGVjayBEb2N1bWVudGF0aW9uL3Bvd2VyL3JlZ3VsYXRvci9yZWd1
bGF0b3IucnN0IGJ1dCB0aGlzIHBvaW50IGlzCj4gPiBub3Qgc3BlY2lmaWVkLgo+Cj4gV2UgZG9u
J3QgYWN0aXZlbHkgcHJldmVudCBpdCBhbmQgSSBjYW4ndCB0aGluayB3aGF0IG90aGVyIHRoYW4g
ZGVidWdmcwo+IG1pZ2h0IHJ1biBpbnRvIHByb2JsZW1zIChhbmQgdGhhdCdzIGp1c3QgYSB3YXJu
aW5nKSBidXQgaXQgZG9lcyBzZWVtCj4gbGlrZSBhIHdlaXJkIHRoaW5nIHRvIHdhbnQgdG8gZG8g
YW5kIGxpa2UgaXQncyBwb2ludGluZyB0byBzb21lCj4gY29uZnVzaW9uIGluIHlvdXIgY29kZSB3
aXRoIHR3byBkaWZmZXJlbnQgcGFydHMgb2YgdGhlIGRldmljZQo+IGNvbnRyb2xsaW5nIHRoZSBz
YW1lIHN1cHBseSBpbmRlcGVuZGVudGx5LiAgV2hhdCdzIHRoZSB1c2UgY2FzZSBoZXJlPwoKUGFu
ZnJvc3QgZmlyc3QgcHJvYmUgY2xvY2ssIHJlc2V0IGFuZCByZWd1bGF0b3IgaW4gZGV2aWNlX2lu
aXQ6Cmh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L3Y1LjctcmMxL3NvdXJjZS9kcml2
ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZHJ2LmMjTDYwMgpUaGVuIGl0IHByb2JlIGZv
ciBvcHRpb25hbCBkZXZmcmVxLCBkZXZmcmVxIHdpbGwgZ2V0IG9wcCB0YWJsZXMgYW5kCmFsc28g
Z2V0IHJlZ3VsYXRvciBhZ2Fpbi4KaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvdjUu
Ny1yYzEvc291cmNlL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kcnYuYyNMNjA5
CgpUaGF0J3MgY2FuIGJlIHJld29ya2VkIGFuZCBQYW5mcm9zdCBjYW4gb25seSBwcm9iZSByZWd1
bGF0b3IgaWYgdGhlcmUKaXMgbm8gb3BwLXRhYmxlLgoKQnV0IGlmIG11bHRpcGxlIHJlZ3VsYXRv
ciBpcyBub3QgYW4gaXNzdWUgYW5kIGFzIGVhY2ggcmVxdWVzdCBpcyBsb2dpYy4KVGhlIGZpcnN0
IGluIGRldmljZV9pbml0IGFzc3VyZSB0byBlbmFibGUgdGhlIHJlZ3VsYXRvciBhbmQgdGhlIHNl
Y29uZAppbiBPUFAgYXNzdXJlIHRoZSB2b2x0YWdlIGxldmVsLgoKTWF5YmUgd2UgY2FuIGp1c3Qg
Zml4IHRoaXMgd2FybmluZz8KClRoYW5rcywKQ2xlbWVudApfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
