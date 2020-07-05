Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 433B321530C
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jul 2020 09:19:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B7E16E2A3;
	Mon,  6 Jul 2020 07:19:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A03A56EBF5
 for <dri-devel@lists.freedesktop.org>; Sun,  5 Jul 2020 06:59:37 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id z17so31839238edr.9
 for <dri-devel@lists.freedesktop.org>; Sat, 04 Jul 2020 23:59:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Uj7PGXQjA9Qjyx6Apu7BwCYoAwQ6mjWMYaZTjh1xboA=;
 b=X1tK2P5x1N5NIvZTW+VcJWoJ5K7YshwD/RGTnoclfrQc9rWXzaq6x5lbh3W1VEPG3H
 GIBj3aYdZwSkmbX30wI0ltTXdk9CnsRitseiZtukzUKEk3FNTlkZwPOXIzWjeP499J/h
 xCTffMRhoUn1p7NWV3QhPZ1KwiRWnwxwdcgOzZ7IN9IH/TZ7dDyEEoJLo0yjD+zY/jSq
 U/Mez575j6Gk8PqJLH1jwIIrEPtUwfcKywMt7nrVfB+WPVnPIRMguFf5Uy51Wimot3VA
 03Tow+PpzzxaVQn7RJASKTh8RPzBXnCFS8m6FGqLmHu/X1hY90wgL2yNY9oyCjHPCC6U
 vedg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Uj7PGXQjA9Qjyx6Apu7BwCYoAwQ6mjWMYaZTjh1xboA=;
 b=ar1ua5Dz/BS3kaw8L9FAciSb2AQtbHM7bWUzECj/Htz6UFos+JNS3dkrkYZgKw1Rsp
 sv5l3NDtQdafUGWhIuk2Zz1Pr/KKjngY6HlwldEWSh47tYleY0J3MLxVDq8uuH8MiqDC
 ddGNWR5jVQoU4u5cIvil1UZ8rBH/0iupzLSLUMPYhAi/UbvAxtHL9PCTOasVn6jcQ5Wm
 7oPK+edrR2VB5Zz0o42bfr47tMTB9pcH6A8VQb1Aguq+AE5lxonBylK4BjpQ9p9nnCNX
 Pu45FX2L1Ov3nWFQkNZzZ2HNsAAQ0L/UdbkXCgzxEPuV3rWgO7wjffKSR6e87brr1wuL
 9suw==
X-Gm-Message-State: AOAM532t6ZJCtn6sraaJZAHdLm9W+NSOcLSwIobW5ST3GDTJIAoc/u1m
 jvqr0tIDg7OsopYWq6BBEF0=
X-Google-Smtp-Source: ABdhPJxf8p7neXQpdYnh+iVo38AaVRoy6UlE6QLvO/bQFZ8OMYCoPcBv6DsoAxTNbMTymew/PEyO+w==
X-Received: by 2002:aa7:d989:: with SMTP id u9mr31469159eds.85.1593932375906; 
 Sat, 04 Jul 2020 23:59:35 -0700 (PDT)
Received: from felia.fritz.box ([2001:16b8:2db3:e200:60e7:4b3:523f:884c])
 by smtp.gmail.com with ESMTPSA id q3sm15042052eds.41.2020.07.04.23.59.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jul 2020 23:59:35 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
To: Ondrej Jirman <megous@megous.com>,
	Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH] MAINTAINERS: adjust entry to renaming and conversion
Date: Sun,  5 Jul 2020 08:59:17 +0200
Message-Id: <20200705065917.22285-1-lukas.bulwahn@gmail.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 06 Jul 2020 07:19:17 +0000
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: devicetree@vger.kernel.org, Purism Kernel Team <kernel@puri.sm>,
 =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>,
 kernel-janitors@vger.kernel.org,
 Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-sunxi@googlegroups.com, Rob Herring <robh+dt@kernel.org>,
 Joe Perches <joe@perches.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 Pia Eichinger <pia.eichinger@st.oth-regensburg.de>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Q29tbWl0IGE3NGU4MWE1NjQwNSAoImRybS9wYW5lbDogcm9ja3RlY2gtamgwNTduMDA5MDA6IFJl
