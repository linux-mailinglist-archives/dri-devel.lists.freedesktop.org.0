Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A25E5114D76
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2019 09:18:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38BD66F999;
	Fri,  6 Dec 2019 08:17:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5016E6EA6E;
 Fri,  6 Dec 2019 07:53:36 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id b9so2495878pgk.12;
 Thu, 05 Dec 2019 23:53:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1EgUIOkIOxBCz33igi7r1HkqftzoXNr9Kp6yceaT6vI=;
 b=hRc1o8rjpZvnjkoVI8aA2jlDrP26s/czOSEnQapZdkoSXkCkccHhnqn6LsoHFxJ5DD
 MxNTr4DERHd+OaunQE38Jhe3XsjxY5z1G2wgPiNwojoUrx73Ogl0T1bI0/JVDVmuSxyD
 aBSOuGG3EDFuK05kQi4R6QCZsKs1SSEnOStIV9XYFoPlZhVR6mMlZQbM/KL77DPhvtnV
 +R4P682PC9RXSVYA0mPZl2ZyLzz2dSDWtT9lpBpxKS30VPVGqzLhHQfKrD4CglPzyx1z
 jnUwo85CvOTLM2cHl/OuxYOCu1qSFziCUfEqln7obrJvC60f/qLY47iy4USP65/YkU81
 KGtA==
X-Gm-Message-State: APjAAAVTmWFirMrqCELBNL2Ja90nKa8Nnx7uKm2Bt+gE3K6PpTlGaogr
 mvqQSWWwLgS15lLoCC+/gSY=
X-Google-Smtp-Source: APXvYqywvw21DTGo7hukn/xRAaCsyHCskev0EPREMmv1UJqgV2f1YpgiSRlNmk6PjO5XpUVmgdnI3w==
X-Received: by 2002:a62:ed0b:: with SMTP id u11mr12890108pfh.46.1575618816036; 
 Thu, 05 Dec 2019 23:53:36 -0800 (PST)
Received: from suzukaze.ipads-lab.se.sjtu.edu.cn ([202.120.40.82])
 by smtp.gmail.com with ESMTPSA id b129sm14876391pfb.147.2019.12.05.23.53.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Dec 2019 23:53:35 -0800 (PST)
From: Chuhong Yuan <hslester96@gmail.com>
To: 
Subject: [PATCH] drm/dp_mst: add missed nv50_outp_release in nv50_msto_disable
Date: Fri,  6 Dec 2019 15:53:21 +0800
Message-Id: <20191206075321.18239-1-hslester96@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 06 Dec 2019 08:17:34 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1EgUIOkIOxBCz33igi7r1HkqftzoXNr9Kp6yceaT6vI=;
 b=eB7FB8k+B+Jl6hb20SCbjEVroUS2ALBqXwUYWIDq+UgAqGhSMBSbSJc2BiER4nOoNE
 guUipg59Ls0JVrUgsWuliKipQ926yRWNwqUxbU2GdCHCjooDIbIlRAAySNFr+qYlcMJS
 QgZ9QvtNVtTwunVr5KdSwT/Ym6AbVmnscDSM5ADRDN9vilTPiiI+SCUD2FZDDSGyYu4b
 1KpHP6HSc+yAK4YS+RDbTfWXjICkzDwiu5Bi3+da53j4WVZynKmebE/5LKexN45TEouE
 SRi2PNr9wVQa6RtFTIiwyoonPFolMStjJGOd3CfWWNyJ9wk6asTVFy2c921RWBa31K3/
 Sjng==
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
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 Chuhong Yuan <hslester96@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

bnY1MF9tc3RvX2Rpc2FibGUoKSBkb2VzIG5vdCBjYWxsIG52NTBfb3V0cF9yZWxlYXNlKCkgdG8g
bWF0Y2gKbnY1MF9vdXRwX2FjcXVpcmUoKSBsaWtlIG90aGVyIGRpc2FibGUoKS4KQWRkIHRoZSBt
aXNzZWQgY2FsbCB0byBmaXggaXQuCgpTaWduZWQtb2ZmLWJ5OiBDaHVob25nIFl1YW4gPGhzbGVz
dGVyOTZAZ21haWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rpc3BudjUwL2Rp
c3AuYyB8IDQgKysrLQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlv
bigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rpc3BudjUwL2Rpc3Au
YyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rpc3BudjUwL2Rpc3AuYwppbmRleCA1NDk0ODZm
MWQ5MzcuLjg0ZTE0MTczNTVjYyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUv
ZGlzcG52NTAvZGlzcC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rpc3BudjUwL2Rp
c3AuYwpAQCAtODYyLDggKzg2MiwxMCBAQCBudjUwX21zdG9fZGlzYWJsZShzdHJ1Y3QgZHJtX2Vu
Y29kZXIgKmVuY29kZXIpCiAKIAltc3RtLT5vdXRwLT51cGRhdGUobXN0bS0+b3V0cCwgbXN0by0+
aGVhZC0+YmFzZS5pbmRleCwgTlVMTCwgMCwgMCk7CiAJbXN0bS0+bW9kaWZpZWQgPSB0cnVlOwot
CWlmICghLS1tc3RtLT5saW5rcykKKwlpZiAoIS0tbXN0bS0+bGlua3MpIHsKIAkJbXN0bS0+ZGlz
YWJsZWQgPSB0cnVlOworCQludjUwX291dHBfcmVsZWFzZShtc3RtLT5vdXRwKTsKKwl9CiAJbXN0
by0+ZGlzYWJsZWQgPSB0cnVlOwogfQogCi0tIAoyLjI0LjAKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
