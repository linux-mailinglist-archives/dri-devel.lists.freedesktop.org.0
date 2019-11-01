Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C260EEC04A
	for <lists+dri-devel@lfdr.de>; Fri,  1 Nov 2019 10:11:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD3AB6F79D;
	Fri,  1 Nov 2019 09:11:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7ED486EE7F;
 Fri,  1 Nov 2019 09:11:11 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id t1so3066861wrv.4;
 Fri, 01 Nov 2019 02:11:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Vhjdwd9OjDgZKFYAiqq3M747PlQxCBQAkRBjkbyP7ZE=;
 b=bwH56m0f1fNwZjVPV8GOca65OywNgEUgX/4utGz0mZCRmdv2d+CkMIQ5+lZ8RU1KU8
 ykl/E6XyPbqSl1gH+PlWuVOckPLRplQVbknTukFOhJXKOIXY9RPIy5dR7OA95g+L8g+5
 IEhoQOr0z03jUEKBMUbn4lQijqxP5dD4BwSlgI0VO7DxPlV6cGUN0rU5gME5yFQoFlUi
 UVPdgwYrI03LDTnc0gwdILXTODZ/2MxqETuwphQnd0fos9i47oIu0EKhBQLrBzkoa4Ig
 9aN66F7QRknS0vAr8cvA7f8g1CULLKJDwWXnFrGf8V+qljr1obzwk6ciasCnoUx7Ligv
 Lx/w==
X-Gm-Message-State: APjAAAXY7D40hNjPBbB7AEKA7GPKSKyC9tUR1xx3jw9KCX9IR3lr20o2
 5dXf2xHQ2pySgedgRLQl7Kg=
X-Google-Smtp-Source: APXvYqwucsVTviL1wqTqOub9YHhpaHgCtVJWjyxDGuPZN3ErAUCBvnC3v/Sq43iK8ecfBp/JazKKkw==
X-Received: by 2002:adf:b1c6:: with SMTP id r6mr10165019wra.48.1572599469966; 
 Fri, 01 Nov 2019 02:11:09 -0700 (PDT)
Received: from localhost.localdomain ([62.178.82.229])
 by smtp.gmail.com with ESMTPSA id y2sm6655648wmy.2.2019.11.01.02.11.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Nov 2019 02:11:08 -0700 (PDT)
From: Christian Gmeiner <christian.gmeiner@gmail.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] drm/etnaviv: correct ETNA_MAX_PIPE define
Date: Fri,  1 Nov 2019 11:10:48 +0100
Message-Id: <20191101101110.10105-1-christian.gmeiner@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Vhjdwd9OjDgZKFYAiqq3M747PlQxCBQAkRBjkbyP7ZE=;
 b=ghjSVKpLhAM8ISXDDeFz9y/C6z6EwrwhVPWoJcoRy3cWjxomwNmYtyo2mo2va4jcmA
 ckgLhb1TMEgBPs6z+5cGziauek9PwpjPtF9bNS9UVjN2MWI0TP8XxzM0rIWMYzpe68kt
 cYoCQTDKl0gEYC6UpIDUrjXTC3m2l3cLykNr6n4zH6dhxG0XiiQ5aG5sniB0hCjHSd0b
 XMZQjt+/Vn6NY/B2wd6eewneXLbkji3K/hGNMJSzzs9ysAkpI6byIBnsh/jqluU1PhqP
 R6A4YyDNezfGsHiu66yGzf2lRv9g/RKoBR+MA8dhlif+AaKhzpLwS9VQgtQPRrLKhPCe
 mB/g==
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
Cc: David Airlie <airlied@linux.ie>, etnaviv@lists.freedesktop.org,
 stable@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Dan Carpenter <dan.carpenter@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ZXRuYXZpdiBzdXBwb3J0cyB0aGUgZm9sbG93aW5nIHBpcGUgdHlwZXM6CgpFVE5BX1BJUEVfM0Qg
ICAgICAweDAwCkVUTkFfUElQRV8yRCAgICAgIDB4MDEKRVROQV9QSVBFX1ZHICAgICAgMHgwMgoK
VGhlIGN1cnJlbnQgdXNlZCB2YWx1ZSBvZiA0IGZvciBFVE5BX01BWF9QSVBFUyBpcyB3cm9uZyBh
bmQKY2F1ZXNlcyBzb21lIHRyb3VibGVzIGluIHRoZSBjb21iaW5hdGlvbiB3aXRoIHBlcmYgY291
bnRlcnMuCgpMZXRzIGhhdmUgYSBsb29rIGF0IHRoZSBmdW5jdGlvbiBldG5hdml2X3BtX3F1ZXJ5
X2RvbSguLik6CklmIGRvbWFpbi0+cGlwZSBpcyAzIHRoZW4gd2UgYXJlIG9uZSBlbGVtZW50IGJl
eW9uZCB0aGUgZW5kCm9mIHRoZSBhcnJheS4KClRoZSBlYXNpZXN0IHdheSB0byBmaXggdGhpcyBp
c3N1ZSBpcyB0byBwcm92aWRlIGEgY29ycmVjdCB2YWx1ZQpmb3IgRVROQV9NQVhfUElQRVMuCgpS
ZXBvcnRlZC1ieTogRGFuIENhcnBlbnRlciA8ZGFuLmNhcnBlbnRlckBvcmFjbGUuY29tPgpGaXhl
czogYThjMjFhNTQ1MWQ4ICgiZHJtL2V0bmF2aXY6IGFkZCBpbml0aWFsIGV0bmF2aXYgRFJNIGRy
aXZlciIpCkNjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnClNpZ25lZC1vZmYtYnk6IENocmlzdGlh
biBHbWVpbmVyIDxjaHJpc3RpYW4uZ21laW5lckBnbWFpbC5jb20+Ci0tLQogaW5jbHVkZS91YXBp
L2RybS9ldG5hdml2X2RybS5oIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
LCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvaW5jbHVkZS91YXBpL2RybS9ldG5hdml2X2Ry
bS5oIGIvaW5jbHVkZS91YXBpL2RybS9ldG5hdml2X2RybS5oCmluZGV4IDA5ZDBkZjhiNzFjNS4u
NWE2MjIyODI5OGQxIDEwMDY0NAotLS0gYS9pbmNsdWRlL3VhcGkvZHJtL2V0bmF2aXZfZHJtLmgK
KysrIGIvaW5jbHVkZS91YXBpL2RybS9ldG5hdml2X2RybS5oCkBAIC03NSw3ICs3NSw3IEBAIHN0
cnVjdCBkcm1fZXRuYXZpdl90aW1lc3BlYyB7CiAjZGVmaW5lIEVUTkFWSVZfUEFSQU1fR1BVX05V
TV9WQVJZSU5HUyAgICAgICAgICAgICAgMHgxYQogI2RlZmluZSBFVE5BVklWX1BBUkFNX1NPRlRQ
SU5fU1RBUlRfQUREUiAgICAgICAgICAgIDB4MWIKIAotI2RlZmluZSBFVE5BX01BWF9QSVBFUyA0
CisjZGVmaW5lIEVUTkFfTUFYX1BJUEVTIDMKIAogc3RydWN0IGRybV9ldG5hdml2X3BhcmFtIHsK
IAlfX3UzMiBwaXBlOyAgICAgICAgICAgLyogaW4gKi8KLS0gCjIuMjMuMAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
