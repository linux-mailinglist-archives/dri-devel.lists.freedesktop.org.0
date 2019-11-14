Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5F78FC729
	for <lists+dri-devel@lfdr.de>; Thu, 14 Nov 2019 14:17:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81BFE6E2C7;
	Thu, 14 Nov 2019 13:17:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ste-pvt-msa2.bahnhof.se (ste-pvt-msa2.bahnhof.se
 [213.80.101.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D83A6E2C7
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Nov 2019 13:17:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTP id BE5543FABE;
 Thu, 14 Nov 2019 14:17:15 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level: 
X-Spam-Status: No, score=-2.099 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, URIBL_BLOCKED=0.001]
 autolearn=ham autolearn_force=no
Received: from ste-pvt-msa2.bahnhof.se ([127.0.0.1])
 by localhost (ste-ftg-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4e9wIXtPZkHW; Thu, 14 Nov 2019 14:17:14 +0100 (CET)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id E2CC03FA5A;
 Thu, 14 Nov 2019 14:17:13 +0100 (CET)
Received: from localhost.localdomain.localdomain
 (h-205-35.A357.priv.bahnhof.se [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 1E4A3360103;
 Thu, 14 Nov 2019 14:17:13 +0100 (CET)
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m=20=28VMware=29?=
 <thomas_os@shipmail.org>
To: airlied@gmail.com,
	airlied@redhat.com,
	daniel@ffwll.ch
Subject: [git pull] vmwgfx-next
Date: Thu, 14 Nov 2019 14:17:03 +0100
Message-Id: <20191114131703.8607-1-thomas_os@shipmail.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=shipmail.org; s=mail; 
 t=1573737433; bh=9o/POvAFFpQ6r1Ui1vf+dz2eZNuFmLfF67dgbZqUInw=;
 h=From:To:Cc:Subject:Date:From;
 b=JjolzIWDEa/fKJmqaY5/+Wq7lX1q76BnB7v21gBMB9cmR3qhD83a8YsnO3UvudMqP
 OQDyWzdfdT2+VgbdzLJGTr17kDlPcg56J6BuDy8AoieCSnU3ADuFS7B/4+64mpFASU
 97Ty7LT4VGKtcB2+gbvotRwHUa2huW/a2YopvtPw=
X-Mailman-Original-Authentication-Results: ste-pvt-msa2.bahnhof.se;
 dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=JjolzIWD; 
 dkim-atps=neutral
X-Mailman-Original-Authentication-Results: ste-ftg-msa2.bahnhof.se
 (amavisd-new); 
 dkim=pass (1024-bit key) header.d=shipmail.org
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
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas_os@shipmail.org>,
 linux-graphics-maintainer@vmware.com, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RGF2ZSwgRGFuaWVsCgpUd28gbWlub3IgY2xlYW51cHMgLyBmaXhlcyBmb3IgLW5leHQuCgpUaGUg
Zm9sbG93aW5nIGNoYW5nZXMgc2luY2UgY29tbWl0IDNjYTNhOWVhYjcwODViM2M5MzhiNWQwODhj
MzAyMDI2OWNmZWNkYzg6CgogIE1lcmdlIHRhZyAnZHJtLW1pc2MtbmV4dC1maXhlcy0yMDE5LTEx
LTA2JyBvZiBnaXQ6Ly9hbm9uZ2l0LmZyZWVkZXNrdG9wLm9yZy9kcm0vZHJtLW1pc2MgaW50byBk
cm0tbmV4dCAoMjAxOS0xMS0wOCAxNjo0ODoyMiArMTAwMCkKCmFyZSBhdmFpbGFibGUgaW4gdGhl
IEdpdCByZXBvc2l0b3J5IGF0OgoKICBnaXQ6Ly9wZW9wbGUuZnJlZWRlc2t0b3Aub3JnL350aG9t
YXNoL2xpbnV4IHZtd2dmeC1uZXh0Cgpmb3IgeW91IHRvIGZldGNoIGNoYW5nZXMgdXAgdG8gYjQw
MTE2NDRiMDNjMDRiMWE0MjA2ODMxM2M1Yjg5NGRhNDFkMDY5ODoKCiAgZHJtL3Ztd2dmeDogcmVt
b3ZlIHNldCBidXQgbm90IHVzZWQgdmFyaWFibGUgJ3NyZicgKDIwMTktMTEtMTQgMDg6NDE6MzYg
KzAxMDApCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tClRob21hcyBIZWxsc3Ryb20gKDEpOgogICAgICBkcm0vdHRtLCBkcm0v
dm13Z2Z4OiBVc2UgYSBjb25maWd1cmF0aW9uIG9wdGlvbiBmb3IgdGhlIFRUTSBkbWEgcGFnZSBw
b29sCgpZdWVIYWliaW5nICgxKToKICAgICAgZHJtL3Ztd2dmeDogcmVtb3ZlIHNldCBidXQgbm90
IHVzZWQgdmFyaWFibGUgJ3NyZicKCiBkcml2ZXJzL2dwdS9kcm0vS2NvbmZpZyAgICAgICAgICAg
ICAgICAgIHwgNyArKysrKysrCiBkcml2ZXJzL2dwdS9kcm0vdHRtL01ha2VmaWxlICAgICAgICAg
ICAgIHwgNCArKy0tCiBkcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9wYWdlX2FsbG9jX2RtYS5jIHwg
MyAtLS0KIGRyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X2Rydi5jICAgICAgfCAzICstLQog
ZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfc3VyZmFjZS5jICB8IDIgLS0KIGluY2x1ZGUv
ZHJtL3R0bS90dG1fcGFnZV9hbGxvYy5oICAgICAgICAgfCAyICstCiA2IGZpbGVzIGNoYW5nZWQs
IDExIGluc2VydGlvbnMoKyksIDEwIGRlbGV0aW9ucygtKQpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
