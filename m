Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9455D61B1F
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2019 09:13:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7056389C17;
	Mon,  8 Jul 2019 07:12:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FAF26E56E
 for <dri-devel@lists.freedesktop.org>; Sat,  6 Jul 2019 14:06:56 +0000 (UTC)
X-Originating-IP: 2.224.242.101
Received: from uno.localdomain (2-224-242-101.ip172.fastwebnet.it
 [2.224.242.101]) (Authenticated sender: jacopo@jmondi.org)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 84F72C0004;
 Sat,  6 Jul 2019 14:06:52 +0000 (UTC)
From: Jacopo Mondi <jacopo+renesas@jmondi.org>
To: laurent.pinchart@ideasonboard.com, kieran.bingham+renesas@ideasonboard.com,
 airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH v2 05/19] clk: renesas: r8a7795: Add CMM clocks
Date: Sat,  6 Jul 2019 16:07:32 +0200
Message-Id: <20190706140746.29132-6-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190706140746.29132-1-jacopo+renesas@jmondi.org>
References: <20190706140746.29132-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 08 Jul 2019 07:11:53 +0000
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
Cc: muroya@ksk.co.jp, Geert Uytterhoeven <geert+renesas@glider.be>,
 koji.matsuoka.xm@renesas.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 VenkataRajesh.Kalakodima@in.bosch.com,
 Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Harsha.ManjulaMallikarjun@in.bosch.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIGNsb2NrIGRlZmluaXRpb25zIGZvciBDTU0gdW5pdHMgb24gUmVuZXNhcyBSLUNhciBHZW4z
IEgzLgoKUmV2aWV3ZWQtYnk6IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnQrcmVuZXNhc0BnbGlk
ZXIuYmU+ClJldmlld2VkLWJ5OiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0QGlk
ZWFzb25ib2FyZC5jb20+ClNpZ25lZC1vZmYtYnk6IEphY29wbyBNb25kaSA8amFjb3BvK3JlbmVz
YXNAam1vbmRpLm9yZz4KLS0tCiBkcml2ZXJzL2Nsay9yZW5lc2FzL3I4YTc3OTUtY3BnLW1zc3Iu
YyB8IDQgKysrKwogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvY2xrL3JlbmVzYXMvcjhhNzc5NS1jcGctbXNzci5jIGIvZHJpdmVycy9jbGsvcmVu
ZXNhcy9yOGE3Nzk1LWNwZy1tc3NyLmMKaW5kZXggOWU5YTZmMmMzMWU4Li5kNTViMWQ5YzhmNzIg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvY2xrL3JlbmVzYXMvcjhhNzc5NS1jcGctbXNzci5jCisrKyBi
L2RyaXZlcnMvY2xrL3JlbmVzYXMvcjhhNzc5NS1jcGctbXNzci5jCkBAIC0yMDEsNiArMjAxLDEw
IEBAIHN0YXRpYyBzdHJ1Y3QgbXNzcl9tb2RfY2xrIHI4YTc3OTVfbW9kX2Nsa3NbXSBfX2luaXRk
YXRhID0gewogCURFRl9NT0QoImVoY2kwIiwJCSA3MDMsCVI4QTc3OTVfQ0xLX1MzRDIpLAogCURF
Rl9NT0QoImhzdXNiIiwJCSA3MDQsCVI4QTc3OTVfQ0xLX1MzRDIpLAogCURFRl9NT0QoImhzdXNi
MyIsCQkgNzA1LAlSOEE3Nzk1X0NMS19TM0QyKSwKKwlERUZfTU9EKCJjbW0zIiwJCQkgNzA4LAlS
OEE3Nzk1X0NMS19TMkQxKSwKKwlERUZfTU9EKCJjbW0yIiwJCQkgNzA5LAlSOEE3Nzk1X0NMS19T
MkQxKSwKKwlERUZfTU9EKCJjbW0xIiwJCQkgNzEwLAlSOEE3Nzk1X0NMS19TMkQxKSwKKwlERUZf
TU9EKCJjbW0wIiwJCQkgNzExLAlSOEE3Nzk1X0NMS19TMkQxKSwKIAlERUZfTU9EKCJjc2kyMSIs
CQkgNzEzLAlSOEE3Nzk1X0NMS19DU0kwKSwgLyogRVMxLnggKi8KIAlERUZfTU9EKCJjc2kyMCIs
CQkgNzE0LAlSOEE3Nzk1X0NMS19DU0kwKSwKIAlERUZfTU9EKCJjc2k0MSIsCQkgNzE1LAlSOEE3
Nzk1X0NMS19DU0kwKSwKLS0gCjIuMjEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
