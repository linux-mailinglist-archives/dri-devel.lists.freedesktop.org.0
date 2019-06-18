Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 078B949A7A
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2019 09:24:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 961046E109;
	Tue, 18 Jun 2019 07:24:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ste-pvt-msa2.bahnhof.se (ste-pvt-msa2.bahnhof.se
 [213.80.101.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9962F6E109
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2019 07:24:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTP id EDAB33F5FA;
 Tue, 18 Jun 2019 09:23:54 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -3.099
X-Spam-Level: 
X-Spam-Status: No, score=-3.099 tagged_above=-999 required=6.31
 tests=[ALL_TRUSTED=-1, BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 URIBL_BLOCKED=0.001] autolearn=ham autolearn_force=no
Received: from ste-pvt-msa2.bahnhof.se ([127.0.0.1])
 by localhost (ste-ftg-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CUdMUv3mC72N; Tue, 18 Jun 2019 09:23:44 +0200 (CEST)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id 0C6EA3F793;
 Tue, 18 Jun 2019 09:23:43 +0200 (CEST)
Received: from localhost.localdomain.localdomain
 (h-205-35.A357.priv.bahnhof.se [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id A1A57360193;
 Tue, 18 Jun 2019 09:23:43 +0200 (CEST)
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m=20=28VMware=29?= <thomas@shipmail.org>
To: airlied@gmail.com,
	daniel@ffwll.ch,
	dri-devel@lists.freedesktop.org
Subject: [git pull] vmwgfx-fixes-5.2
Date: Tue, 18 Jun 2019 09:22:55 +0200
Message-Id: <20190618072255.2720-1-thomas@shipmail.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=shipmail.org; s=mail; 
 t=1560842623; bh=H933rUM79q86Xt1hi/42oxVkP3LdJMo5UjnfNvGNZ4c=;
 h=From:To:Cc:Subject:Date:From;
 b=kDu2kU3ePHXETj3mVJLq/pbSQclSEXhIdIN9MpJHAOreu/kdCvIVF2YyT+UHNVqre
 G3Q79AHjncpDKXhFdXvJnc+GvN8Aq/1pCxrVBkTfMmyxLhW/GcXp5IRht+7OdU8Iar
 9GDq0UtSyFktGu2hMcwFhzdA2MtOFXXX13adlM0I=
X-Mailman-Original-Authentication-Results: ste-pvt-msa2.bahnhof.se;
 dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=kDu2kU3e; 
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
Cc: pv-drivers@vmware.com,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas@shipmail.org>,
 linux-graphics-maintainer@vmware.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RGF2ZSwgRGFuaWVsLAoKQSBjb3VwbGUgb2YgZml4ZXMgZm9yIHZtd2dmeC4gVHdvIGZpeGVzIGZv
ciBhIERNQSBzZy1saXN0IGRlYnVnIHdhcm5pbmcKbWVzc2FnZS4gVGhlc2UgYXJlIG5vdCBjYydk
IHN0YWJsZSBzaW5jZSB0aGVyZSBpcyBubyBldmlkZW5jZSBvZiBhY3R1YWwKYnJlYWthZ2UuCk9u
IGZpeCBmb3IgdGhlIGhpZ2gtYmFuZHdpZHRoIGJhY2tkb29yIHBvcnQgd2hpY2ggaXMgY2MnZCBz
dGFibGUgZHVlIHRvCnVwY29taW5nIGhhcmR3YXJlLCBvbiB3aGljaCB0aGUgY29kZSB3b3VsZCBv
dGhlcndpc2UgYnJlYWsuCgpUaGUgZm9sbG93aW5nIGNoYW5nZXMgc2luY2UgY29tbWl0IDVlZDdm
NGI1ZWNhMTFjM2M2OWU3YzhiNTNlNDMyMTgxMmJjMWVlMWU6CgogIGRybS92bXdnZng6IGludGVn
ZXIgdW5kZXJmbG93IGluIHZtd19jbWRfZHhfc2V0X3NoYWRlcigpIGxlYWRpbmcgdG8gYW4gaW52
YWxpZCByZWFkICgyMDE5LTA1LTIxIDEwOjIzOjEwICswMjAwKQoKYXJlIGF2YWlsYWJsZSBpbiB0
aGUgR2l0IHJlcG9zaXRvcnkgYXQ6CgogIGdpdDovL3Blb3BsZS5mcmVlZGVza3RvcC5vcmcvfnRo
b21hc2gvbGludXggdm13Z2Z4LWZpeGVzLTUuMgoKZm9yIHlvdSB0byBmZXRjaCBjaGFuZ2VzIHVw
IHRvIDM5OTE2ODk3Y2Q4MTVhMGVlMDdiYTFmNjgyMGNmODhhNjNlNDU5ZmM6CgogIGRybS92bXdn
Zng6IGZpeCBhIHdhcm5pbmcgZHVlIHRvIG1pc3NpbmcgZG1hX3Bhcm1zICgyMDE5LTA2LTExIDE3
OjAwOjUzICswMjAwKQoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpRaWFuIENhaSAoMSk6CiAgICAgIGRybS92bXdnZng6IGZp
eCBhIHdhcm5pbmcgZHVlIHRvIG1pc3NpbmcgZG1hX3Bhcm1zCgpUaG9tYXMgSGVsbHN0cm9tICgy
KToKICAgICAgZHJtL3Ztd2dmeDogVXNlIHRoZSBiYWNrZG9vciBwb3J0IGlmIHRoZSBIQiBwb3J0
IGlzIG5vdCBhdmFpbGFibGUKICAgICAgZHJtL3Ztd2dmeDogSG9ub3IgdGhlIHNnIGxpc3Qgc2Vn
bWVudCBzaXplIGxpbWl0YXRpb24KCiBkcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9kcnYu
YyAgICAgICAgfCAgIDMgKwogZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfbXNnLmMgICAg
ICAgIHwgMTQ2ICsrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tCiBkcml2ZXJzL2dwdS9kcm0v
dm13Z2Z4L3Ztd2dmeF90dG1fYnVmZmVyLmMgfCAgMTAgKy0KIDMgZmlsZXMgY2hhbmdlZCwgMTI1
IGluc2VydGlvbnMoKyksIDM0IGRlbGV0aW9ucygtKQpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
