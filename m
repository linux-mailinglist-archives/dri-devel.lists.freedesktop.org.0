Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 50943116F3F
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2019 15:42:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB3F56E488;
	Mon,  9 Dec 2019 14:42:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9EA06E47B
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Dec 2019 14:42:29 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id xB9EgK4k048715;
 Mon, 9 Dec 2019 08:42:20 -0600
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xB9EgKKl074901
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 9 Dec 2019 08:42:20 -0600
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 9 Dec
 2019 08:42:19 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 9 Dec 2019 08:42:19 -0600
Received: from jadmar.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id xB9EgGve122297;
 Mon, 9 Dec 2019 08:42:17 -0600
From: Jyri Sarha <jsarha@ti.com>
To: <dri-devel@lists.freedesktop.org>, <tony@atomide.com>, <sam@ravnborg.org>, 
 <robh+dt@kernel.org>, <devicetree@vger.kernel.org>,
 <linux-omap@vger.kernel.org>
Subject: [PATCH v2 0/3] drm/tilcdc: Remove "ti, tilcdc, tfp410" and mark "ti,
 tilcdc, panel" obsolete
Date: Mon, 9 Dec 2019 16:42:13 +0200
Message-ID: <cover.1575901747.git.jsarha@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1575902540;
 bh=iIPdTi3vkObZXA5TwQ23lL3Sn4gIOMSE9/ixyE3RfWc=;
 h=From:To:CC:Subject:Date;
 b=ibA8c8hrTE5yVO7Bk4hpX8ew1i7BowlvdOLgBfo+pbE7G6qscbIKfGyNptot88Vc5
 645l4Q77fe01tcKUDwpkCB+T+QgM/CdK1oMy+Iotw4oVCiBCCvnWyfbwaSbKMboHqN
 cTe7fUa0auWNt/7a2XDz06FI7DQQCUxC2StSxrc0=
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
Cc: peter.ujfalusi@ti.com, tomi.valkeinen@ti.com,
 laurent.pinchart@ideasonboard.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U2luY2UgdjE6Ci0gQWRkIFJldmlld2VkLWJ5OiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBp
bmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+CiAgdG8gImRybS90aWxjZGM6IFJlbW92ZSBvYnNvbGV0
ZSBidW5kbGVkIHRpbGNkYyB0ZnA0MTAgZHJpdmVyIgotIEFkZCAiZHJtL3RpbGNkYzogcGFuZWw6
IEFkZCBXQVJOKCkgd2l0aCBhIGNvbW1lbnQgdG8gdGlsY2RjLXBhbmVsIHByb2JlIgoKTm9ib2R5
IHNob3VsZCBhbnkgbW9yZSB1c2UgdGhlIG9sZCB0aWxjZGMgYnVuZGxlZCBkcml2ZXJzIGFueW1v
cmUuIFRoZQpkcml2ZXIgaXMgZnVsbHkgY2FwYWJsZSBvZiB1c2luZyB0aGUgZ2VuZXJpYyBkcm0g
YnJpZGdlIGFuZCBwYW5lbApkcml2ZXJzLiAgSG93ZXZlciwgdGhlIG9ic29sZXRlICJ0aSx0aWxj
ZGMscGFuZWwiIGJpbmRpbmcgaXMgc3RpbGwKd2lkZWx5IHVzZWQgaW4gbWFueSBtYWlubGluZSBz
dXBwb3J0ZWQgcGxhdGZvcm1zIHRoYXQgSSBkbyBub3QgaGF2ZQphY2Nlc3MgdG8gYW5kIHdobyBr
bm93cyBob3cgbWFueSBjdXN0b20gcGxhdGZvcm1zLiBTbyBJIGFtIGFmcmFpZCB3ZQpoYXZlIHRv
IGtlZXAgdGhlIG9sZCBidW5kbGVkIHRpbGNkYyBwYW5lbCBkcml2ZXIgYXJvdW5kLgoKSSdsbCB3
YWl0IHdpdGggbWVyZ2luZyB0aGUgInRpLHRpbGNkYyxwYW5lbCIgcGF0Y2hlcyB1bnRpbCB0aGVz
ZQpwYXRjaGVzIGhhdmUgYmVlbiBtZXJnZWQ6Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L2FyY2hpdmVzL2RyaS1kZXZlbC8yMDE5LURlY2VtYmVyLzI0NzMwMS5odG1sCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL2FyY2hpdmVzL2RyaS1kZXZlbC8yMDE5LURlY2VtYmVyLzI0NzU5
NC5odG1sClNvIEkgY2FuIHJlZmVyIHRvIHRoZW0gYXMgYW4gZXhhbXBsZSBpbiB0aGUgY29tbWVu
dHMuIAoKQnV0IEknbGwgbWVyZ2UgImRybS90aWxjZGM6IFJlbW92ZSBvYnNvbGV0ZSBidW5kbGVk
IHRpbGNkYyB0ZnA0MTAKZHJpdmVyIiB0cm91Z2ggZHJtLW1pc2MgaW4gY291cGxlIGRheXMgaWYg
SSBkbyBub3QgaGVhciBhbnkKb2JqZWN0aW9ucy4KCkp5cmkgU2FyaGEgKDMpOgogIGRybS90aWxj
ZGM6IFJlbW92ZSBvYnNvbGV0ZSBidW5kbGVkIHRpbGNkYyB0ZnA0MTAgZHJpdmVyCiAgZHQtYmlu
ZGluZ3M6IGRpc3BsYXk6IEFkZCBvYnNvbGV0ZSBub3RlIHRvICJ0aSx0aWxjZGMscGFuZWwiIGJp
bmRpbmcKICBkcm0vdGlsY2RjOiBwYW5lbDogQWRkIFdBUk4oKSB3aXRoIGEgY29tbWVudCB0byB0
aWxjZGMtcGFuZWwgcHJvYmUKCiAuLi4vYmluZGluZ3MvZGlzcGxheS90aWxjZGMvcGFuZWwudHh0
ICAgICAgICAgfCAgIDYgKwogLi4uL2JpbmRpbmdzL2Rpc3BsYXkvdGlsY2RjL3RmcDQxMC50eHQg
ICAgICAgIHwgIDIxIC0KIGRyaXZlcnMvZ3B1L2RybS90aWxjZGMvTWFrZWZpbGUgICAgICAgICAg
ICAgICB8ICAgMSAtCiBkcml2ZXJzL2dwdS9kcm0vdGlsY2RjL3RpbGNkY19kcnYuYyAgICAgICAg
ICAgfCAgIDMgLQogZHJpdmVycy9ncHUvZHJtL3RpbGNkYy90aWxjZGNfcGFuZWwuYyAgICAgICAg
IHwgIDEwICsKIGRyaXZlcnMvZ3B1L2RybS90aWxjZGMvdGlsY2RjX3RmcDQxMC5jICAgICAgICB8
IDM3OSAtLS0tLS0tLS0tLS0tLS0tLS0KIGRyaXZlcnMvZ3B1L2RybS90aWxjZGMvdGlsY2RjX3Rm
cDQxMC5oICAgICAgICB8ICAxNSAtCiA3IGZpbGVzIGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKyks
IDQxOSBkZWxldGlvbnMoLSkKIGRlbGV0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvZGlzcGxheS90aWxjZGMvdGZwNDEwLnR4dAogZGVsZXRlIG1vZGUgMTAw
NjQ0IGRyaXZlcnMvZ3B1L2RybS90aWxjZGMvdGlsY2RjX3RmcDQxMC5jCiBkZWxldGUgbW9kZSAx
MDA2NDQgZHJpdmVycy9ncHUvZHJtL3RpbGNkYy90aWxjZGNfdGZwNDEwLmgKCi0tIApUZXhhcyBJ
bnN0cnVtZW50cyBGaW5sYW5kIE95LCBQb3Jra2FsYW5rYXR1IDIyLCAwMDE4MCBIZWxzaW5raS4g
WS10dW5udXMvQnVzaW5lc3MgSUQ6IDA2MTU1MjEtNC4gS290aXBhaWtrYS9Eb21pY2lsZTogSGVs
c2lua2kKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
