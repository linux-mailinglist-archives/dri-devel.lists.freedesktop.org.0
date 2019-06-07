Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E2C93A5A7
	for <lists+dri-devel@lfdr.de>; Sun,  9 Jun 2019 14:55:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E033892EE;
	Sun,  9 Jun 2019 12:54:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo6-p01-ob.smtp.rzone.de (mo6-p01-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5301::3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34BAB89D57
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jun 2019 11:11:37 +0000 (UTC)
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o12DNOsPj0pAwkq13LM="
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box by smtp.strato.de (RZmta 44.22 DYNA|AUTH)
 with ESMTPSA id i01b98v57BBCPaN
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with
 521 ECDH bits, eq. 15360 bits RSA))
 (Client did not present a certificate);
 Fri, 7 Jun 2019 13:11:12 +0200 (CEST)
From: "H. Nikolaus Schaller" <hns@goldelico.com>
To: Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, tomi.valkeinen@ti.com,
 imirkin@alum.mit.edu, marek.belisko@gmail.com,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH v3 0/5] drm/panel-simple: Add panel parameters for
 ortustech-com37h3m05dtc/99dtc and sharp-lq070y3dg3b
Date: Fri,  7 Jun 2019 13:11:06 +0200
Message-Id: <cover.1559905870.git.hns@goldelico.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 09 Jun 2019 12:54:16 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 t=1559905894; 
 s=strato-dkim-0002; d=goldelico.com;
 h=Message-Id:Date:Subject:Cc:To:From:X-RZG-CLASS-ID:X-RZG-AUTH:From:
 Subject:Sender;
 bh=gdbB42uBtpCZVbeW6GNf/4lkZJ/Djuqs29FobgjrNn4=;
 b=IC0Ih8lbbzDAXoSm6pqA2XnHergtrGcFgxoTgAPS1/HkXASSpzqiTav+sODOOQ+r+b
 6XktPL/oi2TE0HjFKch14l8n6fgLzWHfozN0c9m9SUp0uuEqLoNfMYD9sQYKIE1dSQYl
 /4+KEd5RzIHvBJfCE2UERVfCQpFFp3vumYPS08Ck794JU9LX6b5qIPD10truhcnbV56r
 k4lP7JoReOTSU+g1SJaia0qAm4DJ3TQYq8uhzkfkCk4grnJmJzLiLhpL7AoitpShYawL
 o1DzGnqSVdhQtO9VPjNBqdntrPs8agWS+koY4py1gaiTHQK65ZmmgnMY/MH94gOwTYjx
 JuBQ==
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
 dri-devel@lists.freedesktop.org, letux-kernel@openphoenux.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VjM6CiogYWRkIGJpbmRpbmdzIGRvY3VtZW50YXRpb24gKHN1Z2dlc3RlZCBieSBzYW1AcmF2bmJv
cmcub3JnKQoKVjIgMjAxOS0wNi0wNSAwNzowNzowNToKKiBmaXggdHlwbyBpbiA5OWR0YyBwYW5l
bCBjb21wYXRpYmxlIHN0cmluZyAocmVwb3J0ZWQgYnkgaW1pcmtpbkBhbHVtLm1pdC5lZHUpCgpW
MSAyMDE5LTA2LTA0IDE0OjUzOjAwOgoKU2luY2UgdjUuMi1yYzEgT01BUCBpcyBubyBsb25nZXIg
dXNpbmcgYSBzcGVjaWFsIGRpc3BsYXkgZHJpdmVyIGFyY2hpdGVjdHVyZQpmb3IgRFBJIHBhbmVs
cywgYnV0IHVzZXMgdGhlIGdlbmVyYWwgZHJtL3BhbmVsL3BhbmVsLXNpbXBsZS4KClNvIHdlIGZp
bmFsbHkgY2FuIGFkZCBTb0MgaW5kZXBlbmRlbnQgcGFuZWwgZGVmaW5pdGlvbnMgZm9yIHR3byBw
YW5lbCBtb2RlbHMKd2hpY2ggd2UgYWxyZWFkeSBoYWQgd29ya2VkIG9uIHF1aXRlIGEgd2hpbGUg
YWdvIChiZWZvcmUgZGV2aWNlIHRyZWUgd2FzCmludHJvZHVjZWQpOgoKCWh0dHBzOi8vcGF0Y2h3
b3JrLmtlcm5lbC5vcmcvcGF0Y2gvMjg1MTI5NS8KCgoKSC4gTmlrb2xhdXMgU2NoYWxsZXIgKDUp
OgogIGRybS9wYW5lbDogc2ltcGxlOiBBZGQgU2hhcnAgTFEwNzBZM0RHM0IgcGFuZWwgc3VwcG9y
dAogIGRybS9wYW5lbDogc2ltcGxlOiBBZGQgT3J0dXN0ZWNoIENPTTM3SDNNIHBhbmVsIHN1cHBv
cnQKICBkdC1iaW5kaW5nczogZHJtL3BhbmVsOiBzaW1wbGU6IGFkZCBvcnR1c3RlY2gsY29tMzdo
M20wNWR0YyBwYW5lbAogIGR0LWJpbmRpbmdzOiBkcm0vcGFuZWw6IHNpbXBsZTogYWRkIG9ydHVz
dGVjaCxjb20zN2gzbTk5ZHRjIHBhbmVsCiAgZHQtYmluZGluZ3M6IGRybS9wYW5lbDogc2ltcGxl
OiBhZGQgc2hhcnAsbHEwNzB5M2RnM2IgcGFuZWwKCiAuLi4vZGlzcGxheS9wYW5lbC9vcnR1c3Rl
Y2gsY29tMzdoM20wNWR0Yy50eHQgfCAxMiArKysrCiAuLi4vZGlzcGxheS9wYW5lbC9vcnR1c3Rl
Y2gsY29tMzdoM205OWR0Yy50eHQgfCAxMiArKysrCiAuLi4vZGlzcGxheS9wYW5lbC9zaGFycCxs
cTA3MHkzZGczYi50eHQgICAgICAgfCAxMiArKysrCiBkcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFu
ZWwtc2ltcGxlLmMgICAgICAgICAgfCA2MyArKysrKysrKysrKysrKysrKysrCiA0IGZpbGVzIGNo
YW5nZWQsIDk5IGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9vcnR1c3RlY2gsY29tMzdoM20wNWR0
Yy50eHQKIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvZGlzcGxheS9wYW5lbC9vcnR1c3RlY2gsY29tMzdoM205OWR0Yy50eHQKIGNyZWF0ZSBtb2Rl
IDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9z
aGFycCxscTA3MHkzZGczYi50eHQKCi0tIAoyLjE5LjEKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
