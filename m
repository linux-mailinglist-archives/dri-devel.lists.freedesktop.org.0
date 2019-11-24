Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EFB71089CC
	for <lists+dri-devel@lfdr.de>; Mon, 25 Nov 2019 09:08:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC95A89F75;
	Mon, 25 Nov 2019 08:08:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo6-p02-ob.smtp.rzone.de (mo6-p02-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5302::6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 062BC89EA3
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Nov 2019 11:40:43 +0000 (UTC)
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o1mfYzBGHXH4HEaKeuIV"
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box by smtp.strato.de (RZmta 44.29.0 DYNA|AUTH)
 with ESMTPSA id L09db3vAOBeTwEQ
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with
 521 ECDH bits, eq. 15360 bits RSA))
 (Client did not present a certificate);
 Sun, 24 Nov 2019 12:40:29 +0100 (CET)
From: "H. Nikolaus Schaller" <hns@goldelico.com>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
 Tony Lindgren <tony@atomide.com>, Paul Cercueil <paul@crapouillou.net>,
 Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paulburton@kernel.org>,
 James Hogan <jhogan@kernel.org>
Subject: [PATCH v3 0/8] ARM/MIPS: DTS: add child nodes describing the PVRSGX
 GPU present in some OMAP SoC and JZ4780 (and many more)
Date: Sun, 24 Nov 2019 12:40:20 +0100
Message-Id: <cover.1574595627.git.hns@goldelico.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 25 Nov 2019 08:07:41 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 t=1574595641; 
 s=strato-dkim-0002; d=goldelico.com;
 h=Message-Id:Date:Subject:Cc:To:From:X-RZG-CLASS-ID:X-RZG-AUTH:From:
 Subject:Sender;
 bh=Xz/eSV1DQtvQmnwSq2ae2J1MX8uxZYrtnzHz1rAuGSM=;
 b=TQqLx2PnhscC07qTdr15TSAEOGVC/2RaW2pcNGIw1xbe+4/5F2+AokacGG0GdUmN5b
 RH3zAk7JwCrSGKGWXljbOxsz7RqI8B8v9Ur+5LYWx4vV0E0thGuT7vFpz5lUkgV1PWaJ
 OhasxXExUpcHJ33AtNOC/tQrcmoIVIBPbTB9ClZ/VMY4KYb7SvH6gBQkfW6iYkcZyrko
 PTueJaUjww2yqnLgtP5QHZLkDkgao3FowTngkE/NjpvthoVZ92qgmg0P4vGb8ZDVFcpQ
 sIu4WS0wYIUeixPyi+yWXeJgOs+QhrAF+mROoNYeRzlRjeVx9x25pbtHX1vCI+63z3z3
 6Cyg==
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
 "H. Nikolaus Schaller" <hns@goldelico.com>, openpvrsgx-devgroup@letux.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mips@vger.kernel.org, kernel@pyra-handheld.com,
 letux-kernel@openphoenux.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

