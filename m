Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F2CB8FF8F3
	for <lists+dri-devel@lfdr.de>; Sun, 17 Nov 2019 12:44:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C5686E290;
	Sun, 17 Nov 2019 11:44:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D812C6E169
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Nov 2019 15:13:27 +0000 (UTC)
Received: by mail-pg1-x543.google.com with SMTP id 15so7365331pgh.5
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Nov 2019 07:13:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1NR0lZBfSAsF9PTcWhdjtOR0vndWuNhvYIvZ0O6q/gY=;
 b=CgyWNYflfvVQXu4VPwd2RM/tH+uEAkj51NRSf/ZkKwlh+AiNGC+dretJjAwh++eVMM
 qOjjaVB5DZC+B9kp2RgDqtQZfeWnRWq5QS0MfNInWIHE+3g4pYoZOxl0i36gyZRkrK70
 q53nSReOeFfeIIu3fDS1GXCmKmuxPa/iE11LADukQctLMBlVAMelGqpIDm8eaVhoAZ7d
 Vnl9F8oS41AahfZ+hF1T2ie9cczys7ib6mWnB29UK14DXBibpPOvNmJ7Wh0TYGEzk/2s
 fbmbYfDq587DBISPFXruA4LJvosVBQ0pBnS/89dDo9yjzFADx5Hz3sStkIUwJexfN06Y
 Y57w==
X-Gm-Message-State: APjAAAXDtXlxtN91O/awJBWOEgtWAXlxudFoQYc0CFjygzIDCzuGS19C
 iBZUTMUO40ygBOQxVLqTGbs=
X-Google-Smtp-Source: APXvYqwLV+Q22WHhBCIyjc4XfkdYQHcDZZlOf6JUEe1X4D7cOUaa++BL8PFFUkrqKStocMzbnbRfew==
X-Received: by 2002:a63:ea17:: with SMTP id c23mr22941078pgi.85.1573917207501; 
 Sat, 16 Nov 2019 07:13:27 -0800 (PST)
Received: from suzukaze.ipads-lab.se.sjtu.edu.cn ([202.120.40.82])
 by smtp.gmail.com with ESMTPSA id m6sm7250201pgl.42.2019.11.16.07.13.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Nov 2019 07:13:26 -0800 (PST)
From: Chuhong Yuan <hslester96@gmail.com>
To: 
Subject: [PATCH] video: fbdev: vesafb: add missed release_region
Date: Sat, 16 Nov 2019 23:13:18 +0800
Message-Id: <20191116151318.17874-1-hslester96@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 17 Nov 2019 11:44:17 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1NR0lZBfSAsF9PTcWhdjtOR0vndWuNhvYIvZ0O6q/gY=;
 b=t2Fixbx8FrbucKGgmC0xyNorjg8XHYcKKOvOb8d4MqBkw4RSLbRua9PFBL0WqPxO0S
 vzDvoPgs9fsNawm1/nDoQKxbYxRICBGkFkcfS7fuYJaPFxrncKHsrBhSmQ0NoZs00GtC
 XPESdybY3jw3R/zj4Y2fTrDBHkIufqP6WxPogUcFDZKmSox1lRiVh9GXFryLXUCs1Fba
 +isMDFrscgXvX88Oib81T5jkgiraCTz5X8H9n3iKvL4VsT+dCUtFHaL1v0CAqwMfnEmH
 RpTXmNjRo4JByPO7ElefkJDkchq5mfKDrHCresVem8NOzbla+YCV+OIMM7J8v8VK/fJY
 umnw==
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
Cc: linux-fbdev@vger.kernel.org, Chuhong Yuan <hslester96@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBkcml2ZXIgY2FsbHMgcmVxdWVzdF9yZWdpb24gaW4gcHJvYmUgYnV0IGZvcmdldHMgdG8g
Y2FsbApyZWxlYXNlX3JlZ2lvbiBpbiBwcm9iZSBmYWlsdXJlIGFuZCByZW1vdmUuCkFkZCB0aGUg
bWlzc2VkIGNhbGxzIHRvIGZpeCBpdC4KClNpZ25lZC1vZmYtYnk6IENodWhvbmcgWXVhbiA8aHNs
ZXN0ZXI5NkBnbWFpbC5jb20+Ci0tLQogZHJpdmVycy92aWRlby9mYmRldi92ZXNhZmIuYyB8IDIg
KysKIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJz
L3ZpZGVvL2ZiZGV2L3Zlc2FmYi5jIGIvZHJpdmVycy92aWRlby9mYmRldi92ZXNhZmIuYwppbmRl
eCBkOWMwOGY2YzIxNTUuLmZiYjE5NmE4YmJmNiAxMDA2NDQKLS0tIGEvZHJpdmVycy92aWRlby9m
YmRldi92ZXNhZmIuYworKysgYi9kcml2ZXJzL3ZpZGVvL2ZiZGV2L3Zlc2FmYi5jCkBAIC00Njgs
NiArNDY4LDcgQEAgc3RhdGljIGludCB2ZXNhZmJfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2Rldmlj
ZSAqZGV2KQogCWZiX2luZm8oaW5mbywgIiVzIGZyYW1lIGJ1ZmZlciBkZXZpY2VcbiIsIGluZm8t
PmZpeC5pZCk7CiAJcmV0dXJuIDA7CiBlcnI6CisJcmVsZWFzZV9yZWdpb24oMHgzYzAsIDMyKTsK
IAlhcmNoX3BoeXNfd2NfZGVsKHBhci0+d2NfY29va2llKTsKIAlpZiAoaW5mby0+c2NyZWVuX2Jh
c2UpCiAJCWlvdW5tYXAoaW5mby0+c2NyZWVuX2Jhc2UpOwpAQCAtNDgwLDYgKzQ4MSw3IEBAIHN0
YXRpYyBpbnQgdmVzYWZiX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogewog
CXN0cnVjdCBmYl9pbmZvICppbmZvID0gcGxhdGZvcm1fZ2V0X2RydmRhdGEocGRldik7CiAKKwly
ZWxlYXNlX3JlZ2lvbigweDNjMCwgMzIpOwogCXVucmVnaXN0ZXJfZnJhbWVidWZmZXIoaW5mbyk7
CiAJZnJhbWVidWZmZXJfcmVsZWFzZShpbmZvKTsKIAotLSAKMi4yNC4wCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
