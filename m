Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 390328BB250
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2024 20:15:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBF0D1131B2;
	Fri,  3 May 2024 18:15:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="xzZPjWc/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDE9A112921
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2024 18:15:08 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-2e1fa1f1d9bso35008411fa.0
 for <dri-devel@lists.freedesktop.org>; Fri, 03 May 2024 11:15:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714760107; x=1715364907; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=EVuYQnC+Oejbh47K886v7jLhxbV/LX35eFvPeTAUoM8=;
 b=xzZPjWc/yvyhOnjCghdiNvrWYllXWnEWUlEGuUhCKolwZO0PSDo3O3l9Z8hCdXGn1p
 taeS04d+0RSudsoNsJJ7/jtISdGjAXHZED8XwcXRwk58NJF/lp7KkgrmXqqL5S42LNpQ
 5lgPlC+kZmwLz5tQZ6QAXLvvZJ/pzY5hDmfvlGcH3Xj6gM8BI7rVcbyn/LuX1z049JuN
 PaH6sdw5u9dEUIsdTuSzcKahl9yLYEz5HmnW4mpH8ps+DKCmS+qfLanT+72UejSAmZhg
 PHcmwZushjyX9rhr5VKvwILYuHdBDvNAuSHmD6cet68QlnMe+BJ7dnNgw9tYut7JICSI
 Wmlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714760107; x=1715364907;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EVuYQnC+Oejbh47K886v7jLhxbV/LX35eFvPeTAUoM8=;
 b=LeOJnZdtsmRKPuV1Hnj9S28Y2oZtouPaKYyVqnXcNezqsdzAosa6KrAo3fFAvVcAUe
 gFjlO0lIp41dgj2DzakYx1shIkBrbGmDcPT3XXiR3gssajItqJvVxOHSnLzf4wbOR5tC
 FfFk+3hixyXDiDCYrAAQconXEnb1BN3mqiOuqQWv8zSOg9pJMoxn1EovpNCnQGcqa8m9
 kzJjPMBWuLqHOV+rTYJvLSUduN5tHXbfCVFfI5AQzhICcR/8kggTmEyNVkOJh9GmxhWf
 WLkgMdlK8vjVNhcnywxeY8rLZf7f+gel9/B4OAT6Psz50+0E3CGYsywoiKZ7QrRA+O62
 fgtQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX4iTTGg9eC+ta6mSWXSC2Cl7ZRc6/zkZbe1vGaLwQz+wDVssxl+XFf/2Q/k2Ip2tzfboeqyLqfejt4gIFmz4/mf/NfxqbrBOUIdQ5eBeeE
X-Gm-Message-State: AOJu0Yxfy/gAY1s+5NAzr3fF7PrXhUHU3p15r1n48+9KvYcg8ueKmT/f
 grgHfLPAoFWn88qXlYzAjWTlU61wG+SDhClkBzRLHUO/4xU0q2LhczGCaulNb08=
X-Google-Smtp-Source: AGHT+IHH4MMFG5SQdw9yShhta2QBkdZvrkXtrf2jPCXHUI94xQ/Viajl3IVbjwM1N0fQaRrEeSD36Q==
X-Received: by 2002:a05:651c:32c:b0:2de:c912:ec08 with SMTP id
 b12-20020a05651c032c00b002dec912ec08mr2716085ljp.16.1714760106823; 
 Fri, 03 May 2024 11:15:06 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 s7-20020a2e9c07000000b002de118decbbsm605548lji.53.2024.05.03.11.15.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 May 2024 11:15:06 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 03 May 2024 21:15:04 +0300
Subject: [PATCH v2 2/2] drm/ci: validate drm/msm XML register files against
 schema
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240503-fd-fix-lxml-v2-2-f80a60ce21a1@linaro.org>
References: <20240503-fd-fix-lxml-v2-0-f80a60ce21a1@linaro.org>
In-Reply-To: <20240503-fd-fix-lxml-v2-0-f80a60ce21a1@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Helen Koike <helen.koike@collabora.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1281;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=xF5XC7k5+A56fzWGKfMqVYu2cMBJwZJ6BmZnpTYRInw=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ5qp5gr5zfPn2wYJGjr99i+4soPjH8vCom89UzzyHvzYJ
 b/Djjm7k9GYhYGRi0FWTJHFp6Blasym5LAPO6bWwwxiZQKZwsDFKQAT4W7kYFj72pOzIq69xrLi
 Y1M7e4/uPpv8THaleRnLchu4IiME9Zwu399uGXmNj4lHdMWOkjUmjhcfGwn7hJQfLxRtOXo5aPf
 c+VNtfoe1JATubJvzk/mEl4n9jm33Na97W++OjohYbDnt1XO/yK0lx1ouqr2sa9k8+ahDgdM10e
 n37dbO3pllYn/Ka0vx5z0aRlwzuATN6xeYqUqYu8jpfLvwdlsWj+RvxlexXmopDDWCL9951Jt4S
 FjE+Mn6LlC7/Ef+TFN/2JLslxcXx3Gzrn70aa8Y84yVnA+nTVPq80/yan9yWWwKZ1Pr8mdvXdMX
 ve/JrZrf+mm9laHWiX0zPI/JcGbFOPW3915bocuwicEOAA==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

In order to validate drm/msm register definition files against schema,
reuse the nodebugfs build step. The validation entry is guarded by
the EXPERT Kconfig option and we don't want to enable that option for
all the builds.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/ci/build.sh  | 3 +++
 drivers/gpu/drm/ci/build.yml | 1 +
 2 files changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/ci/build.sh b/drivers/gpu/drm/ci/build.sh
index 106f2d40d222..28a495c0c39c 100644
--- a/drivers/gpu/drm/ci/build.sh
+++ b/drivers/gpu/drm/ci/build.sh
@@ -12,6 +12,9 @@ rm -rf .git/rebase-apply
 apt-get update
 apt-get install -y libssl-dev
 
+# for msm header validation
+apt-get install -y python3-lxml
+
 if [[ "$KERNEL_ARCH" = "arm64" ]]; then
     GCC_ARCH="aarch64-linux-gnu"
     DEBIAN_ARCH="arm64"
diff --git a/drivers/gpu/drm/ci/build.yml b/drivers/gpu/drm/ci/build.yml
index 17ab38304885..9c198239033d 100644
--- a/drivers/gpu/drm/ci/build.yml
+++ b/drivers/gpu/drm/ci/build.yml
@@ -106,6 +106,7 @@ build-nodebugfs:arm64:
   extends: .build:arm64
   variables:
     DISABLE_KCONFIGS: "DEBUG_FS"
+    ENABLE_KCONFIGS: "EXPERT DRM_MSM_VALIDATE_XML"
 
 build:x86_64:
   extends: .build:x86_64

-- 
2.39.2

