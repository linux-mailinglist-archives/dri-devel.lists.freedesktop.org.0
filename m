Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D19A081723
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2019 12:35:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FB156E2B0;
	Mon,  5 Aug 2019 10:35:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0697E6E2B0
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Aug 2019 10:35:08 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id g17so83868789wrr.5
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Aug 2019 03:35:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=Kjh2wZD+C5G0lFzQPAaduu/KloJy49QwHv2GdQc5xdw=;
 b=tgtiOaCQPdyUGxJW3guyLxM9Muh7ZkBQ+4gLpBVdWRMQm4YXfqRjLLysxMr0/IKO94
 HBWChDkKw5lMugx4tZr+P0hjzGnpvjZOJLYVbupX54P+WEa33kLPbVs9IRKcUQ65rLss
 T9kl8gU28lduHAck+qgxZN+E1BNXSJYMM7SSVMMHdnXrUWa7/SxOMcZn16qT8nePlr5k
 YQcxdNU9zimzOgCbmZ1NNOLjr/t8X7hFSejRO/39viNiUZZIyRyZXIguJT/Kld1x4qyK
 pzJQlR7mf86It11I86ARW1+mxwMOZfL7a2dyr/UIZ5Ip5hBs7b4+umCZ0+E5GeCIQXtK
 jeTQ==
X-Gm-Message-State: APjAAAXCYmLSbX2pmalfnhWCKIWR27oBv2UdLgVp67vc7s6Qv9MtatWR
 ilD8lpbuXsmJnGCHXL0kOpuPsA==
X-Google-Smtp-Source: APXvYqya7YAbfocEu6BT3YDWjdV9SNGo/EMhSMjnZMgc3BZIrZDW3ID7mxna1ILKFm2MHMM70QjwNw==
X-Received: by 2002:a5d:53c2:: with SMTP id a2mr85475933wrw.8.1565001306538;
 Mon, 05 Aug 2019 03:35:06 -0700 (PDT)
Received: from dell ([109.180.115.177])
 by smtp.gmail.com with ESMTPSA id g19sm153371030wrb.52.2019.08.05.03.35.05
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 05 Aug 2019 03:35:05 -0700 (PDT)
Date: Mon, 5 Aug 2019 11:35:04 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v1 1/1] backlight: drop EARLY_EVENT_BLANK support
Message-ID: <20190805103504.GE4739@dell>
References: <20190725143224.GB31803@ravnborg.org>
 <20190725143934.GH15868@phenom.ffwll.local>
 <20190725150629.GN23883@dell> <20190726160953.GA25708@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190726160953.GA25708@ravnborg.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=Kjh2wZD+C5G0lFzQPAaduu/KloJy49QwHv2GdQc5xdw=;
 b=xfSd/bUlN5TMq9AoknFn8PgFc2Kuli+KjdAgRwgGW3D+pISqRyWFVcyzO42ubAEEoS
 KDNOuKC9vBHR90CH2XDfoin9lqeLLnGE83gsOnWdBetcq9DDhEM/482kPreFKvuFNKXm
 8STwWX2zwFomZlPq1nCZys1no4/ODSSCs0nnBxBQm3Eb900E7NxDthEdDJ4aUxM+1Qtw
 H1cZDJjJ1thU55RoDA8K8dK0o84jUJCA9jyQ3GB4J0gFigx3uXtdwftmhO9uSYDByPhW
 i7IBLBSZ4Dy1qhyZsHn+YQdksf+wwuQ6w2buoKoOWybscM1IWTdml70k4PbxM08TaVTz
 AUlw==
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
 Gerd Hoffmann <kraxel@redhat.com>, Jingoo Han <jingoohan1@gmail.com>,
 Peter Rosin <peda@axentia.se>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAyNiBKdWwgMjAxOSwgU2FtIFJhdm5ib3JnIHdyb3RlOgoKPiBIaSBMZWUuCj4gCj4g
