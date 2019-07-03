Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E72035DB37
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2019 03:57:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D47A7898E4;
	Wed,  3 Jul 2019 01:57:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com
 [IPv6:2607:f8b0:4864:20::836])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7976898BC;
 Wed,  3 Jul 2019 01:57:16 +0000 (UTC)
Received: by mail-qt1-x836.google.com with SMTP id d23so867930qto.2;
 Tue, 02 Jul 2019 18:57:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Hb57y4S5TIlcNdCgEJKe5TZjVdtGWGdXTULEeBHemng=;
 b=CaPWgYUq6mVATy6F9+tmYbe9Cv9kn1cpONQPh8WakxzyoduMI2OUCvsvpLan692DQN
 Vjbi0VQy0VMxB+/aRI0eKkEn3IaSLQXhBbnUmjTqJVxXAm1ZbFrtJTpJiy/LNU6JwZl8
 qTaThwtPtGTgF/kZUa0uxoUP05ZNpklcip1lGES9yfhsVYbG4/VfinqNPneG0oLSeBLn
 vorJZb4GeG/ClWmudeiGEEDLF+WwhQGwI++sqAiN8IDU3c7T1A8e2tPkcXzALMGq+Pl3
 G1MYPmYn/DBbbxE2ZCuEl0ijtG/6X6WYuGZxIVFdLg5qnw2KY2bPDrdMJUi6wJu3dP9w
 YIpA==
X-Gm-Message-State: APjAAAVOrpt3bTfxw/USXtlinDmaxLz/t4UhGYv5Z9lwAogNkhCw1lCQ
 ARiy6yxk6ErFR1UvxI4KhDPWcZkJc8rZqA==
X-Google-Smtp-Source: APXvYqxVnkXQqWmus6/mf/GTZQaJYN6dkcGZH5OcWugNeCrVVPIEEemBnXd19p8KcDqZT7yguo0Eyg==
X-Received: by 2002:a0c:89b2:: with SMTP id 47mr29144954qvr.203.1562119035462; 
 Tue, 02 Jul 2019 18:57:15 -0700 (PDT)
