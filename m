Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AF2A76703
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jul 2019 15:14:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 180666ED44;
	Fri, 26 Jul 2019 13:14:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CD886ED44
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jul 2019 13:14:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id 2CC44FB07;
 Fri, 26 Jul 2019 15:14:42 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RdK5Fd9fsItN; Fri, 26 Jul 2019 15:14:41 +0200 (CEST)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
 id 0AE6046AA1; Fri, 26 Jul 2019 15:14:40 +0200 (CEST)
From: =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>
To: =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>,
 Purism Kernel Team <kernel@puri.sm>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/4] drm/panel: jh057n00900: Move dsi init sequence to
 prepare
Date: Fri, 26 Jul 2019 15:14:35 +0200
Message-Id: <cover.1564146727.git.agx@sigxcpu.org>
X-Mailer: git-send-email 2.20.1
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

CklmIHRoZSBwYW5lbCBpcyB3cmFwcGVkIGluIGEgcGFuZWxfYnJpZGdlIGl0IGdldHMgcHJlcGFy
KCllZCBiZWZvcmUgdGhlCnVwc3RyZWFtIERTSSBicmlkZ2Ugd2hpY2ggY2FuIGNhdXNlIGhhbmdz
IChlLmcuIHdpdGggaW14LW53bCBzaW5jZSBjbG9ja3MKYXJlIG5vdCBlbmFibGVkIHlldCkuIFRv
IGF2b2lkIHRoaXMgbW92ZSB0aGUgcGFuZWwncyBmaXJzdCBEU0kgYWNjZXNzIHRvCmVuYWJsZSgp
IHNvIHRoZSB1cHN0cmVhbSBicmlkZ2UgY2FuIHByZXBhcmUgdGhlIERTSSBob3N0IGNvbnRyb2xs
ZXIgaW4KaXQncyBwcmVfZW5hYmxlKCkuCgpUaGUgc2Vjb25kIHBhdGNoIG1ha2VzIHRoZSBkaXNh
YmxlKCkgY2FsbCBzeW1tZXRyaWMgdG8gdGhlIGFib3ZlIGFuZCB0aGUgdGhpcmQKb25lIGp1c3Qg
ZWFzZXMgZGVidWdnaW5nLgoKQ2hhbmdlcyBmcm9tIHYxOgoqIEFzIHBlciByZXZpZXcgY29tbWVu
dHMgYnkgU2FtIFJhdm5ib3JnCiAgKiBJZ25vcmUgZmFpbHVyZXMgdG8gZGlzYWJsZSB0aGUgYmFj
a2xpZ2h0IGluIGpoMDU3bl9kaXNhYmxlKCkKICAqIEFkZCAnZHJtL3BhbmVsOiBqaDA1N24wMDkw
MDogVXNlIGRybV9wYW5lbF97dW5wcmVwYXJlLGRpc2FibGV9IGNvbnNpc3RlbnRseScKKiBDb2xs
ZWN0ZWQgUmV2aWV3ZWQtQnk6IFRoYW5rcyBTYW0hCgpUbzogIkd1aWRvIEfDvG50aGVyIiA8YWd4
QHNpZ3hjcHUub3JnPixQdXJpc20gS2VybmVsIFRlYW0gPGtlcm5lbEBwdXJpLnNtPixUaGllcnJ5
IFJlZGluZyA8dGhpZXJyeS5yZWRpbmdAZ21haWwuY29tPixTYW0gUmF2bmJvcmcgPHNhbUByYXZu
Ym9yZy5vcmc+LERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4sRGFuaWVsIFZldHRlciA8
ZGFuaWVsQGZmd2xsLmNoPixkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnLGxpbnV4LWtl
cm5lbEB2Z2VyLmtlcm5lbC5vcmcKCgpHdWlkbyBHw7xudGhlciAoNCk6CiAgZHJtL3BhbmVsOiBq
aDA1N24wMDkwMDogTW92ZSBwYW5lbCBEU0kgaW5pdCB0byBlbmFibGUoKQogIGRybS9wYW5lbDog
amgwNTduMDA5MDA6IE1vdmUgbWlwaV9kc2lfZGNzX3NldF9kaXNwbGF5X29mZiB0byBkaXNhYmxl
KCkKICBkcm0vcGFuZWw6IGpoMDU3bjAwOTAwOiBQcmludCBlcnJvciBjb2RlIG9uIGFsbCBEUk1f
REVWX0VSUk9SKClzCiAgZHJtL3BhbmVsOiBqaDA1N24wMDkwMDogVXNlIGRybV9wYW5lbF97dW5w
cmVwYXJlLGRpc2FibGV9IGNvbnNpc3RlbnRseQoKIC4uLi9kcm0vcGFuZWwvcGFuZWwtcm9ja3Rl
Y2gtamgwNTduMDA5MDAuYyAgICB8IDMxICsrKysrKysrKystLS0tLS0tLS0KIDEgZmlsZSBjaGFu
Z2VkLCAxNyBpbnNlcnRpb25zKCspLCAxNCBkZWxldGlvbnMoLSkKCi0tIAoyLjIwLjEKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
