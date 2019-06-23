Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 203824FB17
	for <lists+dri-devel@lfdr.de>; Sun, 23 Jun 2019 12:35:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6121589A94;
	Sun, 23 Jun 2019 10:35:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B59F89A94
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Jun 2019 10:35:53 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id 205so1042955ljj.8
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Jun 2019 03:35:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=8NEipPZzxxiz+G9cxMhqRYI8LttdatBxvDNL2mjaQaY=;
 b=foPW8YuVo8O1L1zAsLi3QL75pSsF+b0JJF7wSn8pnKaQMEg1Z4jER9C5kfVfL7PwPV
 BdRZsqhPyxv/lYEiFxpvt5Ub6fAhy3kA9s+YNJa+07N0St3JFC77vJPKvX7aqtQLLtiy
 bY83kuE+HvqVVr2iC9xSIRYMCJ9EWSdzVsFDfHUCYrlas55CITJN1pwFvYfeR7Ph9yX5
 Px31Z/Z9UoFJKWEngGnh8A2HA2hgxxIhzH/NN92CdOCw163EumpjejGiNVotTDInyAPG
 lv/vtXxQmW+7on98F+iPO6rrMD9AWG4gOgooAQDR7Eal+fvrqj/L6JwMSCJCXO5ivKKU
 7ozA==
X-Gm-Message-State: APjAAAX54BgPTi5GUU7Xk6b5MmE9T3w69x2vczczwl48A3Zkzn3yGTEA
 C7TawJhWQTjoLnsOEgTnpr3IGyZEssOEKQ==
