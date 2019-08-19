Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CA51A92120
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2019 12:15:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D799489C08;
	Mon, 19 Aug 2019 10:14:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61B296E0AD
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2019 07:52:48 +0000 (UTC)
Received: by mail-pl1-x643.google.com with SMTP id f19so175114plr.3
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2019 00:52:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qlKDBJIsNufW28V6ZVF8IDeGI4PGxWNApwgG/b4eTws=;
 b=CAIRClHIkCH+4RjOVToh6H4u/S33lEDJpwSBEAS5+WmRtvy6eOP2IKFmFqODJaeWLZ
 mvMOd2w/ow6XgKKTwNGldV1tK5lCwDMlpea++Nwjlo9ikgLAJ+5JBpqaya0VyboqqILp
 TX58OcMzumpRbk6o+aEBrxDU9qLGEuBOW7Gkp3KXyitPowXoYkCiusQYyGoa2D+aI409
 1UZa9tm89HvPXi+UMgxIhy0Il1TSenY2v2xfIyp0eUO8jfWLHRWpUdxtJTL74RwSqM9k
 57ogCzkYpqyV7VoL1IHRPoOG5NfqhlZyE9MyRdgjwWmvzfT9WMwvo6DNrMSzSq2FcM3M
 x7Yw==
X-Gm-Message-State: APjAAAXFIv/rsLJcPn11eH5P2qyyGVB+uN9oAylA12hVOVkQWBOQ8YA0
 WV4r1NTSL2bo4FeWC0fCqo8=
X-Google-Smtp-Source: APXvYqzRW5XFT2uy4Xb+J+nKv6a9Q/XtN7z0ZW6m0hOqBXUupwmxruhVd6F2+vcKn96+xFzwf5LRPg==
X-Received: by 2002:a17:902:e407:: with SMTP id
 ci7mr7037887plb.326.1566201168076; 
 Mon, 19 Aug 2019 00:52:48 -0700 (PDT)
Received: from localhost.localdomain ([110.225.16.165])
 by smtp.gmail.com with ESMTPSA id g3sm20081613pfm.179.2019.08.19.00.52.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Aug 2019 00:52:47 -0700 (PDT)
From: Nishka Dasgupta <nishkadg.linux@gmail.com>
To: bernie@plugable.com, b.zolnierkie@samsung.com, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH] udlfb: Make dlfb_ops constant
Date: Mon, 19 Aug 2019 13:22:36 +0530
Message-Id: <20190819075236.1051-1-nishkadg.linux@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 19 Aug 2019 10:14:48 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qlKDBJIsNufW28V6ZVF8IDeGI4PGxWNApwgG/b4eTws=;
 b=Dw0hWgkYFB3dytpBDmbQpXRk+XySvzd7IpKdq7HFPmg5QUkZU1jGDRrMOZQ/evrzrH
 RegyOEPSuMBG2ppJPMwm+u4yjS9VHVZp8hiIV57ru8ixl6hYV78Rgt92j4PptsAWREU2
 UaxO+eYdyqPPUPSFvsbjsmQxrFkZ+9EsS3kj84bxJB2PuigFj2DJgHOp9MNC06cfdcTv
 PKj40YHvsOV38eWJ4Cb1d5cDZoFXw+3saMu7lq4NrRpACn7k1f37SbPBTgmlly6uDLZ+
 tJwmlCnHD0ESpCNZZPkSnWNnNeVxHkd+ZRgLBuszRsuteg/ieTz1CPGIb3DCyErA3WR0
 47qA==
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
Cc: Nishka Dasgupta <nishkadg.linux@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U3RhdGljIHN0cnVjdHVyZSBkbGZiX29wcywgb2YgdHlwZSBmYl9vcHMsIGlzIG5vdCB1c2VkIGV4
Y2VwdCB0byBiZQpjb3BpZWQgaW50byBhbm90aGVyIHZhcmlhYmxlLiBIZW5jZSBtYWtlIGRsZmJf
b3BzIGNvbnN0YW50IHRvIHByb3RlY3QgaXQKZnJvbSB1bmludGVuZGVkIG1vZGlmaWNhdGlvbi4K
SXNzdWUgZm91bmQgd2l0aCBDb2NjaW5lbGxlLgoKU2lnbmVkLW9mZi1ieTogTmlzaGthIERhc2d1
cHRhIDxuaXNoa2FkZy5saW51eEBnbWFpbC5jb20+Ci0tLQogZHJpdmVycy92aWRlby9mYmRldi91
ZGxmYi5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9u
KC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy92aWRlby9mYmRldi91ZGxmYi5jIGIvZHJpdmVycy92
aWRlby9mYmRldi91ZGxmYi5jCmluZGV4IGMzMjhlODI2NWNiMS4uZmUzNzNiNjNkZGQ2IDEwMDY0
NAotLS0gYS9kcml2ZXJzL3ZpZGVvL2ZiZGV2L3VkbGZiLmMKKysrIGIvZHJpdmVycy92aWRlby9m
YmRldi91ZGxmYi5jCkBAIC0xMTgzLDcgKzExODMsNyBAQCBzdGF0aWMgaW50IGRsZmJfb3BzX2Js
YW5rKGludCBibGFua19tb2RlLCBzdHJ1Y3QgZmJfaW5mbyAqaW5mbykKIAlyZXR1cm4gMDsKIH0K
IAotc3RhdGljIHN0cnVjdCBmYl9vcHMgZGxmYl9vcHMgPSB7CitzdGF0aWMgY29uc3Qgc3RydWN0
IGZiX29wcyBkbGZiX29wcyA9IHsKIAkub3duZXIgPSBUSElTX01PRFVMRSwKIAkuZmJfcmVhZCA9
IGZiX3N5c19yZWFkLAogCS5mYl93cml0ZSA9IGRsZmJfb3BzX3dyaXRlLAotLSAKMi4xOS4xCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
