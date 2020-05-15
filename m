Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AFCD1D4E8D
	for <lists+dri-devel@lfdr.de>; Fri, 15 May 2020 15:12:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D02746EC96;
	Fri, 15 May 2020 13:12:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1D696EC96
 for <dri-devel@lists.freedesktop.org>; Fri, 15 May 2020 13:12:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id 76D87FB03;
 Fri, 15 May 2020 15:12:20 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id g8I1dDNq2x7s; Fri, 15 May 2020 15:12:18 +0200 (CEST)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
 id 78087445AA; Fri, 15 May 2020 15:12:15 +0200 (CEST)
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
Subject: [RFC PATCH 3/6] dt-bindings: display/bridge/nwl-dsi: Drop mux handling
Date: Fri, 15 May 2020 15:12:12 +0200
Message-Id: <9884c56219e9bdbeec179c27ea2b734dbb5f1289.1589548223.git.agx@sigxcpu.org>
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

Tm8gbmVlZCB0byBlbmNvZGUgdGhlIFNvQyBzcGVjaWZpY3MgaW4gdGhlIGJyaWRnZSBkcml2ZXIu
IEZvciB0aGUKaW14OG1xIHdlIGNhbiB1c2UgdGhlIG11eC1pbnB1dC1icmlkZ2UuCgpTaWduZWQt
b2ZmLWJ5OiBHdWlkbyBHw7xudGhlciA8YWd4QHNpZ3hjcHUub3JnPgotLS0KIC4uLi9kZXZpY2V0
cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL253bC1kc2kueWFtbCAgICAgICAgIHwgNiAtLS0t
LS0KIDEgZmlsZSBjaGFuZ2VkLCA2IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9ud2wtZHNpLnlhbWwgYi9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9icmlkZ2UvbndsLWRzaS55
YW1sCmluZGV4IDhhZmYyZDY4ZmMzMy4uZDJjMmQ0ZTE5YTI1IDEwMDY0NAotLS0gYS9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9icmlkZ2UvbndsLWRzaS55YW1sCisr
KyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9ud2wt
ZHNpLnlhbWwKQEAgLTQ2LDEwICs0Niw2IEBAIHByb3BlcnRpZXM6CiAgICAgICAtIGNvbnN0OiBw
aHlfcmVmCiAgICAgICAtIGNvbnN0OiBsY2RpZgogCi0gIG11eC1jb250cm9sczoKLSAgICBkZXNj
cmlwdGlvbjoKLSAgICAgIG11eCBjb250cm9sbGVyIG5vZGUgdG8gdXNlIGZvciBvcGVyYXRpbmcg
dGhlIGlucHV0IG11eAotCiAgIHBoeXM6CiAgICAgbWF4SXRlbXM6IDEKICAgICBkZXNjcmlwdGlv
bjoKQEAgLTE1MSw3ICsxNDcsNiBAQCByZXF1aXJlZDoKICAgLSBjbG9ja3MKICAgLSBjb21wYXRp
YmxlCiAgIC0gaW50ZXJydXB0cwotICAtIG11eC1jb250cm9scwogICAtIHBoeS1uYW1lcwogICAt
IHBoeXMKICAgLSBwb3J0cwpAQCAtMTgwLDcgKzE3NSw2IEBAIGV4YW1wbGVzOgogICAgICAgICAg
ICAgICAgICAgICAgICA8JmNsayBJTVg4TVFfQ0xLX0xDRElGX1BJWEVMPjsKICAgICAgICAgICAg
ICAgY2xvY2stbmFtZXMgPSAiY29yZSIsICJyeF9lc2MiLCAidHhfZXNjIiwgInBoeV9yZWYiLCAi
bGNkaWYiOwogICAgICAgICAgICAgICBpbnRlcnJ1cHRzID0gPEdJQ19TUEkgMzQgSVJRX1RZUEVf
TEVWRUxfSElHSD47Ci0gICAgICAgICAgICAgIG11eC1jb250cm9scyA9IDwmbXV4IDA+OwogICAg
ICAgICAgICAgICBwb3dlci1kb21haW5zID0gPCZwZ2NfbWlwaT47CiAgICAgICAgICAgICAgIHJl
c2V0cyA9IDwmc3JjIElNWDhNUV9SRVNFVF9NSVBJX0RTSV9SRVNFVF9CWVRFX04+LAogICAgICAg
ICAgICAgICAgICAgICAgICA8JnNyYyBJTVg4TVFfUkVTRVRfTUlQSV9EU0lfRFBJX1JFU0VUX04+
LAotLSAKMi4yNi4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWwK
