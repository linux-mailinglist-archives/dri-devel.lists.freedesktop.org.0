Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF52E90247
	for <lists+dri-devel@lfdr.de>; Fri, 16 Aug 2019 15:01:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E3D56E33F;
	Fri, 16 Aug 2019 13:01:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA5DE6E33F
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Aug 2019 13:01:20 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi
 [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0FD1C2AF;
 Fri, 16 Aug 2019 15:01:19 +0200 (CEST)
Date: Fri, 16 Aug 2019 16:01:15 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [GIT PULL FOR v5.3] R-Car LVDS fix
Message-ID: <20190816130115.GH5020@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1565960479;
 bh=z2/n0ilM8vArvguL6p8iL9tpM3yHFJTG9fD4seurCd0=;
 h=Date:From:To:Cc:Subject:From;
 b=es+o8jitXVCccSGCQVVfAuRgsv9qRrViX3zDE+gHqcTdYftA8DAokHoPoX0NfiBcz
 RK3XwilFU0SXg7JNKWCRZuPx7h1KIpPJZxN0Lu3iKaXZBk4a9Bcbki44UhMc9C6sis
 UMb4PVzaqzuIBzKcgNYLpTBPXyLZK0bEsNa1CJsM=
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRGF2ZSwKClRoZSBmb2xsb3dpbmcgY2hhbmdlcyBzaW5jZSBjb21taXQgYTg1YWJkNWQ0NWFk
YmE3NTUzNWI3ZmM2ZDlmNzgzMjlhNjkzYjdhOToKCiAgTWVyZ2UgdGFnICdkcm0taW50ZWwtZml4
ZXMtMjAxOS0wOC0xNScgb2YgZ2l0Oi8vYW5vbmdpdC5mcmVlZGVza3RvcC5vcmcvZHJtL2RybS1p
bnRlbCBpbnRvIGRybS1maXhlcyAoMjAxOS0wOC0xNiAxMjo0MTo1MiArMTAwMCkKCmFyZSBhdmFp
bGFibGUgaW4gdGhlIEdpdCByZXBvc2l0b3J5IGF0OgoKICBnaXQ6Ly9saW51eHR2Lm9yZy9waW5j
aGFydGwvbWVkaWEuZ2l0IHRhZ3MvZHUtZml4ZXMtMjAxOTA4MTYKdmkKZm9yIHlvdSB0byBmZXRj
aCBjaGFuZ2VzIHVwIHRvIGE1MzM1OGEzMWM5ODljMzYwZWE1OTUzNmQyODc2MmI5ZDJkNjhkMTk6
CgogIGRybTogcmNhcl9sdmRzOiBGaXggZHVhbCBsaW5rIG1vZGUgb3BlcmF0aW9ucyAoMjAxOS0w
OC0xNiAxNTo1MzoyOCArMDMwMCkKClRoaXMgZml4ZXMgYSBidWcgaW50cm9kdWNlZCBpbiB2NS4z
LCBJJ20gdGh1cyBzZW5kaW5nIGl0IGFzIGEgZml4IGZvcgp0aGUgY3VycmVudCBrZXJuZWwgcmVs
ZWFzZSBjYW5kaWRhdGUuIElmIGl0J3MgdG9vIGxhdGUgaXQgY291bGQgYWxzbyBiZQptZXJnZWQg
aW4gdjUuNC4KCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0KUi1DYXIgTFZEUyBlbmNvZGVyIGZpeAoKLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpKYWNvcG8g
TW9uZGkgKDEpOgogICAgICBkcm06IHJjYXJfbHZkczogRml4IGR1YWwgbGluayBtb2RlIG9wZXJh
dGlvbnMKCiBkcml2ZXJzL2dwdS9kcm0vcmNhci1kdS9yY2FyX2x2ZHMuYyB8IDYgKystLS0tCiAx
IGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKLS0gClJlZ2Fy
ZHMsCgpMYXVyZW50IFBpbmNoYXJ0Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
