Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C3220EDA2A
	for <lists+dri-devel@lfdr.de>; Mon,  4 Nov 2019 08:54:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45B8E6E15A;
	Mon,  4 Nov 2019 07:54:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE42E6E11C
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Nov 2019 01:40:28 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id E6856B228;
 Mon,  4 Nov 2019 01:40:26 +0000 (UTC)
From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
To: linux-realtek-soc@lists.infradead.org
Subject: [RFC 4/7] dt-bindings: gpu: mali-utgard: Add Realtek RTD1195
Date: Mon,  4 Nov 2019 02:39:29 +0100
Message-Id: <20191104013932.22505-5-afaerber@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191104013932.22505-1-afaerber@suse.de>
References: <20191104013932.22505-1-afaerber@suse.de>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 04 Nov 2019 07:54:21 +0000
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
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RGVmaW5lIGEgY29tcGF0aWJsZSBzdHJpbmcgZm9yIFJlYWx0ZWsgUlREMTE5NSBTb0MgZmFtaWx5
LgoKU2lnbmVkLW9mZi1ieTogQW5kcmVhcyBGw6RyYmVyIDxhZmFlcmJlckBzdXNlLmRlPgotLS0K
IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9ncHUvYXJtLG1hbGktdXRnYXJkLnlh
bWwgfCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoKZGlmZiAtLWdpdCBhL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9ncHUvYXJtLG1hbGktdXRnYXJkLnlhbWwg
Yi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZ3B1L2FybSxtYWxpLXV0Z2FyZC55
YW1sCmluZGV4IGFmZGU4MWJlM2MyOS4uYjAxYjk1Y2Y1Y2RmIDEwMDY0NAotLS0gYS9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZ3B1L2FybSxtYWxpLXV0Z2FyZC55YW1sCisrKyBi
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9ncHUvYXJtLG1hbGktdXRnYXJkLnlh
bWwKQEAgLTI2LDYgKzI2LDcgQEAgcHJvcGVydGllczoKICAgICAgICAgICAgICAgLSBhbGx3aW5u
ZXIsc3VuN2ktYTIwLW1hbGkKICAgICAgICAgICAgICAgLSBhbGx3aW5uZXIsc3VuOGktaDMtbWFs
aQogICAgICAgICAgICAgICAtIGFsbHdpbm5lcixzdW41MGktYTY0LW1hbGkKKyAgICAgICAgICAg
ICAgLSByZWFsdGVrLHJ0ZDExOTUtbWFsaQogICAgICAgICAgICAgICAtIHJvY2tjaGlwLHJrMzAz
Ni1tYWxpCiAgICAgICAgICAgICAgIC0gcm9ja2NoaXAscmszMDY2LW1hbGkKICAgICAgICAgICAg
ICAgLSByb2NrY2hpcCxyazMxODgtbWFsaQotLSAKMi4xNi40CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
