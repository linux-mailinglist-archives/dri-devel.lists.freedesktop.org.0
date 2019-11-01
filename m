Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C9D2EC37E
	for <lists+dri-devel@lfdr.de>; Fri,  1 Nov 2019 14:05:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74BBC6F7CE;
	Fri,  1 Nov 2019 13:05:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D0BB6E223
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Nov 2019 13:05:13 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id t26so4934122wmi.4
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Nov 2019 06:05:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3IVyhJFBg6AmCFnEdT3lCIZl0TWBzR6nJQgjh9Ae8SU=;
 b=XpXFcnIexO/2J9GdkISKvhWMvnheVhAIVlqJpd3qixE9nECjCxeNqVbEmvdDi+NbhH
 ZHhjviVqy9VUrZkFxoAgThVU1qlBFVnXVOfcnvp4R2wNIhvS0rE7/tMWcuQAGE9hc1Gi
 abwI6wG4e6cUUQYBL6Uj4005yRE6BfeN7sKkH/hCBhTfBzqnHdw20Z3IRVYtzjxSiOm3
 uGAuM9KI/NXfQh67brdjH++J8AnFjejEQXOKil+X23BJjJtJ5sIzUglmKWR7LMEPRgkB
 t/4RWpV4NL7Jln4jpKThqKY1r/2eAQRUlZKNRPGqt31LmCccl3TZftU7yutCHbij6b2Z
 jzQQ==
X-Gm-Message-State: APjAAAXFZVaMMA1WaTWZ0UMEeAKHWK3jvgyz3y2+JofcCW3guDxgAEW6
 6d3goFd045TTTz05tmMhuqN0pnSc
X-Google-Smtp-Source: APXvYqwiIH70sMtyI+njg4Wgzd3JLPXiBlya1sWilkS6Eo6q6QR0cMsP8916ExJelCDZCZ8vdqi9tw==
X-Received: by 2002:a1c:4c11:: with SMTP id z17mr9616143wmf.59.1572613510923; 
 Fri, 01 Nov 2019 06:05:10 -0700 (PDT)
Received: from arch-x1c3.cbg.collabora.co.uk
 ([2a00:5f00:102:0:9665:9cff:feee:aa4d])
 by smtp.gmail.com with ESMTPSA id a15sm2450562wmm.12.2019.11.01.06.05.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Nov 2019 06:05:10 -0700 (PDT)
From: Emil Velikov <emil.l.velikov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 4/5] drm/panfrost: remove DRM_AUTH and respective comment
Date: Fri,  1 Nov 2019 13:03:12 +0000
Message-Id: <20191101130313.8862-4-emil.l.velikov@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191101130313.8862-1-emil.l.velikov@gmail.com>
References: <20191101130313.8862-1-emil.l.velikov@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3IVyhJFBg6AmCFnEdT3lCIZl0TWBzR6nJQgjh9Ae8SU=;
 b=ndOaYt+a6o98bEuRUvjDHtw9OlGyNIiOh3uBtLlwD7GvAidMvap+4Zwi1dy926/YFp
 jh9PO8UPxwCUM+GrTQD/gm5vdcD59AWFZJu9EpKfQUDhu0seBBcRUR9N0lfgBnsnI4By
 bigWwJx0SXGjqR+7slvX8aHd+TD8udICFQ9y/ezQ1UdOa+NxWBkV/0cBQWTK5u5XDrhb
 EHsYP9LiSTPVUQPhPf8ThnyIyZAJPtURWD+X/4jbFpzlzPiHqzdz3u9I8x5eP4HfUsDY
 u5k9vLCV0wo4OvP9XXOmyF3sq2A0/jhnzrNxVyr0GrBUEjaKpUZ50zVXzAnwG/RXPuTy
 0mmQ==
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 emil.l.velikov@gmail.com, Steven Price <steven.price@arm.com>,
 Robin Murphy <robin.murphy@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogRW1pbCBWZWxpa292IDxlbWlsLnZlbGlrb3ZAY29sbGFib3JhLmNvbT4KCkFzIG9mIGVh
