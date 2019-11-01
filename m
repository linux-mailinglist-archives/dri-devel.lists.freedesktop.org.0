Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 87539ECBBB
	for <lists+dri-devel@lfdr.de>; Fri,  1 Nov 2019 23:51:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBBDD6F89B;
	Fri,  1 Nov 2019 22:51:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09C316E245
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Nov 2019 14:38:14 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id v3so8879398wmh.1
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Nov 2019 07:38:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=d/QAmQIaJZqvBZN9gtf42lfTOPBui/1bELKuGyuJdb8=;
 b=tj0HigCM5to1a9l9AP/f9W9e3IjD6J4xkthRxf1yO959FLNQrbyHqoH9EUKSMNRg2p
 HNt2OgZcWmzNq5eExDtcvCnXxYyzx6u9JhyEtJ8jmLxog2g3m37JA8phv9kGedPQlCTT
 D2JpAhv5dIabxyidCLtreORgzmB10jF2HBHja6m8SJsZC0iD9chXHLfBJAdanVpaL0xr
 JaRhUBraXAVL4b4Z3Jh87S63yAJ0IU4UflO36JqKpCdhj/yawDZZfbVuLNO7rpDMZNq6
 FgiSWK8dyv7tbRlp4b4LN64ApxDMHx10Os6de0aXi5K08MlPHR/1uaNE2PwMj1iaVBkf
 IHwA==
X-Gm-Message-State: APjAAAWJMKVs3FZD6iEIBRlYQIwBAAdMAMXAikS/FucqMScDSAzfttOl
 1m76WnxZYvEP8Mniy0CCLhCs7Y6EyuY=
X-Google-Smtp-Source: APXvYqyI+Q4wEtZDCOGjwU9VHlMJmHZrNaWIfLyrtIJAa8a3WH1InYAp3J1RaSxDOIYycLFVQMvstw==
X-Received: by 2002:a1c:10a:: with SMTP id 10mr10579982wmb.17.1572619092780;
 Fri, 01 Nov 2019 07:38:12 -0700 (PDT)
Received: from suzukaze.ipads-lab.se.sjtu.edu.cn ([202.120.40.82])
 by smtp.gmail.com with ESMTPSA id l15sm6391895wmh.18.2019.11.01.07.38.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Nov 2019 07:38:12 -0700 (PDT)
From: Chuhong Yuan <hslester96@gmail.com>
To: 
Subject: [PATCH] gpu: ipu-v3: prg: add missed clk_disable_unprepare in remove
Date: Fri,  1 Nov 2019 22:38:01 +0800
Message-Id: <20191101143801.17774-1-hslester96@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 01 Nov 2019 22:51:09 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=d/QAmQIaJZqvBZN9gtf42lfTOPBui/1bELKuGyuJdb8=;
 b=A1/aTXY88hwx0sfCCWkO613b31JI7fBe2Fo7wc0qyRX1OqGtc1ZqPTHH3fVptzI2xR
 kjtzIFwT28c8pyCN1rXIAb7VEv+u4LqEx23SRT2bH3mzJkw5AkHNOs4lt482evX6TdWF
 Owbgw07QIaJIvXlIn0YuxP0DnJ1ZY33AiQXaHs13ZhtLhRBr6AsyzgXdcRaO31s6BfbC
 cq/gJdjEVmPEDAHhPV8CvWUhlxccGm2a3OBVYvTtNkvqGihMhGX0GOr/Ignd7Nxemwmz
 JnE2XSKIlW/ZcBwn1hZtqeovVZlQjWliWYbL8JCHXD5aWz0FsGz9AIOM/1cmNSrVmNYv
 19yg==
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
Cc: Chuhong Yuan <hslester96@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIGRyaXZlciBmb3JnZXRzIHRvIGRpc2FibGUgYW5kIHVucHJlcGFyZSBjbGtzIHdoZW4gcmVt
b3ZlLgpBZGQgdGhlIGNhbGxzIHRvIGNsa19kaXNhYmxlX3VucHJlcGFyZSB0byBmaXggdGhlIHBy
b2JsZW0uCgpTaWduZWQtb2ZmLWJ5OiBDaHVob25nIFl1YW4gPGhzbGVzdGVyOTZAZ21haWwuY29t
PgotLS0KIGRyaXZlcnMvZ3B1L2lwdS12My9pcHUtcHJnLmMgfCAyICsrCiAxIGZpbGUgY2hhbmdl
ZCwgMiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvaXB1LXYzL2lwdS1w
cmcuYyBiL2RyaXZlcnMvZ3B1L2lwdS12My9pcHUtcHJnLmMKaW5kZXggMTk2Nzk3YzFiNGIzLi42
YWU2ZDYzNGM5ODMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2lwdS12My9pcHUtcHJnLmMKKysr
IGIvZHJpdmVycy9ncHUvaXB1LXYzL2lwdS1wcmcuYwpAQCAtNDMwLDYgKzQzMCw4IEBAIHN0YXRp
YyBpbnQgaXB1X3ByZ19yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAlsaXN0
X2RlbCgmcHJnLT5saXN0KTsKIAltdXRleF91bmxvY2soJmlwdV9wcmdfbGlzdF9tdXRleCk7CiAK
KwljbGtfZGlzYWJsZV91bnByZXBhcmUocHJnLT5jbGtfYXhpKTsKKwljbGtfZGlzYWJsZV91bnBy
ZXBhcmUocHJnLT5jbGtfaXBnKTsKIAlyZXR1cm4gMDsKIH0KIAotLSAKMi4yMy4wCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
