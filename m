Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D37B6615E7
	for <lists+dri-devel@lfdr.de>; Sun,  7 Jul 2019 20:26:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C330F89B05;
	Sun,  7 Jul 2019 18:26:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 190AB89B05
 for <dri-devel@lists.freedesktop.org>; Sun,  7 Jul 2019 18:26:29 +0000 (UTC)
Received: from pendragon.nordic-sky.finnair.com (unknown [38.98.37.142])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id A955FCC;
 Sun,  7 Jul 2019 20:25:58 +0200 (CEST)
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 18/60] dt-bindings: display: panel: Add bindings for NEC
 NL8048HL11 panel
Date: Sun,  7 Jul 2019 21:18:55 +0300
Message-Id: <20190707181937.6250-15-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190707181937.6250-1-laurent.pinchart@ideasonboard.com>
References: <20190707180852.5512-1-laurent.pinchart@ideasonboard.com>
 <20190707181937.6250-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1562523987;
 bh=hbovLggOUGzloPbhS9RvkC3KFIMQMw/2RNJbB0AnQM4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fhNOIefizRPcbR4KtJDXPnUU9GpZMgOJ/9OYg0CRwDNl+ak+R26choJa1mZRQSkQO
 E4xQuKb5arP/sKogmIX30aQXF3ZY/7RqxR6uUsGIQo6DpZNcC0A41lWEGsIcbvZRQh
 tc4F9ZbbSAglPRnnymInQJFRp4TS1kdUyqFqnUhQ=
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Rob Herring <robh+dt@kernel.org>, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIE5FQyBOTDgwNDhITDExIGlzIGEgMTAuNGNtIFdWR0EgKDgwMHg0ODApIHBhbmVsIHdpdGgg
YSAyNC1iaXQgUkdCCnBhcmFsbGVsIGRhdGEgaW50ZXJmYWNlIGFuZCBhbiBTUEkgY29udHJvbCBp
bnRlcmZhY2UuCgpTaWduZWQtb2ZmLWJ5OiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNo
YXJ0QGlkZWFzb25ib2FyZC5jb20+Ci0tLQogLi4uL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvbmVj
LG5sODA0OGhsMTEudHh0IHwgMzggKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQs
IDM4IGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9uZWMsbmw4MDQ4aGwxMS50eHQKCmRpZmYgLS1n
aXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9uZWMs
bmw4MDQ4aGwxMS50eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxh
eS9wYW5lbC9uZWMsbmw4MDQ4aGwxMS50eHQKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAw
MDAwMDAwMDAwLi5hMjU1OWM3NGE0NWIKLS0tIC9kZXYvbnVsbAorKysgYi9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9uZWMsbmw4MDQ4aGwxMS50eHQKQEAg
LTAsMCArMSwzOCBAQAorTkVDIE5MODA0OEhMMTEgUGFuZWwKKz09PT09PT09PT09PT09PT09PT09
CisKK1RoZSBORUMgTkw4MDQ4SEwxMSBpcyBhIDEwLjRjbSBXVkdBICg4MDB4NDgwKSBwYW5lbCB3
aXRoIGEgMjQtYml0IFJHQiBwYXJhbGxlbAorZGF0YSBpbnRlcmZhY2UgYW5kIGFuIFNQSSBjb250
cm9sIGludGVyZmFjZS4KKworUmVxdWlyZWQgcHJvcGVydGllczoKKy0gY29tcGF0aWJsZTogU2hh
bGwgY29udGFpbiAibmVjLG5sODA0OGhsMTEiLgorLSByZXNldC1ncGlvczogVGhlIHBhbmVsIHJl
c2V0IEdQSU8gc3BlY2lmaWVyLgorCitPcHRpb25hbCBwcm9wZXJ0aWVzOgorLSBsYWJlbDogQSBz
eW1ib2xpYyBuYW1lIGZvciB0aGUgcGFuZWwuCisKK1JlcXVpcmVkIG5vZGVzOgorLSBWaWRlbyBw
b3J0IGZvciBEUEkgaW5wdXQKKworVGhlIGRldmljZSBub2RlIHNoYWxsIGNvbnRhaW4gb25lICdw
b3J0JyBjaGlsZCBub2RlIGNvcnJlc3BvbmRpbmcgdG8gdGhlIERQSQoraW5wdXQsIHdpdGggb25l
IGNoaWxkICdlbmRwb2ludCcgbm9kZSwgYWNjb3JkaW5nIHRvIHRoZSBiaW5kaW5ncyBkZWZpbmVk
IGluCitbMV0uCisKK1sxXTogRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlh
L3ZpZGVvLWludGVyZmFjZXMudHh0CisKK0V4YW1wbGUKKy0tLS0tLS0KKworbGNkLXBhbmVsOiBw
YW5lbEAwIHsKKwljb21wYXRpYmxlID0gIm5lYyxubDgwNDhobDExIjsKKwlyZWcgPSA8MD47CisJ
c3BpLW1heC1mcmVxdWVuY3kgPSA8MTAwMDAwMDA+OworCisJcmVzZXQtZ3Bpb3MgPSA8JmdwaW83
IDcgR1BJT19BQ1RJVkVfTE9XPjsKKworCXBvcnQgeworCQlsY2RfaW46IGVuZHBvaW50IHsKKwkJ
CXJlbW90ZS1lbmRwb2ludCA9IDwmZHBpX291dD47CisJCX07CisJfTsKK307Ci0tIApSZWdhcmRz
LAoKTGF1cmVudCBQaW5jaGFydAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
