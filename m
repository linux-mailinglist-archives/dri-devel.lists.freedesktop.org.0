Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20F22F1060
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2019 08:33:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0C9F6EC1D;
	Wed,  6 Nov 2019 07:33:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com
 [IPv6:2607:f8b0:4864:20::d42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D41736EB86
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Nov 2019 22:58:11 +0000 (UTC)
Received: by mail-io1-xd42.google.com with SMTP id 1so24708131iou.4
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Nov 2019 14:58:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wbzRqvc8FvWk5sR5KGdavxWwldxvQh4qHgl2mJoTxrs=;
 b=LI/8EmhhJXqzKCyDePOMTakzHWJyEyL2T/ieb7QEOF5d3Tlp2JAhI1tb2o6NveV27P
 e5xjcZSEezydroB8hTPFs0cfEKWcGhVsjTP93HUSJb23oMLt3LTh2YBiv1GTwsdufmZK
 3qPEtzBJ9mOSl2K0BBu2ZZ38+LsifjQGnrSoxMkEKxMJbhWsiUD2wMbbPxrHu97nxOXX
 kwydYzDuW/jF79M8WD2Kez6xCdtCnUYZXq1Z6qA0leravNNeSk6N8TXDS86RZEPX827i
 KnsVVb7H7VYZ4O4JSxsDXI/Enft4qZ1sUg+q4oZxgkbr3FVeVpOKQGWzZM75QLktMS5Z
 XV/g==
X-Gm-Message-State: APjAAAXb4gLI8vP5m/LJa94Jr26EKcjktdgPiCyU/fhnbQ1LjOcchsv1
 nLyllG9oMy10pjJNAHxpnEtd+g==
X-Google-Smtp-Source: APXvYqx6XmtvqfERYm4mk+w5mZ3zxi4aVxOq3gZEKoAHqSgi4r3FR4hhxOQ8lCOIGxmzgBNdCQ7Gog==
X-Received: by 2002:a5e:9e49:: with SMTP id j9mr31748458ioq.170.1572994691162; 
 Tue, 05 Nov 2019 14:58:11 -0800 (PST)
Received: from localhost ([2620:15c:183:0:82e0:aef8:11bc:24c4])
 by smtp.gmail.com with ESMTPSA id w75sm3229673ill.78.2019.11.05.14.58.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Nov 2019 14:58:10 -0800 (PST)
From: Raul E Rangel <rrangel@chromium.org>
To: alexander.deucher@amd.com
Subject: [PATCH] drm/amd/powerplay: fix struct init in renoir_print_clk_levels
Date: Tue,  5 Nov 2019 15:58:02 -0700
Message-Id: <20191105155734.1.If8740b4a5095031f2c00746fbc3224be9849d76b@changeid>
X-Mailer: git-send-email 2.24.0.rc1.363.gb1bccd3e3d-goog
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 06 Nov 2019 07:33:32 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wbzRqvc8FvWk5sR5KGdavxWwldxvQh4qHgl2mJoTxrs=;
 b=d07BWnCDYPq9AbOnFZh2cQnq7+WxNalVgk1NTA6PdAf0WHN3tNd9j7t7pDoGQ+hGhu
 LaAnphcRnalev4XUEeyJhexhL9HhsSJ9+mrPtIw4cYe2l/QTd8wotEDPQpAXy4WC/C1E
 S57U277pgztnLd2YvzPT08RDIr+xTsZMDxepI=
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Raul E Rangel <rrangel@chromium.org>,
 amd-gfx@lists.freedesktop.org, Evan Quan <evan.quan@amd.com>,
 Rex Zhu <rex.zhu@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvcmVub2lyX3BwdC5jOjE4NjoyOiBlcnJvcjog
bWlzc2luZyBicmFjZXMKYXJvdW5kIGluaXRpYWxpemVyIFstV2Vycm9yPW1pc3NpbmctYnJhY2Vz
XQogIFNtdU1ldHJpY3NfdCBtZXRyaWNzID0gezB9OwogICAgXgoKRml4ZXM6IDhiODAzMTcwM2Jk
NyAoImRybS9hbWQvcG93ZXJwbGF5OiBpbXBsZW1lbnQgc3lzZnMgZm9yIGdldHRpbmcgZHBtIGNs
b2NrIikKClNpZ25lZC1vZmYtYnk6IFJhdWwgRSBSYW5nZWwgPHJyYW5nZWxAY2hyb21pdW0ub3Jn
PgotLS0KCiBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9yZW5vaXJfcHB0LmMgfCA0ICsr
Ky0KIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9yZW5vaXJfcHB0LmMgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9yZW5vaXJfcHB0LmMKaW5kZXggZTYyYmZiYTUxNTYy
Li5lNTI4M2RhZmM0MTQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5
L3Jlbm9pcl9wcHQuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9yZW5vaXJf
cHB0LmMKQEAgLTE4MywxMSArMTgzLDEzIEBAIHN0YXRpYyBpbnQgcmVub2lyX3ByaW50X2Nsa19s
ZXZlbHMoc3RydWN0IHNtdV9jb250ZXh0ICpzbXUsCiAJaW50IGksIHNpemUgPSAwLCByZXQgPSAw
OwogCXVpbnQzMl90IGN1cl92YWx1ZSA9IDAsIHZhbHVlID0gMCwgY291bnQgPSAwLCBtaW4gPSAw
LCBtYXggPSAwOwogCURwbUNsb2Nrc190ICpjbGtfdGFibGUgPSBzbXUtPnNtdV90YWJsZS5jbG9j
a3NfdGFibGU7Ci0JU211TWV0cmljc190IG1ldHJpY3MgPSB7MH07CisJU211TWV0cmljc190IG1l
dHJpY3M7CiAKIAlpZiAoIWNsa190YWJsZSB8fCBjbGtfdHlwZSA+PSBTTVVfQ0xLX0NPVU5UKQog
CQlyZXR1cm4gLUVJTlZBTDsKIAorCW1lbXNldCgmbWV0cmljcywgMCwgc2l6ZW9mKG1ldHJpY3Mp
KTsKKwogCXJldCA9IHNtdV91cGRhdGVfdGFibGUoc211LCBTTVVfVEFCTEVfU01VX01FVFJJQ1Ms
IDAsCiAJCQkgICAgICAgKHZvaWQgKikmbWV0cmljcywgZmFsc2UpOwogCWlmIChyZXQpCi0tIAoy
LjI0LjAucmMxLjM2My5nYjFiY2NkM2UzZC1nb29nCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
