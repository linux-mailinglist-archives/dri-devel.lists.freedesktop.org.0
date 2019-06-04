Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF8B034A56
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jun 2019 16:26:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94AC0899D6;
	Tue,  4 Jun 2019 14:26:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo6-p01-ob.smtp.rzone.de (mo6-p01-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5301::12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AAF18982C
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jun 2019 12:53:49 +0000 (UTC)
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o12DNOsPj0pAzTh/eDM="
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box by smtp.strato.de (RZmta 44.22 DYNA|AUTH)
 with ESMTPSA id i01b98v54CrZ7YA
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with
 521 ECDH bits, eq. 15360 bits RSA))
 (Client did not present a certificate);
 Tue, 4 Jun 2019 14:53:35 +0200 (CEST)
From: "H. Nikolaus Schaller" <hns@goldelico.com>
To: Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, tomi.valkeinen@ti.com,
 marek.belisko@gmail.com
Subject: [PATCH 0/2] drm/panel-simple: Add panel parameters for
 ortustech-com37h3m05dtc/99dtc and sharp-lq070y3dg3b
Date: Tue,  4 Jun 2019 14:53:32 +0200
Message-Id: <cover.1559652814.git.hns@goldelico.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 04 Jun 2019 14:26:35 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 t=1559652827; 
 s=strato-dkim-0002; d=goldelico.com;
 h=Message-Id:Date:Subject:Cc:To:From:X-RZG-CLASS-ID:X-RZG-AUTH:From:
 Subject:Sender;
 bh=h/olzvx6AHUnjyG3bvwHdKbqZ3KevZuFbh4sUPMSXZI=;
 b=cKFZS3gvg7vSWfIv6glmS4DYDCgWGzI9MIXFHkCaswyqm7JV29zWs0WgoDEUPgp/aE
 1oP4Q9Gr0KjORzjXAFMpTABHG8i159Hiw5VKBMl6JYh7Gr2mENOFYGnJjN/4IUyirR0o
 klXcGRFp3LBJGp16o6hBP5O92Eh0roIXshkGPyE01BJUD85UAsigBrnpSKTHOi/8/H/o
 fjeVWsbLsOF8fPN+RbrJARSAKpB99GIEWRvx1uuWXiRimzleQbstLVAOfC7t25YcG6v+
 g+RmhRj+nX5WlgSMR/QrU99K+JcbDKqCj74MFDAVoKQQBHvTebhtCgXT+OYKykis7OMf
 UxWA==
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
Cc: "H. Nikolaus Schaller" <hns@goldelico.com>, linux-omap@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U2luY2UgdjUuMi1yYzEgT01BUCBpcyBubyBsb25nZXIgdXNpbmcgYSBzcGVjaWFsIGRpc3BsYXkg
ZHJpdmVyIGFyY2hpdGVjdHVyZQpmb3IgRFBJIHBhbmVscywgYnV0IHVzZXMgdGhlIGdlbmVyYWwg
ZHJtL3BhbmVsL3BhbmVsLXNpbXBsZS4KClNvIHdlIGZpbmFsbHkgY2FuIGFkZCBTb0MgaW5kZXBl
bmRlbnQgcGFuZWwgZGVmaW5pdGlvbnMgZm9yIHR3byBwYW5lbCBtb2RlbHMKd2hpY2ggd2UgYWxy
ZWFkeSBoYWQgd29ya2VkIG9uIHF1aXRlIGEgd2hpbGUgYWdvIChiZWZvcmUgZGV2aWNlIHRyZWUg
d2FzCmludHJvZHVjZWQpOgoKCWh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcGF0Y2gvMjg1
MTI5NS8KCgoKSC4gTmlrb2xhdXMgU2NoYWxsZXIgKDIpOgogIGRybS9wYW5lbDogc2ltcGxlOiBB
ZGQgU2hhcnAgTFEwNzBZM0RHM0IgcGFuZWwgc3VwcG9ydAogIGRybS9wYW5lbDogc2ltcGxlOiBB
ZGQgT3J0dXN0ZWNoIENPTTM3SDNNIHBhbmVsIHN1cHBvcnQKCiBkcml2ZXJzL2dwdS9kcm0vcGFu
ZWwvcGFuZWwtc2ltcGxlLmMgfCA2MyArKysrKysrKysrKysrKysrKysrKysrKysrKysrCiAxIGZp
bGUgY2hhbmdlZCwgNjMgaW5zZXJ0aW9ucygrKQoKLS0gCjIuMTkuMQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
