Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 79E1861AF8
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2019 09:12:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 514F2899FF;
	Mon,  8 Jul 2019 07:11:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE1206E56E
 for <dri-devel@lists.freedesktop.org>; Sat,  6 Jul 2019 14:06:53 +0000 (UTC)
X-Originating-IP: 2.224.242.101
Received: from uno.localdomain (2-224-242-101.ip172.fastwebnet.it
 [2.224.242.101]) (Authenticated sender: jacopo@jmondi.org)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id F3A59C0005;
 Sat,  6 Jul 2019 14:06:49 +0000 (UTC)
From: Jacopo Mondi <jacopo+renesas@jmondi.org>
To: laurent.pinchart@ideasonboard.com, kieran.bingham+renesas@ideasonboard.com,
 airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH v2 04/19] clk: renesas: r8a7796: Add CMM clocks
Date: Sat,  6 Jul 2019 16:07:31 +0200
Message-Id: <20190706140746.29132-5-jacopo+renesas@jmondi.org>
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
IE0zLVcuCgpSZXZpZXdlZC1ieTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydCtyZW5lc2FzQGds
aWRlci5iZT4KUmV2aWV3ZWQtYnk6IExhdXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnRA
aWRlYXNvbmJvYXJkLmNvbT4KU2lnbmVkLW9mZi1ieTogSmFjb3BvIE1vbmRpIDxqYWNvcG8rcmVu
ZXNhc0BqbW9uZGkub3JnPgotLS0KIGRyaXZlcnMvY2xrL3JlbmVzYXMvcjhhNzc5Ni1jcGctbXNz
ci5jIHwgMyArKysKIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL2Nsay9yZW5lc2FzL3I4YTc3OTYtY3BnLW1zc3IuYyBiL2RyaXZlcnMvY2xrL3Jl
bmVzYXMvcjhhNzc5Ni1jcGctbXNzci5jCmluZGV4IGQ4ZTlhZjVkOWFlOS4uMzllZmMyNTQ1NTVi
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2Nsay9yZW5lc2FzL3I4YTc3OTYtY3BnLW1zc3IuYworKysg
Yi9kcml2ZXJzL2Nsay9yZW5lc2FzL3I4YTc3OTYtY3BnLW1zc3IuYwpAQCAtMTgwLDYgKzE4MCw5
IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgbXNzcl9tb2RfY2xrIHI4YTc3OTZfbW9kX2Nsa3NbXSBf
X2luaXRjb25zdCA9IHsKIAlERUZfTU9EKCJlaGNpMSIsCQkgNzAyLAlSOEE3Nzk2X0NMS19TM0Qy
KSwKIAlERUZfTU9EKCJlaGNpMCIsCQkgNzAzLAlSOEE3Nzk2X0NMS19TM0QyKSwKIAlERUZfTU9E
KCJoc3VzYiIsCQkgNzA0LAlSOEE3Nzk2X0NMS19TM0QyKSwKKwlERUZfTU9EKCJjbW0yIiwJCQkg
NzA5LAlSOEE3Nzk2X0NMS19TMkQxKSwKKwlERUZfTU9EKCJjbW0xIiwJCQkgNzEwLAlSOEE3Nzk2
X0NMS19TMkQxKSwKKwlERUZfTU9EKCJjbW0wIiwJCQkgNzExLAlSOEE3Nzk2X0NMS19TMkQxKSwK
IAlERUZfTU9EKCJjc2kyMCIsCQkgNzE0LAlSOEE3Nzk2X0NMS19DU0kwKSwKIAlERUZfTU9EKCJj
c2k0MCIsCQkgNzE2LAlSOEE3Nzk2X0NMS19DU0kwKSwKIAlERUZfTU9EKCJkdTIiLAkJCSA3MjIs
CVI4QTc3OTZfQ0xLX1MyRDEpLAotLSAKMi4yMS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
