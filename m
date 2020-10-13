Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A01828CBB4
	for <lists+dri-devel@lfdr.de>; Tue, 13 Oct 2020 12:32:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 597396E0FF;
	Tue, 13 Oct 2020 10:32:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1495A6E0FF
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Oct 2020 10:32:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id A88C9FB06;
 Tue, 13 Oct 2020 12:32:50 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id l9H17qvFqi9u; Tue, 13 Oct 2020 12:32:49 +0200 (CEST)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
 id 86125402F3; Tue, 13 Oct 2020 12:32:48 +0200 (CEST)
From: =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] drm/panel: mantix panel reset fixes
Date: Tue, 13 Oct 2020 12:32:45 +0200
Message-Id: <cover.1602584953.git.agx@sigxcpu.org>
X-Mailer: git-send-email 2.28.0
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

ClRoZSBmaXJzdCBwYXRjaCBpbiB0aGlzIHNlcmllcyBmaXhlcyBkZXJlZmVyZW5jaW5nIGEgTlVM
TCBtb2RlIGluIHRoZSBlcnJvcgpwYXRoLiBUaGUgc2Vjb25kIG9uZSBleHRlbmRzIHRoZSByZXNl
dHMgdG8gbm90IG9ubHkgcmVzZXQgUkVTWCBidXQgYWxzbyBUUF9SU1ROCnNpbmNlIG90aGVyd2lz
ZSB0aGUgZGlzcGxheSB3aWxsIHN0YXkgY29tcGxldGVseSBibGFuay4gSSBkaWRuJ3Qgc3BvdCB0
aGF0CmJlZm9yZSBpbml0aWFsIHN1Ym1pc3Npb24gc2luY2UgdGhlIHJlc2V0IGxpbmUgd2FzIGJv
dW5kIHRvIHRoZSB0b3VjaApjb250cm9sbGVyIGFuZCBhbHRob3VnaCB0aGF0IGZhaWxlZCB0byBw
cm9iZSBpdCBjYW1lIGZhciBlbm91Z2ggdG8gZGVhc3NlcnQgdGhlCnJlc2V0IGxpbmUgKGF0IGFu
IGFyYml0cmFyeSBwb2ludCBpbiB0aW1lIGR1cmluZyBib290KSBhbmQgaGVuY2Ugd2UgZ290IGEK
cGljdHVyZS4gU2luY2UgdG91Y2ggYW5kIHBhbmVsIGFyZSBvbiB0aGUgc2FtZSBJQyB0aGV5J3Jl
IG5vdCBjb21wbGV0ZWx5CmluZGVwZW5kZW50IGFuZCBpIG1pZ2h0IGhhdmUgdG8gdHVybiB0aGUg
d2hvbGUgdGhpbmcgaW50byBhbiBNRkQgYXQgc29tZSBwb2ludApidXQgdGhpcyBzZXJpZXMgZ2V0
cyB0aGUgcGFuZWwgdG8gYSByZWxpYWJseSB3b3JraW5nIHN0YXRlIG9uIGJvb3QgYW5kIG9uIGZi
CmJsYW5rL3VuYmxhbmsuCgpTaW5jZSB0aGUgcmVzZXQtZ3Bpb3MgYXJlIGFjdGl2ZSBsb3cgd2Ug
Y2FuIGRlYXNzZXJ0IGluIHByZXBhcmUgYW5kIGFzc2VydCBpbgp1bnByZXBhcmUgc2ltcGxpZnlp
bmcgdGhlIGNvZGUgbWFraW5nIHN1cmUgbGluZXMgYXJlIGtlcHQgbG93IHdoZW4gdGhlCnBhbmVs
IGlzIG9mZi4KClRoZSBiaW5kaW5nIHdlcmUgbm90IHBhcnQgb2YgYSBzdGFibGUga2VybmVsIHNv
IEkgaG9wZSBpdCdzIG9rYXkgdG8gbm90IHdvcnJ5CmFib3V0IGJhY2t3YXJkIGNvbXBhdGliaWxp
dHkuCgpDaGFuZ2VzIGZyb20gdjE6CiAtIEFzIHBlciByZXZpZXcgY29tbWVudHMgYnkgRmFiaW8g
RXN0ZXZhbQogICBodHRwczovL2xvcmUua2VybmVsLm9yZy9kcmktZGV2ZWwvQ0FPTVpPNUI1RUNj
Q29udktlaj1SY2FGOHd2T3hncTduVXpLSi1hZDBhU0FPelVxdGJRQG1haWwuZ21haWwuY29tLwog
ICAtIEZpeCB0eXBvIGluIGNvbW1pdCBtZXNzYWdlcwogLSBBcyBwZXIgcmV2aWV3IGNvbW1lbnRz
IGJ5IFJvYiBIZXJyaW5nCiAgIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2RyaS1kZXZlbC8yMDIw
MDkyOTE3NDYyNC5HQTgzMjMzMkBib2d1cy8KICAgLSBEb24ndCB1c2UgYW4gYXJyYXkgb2YgcmVz
ZXQgbGluZXMKCkd1aWRvIEfDvG50aGVyICgzKToKICBkcm0vcGFuZWw6IG1hbnRpeDogRG9uJ3Qg
ZGVyZWZlcmVuY2UgTlVMTCBtb2RlCiAgZHJtL3BhbmVsOiBtYW50aXg6IEZpeCBwYW5lbCByZXNl
dAogIGR0LWJpbmRpbmc6IGRpc3BsYXk6IFJlcXVpcmUgdHdvIHJlc2V0cyBvbiBtYW50aXggcGFu
ZWwKCiAuLi4vZGlzcGxheS9wYW5lbC9tYW50aXgsbWxhZjA1N3dlNTEteC55YW1sICAgfCAgNCAr
KysKIC4uLi9ncHUvZHJtL3BhbmVsL3BhbmVsLW1hbnRpeC1tbGFmMDU3d2U1MS5jICB8IDI1ICsr
KysrKysrKysrKystLS0tLS0KIDIgZmlsZXMgY2hhbmdlZCwgMjEgaW5zZXJ0aW9ucygrKSwgOCBk
ZWxldGlvbnMoLSkKCi0tIAoyLjI4LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbAo=
