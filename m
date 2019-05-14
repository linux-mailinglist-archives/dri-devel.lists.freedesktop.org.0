Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B80661E8E3
	for <lists+dri-devel@lfdr.de>; Wed, 15 May 2019 09:22:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16857895A8;
	Wed, 15 May 2019 07:21:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-xc41.google.com (mail-yw1-xc41.google.com
 [IPv6:2607:f8b0:4864:20::c41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5041892F2
 for <dri-devel@lists.freedesktop.org>; Tue, 14 May 2019 15:22:58 +0000 (UTC)
Received: by mail-yw1-xc41.google.com with SMTP id s5so14275109ywd.9
 for <dri-devel@lists.freedesktop.org>; Tue, 14 May 2019 08:22:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=EIqb4eEH0S4LgQ1Yuwg43BMgX8ef+eVurK6N5WcObMU=;
 b=lC8GHR4vbRk74W/dyeCMVzp9T3WFiT/Lc7y+uQNECgVZn/o1gW4IsAni5pSWKG0AnT
 hUS7gbhx9TkZrlCdMgV5THJnu0K+iqsdNxWqQ2VZPpsybs4CIrg5uFVckCPmX/Tc72+G
 r1Z6xbk9vGgQ5PY/Fbs1Mkq8RmJF+MgzeL6BHvRlRQuYru8vrD4FBHF5tRpFErx40vIt
 825BQQpqbYkph3zLKfoGwII/i5La/6WAQC1Rk6+WHkqdG28dYhqvnGvH9KjFO9bjyWI7
 q7tbMyp+MnQYD4lPmeI4gSRRtbZSo+5vaZViWB/XltVGQjcFzPVvQO+zirAWg0WlBkJN
 Smog==
X-Gm-Message-State: APjAAAVrM13u0DH0x+uirHKRfkO6/wzgXx+I5hUjTte4Uwrav0RC63+a
 YXBPPKJtKne0lO9C5/Xi/IkffoXO4nn6JJ5QFdM=
X-Google-Smtp-Source: APXvYqzsCBCwG+CsZWtmfQH5I1TFQjALA0U5fvim+GZofqMADF7Ffsdbqc9gP3rOktGVVJdHyqlZTkKTnqD3qMMrmPs=
X-Received: by 2002:a25:9b88:: with SMTP id v8mr17018094ybo.153.1557847377908; 
 Tue, 14 May 2019 08:22:57 -0700 (PDT)
MIME-Version: 1.0
References: <20190512174608.10083-1-peron.clem@gmail.com>
 <20190512174608.10083-6-peron.clem@gmail.com>
 <CAMty3ZBTO9+9HLikR8=KgWZQBp+1yVgxQ_rD-E8WeJ8VvpuAcA@mail.gmail.com>
 <CAGb2v64QpH2uL3Q2=ePEaYhrB1_J5uNT4VnBssBgwbOB0NDD0Q@mail.gmail.com>
In-Reply-To: <CAGb2v64QpH2uL3Q2=ePEaYhrB1_J5uNT4VnBssBgwbOB0NDD0Q@mail.gmail.com>
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date: Tue, 14 May 2019 17:22:46 +0200
Message-ID: <CAJiuCccZvk_rHmh4Trt+1uG0APu886Zp_DvUwGcMkph0U0biAA@mail.gmail.com>
Subject: Re: [linux-sunxi] [PATCH v4 5/8] arm64: dts: allwinner: Add mali GPU
 supply for Pine H64
To: Chen-Yu Tsai <wens@csie.org>
X-Mailman-Approved-At: Wed, 15 May 2019 07:21:53 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=EIqb4eEH0S4LgQ1Yuwg43BMgX8ef+eVurK6N5WcObMU=;
 b=vYmdyv9F2aheI/anon+QKteAny7T9Jkr5RqQgnGlUFC7tfsc6l0uZhzwhbGkpKWrM+
 0wIQgCkUqAIJJiuKcWpmOAP1rmiLDxREh2+HSn/77OrV2OmMe1GNryaK5Jhn6rMzT3bJ
 k7ecYwXz++aYRjdGRlKRK/baHs1CClyfvLZPqRIbMWxra8vFvLGZETpzx0FWraGbciky
 q0O/MwvkTRJBcA2bOTZykoX7/cO+79ijS0Lv86uRvIt5UvugjKjNs5tODTEkfpT5F4g6
 Ih9QJYumpv8dTaoCeesPt1IjlsdakWKtHqihnDqKfQLwWnTw37x8K9mhyhAs1u18HPX8
 3cuA==
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
 devicetree <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 linux-sunxi <linux-sunxi@googlegroups.com>, Rob Herring <robh+dt@kernel.org>,
 Jagan Teki <jagan@amarulasolutions.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgSmFnYW4sIENoZW4tWXUsCgpPbiBUdWUsIDE0IE1heSAyMDE5IGF0IDEyOjE4LCBDaGVuLVl1
IFRzYWkgPHdlbnNAY3NpZS5vcmc+IHdyb3RlOgo+Cj4gT24gTW9uLCBNYXkgMTMsIDIwMTkgYXQg
MjoyOCBBTSBKYWdhbiBUZWtpIDxqYWdhbkBhbWFydWxhc29sdXRpb25zLmNvbT4gd3JvdGU6Cj4g
Pgo+ID4gT24gU3VuLCBNYXkgMTIsIDIwMTkgYXQgMTE6MTYgUE0gPHBlcm9uLmNsZW1AZ21haWwu
Y29tPiB3cm90ZToKPiA+ID4KPiA+ID4gRnJvbTogQ2zDqW1lbnQgUMOpcm9uIDxwZXJvbi5jbGVt
QGdtYWlsLmNvbT4KPiA+ID4KPiA+ID4gRW5hYmxlIGFuZCBhZGQgc3VwcGx5IHRvIHRoZSBNYWxp
IEdQVSBub2RlIG9uIHRoZQo+ID4gPiBQaW5lIEg2NCBib2FyZC4KPiA+ID4KPiA+ID4gU2lnbmVk
LW9mZi1ieTogQ2zDqW1lbnQgUMOpcm9uIDxwZXJvbi5jbGVtQGdtYWlsLmNvbT4KPiA+ID4gLS0t
Cj4gPiA+ICBhcmNoL2FybTY0L2Jvb3QvZHRzL2FsbHdpbm5lci9zdW41MGktaDYtcGluZS1oNjQu
ZHRzIHwgNSArKysrKwo+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKQo+ID4g
Pgo+ID4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy9hbGx3aW5uZXIvc3VuNTBp
LWg2LXBpbmUtaDY0LmR0cyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvYWxsd2lubmVyL3N1bjUwaS1o
Ni1waW5lLWg2NC5kdHMKPiA+ID4gaW5kZXggNDgwMjkwMmUxMjhmLi5lMTZhOGM2NzM4ZjkgMTAw
NjQ0Cj4gPiA+IC0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvYWxsd2lubmVyL3N1bjUwaS1oNi1w
aW5lLWg2NC5kdHMKPiA+ID4gKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9hbGx3aW5uZXIvc3Vu
NTBpLWg2LXBpbmUtaDY0LmR0cwo+ID4gPiBAQCAtODUsNiArODUsMTEgQEAKPiA+ID4gICAgICAg
ICBzdGF0dXMgPSAib2theSI7Cj4gPiA+ICB9Owo+ID4gPgo+ID4gPiArJmdwdSB7Cj4gPiA+ICsg
ICAgICAgbWFsaS1zdXBwbHkgPSA8JnJlZ19kY2RjYz47Cj4gPiA+ICsgICAgICAgc3RhdHVzID0g
Im9rYXkiOwo+ID4gPiArfTsKPiA+Cj4gPiBJIHRoaW5rIHdlIGNhbiBzcXVhc2ggYWxsIHRoZXNl
IGJvYXJkIGR0cyBjaGFuZ2VzIGludG8gc2luZ2xlIHBhdGNoLgo+Cj4gWWVzLiBQbGVhc2UgZG8g
c28gZm9yIGFsbCBwYXRjaGVzIHdpdGggdGhlIHNhbWUgY2hhbmdlcyBhcHBsaWVkIHRvIGRpZmZl
cmVudAo+IGJvYXJkcywgYW5kIGF1dGhvcmVkIGJ5IHRoZSBzYW1lIHBlcnNvbi4KCkkgdGhvdWdo
dCBpdCB3YXMgcmVxdWlyZWQgdG8gaGF2ZSAic21hbGxlc3QiIHBhdGNoIGFzIHBvc3NpYmxlLgpB
bmQgaXQncyBhbHNvIGJldHRlciBmb3IgdHJhY2tpbmcgIlRlc3RlZC1ieSIgdGFnLgoKSSB3aWxs
IHNxdWFzaCB0aGVtIGluIHRoZSBuZXh0IHZlcnNpb24uCgpUaGFua3MsCkNsZW1lbnQKPgo+IENo
ZW5ZdQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