KiByZXdvcmtlZCBZQU1MIGZvcm1hdCB3aXRoIGhlbHAgYnkgUm9iIEhlcnJpbmcKKiByZW1vdmVk
IC50eHQgYmluZGluZyBkb2N1bWVudAoqIGNoYW5nZSBjb21wYXRpYmxlICJ0aSxhbTMzNXgtc2d4
IiB0byAidGksYW0zMzUyLXNneCIgLSBzdWdnZXN0ZWQgYnkgVG9ueSBMaW5kZ3JlbgoKUEFUQ0gg
VjIgMjAxOS0xMS0wNyAxMjowNjoxNzoKKiB0cmllZCB0byBjb252ZXJ0IGJpbmRpbmdzIHRvIFlB
TUwgZm9ybWF0IC0gc3VnZ2VzdGVkIGJ5IFJvYiBIZXJyaW5nCiogYWRkZWQgSlo0NzgwIERUUyBu
b2RlIChwcm92ZW4gdG8gbG9hZCB0aGUgZHJpdmVyKQoqIHJlbW92ZWQgdGltZXIgYW5kIGltZyxj
b3JlcyBwcm9wZXJ0aWVzIHVudGlsIHdlIGtub3cgd2UgcmVhbGx5IG5lZWQgdGhlbSAtIHN1Z2dl
c3RlZCBieSBSb2IgSGVycmluZwoKUEFUQ0ggVjEgMjAxOS0xMC0xOCAyMDo0NjozNToKClRoaXMg
cGF0Y2ggc2VyaWVzIGRlZmluZXMgY2hpbGQgbm9kZXMgZm9yIHRoZSBTR1g1eHggaW50ZXJmYWNl
IGluc2lkZQpkaWZmZXJlbnQgU29DIHNvIHRoYXQgYSBkcml2ZXIgY2FuIGJlIGZvdW5kIGFuZCBw
cm9iZWQgYnkgdGhlCmNvbXBhdGlibGUgc3RyaW5ncyBhbmQgY2FuIHJldHJpZXZlIGluZm9ybWF0
aW9uIGFib3V0IHRoZSBTR1ggcmV2aXNpb24KdGhhdCBpcyBpbmNsdWRlZCBpbiBhIHNwZWNpZmlj
IFNvQy4gSXQgYWxzbyBkZWZpbmVzIHRoZSBpbnRlcnJ1cHQgbnVtYmVyCnRvIGJlIHVzZWQgYnkg
dGhlIFNHWCBkcml2ZXIuCgpUaGVyZSBpcyBjdXJyZW50bHkgbm8gbWFpbmxpbmUgZHJpdmVyIGZv
ciB0aGVzZSBHUFVzLCBidXQgYSBwcm9qZWN0IFsxXQppcyBvbmdvaW5nIHdpdGggdGhlIGdvYWwg
dG8gZ2V0IHRoZSBvcGVuLXNvdXJjZSBwYXJ0IGFzIHByb3ZpZGVkIGJ5IFRJL0lNRwphbmQgb3Ro
ZXJzIGludG8gZHJpdmVycy9ncHUvZHJtL3B2cnNneC4KClRoZSBrZXJuZWwgbW9kdWxlcyBidWls
dCBmcm9tIHRoaXMgcHJvamVjdCBoYXZlIHN1Y2Nlc3NmdWxseSBkZW1vbnN0cmF0ZWQKdG8gd29y
ayB3aXRoIHRoZSBEVFMgZGVmaW5pdGlvbnMgZnJvbSB0aGlzIHBhdGNoIHNldCBvbiBBTTMzNXgg
QmVhZ2xlQm9uZQpCbGFjaywgRE0zNzMwIGFuZCBPTUFQNSBQeXJhIGFuZCBEcm9pZCA0LiBUaGV5
IHBhcnRpYWxseSB3b3JrIG9uIE9NQVAzNTMwIGFuZApQYW5kYUJvYXJkIEVTIGJ1dCB0aGF0IGlz
IGxpa2VseSBhIHByb2JsZW0gaW4gdGhlIGtlcm5lbCBkcml2ZXIgb3IgdGhlCihub24tZnJlZSkg
dXNlci1zcGFjZSBsaWJyYXJpZXMgYW5kIGJpbmFyaWVzLgoKV290ayBmb3IgSlo0NzgwIChDSTIw
IGJvYXJkKSBpcyBpbiBwcm9ncmVzcyBhbmQgdGhlcmUgaXMgcG90ZW50aWFsIHRvIGV4dGVuZAp0
aGlzIHdvcmsgdG8gZS5nLiBCYW5hbmFQaS1NMyAoQTgzKSBhbmQgIHNvbWUgSW50ZWwgUG91bHNi
byBhbmQgQ2VkYXJWaWV3CmRldmljZXMuCgpbMV06IGh0dHBzOi8vZ2l0aHViLmNvbS9vcGVucHZy
c2d4LWRldmdyb3VwCgoKSC4gTmlrb2xhdXMgU2NoYWxsZXIgKDgpOgogIGR0LWJpbmRpbmdzOiBh
ZGQgaW1nLHB2cnNneC55YW1sIGZvciBJbWFnaW5hdGlvbiBHUFVzCiAgQVJNOiBEVFM6IGFtMzN4
eDogYWRkIHNneCBncHUgY2hpbGQgbm9kZQogIEFSTTogRFRTOiBhbTM1MTc6IGFkZCBzZ3ggZ3B1
IGNoaWxkIG5vZGUKICBBUk06IERUUzogb21hcDM6IGFkZCBzZ3ggZ3B1IGNoaWxkIG5vZGUKICBB
Uk06IERUUzogb21hcDM2eHg6IGFkZCBzZ3ggZ3B1IGNoaWxkIG5vZGUKICBBUk06IERUUzogb21h
cDQ6IGFkZCBzZ3ggZ3B1IGNoaWxkIG5vZGUKICBBUk06IERUUzogb21hcDU6IGFkZCBzZ3ggZ3B1
IGNoaWxkIG5vZGUKICBNSVBTOiBEVFM6IGp6NDc4MDogYWRkIHNneCBncHUgbm9kZQoKIC4uLi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL2dwdS9pbWcscHZyc2d4LnlhbWwgICB8IDgzICsrKysrKysrKysr
KysrKysrKysKIGFyY2gvYXJtL2Jvb3QvZHRzL2FtMzN4eC5kdHNpICAgICAgICAgICAgICAgICB8
IDM4ICsrKysrKysrLQogYXJjaC9hcm0vYm9vdC9kdHMvYW0zNTE3LmR0c2kgICAgICAgICAgICAg
ICAgIHwgMTEgKy0tCiBhcmNoL2FybS9ib290L2R0cy9vbWFwMzR4eC5kdHNpICAgICAgICAgICAg
ICAgfCAxMSArLS0KIGFyY2gvYXJtL2Jvb3QvZHRzL29tYXAzNnh4LmR0c2kgICAgICAgICAgICAg
ICB8IDExICstLQogYXJjaC9hcm0vYm9vdC9kdHMvb21hcDQuZHRzaSAgICAgICAgICAgICAgICAg
IHwgIDkgKy0KIGFyY2gvYXJtL2Jvb3QvZHRzL29tYXA0NDcwLmR0cyAgICAgICAgICAgICAgICB8
IDE1ICsrKysKIGFyY2gvYXJtL2Jvb3QvZHRzL29tYXA1LmR0c2kgICAgICAgICAgICAgICAgICB8
ICA5ICstCiBhcmNoL21pcHMvYm9vdC9kdHMvaW5nZW5pYy9qejQ3ODAuZHRzaSAgICAgICAgfCAx
MSArKysKIDkgZmlsZXMgY2hhbmdlZCwgMTcxIGluc2VydGlvbnMoKyksIDI3IGRlbGV0aW9ucygt
KQogY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9n
cHUvaW1nLHB2cnNneC55YW1sCiBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9hcm0vYm9vdC9kdHMv
b21hcDQ0NzAuZHRzCgotLSAKMi4yMy4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