T24gVGh1LCBKdWwgMjUsIDIwMTkgYXQgMDQ6MDY6MjlQTSArMDEwMCwgTGVlIEpvbmVzIHdyb3Rl
Ogo+ID4gT24gVGh1LCAyNSBKdWwgMjAxOSwgRGFuaWVsIFZldHRlciB3cm90ZToKPiA+IAo+ID4g
PiBPbiBUaHUsIEp1bCAyNSwgMjAxOSBhdCAwNDozMjoyNFBNICswMjAwLCBTYW0gUmF2bmJvcmcg
d3JvdGU6Cj4gPiA+ID4gVGhlcmUgd2FzIG5vIHVzZXJzIGxlZnQgLSBzbyBkcm9wIHRoZSBjb2Rl
IHRvIHN1cHBvcnQgRUFSTFlfRkJfQkxBTksuCj4gPiA+ID4gVGhpcyBwYXRjaCByZW1vdmVzIHRo
ZSBzdXBwb3J0IGluIGJhY2tsaWdodCwKPiA+ID4gPiBhbmQgZHJvcCB0aGUgbm90aWZpZXIgaW4g
ZmJtZW0uCj4gPiA+ID4gCj4gPiA+ID4gVGhhdCBFQVJMWV9GQl9CTEFOSyBpcyBub3QgdXNlZCBj
YW4gYmUgdmVyaWZpZWQgdGhhdCBubyBkcml2ZXIgc2V0IGFueSBvZjoKPiA+ID4gPiAKPiA+ID4g
PiAgICAgbGNkX29wcy5lYXJseV9zZXRfcG93ZXIoKQo+ID4gPiA+ICAgICBsY2Rfb3BzLnJfZWFy
bHlfc2V0X3Bvd2VyKCkKPiA+ID4gPiAKPiA+ID4gPiBOb3RpY2VkIHdoaWxlIGJyb3dzaW5nIGJh
Y2tsaWdodCBjb2RlIGZvciBvdGhlciByZWFzb25zLgo+ID4gPiAKPiA+ID4gQWggSSBkaWRuJ3Qg
Z3JlcCBoYXJkIGVub3VnaCwgSSBkaWRuJ3QgcmVhbGl6ZSB0aGF0IG5vIG9uZSBzZXRzIHRoZQo+
ID4gPiBsY2Rfb3BzLT4ocl8pZWFybHlfc2V0X3Bvd2VyIGhvb2tzLiBOaWNlIGZpbmQhCj4gPiA+
IAo+ID4gPiBSZXZpZXdlZC1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5j
aD4KPiA+ID4gCj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJv
cmcub3JnPgo+ID4gPiA+IENjOiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgo+ID4g
PiA+IENjOiBEYW5pZWwgVGhvbXBzb24gPGRhbmllbC50aG9tcHNvbkBsaW5hcm8ub3JnPgo+ID4g
PiA+IENjOiBKaW5nb28gSGFuIDxqaW5nb29oYW4xQGdtYWlsLmNvbT4KPiA+ID4gPiBDYzogQmFy
dGxvbWllaiBab2xuaWVya2lld2ljeiA8Yi56b2xuaWVya2llQHNhbXN1bmcuY29tPgo+ID4gPiA+
IENjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPgo+ID4gPiA+IENjOiBT
YW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+Cj4gPiA+ID4gQ2M6IE1hYXJ0ZW4gTGFua2hv
cnN0IDxtYWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRlbC5jb20+Cj4gPiA+ID4gQ2M6ICJNaWNo
YcWCIE1pcm9zxYJhdyIgPG1pcnEtbGludXhAcmVyZS5xbXFtLnBsPgo+ID4gPiA+IENjOiBQZXRl
ciBSb3NpbiA8cGVkYUBheGVudGlhLnNlPgo+ID4gPiA+IENjOiBHZXJkIEhvZmZtYW5uIDxrcmF4
ZWxAcmVkaGF0LmNvbT4KPiA+ID4gPiBDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
Zwo+ID4gPiA+IENjOiBsaW51eC1mYmRldkB2Z2VyLmtlcm5lbC5vcmcKPiA+ID4gPiAtLS0KPiA+
ID4gPiAKPiA+ID4gPiBCdWlsZCB0ZXN0ZWQgd2l0aCB2YXJpb3VzIGFyY2hpdGVjdHVyZXMsIGNv
bmZpZ3MuCj4gPiA+ID4gCj4gPiA+ID4gTGVlLCBEYW5pZWwgLSBPSyB0byBjb21taXQgdG8gZHJt
LW1pc2MtbmV4dCB3aGVyZSBmYmRldiBzdHVmZiBpcwo+ID4gPiA+IG1haW50YWluZWQgdG9kYXk/
Cj4gPiA+IAo+ID4gPiBiYWNrbGlnaHQgaXMgc2VwYXJhdGUgZnJvbSBmYmRldiBpbiBMZWUncyBv
d24gdHJlZSwgbm90IGluIGRybS1taXNjLiBJCj4gPiA+IHRoaW5rIGF0IGxlYXN0Lgo+ID4gCj4g
PiBUaGF0J3MgY29ycmVjdC4gIFdlJ2xsIHNvcnQgdGhhdCBvbmNlIHdlIGhhdmUgYWxsIHRoZSBB
Y2tzLgo+IAo+IFdlIGhhdmUgYWNrcyBhbGwgYXJvdW5kIG5vdy4KCkkgYW0gc3RpbGwgbWlzc2lu
ZyBEYW5pZWwgVCdzIEFjay4KCj4gT0sgdGhhdCBJIGNvbW1pdCB0aGlzIHRvIGRybS1taXNjLW5l
eHQ/Cj4gCj4gVGhpcyBpcyB3aGVyZSB3ZSBtYWludGFpbiBmYmRldiB0aGVzZSBkYXlzLiBPciB5
b3UgY291bGQgYXBwbHkgaXQgdG8KPiB5b3VyIGJhY2tsaWdodCB0cmVlLgo+IAo+IEJvdGggc29s
dXRpbnMgd291bGQgYmUgZmluZSBhcyB0aGUgcmlzayBvZiBpbnRyb2R1Y2luZyBtZXJnZSBjb25m
bGljdHMKPiBpbiB0aGVzZSBjb2RlIHBhdGhzIGFyZSBtaW5pbWFsLgoKSWYgdGhhdCdzIHRoZSBj
YXNlLCB0aGVuIEknZCBiZSBoYXBweSB0byBhcHBseSBpdCB0byB0aGUgQmFja2xpZ2h0CnRyZWUu
CgotLSAKTGVlIEpvbmVzIFvmnY7nkLzmlq9dCkxpbmFybyBTZXJ2aWNlcyBUZWNobmljYWwgTGVh
ZApMaW5hcm8ub3JnIOKUgiBPcGVuIHNvdXJjZSBzb2Z0d2FyZSBmb3IgQVJNIFNvQ3MKRm9sbG93
IExpbmFybzogRmFjZWJvb2sgfCBUd2l0dGVyIHwgQmxvZwpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
