Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 583EB9D664
	for <lists+dri-devel@lfdr.de>; Mon, 26 Aug 2019 21:26:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D6616E2AF;
	Mon, 26 Aug 2019 19:26:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDA916E2A9;
 Mon, 26 Aug 2019 19:26:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: andrzej.p) with ESMTPSA id 7240A283D3B
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH RESEND 00/14] Next round of associating ddc adapters with
 connectors
Date: Mon, 26 Aug 2019 21:25:42 +0200
Message-Id: <cover.1566845537.git.andrzej.p@collabora.com>
X-Mailer: git-send-email 2.17.1
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, kernel@collabora.com,
 Anthony Koo <Anthony.Koo@amd.com>, Emil Velikov <emil.velikov@collabora.com>,
 linux-samsung-soc@vger.kernel.org, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 David Francis <David.Francis@amd.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, linux-rockchip@lists.infradead.org,
 Kukjin Kim <kgene@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-tegra@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>,
 Leo Li <sunpeng.li@amd.com>, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, Mamta Shukla <mamtashukla555@gmail.com>,
 linux-mediatek@lists.infradead.org, Jyri Sarha <jsarha@ti.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Sean Paul <sean@poorly.run>,
 linux-arm-kernel@lists.infradead.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 amd-gfx@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Todor Tomov <todor.tomov@linaro.org>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Alex Deucher <alexander.deucher@amd.com>, Shawn Guo <shawnguo@kernel.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SSdtIHJlc2VuZGluZyB0aGUgcGF0Y2hlcyB3aGljaCBoYXZlIHNvbWVob3cgZ290IGxvc3Q6IG9u