bmFtZSB0aGUgZHJpdmVyIHRvCnN0NzcwMyIpIGFuZCBjb21taXQgNzMxN2Y0NTc0NDkyICgiZHQt
YmluZGluZ3M6IHBhbmVsOiBDb252ZXJ0CnJvY2t0ZWNoLGpoMDU3bjAwOTAwIHRvIHlhbWwiKSBy
ZW5hbWVkIGFuZCBjb252ZXJ0ZWQgdGhlIGZpbGVzIG1lbnRpb25lZCBpbgpEUk0gRFJJVkVSIEZP
UiBST0NLVEVDSCBKSDA1N04wMDkwMCBQQU5FTFMsIGJ1dCBkaWQgbm90IGFkanVzdCB0aGUgZW50
cmllcwppbiBNQUlOVEFJTkVSUy4KCkhlbmNlLCAuL3NjcmlwdHMvZ2V0X21haW50YWluZXIucGwg
LS1zZWxmLXRlc3Q9cGF0dGVybnMgY29tcGxhaW5zOgoKICB3YXJuaW5nOiBubyBmaWxlIG1hdGNo
ZXMgIEY6IFwKICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5l
bC9yb2NrdGVjaCxqaDA1N24wMDkwMC50eHQKICB3YXJuaW5nOiBubyBmaWxlIG1hdGNoZXMgIEY6
IFwKICBkcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtcm9ja3RlY2gtamgwNTduMDA5MDAuYwoK
QWRqdXN0IGVudHJpZXMgYWZ0ZXIgdGhpcyBmaWxlIHJlbmFtaW5nIGFuZCBkZXZpY2V0cmVlIGNv
bnZlcnNpb24uCgpTaWduZWQtb2ZmLWJ5OiBMdWthcyBCdWx3YWhuIDxsdWthcy5idWx3YWhuQGdt
YWlsLmNvbT4KLS0tCmFwcGxpZXMgY2xlYW5seSBvbiBuZXh0LTIwMjAwNzAzCgpPbmRyZWosIHBs
ZWFzZSBhY2sgdGhpcyBwYXRjaC4KU2FtLCBwbGVhc2UgcGljayB0aGlzIG1pbm9yIG5vbi11cmdl
bnQgcGF0Y2ggaW50byB5b3VyIC1uZXh0IHRyZWUuCgpUaGlzIGlzIHRoZSBtaW5pbWFsIGNoYW5n
ZSB0byBhZGRyZXNzIHRoZSB3YXJuaW5nLiBZb3UgbWlnaHQgY29uc2lkZXIKY2hhbmdpbmcgdGhl
IG5hbWUgb2YgdGhlIHNlY3Rpb24gZnJvbSBST0NLVEVDSCB0byBTVDc3MDMsIGNoYW5nZQptYWlu
dGFpbmVycyBldGMuCgogTUFJTlRBSU5FUlMgfCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGlu
c2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvTUFJTlRBSU5FUlMgYi9N
QUlOVEFJTkVSUwppbmRleCA5Mzc1ZWRhZWYxMWYuLjhhN2I5MmZhZmY5OSAxMDA2NDQKLS0tIGEv
TUFJTlRBSU5FUlMKKysrIGIvTUFJTlRBSU5FUlMKQEAgLTU0OTMsOCArNTQ5Myw4IEBAIERSTSBE
UklWRVIgRk9SIFJPQ0tURUNIIEpIMDU3TjAwOTAwIFBBTkVMUwogTToJR3VpZG8gR8O8bnRoZXIg
PGFneEBzaWd4Y3B1Lm9yZz4KIFI6CVB1cmlzbSBLZXJuZWwgVGVhbSA8a2VybmVsQHB1cmkuc20+
CiBTOglNYWludGFpbmVkCi1GOglEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlz
cGxheS9wYW5lbC9yb2NrdGVjaCxqaDA1N24wMDkwMC50eHQKLUY6CWRyaXZlcnMvZ3B1L2RybS9w
YW5lbC9wYW5lbC1yb2NrdGVjaC1qaDA1N24wMDkwMC5jCitGOglEb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9yb2NrdGVjaCxqaDA1N24wMDkwMC55YW1sCitG
Oglkcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtc2l0cm9uaXgtc3Q3NzAzLmMKIAogRFJNIERS
SVZFUiBGT1IgU0FWQUdFIFZJREVPIENBUkRTCiBTOglPcnBoYW4gLyBPYnNvbGV0ZQotLSAKMi4x
Ny4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
