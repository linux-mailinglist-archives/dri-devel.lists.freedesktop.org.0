Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03F91566EF
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2019 12:38:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 678956E384;
	Wed, 26 Jun 2019 10:38:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EF896E377
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2019 10:37:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id 511D0FB08;
 Wed, 26 Jun 2019 12:37:57 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Cb-WlhlyLnWr; Wed, 26 Jun 2019 12:37:55 +0200 (CEST)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
 id 8EC9F48EAC; Wed, 26 Jun 2019 12:37:51 +0200 (CEST)
From: =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 "David S. Miller" <davem@davemloft.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 "Paul E. McKenney" <paulmck@linux.ibm.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Purism Kernel Team <kernel@puri.sm>
Subject: [PATCH v2 2/4] drm/panel: jh057n00900: Don't use magic constant
Date: Wed, 26 Jun 2019 12:37:49 +0200
Message-Id: <7f50fa6de2ae029111f158f8ea7fd69a0903eb97.1561542477.git.agx@sigxcpu.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1561542477.git.agx@sigxcpu.org>
References: <cover.1561542477.git.agx@sigxcpu.org>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MHhCRiBpc24ndCBpbiBhbnkgU1Q3NzAzIGRhdGEgc2hlZXQgc28gbWFyayBpdCBhcyB1bmtub3du
LiBUaGlzIGF2b2lkcwpjb25mdXNpb24gb24gd2hldGhlciB0aGVyZSBpcyBhIG1pc3NpbmcgY29t
bWFuZCBpbiB0aGF0CmRzaV9nZW5lcmljX3dyaXRlX3NlcSgpIGNhbGwuCgpTaWduZWQtb2ZmLWJ5
OiBHdWlkbyBHw7xudGhlciA8YWd4QHNpZ3hjcHUub3JnPgpSZXZpZXdlZC1ieTogU2FtIFJhdm5i
b3JnIDxzYW1AcmF2bmJvcmcub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1y
b2NrdGVjaC1qaDA1N24wMDkwMC5jIHwgMyArKy0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlv
bnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcGFuZWwv
cGFuZWwtcm9ja3RlY2gtamgwNTduMDA5MDAuYyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5l
bC1yb2NrdGVjaC1qaDA1N24wMDkwMC5jCmluZGV4IDZkY2I2OTJjNDcwMS4uYjhhMDY5MDU1ZmJj
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtcm9ja3RlY2gtamgwNTdu
MDA5MDAuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtcm9ja3RlY2gtamgwNTdu
MDA5MDAuYwpAQCAtMzMsNiArMzMsNyBAQAogI2RlZmluZSBTVDc3MDNfQ01EX1NFVEVYVEMJIDB4
QjkKICNkZWZpbmUgU1Q3NzAzX0NNRF9TRVRNSVBJCSAweEJBCiAjZGVmaW5lIFNUNzcwM19DTURf
U0VUVkRDCSAweEJDCisjZGVmaW5lIFNUNzcwM19DTURfVU5LTk9XTjAJIDB4QkYKICNkZWZpbmUg
U1Q3NzAzX0NNRF9TRVRTQ1IJIDB4QzAKICNkZWZpbmUgU1Q3NzAzX0NNRF9TRVRQT1dFUgkgMHhD
MQogI2RlZmluZSBTVDc3MDNfQ01EX1NFVFBBTkVMCSAweENDCkBAIC05NCw3ICs5NSw3IEBAIHN0
YXRpYyBpbnQgamgwNTduX2luaXRfc2VxdWVuY2Uoc3RydWN0IGpoMDU3biAqY3R4KQogCW1zbGVl
cCgyMCk7CiAKIAlkc2lfZ2VuZXJpY193cml0ZV9zZXEoZHNpLCBTVDc3MDNfQ01EX1NFVFZDT00s
IDB4M0YsIDB4M0YpOwotCWRzaV9nZW5lcmljX3dyaXRlX3NlcShkc2ksIDB4QkYsIDB4MDIsIDB4
MTEsIDB4MDApOworCWRzaV9nZW5lcmljX3dyaXRlX3NlcShkc2ksIFNUNzcwM19DTURfVU5LTk9X
TjAsIDB4MDIsIDB4MTEsIDB4MDApOwogCWRzaV9nZW5lcmljX3dyaXRlX3NlcShkc2ksIFNUNzcw
M19DTURfU0VUR0lQMSwKIAkJCSAgICAgIDB4ODIsIDB4MTAsIDB4MDYsIDB4MDUsIDB4OUUsIDB4
MEEsIDB4QTUsIDB4MTIsCiAJCQkgICAgICAweDMxLCAweDIzLCAweDM3LCAweDgzLCAweDA0LCAw
eEJDLCAweDI3LCAweDM4LAotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
