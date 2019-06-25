Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D4C655572
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2019 19:05:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 801616E1B6;
	Tue, 25 Jun 2019 17:05:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 346856E1B4
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2019 17:05:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id ED25EFB02;
 Tue, 25 Jun 2019 19:05:23 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ILinwd_cVNSn; Tue, 25 Jun 2019 19:05:22 +0200 (CEST)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
 id 59B7648E34; Tue, 25 Jun 2019 19:05:19 +0200 (CEST)
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
Subject: [PATCH 2/4] drm/panel: jh057n0090: Don't use magic constant
Date: Tue, 25 Jun 2019 19:05:17 +0200
Message-Id: <ec1993368dba4e6ec1c72faa9c7bb25cf8ca95d3.1561482165.git.agx@sigxcpu.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1561482165.git.agx@sigxcpu.org>
References: <cover.1561482165.git.agx@sigxcpu.org>
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
OiBHdWlkbyBHw7xudGhlciA8YWd4QHNpZ3hjcHUub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9w
YW5lbC9wYW5lbC1yb2NrdGVjaC1qaDA1N24wMDkwMC5jIHwgMyArKy0KIDEgZmlsZSBjaGFuZ2Vk
LCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vcGFuZWwvcGFuZWwtcm9ja3RlY2gtamgwNTduMDA5MDAuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9wYW5lbC9wYW5lbC1yb2NrdGVjaC1qaDA1N24wMDkwMC5jCmluZGV4IDZkY2I2OTJjNDcwMS4u
YjhhMDY5MDU1ZmJjIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtcm9j
a3RlY2gtamgwNTduMDA5MDAuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtcm9j
a3RlY2gtamgwNTduMDA5MDAuYwpAQCAtMzMsNiArMzMsNyBAQAogI2RlZmluZSBTVDc3MDNfQ01E
X1NFVEVYVEMJIDB4QjkKICNkZWZpbmUgU1Q3NzAzX0NNRF9TRVRNSVBJCSAweEJBCiAjZGVmaW5l
IFNUNzcwM19DTURfU0VUVkRDCSAweEJDCisjZGVmaW5lIFNUNzcwM19DTURfVU5LTk9XTjAJIDB4
QkYKICNkZWZpbmUgU1Q3NzAzX0NNRF9TRVRTQ1IJIDB4QzAKICNkZWZpbmUgU1Q3NzAzX0NNRF9T
RVRQT1dFUgkgMHhDMQogI2RlZmluZSBTVDc3MDNfQ01EX1NFVFBBTkVMCSAweENDCkBAIC05NCw3
ICs5NSw3IEBAIHN0YXRpYyBpbnQgamgwNTduX2luaXRfc2VxdWVuY2Uoc3RydWN0IGpoMDU3biAq
Y3R4KQogCW1zbGVlcCgyMCk7CiAKIAlkc2lfZ2VuZXJpY193cml0ZV9zZXEoZHNpLCBTVDc3MDNf
Q01EX1NFVFZDT00sIDB4M0YsIDB4M0YpOwotCWRzaV9nZW5lcmljX3dyaXRlX3NlcShkc2ksIDB4
QkYsIDB4MDIsIDB4MTEsIDB4MDApOworCWRzaV9nZW5lcmljX3dyaXRlX3NlcShkc2ksIFNUNzcw
M19DTURfVU5LTk9XTjAsIDB4MDIsIDB4MTEsIDB4MDApOwogCWRzaV9nZW5lcmljX3dyaXRlX3Nl
cShkc2ksIFNUNzcwM19DTURfU0VUR0lQMSwKIAkJCSAgICAgIDB4ODIsIDB4MTAsIDB4MDYsIDB4
MDUsIDB4OUUsIDB4MEEsIDB4QTUsIDB4MTIsCiAJCQkgICAgICAweDMxLCAweDIzLCAweDM3LCAw
eDgzLCAweDA0LCAweEJDLCAweDI3LCAweDM4LAotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
