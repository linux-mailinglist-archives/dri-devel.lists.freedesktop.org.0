Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C04E107345
	for <lists+dri-devel@lfdr.de>; Fri, 22 Nov 2019 14:32:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD2616E2EA;
	Fri, 22 Nov 2019 13:32:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47D266E2EA
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Nov 2019 13:32:19 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id g206so7208805wme.1
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Nov 2019 05:32:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fLc+8UZIrOjxIlKtj3ViX/Mxfy7rIiqc1Aolj5mZjSM=;
 b=uV8rgzG4B4RxNO0pGQgIQWaxWAb0VKRidf1Ynst5/nOIDpENOKW9snh95c0caOZDGW
 Jalz5fDUYAwtixef8zubp4dKUGx5PTBmgknbEXX2eIrB73cwB+dWyF7/RJIbEGKWBaD0
 Oc4mhtFmkAzoRwKGyKJvupsmOaGNSkn8z96bjUXOVY5wSACV6NHRuB8sohJ0DP9qcJca
 7Y22P1v+tZ+al2Dq2mq6CeNPubf/gdN3P0yNnXSC31j8oXyMwbjE3Biwo3Csb/5Bv8Vn
 SdzvcDuX9Hy4Wvq+KFQqLlyJlJ5Gs+oUe9Aunn5rcOpc85ifNRfzxS8Y/5QtZHbERMuW
 zWKg==
X-Gm-Message-State: APjAAAWYU5z0qH6gJmEUqe45+Ts47AhGthFTRPi/SMVh1VsJKDWHD8lu
 dne+8GtsQNWEZmB9c0Mz9GA=
X-Google-Smtp-Source: APXvYqw7EzG1dmzCC/E0peG0Q0bjhlAz872FZKROW4UandWN2wzHU/cN7/FPsdIjj7SmglvkzLgAHw==
X-Received: by 2002:a05:600c:305:: with SMTP id
 q5mr10801711wmd.167.1574429537788; 
 Fri, 22 Nov 2019 05:32:17 -0800 (PST)
Received: from localhost (pD9E518ED.dip0.t-ipconnect.de. [217.229.24.237])
 by smtp.gmail.com with ESMTPSA id t13sm1908018wrp.36.2019.11.22.05.32.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Nov 2019 05:32:16 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH] drm/tegra: vic: Export module device table
Date: Fri, 22 Nov 2019 14:32:15 +0100
Message-Id: <20191122133215.1317039-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fLc+8UZIrOjxIlKtj3ViX/Mxfy7rIiqc1Aolj5mZjSM=;
 b=MDgXNhgFJTUyc5hy6zVkXIsPZ6nPbljYAh6J2wprgL4oNy1rfOcaR8qlzGZ9654Smo
 b7hAB2H0K2DlUIOo0h6QBMSu7wnnvVnzMEmoGF0qtszph4e+vgJAF73hmZuEPeVFy5lq
 ey5OEpZygatO2VsprlQiuI5IcdNfLTsYmrqITxGcM37y1p8JLljUSzr/oczE/AWhXfti
 dK/sD6IZdQuPilb3qtUUepwtF8UfjzjH6vM1AeTiQFSRH0qJ1I/13MaUdIoYWvu/tE0/
 1d8q7xAqJY9ldhdE6mmZ59gT4V8kXo2RNEEZN1arvP3qjKA4GwWlEgT+c3JK3++M0dgi
 FzSg==
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jon Hunter <jonathanh@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KCkV4cG9ydCB0aGUgbW9k
dWxlIGRldmljZSB0YWJsZSB0byBlbnN1cmUgdGhlIFZJQyBjb21wYXRpYmxlIHN0cmluZ3MgYXJl
Cmxpc3RlZCBpbiB0aGUgbW9kdWxlJ3MgYWxpYXNlcyB0YWJsZS4gVGhpcyBpbiB0dXJuIGNhdXNl
cyB0aGUgZHJpdmVyIHRvCmJlIGF1dG9tYXRpY2FsbHkgbG9hZGVkIG9uIGJvb3QgaWYgVklDIGlz
IHRoZSBvbmx5IGVuYWJsZWQgc3ViZGV2aWNlIG9mCnRoZSBsb2dpY2FsIGhvc3QxeCBEUk0gZGV2
aWNlLgoKU2lnbmVkLW9mZi1ieTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4K
LS0tCiBkcml2ZXJzL2dwdS9kcm0vdGVncmEvdmljLmMgfCA1ICsrKy0tCiAxIGZpbGUgY2hhbmdl
ZCwgMyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS90ZWdyYS92aWMuYyBiL2RyaXZlcnMvZ3B1L2RybS90ZWdyYS92aWMuYwppbmRleCA5
NDQ0YmExODM5OTAuLmM0ZDgyYjhiMzA2NSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3Rl
Z3JhL3ZpYy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS90ZWdyYS92aWMuYwpAQCAtMzg2LDEzICsz
ODYsMTQgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCB2aWNfY29uZmlnIHZpY190MTk0X2NvbmZpZyA9
IHsKIAkuc3VwcG9ydHNfc2lkID0gdHJ1ZSwKIH07CiAKLXN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2Zf
ZGV2aWNlX2lkIHZpY19tYXRjaFtdID0geworc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2Vf
aWQgdGVncmFfdmljX29mX21hdGNoW10gPSB7CiAJeyAuY29tcGF0aWJsZSA9ICJudmlkaWEsdGVn
cmExMjQtdmljIiwgLmRhdGEgPSAmdmljX3QxMjRfY29uZmlnIH0sCiAJeyAuY29tcGF0aWJsZSA9
ICJudmlkaWEsdGVncmEyMTAtdmljIiwgLmRhdGEgPSAmdmljX3QyMTBfY29uZmlnIH0sCiAJeyAu
Y29tcGF0aWJsZSA9ICJudmlkaWEsdGVncmExODYtdmljIiwgLmRhdGEgPSAmdmljX3QxODZfY29u
ZmlnIH0sCiAJeyAuY29tcGF0aWJsZSA9ICJudmlkaWEsdGVncmExOTQtdmljIiwgLmRhdGEgPSAm
dmljX3QxOTRfY29uZmlnIH0sCiAJeyB9LAogfTsKK01PRFVMRV9ERVZJQ0VfVEFCTEUob2YsIHRl
Z3JhX3ZpY19vZl9tYXRjaCk7CiAKIHN0YXRpYyBpbnQgdmljX3Byb2JlKHN0cnVjdCBwbGF0Zm9y
bV9kZXZpY2UgKnBkZXYpCiB7CkBAIC01MTYsNyArNTE3LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVj
dCBkZXZfcG1fb3BzIHZpY19wbV9vcHMgPSB7CiBzdHJ1Y3QgcGxhdGZvcm1fZHJpdmVyIHRlZ3Jh
X3ZpY19kcml2ZXIgPSB7CiAJLmRyaXZlciA9IHsKIAkJLm5hbWUgPSAidGVncmEtdmljIiwKLQkJ
Lm9mX21hdGNoX3RhYmxlID0gdmljX21hdGNoLAorCQkub2ZfbWF0Y2hfdGFibGUgPSB0ZWdyYV92
aWNfb2ZfbWF0Y2gsCiAJCS5wbSA9ICZ2aWNfcG1fb3BzCiAJfSwKIAkucHJvYmUgPSB2aWNfcHJv
YmUsCi0tIAoyLjIzLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