X-Google-Smtp-Source: APXvYqwHHBUb42s8WQDNbFasVejjI4YkBfI1JP0dvfXGy34k97fko6BxygCFVP7DSspd2wyFFUpPgw==
X-Received: by 2002:a2e:8ed2:: with SMTP id e18mr31780311ljl.235.1561286151831; 
 Sun, 23 Jun 2019 03:35:51 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 x22sm1124248lfq.20.2019.06.23.03.35.50
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 23 Jun 2019 03:35:51 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 0/4] drm/{mga,mgag200}: drop use of drmP.h
Date: Sun, 23 Jun 2019 12:35:38 +0200
Message-Id: <20190623103542.30697-1-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8NEipPZzxxiz+G9cxMhqRYI8LttdatBxvDNL2mjaQaY=;
 b=e0/fn5yM5iD9qCqSFRNT0KzggUTv5cvNv0W0RY1HWP5Df4b/dAVMv9FwbDvc9bObVm
 tkq/NMcBm6bmFmBncBJdRDpUz12ZuGZqFJSB8H48KWTsQ9Wf3NM3PbxbPZ8MaI2bydjD
 KlQIDiMAA55POaRjvtZWYmMbmCeNTrwhz1L+TH27Zp0FYwTfLHlfueCVXXQ1oNyCOL+5
 yxTReRXgIzoW+aw6N9sf1xIUCSssIUdM/aZZINQrLopAhx96WqUtpV6LjBQQBqeYXdtq
 e37ShD6w1TG+tBe1NwacrcHR2iKClQHhzk4f9pPhMi9dmolUncwYYuFowXslwhQcnUDn
 /YJQ==
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
Cc: David Airlie <airlied@linux.ie>, Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RHJvcCB1c2Ugb2YgdGhlIGRlcHJlY2F0ZWQgZHJtUC5oIGhlYWRlciBmaWxlLgpBbHNvIGRyb3Ag
dXNlIG9mIGRybV9vc19saW51eC5oIGFzIGl0IGlzIGRlcHJlY2F0ZWQgdG9vLAphbmQgd2FzIHB1
bGxlZCBpbiB2aWEgZHJtUC5oCgpCdWlsZCB0ZXN0ZWQgd2l0aCBhbGxtb2Rjb25maWcsIGFsbHll
c2NvbmZpZyBvbgp2YXJpb3VzIGFyY2hpdGVjdHVyZXMuCgp2MjoKLSBGaXggdGltZW91dCBpbiB3
YWl0X2V2ZW50Ki4gMyAqIEhaIGVxdWFscyB0byAzMDAwIG1zZWNzCiAgKHRoaXMgaXMgYXQgbGVh
c3QgbXkgYmVzdCB1bmRlcnN0YW5kaW5nKQotIGRyb3AgdW51c2VkIHJldHVybiB2YWx1ZSB0byBj
bGVhbiB1cCB0aGUgY29kZSBhIGxpdHRsZQotIGFkZGVkIGFjayBmcm9tIFRob21hcyBaLiB0byBh
bGwgcGF0Y2hlcwoKCVNhbQoKU2FtIFJhdm5ib3JnICg0KToKICAgICAgZHJtL21nYTogZHJvcCBk
ZXBlbmRlbmN5IG9uIGRybV9vc19saW51eC5oCiAgICAgIGRybS9tZ2E6IG1ha2UgaGVhZGVyIGZp
bGUgc2VsZiBjb250YWluZWQKICAgICAgZHJtL21nYTogZHJvcCB1c2Ugb2YgZHJtUC5oCiAgICAg
IGRybS9tZ2FnMjAwOiBkcm9wIHVzZSBvZiBkcm1QLmgKCiBkcml2ZXJzL2dwdS9kcm0vbWdhL21n
YV9kbWEuYyAgICAgICAgICAgIHwgMTMgKysrKysrKy0tLS0tLQogZHJpdmVycy9ncHUvZHJtL21n
YS9tZ2FfZHJ2LmMgICAgICAgICAgICB8ICA3ICsrKy0tLS0KIGRyaXZlcnMvZ3B1L2RybS9tZ2Ev
bWdhX2Rydi5oICAgICAgICAgICAgfCAyNyArKysrKysrKysrKysrKysrKysrKysrLS0tLS0KIGRy
aXZlcnMvZ3B1L2RybS9tZ2EvbWdhX2lvYzMyLmMgICAgICAgICAgfCAgMyArLS0KIGRyaXZlcnMv
Z3B1L2RybS9tZ2EvbWdhX2lycS5jICAgICAgICAgICAgfCAxMiArKysrLS0tLS0tLS0KIGRyaXZl
cnMvZ3B1L2RybS9tZ2EvbWdhX3N0YXRlLmMgICAgICAgICAgfCAgOCArKystLS0tLQogZHJpdmVy
cy9ncHUvZHJtL21nYS9tZ2Ffd2FycC5jICAgICAgICAgICB8ICA0ICstLS0KIGRyaXZlcnMvZ3B1
L2RybS9tZ2FnMjAwL21nYWcyMDBfY3Vyc29yLmMgfCAgMyArKy0KIGRyaXZlcnMvZ3B1L2RybS9t
Z2FnMjAwL21nYWcyMDBfZHJ2LmMgICAgfCAxMCArKysrKysrLS0tCiBkcml2ZXJzL2dwdS9kcm0v
bWdhZzIwMC9tZ2FnMjAwX2Rydi5oICAgIHwgIDggKysrLS0tLS0KIGRyaXZlcnMvZ3B1L2RybS9t
Z2FnMjAwL21nYWcyMDBfZmIuYyAgICAgfCAgOSArKysrKystLS0KIGRyaXZlcnMvZ3B1L2RybS9t
Z2FnMjAwL21nYWcyMDBfaTJjLmMgICAgfCAgNiArKysrLS0KIGRyaXZlcnMvZ3B1L2RybS9tZ2Fn
MjAwL21nYWcyMDBfbWFpbi5jICAgfCAgNCArKystCiBkcml2ZXJzL2dwdS9kcm0vbWdhZzIwMC9t
Z2FnMjAwX21vZGUuYyAgIHwgIDMgKystCiBkcml2ZXJzL2dwdS9kcm0vbWdhZzIwMC9tZ2FnMjAw
X3R0bS5jICAgIHwgIDMgKystCiAxNSBmaWxlcyBjaGFuZ2VkLCA3MCBpbnNlcnRpb25zKCspLCA1
MCBkZWxldGlvbnMoLSkKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
