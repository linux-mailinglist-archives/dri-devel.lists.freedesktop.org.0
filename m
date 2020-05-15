Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C40811D4E8B
	for <lists+dri-devel@lfdr.de>; Fri, 15 May 2020 15:12:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36E376E187;
	Fri, 15 May 2020 13:12:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD25B6E187
 for <dri-devel@lists.freedesktop.org>; Fri, 15 May 2020 13:12:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id 52D22FB09;
 Fri, 15 May 2020 15:12:18 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MkNYiLtyIAdX; Fri, 15 May 2020 15:12:16 +0200 (CEST)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
 id 5C6A9445A7; Fri, 15 May 2020 15:12:15 +0200 (CEST)
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
Subject: [RFC PATCH 0/6] drm/bridge: Add mux input selection bridge
Date: Fri, 15 May 2020 15:12:09 +0200
Message-Id: <cover.1589548223.git.agx@sigxcpu.org>
X-Mailer: git-send-email 2.26.1
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

VGhpcyBicmlkZ2UgZHJpdmVyIGFsbG93cyB0byBzZWxlY3QgdGhlIGlucHV0IHRvIGEgZG93bnN0
cmVhbSBicmlkZ2UgKG9yIHBhbmVsKQp2aWEgZGV2aWNlIHRyZWUuCgpJdCBjYW4gYmUgdXNlZnVs
IHRvIHNlcGFyYXRlIHRoZSBwaXhlbCBzb3VyY2Ugc2VsZWN0aW9uIGZyb20gdGhlIGFjdHVhbCBi
cmlkZ2UKcHJvY2Vzc2luZyB0aGUgcGl4ZWwgZGF0YS4gRS5nLiBOWFAncyBpbXg4bXEgaGFzIHR3
byBkaXNwbGF5IGNvbnRyb2xsZXJzLiBCb3RoCmNhbiBmZWVkIHRoZSBwaXhlbCBkYXRhIHRvIHRo
ZSBOV0wgRFNJIElQIGNvcmUuIFRoZSBpbnB1dCBzZWxlY3Rpb24gaXMgZG9uZSB2aWEKYSBzZXBh
cmF0ZSBtdXggcmVnaXN0ZXIgZWxzZXdoZXJlIG9uIHRoZSBjaGlwLCBzbyBzZXBhcmF0aW5nIHRo
aXMgb3V0IGF2b2lkcyBTb0MKc3BlY2lmaWMgY29kZSBpbiBzdWNoIGRyaXZlcnMuCgpUaGUgY3Vy
cmVudCBpbXBsZW1lbnRhdGlvbiBhbGxvd3MgdG8gc2VsZWN0IHRoZSBpbnB1dCBzb3VyY2Ugdmlh
IGRldmljZSB0cmVlLgpUaGUgbG9uZyB0ZXJtIGdvYWwgaXMgdG8gYWxsb3cgdG8gc3dpdGNoIHRo
ZSBpbnB1dCBzb3VyY2UgYXQgcnVuIHRpbWUuIFRoaXMKY2FuIGJlIHVzZWZ1bCB0byBlLmcuIHVz
ZSB0aGUgbGVzcyBwb3dlciBodW5ncnkgZGlzcGxheSBjb250cm9sbGVyIGZvciBub3JtYWwKb3Bl
cmF0aW9uIGJ1dCBzd2l0Y2ggdG8gYSB0aGUgb3RoZXIgZGlzcGxheSBjb250cm9sbGVyIHdoZW4g
cnVubmluZyBmdWxsIHNjcmVlbgpnYW1lcyAoc2luY2UgaXQgY2FuIGRldGlsZSB0ZXh0dXJlcyBt
b3JlIGVmZmljaWVudGx5KS4KClRoaXMgd2FzIGluaXRpYWxseSBzdWdnZXN0ZWQgYnkgTGF1cmVu
dCBQaW5jaGFydMK5LiBJdCBpcyBzaW1pbGFyIGluIHNwaXJpdCB0bwp0aGUgdmlkZW8tbXV4IGlu
IHRoZSBtZWRpYSBzdWJzeXN0ZW0gYnV0IGZvciBEUk0gYnJpZGdlcy4KCkJlc2lkZXMgdGhlIGFj
dHVhbCBkcml2ZXIgdGhpcyBzZXJpZXMgaW5jbHVkZXMgdGhlIG5lY2Vzc2FyeSBiaXRzIHRvIGRl
bW8gdGhlCnVzYWdlIGZvciB0aGUgTGlicmVtNSBkZXZraXQuCgpUaGUgc2VyaWVzIGlzIGJhc2Vk
IG9uIGxpbnV4LW5leHQgYXMgb2YgbmV4dC0yMDIwMDUxMi4KCsK5IGh0dHBzOi8vbG9yZS5rZXJu
ZWwub3JnL2RyaS1kZXZlbC8yMDIwMDQxNTAyMTkwOC5HSDE5ODE5QHBlbmRyYWdvbi5pZGVhc29u
Ym9hcmQuY29tLwoKR3VpZG8gR8O8bnRoZXIgKDYpOgogIGR0LWJpbmRpbmdzOiBkaXNwbGF5L2Jy
aWRnZTogQWRkIGJpbmRpbmcgZm9yIGlucHV0IG11eCBicmlkZ2UKICBkcm0vYnJpZGdlOiBBZGQg
bXV4LWlucHV0IGJyaWRnZQogIGR0LWJpbmRpbmdzOiBkaXNwbGF5L2JyaWRnZS9ud2wtZHNpOiBE
cm9wIG11eCBoYW5kbGluZwogIGRybS9icmlkZ2UvbndsLWRzaTogRHJvcCBtdXggaGFuZGxpbmcK
ICBhcm02NDogZHRzOiBpbXg4bXE6IEFkZCBOV0wgZHNpIGNvbnRyb2xsZXIKICBhcm02NDogZHRz
OiBpbXg4bXEtbGlicmVtNS1kZXZraXQ6IEVuYWJsZSBNSVBJIERTSSBwYW5lbAoKIC4uLi9kaXNw
bGF5L2JyaWRnZS9tdXgtaW5wdXQtYnJpZGdlLnlhbWwgICAgICB8IDEyMyArKysrKysrKysKIC4u
Li9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9ud2wtZHNpLnlhbWwgICAgICB8ICAgNiAtCiAuLi4v
ZHRzL2ZyZWVzY2FsZS9pbXg4bXEtbGlicmVtNS1kZXZraXQuZHRzICAgfCAgODEgKysrKysrCiBh
cmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9pbXg4bXEuZHRzaSAgICAgfCAgMzEgKysrCiBk
cml2ZXJzL2dwdS9kcm0vYnJpZGdlL0tjb25maWcgICAgICAgICAgICAgICAgfCAgMTAgKy0KIGRy
aXZlcnMvZ3B1L2RybS9icmlkZ2UvTWFrZWZpbGUgICAgICAgICAgICAgICB8ICAgMSArCiBkcml2
ZXJzL2dwdS9kcm0vYnJpZGdlL211eC1pbnB1dC5jICAgICAgICAgICAgfCAyMzggKysrKysrKysr
KysrKysrKysrCiBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL253bC1kc2kuYyAgICAgICAgICAgICAg
fCAgNjEgLS0tLS0KIDggZmlsZXMgY2hhbmdlZCwgNDgzIGluc2VydGlvbnMoKyksIDY4IGRlbGV0
aW9ucygtKQogY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9kaXNwbGF5L2JyaWRnZS9tdXgtaW5wdXQtYnJpZGdlLnlhbWwKIGNyZWF0ZSBtb2RlIDEw
MDY0NCBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL211eC1pbnB1dC5jCgotLSAKMi4yNi4xCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