ZSBwYXRjaApmcm9tIEdlZXJ0IGFuZCAxMyBwYXRjaGVzIGZyb20gbWUuCgpHZWVydCdzIHBhdGNo
IHVwZGF0ZXMgdGhlIGVycm9yIG1lc3NhZ2UgdG8gcmVmbGVjdCB0aGUgYWN0dWFsbHkKY2FsbGVk
IGZ1bmN0aW9uJ3MgbmFtZS4KCk1vc3Qgb2YgcGF0Y2hlcyBmcm9tIG1lIGhhdmUgdGhlaXIgQWNr
ZWQtYnkgYW5kIFJldmlld2VkLWJ5IHRhZ3MKYW5kIGRlYWwgd2l0aCBwcm92aWRpbmcgYSBkZGMg
c3ltbGluayBpbiBjb25uZWN0b3IncyBzeXNmcyBkaXJlY3RvcnkuCgpSZWJhc2VkIG9udG8gZHJt
LW1pc2MtbmV4dCBhcyBvZiAyNnRoIEF1Z3VzdC4KCkFuZHJ6ZWogUGlldHJhc2lld2ljeiAoMTMp
OgogIGRybS9yYWRlb246IFByb3ZpZGUgZGRjIHN5bWxpbmsgaW4gY29ubmVjdG9yIHN5c2ZzIGRp
cmVjdG9yeQogIGRybS9hbWRncHU6IFByb3ZpZGUgZGRjIHN5bWxpbmsgaW4gZG0gY29ubmVjdG9y
J3Mgc3lzZnMgZGlyZWN0b3J5CiAgZHJtL2V4eW5vczogUHJvdmlkZSBkZGMgc3ltbGluayBpbiBj
b25uZWN0b3IncyBzeXNmcwogIGRybTogcm9ja2NoaXA6IFByb3ZpZGUgZGRjIHN5bWxpbmsgaW4g
cmszMDY2X2hkbWkgc3lzZnMgZGlyZWN0b3J5CiAgZHJtOiByb2NrY2hpcDogUHJvdmlkZSBkZGMg
c3ltbGluayBpbiBpbm5vX2hkbWkgc3lzZnMgZGlyZWN0b3J5CiAgZHJtL21zbS9oZG1pOiBQcm92
aWRlIGRkYyBzeW1saW5rIGluIGhkbWkgY29ubmVjdG9yIHN5c2ZzIGRpcmVjdG9yeQogIGRybS9t
ZWRpYXRlazogUHJvdmlkZSBkZGMgc3ltbGluayBpbiBoZG1pIGNvbm5lY3RvciBzeXNmcyBkaXJl
Y3RvcnkKICBkcm0vdGVncmE6IFByb3ZpZGUgZGRjIHN5bWxpbmsgaW4gb3V0cHV0IGNvbm5lY3Rv
ciBzeXNmcyBkaXJlY3RvcnkKICBkcm0vdmM0OiBQcm92aWRlIGRkYyBzeW1saW5rIGluIGNvbm5l
Y3RvciBzeXNmcyBkaXJlY3RvcnkKICBkcm06IHp0ZTogUHJvdmlkZSBkZGMgc3ltbGluayBpbiBo
ZG1pIGNvbm5lY3RvciBzeXNmcyBkaXJlY3RvcnkKICBkcm06IHp0ZTogUHJvdmlkZSBkZGMgc3lt
bGluayBpbiB2Z2EgY29ubmVjdG9yIHN5c2ZzIGRpcmVjdG9yeQogIGRybS90aWxjZGM6IFByb3Zp
ZGUgZGRjIHN5bWxpbmsgaW4gY29ubmVjdG9yIHN5c2ZzIGRpcmVjdG9yeQogIGRybS9pOTE1OiBQ
cm92aWRlIGRkYyBzeW1saW5rIGluIGhkbWkgY29ubmVjdG9yIHN5c2ZzIGRpcmVjdG9yeQoKR2Vl
cnQgVXl0dGVyaG9ldmVuICgxKToKICBkcm0vYnJpZGdlOiB0aS10ZnA0MTA6IFVwZGF0ZSBkcm1f
Y29ubmVjdG9yX2luaXRfd2l0aF9kZGMoKSBlcnJvcgogICAgbWVzc2FnZQoKIC4uLi9ncHUvZHJt
L2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYyB8ICAgNSArLQogZHJpdmVycy9ncHUv
ZHJtL2JyaWRnZS90aS10ZnA0MTAuYyAgICAgICAgICAgIHwgICAzICstCiBkcml2ZXJzL2dwdS9k
cm0vZXh5bm9zL2V4eW5vc19oZG1pLmMgICAgICAgICAgfCAgIDYgKy0KIGRyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2Rpc3BsYXkvaW50ZWxfaGRtaS5jICAgICB8ICAxMiArLQogZHJpdmVycy9ncHUvZHJt
L21lZGlhdGVrL210a19oZG1pLmMgICAgICAgICAgIHwgICA3ICstCiBkcml2ZXJzL2dwdS9kcm0v
bXNtL2hkbWkvaGRtaV9jb25uZWN0b3IuYyAgICAgfCAgIDYgKy0KIGRyaXZlcnMvZ3B1L2RybS9y
YWRlb24vcmFkZW9uX2Nvbm5lY3RvcnMuYyAgICB8IDE0MyArKysrKysrKysrKysrLS0tLS0KIGRy
aXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9pbm5vX2hkbWkuYyAgICAgICAgICB8ICAgNiArLQogZHJp
dmVycy9ncHUvZHJtL3JvY2tjaGlwL3JrMzA2Nl9oZG1pLmMgICAgICAgIHwgICA3ICstCiBkcml2
ZXJzL2dwdS9kcm0vdGVncmEvaGRtaS5jICAgICAgICAgICAgICAgICAgfCAgIDcgKy0KIGRyaXZl
cnMvZ3B1L2RybS90ZWdyYS9zb3IuYyAgICAgICAgICAgICAgICAgICB8ICAgNyArLQogZHJpdmVy
cy9ncHUvZHJtL3RpbGNkYy90aWxjZGNfdGZwNDEwLmMgICAgICAgIHwgICA2ICstCiBkcml2ZXJz
L2dwdS9kcm0vdmM0L3ZjNF9oZG1pLmMgICAgICAgICAgICAgICAgfCAgMTIgKy0KIGRyaXZlcnMv
Z3B1L2RybS96dGUvenhfaGRtaS5jICAgICAgICAgICAgICAgICB8ICAgNiArLQogZHJpdmVycy9n
cHUvZHJtL3p0ZS96eF92Z2EuYyAgICAgICAgICAgICAgICAgIHwgICA2ICstCiAxNSBmaWxlcyBj
aGFuZ2VkLCAxNjggaW5zZXJ0aW9ucygrKSwgNzEgZGVsZXRpb25zKC0pCgotLSAKMi4xNy4xCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
