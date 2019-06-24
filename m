Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C23451C3B
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2019 22:25:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E60889C61;
	Mon, 24 Jun 2019 20:25:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from shards.monkeyblade.net (shards.monkeyblade.net
 [IPv6:2620:137:e000::1:9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DD5589C61
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 20:25:00 +0000 (UTC)
Received: from localhost (unknown [IPv6:2601:601:9f80:35cd::d71])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id 378BE126B52D0;
 Mon, 24 Jun 2019 13:24:59 -0700 (PDT)
Date: Mon, 24 Jun 2019 13:24:56 -0700 (PDT)
Message-Id: <20190624.132456.2013417744691373807.davem@davemloft.net>
To: megous@megous.com
Subject: Re: [PATCH v7 0/6] Add support for Orange Pi 3
From: David Miller <davem@davemloft.net>
In-Reply-To: <20190624174637.6sznc5ifiuh4c3sm@core.my.home>
References: <20190620134748.17866-1-megous@megous.com>
 <20190624.102927.1268781741493594465.davem@davemloft.net>
 <20190624174637.6sznc5ifiuh4c3sm@core.my.home>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Mon, 24 Jun 2019 13:24:59 -0700 (PDT)
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
Cc: mark.rutland@arm.com, joabreu@synopsys.com, alexandre.torgue@st.com,
 devicetree@vger.kernel.org, maxime.ripard@bootlin.com, netdev@vger.kernel.org,
 wens@csie.org, jernej.skrabec@gmail.com, linux-kernel@vger.kernel.org,
 airlied@linux.ie, linux-sunxi@googlegroups.com, robh+dt@kernel.org,
 dri-devel@lists.freedesktop.org, peppe.cavallaro@st.com,
 linux-stm32@st-md-mailman.stormreply.com, mcoquelin.stm32@gmail.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogT25kxZllaiBKaXJtYW4gPG1lZ291c0BtZWdvdXMuY29tPgpEYXRlOiBNb24sIDI0IEp1
biAyMDE5IDE5OjQ2OjM3ICswMjAwCgo+IFRoaXMgc2VyaWVzIHdhcyBldmVuIGxvbmdlciBiZWZv
cmUsIHdpdGggcGF0Y2hlcyBhbGwgYXJvdW5kIGZvciB2YXJpb3VzCj4gbWFpbnRhaW5lcnMuIEkn
ZCBleHBlY3QgdGhhdCByZWxldmFudCBtYWludGFpbmVycyBwaWNrIHRoZSByYW5nZSBvZiBwYXRj
aGVzCj4gbWVhbnQgZm9yIHRoZW0uIEkgZG9uJ3Qga25vdyB3aG8ncyBleGFjdGx5IHJlc3BvbnNp
YmxlIGZvciB3aGF0LCBidXQgSSB0aGluaywKPiB0aGlzIHNob3VsZCB3b3JrOgo+IAo+IC0gMiBz
dG1tYWMgcGF0Y2hlcyBzaG91bGQgZ28gdG9nZXRoZXIgdmlhIHNvbWUgbmV0d29ya2luZyB0cmVl
IChpcyB0aGVyZQo+ICAgc29tZXRoaW5nIHNwZWNpZmljIGZvciBzdG1tYWM/KQo+IC0gYWxsIERU
UyBwYXRjaGVzIHNob3VsZCBnbyB2aWEgc3VueGkKPiAtIGhkbWkgcGF0Y2hlcyB2aWEgc29tZSBk
cm0gdHJlZQoKVGhhbmsgeW91LiAgU28gSSdsbCBtZXJnZSB0aGUgZmlyc3QgdHdvIHBhdGNoZXMg
dGhhdCB0b3VjaCB0aGUgc3RtbWFjCmRyaXZlciB2aWEgbXkgbmV0LW5leHQgdHJlZS4KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
