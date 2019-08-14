Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 87B758CD10
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2019 09:40:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AA6789971;
	Wed, 14 Aug 2019 07:40:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 484 seconds by postgrey-1.36 at gabe;
 Wed, 14 Aug 2019 07:40:27 UTC
Received: from ste-pvt-msa2.bahnhof.se (ste-pvt-msa2.bahnhof.se
 [213.80.101.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C08F289971
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2019 07:40:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTP id D31CF3FA22;
 Wed, 14 Aug 2019 09:32:15 +0200 (CEST)
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
 with ESMTP id oLFzjp2Le8ap; Wed, 14 Aug 2019 09:32:12 +0200 (CEST)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id 623C23FA1B;
 Wed, 14 Aug 2019 09:32:10 +0200 (CEST)
Received: from localhost.localdomain.localdomain
 (h-205-35.A357.priv.bahnhof.se [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 93BF23604FE;
 Wed, 14 Aug 2019 09:32:10 +0200 (CEST)
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m=20=28VMware=29?= <thomas@shipmail.org>
To: airlied@gmail.com,
	daniel@ffwll.ch,
	dri-devel@lists.freedesktop.org
Subject: [git pull] vmwgfx-next
Date: Wed, 14 Aug 2019 09:31:52 +0200
Message-Id: <20190814073152.3120-1-thomas@shipmail.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=shipmail.org; s=mail; 
 t=1565767930; bh=nS0L57SvgX5LLWIE9Rg/nqxsugihufczO7+OSvTGa1E=;
 h=From:To:Cc:Subject:Date:From;
 b=VG6ghK+9vWW343WzEBrkqJlHmU44OKzQ8/3v6ATnBTgkp/pYmQEoptv4CMvEPY4jQ
 kd27UIzPDc5aC/LpLqpsPSIvXOWSe4zbDHytFisPe+IZduZEA8DfxBup8PBiecr2Lj
 18lb+ED/fpKG9AHKXdoFEXVPYO6OPFtz3kgrINC0=
X-Mailman-Original-Authentication-Results: ste-pvt-msa2.bahnhof.se;
 dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=VG6ghK+9; 
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
bSB0aGUgNS4zIHB1bGwgcmVxdWVzdCwgZml4ZWQgZm9yCm1lcmdlIGNvbmZsaWN0cy4KCkFuZCB0
aGUgZHJtUC5oIHJlbW92YWwgZnJvbSBTYW0uCgovVGhvbWFzCgpUaGUgZm9sbG93aW5nIGNoYW5n
ZXMgc2luY2UgY29tbWl0IGU3ZjcyODdiZjVmNzQ2ZDI5ZjM2MDcxNzg4NTEyNDZhMDA1ZGQzOTg6
CgogIE1lcmdlIHRhZyAnZHJtLW5leHQtNS40LTIwMTktMDgtMDknIG9mIGdpdDovL3Blb3BsZS5m
cmVlZGVza3RvcC5vcmcvfmFnZDVmL2xpbnV4IGludG8gZHJtLW5leHQgKDIwMTktMDgtMTIgMTQ6
MjA6MjEgKzEwMDApCgphcmUgYXZhaWxhYmxlIGluIHRoZSBHaXQgcmVwb3NpdG9yeSBhdDoKCiAg
Z2l0Oi8vcGVvcGxlLmZyZWVkZXNrdG9wLm9yZy9+dGhvbWFzaC9saW51eC8gdm13Z2Z4LW5leHQK
CmZvciB5b3UgdG8gZmV0Y2ggY2hhbmdlcyB1cCB0byBhNDUxM2RhYWFiNWM1YzFlNmJjN2MxZmRh
OTMyYTg4YzYyZWJkYTQzOgoKICBkcm0vdm13Z2Z4OiBBc3NpZ24gZXZpY3Rpb24gcHJpb3JpdGll
cyB0byByZXNvdXJjZXMgKDIwMTktMDgtMTQgMDk6MTg6NDEgKzAyMDApCgotLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCkRlZXBh
ayBSYXdhdCAoMik6CiAgICAgIGRybS92bXdnZng6IEFkZCBkZWJ1ZyBtZXNzYWdlIGZvciBsYXlv
dXQgY2hhbmdlIGlvY3RsCiAgICAgIGRybS92bXdnZng6IFVzZSBWTVdfREVCVUdfS01TIGZvciB2
bXdnZnggbW9kZS1zZXR0aW5nIHVzZXIgZXJyb3JzCgpTYW0gUmF2bmJvcmcgKDIpOgogICAgICBk
cm0vdm13Z2Z4OiBkcm9wIHVzZSBvZiBkcm1QLmggaW4gaGVhZGVyIGZpbGVzCiAgICAgIGRybS92
bXdnZng6IGRyb3AgcmVtaW5haW5nIHVzZXJzIG9mIGRybVAuaAoKVGhvbWFzIEhlbGxzdHJvbSAo
Mik6CiAgICAgIGRybS92bXdnZng6IEtpbGwgdW5uZWVkZWQgbGVnYWN5IHNlY3VyaXR5IGZlYXR1
cmVzCiAgICAgIGRybS92bXdnZng6IEFzc2lnbiBldmljdGlvbiBwcmlvcml0aWVzIHRvIHJlc291
cmNlcwoKIGRyaXZlcnMvZ3B1L2RybS92bXdnZngvdHRtX2xvY2suYyAgICAgICAgICAgICB8IDEw
MCAtLS0tLS0tLS0tLS0tLQogZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC90dG1fbG9jay5oICAgICAg
ICAgICAgIHwgIDMyICstLS0tCiBkcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3R0bV9vYmplY3QuaCAg
ICAgICAgICAgfCAgIDcgKy0KIGRyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X2JpbmRpbmcu
aCAgICAgICB8ICAgMyArLQogZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfYm8uYyAgICAg
ICAgICAgIHwgICAzICstCiBkcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9jbWRidWYuYyAg
ICAgICAgfCAgIDMgKwogZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfY29udGV4dC5jICAg
ICAgIHwgICA0ICsKIGRyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X2NvdGFibGUuYyAgICAg
ICB8ICAxMyArLQogZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfZHJ2LmMgICAgICAgICAg
IHwgMTc5ICsrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCiBkcml2ZXJzL2dwdS9kcm0vdm13Z2Z4
L3Ztd2dmeF9kcnYuaCAgICAgICAgICAgfCAxMjYgKysrKysrKysrKysrKystLS0tCiBkcml2ZXJz
L2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9mYi5jICAgICAgICAgICAgfCAgIDggKy0KIGRyaXZlcnMv
Z3B1L2RybS92bXdnZngvdm13Z2Z4X2ZlbmNlLmMgICAgICAgICB8ICAgMyArLQogZHJpdmVycy9n
cHUvZHJtL3Ztd2dmeC92bXdnZnhfZmVuY2UuaCAgICAgICAgIHwgICA1ICstCiBkcml2ZXJzL2dw
dS9kcm0vdm13Z2Z4L3Ztd2dmeF9maWZvLmMgICAgICAgICAgfCAgIDYgKy0KIGRyaXZlcnMvZ3B1
L2RybS92bXdnZngvdm13Z2Z4X2dtci5jICAgICAgICAgICB8ICAgNCArLQogZHJpdmVycy9ncHUv
ZHJtL3Ztd2dmeC92bXdnZnhfaXJxLmMgICAgICAgICAgIHwgICAzICstCiBkcml2ZXJzL2dwdS9k
cm0vdm13Z2Z4L3Ztd2dmeF9rbXMuYyAgICAgICAgICAgfCAgMzMgKysrLS0KIGRyaXZlcnMvZ3B1
L2RybS92bXdnZngvdm13Z2Z4X2ttcy5oICAgICAgICAgICB8ICAgMiArLQogZHJpdmVycy9ncHUv
ZHJtL3Ztd2dmeC92bXdnZnhfbGR1LmMgICAgICAgICAgIHwgICA2ICstCiBkcml2ZXJzL2dwdS9k
cm0vdm13Z2Z4L3Ztd2dmeF9tb2IuYyAgICAgICAgICAgfCAgIDIgKwogZHJpdmVycy9ncHUvZHJt
L3Ztd2dmeC92bXdnZnhfbXNnLmMgICAgICAgICAgIHwgIDExICstCiBkcml2ZXJzL2dwdS9kcm0v
dm13Z2Z4L3Ztd2dmeF9vdmVybGF5LmMgICAgICAgfCAgIDYgKy0KIGRyaXZlcnMvZ3B1L2RybS92
bXdnZngvdm13Z2Z4X3Jlc291cmNlLmMgICAgICB8ICA2MCArKysrKystLS0KIGRyaXZlcnMvZ3B1
L2RybS92bXdnZngvdm13Z2Z4X3Jlc291cmNlX3ByaXYuaCB8ICAgMiArCiBkcml2ZXJzL2dwdS9k
cm0vdm13Z2Z4L3Ztd2dmeF9zY3JuLmMgICAgICAgICAgfCAgIDYgKy0KIGRyaXZlcnMvZ3B1L2Ry
bS92bXdnZngvdm13Z2Z4X3NoYWRlci5jICAgICAgICB8ICAgOCArLQogZHJpdmVycy9ncHUvZHJt
L3Ztd2dmeC92bXdnZnhfc3RkdS5jICAgICAgICAgIHwgICA5ICstCiBkcml2ZXJzL2dwdS9kcm0v
dm13Z2Z4L3Ztd2dmeF9zdXJmYWNlLmMgICAgICAgfCAgMTAgKy0KIGRyaXZlcnMvZ3B1L2RybS92
bXdnZngvdm13Z2Z4X3R0bV9nbHVlLmMgICAgICB8ICAgMSAtCiBkcml2ZXJzL2dwdS9kcm0vdm13
Z2Z4L3Ztd2dmeF92YWxpZGF0aW9uLmggICAgfCAgIDMgKy0KIDMwIGZpbGVzIGNoYW5nZWQsIDI2
NCBpbnNlcnRpb25zKCspLCAzOTQgZGVsZXRpb25zKC0pCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
