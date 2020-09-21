Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF5FC272F42
	for <lists+dri-devel@lfdr.de>; Mon, 21 Sep 2020 18:56:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBE4F89DA8;
	Mon, 21 Sep 2020 16:56:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEC496E06D
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Sep 2020 16:55:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id F3B25FB06;
 Mon, 21 Sep 2020 18:55:54 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PwhMdxTLLlij; Mon, 21 Sep 2020 18:55:53 +0200 (CEST)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
 id EFE46457CC; Mon, 21 Sep 2020 18:55:52 +0200 (CEST)
From: =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [RFC PATCH v1 0/3] drm/panel: mantix panel reset fixes
Date: Mon, 21 Sep 2020 18:55:49 +0200
Message-Id: <cover.1600707235.git.agx@sigxcpu.org>
X-Mailer: git-send-email 2.26.2
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

ClBvc3RpbmcgYXMgUkZDIHNpbmNlIEknbSBub3Qgc3VyZSBob3cgdG8gaGFuZGxlIHRoZSBiaW5k
aW5ncywgcGxlYXNlIHNlZSBiZWxvdy4KClRoZSBmaXJzdCBwYXRjaCBpbiB0aGlzIHNlcmllcyBm
aXhlcyBkZXJlZmVyZW5jaW5nIGEgTlVMTCBtb2RlIGluIHRoZSBlcnJvcgpwYXRoLiBUaGUgc2Vj
b25kIG9uZSBleHRlbmRzIHRoZSByZXNldHMgdG8gbm90IG9ubHkgcmVzZXQgUkVTWCBidXQgYWxz
byBUUF9SU1ROCnNpbmNlIG90aGVyd2lzZSB0aGUgZGlzcGxheSB3aWxsIHN0YXkgY29tcGxldGVs
eSBibGFuay4gSSBkaWRuJ3Qgc3BvdCB0aGF0CmJlZm9yZSBpbml0aWFsIHN1Ym1pc3Npb24gc2lu
Y2UgdGhlIHJlc2V0IGxpbmUgd2FzIGJvdW5kIHRvIHRoZSB0b3VjaApjb250cm9sbGVyIGFuZCBh
bHRob3VnaCB0aGF0IGZhaWxlZCB0byBwcm9iZSBpdCBjYW1lIGZhciBlbm91Z2ggdG8gZGVhc3Nl
cnQgdGhlCnJlc2V0IGxpbmUgKGF0IGFuIGFyYml0cmFyeSBwb2ludCBpbiB0aW1lIGR1cmluZyBi
b290KSBhbmQgaGVuY2Ugd2UgZ290IGEKcGljdHVyZS4gU2luY2UgdG91Y2ggYW5kIHBhbmVsIGFy
ZSBvbiB0aGUgc2FtZSBJQyB0aGV5J3JlIG5vdCBjb21wbGV0ZWx5CmluZGVwZW5kZW50IGFuZCBp
IG1pZ2h0IGhhdmUgdG8gdHVybiB0aGUgd2hvbGUgdGhpbmcgaW50byBhbiBNRkQgYXQgc29tZSBw
b2ludApidXQgdGhpcyBzZXJpZXMgZ2V0cyB0aGUgcGFuZWwgdG8gYSByZWxpYWJseSB3b3JraW5n
IHN0YXRlIG9uIGJvb3QgYW5kIG9uIGZiCmJsYW5rL3VuYmxhbmsuCgpTaW5jZSB0aGUgcmVzZXQt
Z3Bpb3MgYXJlIGFjdGl2ZSBsb3cgd2UgY2FuIGRlYXNzZXJ0IGluIHByZXBhcmUgYW5kIGFzc2Vy
dCBpbgp1bnByZXBhcmUgc2ltcGxpZnlpbmcgdGhlIGNvZGUgbWFraW5nIHN1cmUgbGluZXMgYXJl
IGtlcHQgbG93IHdoZW4gdGhlCnBhbmVsIGlzIG9mZi4KCkFzIGZvciB0aGUgYmluZGluZ3MgaXQg
c2VlbXMgSSBjYW4ndCBvdmVycmlkZSB0aGUgbWF4SXRlbXMgb2YgcmVzZXQtZ3Bpb3Mgc2luY2UK
dGhhdCBpcyBhbHJlYWR5IHNldCBpbiBiaW5kaW5ncy9kaXNwbGF5L3BhbmVsL3BhbmVsLWNvbW1v
bi55YW1sIHRvIG1heEl0ZW1zOgoxYC4gIElzIHRoZXJlIGEgd2F5IHRvIGRvIHRoYXQgaW5zdGVh
ZCBvZiBzaWRlIHN0ZXBwaW5nIHRoZSBpc3N1ZSBhbmQgdXNpbmcKYSBkaWZmZXJlbnQgbmFtZSBv
ciB1c2luZyBlbmFibGUtZ3Bpb3MgZm9yIG9uZSBvZiB0aGVtIG9yIGZvcmNpbmcgZXZlcnlvbmUg
ZWxzZQp0byBzZXQgYG1heEl0ZW1zOiAxYD8KClRoZSBiaW5kaW5nIHdlcmUgbm90IHBhcnQgb2Yg
YSBzdGFibGUga2VybmVsIHNvIEkgaG9wZSBpdCdzIG9rYXkgdG8gbm90IHdvcnJ5CmFib3V0IGJh
Y2t3YXJkIGNvbXBhdGliaWxpdHkuCgpHdWlkbyBHw7xudGhlciAoMyk6CiAgZHJtL3BhbmVsOiBt
YW50aXg6IERvbid0IGRlcmVmZXJlbmNlIE5VTEwgbW9kZQogIGRybS9wYW5lbDogbWFudGl4OiBG
aXggcGFuZWwgcmVzZXQKICBkdC1iaW5kaW5nOiBkaXNwbGF5OiBSZXF1aXJlIHR3byByZXN0cyBv
biBtYW50aXggcGFuZWwKCiAuLi4vZGlzcGxheS9wYW5lbC9tYW50aXgsbWxhZjA1N3dlNTEteC55
YW1sICAgfCAgNyArKystCiAuLi4vZ3B1L2RybS9wYW5lbC9wYW5lbC1tYW50aXgtbWxhZjA1N3dl
NTEuYyAgfCAzOSArKysrKysrKysrKystLS0tLS0tCiAyIGZpbGVzIGNoYW5nZWQsIDMwIGluc2Vy
dGlvbnMoKyksIDE2IGRlbGV0aW9ucygtKQoKLS0gCjIuMjYuMgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
