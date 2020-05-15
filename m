Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E5691D4E92
	for <lists+dri-devel@lfdr.de>; Fri, 15 May 2020 15:12:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30FF96EC2D;
	Fri, 15 May 2020 13:12:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3D196E187
 for <dri-devel@lists.freedesktop.org>; Fri, 15 May 2020 13:12:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id 52834FB02;
 Fri, 15 May 2020 15:12:19 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f2J9qBn8ahqL; Fri, 15 May 2020 15:12:16 +0200 (CEST)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
 id 686394458A; Fri, 15 May 2020 15:12:15 +0200 (CEST)
From: =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>
To: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Andrzej Hajda <a.hajda@samsung.com>, Sam Ravnborg <sam@ravnborg.org>,
 Anson Huang <Anson.Huang@nxp.com>,
 Leonard Crestez <leonard.crestez@nxp.com>,
 Lucas Stach <l.stach@pengutronix.de>, Peng Fan <peng.fan@nxp.com>,
 Robert Chiras <robert.chiras@nxp.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [RFC PATCH 1/6] dt-bindings: display/bridge: Add binding for input
 mux bridge
Date: Fri, 15 May 2020 15:12:10 +0200
Message-Id: <14a44a664f40584ffa25c1764aab5ebf97809c71.1589548223.git.agx@sigxcpu.org>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <cover.1589548223.git.agx@sigxcpu.org>
References: <cover.1589548223.git.agx@sigxcpu.org>
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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

