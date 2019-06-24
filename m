Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55E505247E
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2019 09:28:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 243A889F8E;
	Tue, 25 Jun 2019 07:27:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from vps.xff.cz (vps.xff.cz [195.181.215.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAE7289DB9
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 20:28:58 +0000 (UTC)
Date: Mon, 24 Jun 2019 22:28:56 +0200
From: =?utf-8?Q?Ond=C5=99ej?= Jirman <megous@megous.com>
To: David Miller <davem@davemloft.net>
Subject: Re: [PATCH v7 0/6] Add support for Orange Pi 3
Message-ID: <20190624202856.ij4ujey2z6j5doxj@core.my.home>
Mail-Followup-To: David Miller <davem@davemloft.net>,
 linux-sunxi@googlegroups.com, maxime.ripard@bootlin.com,
 wens@csie.org, robh+dt@kernel.org, jernej.skrabec@gmail.com,
 airlied@linux.ie, daniel@ffwll.ch, mark.rutland@arm.com,
 peppe.cavallaro@st.com, alexandre.torgue@st.com,
 joabreu@synopsys.com, mcoquelin.stm32@gmail.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
References: <20190620134748.17866-1-megous@megous.com>
 <20190624.102927.1268781741493594465.davem@davemloft.net>
 <20190624174637.6sznc5ifiuh4c3sm@core.my.home>
 <20190624.132456.2013417744691373807.davem@davemloft.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190624.132456.2013417744691373807.davem@davemloft.net>
X-Mailman-Approved-At: Tue, 25 Jun 2019 07:27:07 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=megous.com; s=mail; 
 t=1561408136; bh=ebij2iMd2+jfNT2RnrG0rfsvu6bgvrUaIhcBD+2uT8k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ez2ClL820tax9ruDyvFd7tjrHWXeaFMT3WQ70YRkAuZXuooYJaI0bHitWPVD4PtYk
 crqCMMgvP5GhR51NkheM4lNM8F0KrnDcTmtkA5LgSRKjeMhAxcb0fGDyr5mOsWO3XB
 s/6tcRDgFEoJpxyemaGnaucncUPtp060iDqxi4N0=
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

T24gTW9uLCBKdW4gMjQsIDIwMTkgYXQgMDE6MjQ6NTZQTSAtMDcwMCwgRGF2aWQgTWlsbGVyIHdy
b3RlOgo+IEZyb206IE9uZMWZZWogSmlybWFuIDxtZWdvdXNAbWVnb3VzLmNvbT4KPiBEYXRlOiBN
b24sIDI0IEp1biAyMDE5IDE5OjQ2OjM3ICswMjAwCj4gCj4gPiBUaGlzIHNlcmllcyB3YXMgZXZl
biBsb25nZXIgYmVmb3JlLCB3aXRoIHBhdGNoZXMgYWxsIGFyb3VuZCBmb3IgdmFyaW91cwo+ID4g
bWFpbnRhaW5lcnMuIEknZCBleHBlY3QgdGhhdCByZWxldmFudCBtYWludGFpbmVycyBwaWNrIHRo
ZSByYW5nZSBvZiBwYXRjaGVzCj4gPiBtZWFudCBmb3IgdGhlbS4gSSBkb24ndCBrbm93IHdobydz
IGV4YWN0bHkgcmVzcG9uc2libGUgZm9yIHdoYXQsIGJ1dCBJIHRoaW5rLAo+ID4gdGhpcyBzaG91
bGQgd29yazoKPiA+IAo+ID4gLSAyIHN0bW1hYyBwYXRjaGVzIHNob3VsZCBnbyB0b2dldGhlciB2
aWEgc29tZSBuZXR3b3JraW5nIHRyZWUgKGlzIHRoZXJlCj4gPiAgIHNvbWV0aGluZyBzcGVjaWZp
YyBmb3Igc3RtbWFjPykKPiA+IC0gYWxsIERUUyBwYXRjaGVzIHNob3VsZCBnbyB2aWEgc3VueGkK
PiA+IC0gaGRtaSBwYXRjaGVzIHZpYSBzb21lIGRybSB0cmVlCj4gCj4gVGhhbmsgeW91LiAgU28g
SSdsbCBtZXJnZSB0aGUgZmlyc3QgdHdvIHBhdGNoZXMgdGhhdCB0b3VjaCB0aGUgc3RtbWFjCj4g
ZHJpdmVyIHZpYSBteSBuZXQtbmV4dCB0cmVlLgoKVGhhbmsgeW91LgoKcmVnYXJkcywKCU9uZHJl
agpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
