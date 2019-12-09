Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C690116EFE
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2019 15:32:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ECE16E46C;
	Mon,  9 Dec 2019 14:32:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 868326E463
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Dec 2019 14:32:30 +0000 (UTC)
Received: from ip5f5a6266.dynamic.kabel-deutschland.de ([95.90.98.102]
 helo=phil.lan)
 by gloria.sntech.de with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <heiko@sntech.de>)
 id 1ieK57-0000zC-Dz; Mon, 09 Dec 2019 15:32:13 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: a.hajda@samsung.com
Subject: [PATCH v5 0/6] drm/rockchip: px30 dsi support
Date: Mon,  9 Dec 2019 15:31:24 +0100
Message-Id: <20191209143130.4553-1-heiko@sntech.de>
X-Mailer: git-send-email 2.24.0
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
Cc: bivvy.bi@rock-chips.com, jernej.skrabec@siol.net, xzy.xu@rock-chips.com,
 kuninori.morimoto.gx@renesas.com, jonas@kwiboo.se, sean@poorly.run,
 narmstrong@baylibre.com, philippe.cornu@st.com,
 dri-devel@lists.freedesktop.org, hjc@rock-chips.com, yannick.fertre@st.com,
 linux-rockchip@lists.infradead.org, nickey.yang@rock-chips.com,
 eddie.cai@rock-chips.com, Laurent.pinchart@ideasonboard.com,
 Heiko Stuebner <heiko.stuebner@theobroma-systems.com>, sam@ravnborg.org,
 christoph.muellner@theobroma-systems.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogSGVpa28gU3R1ZWJuZXIgPGhlaWtvLnN0dWVibmVyQHRoZW9icm9tYS1zeXN0ZW1zLmNv
bT4KClRoaXMgc2VyaWVzIGFkZGVzIHN1cHBvcnQgZm9yIHRoZSBweDMwIFJvY2tjaGlwIHNvYyB0
byB0aGUgZHNpIGRyaXZlci4KVGhpcyBpbmNsdWRlcyBzdXBwb3J0IGZvciBleHRlcm5hbCBkc2kt
cGh5cyBsaWtlIHVzZWQgb24gdGhlIHB4MzAuCgpXaGF0IGhhcHBlbmVkIGJldHdlZW4gdjEgYW5k
IHY1PyBUaGUgdGhlbiBzZXBhcmF0ZSBkc2kgaHMybHAgdGltaW5nCnBhdGNoIGhhcHBlbmVkIDst
KSAuIEFzIGJvdGggaXQgYW5kIHRoaXMgc2VyaWVzIHRvdWNoIHNpbWlsYXIgYXJlYXMKaW4gdGhl
IGRzaSBkcml2ZXIgb3JkZXJpbmcgYmVjb21lcyBhbiBpc3N1ZSBhbmQgc28gY29tYmluaW5nIHRo
ZW0gdG8KbWFrZSBvcmRlcmluZyBleHBsaWNpdCBpcyBoZWxwZnVsLiB2Mi12NCB3aGVyZSB0aGVu
IGl0ZXJhdGlvbnMgb2YgdGhlCnRpbWluZyBwYXRjaC4KClNvIHRoaXMgdjUgaXMgbWFpbmx5IHJl
YmFzZWQgb24gNS41LXJjMSBhbmQgcmVjaGVja2VkIGFnYWluc3QgZHJtLW1pc2MuCgpIZWlrbyBT
dHVlYm5lciAoNik6CiAgZHJtL2JyaWRnZS9zeW5vcHN5czogZHNpOiBkcml2ZXItc3BlY2lmaWMg
Y29uZmlndXJhdGlvbiBvZiBwaHkgdGltaW5ncwogIGRybS9icmlkZ2Uvc3lub3BzeXM6IGRzaTog
bW92ZSBwaHlfb3BzIGNhbGxiYWNrcyBhcm91bmQgcGFuZWwKICAgIGVuYWJsZW1lbnQKICBkdC1i
aW5kaW5nczogZGlzcGxheTogcm9ja2NoaXAtZHNpOiBkb2N1bWVudCBleHRlcm5hbCBwaHlzCiAg
ZHJtL3JvY2tjaGlwOiBhZGQgYWJpbGl0eSB0byBoYW5kbGUgZXh0ZXJuYWwgZHBoeXMgaW4gbWlw
aS1kc2kKICBkdC1iaW5kaW5nczogZGlzcGxheTogcm9ja2NoaXAtZHNpOiBhZGQgcHgzMCBjb21w
YXRpYmxlCiAgZHJtL3JvY2tjaGlwOiBkc2k6IGFkZCBweDMwIHN1cHBvcnQKCiAuLi4vZGlzcGxh
eS9yb2NrY2hpcC9kd19taXBpX2RzaV9yb2NrY2hpcC50eHQgfCAgMTMgKy0KIGRyaXZlcnMvZ3B1
L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctbWlwaS1kc2kuYyB8ICA0MCArKy0tCiBkcml2ZXJzL2dw
dS9kcm0vcm9ja2NoaXAvS2NvbmZpZyAgICAgICAgICAgICAgfCAgIDEgKwogLi4uL2dwdS9kcm0v
cm9ja2NoaXAvZHctbWlwaS1kc2ktcm9ja2NoaXAuYyAgIHwgMTczICsrKysrKysrKysrKysrKysr
LQogZHJpdmVycy9ncHUvZHJtL3N0bS9kd19taXBpX2RzaS1zdG0uYyAgICAgICAgIHwgIDEzICsr
CiBpbmNsdWRlL2RybS9icmlkZ2UvZHdfbWlwaV9kc2kuaCAgICAgICAgICAgICAgfCAgIDkgKwog
NiBmaWxlcyBjaGFuZ2VkLCAyMjcgaW5zZXJ0aW9ucygrKSwgMjIgZGVsZXRpb25zKC0pCgotLSAK
Mi4yNC4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
