Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A0EADDBA6
	for <lists+dri-devel@lfdr.de>; Sun, 20 Oct 2019 02:07:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6CE389CE2;
	Sun, 20 Oct 2019 00:07:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo6-p03-ob.smtp.rzone.de (mo6-p03-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5303::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B8326EBC3
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2019 18:46:54 +0000 (UTC)
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o1mfYzBGHXH6F3CFF60="
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box by smtp.strato.de (RZmta 44.28.1 DYNA|AUTH)
 with ESMTPSA id R0b2a8v9IIkYDLH
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with
 521 ECDH bits, eq. 15360 bits RSA))
 (Client did not present a certificate);
 Fri, 18 Oct 2019 20:46:34 +0200 (CEST)
From: "H. Nikolaus Schaller" <hns@goldelico.com>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
 Tony Lindgren <tony@atomide.com>
Subject: [PATCH 6/7] ARM: DTS: omap4: add sgx gpu child node
Date: Fri, 18 Oct 2019 20:46:29 +0200
Message-Id: <4d9788256c2a34f97b5f2474333ceb113601dd6a.1571424390.git.hns@goldelico.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1571424390.git.hns@goldelico.com>
References: <cover.1571424390.git.hns@goldelico.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 20 Oct 2019 00:06:45 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 t=1571424413; 
 s=strato-dkim-0002; d=goldelico.com;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=8FsX47iELcDNe5J41570aGfAYcqQSq9axKOUa9WR9Qs=;
 b=OfHklP1A77SjKcPjkFbtxnmUFHVe5AB4woVuLoD0120E26rrYokfvvogZwlrWmgrsU
 dVQ/Z04iS/oIUrGnHwsLQhiHEWa3oAsPo+ZaPu1dZ9/D9DIBK5s5qtlMJHzzO6YqFbGc
 b4xFJjBkbi3ramCSyf9rul424y81Ub/GFGzkZm8TIWiYxtHed+kpTzRDNRjTt0qYmXiM
 bIQ8Ml48C7ABktsTm6NgfVEAOPOrLuBss4A/uiq4c8Neq6pxP43vrPYtS4c0VhYgyxM6
 GHCQrVBtPYDZwarCFPuJ5h6hFarsFVMMm2zgLqWxxMbtimIKyfY891IMl/xfAu0A8Mto
 veWA==
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
Cc: devicetree@vger.kernel.org, linux-omap@vger.kernel.org,
 "H. Nikolaus Schaller" <hns@goldelico.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, kernel@pyra-handheld.com,
 letux-kernel@openphoenux.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

