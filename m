Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 02D1E2884E4
	for <lists+dri-devel@lfdr.de>; Fri,  9 Oct 2020 10:07:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C7BB6EC49;
	Fri,  9 Oct 2020 08:07:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf43.google.com (mail-qv1-xf43.google.com
 [IPv6:2607:f8b0:4864:20::f43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21ADB6EC49
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Oct 2020 08:07:09 +0000 (UTC)
Received: by mail-qv1-xf43.google.com with SMTP id bl9so4371620qvb.10
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Oct 2020 01:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=anDE3OzBfi9c3DjEH727rzqrAKHguaHrZb4aycnyOMQ=;
 b=m9JlPjReV33QF/YTMIBE6RSGQpYNVw/FkT8KoGq9/TqOW9mQDGlp7g1QptpJ3IBNSO
 4TXJc/PaxGfWGOyJlEwodoX4mNEBrz4MDHmqi2A86W52k6003Zo6463fMagAeoAb8Vw6
 N9Y8MUFEUhH0kgDJwaMrLiWUcDPPlhcqqRcpU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=anDE3OzBfi9c3DjEH727rzqrAKHguaHrZb4aycnyOMQ=;
 b=hZWT6FUG7FMB6Gbk85Tvq0/2wDpy8QoAmubHZ4RQbkz9hAqp2w8bJ+M3CeFHA0zEbm
 utUgqeA6Q0Z2Bsv5MX1c9SKVp39jtLAHjHGL9bcdywCSo4Hq+OdHKWjn0BEbIV/dTZeC
 LweA8SUtFkZz1OzvPNHVk7zvuTYMRL7wIxoFEcZ8OyOII60vEbDl7qWqXu+/JIqgbn5w
 HiUPatuyPYTN6nS9OO9aYJ2F7V3qac5OvZyXUlnEs4uK9ImQmlwgk/2Ycb3B+vArNjNq
 pvqxm2PusNofFNq5vbKvZwAVRUNS1UsPo4NDUTebp41LSupwyrfxlZCop2Kg37G1H5Ox
 swjg==
X-Gm-Message-State: AOAM532BqpfksDrnZcRU4slDd4VmpT3+oF7WYwDgwUBMfo6BFz7ZTsf6
 8+ppw9EjhqtibzkdN3G8FunLtxzOAvCwP96X++w=
X-Google-Smtp-Source: ABdhPJyPZSbhAWqc05LdGImBf/wI8me5jGWT76bTq5thTtMDg1/ai9eCSeYFMMmjPR52Zu8dJ1L68BtJOtx9O83ZURY=
X-Received: by 2002:ad4:5387:: with SMTP id i7mr11623850qvv.43.1602230828216; 
 Fri, 09 Oct 2020 01:07:08 -0700 (PDT)
MIME-Version: 1.0
References: <20200522135246.10134-1-tzimmermann@suse.de>
 <20200522135246.10134-5-tzimmermann@suse.de>
 <CACPK8XcGOAjocCMp9ubgQpfiBaqSj61i_frSU7ZdiKO_uSt-hQ@mail.gmail.com>
 <3df12a74-d8f3-d607-78ff-5a0f21e86cb9@suse.de>
In-Reply-To: <3df12a74-d8f3-d607-78ff-5a0f21e86cb9@suse.de>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 9 Oct 2020 08:06:55 +0000
Message-ID: <CACPK8XcAXrf6ySuWo4izjD4EU6tMSULs0tP4cy-+TA35PSOUgw@mail.gmail.com>
Subject: Re: [PATCH 04/21] drm/aspeed: Set driver CMA functions with
 DRM_GEM_CMA_DRIVER_OPS
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, narmstrong@baylibre.com,
 David Airlie <airlied@linux.ie>, liviu.dudau@arm.com, philippe.cornu@st.com,
 paul@crapouillou.net, Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 mihail.atanassov@arm.com, Sam Ravnborg <sam@ravnborg.org>,
 alexandre.torgue@st.com, Marek Vasut <marex@denx.de>, abrodkin@synopsys.com,
 Ludovic Desroches <ludovic.desroches@microchip.com>, xinliang.liu@linaro.org,
 kong.kongxinwei@hisilicon.com, tomi.valkeinen@ti.com, james.qian.wang@arm.com,
 NXP Linux Team <linux-imx@nxp.com>, puck.chen@hisilicon.com,
 Sascha Hauer <s.hauer@pengutronix.de>, alison.wang@nxp.com, jsarha@ti.com,
 Chen-Yu Tsai <wens@csie.org>, vincent.abriou@st.com,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Boris Brezillon <bbrezillon@kernel.org>, Andrew Jeffery <andrew@aj.id.au>,
 dri-devel@lists.freedesktop.org, Nicolas Ferre <nicolas.ferre@microchip.com>,
 yannick.fertre@st.com, kieran.bingham+renesas@ideasonboard.com,
 Kevin Hilman <khilman@baylibre.com>, zourongrong@gmail.com,
 Shawn Guo <shawnguo@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCA5IE9jdCAyMDIwIGF0IDA4OjAxLCBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1h
bm5Ac3VzZS5kZT4gd3JvdGU6Cj4KPiBIaQo+Cj4gQW0gMDkuMTAuMjAgdW0gMDk6NTQgc2Nocmll
YiBKb2VsIFN0YW5sZXk6Cj4gPiBPbiBGcmksIDIyIE1heSAyMDIwIGF0IDEzOjUyLCBUaG9tYXMg
WmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4gd3JvdGU6Cj4gPj4KPiA+PiBEUk1fR0VN
X0NNQV9EUklWRVJfT1BTIHNldHMgdGhlIGZ1bmN0aW9ucyBpbiBzdHJ1Y3QgZHJtX2RyaXZlcgo+
ID4+IHRvIHRoZWlyIGRlZmF1bHRzLiBObyBmdW5jdGlvbmFsIGNoYW5nZXMgYXJlIG1hZGUuCj4g
Pj4KPiA+PiBTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3Vz
ZS5kZT4KPiA+Cj4gPiBJIGp1c3QgZm91bmQgdGhpcyBpbiBteSBpbmJveC4gSSBhc3N1bWUgaXQg
aGFzIG5vdCBiZWVuIGFwcGxpZWQgYXMgeW91Cj4gPiB3ZXJlIGFmdGVyIGEgcmV2aWV3Lgo+Cj4g
VGhlIHBhdGNoc2V0IGFzIGEgd2hvbGUgZ290IGFuIEEtYiBhbmQgd2FzIG1lcmdlZCBhIHdoaWxl
IGFnby4KCkknbSBhIGJpdCBjb25mdXNlZCwgSSBjb3VsZG4ndCBzZWUgaXQgaW4gYW55IHRyZWUu
IFRoZSBhc3BlZWQgb25lCnNlZW1lZCB0byBoYXZlIGJlZW4gc2tpcHBlZCB3aGVuIGFwcGx5aW5n
IHRoZSBzZXJpZXMuCgpJIGxvb2tlZCBhdCB0b2RheSdzIGxpbnV4LW5leHQgYW5kIGRybS1taXNj
LW5leHQuCgo+ID4KPiA+IFJldmlld2VkLWJ5OiBKb2VsIFN0YW5sZXkgPGpvZWxAam1zLmlkLmF1
Pgo+Cj4gTmV2ZXJ0aGVsZXNzIHRoYW5rcyBmb3IgdGFraW5nIGEgbG9vayBhdCB0aGUgcGF0Y2gu
Cj4KPiBCZXN0IHJlZ2FyZHMKPiBUaG9tYXMKPgo+ID4KPiA+IEkgd2lsbCBhcHBseSBpdCB0byBk
cm0tbWlzYy1uZXh0Lgo+ID4KPiA+IENoZWVycywKPiA+Cj4gPiBKb2VsCj4gPgo+ID4+IC0tLQo+
ID4+ICBkcml2ZXJzL2dwdS9kcm0vYXNwZWVkL2FzcGVlZF9nZnhfZHJ2LmMgfCA3ICstLS0tLS0K
PiA+PiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCA2IGRlbGV0aW9ucygtKQo+ID4+
Cj4gPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hc3BlZWQvYXNwZWVkX2dmeF9kcnYu
YyBiL2RyaXZlcnMvZ3B1L2RybS9hc3BlZWQvYXNwZWVkX2dmeF9kcnYuYwo+ID4+IGluZGV4IDZi
MjcyNDJiOWVlM2MuLjExNjdmZjc4ZTI0YTMgMTAwNjQ0Cj4gPj4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2FzcGVlZC9hc3BlZWRfZ2Z4X2Rydi5jCj4gPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2Fz
cGVlZC9hc3BlZWRfZ2Z4X2Rydi5jCj4gPj4gQEAgLTE4OCwxMiArMTg4LDcgQEAgREVGSU5FX0RS
TV9HRU1fQ01BX0ZPUFMoZm9wcyk7Cj4gPj4KPiA+PiAgc3RhdGljIHN0cnVjdCBkcm1fZHJpdmVy
IGFzcGVlZF9nZnhfZHJpdmVyID0gewo+ID4+ICAgICAgICAgLmRyaXZlcl9mZWF0dXJlcyAgICAg
ICAgPSBEUklWRVJfR0VNIHwgRFJJVkVSX01PREVTRVQgfCBEUklWRVJfQVRPTUlDLAo+ID4+IC0g
ICAgICAgLmdlbV9jcmVhdGVfb2JqZWN0ICAgICAgPSBkcm1fY21hX2dlbV9jcmVhdGVfb2JqZWN0
X2RlZmF1bHRfZnVuY3MsCj4gPj4gLSAgICAgICAuZHVtYl9jcmVhdGUgICAgICAgICAgICA9IGRy
bV9nZW1fY21hX2R1bWJfY3JlYXRlLAo+ID4+IC0gICAgICAgLnByaW1lX2hhbmRsZV90b19mZCAg
ICAgPSBkcm1fZ2VtX3ByaW1lX2hhbmRsZV90b19mZCwKPiA+PiAtICAgICAgIC5wcmltZV9mZF90
b19oYW5kbGUgICAgID0gZHJtX2dlbV9wcmltZV9mZF90b19oYW5kbGUsCj4gPj4gLSAgICAgICAu
Z2VtX3ByaW1lX2ltcG9ydF9zZ190YWJsZSA9IGRybV9nZW1fY21hX3ByaW1lX2ltcG9ydF9zZ190
YWJsZSwKPiA+PiAtICAgICAgIC5nZW1fcHJpbWVfbW1hcCAgICAgICAgID0gZHJtX2dlbV9wcmlt
ZV9tbWFwLAo+ID4+ICsgICAgICAgRFJNX0dFTV9DTUFfRFJJVkVSX09QUywKPiA+PiAgICAgICAg
IC5mb3BzID0gJmZvcHMsCj4gPj4gICAgICAgICAubmFtZSA9ICJhc3BlZWQtZ2Z4LWRybSIsCj4g
Pj4gICAgICAgICAuZGVzYyA9ICJBU1BFRUQgR0ZYIERSTSIsCj4gPj4gLS0KPiA+PiAyLjI2LjIK
PiA+Pgo+Cj4gLS0KPiBUaG9tYXMgWmltbWVybWFubgo+IEdyYXBoaWNzIERyaXZlciBEZXZlbG9w
ZXIKPiBTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgKPiBNYXhmZWxkc3RyLiA1
LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkKPiAoSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpCj4g
R2VzY2jDpGZ0c2bDvGhyZXI6IEZlbGl4IEltZW5kw7ZyZmZlcgo+Cl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