cmxpZXIgY29tbWl0IHdlIGhhdmUgYWRkcmVzcyBzcGFjZSBzZXBhcmF0aW9uLiBZZXQgd2UgZm9y
Z290IHRvCnJlbW92ZSB0aGUgcmVzcGVjdGl2ZSBjb21tZW50IGFuZCBEUk1fQVVUSCBpbiB0aGUg
aW9jdGwgZGVjbGFyYXRpb24uCgpDYzogVG9tZXUgVml6b3NvIDx0b21ldS52aXpvc29AY29sbGFi
b3JhLmNvbT4KQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KQ2M6IERhbmllbCBW
ZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KQ2M6IFJvYmluIE11cnBoeSA8cm9iaW4ubXVycGh5QGFy
bS5jb20+CkNjOiBTdGV2ZW4gUHJpY2UgPHN0ZXZlbi5wcmljZUBhcm0uY29tPgpGaXhlczogNzI4
MmY3NjQ1ZDA2ICgiZHJtL3BhbmZyb3N0OiBJbXBsZW1lbnQgcGVyIEZEIGFkZHJlc3Mgc3BhY2Vz
IikKU2lnbmVkLW9mZi1ieTogRW1pbCBWZWxpa292IDxlbWlsLnZlbGlrb3ZAY29sbGFib3JhLmNv
bT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZHJ2LmMgfCA2ICstLS0t
LQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCA1IGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kcnYuYyBiL2RyaXZlcnMv
Z3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kcnYuYwppbmRleCBiYzJkZGViNTVmNWQuLmM2Nzdi
MmM5ZTQwOSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2Ry
di5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kcnYuYwpAQCAtNDUx
LDE1ICs0NTEsMTEgQEAgcGFuZnJvc3RfcG9zdGNsb3NlKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYs
IHN0cnVjdCBkcm1fZmlsZSAqZmlsZSkKIAlrZnJlZShwYW5mcm9zdF9wcml2KTsKIH0KIAotLyog
RFJNX0FVVEggaXMgcmVxdWlyZWQgb24gU1VCTUlUIGZvciBub3csIHdoaWxlIGFsbCBjbGllbnRz
IHNoYXJlIGEgc2luZ2xlCi0gKiBhZGRyZXNzIHNwYWNlLiAgTm90ZSB0aGF0IHJlbmRlciBub2Rl
cyB3b3VsZCBiZSBhYmxlIHRvIHN1Ym1pdCBqb2JzIHRoYXQKLSAqIGNvdWxkIGFjY2VzcyBCT3Mg
ZnJvbSBjbGllbnRzIGF1dGhlbnRpY2F0ZWQgd2l0aCB0aGUgbWFzdGVyIG5vZGUuCi0gKi8KIHN0
YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2lvY3RsX2Rlc2MgcGFuZnJvc3RfZHJtX2RyaXZlcl9pb2N0
bHNbXSA9IHsKICNkZWZpbmUgUEFORlJPU1RfSU9DVEwobiwgZnVuYywgZmxhZ3MpIFwKIAlEUk1f
SU9DVExfREVGX0RSVihQQU5GUk9TVF8jI24sIHBhbmZyb3N0X2lvY3RsXyMjZnVuYywgZmxhZ3Mp
CiAKLQlQQU5GUk9TVF9JT0NUTChTVUJNSVQsCQlzdWJtaXQsCQlEUk1fUkVOREVSX0FMTE9XIHwg
RFJNX0FVVEgpLAorCVBBTkZST1NUX0lPQ1RMKFNVQk1JVCwJCXN1Ym1pdCwJCURSTV9SRU5ERVJf
QUxMT1cpLAogCVBBTkZST1NUX0lPQ1RMKFdBSVRfQk8sCQl3YWl0X2JvLAlEUk1fUkVOREVSX0FM
TE9XKSwKIAlQQU5GUk9TVF9JT0NUTChDUkVBVEVfQk8sCWNyZWF0ZV9ibywJRFJNX1JFTkRFUl9B
TExPVyksCiAJUEFORlJPU1RfSU9DVEwoTU1BUF9CTywJCW1tYXBfYm8sCURSTV9SRU5ERVJfQUxM
T1cpLAotLSAKMi4yMy4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