YW5kIGFkZCB0aW1lciBhbmQgaW50ZXJydXB0LgoKU2luY2Ugb21hcDQ0MjAvMzAvNjAgYW5kIG9t
YXA0NDcwIGNvbWUgd2l0aCBkaWZmZXJlbnQgU0dYIHZhcmlhbnRzCndlIG5lZWQgdG8gaW50cm9k
dWNlIGEgbmV3IG9tYXA0NDcwLmR0c2kuIElmIGFuIG9tYXA0NDcwIGJvYXJkCmRvZXMgbm90IHdh
bnQgdG8gdXNlIFNHWCBpdCBpcyBubyBwcm9ibGVtIHRvIHN0aWxsIGluY2x1ZGUKb21hcDQ0NjAu
ZHRzaS4KClRlc3RlZCBvbiBQYW5kYUJvYXJkIEVTLgoKU2lnbmVkLW9mZi1ieTogSC4gTmlrb2xh
dXMgU2NoYWxsZXIgPGhuc0Bnb2xkZWxpY28uY29tPgotLS0KIGFyY2gvYXJtL2Jvb3QvZHRzL29t
YXA0LmR0c2kgICB8IDExICsrKysrKystLS0tCiBhcmNoL2FybS9ib290L2R0cy9vbWFwNDQ3MC5k
dHMgfCAxNiArKysrKysrKysrKysrKysrCiAyIGZpbGVzIGNoYW5nZWQsIDIzIGluc2VydGlvbnMo
KyksIDQgZGVsZXRpb25zKC0pCiBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9hcm0vYm9vdC9kdHMv
b21hcDQ0NzAuZHRzCgpkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vYm9vdC9kdHMvb21hcDQuZHRzaSBi
L2FyY2gvYXJtL2Jvb3QvZHRzL29tYXA0LmR0c2kKaW5kZXggN2NjOTViYzE1OThiLi40Yzk0NTU1
YWUwZDAgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtL2Jvb3QvZHRzL29tYXA0LmR0c2kKKysrIGIvYXJj
aC9hcm0vYm9vdC9kdHMvb21hcDQuZHRzaQpAQCAtMzQ3LDEwICszNDcsMTMgQEAKIAkJCSNzaXpl
LWNlbGxzID0gPDE+OwogCQkJcmFuZ2VzID0gPDAgMHg1NjAwMDAwMCAweDIwMDAwMDA+OwogCi0J
CQkvKgotCQkJICogQ2xvc2VkIHNvdXJjZSBQb3dlclZSIGRyaXZlciwgbm8gY2hpbGQgZGV2aWNl
Ci0JCQkgKiBiaW5kaW5nIG9yIGRyaXZlciBpbiBtYWlubGluZQotCQkJICovCisJCQlzZ3g6IHNn
eEAwIHsKKwkJCQljb21wYXRpYmxlID0gImltZyxzZ3g1NDAtMTIwIiwgImltZyxzZ3g1NDAiLCAi
dGksb21hcC1vbWFwNC1zZ3g1NDAtMTIwIjsKKwkJCQlyZWcgPSA8MHgwIDB4MjAwMDAwMD47CS8q
IDMyTUIgKi8KKwkJCQlyZWctbmFtZXMgPSAic2d4IjsKKwkJCQlpbnRlcnJ1cHRzID0gPEdJQ19T
UEkgMjEgSVJRX1RZUEVfTEVWRUxfSElHSD47CisJCQkJdGltZXIgPSA8JnRpbWVyMTE+OworCQkJ
fTsKIAkJfTsKIAogCQlkc3M6IGRzc0A1ODAwMDAwMCB7CmRpZmYgLS1naXQgYS9hcmNoL2FybS9i
b290L2R0cy9vbWFwNDQ3MC5kdHMgYi9hcmNoL2FybS9ib290L2R0cy9vbWFwNDQ3MC5kdHMKbmV3
IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMDAwLi40NWIwYjRiOGNlMzIKLS0tIC9k
ZXYvbnVsbAorKysgYi9hcmNoL2FybS9ib290L2R0cy9vbWFwNDQ3MC5kdHMKQEAgLTAsMCArMSwx
NiBAQAorLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb25seQorLyoKKyAqIERl
dmljZSBUcmVlIFNvdXJjZSBmb3IgT01BUDQ0NzAgU29DCisgKgorICogQ29weXJpZ2h0IChDKSAy
MDEyIFRleGFzIEluc3RydW1lbnRzIEluY29ycG9yYXRlZCAtIGh0dHA6Ly93d3cudGkuY29tLwor
ICoKKyAqIFRoaXMgZmlsZSBpcyBsaWNlbnNlZCB1bmRlciB0aGUgdGVybXMgb2YgdGhlIEdOVSBH
ZW5lcmFsIFB1YmxpYyBMaWNlbnNlCisgKiB2ZXJzaW9uIDIuICBUaGlzIHByb2dyYW0gaXMgbGlj
ZW5zZWQgImFzIGlzIiB3aXRob3V0IGFueSB3YXJyYW50eSBvZiBhbnkKKyAqIGtpbmQsIHdoZXRo
ZXIgZXhwcmVzcyBvciBpbXBsaWVkLgorICovCisjaW5jbHVkZSAib21hcDQ0NjAuZHRzaSIKKwor
JnNneCB7CisJY29tcGF0aWJsZSA9ICJpbWcsc2d4NTQ0LTExMiIsICJpbWcsc2d4NTQ0IiwgInRp
LG9tYXAtb21hcDQtc2d4NTQ0LTExMiI7CisJaW1nLGNvcmVzID0gPDE+OworfTsKLS0gCjIuMTku
MQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
