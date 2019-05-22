Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24D2F26344
	for <lists+dri-devel@lfdr.de>; Wed, 22 May 2019 13:54:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C98D880C6;
	Wed, 22 May 2019 11:54:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pio-pvt-msa1.bahnhof.se (pio-pvt-msa1.bahnhof.se [79.136.2.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D33C7880C6
 for <dri-devel@lists.freedesktop.org>; Wed, 22 May 2019 11:54:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTP id DB28D3F9F0;
 Wed, 22 May 2019 13:54:35 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -0.6
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 tagged_above=-999 required=6.31
 tests=[ALL_TRUSTED=-1, BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SORTED_RECIPS=2.499, URIBL_BLOCKED=0.001]
 autolearn=no autolearn_force=no
Received: from pio-pvt-msa1.bahnhof.se ([127.0.0.1])
 by localhost (pio-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uXZZ-HZgB2tC; Wed, 22 May 2019 13:54:27 +0200 (CEST)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id E3E5E3FBA1;
 Wed, 22 May 2019 13:54:26 +0200 (CEST)
Received: from localhost.localdomain.localdomain
 (h-205-35.A357.priv.bahnhof.se [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPA id 5AEB0360143;
 Wed, 22 May 2019 13:54:26 +0200 (CEST)
From: "Thomas Hellstrom (VMware)" <thomas@shipmail.org>
To: airlied@gmail.com, airlied@redhat.com, daniel.vetter@ffwll.ch,
 dri-devel@lists.freedesktop.org
Subject: [git pull] vmwgfx-fixes-5.2
Date: Wed, 22 May 2019 13:54:08 +0200
Message-Id: <20190522115408.33185-1-thomas@shipmail.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=shipmail.org; s=mail; 
 t=1558526066; bh=LZvL5iAL3QMDzoDWgUXq+nne5cPqdwwKCqkfrZNrDCQ=;
 h=From:To:Cc:Subject:Date:From;
 b=E8cPRQ+6WHs0k4J8PEEE6l8p7h9O7j6b/yH9jIZq2ScHcZF6PI0lH0Mrc37mOWrAX
 pCp7gJDoxcFO6d90RDSHPU48dMe9Mxu0aHo+LGImIsa8STDj6zMBJd7iERW6Vcroyo
 B5AeXUc1/5gg+hZ1FsRPHy0NPf2+e7PAAPNzdX0w=
X-Mailman-Original-Authentication-Results: pio-pvt-msa1.bahnhof.se;
 dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=E8cPRQ+6; 
 dkim-atps=neutral
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
Cc: pv-drivers@vmware.com, linux-graphics-maintainer@vmware.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RGF2ZSwgRGFuaWVsCgpBIHNldCBvZiBtaXNjIGZpeGVzIGZvciB2YXJpb3VzIGlzc3VlcyB0aGF0
IGhhdmUgc3VyZmFjZWQgcmVjZW50bHkuCkFsbCBDYydkIHN0YWJsZSBleGNlcHQgdGhlIGRtYSBp
dGVyYXRvciBmaXggd2hpY2ggc2hvdWxkbid0IHJlYWxseSBjYXVzZQphbnkgcmVhbCBpc3N1ZXMg
b24gb2xkZXIga2VybmVscy4KClRoZSBmb2xsb3dpbmcgY2hhbmdlcyBzaW5jZSBjb21taXQgYTE4
ODMzOWNhNWEzOTZhY2M1ODhlNTg1MWVkN2UxOWY2NmIwZWJkOToKCiAgTGludXggNS4yLXJjMSAo
MjAxOS0wNS0xOSAxNTo0NzowOSAtMDcwMCkKCmFyZSBhdmFpbGFibGUgaW4gdGhlIEdpdCByZXBv
c2l0b3J5IGF0OgoKICBnaXQ6Ly9wZW9wbGUuZnJlZWRlc2t0b3Aub3JnL350aG9tYXNoL2xpbnV4
IHZtd2dmeC1maXhlcy01LjIKCmZvciB5b3UgdG8gZmV0Y2ggY2hhbmdlcyB1cCB0byA1ZWQ3ZjRi
NWVjYTExYzNjNjllN2M4YjUzZTQzMjE4MTJiYzFlZTFlOgoKICBkcm0vdm13Z2Z4OiBpbnRlZ2Vy
IHVuZGVyZmxvdyBpbiB2bXdfY21kX2R4X3NldF9zaGFkZXIoKSBsZWFkaW5nIHRvIGFuIGludmFs
aWQgcmVhZCAoMjAxOS0wNS0yMSAxMDoyMzoxMCArMDIwMCkKCi0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KTXVycmF5IE1jQWxs
aXN0ZXIgKDIpOgogICAgICBkcm0vdm13Z2Z4OiBOVUxMIHBvaW50ZXIgZGVyZWZlcmVuY2UgZnJv
bSB2bXdfY21kX2R4X3ZpZXdfZGVmaW5lKCkKICAgICAgZHJtL3Ztd2dmeDogaW50ZWdlciB1bmRl
cmZsb3cgaW4gdm13X2NtZF9keF9zZXRfc2hhZGVyKCkgbGVhZGluZyB0byBhbiBpbnZhbGlkIHJl
YWQKClRob21hcyBIZWxsc3Ryb20gKDQpOgogICAgICBkcm0vdm13Z2Z4OiBEb24ndCBzZW5kIGRy
bSBzeXNmcyBob3RwbHVnIGV2ZW50cyBvbiBpbml0aWFsIG1hc3RlciBzZXQKICAgICAgZHJtL3Zt
d2dmeDogRml4IHVzZXIgc3BhY2UgaGFuZGxlIGVxdWFsIHRvIHplcm8KICAgICAgZHJtL3Ztd2dm
eDogRml4IGNvbXBhdCBtb2RlIHNoYWRlciBvcGVyYXRpb24KICAgICAgZHJtL3Ztd2dmeDogVXNl
IHRoZSBkbWEgc2NhdHRlci1nYXRoZXIgaXRlcmF0b3IgdG8gZ2V0IGRtYSBhZGRyZXNzZXMKCiBk
cml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3R0bV9vYmplY3QuYyAgICAgICAgfCAgMiArLQogZHJpdmVy
cy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfZHJ2LmMgICAgICAgIHwgIDggKysrKysrKy0KIGRyaXZl
cnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X2Rydi5oICAgICAgICB8ICAyICstCiBkcml2ZXJzL2dw
dS9kcm0vdm13Z2Z4L3Ztd2dmeF9leGVjYnVmLmMgICAgfCAyMCArKysrKysrKysrKysrKysrKysr
LQogZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfdHRtX2J1ZmZlci5jIHwgMjcgKysrKysr
Ky0tLS0tLS0tLS0tLS0tLS0tLS0tCiA1IGZpbGVzIGNoYW5nZWQsIDM1IGluc2VydGlvbnMoKyks
IDI0IGRlbGV0aW9ucygtKQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
