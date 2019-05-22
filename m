Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A6B2C2688A
	for <lists+dri-devel@lfdr.de>; Wed, 22 May 2019 18:42:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1D4189C2C;
	Wed, 22 May 2019 16:42:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 388C589BFD
 for <dri-devel@lists.freedesktop.org>; Wed, 22 May 2019 16:42:47 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id s17so3087459wru.3
 for <dri-devel@lists.freedesktop.org>; Wed, 22 May 2019 09:42:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=w/diVRkSY3GbsqvZKDkKB9JH05Fjty08jM7SF5zvRbk=;
 b=D5d6Ic13TYGs13wzcmHBg0+2SJ6bT0LcazOUBYPT+DmspTNba9rBkGdbVu8HDePDsA
 PieNU805086FfzZw8sNxeJpltczmrO26vtoWea72Gs1+wobT/PrrhR5PH4PXqGjxD1eP
 EZNNJwCaJ/PQ9eSt/WNqXWVW8j4X+egsGYPJpQD/9ciuuZ8ByvWFPjnehh8oYuV2lwyQ
 RHXqMSNS3gsuen3dioeUBfI1ZHHGd3/lU84s91SnMDINUMdobsusGuzznukblCA5xAT4
 M819ke52tIlbrIeGVQRjfvrMwqFqCFcyP5KWAw0ZiXie/RHdNLdLK1ijLNtFtSaksZjp
 1B3w==
X-Gm-Message-State: APjAAAWAcYtMm2f2CC4kcI9IdaKYZnxM8bf7+UjDb7dfEBV++97R3W8j
 Y1djCDSRqx93LADGMO7aW7qy8ua9
X-Google-Smtp-Source: APXvYqyFXwUqLogJpUThMajdoouGewR1XVB0rFswlWaAH4+nEb2Zrw+OsVCZLWB9Ylxbolfyc18KDA==
X-Received: by 2002:adf:fc46:: with SMTP id e6mr26599225wrs.298.1558543365716; 
 Wed, 22 May 2019 09:42:45 -0700 (PDT)
Received: from arch-x1c3.cbg.collabora.co.uk
 ([2a00:5f00:102:0:9665:9cff:feee:aa4d])
 by smtp.gmail.com with ESMTPSA id l18sm24576684wrv.38.2019.05.22.09.42.44
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 22 May 2019 09:42:45 -0700 (PDT)
From: Emil Velikov <emil.l.velikov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 4/5] drm/vmwgfx: remove custom ioctl io encoding check
Date: Wed, 22 May 2019 17:41:18 +0100
Message-Id: <20190522164119.24139-4-emil.l.velikov@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190522164119.24139-1-emil.l.velikov@gmail.com>
References: <20190522164119.24139-1-emil.l.velikov@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=w/diVRkSY3GbsqvZKDkKB9JH05Fjty08jM7SF5zvRbk=;
 b=q+al59saRcBS1ExXpL6A6PoS40PBHRzQIzx5dS3rfse6DdYVzpZCBhj4syVU+QgRxd
 kA9mQ01yjertRrTOkg33IK3HVD/Cxyox7HQd4F+rHzRXf+U6zndyHY5KhOnZra1xmu0l
 jVXQ2aUXOQJ6qrKjXtKeonKrkEc0uA4EcVZbGy6qTh0LXt3rPJM6TZARdH12BDIL7n6o
 CwH3IGXSO3qbpteusqZ+E+FySEpkTdJla8fBN4MOoiw5K6flpwpvJAc1qx5fRS/V+m9C
 N9WU533aZo7UvmY7O/oFCC62MhlO9Z/i+w9xhkUs26HQT7Hz60Gvq6q0bysRgkxEJwYW
 YzZw==
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
Cc: Thomas Hellstrom <thellstrom@vmware.com>, kernel@collabora.com,
 VMware Graphics <linux-graphics-maintainer@vmware.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogRW1pbCBWZWxpa292IDxlbWlsLnZlbGlrb3ZAY29sbGFib3JhLmNvbT4KCkRyb3AgdGhl
IGN1c3RvbSBpb2N0bCBpbyBlbmNvZGluZyBjaGVjayAtIGNvcmUgZHJtIGRvZXMgaXQgZm9yIHVz
LgoKQ2M6ICJWTXdhcmUgR3JhcGhpY3MiIDxsaW51eC1ncmFwaGljcy1tYWludGFpbmVyQHZtd2Fy
ZS5jb20+CkNjOiBUaG9tYXMgSGVsbHN0cm9tIDx0aGVsbHN0cm9tQHZtd2FyZS5jb20+CkNjOiBE
YW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+ClNpZ25lZC1vZmYtYnk6IEVtaWwgVmVsaWtv
diA8ZW1pbC52ZWxpa292QGNvbGxhYm9yYS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3Ztd2dm
eC92bXdnZnhfZHJ2LmMgfCA5IC0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDkgZGVsZXRpb25z
KC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfZHJ2LmMgYi9k
cml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9kcnYuYwppbmRleCAyY2I2YWUyMTllNDMuLmY2
NTU0MjYzOWI1NSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfZHJ2
LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfZHJ2LmMKQEAgLTExNDcsOSAr
MTE0Nyw2IEBAIHN0YXRpYyBsb25nIHZtd19nZW5lcmljX2lvY3RsKHN0cnVjdCBmaWxlICpmaWxw
LCB1bnNpZ25lZCBpbnQgY21kLAogCQkJCXJldHVybiAtRUFDQ0VTOwogCQl9CiAKLQkJaWYgKHVu
bGlrZWx5KGlvY3RsLT5jbWQgIT0gY21kKSkKLQkJCWdvdG8gb3V0X2lvX2VuY29kaW5nOwotCiAJ
CWZsYWdzID0gaW9jdGwtPmZsYWdzOwogCX0gZWxzZSBpZiAoIWRybV9pb2N0bF9mbGFncyhuciwg
JmZsYWdzKSkKIAkJcmV0dXJuIC1FSU5WQUw7CkBAIC0xMTY5LDEyICsxMTY2LDYgQEAgc3RhdGlj
IGxvbmcgdm13X2dlbmVyaWNfaW9jdGwoc3RydWN0IGZpbGUgKmZpbHAsIHVuc2lnbmVkIGludCBj
bWQsCiAJCXR0bV9yZWFkX3VubG9jaygmdm1hc3Rlci0+bG9jayk7CiAKIAlyZXR1cm4gcmV0Owot
Ci1vdXRfaW9fZW5jb2Rpbmc6Ci0JRFJNX0VSUk9SKCJJbnZhbGlkIGNvbW1hbmQgZm9ybWF0LCBp
b2N0bCAlZFxuIiwKLQkJICBuciAtIERSTV9DT01NQU5EX0JBU0UpOwotCi0JcmV0dXJuIC1FSU5W
QUw7CiB9CiAKIHN0YXRpYyBsb25nIHZtd191bmxvY2tlZF9pb2N0bChzdHJ1Y3QgZmlsZSAqZmls
cCwgdW5zaWduZWQgaW50IGNtZCwKLS0gCjIuMjEuMAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
