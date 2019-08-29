Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4257A326E
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2019 10:30:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E93C96E2A9;
	Fri, 30 Aug 2019 08:29:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com
 [IPv6:2607:f8b0:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C81846E16D
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2019 20:00:07 +0000 (UTC)
Received: by mail-pg1-x530.google.com with SMTP id d1so2158872pgp.4
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2019 13:00:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=leAjuo9QrYfGsQp+lWwGPaf44FJzdIsTdXXe6kBTcvQ=;
 b=dwLkI+xVzXMgIKcJLW9lDWgTCTukc0yK5A5Q7DIbOgcjv3p/gfmUzDAmB6wWj6eSFK
 7TCdsFGGJz7FTCk2mBHq9eeJLBuJx/UzNpR8CSIyHWeh08Vo+wHHl9nBHGLHvked58vk
 MBfdbLsHMZrc05eoL8CuQ85a1sYFhJCpnMBrE5mNCav3UkWtiH8nWUG1C/Y1+6zBg4UG
 7mGg1LKuTtkuEzT8DCYj3uXc8x9K+5X3n5yGKAyMlyomjWxYduCbxRlj+zfOHd0M3/Qa
 fFN7KviqVXgN12CjXcU6A23C3WbNjQgHlDlsjiX2OO+eDR4vml4UFTxPlNC859uI/7FZ
 PPwg==
X-Gm-Message-State: APjAAAU0XqVXMHjxwMgUWSJ4R1mWKrr4zk6mCUhJRcM9j+w9+kxmdnOp
 /oyDm2pDvcOI9WK/w9KnanAz2g==
X-Google-Smtp-Source: APXvYqxmRtZml8EdnZ16J1Jmfc6FgL+TVFfQC+dCMCvoM/+VMjg+z1xJm3jSCGVPmaKApRCFQG6kdw==
X-Received: by 2002:a63:1f1b:: with SMTP id f27mr9740387pgf.233.1567108807182; 
 Thu, 29 Aug 2019 13:00:07 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net.
 [68.147.8.254])
 by smtp.gmail.com with ESMTPSA id u7sm3053766pgr.94.2019.08.29.13.00.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Aug 2019 13:00:06 -0700 (PDT)
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: stable@vger.kernel.org
Subject: [BACKPORT 4.19.y 2/3] scsi: ufs: Fix RX_TERMINATION_FORCE_ENABLE
 define value
Date: Thu, 29 Aug 2019 14:00:00 -0600
Message-Id: <20190829200001.17092-3-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190829200001.17092-1-mathieu.poirier@linaro.org>
References: <20190829200001.17092-1-mathieu.poirier@linaro.org>
X-Mailman-Approved-At: Fri, 30 Aug 2019 08:29:17 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=leAjuo9QrYfGsQp+lWwGPaf44FJzdIsTdXXe6kBTcvQ=;
 b=EwHFoY3nn78Ablhc+fvFTk63+ihmkRvuN2b9otTYYBLJ/20wMokgUtop/hP29hf8Ss
 JdtCG3A2s67swE9FFPf0Jn+PmiCySXAL8wwZW4h1dWPNwTUU0OJvimlv7euDgKnQOI0H
 dGcfTjNrOk+RUaAs/nmRNL6f5930YGwO+xPmerXZ3YLIx3T4GB15/JNvn/WKFJkiPNSh
 JSGhphPYJfykXMMRch+fpjVH5JYudf5o7RljVoXQc8rIl3R5Wt9ClH9N90i/eEYtQIfH
 U7UKjZIIr6lociKHiO8DTHScDkrVxuqSHtCT0pJuou4Ml1+ekF7rLvtgaf+1OlCmupbW
 YbfA==
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
Cc: architt@codeaurora.org, jejb@linux.vnet.ibm.com, linux-scsi@vger.kernel.org,
 martin.petersen@oracle.com, airlied@linux.ie, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, jsarha@ti.com, tomi.valkeinen@ti.com,
 Laurent.pinchart@ideasonboard.com, vinholikatti@gmail.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogUGVkcm8gU291c2EgPHNvdXNhQHN5bm9wc3lzLmNvbT4KCmNvbW1pdCBlYmNiOGY4NTA4
YzVlZGY0MjhmNTI1MjVjZWM3NGQyOGVkZWE3YmNiIHVwc3RyZWFtCgpGaXggUlhfVEVSTUlOQVRJ
T05fRk9SQ0VfRU5BQkxFIGRlZmluZSB2YWx1ZSBmcm9tIDB4MDA4OSB0byAweDAwQTkKYWNjb3Jk
aW5nIHRvIE1JUEkgQWxsaWFuY2UgTVBIWSBzcGVjaWZpY2F0aW9uLgoKRml4ZXM6IGU3ODUwNjBl
YTNhMSAoInVmczogZGVmaW5pdGlvbnMgZm9yIHBoeSBpbnRlcmZhY2UiKQpTaWduZWQtb2ZmLWJ5
OiBQZWRybyBTb3VzYSA8c291c2FAc3lub3BzeXMuY29tPgpTaWduZWQtb2ZmLWJ5OiBNYXJ0aW4g
Sy4gUGV0ZXJzZW4gPG1hcnRpbi5wZXRlcnNlbkBvcmFjbGUuY29tPgpTaWduZWQtb2ZmLWJ5OiBN
YXRoaWV1IFBvaXJpZXIgPG1hdGhpZXUucG9pcmllckBsaW5hcm8ub3JnPgotLS0KIGRyaXZlcnMv
c2NzaS91ZnMvdW5pcHJvLmggfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyks
IDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3Njc2kvdWZzL3VuaXByby5oIGIv
ZHJpdmVycy9zY3NpL3Vmcy91bmlwcm8uaAppbmRleCAyMzEyOWQ3YjI2NzguLmM3N2UzNjUyNjQ0
NyAxMDA2NDQKLS0tIGEvZHJpdmVycy9zY3NpL3Vmcy91bmlwcm8uaAorKysgYi9kcml2ZXJzL3Nj
c2kvdWZzL3VuaXByby5oCkBAIC01Miw3ICs1Miw3IEBACiAjZGVmaW5lIFJYX0hTX1VOVEVSTUlO
QVRFRF9FTkFCTEUJCTB4MDBBNgogI2RlZmluZSBSWF9FTlRFUl9ISUJFUk44CQkJMHgwMEE3CiAj
ZGVmaW5lIFJYX0JZUEFTU184QjEwQl9FTkFCTEUJCQkweDAwQTgKLSNkZWZpbmUgUlhfVEVSTUlO
QVRJT05fRk9SQ0VfRU5BQkxFCQkweDAwODkKKyNkZWZpbmUgUlhfVEVSTUlOQVRJT05fRk9SQ0Vf
RU5BQkxFCQkweDAwQTkKICNkZWZpbmUgUlhfTUlOX0FDVElWQVRFVElNRV9DQVBBQklMSVRZCQkw
eDAwOEYKICNkZWZpbmUgUlhfSElCRVJOOFRJTUVfQ0FQQUJJTElUWQkJMHgwMDkyCiAjZGVmaW5l
IFJYX1JFRkNMS0ZSRVEJCQkJMHgwMEVCCi0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
