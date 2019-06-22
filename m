Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF7B74F590
	for <lists+dri-devel@lfdr.de>; Sat, 22 Jun 2019 13:56:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85D766E96D;
	Sat, 22 Jun 2019 11:56:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0595B6E96B
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Jun 2019 11:56:39 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id k18so8283883ljc.11
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Jun 2019 04:56:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=C71vd6qa/pQSHDGDEr6CsSL16zMmFXbZ2Nbzlvcpz4o=;
 b=BNnaJHx6qSauIa7GSJTEy22+rL5jRnRPlpNMjFic/IfNdoznIzfWJz+PV7FviL09uh
 uw5b7wMNm8uGKpuZEZFCi16iucG2Lt7s0UDQ/loQYzAukvsFHMwCA5Ba28SbiRpYjmMI
 wTt438t4JttszJZGfh8fQ7jFleH92IzLD7Kt/5ovFZNUIIQ2q8K9z7FEE1fO38tn6GLX
 d3dpvyHzKl4OrSHWG1vHpYJ8urmUj6N6CDjRD2LY0oHTz5jQ+vgZadMIHXzvQ0L4J9S8
 OHMFL8dCi5Fq5hiDO9gnkNkMp33vvGXEpmig4xsywSObPi+JFM/lvvRqo0jNgyw5jEoa
 EIRw==
X-Gm-Message-State: APjAAAUSclWei3iYO3Q0tEx9wr03zDHVJ86TeZGmxZDA5/q1Vc3+YRLw
 LILekfnHQ8aSlHLQGdoeuu25uZuhRX007w==
X-Google-Smtp-Source: APXvYqx9p5Ru37EBwTfHj2xgtzUh2uCNrb9GvGirFJEEpWQtx4WQczrLrVwEq8Ll8EJskGIa+ubimA==
X-Received: by 2002:a2e:92c6:: with SMTP id k6mr345140ljh.148.1561204598207;
 Sat, 22 Jun 2019 04:56:38 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 d10sm810759ljc.15.2019.06.22.04.56.37
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sat, 22 Jun 2019 04:56:37 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org,
	Inki Dae <inki.dae@samsung.com>
