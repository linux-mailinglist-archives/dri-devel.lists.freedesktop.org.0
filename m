Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 753C1BBA8D
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2019 19:31:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A444D6E97C;
	Mon, 23 Sep 2019 17:31:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 850BF6E97C
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2019 17:31:13 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 3E7FF20042;
 Mon, 23 Sep 2019 19:31:08 +0200 (CEST)
Date: Mon, 23 Sep 2019 19:31:06 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Sandy Huang <hjc@rock-chips.com>
Subject: Re: [PATCH 22/36] drm/atmel-hlcdc: use bpp instead of cpp for
 drm_format_info
Message-ID: <20190923173106.GA13649@ravnborg.org>
References: <1569243119-183293-1-git-send-email-hjc@rock-chips.com>
 <1569243119-183293-2-git-send-email-hjc@rock-chips.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1569243119-183293-2-git-send-email-hjc@rock-chips.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=dqr19Wo4 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=s8YR1HE3AAAA:8
 a=GZYic5qFh62CaahH_tAA:9 a=CjuIK1q_8ugA:10 a=jGH_LyMDp9YhSvY-UuyI:22
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Boris Brezillon <bbrezillon@kernel.org>, David Airlie <airlied@linux.ie>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgU2FuZHkuCgpUaGFua3MgZm9yIHRha2luZyBjYXJlIG9mIHRoaXMsIGJ1dC4uLgoKT24gTW9u
LCBTZXAgMjMsIDIwMTkgYXQgMDg6NTE6NDVQTSArMDgwMCwgU2FuZHkgSHVhbmcgd3JvdGU6Cj4g
Y3BwW0J5dGVQZXJQbGFuZV0gY2FuJ3QgZGVzY3JpYmUgdGhlIDEwYml0IGRhdGEgZm9ybWF0IGNv
cnJlY3RseSwKPiBTbyB3ZSB1c2UgYnBwW0JpdFBlclBsYW5lXSB0byBpbnN0ZWFkIGNwcC4KPiAK
PiBTaWduZWQtb2ZmLWJ5OiBTYW5keSBIdWFuZyA8aGpjQHJvY2stY2hpcHMuY29tPgo+IC0tLQo+
ICBkcml2ZXJzL2dwdS9kcm0vYXRtZWwtaGxjZGMvYXRtZWxfaGxjZGNfcGxhbmUuYyB8IDIgKy0K
PiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hdG1lbC1obGNkYy9hdG1lbF9obGNkY19wbGFuZS5j
IGIvZHJpdmVycy9ncHUvZHJtL2F0bWVsLWhsY2RjL2F0bWVsX2hsY2RjX3BsYW5lLmMKPiBpbmRl
eCA4OWY1YTc1Li5hYjdkNDIzIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hdG1lbC1o
bGNkYy9hdG1lbF9obGNkY19wbGFuZS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2F0bWVsLWhs
Y2RjL2F0bWVsX2hsY2RjX3BsYW5lLmMKPiBAQCAtNjQ0LDcgKzY0NCw3IEBAIHN0YXRpYyBpbnQg
YXRtZWxfaGxjZGNfcGxhbmVfYXRvbWljX2NoZWNrKHN0cnVjdCBkcm1fcGxhbmUgKnAsCj4gIAkJ
aW50IHhkaXYgPSBpID8gZmItPmZvcm1hdC0+aHN1YiA6IDE7Cj4gIAkJaW50IHlkaXYgPSBpID8g
ZmItPmZvcm1hdC0+dnN1YiA6IDE7Cj4gIAo+IC0JCXN0YXRlLT5icHBbaV0gPSBmYi0+Zm9ybWF0
LT5jcHBbaV07Cj4gKwkJc3RhdGUtPmJwcFtpXSA9IGZiLT5mb3JtYXQtPmJwcFtpXSAvIDg7Cj4g
IAkJaWYgKCFzdGF0ZS0+YnBwW2ldKQo+ICAJCQlyZXR1cm4gLUVJTlZBTDsKCkF3YWl0aW5nIGNv
bmNsdXNpb24gb24gRGFuaWVscyBjb21tZW50IG9uIFBBVENIIDEgYW5kIGhhcyBkcm9wcGVkIHRo
aXMKcGF0Y2ggZm9yIG5vdy4KQW5kIHBsZWFzZSBhZGRyZXNzIHRoZSBjb25jZXJucyBSb2IgaGFz
IGFib3V0IGJpc2VjdGFiaWxpdHkgaW4geW91cgpjb3ZlciBsZXR0ZXIgZm9yIHYyLgoKCVNhbQpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