Received: from localhost.localdomain ([71.219.67.210])
 by smtp.gmail.com with ESMTPSA id w16sm281100qki.36.2019.07.02.18.57.14
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 02 Jul 2019 18:57:14 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 airlied@gmail.com, daniel.vetter@ffwll.ch
Subject: [pull] amdgpu drm-fixes-5.2
Date: Tue,  2 Jul 2019 20:57:05 -0500
Message-Id: <20190703015705.3162-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Hb57y4S5TIlcNdCgEJKe5TZjVdtGWGdXTULEeBHemng=;
 b=pSfMoZlgHIVCsexVoiInHZbPECpIz6oI8IQgkwu4vrhwseb+z9y0N95DJiiNkcMrV5
 2PG7UzH3T8kzXzfZUPu/vjsM29Btd8xqMmw4nqwzAqA72nbqcob1VskqzIeuBhCl+Usu
 kGyCX2OUfsUD4AaphcukAdN5CfxYh8NIJcAHgFjRwJgyviLa/g18fVvCE90bN61Qk+1m
 rbP/2vrDq+JeqJrx2zk72la5jpjpmrh2g+R0YShs1j+1PbhU9+2h5W1yZ/V04ghekWJs
 8IpOKGsSUAB0J5UZskDJM1CaGqCaCdc1TX6A6qslaDsfvDGdyu6z2dqXJUGSeDVaauJY
 9sZw==
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
Cc: Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRGF2ZSwgRGFuaWVsLAoKMyBmaXhlcyBhbGwgY2MnZWQgdG8gc3RhYmxlLiAgTm90ZSB0aGF0
IGRpbSBjb21wbGFpbnMgYWJvdXQgdGhlIEZpeGVzIHRhZwppbiBvbmUgb2YgdGhlIHBhdGNoZXMu
ICBUaGUgcGF0Y2ggaGFzOgpGaXhlczogOTIxOTM1ZGM2NDA0ICgiZHJtL2FtZC9wb3dlcnBsYXk6
IGVuZm9yY2UgZGlzcGxheSByZWxhdGVkIHNldHRpbmdzIG9ubHkgb24gbmVlZGVkIikKd2hpbGUg
ZGltIHJlY29tbWVuZHM6CkZpeGVzOiBjb21taXQgOTIxOTM1ZGM2NDA0ICgiZHJtL2FtZC9wb3dl
cnBsYXk6IGVuZm9yY2UgZGlzcGxheSByZWxhdGVkIHNldHRpbmdzIG9ubHkgb24gbmVlZGVkIikK
SSBmZWVsIGxpa2UgdGhlIGZvcm1lciBpcyB0aGUgbW9yZSBjb21tb24gbm9tZW5jbGV0dXJlIChh
dCBsZWFzdCBoaXN0b3JpY2FsbHkpLApidXQgSSdtIGhhcHB5IHRvIHJlc3BpbiBpZiB5b3UnZCBw
cmVmZXIuCgpUaGUgZm9sbG93aW5nIGNoYW5nZXMgc2luY2UgY29tbWl0IDY2NWQ2ZDRlMzIzMTNh
Nzk1MmJiMzMzOTY0N2Y3NGMzYTZiMGQ3OGE6CgogIE1lcmdlIHRhZyAnZHJtLW1pc2MtZml4ZXMt
MjAxOS0wNi0yNicgb2YgZ2l0Oi8vYW5vbmdpdC5mcmVlZGVza3RvcC5vcmcvZHJtL2RybS1taXNj
IGludG8gZHJtLWZpeGVzICgyMDE5LTA2LTI3IDExOjM0OjUyICsxMDAwKQoKYXJlIGF2YWlsYWJs
ZSBpbiB0aGUgR2l0IHJlcG9zaXRvcnkgYXQ6CgogIGdpdDovL3Blb3BsZS5mcmVlZGVza3RvcC5v
cmcvfmFnZDVmL2xpbnV4IHRhZ3MvZHJtLWZpeGVzLTUuMi0yMDE5LTA3LTAyCgpmb3IgeW91IHRv
IGZldGNoIGNoYW5nZXMgdXAgdG8gMjVmMDlmODU4ODM1YjBlOWEwNjIxMzgxMTAzMTE5MGExN2Q4
YWI3ODoKCiAgZHJtL2FtZGdwdS9nZng5OiB1c2UgcmVzZXQgZGVmYXVsdCBmb3IgUEFfU0NfRklG
T19TSVpFICgyMDE5LTA3LTAxIDEyOjE2OjI2IC0wNTAwKQoKLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpkcm0tZml4ZXMtNS4y
LTIwMTktMDctMDI6CgpGaXhlcyBmb3Igc3RhYmxlCgphbWRncHU6Ci0gc3RhYmlsaXR5IGZpeCBm
b3IgZ2Z4OQotIHJlZ3Jlc3Npb24gZml4IGZvciBIRyBvbiBzb21lIHBvbGFyaXMgYm9hcmRzCi0g
Y3Jhc2ggZml4IGZvciBzb21lIG5ldyBPRU0gYm9hcmRzCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCkFsZXggRGV1Y2hlciAo
MSk6CiAgICAgIGRybS9hbWRncHUvZ2Z4OTogdXNlIHJlc2V0IGRlZmF1bHQgZm9yIFBBX1NDX0ZJ
Rk9fU0laRQoKRXZhbiBRdWFuICgxKToKICAgICAgZHJtL2FtZC9wb3dlcnBsYXk6IHVzZSBoYXJk
d2FyZSBmYW4gY29udHJvbCBpZiBubyBwb3dlcnBsYXkgZmFuIHRhYmxlCgpMeXVkZSBQYXVsICgx
KToKICAgICAgZHJtL2FtZGdwdTogRG9uJ3Qgc2tpcCBkaXNwbGF5IHNldHRpbmdzIGluIGh3bWdy
X3Jlc3VtZSgpCgogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y5XzAuYyAgICAgICAg
ICAgICAgICAgfCAxOSAtLS0tLS0tLS0tLS0tLS0tLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bv
d2VycGxheS9od21nci9od21nci5jICAgICAgICAgICB8ICAyICstCiAuLi4vZHJtL2FtZC9wb3dl
cnBsYXkvaHdtZ3IvcHJvY2Vzc19wcHRhYmxlc192MV8wLmMgICB8ICA0ICsrKy0KIGRyaXZlcnMv
Z3B1L2RybS9hbWQvcG93ZXJwbGF5L2luYy9od21nci5oICAgICAgICAgICAgIHwgIDEgKwogLi4u
L2dwdS9kcm0vYW1kL3Bvd2VycGxheS9zbXVtZ3IvcG9sYXJpczEwX3NtdW1nci5jICAgfCAgNCAr
KysrCiA1IGZpbGVzIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgMjEgZGVsZXRpb25zKC0pCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