Subject: [PATCH v4 0/2] drm/exynos: drop use of drmP.h
Date: Sat, 22 Jun 2019 13:56:21 +0200
Message-Id: <20190622115623.16314-1-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=C71vd6qa/pQSHDGDEr6CsSL16zMmFXbZ2Nbzlvcpz4o=;
 b=A6Yc5CJA+p0IMY72R7bPgAUxEcmHsal2TGGRaPgTrAwsvgub3HLOsNGjLJzIp6J1RR
 M0mvYC2Q8k+WV5KHkLHiixct/yvgXONbL8/7Ajvd5AwuAyTddL1NixqyeIZMNiqreU13
 lyWlEuHsdNuc6/zWmSNZ1vZ5kHL+n3LKDL6YR+xfaNCil5sBu9gEahvPBhV6It2HllD0
 RMx5PKhkzODzeoAkfN5Q8vL8R+MOVRzb0AJscU1PI9cLjZnSFHrCzv9Xgc3HXVFnuY3f
 mBrPXAH4yAVbFmONRECpqbv3Zo6x1vetrZO83810w+oEvZ6aOkO4G+M+wIs2FE0FcamE
 Qh6Q==
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
Cc: David Airlie <airlied@linux.ie>, Jingoo Han <jingoohan1@gmail.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QnVpbGQgdGVzdGVkIHVzaW5nIGFsbHllc2NvbmZpZywgYWxsbW9kY29uZmlnIGZvciB2YXJpb3Vz
CmFyY2hpdGVjdHVyZXMuCgp2MjoKLSBhZGQgbWlzc2luZyBwZW9wbGUgdG8gcmVjaXBpZW50IGxp
c3Qgb2YgbWFpbAotIG5vIGNoYW5nZSBpbiBhY3R1YWwgcGF0Y2gKCnYzOgotIGZpeCBidWlsZCBi
cmVha2FnZSAoSW5raSBEYWUpCi0gVGhlIHRlc3RpbmcgSSBoYWQgZG9uZSB3aXRoIGFsbHllc2Nv
bmZpZywgYWxsbW9kY29uZmlnCiAgZGlkIG5vdCB0cmlnZ2VyIGEgY29uZmlndXJhdGlvbiB3aGVy
ZSBleHlub3NfZHJtX2cyZC5jIHdhcyBidWlsdC4KCnY0OgotIGFkZGVkIG5ldyBwYXRjaCBzbyB3
ZSBnZXQgYmV0dGVyIGJ1aWxkIGNvdmVyYWdlIG9mIGV4eW5vcyBkcml2ZXIgKEtyenlzenRvZikK
ICBBIHdhcm5pbmcgd2FzIHRyaWdnZXJlZCB3aGVuIGJ1aWxkaW5nIGZvciBzaCAtIHBhdGNoIHNl
bnQgb3V0IHRvIGZpeCBpdCBpbiBzaDoKICBodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sLzIw
MTkwNjIyMTE0MjA4LjI0NDI3LTEtc2FtQHJhdm5ib3JnLm9yZy8KCiAgICAgICAgU2FtCgpTYW0g
UmF2bmJvcmcgKDIpOgogICAgICBkcm0vZXh5bm9zOiBkcm9wIGRybVAuaCB1c2FnZQogICAgICBk
cm0vZXh5bm9zOiB0cmlnZ2VyIGJ1aWxkIG9mIGFsbCBtb2R1bGVzCgogZHJpdmVycy9ncHUvZHJt
L2V4eW5vcy9LY29uZmlnICAgICAgICAgICAgICAgIHwgIDYgKystLQogZHJpdmVycy9ncHUvZHJt
L2V4eW5vcy9leHlub3M1NDMzX2RybV9kZWNvbi5jIHwgIDcgKysrLS0KIGRyaXZlcnMvZ3B1L2Ry
bS9leHlub3MvZXh5bm9zN19kcm1fZGVjb24uYyAgICB8ICA4ICsrKystLQogZHJpdmVycy9ncHUv
ZHJtL2V4eW5vcy9leHlub3NfZHAuYyAgICAgICAgICAgIHwgMTMgKysrKy0tLS0tCiBkcml2ZXJz
L2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fY3J0Yy5jICAgICAgfCAgMiArLQogZHJpdmVycy9n
cHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX2RtYS5jICAgICAgIHwgIDYgKystLQogZHJpdmVycy9n
cHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX2RwaS5jICAgICAgIHwgIDggKysrLS0tCiBkcml2ZXJz
L2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fZHJ2LmMgICAgICAgfCAxMiArKysrLS0tLQogZHJp
dmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX2Rydi5oICAgICAgIHwgIDggKysrKystCiBk
cml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fZHNpLmMgICAgICAgfCAyMSArKysrKysr
LS0tLS0tLQogZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX2ZiLmMgICAgICAgIHwg
IDYgKystLQogZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX2ZiZGV2LmMgICAgIHwg
IDggKysrKy0tCiBkcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fZmltYy5jICAgICAg
fCAxNSArKysrKy0tLS0tCiBkcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fZmltZC5j
ICAgICAgfCAxNCArKysrKy0tLS0KIGRyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2RybV9n
MmQuYyAgICAgICB8IDExICsrKystLS0KIGRyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2Ry
bV9nZW0uYyAgICAgICB8ICA3ICsrKy0tCiBkcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19k
cm1fZ3NjLmMgICAgICAgfCAxMyArKysrKy0tLS0KIGRyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5
bm9zX2RybV9pcHAuYyAgICAgICB8ICAzICstCiBkcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5v
c19kcm1fbWljLmMgICAgICAgfCAyMiArKysrKysrLS0tLS0tLQogZHJpdmVycy9ncHUvZHJtL2V4
eW5vcy9leHlub3NfZHJtX3BsYW5lLmMgICAgIHwgIDQgKy0tCiBkcml2ZXJzL2dwdS9kcm0vZXh5
bm9zL2V4eW5vc19kcm1fcm90YXRvci5jICAgfCAxMCArKystLS0tCiBkcml2ZXJzL2dwdS9kcm0v
ZXh5bm9zL2V4eW5vc19kcm1fc2NhbGVyLmMgICAgfCAxMiArKysrLS0tLQogZHJpdmVycy9ncHUv
ZHJtL2V4eW5vcy9leHlub3NfZHJtX3ZpZGkuYyAgICAgIHwgIDkgKysrLS0tCiBkcml2ZXJzL2dw
dS9kcm0vZXh5bm9zL2V4eW5vc19oZG1pLmMgICAgICAgICAgfCA0MSArKysrKysrKysrKysrLS0t
LS0tLS0tLS0tLS0KIGRyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX21peGVyLmMgICAgICAg
ICB8IDMxICsrKysrKysrKystLS0tLS0tLS0tCiAyNSBmaWxlcyBjaGFuZ2VkLCAxNTggaW5zZXJ0
aW9ucygrKSwgMTM5IGRlbGV0aW9ucygtKQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
