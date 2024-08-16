Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14B399546B7
	for <lists+dri-devel@lfdr.de>; Fri, 16 Aug 2024 12:24:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22AE010E5EB;
	Fri, 16 Aug 2024 10:23:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="rvvZjgH1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29DB010E17C
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Aug 2024 10:23:55 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-428243f928cso13080875e9.3
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Aug 2024 03:23:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1723803833; x=1724408633;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8cRa80QxztxjicJF5rsAT8pzK6md8mByVXGfDIWdXzQ=;
 b=rvvZjgH1oxd9OVIp3yunVldfoE33zQlJ9Bw4qUutFq0oJpab4CYL0h7XAVAox9tTqG
 livWPsAcetrvb9QLxSpiD97GWg3ybulGyHzTy6zNCmO2UHB9E7jN5PxP/sVeq46hZIYo
 Ot6jr+3L9e3ilf8Q0KBufW+cU+grA3DCLMEJ2c6jKjhenMvLnJ5oChT+Votjvem40LsE
 vjsfWr9tIR+/NR1Jdb0EMez0UU2T9ZJjGbsF+104VEVUB0hEkoI8s55XCfNNz7qVG53b
 Ug7vua17r1C9XmVoqnrVr5h5njvOtQPRVKXHRXLXZm9UWnc4k3B0qMwflKkMHHAnBH3k
 1tqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723803833; x=1724408633;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8cRa80QxztxjicJF5rsAT8pzK6md8mByVXGfDIWdXzQ=;
 b=rX+mto0MSo4/3bo4sFq8y0UcHv8kE+1UGzhHB7emMhxVGJ+/J5YpGAf+WbjisxnduA
 xo6mJEmXmO6fsybvgCSeZLwH8qQC1f+6JLu/5nAgx8uTjXkgCr1C9hG04aXa6sL+jnQq
 c9SMwtkWJR2wFMa0Ki4LRbnoEvuDQ91wo2Y9Fhx5BaUvP6rgUJ9G4TjGgsQw+NbJTL0g
 RTm5Z1MniGQ3Ng38GMobATIWhbciJyAYdfuA7cqU57ZAglxClUKrktcht14svcBwIw3z
 MbupRygfHm8YJRRAlHHEJ5Nh1AZyYlsv4mITgik+nN5/CnJb63cjDx3PqDGz705RO5IK
 G2mw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWEUyCfqawQhUbRvTaJTnPF9Pq3pCnfbLCulckayBRGJSzT6ldPwI2LBzyQc9djlG5GGvJDOebkm7ZMgyxQnmc7Oyk6yO+nzFFIjVdz631X
X-Gm-Message-State: AOJu0YzM3KngY6rq5bH58mxh3Hqa5ssKzcXnJv0n94QJWzKTlJAYWuqX
 g80/bq+qbPmywjAvuR8nxsVA+tkeSFFlu2L1s3daG47fQOMsyr/oFqCthAkrVNY=
X-Google-Smtp-Source: AGHT+IHiMiemHA0HDYK7fUySNf6tNACiyVMdxfcXAwZ7wf3FKOLNNg2TYqApmadNe4V2VEmyNHOi5w==
X-Received: by 2002:a05:600c:35cd:b0:428:16a0:1c3d with SMTP id
 5b1f17b1804b1-429ed7ae16cmr14655845e9.19.1723803832385; 
 Fri, 16 Aug 2024 03:23:52 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:aff3:cc35:cd8f:c520])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-429ded18630sm72650125e9.1.2024.08.16.03.23.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Aug 2024 03:23:52 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Amol Maheshwari <amahesh@qti.qualcomm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Tengfei Fan <quic_tengfan@quicinc.com>, Ling Xu <quic_lxu5@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH 1/2] dt-bindings: misc: qcom,fastrpc: document new domain ID
Date: Fri, 16 Aug 2024 12:23:44 +0200
Message-ID: <20240816102345.16481-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add "cdsp1" as the new supported label for the CDSP1 fastrpc domain.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
index c27a8f33d8d7..2a5b18982804 100644
--- a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
+++ b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
@@ -26,6 +26,7 @@ properties:
       - mdsp
       - sdsp
       - cdsp
+      - cdsp1
 
   memory-region:
     maxItems: 1
-- 
2.43.0