VGhlIGJyaWRnZSBhbGxvd3MgdG8gc2VsZWN0IHRoZSBpbnB1dCBzb3VyY2UgdmlhIGEgbXV4IGNv
bnRyb2xsZXIuCgpTaWduZWQtb2ZmLWJ5OiBHdWlkbyBHw7xudGhlciA8YWd4QHNpZ3hjcHUub3Jn
PgotLS0KIC4uLi9kaXNwbGF5L2JyaWRnZS9tdXgtaW5wdXQtYnJpZGdlLnlhbWwgICAgICB8IDEy
MyArKysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAxMjMgaW5zZXJ0aW9ucygrKQog
Y3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNw
bGF5L2JyaWRnZS9tdXgtaW5wdXQtYnJpZGdlLnlhbWwKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9icmlkZ2UvbXV4LWlucHV0LWJyaWRnZS55
YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL211
eC1pbnB1dC1icmlkZ2UueWFtbApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAw
MDAuLjQwMjljZjYzZWU1YwotLS0gL2Rldi9udWxsCisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9tdXgtaW5wdXQtYnJpZGdlLnlhbWwKQEAgLTAs
MCArMSwxMjMgQEAKKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IChHUEwtMi4wLW9ubHkgT1Ig
QlNELTItQ2xhdXNlKQorJVlBTUwgMS4yCistLS0KKyRpZDogaHR0cDovL2RldmljZXRyZWUub3Jn
L3NjaGVtYXMvZGlzcGxheS9icmlkZ2UvbXV4LWlucHV0LWJyaWRnZS55YW1sIworJHNjaGVtYTog
aHR0cDovL2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9jb3JlLnlhbWwjCisKK3RpdGxlOiBE
Uk0gaW5wdXQgc291cmNlIHNlbGVjdGlvbiB2aWEgbXVsdGlwbGV4ZXIKKworbWFpbnRhaW5lcnM6
CisgIC0gR3VpZG8gR8O6bnRoZXIgPGFneEBzaWd4Y3B1Lm9yZz4KKworZGVzY3JpcHRpb246IHwK
KyAgVGhlIGlucHV0IG11bHRpcGxleGVyIGJyaWRnZSBhbGxvd3MgdG8gc2VsZWN0IGFuIGlucHV0
IHNvdXJjZQorICB2aWEgYW4gYXNzb2NpYXRlZCBtdXggY29udHJvbGxlci4KKworcHJvcGVydGll
czoKKyAgY29tcGF0aWJsZToKKyAgICBjb25zdDogbXV4LWlucHV0LWJyaWRnZQorCisgICcjYWRk
cmVzcy1jZWxscyc6CisgICAgY29uc3Q6IDEKKworICAnI3NpemUtY2VsbHMnOgorICAgIGNvbnN0
OiAwCisKKyAgZGVmYXVsdC1pbnB1dDoKKyAgICBkZXNjcmlwdGlvbjogVGhlIGRlZmF1bHQgaW5w
dXQgdG8gdXNlCisKKyAgbXV4LWNvbnRyb2xzOgorICAgIGRlc2NyaXB0aW9uOgorICAgICAgbXV4
IGNvbnRyb2xsZXIgbm9kZSB0byB1c2UgZm9yIG9wZXJhdGluZyB0aGUgaW5wdXQgbXV4CisKKyAg
cG9ydHM6CisgICAgdHlwZTogb2JqZWN0CisgICAgcHJvcGVydGllczoKKyAgICAgICcjYWRkcmVz
cy1jZWxscyc6CisgICAgICAgIGNvbnN0OiAxCisgICAgICAnI3NpemUtY2VsbHMnOgorICAgICAg
ICBjb25zdDogMAorCisgICAgcGF0dGVyblByb3BlcnRpZXM6CisgICAgICAiXnBvcnRAWzAtOV0r
IjoKKyAgICAgICAgdHlwZTogb2JqZWN0CisgICAgICAgIGRlc2NyaXB0aW9uOgorICAgICAgICAg
IEF0IGxlYXN0IHRocmVlIG5vZGVzIGNvbnRhaW5pbmcgZW5kcG9pbnRzIGNvbm5lY3RpbmcgdG8g
dGhlCisgICAgICAgICAgcGl4ZWwgZGF0YSBpbnB1dHMgYW5kIG91dHB1dHMuIFRoZSBsYXN0IHBv
cnQgaXMgYWx3YXlzIHRoZQorICAgICAgICAgIG91dHB1dCBwb3J0LgorCisgICAgICAgIHByb3Bl
cnRpZXM6CisgICAgICAgICAgcmVnOgorICAgICAgICAgICAgbWF4SXRlbXM6IDEKKworICAgICAg
ICAgIGVuZHBvaW50OgorICAgICAgICAgICAgZGVzY3JpcHRpb246IHN1Yi1ub2RlIGRlc2NyaWJp
bmcgdGhlIGlucHV0CisgICAgICAgICAgICB0eXBlOiBvYmplY3QKKworICAgICAgICByZXF1aXJl
ZDoKKyAgICAgICAgICAtIHJlZworCisgICAgICAgIGFkZGl0aW9uYWxQcm9wZXJ0aWVzOiBmYWxz
ZQorCisgICAgcmVxdWlyZWQ6CisgICAgICAtIHBvcnRAMAorICAgICAgLSBwb3J0QDEKKyAgICAg
IC0gcG9ydEAyCisKKyAgICBhZGRpdGlvbmFsUHJvcGVydGllczogZmFsc2UKKworcmVxdWlyZWQ6
CisgIC0gJyNhZGRyZXNzLWNlbGxzJworICAtICcjc2l6ZS1jZWxscycKKyAgLSBtdXgtY29udHJv
bHMKKyAgLSBwb3J0cworCithZGRpdGlvbmFsUHJvcGVydGllczogZmFsc2UKKworZXhhbXBsZXM6
CisgLSB8CisgICAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvZ3Bpby9ncGlvLmg+CisKKyAgIG11eDog
bXV4LWNvbnRyb2xsZXIgeworICAgICAgICAgICBjb21wYXRpYmxlID0gImdwaW8tbXV4IjsKKyAg
ICAgICAgICAgI211eC1jb250cm9sLWNlbGxzID0gPDA+OworCisgICAgICAgICAgIG11eC1ncGlv
cyA9IDwmZ3BpbzEgMTUgR1BJT19BQ1RJVkVfSElHSD47CisgICB9OworCisgICBtaXBpLW11eCB7
CisgICAgICAgICAgIGNvbXBhdGlibGUgPSAibXV4LWlucHV0LWJyaWRnZSI7CisgICAgICAgICAg
IGRlZmF1bHQtaW5wdXQgPSA8MD47CisgICAgICAgICAgIG11eC1jb250cm9scyA9IDwmbXV4IDA+
OworICAgICAgICAgICAjYWRkcmVzcy1jZWxscyA9IDwxPjsKKyAgICAgICAgICAgI3NpemUtY2Vs
bHMgPSA8MD47CisKKyAgICAgICAgICAgcG9ydHMgeworICAgICAgICAgICAgICAgICAgICNhZGRy
ZXNzLWNlbGxzID0gPDE+OworICAgICAgICAgICAgICAgICAgICNzaXplLWNlbGxzID0gPDA+Owor
CisgICAgICAgICAgICAgICAgICAgcG9ydEAwIHsKKyAgICAgICAgICAgICAgICAgICAgICAgICAg
IHJlZyA9IDwwPjsKKworICAgICAgICAgICAgICAgICAgICAgICAgICAgZHBpX211eF9mcm9tX2xj
ZGlmOiBlbmRwb2ludCB7CisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJlbW90
ZS1lbmRwb2ludCA9IDwmbGNkaWZfZHBpX291dD47CisgICAgICAgICAgICAgICAgICAgICAgICAg
ICB9OworICAgICAgICAgICAgICAgICAgIH07CisKKyAgICAgICAgICAgICAgICAgICBwb3J0QDEg
eworICAgICAgICAgICAgICAgICAgICAgICAgICAgcmVnID0gPDE+OworCisgICAgICAgICAgICAg
ICAgICAgICAgICAgICBkcGlfbXV4X2Zyb21fZGNjc3M6IGVuZHBvaW50IHsKKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgcmVtb3RlLWVuZHBvaW50ID0gPCZkY3NzX2RwaV9vdXQ+
OworICAgICAgICAgICAgICAgICAgICAgICAgICAgfTsKKyAgICAgICAgICAgICAgICAgICB9Owor
CisgICAgICAgICAgICAgICAgICAgcG9ydEAyIHsKKyAgICAgICAgICAgICAgICAgICAgICAgICAg
IHJlZyA9IDwyPjsKKworICAgICAgICAgICAgICAgICAgICAgICAgICAgZHBpX211eF9vdXQ6IGVu
ZHBvaW50IHsKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmVtb3RlLWVuZHBv
aW50ID0gPCZud2xfZHBpX2luPjsKKyAgICAgICAgICAgICAgICAgICAgICAgICAgIH07CisgICAg
ICAgICAgICAgICAgICAgfTsKKyAgICAgICAgICAgfTsKKyAgIH07Ci0tIAoyLjI2LjEKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
