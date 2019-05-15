Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8792C1FB58
	for <lists+dri-devel@lfdr.de>; Wed, 15 May 2019 22:04:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A98F89261;
	Wed, 15 May 2019 20:04:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E711789261
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2019 20:04:39 +0000 (UTC)
Received: from ip5f5a6320.dynamic.kabel-deutschland.de ([95.90.99.32]
 helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.89) (envelope-from <heiko@sntech.de>)
 id 1hR08h-0000bv-3f; Wed, 15 May 2019 22:04:35 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH 2/2] drm/rockchip: dw_hdmi: Handle suspend/resume
Date: Wed, 15 May 2019 22:04:34 +0200
Message-ID: <16767939.RRcxLiLXmc@diego>
In-Reply-To: <20190502223808.185180-2-dianders@chromium.org>
References: <20190502223808.185180-1-dianders@chromium.org>
 <20190502223808.185180-2-dianders@chromium.org>
MIME-Version: 1.0
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
Cc: linux-rockchip@lists.infradead.org, David Airlie <airlied@linux.ie>,
 Neil Armstrong <narmstrong@baylibre.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, mka@chromium.org,
 Sean Paul <seanpaul@chromium.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gRnJlaXRhZywgMy4gTWFpIDIwMTksIDAwOjM4OjA4IENFU1Qgc2NocmllYiBEb3VnbGFzIEFu
ZGVyc29uOgo+IE9uIFJvY2tjaGlwIHJrMzI4OC1iYXNlZCBDaHJvbWVib29rcyB3aGVuIHlvdSBk
byBhIHN1c3BlbmQvcmVzdW1lCj4gY3ljbGU6Cj4gCj4gMS4gWW91IGxvc2UgdGhlIGFiaWxpdHkg
dG8gZGV0ZWN0IGFuIEhETUkgZGV2aWNlIGJlaW5nIHBsdWdnZWQgaW4uCj4gCj4gMi4gSWYgeW91
J3JlIHVzaW5nIHRoZSBpMmMgYnVzIGJ1aWx0IGluIHRvIGR3X2hkbWkgdGhlbiBpdCBzdG9wcwo+
IHdvcmtpbmcuCj4gCj4gTGV0J3MgY2FsbCB0aGUgY29yZSBkdy1oZG1pJ3Mgc3VzcGVuZC9yZXN1
bWUgZnVuY3Rpb25zIHRvIHJlc3RvcmUKPiB0aGluZ3MuCj4gCj4gTk9URTogaW4gZG93bnN0cmVh
bSBDaHJvbWUgT1MgKGJhc2VkIG9uIGtlcm5lbCAzLjE0KSB3ZSB1c2VkIHRoZQo+ICJsYXRlL2Vh
cmx5IiB2ZXJzaW9ucyBvZiBzdXNwZW5kL3Jlc3VtZSBiZWNhdXNlIHdlIGZvdW5kIHRoYXQgdGhl
IFZPUAo+IHdhcyBzb21ldGltZXMgcmVzdW1pbmcgYmVmb3JlIGR3X2hkbWkgYW5kIHRoZW4gY2Fs
bGluZyBpbnRvIHVzIGJlZm9yZQo+IHdlIHdlcmUgZnVsbHkgcmVzdW1lZC4gIEZvciBub3cgSSBo
YXZlIGdvbmUgYmFjayB0byB0aGUgbm9ybWFsCj4gc3VzcGVuZC9yZXN1bWUgYmVjYXVzZSBJIGNh
bid0IHJlcHJvZHVjZSB0aGUgcHJvYmxlbXMuCj4gCj4gU2lnbmVkLW9mZi1ieTogRG91Z2xhcyBB
bmRlcnNvbiA8ZGlhbmRlcnNAY2hyb21pdW0ub3JnPgoKUmV2aWV3ZWQtYnk6IEhlaWtvIFN0dWVi
bmVyIDxoZWlrb0BzbnRlY2guZGU+CgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
