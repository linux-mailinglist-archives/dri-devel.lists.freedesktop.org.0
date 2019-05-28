Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C6392C87D
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2019 16:13:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B49689FD7;
	Tue, 28 May 2019 14:13:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C01D89F07
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2019 14:13:31 +0000 (UTC)
Received: from pendragon.ideasonboard.com (85-76-65-42-nat.elisa-mobile.fi
 [85.76.65.42])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6414DFA6;
 Tue, 28 May 2019 16:13:29 +0200 (CEST)
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 09/10] [HACK] arm64: dts: renesas: draak: Enable LVDS
 dual-link operation
Date: Tue, 28 May 2019 17:12:33 +0300
Message-Id: <20190528141234.15425-10-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190528141234.15425-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20190528141234.15425-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1559052810;
 bh=73AxSuuvONAgBvXC48e0yFmYlcerM+/RfyV/F3Wific=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=K5fvN0zOmRctTTb2e5eLpfsa8ipkijSUX7qK4Vsy7duy1W4UqSh52xFP/41xgathz
 c/axpcn4juFQcQ35iacooWX24QfmX11ZJ+aJQQTipHtFDVGYkSfCW3CcNd+gEvq506
 K5ZqVurj7Ic5HVl8ucgxcQUdjoUBLWNlRrUvRy+4=
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
Cc: linux-renesas-soc@vger.kernel.org, Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RW5hYmxlIGFuZCBjb25uZWN0IHRoZSBzZWNvbmQgTFZEUyBlbmNvZGVyIHRvIHRoZSBzZWNvbmQg
TFZEUyBpbnB1dCBvZgp0aGUgVEhDNjNMVkQxMDI0IGZvciBkdWFsLWxpbmsgTFZEUyBvcGVyYXRp
b24uIFRoaXMgcmVxdWlyZXMgY2hhbmdpbmcKdGhlIGRlZmF1bHQgc2V0dGluZ3Mgb2YgU1c0NSBh
bmQgU1c0NyB0byBPRkYgYW5kIE9OIHJlc3BlY3RpdmVseS4KClNpZ25lZC1vZmYtYnk6IExhdXJl
bnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnQrcmVuZXNhc0BpZGVhc29uYm9hcmQuY29tPgpU
ZXN0ZWQtYnk6IEphY29wbyBNb25kaSA8amFjb3BvK3JlbmVzYXNAam1vbmRpLm9yZz4KLS0tCiAu
Li4vYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yOGE3Nzk5NS1kcmFhay5kdHMgfCAyNCArKysrKysr
KysrKysrLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTcgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlv
bnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjhhNzc5OTUt
ZHJhYWsuZHRzIGIvYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3I4YTc3OTk1LWRyYWFrLmR0
cwppbmRleCBhN2RjMTFlMzZmZDkuLjA2OTlmMWMxOWIxMSAxMDA2NDQKLS0tIGEvYXJjaC9hcm02
NC9ib290L2R0cy9yZW5lc2FzL3I4YTc3OTk1LWRyYWFrLmR0cworKysgYi9hcmNoL2FybTY0L2Jv
b3QvZHRzL3JlbmVzYXMvcjhhNzc5OTUtZHJhYWsuZHRzCkBAIC03NywxMSArNzcsMTggQEAKIAog
CQkJcG9ydEAwIHsKIAkJCQlyZWcgPSA8MD47Ci0JCQkJdGhjNjNsdmQxMDI0X2luOiBlbmRwb2lu
dCB7CisJCQkJdGhjNjNsdmQxMDI0X2luMDogZW5kcG9pbnQgewogCQkJCQlyZW1vdGUtZW5kcG9p
bnQgPSA8Jmx2ZHMwX291dD47CiAJCQkJfTsKIAkJCX07CiAKKwkJCXBvcnRAMSB7CisJCQkJcmVn
ID0gPDE+OworCQkJCXRoYzYzbHZkMTAyNF9pbjE6IGVuZHBvaW50IHsKKwkJCQkJcmVtb3RlLWVu
ZHBvaW50ID0gPCZsdmRzMV9vdXQ+OworCQkJCX07CisJCQl9OworCiAJCQlwb3J0QDIgewogCQkJ
CXJlZyA9IDwyPjsKIAkJCQl0aGM2M2x2ZDEwMjRfb3V0OiBlbmRwb2ludCB7CkBAIC0zNjAsMjQg
KzM2NywyNyBAQAogCXBvcnRzIHsKIAkJcG9ydEAxIHsKIAkJCWx2ZHMwX291dDogZW5kcG9pbnQg
ewotCQkJCXJlbW90ZS1lbmRwb2ludCA9IDwmdGhjNjNsdmQxMDI0X2luPjsKKwkJCQlyZW1vdGUt
ZW5kcG9pbnQgPSA8JnRoYzYzbHZkMTAyNF9pbjA+OwogCQkJfTsKIAkJfTsKIAl9OwogfTsKIAog
Jmx2ZHMxIHsKLQkvKgotCSAqIEV2ZW4gdGhvdWdoIHRoZSBMVkRTMSBvdXRwdXQgaXMgbm90IGNv
bm5lY3RlZCwgdGhlIGVuY29kZXIgbXVzdCBiZQotCSAqIGVuYWJsZWQgdG8gc3VwcGx5IGEgcGl4
ZWwgY2xvY2sgdG8gdGhlIERVIGZvciB0aGUgRFBBRCBvdXRwdXQgd2hlbgotCSAqIExWRFMwIGlz
IGluIHVzZS4KLQkgKi8KIAlzdGF0dXMgPSAib2theSI7CiAKIAljbG9ja3MgPSA8JmNwZyBDUEdf
TU9EIDcyNz4sCiAJCSA8JngxMl9jbGs+LAogCQkgPCZleHRhbF9jbGs+OwogCWNsb2NrLW5hbWVz
ID0gImZjayIsICJkY2xraW4uMCIsICJleHRhbCI7CisKKwlwb3J0cyB7CisJCXBvcnRAMSB7CisJ
CQlsdmRzMV9vdXQ6IGVuZHBvaW50IHsKKwkJCQlyZW1vdGUtZW5kcG9pbnQgPSA8JnRoYzYzbHZk
MTAyNF9pbjE+OworCQkJfTsKKwkJfTsKKwl9OwogfTsKIAogJm9oY2kwIHsKLS0gClJlZ2FyZHMs
CgpMYXVyZW50IFBpbmNoYXJ0CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
