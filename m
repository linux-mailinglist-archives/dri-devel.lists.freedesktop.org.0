Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 291EA108395
	for <lists+dri-devel@lfdr.de>; Sun, 24 Nov 2019 15:07:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 397396E0CC;
	Sun, 24 Nov 2019 14:07:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7A966E0CC
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Nov 2019 14:07:12 +0000 (UTC)
Received: from pendragon.ideasonboard.com (fs96f9c64d.tkyc509.ap.nuro.jp
 [150.249.198.77])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 30D3BD4B;
 Sun, 24 Nov 2019 15:07:10 +0100 (CET)
Date: Sun, 24 Nov 2019 16:07:02 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH v3 08/21] drm/bridge: Add the
 drm_for_each_bridge_in_chain() helper
Message-ID: <20191124140702.GK4727@pendragon.ideasonboard.com>
References: <20191023154512.9762-1-boris.brezillon@collabora.com>
 <20191023154512.9762-9-boris.brezillon@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191023154512.9762-9-boris.brezillon@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1574604431;
 bh=QIQymv6qd2ykGSf5dOK4PtXHV5nSJg+KRVTPHFptRMA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QX/Ml0OstNI5mXkOT7W7oeP5kHE8RXzV6OyWGI8I2bl47rwkJyuFfiY0z/uX9sHeE
 kM+dPUFZCJpcRim8bsXU37kuM4Nl9uxXsZ1cEYX9IIioQEtU9MDwWGA/A7PLBOAzkq
 l1I/srEOt1a8uih6/t2qxzaZ1Se2Ozd19L9bcScM=
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
 Neil Armstrong <narmstrong@baylibre.com>, dri-devel@lists.freedesktop.org,
 Thierry Reding <thierry.reding@gmail.com>, kernel@collabora.com,
 Sam Ravnborg <sam@ravnborg.org>,
 Nikita Yushchenko <nikita.yoush@cogentembedded.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, Chris Healy <cphealy@gmail.com>,
 devicetree@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>,
 Rob Herring <robh+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Seung-Woo Kim <sw0312.kim@samsung.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgQm9yaXMsCgpUaGFuayB5b3UgZm9yIHRoZSBwYXRjaC4KT24gV2VkLCBPY3QgMjMsIDIwMTkg
YXQgMDU6NDQ6NTlQTSArMDIwMCwgQm9yaXMgQnJlemlsbG9uIHdyb3RlOgo+IFRvIGl0ZXJhdGUg
b3ZlciBhbGwgYnJpZGdlcyBhdHRhY2hlZCB0byBhIHNwZWNpZmljIGVuY29kZXIuCj4gCj4gU3Vn
Z2VzdGVkLWJ5OiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2Fy
ZC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogQm9yaXMgQnJlemlsbG9uIDxib3Jpcy5icmV6aWxsb25A
Y29sbGFib3JhLmNvbT4KPiAtLS0KPiBDaGFuZ2VzIGluIHYzOgo+ICogTm9uZQo+IAo+IENoYW5n
ZXMgaW4gdjI6Cj4gKiBOZXcgcGF0Y2gKPiAtLS0KPiAgaW5jbHVkZS9kcm0vZHJtX2JyaWRnZS5o
IHwgMTEgKysrKysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKykKPiAK
PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vZHJtX2JyaWRnZS5oIGIvaW5jbHVkZS9kcm0vZHJt
X2JyaWRnZS5oCj4gaW5kZXggM2FiMTZjOTVlNTllLi4yMzhlODRhYjYzYTMgMTAwNjQ0Cj4gLS0t
IGEvaW5jbHVkZS9kcm0vZHJtX2JyaWRnZS5oCj4gKysrIGIvaW5jbHVkZS9kcm0vZHJtX2JyaWRn
ZS5oCj4gQEAgLTQ0MSw2ICs0NDEsMTcgQEAgZHJtX2JyaWRnZV9jaGFpbl9nZXRfZmlyc3RfYnJp
ZGdlKHN0cnVjdCBkcm1fZW5jb2RlciAqZW5jb2RlcikKPiAgCQkJCQlzdHJ1Y3QgZHJtX2JyaWRn
ZSwgY2hhaW5fbm9kZSk7Cj4gIH0KPiAgCj4gKy8qKgo+ICsgKiBmb3JfZWFjaF9icmlkZ2VfaW5f
Y2hhaW4oKSAtIEl0ZXJhdGUgb3ZlciBhbGwgYnJpZGdlcyBwcmVzZW50IGluIGEgY2hhaW4KClRo
ZSBuYW1lIGRvZXNuJ3QgbWF0Y2ggdGhlIG1hY3JvIGJlbG93LiBBcGFydCBmcm9tIHRoYXQsCgpS
ZXZpZXdlZC1ieTogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9h
cmQuY29tPgoKPiArICogQGVuY29kZXI6IHRoZSBlbmNvZGVyIHRvIGl0ZXJhdGUgYnJpZGdlcyBv
bgo+ICsgKiBAYnJpZGdlOiBhIGJyaWRnZSBwb2ludGVyIHVwZGF0ZWQgdG8gcG9pbnQgdG8gdGhl
IGN1cnJlbnQgYnJpZGdlIGF0IGVhY2gKPiArICoJICAgIGl0ZXJhdGlvbgo+ICsgKgo+ICsgKiBJ
dGVyYXRlIG92ZXIgYWxsIGJyaWRnZXMgcHJlc2VudCBpbiB0aGUgYnJpZGdlIGNoYWluIGF0dGFj
aGVkIHRvIEBlbmNvZGVyLgo+ICsgKi8KPiArI2RlZmluZSBkcm1fZm9yX2VhY2hfYnJpZGdlX2lu
X2NoYWluKGVuY29kZXIsIGJyaWRnZSkJCQlcCj4gKwlsaXN0X2Zvcl9lYWNoX2VudHJ5KGJyaWRn
ZSwgJihlbmNvZGVyKS0+YnJpZGdlX2NoYWluLCBjaGFpbl9ub2RlKQo+ICsKPiAgYm9vbCBkcm1f
YnJpZGdlX2NoYWluX21vZGVfZml4dXAoc3RydWN0IGRybV9icmlkZ2UgKmJyaWRnZSwKPiAgCQkJ
CSBjb25zdCBzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSAqbW9kZSwKPiAgCQkJCSBzdHJ1Y3QgZHJt
X2Rpc3BsYXlfbW9kZSAqYWRqdXN0ZWRfbW9kZSk7CgotLSAKUmVnYXJkcywKCkxhdXJlbnQgUGlu
Y2hhcnQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
