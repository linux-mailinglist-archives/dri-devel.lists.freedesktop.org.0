Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09AF98E551
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2019 09:16:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FD856E8B2;
	Thu, 15 Aug 2019 07:16:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ste-pvt-msa2.bahnhof.se (ste-pvt-msa2.bahnhof.se
 [213.80.101.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E91176E8B2
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Aug 2019 07:16:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTP id F23603F6DE;
 Thu, 15 Aug 2019 09:16:20 +0200 (CEST)
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
 with ESMTP id o15tCD4J1bsB; Thu, 15 Aug 2019 09:16:15 +0200 (CEST)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id 90B1F3F3E2;
 Thu, 15 Aug 2019 09:16:14 +0200 (CEST)
Received: from localhost.localdomain.localdomain
 (h-205-35.A357.priv.bahnhof.se [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 088EA36100A;
 Thu, 15 Aug 2019 09:16:14 +0200 (CEST)
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m=20=28VMware=29?= <thomas@shipmail.org>
To: airlied@gmail.com,
	daniel@ffwll.ch,
	dri-devel@lists.freedesktop.org
Subject: [git pull] vmwgfx-next
Date: Thu, 15 Aug 2019 09:15:58 +0200
Message-Id: <20190815071558.37481-1-thomas@shipmail.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=shipmail.org; s=mail; 
 t=1565853374; bh=k4UZDS8EnDcWqk36jW3ozbfQuJ9oEm/kL2DUyyj9w1o=;
 h=From:To:Cc:Subject:Date:From;
 b=fuVYvu8i+xioJtHDv+RMW8Vln4caE5cC4ilzNiIZoWqNUpYGOjxi4PHC9BNbhbJ82
 DPe0ksgHIstngsdHiyEyM7O1LdiYcQHUcQnWkZKt0QjQ/e2avS7C4qgSyUBWkQkRH5
 k9cp1SvvvCO0918Z9aMTGC+HAYaqF1RWnQDabgQs=
X-Mailman-Original-Authentication-Results: ste-pvt-msa2.bahnhof.se;
 dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=fuVYvu8i; 
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
Cc: pv-drivers@vmware.com, Thomas Hellstrom <thomas@shipmail.org>,
 linux-graphics-maintainer@vmware.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVGhvbWFzIEhlbGxzdHJvbSAoVk13YXJlKSA8dGhvbWFzQHNoaXBtYWlsLm9yZz4KCkRh
dmUsIERhbmllbAoKQSBjb3VwbGUgb2YgaW5kZXBlbmRlbnQgcGF0Y2hlcyBleHRyYWN0ZWQgZnJv
bSB0aGUgNS4zIHB1bGwgcmVxdWVzdCwgZml4ZWQgZm9yCm1lcmdlIGNvbmZsaWN0cyBhbmQgYSBz
aW5nbGUgdW51c2VkIHZhcmlhYmxlIHdhcm5pbmcuCgpBbmQgdGhlIGRybVAuaCByZW1vdmFsIGZy
b20gU2FtLgoKL1Rob21hcwoKVGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCBlN2Y3
Mjg3YmY1Zjc0NmQyOWYzNjA3MTc4ODUxMjQ2YTAwNWRkMzk4OgoKICBNZXJnZSB0YWcgJ2RybS1u
ZXh0LTUuNC0yMDE5LTA4LTA5JyBvZiBnaXQ6Ly9wZW9wbGUuZnJlZWRlc2t0b3Aub3JnL35hZ2Q1
Zi9saW51eCBpbnRvIGRybS1uZXh0ICgyMDE5LTA4LTEyIDE0OjIwOjIxICsxMDAwKQoKYXJlIGF2
YWlsYWJsZSBpbiB0aGUgR2l0IHJlcG9zaXRvcnkgYXQ6CgogIGdpdDovL3Blb3BsZS5mcmVlZGVz
a3RvcC5vcmcvfnRob21hc2gvbGludXgvIHZtd2dmeC1uZXh0Cgpmb3IgeW91IHRvIGZldGNoIGNo
YW5nZXMgdXAgdG8gYTBhNjM5NDBiMGM5ZWJjNmQzMTU2YmJmZTBjMmNmNzU2MGI1ODBjZDoKCiAg
ZHJtL3Ztd2dmeDogQXNzaWduIGV2aWN0aW9uIHByaW9yaXRpZXMgdG8gcmVzb3VyY2VzICgyMDE5
LTA4LTE1IDA4OjQwOjA1ICswMjAwKQoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpEZWVwYWsgUmF3YXQgKDIpOgogICAgICBk
cm0vdm13Z2Z4OiBBZGQgZGVidWcgbWVzc2FnZSBmb3IgbGF5b3V0IGNoYW5nZSBpb2N0bAogICAg
ICBkcm0vdm13Z2Z4OiBVc2UgVk1XX0RFQlVHX0tNUyBmb3Igdm13Z2Z4IG1vZGUtc2V0dGluZyB1
c2VyIGVycm9ycwoKU2FtIFJhdm5ib3JnICgyKToKICAgICAgZHJtL3Ztd2dmeDogZHJvcCB1c2Ug
b2YgZHJtUC5oIGluIGhlYWRlciBmaWxlcwogICAgICBkcm0vdm13Z2Z4OiBkcm9wIHJlbWluYWlu
ZyB1c2VycyBvZiBkcm1QLmgKClRob21hcyBIZWxsc3Ryb20gKDIpOgogICAgICBkcm0vdm13Z2Z4
OiBLaWxsIHVubmVlZGVkIGxlZ2FjeSBzZWN1cml0eSBmZWF0dXJlcwogICAgICBkcm0vdm13Z2Z4
OiBBc3NpZ24gZXZpY3Rpb24gcHJpb3JpdGllcyB0byByZXNvdXJjZXMKCiBkcml2ZXJzL2dwdS9k
cm0vdm13Z2Z4L3R0bV9sb2NrLmMgICAgICAgICAgICAgfCAxMDAgLS0tLS0tLS0tLS0tLS0KIGRy
aXZlcnMvZ3B1L2RybS92bXdnZngvdHRtX2xvY2suaCAgICAgICAgICAgICB8ICAzMiArLS0tLQog
ZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC90dG1fb2JqZWN0LmggICAgICAgICAgIHwgICA3ICstCiBk
cml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9iaW5kaW5nLmggICAgICAgfCAgIDMgKy0KIGRy
aXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X2JvLmMgICAgICAgICAgICB8ICAgMyArLQogZHJp
dmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfY21kYnVmLmMgICAgICAgIHwgICAzICsKIGRyaXZl
cnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X2NvbnRleHQuYyAgICAgICB8ICAgNCArCiBkcml2ZXJz
L2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9jb3RhYmxlLmMgICAgICAgfCAgMTMgKy0KIGRyaXZlcnMv
Z3B1L2RybS92bXdnZngvdm13Z2Z4X2Rydi5jICAgICAgICAgICB8IDE4MCArKy0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLQogZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfZHJ2LmggICAgICAg
ICAgIHwgMTI2ICsrKysrKysrKysrKysrLS0tLQogZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdn
ZnhfZmIuYyAgICAgICAgICAgIHwgICA4ICstCiBkcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dm
eF9mZW5jZS5jICAgICAgICAgfCAgIDMgKy0KIGRyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4
X2ZlbmNlLmggICAgICAgICB8ICAgNSArLQogZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhf
Zmlmby5jICAgICAgICAgIHwgICA2ICstCiBkcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9n
bXIuYyAgICAgICAgICAgfCAgIDQgKy0KIGRyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X2ly
cS5jICAgICAgICAgICB8ICAgMyArLQogZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfa21z
LmMgICAgICAgICAgIHwgIDMzICsrKy0tCiBkcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9r
bXMuaCAgICAgICAgICAgfCAgIDIgKy0KIGRyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X2xk
dS5jICAgICAgICAgICB8ICAgNiArLQogZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfbW9i
LmMgICAgICAgICAgIHwgICAyICsKIGRyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X21zZy5j
ICAgICAgICAgICB8ICAxMSArLQogZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfb3Zlcmxh
eS5jICAgICAgIHwgICA2ICstCiBkcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9yZXNvdXJj
ZS5jICAgICAgfCAgNjAgKysrKysrLS0tCiBkcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9y
ZXNvdXJjZV9wcml2LmggfCAgIDIgKwogZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfc2Ny
bi5jICAgICAgICAgIHwgICA2ICstCiBkcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9zaGFk
ZXIuYyAgICAgICAgfCAgIDggKy0KIGRyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X3N0ZHUu
YyAgICAgICAgICB8ICAgOSArLQogZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfc3VyZmFj
ZS5jICAgICAgIHwgIDEwICstCiBkcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF90dG1fZ2x1
ZS5jICAgICAgfCAgIDEgLQogZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfdmFsaWRhdGlv
bi5oICAgIHwgICAzICstCiAzMCBmaWxlcyBjaGFuZ2VkLCAyNjQgaW5zZXJ0aW9ucygrKSwgMzk1
IGRlbGV0aW9ucygtKQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
