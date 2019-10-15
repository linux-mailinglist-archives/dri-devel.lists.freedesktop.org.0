Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B6F6ED78A5
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2019 16:35:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C83916E822;
	Tue, 15 Oct 2019 14:35:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 355936E823
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2019 14:35:16 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id n14so24130990wrw.9
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2019 07:35:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+1m/JhUbxeshzzZmmrk9CkPfroqbpS0DZe1kCCEp8HE=;
 b=E7msTufKMjs9aYc0aQVyrK4u+ZQmtund/xcZzazIuIrkFObDZ7EnGggVql1zv1FWBO
 5wle1qI2HZhG+lE2JN8WXi7cNyFvnos8p5OmgA0HOFXRr3hHD2G/eCpiibiDMwnKUcHI
 McC6C4Ib3lppNwR3gC94HvdxuluI1UMQ23HUznV+jZwDe5P7ugSpSebjJcQlOCoNrev4
 tJBB+6+zfAteUoxfcZ/lM1NPPNGtBfPyLKGd902v9q1y6rm6/Ee8/c4ZJggR2AGeCGOg
 KaKAxHPh6KZvxTczULmsurzs9ArZAEbVIDFipDRgia+AkF/sEVSJLaBbc+odP5kzy7UU
 9YZA==
X-Gm-Message-State: APjAAAU8wdx/qBiyQzlMzGtk0tAiHKEwPfs3GVkqyo85xRk/mR9I9GWq
 AhI+ASnvOQLjl58EHUxgde7IlM5V
X-Google-Smtp-Source: APXvYqyMdsa4iQ6W/RkWYeZsf7NQv2F7RdFRrAM7zZqMPpACc1jn9DaVbWKVL0PA0eO9ipj7PBweTA==
X-Received: by 2002:a5d:40c6:: with SMTP id b6mr15883508wrq.90.1571150114301; 
 Tue, 15 Oct 2019 07:35:14 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
 by smtp.gmail.com with ESMTPSA id m62sm19873009wmm.35.2019.10.15.07.35.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Oct 2019 07:35:13 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 01/15] drm/dp: Sort includes alphabetically
Date: Tue, 15 Oct 2019 16:34:55 +0200
Message-Id: <20191015143509.1104985-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191015143509.1104985-1-thierry.reding@gmail.com>
References: <20191015143509.1104985-1-thierry.reding@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+1m/JhUbxeshzzZmmrk9CkPfroqbpS0DZe1kCCEp8HE=;
 b=QZDbMReajffp3JmszjfcKvmAgT2wmb92Udjm04d+7VNODbqpmB1YSe1+/cp6Jo4Rqs
 T46VUHOBDN2vjXH8aPaIkEl7ZXMoYkPORSIFXOQWu4/BF9kAat0lLhHVBaoO3LoA+Yzp
 W4NgO1oak88Oma8kK7rt2dW2NYmHe7iRnOZ3TXzUzeZdtTYAA0JMfxloDJQP9KMhfMQL
 Be5qzcjVuH3xOBeaUifY/+w32AqxsVN36uOK2VecMTOAsAaVQFxJyX3ChjXXgrNI1FdI
 AyhaOHJ/e2V61qSST09zJdzncu0BdX3gDDH5VtU5BCWlzvL6flIRBLOxIlg6jTMHOcgw
 3vvQ==
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KCktlZXBpbmcgdGhlIGxp
c3Qgc29ydGVkIGFscGhhYmV0aWNhbGx5IG1ha2VzIGl0IG11Y2ggZWFzaWVyIHRvIGRldGVybWlu
ZQp3aGVyZSB0byBhZGQgbmV3IGluY2x1ZGVzLgoKU2lnbmVkLW9mZi1ieTogVGhpZXJyeSBSZWRp
bmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KLS0tCiBpbmNsdWRlL2RybS9kcm1fZHBfaGVscGVyLmgg
fCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0p
CgpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vZHJtX2RwX2hlbHBlci5oIGIvaW5jbHVkZS9kcm0v
ZHJtX2RwX2hlbHBlci5oCmluZGV4IGJmNjJiNDNhYWYyYi4uNTJmZjFmMjRhMjRkIDEwMDY0NAot
LS0gYS9pbmNsdWRlL2RybS9kcm1fZHBfaGVscGVyLmgKKysrIGIvaW5jbHVkZS9kcm0vZHJtX2Rw
X2hlbHBlci5oCkBAIC0yMyw5ICsyMyw5IEBACiAjaWZuZGVmIF9EUk1fRFBfSEVMUEVSX0hfCiAj
ZGVmaW5lIF9EUk1fRFBfSEVMUEVSX0hfCiAKLSNpbmNsdWRlIDxsaW51eC90eXBlcy5oPgotI2lu
Y2x1ZGUgPGxpbnV4L2kyYy5oPgogI2luY2x1ZGUgPGxpbnV4L2RlbGF5Lmg+CisjaW5jbHVkZSA8
bGludXgvaTJjLmg+CisjaW5jbHVkZSA8bGludXgvdHlwZXMuaD4KIAogLyoKICAqIFVubGVzcyBv
dGhlcndpc2Ugbm90ZWQsIGFsbCB2YWx1ZXMgYXJlIGZyb20gdGhlIERQIDEuMWEgc3BlYy4gIE5v
dGUgdGhhdAotLSAKMi4yMy4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
