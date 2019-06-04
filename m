Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00F8E34C49
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jun 2019 17:31:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4ED6789A34;
	Tue,  4 Jun 2019 15:31:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CCD189A34
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jun 2019 15:31:53 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id v19so2548144wmh.0
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Jun 2019 08:31:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FzAtqms2qZg0KXTTwkWYX+8P53MW/o6jogEAnKbVJ4U=;
 b=cgVpHDz5JlC6UhIVMgMsIQ0XTjNl45NIsku7dXAQYSKtuIKFU6TKaTOEOqMRUK8STy
 5pA6ERxWfCkFFkeVvF3/VbIAGERM+WAkqMhNB5V5NGeSGQ9hjm33yDD862s03YLwpz7o
 elG1E58vVEMJrjuxFO1wyjdtknWng3QhRWTfxSmjYmfBjeW5uVbOGi4P1zjZCQWOmlFi
 /TbZcWVb0NwcUpsM4GczuxVqkRhMR5LegbkqpyR2Y7AxMMAmIslZXOdvedMl8BlD+xsA
 RcwE5Yk6FidljZ6/7eghECKofjaIlSmVgifOnNIW+DTkKk80AUsM1wb3+iLwwyEN9kzx
 Ng1A==
X-Gm-Message-State: APjAAAWX6qRRYUHwb5uYF/HGlqrV59aAgAv38WQJ9Quf48B9oleDrVTO
 6vVv6pcr5JtGoY1fwCBj5o0=
X-Google-Smtp-Source: APXvYqwBxn3CnKA8kf77hqsi6iM5Il4fkEQqEVHJZEEwZ3SwVEN847ZfXz9PXfOS+w98/6PlEKMC/A==
X-Received: by 2002:a1c:2681:: with SMTP id m123mr3264126wmm.86.1559662311920; 
 Tue, 04 Jun 2019 08:31:51 -0700 (PDT)
Received: from localhost (p2E5BEF36.dip0.t-ipconnect.de. [46.91.239.54])
 by smtp.gmail.com with ESMTPSA id r9sm18940857wrq.0.2019.06.04.08.31.50
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 04 Jun 2019 08:31:51 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH] gpu: host1x: Do not output error message for deferred probe
Date: Tue,  4 Jun 2019 17:31:50 +0200
Message-Id: <20190604153150.22265-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FzAtqms2qZg0KXTTwkWYX+8P53MW/o6jogEAnKbVJ4U=;
 b=IAK25dtXQs6if7kM55GjQIS5vLWsCHfZYCu28LQfdF4bSooRpXLilt6hbieqq9GEsJ
 RNLoAvkuuTPIO7sWNxYhV6H0Z2esCjNXvpKMJlSVqcW5Io+ZO4W0vF1FVn/QuA70SVQ/
 hkPFif9Bds1t+h6h5SUIzp/9vBQTDJrF1EdTGBYqzAEyz75Ck/bow/WmUPa/ZVCEG3vA
 /Dat3BIP3z+Gk451GEH9Z2tNWrh1NX9B5HpbZwy/2Jeasv2QjTDaDRLMx7hl3lfsXvA0
 wiQZif3fcbi2KAu+5nmrWIi/WWiXwpm0Ux8hAgw66Xaoe3Ljxuw2hduUcgmPpbQhvFPg
 elbw==
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KCldoZW4gZGVmZXJyaW5n
IHByb2JlLCBhdm9pZCBsb2dnaW5nIGEgY29uZnVzaW5nIGVycm9yIG1lc3NhZ2UuIFdoaWxlIGF0
Cml0LCBtYWtlIHRoZSBlcnJvciBtZXNzYWdlIG1vcmUgaW5mb3JtYXRpb25hbC4KClNpZ25lZC1v
ZmYtYnk6IFRoaWVycnkgUmVkaW5nIDx0cmVkaW5nQG52aWRpYS5jb20+Ci0tLQogZHJpdmVycy9n
cHUvaG9zdDF4L2Rldi5jIHwgNSArKysrLQogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygr
KSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2hvc3QxeC9kZXYuYyBi
L2RyaXZlcnMvZ3B1L2hvc3QxeC9kZXYuYwppbmRleCBjNTVlMmQ2MzQ4ODcuLjVhM2Y3OTcyNDBk
NCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvaG9zdDF4L2Rldi5jCisrKyBiL2RyaXZlcnMvZ3B1
L2hvc3QxeC9kZXYuYwpAQCAtMjQ3LDggKzI0NywxMSBAQCBzdGF0aWMgaW50IGhvc3QxeF9wcm9i
ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogCiAJaG9zdC0+Y2xrID0gZGV2bV9jbGtf
Z2V0KCZwZGV2LT5kZXYsIE5VTEwpOwogCWlmIChJU19FUlIoaG9zdC0+Y2xrKSkgewotCQlkZXZf
ZXJyKCZwZGV2LT5kZXYsICJmYWlsZWQgdG8gZ2V0IGNsb2NrXG4iKTsKIAkJZXJyID0gUFRSX0VS
Uihob3N0LT5jbGspOworCisJCWlmIChlcnIgIT0gLUVQUk9CRV9ERUZFUikKKwkJCWRldl9lcnIo
JnBkZXYtPmRldiwgImZhaWxlZCB0byBnZXQgY2xvY2s6ICVkXG4iLCBlcnIpOworCiAJCXJldHVy
biBlcnI7CiAJfQogCi0tIAoyLjIxLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
