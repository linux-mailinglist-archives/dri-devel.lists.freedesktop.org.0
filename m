Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EC2CF41BF
	for <lists+dri-devel@lfdr.de>; Fri,  8 Nov 2019 09:13:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE3CC6F869;
	Fri,  8 Nov 2019 08:12:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CB516F815
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Nov 2019 00:03:09 +0000 (UTC)
Received: from ip5f5a6266.dynamic.kabel-deutschland.de ([95.90.98.102]
 helo=phil.fritz.box)
 by gloria.sntech.de with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <heiko.stuebner@theobroma-systems.com>)
 id 1iSrjz-00065H-Jt; Fri, 08 Nov 2019 01:03:03 +0100
From: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
To: dri-devel@lists.freedesktop.org,
	a.hajda@samsung.com
Subject: [PATCH v2 0/5] dw-mipi-dsi support for Rockchip px30
Date: Fri,  8 Nov 2019 01:02:48 +0100
Message-Id: <20191108000253.8560-1-heiko.stuebner@theobroma-systems.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 08 Nov 2019 08:12:31 +0000
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, jernej.skrabec@siol.net,
 jonas@kwiboo.se, linux-kernel@vger.kernel.org, narmstrong@baylibre.com,
 philippe.cornu@st.com, yannick.fertre@st.com,
 linux-rockchip@lists.infradead.org, robh+dt@kernel.org,
 Laurent.pinchart@ideasonboard.com,
 Heiko Stuebner <heiko.stuebner@theobroma-systems.com>,
 linux-arm-kernel@lists.infradead.org, christoph.muellner@theobroma-systems.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBzZXJpZXMgYWRkcyBzdXBwb3J0IGZvciB0aGUgZHNpIGNvbnRyb2xsZXIgb24gdGhlIHB4
MzAuClRoZSBtYWluIGRpZmZlcmVuY2UgdG8gcHJldmlvdXMgaW5jYXJuYXRpb25zIGlzIHRoZSB1
c2Ugb2YgYW4KZXh0ZXJuYWwgZHBoeSBmb3IgdGhlIG91dHB1dC4KCmNoYW5nZXMgaW4gdjI6Ci0g
ZHJvcCBoYW5kbGluZyB0aGUgZHBoeS1wbGwgbWFudWFsbHksIGluc3RlYWQgdXNlIHRoZSByZWd1
bGFyCiAgcGh5IGNvbmZpZ3VyYXRpb24gb3BlcmF0aW9ucywgdGhhbmtzIExhdXJlbnQgZm9yIHRo
ZSBzdWdnZXN0aW9uCi0gYWRkIG1pc3NpbmcgcHgzMCBjb21wYXRpYmxlIHRvIHRoZSBiaW5kaW5n
IGFuZCBtYWtlCiAgYmluZGluZyBjaGFuZ2VzIHNlcGFyYXRlIHBhdGNoZXMKCgpIZWlrbyBTdHVl
Ym5lciAoNSk6CiAgZHJtL2JyaWRnZS9zeW5vcHN5czogZHNpOiBtb3ZlIHBoeV9vcHMgY2FsbGJh
Y2tzIGFyb3VuZCBwYW5lbAogICAgZW5hYmxlbWVudAogIGR0LWJpbmRpbmdzOiBkaXNwbGF5OiBy
b2NrY2hpcC1kc2k6IGRvY3VtZW50IGV4dGVybmFsIHBoeXMKICBkcm0vcm9ja2NoaXA6IGFkZCBh
YmlsaXR5IHRvIGhhbmRsZSBleHRlcm5hbCBkcGh5cyBpbiBtaXBpLWRzaQogIGR0LWJpbmRpbmdz
OiBkaXNwbGF5OiByb2NrY2hpcC1kc2k6IGFkZCBweDMwIGNvbXBhdGlibGUKICBkcm0vcm9ja2No
aXA6IGRzaTogYWRkIHB4MzAgc3VwcG9ydAoKIC4uLi9kaXNwbGF5L3JvY2tjaGlwL2R3X21pcGlf
ZHNpX3JvY2tjaGlwLnR4dCB8IDEzICsrLQogZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5
cy9kdy1taXBpLWRzaS5jIHwgMTMgKystCiAuLi4vZ3B1L2RybS9yb2NrY2hpcC9kdy1taXBpLWRz
aS1yb2NrY2hpcC5jICAgfCA5NSArKysrKysrKysrKysrKysrKystCiAzIGZpbGVzIGNoYW5nZWQs
IDEwNiBpbnNlcnRpb25zKCspLCAxNSBkZWxldGlvbnMoLSkKCi0tIAoyLjIzLjAKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
