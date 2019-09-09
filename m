Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6F8AAD3C1
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2019 09:23:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E83C2898A4;
	Mon,  9 Sep 2019 07:23:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DEB1896EC
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Sep 2019 01:26:17 +0000 (UTC)
Received: by mail-ot1-x344.google.com with SMTP id 67so10910268oto.3
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Sep 2019 18:26:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=5Ov2d6Pnm9u+Qu6MuAf8jhV3xMMR4SjQUGOpB2HvBj0=;
 b=G3wLQ+JZ6Vi3/psz6/drjww5+K0pix0VgDNkoKSkBi3bQ+0+nAbdj7jHuth+KNToGL
 VjFk4lZ2LlZI4qns67PNq1kP41hfCgq0aesaPiFbEtBbbbvkjAxOSqrXpuG7wBerJ89L
 JVK99cnU1CXi3KXepFDKQZFsoP+QS6Az2mkN45DSKpS2mxtz7DQL3RwReOqyiViE58jy
 OiyaSdIX4WfoyYXSG9NKAF2dhoWMSSHunoV9PEPtVRF2iYNMqYCd9P0bityiCva7XWhw
 nf5noSGdUCZr2RbRuH4aOvf3X44r086o/uMpT/aJHB/uDqLuEjb3IGmZr8PWdXr78lyb
 pxCA==
X-Gm-Message-State: APjAAAW4QDfEYI6TU1+fAESsKQp7sU/MD7yK6Tg8fNHOtwh642weZXxY
 +QriJ/HFNZr0GmEO4vYSTBU=
X-Google-Smtp-Source: APXvYqxREF5U+6iLM0y+RqBU1gb9iyKo78SFJJdiLHDsba6Zy60Pv8GzxsKEmTWJ0FnmUHdON9IdBA==
X-Received: by 2002:a9d:7ac8:: with SMTP id m8mr13140172otn.172.1567992376680; 
 Sun, 08 Sep 2019 18:26:16 -0700 (PDT)
Received: from sreeram-MS-7B98 (cpe-173-174-83-82.austin.res.rr.com.
 [173.174.83.82])
 by smtp.gmail.com with ESMTPSA id d24sm4898419otf.78.2019.09.08.18.26.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Sep 2019 18:26:16 -0700 (PDT)
From: Sreeram Veluthakkal <srrmvlt@gmail.com>
To: gregkh@linuxfoundation.org
Subject: [PATCH] FBTFT: fb_agm1264k: usleep_range is preferred over udelay
Date: Sun,  8 Sep 2019 20:26:05 -0500
Message-Id: <20190909012605.15051-1-srrmvlt@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Mon, 09 Sep 2019 07:23:02 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=5Ov2d6Pnm9u+Qu6MuAf8jhV3xMMR4SjQUGOpB2HvBj0=;
 b=jeBGCxRNn+pUIGhwRwVpQqdTM/IILqqr3/4As4imoqUasPXfypeW3HUH1otXbg9JYv
 52fimVWUxuIKNuYMya5fLjh0r0X0AJ5nPFSRsCiM3UYxsE8f3xv+iyJ0zhdvrxBjYSNW
 iQzYT1+lVrbyzlaWpWOwWET0fSPBpZ3ic4F9V+KlNoXmwKA94nVgdj0je7ZZiaPQ6KuQ
 WucSJpugiVN84M01w7/gTq4VyAt6SbNlFkfy3xPRGy4bRp4BPP3xRDY3V2ddEYknnngU
 HXbuBusFEpN6kMfHXwJbobmpEAAkQd4vKgZ5h2kurvofmG/jlM3dIH+mu5rlItBQtWQU
 kVMw==
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
Cc: thomas.petazzoni@free-electrons.com, devel@driverdev.osuosl.org,
 linux-fbdev@vger.kernel.org, jeremy@azazel.net, nishadkamdar@gmail.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 payal.s.kshirsagar.98@gmail.com, Sreeram Veluthakkal <srrmvlt@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBwYXRjaCBmaXhlcyB0aGUgaXNzdWU6CkZJTEU6IGRyaXZlcnMvc3RhZ2luZy9mYnRmdC9m
Yl9hZ20xMjY0ay1mbC5jOjg4OgpDSEVDSzogdXNsZWVwX3JhbmdlIGlzIHByZWZlcnJlZCBvdmVy
IHVkZWxheTsgc2VlIERvY3VtZW50YXRpb24vdGltZXJzL3RpbWVycy1ob3d0by5yc3QKKyAgICAg
ICB1ZGVsYXkoMjApOwoKU2lnbmVkLW9mZi1ieTogU3JlZXJhbSBWZWx1dGhha2thbCA8c3JybXZs
dEBnbWFpbC5jb20+Ci0tLQogZHJpdmVycy9zdGFnaW5nL2ZidGZ0L2ZiX2FnbTEyNjRrLWZsLmMg
fCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL3N0YWdpbmcvZmJ0ZnQvZmJfYWdtMTI2NGstZmwuYyBiL2RyaXZl
cnMvc3RhZ2luZy9mYnRmdC9mYl9hZ20xMjY0ay1mbC5jCmluZGV4IGVlZWVlYzk3YWQyNy4uMmRl
Y2U3MWZkM2I1IDEwMDY0NAotLS0gYS9kcml2ZXJzL3N0YWdpbmcvZmJ0ZnQvZmJfYWdtMTI2NGst
ZmwuYworKysgYi9kcml2ZXJzL3N0YWdpbmcvZmJ0ZnQvZmJfYWdtMTI2NGstZmwuYwpAQCAtODUs
NyArODUsNyBAQCBzdGF0aWMgdm9pZCByZXNldChzdHJ1Y3QgZmJ0ZnRfcGFyICpwYXIpCiAJZGV2
X2RiZyhwYXItPmluZm8tPmRldmljZSwgIiVzKClcbiIsIF9fZnVuY19fKTsKIAogCWdwaW9kX3Nl
dF92YWx1ZShwYXItPmdwaW8ucmVzZXQsIDApOwotCXVkZWxheSgyMCk7CisJdXNsZWVwX3Jhbmdl
KDIwLCA0MCk7CiAJZ3Bpb2Rfc2V0X3ZhbHVlKHBhci0+Z3Bpby5yZXNldCwgMSk7CiAJbWRlbGF5
KDEyMCk7CiB9Ci0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
