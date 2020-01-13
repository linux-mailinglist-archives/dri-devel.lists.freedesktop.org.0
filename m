Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3157A1392EE
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jan 2020 14:59:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F5BF89C98;
	Mon, 13 Jan 2020 13:59:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF53789C98
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2020 13:59:35 +0000 (UTC)
Received: from wf0253.dip.tu-dresden.de ([141.76.180.253] helo=phil.localnet)
 by gloria.sntech.de with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <heiko@sntech.de>)
 id 1ir0Fd-0003DP-Se; Mon, 13 Jan 2020 14:59:29 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH] drm/rockchip: Add missing vmalloc header
Date: Mon, 13 Jan 2020 14:59:29 +0100
Message-ID: <1782062.vAMIso9ooe@phil>
In-Reply-To: <1577779956-7612-1-git-send-email-krzk@kernel.org>
References: <1577779956-7612-1-git-send-email-krzk@kernel.org>
MIME-Version: 1.0
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
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Douglas Anderson <dianders@chromium.org>, Eric Auger <eric.auger@redhat.com>,
 David Airlie <airlied@linux.ie>, Joerg Roedel <joro@8bytes.org>,
 Sandy Huang <hjc@rock-chips.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 iommu@lists.linux-foundation.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gRGllbnN0YWcsIDMxLiBEZXplbWJlciAyMDE5LCAwOToxMjozNiBDRVQgc2NocmllYiBLcnp5
c3p0b2YgS296bG93c2tpOgo+IFRoZSBSb2Nrc2hpcCBEUk0gR0VNIGNvZGUgdXNlcyB2bWFwKCkv
dnVubWFwKCkgc28gdm1hbGxvYyBoZWFkZXIgbXVzdCBiZQo+IGluY2x1ZGVkIHRvIGF2b2lkIHdh
cm5pbmdzIGxpa2UgKG9uIElBNjQsIGNvbXBpbGUgdGVzdGVkKToKPiAKPiAgICAgZHJpdmVycy9n
cHUvZHJtL3JvY2tjaGlwL3JvY2tjaGlwX2RybV9nZW0uYzogSW4gZnVuY3Rpb24g4oCYcm9ja2No
aXBfZ2VtX2FsbG9jX2lvbW114oCZOgo+ICAgICBkcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvcm9j
a2NoaXBfZHJtX2dlbS5jOjEzNDoyMDogZXJyb3I6Cj4gICAgICAgICBpbXBsaWNpdCBkZWNsYXJh
dGlvbiBvZiBmdW5jdGlvbiDigJh2bWFw4oCZIFstV2Vycm9yPWltcGxpY2l0LWZ1bmN0aW9uLWRl
Y2xhcmF0aW9uXQo+IAo+IFJlcG9ydGVkLWJ5OiBrYnVpbGQgdGVzdCByb2JvdCA8bGtwQGludGVs
LmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnprQGtlcm5lbC5v
cmc+CgphcHBsaWVkIHRvIGRybS1taXNjLW5leHQKClRoYW5rcwpIZWlrbwoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
