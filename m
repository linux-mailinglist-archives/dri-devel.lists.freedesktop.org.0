Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E3413AF1C
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jun 2019 08:45:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A83E890BE;
	Mon, 10 Jun 2019 06:44:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3283F890BE
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2019 06:44:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: tomeu) with ESMTPSA id 1E4F72791D8
Subject: Re: [PATCH] drm/panfrost: Require the simple_ondemand governor
To: Ezequiel Garcia <ezequiel@collabora.com>, Rob Herring <robh@kernel.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
References: <20190605184859.9432-1-ezequiel@collabora.com>
From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Message-ID: <7c6cb6c0-2eec-517b-683c-951187f6fcfe@collabora.com>
Date: Mon, 10 Jun 2019 08:44:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190605184859.9432-1-ezequiel@collabora.com>
Content-Language: en-US
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
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gNi81LzE5IDg6NDggUE0sIEV6ZXF1aWVsIEdhcmNpYSB3cm90ZToKPiBQYW5mcm9zdCBkZXBl
bmRzIG9uIHRoZSBzaW1wbGVfb25kZW1hbmQgZ292ZXJub3IsIGFuZCB0aGVyZWZvcmUKPiBpdCdz
IGEgcmVxdWlyZWQgY29uZmlndXJhdGlvbi4gU2VsZWN0IGl0Lgo+IAo+IEZpeGVzOiBmMzYxN2I0
NDlkICgiZHJtL3BhbmZyb3N0OiBTZWxlY3QgZGV2ZnJlcSIpCj4gU2lnbmVkLW9mZi1ieTogRXpl
cXVpZWwgR2FyY2lhIDxlemVxdWllbEBjb2xsYWJvcmEuY29tPgoKR29vZCBvbmUsIGhhZCB0b3Rh
bGx5IGZvcmdvdHRlbiBhYm91dCBpdC4KClJldmlld2VkLWJ5OiBUb21ldSBWaXpvc28gPHRvbWV1
LnZpem9zb0Bjb2xsYWJvcmEuY29tPgoKVGhhbmtzIQoKVG9tZXUKCj4gLS0tCj4gICBkcml2ZXJz
L2dwdS9kcm0vcGFuZnJvc3QvS2NvbmZpZyB8IDEgKwo+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9LY29u
ZmlnIGIvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L0tjb25maWcKPiBpbmRleCA4MTk2M2U5NjRi
MGYuLjg2Y2RjMGNlNzllNiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3Qv
S2NvbmZpZwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9LY29uZmlnCj4gQEAgLTEw
LDYgKzEwLDcgQEAgY29uZmlnIERSTV9QQU5GUk9TVAo+ICAgCXNlbGVjdCBJT01NVV9JT19QR1RB
QkxFX0xQQUUKPiAgIAlzZWxlY3QgRFJNX0dFTV9TSE1FTV9IRUxQRVIKPiAgIAlzZWxlY3QgUE1f
REVWRlJFUQo+ICsJc2VsZWN0IERFVkZSRVFfR09WX1NJTVBMRV9PTkRFTUFORAo+ICAgCWhlbHAK
PiAgIAkgIERSTSBkcml2ZXIgZm9yIEFSTSBNYWxpIE1pZGdhcmQgKFQ2eHgsIFQ3eHgsIFQ4eHgp
IGFuZAo+ICAgCSAgQmlmcm9zdCAoRzN4LCBHNXgsIEc3eCkgR1BVcy4KPiAKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
