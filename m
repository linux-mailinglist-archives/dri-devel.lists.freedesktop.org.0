Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 562EB1BADB5
	for <lists+dri-devel@lfdr.de>; Mon, 27 Apr 2020 21:18:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06BC86E0ED;
	Mon, 27 Apr 2020 19:18:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EDFA6E0ED
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Apr 2020 19:18:48 +0000 (UTC)
Received: from ip5f5aa64a.dynamic.kabel-deutschland.de ([95.90.166.74]
 helo=phil.lan)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1jT9H6-0008PW-LV; Mon, 27 Apr 2020 21:18:40 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: linux-kernel@vger.kernel.org,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>
Subject: Re: [PATCH] drm/rockchip: cdn-dp-core: Make
 cdn_dp_core_suspend/resume static
Date: Mon, 27 Apr 2020 21:18:37 +0200
Message-Id: <158801509401.47920.2598441742545466292.b4-ty@sntech.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200426161653.7710-1-enric.balletbo@collabora.com>
References: <20200426161653.7710-1-enric.balletbo@collabora.com>
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
Cc: David Airlie <airlied@linux.ie>, Sandy Huang <hjc@rock-chips.com>,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 Collabora Kernel ML <kernel@collabora.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU3VuLCAyNiBBcHIgMjAyMCAxODoxNjo1MyArMDIwMCwgRW5yaWMgQmFsbGV0Ym8gaSBTZXJy
YSB3cm90ZToKPiBUaGlzIGZpeGVzIHRoZSBmb2xsb3dpbmcgd2FybmluZyBkZXRlY3RlZCB3aGVu
IHJ1bm5pbmcgbWFrZSB3aXRoIFc9MQo+IAo+ICAgICBkcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAv
L2Nkbi1kcC1jb3JlLmM6MTExMjo1OiB3YXJuaW5nOiBubyBwcmV2aW91cwo+ICAgICBwcm90b3R5
cGUgZm9yIOKAmGNkbl9kcF9zdXNwZW5k4oCZIFstV21pc3NpbmctcHJvdG90eXBlc10KPiAKPiAg
ICAgZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwLy9jZG4tZHAtY29yZS5jOjExMjY6NTogd2Fybmlu
Zzogbm8gcHJldmlvdXMKPiAgICAgcHJvdG90eXBlIGZvciDigJhjZG5fZHBfcmVzdW1l4oCZIFst
V21pc3NpbmctcHJvdG90eXBlc10KPiAKPiBbLi4uXQoKQXBwbGllZCwgdGhhbmtzIQoKWzEvMV0g
ZHJtL3JvY2tjaGlwOiBjZG4tZHAtY29yZTogTWFrZSBjZG5fZHBfY29yZV9zdXNwZW5kL3Jlc3Vt
ZSBzdGF0aWMKICAgICAgY29tbWl0OiA3YzQ5YWJiNGMyZjg4NTM1MjBhYmMwNWI3ZjdlOGI3NTFm
YmIzMDg2CgpCZXN0IHJlZ2FyZHMsCi0tIApIZWlrbyBTdHVlYm5lciA8aGVpa29Ac250ZWNoLmRl
PgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
