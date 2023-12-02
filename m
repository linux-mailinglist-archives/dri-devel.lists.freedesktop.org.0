Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D9ED3801EF0
	for <lists+dri-devel@lfdr.de>; Sat,  2 Dec 2023 23:14:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15C9410E090;
	Sat,  2 Dec 2023 22:14:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3D4A10E090
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Dec 2023 22:13:55 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-50bee606265so474888e87.2
 for <dri-devel@lists.freedesktop.org>; Sat, 02 Dec 2023 14:13:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701555234; x=1702160034; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=RDt6ed5YyAr8bCQzidGW3T1b8/QeSwezcMTpTt5+nc8=;
 b=NltLB1RZAUP3XNNbFSOGGHMmmPW2qf4yuBO+GoWKwUHqm5MftvxES3JrtOvjWOhWqU
 XuRR096MZlawS01wnjKaOenVBHMS3RGEAp5Fkz6P2693GngGZDTkd8dahtFS9OS0Xkl/
 57QizrQn9Ldmi81Rh+Kcren58J23U7bANqXBdf3Rx0B2trH0k/SeY9ZzdK4NDbwy33bj
 FULlnL6nXsjOvOx34LAi41Ce+X0cGs6lA23/XXdN50P83ZYDTUGTUdr6C8uSc0/uS/mM
 6WSC1b93qxBEk+tiP4CvT3Hbpg++98IfqnPxAZDy22Sm7mGlJCdJIoLJqtyjrQzOsmrJ
 X1ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701555234; x=1702160034;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RDt6ed5YyAr8bCQzidGW3T1b8/QeSwezcMTpTt5+nc8=;
 b=f6OFOhkg8nBybOq5OYgz/DNX1UmeHwz/CttP5o87Imk8ZT1RRktldEjWEdh6lM+h/P
 xFW/eWK13huPZXJFDSnN72yt+f0+kxgoxLgetFUXyDfKS5bpC7Cd+5YVh8aaW85ZBSW0
 +lxPvcKnOGPs01WYcGqZ/RnZUk/Pade6whxzPeyMYI3UNc+fogbU4+GIfTt2UAo1dnUy
 MzXuHEH87ToVN+W1/w/UMCA8pdK+4GLSeXllWbS/fQtGdlGBXHsaZS6oze+VDtIDb7eL
 ElJkjNaqx8ekPMQSm1Gva6xSVwCqskg4OILX+X7vvlsrU+qaC26iYJkDFDxeFDJwcyym
 A4pQ==
X-Gm-Message-State: AOJu0YwQqcOoc2FbA8apJX2/G9f0wm3qhevM43ks0NC7xI6bdJDRAVaz
 m7ZpygaKanJFNHcCXXpHzjyQ4g==
X-Google-Smtp-Source: AGHT+IFI+s5guUgN5bqh2M/BmFJ3WXmv/Fl2wQJqaxtFBp/JzGB2aR2IVu60ySBE0+N39NgVDxraRQ==
X-Received: by 2002:a05:6512:218b:b0:50b:d764:803c with SMTP id
 b11-20020a056512218b00b0050bd764803cmr1540619lft.111.1701555234051; 
 Sat, 02 Dec 2023 14:13:54 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 c27-20020ac2531b000000b0050bf2e33c81sm8154lfh.225.2023.12.02.14.13.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Dec 2023 14:13:53 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/ci: remove rebase-merge directory
Date: Sun,  3 Dec 2023 01:13:53 +0300
Message-Id: <20231202221353.1276288-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
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
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 David Heidelberg <david.heidelberg@collabora.com>,
 Helen Koike <helen.koike@collabora.com>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Gitlab runner can cache git repository, including the unfinished rebase
merge status. New CI job will come as a fresh checkout, however this
will not destroy the unfinished rebase, failing our build script.
Destroy the unfinished rebase state.

Suggested-by: David Heidelberg <david.heidelberg@collabora.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/ci/build.sh | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/ci/build.sh b/drivers/gpu/drm/ci/build.sh
index e5c5dcedd108..ca2923ed2290 100644
--- a/drivers/gpu/drm/ci/build.sh
+++ b/drivers/gpu/drm/ci/build.sh
@@ -58,6 +58,9 @@ git config --global user.email "fdo@example.com"
 git config --global user.name "freedesktop.org CI"
 git config --global pull.rebase true
 
+# cleanup git state on the worker
+rm -rf .git/rebase-merge
+
 # Try to merge fixes from target repo
 if [ "$(git ls-remote --exit-code --heads ${UPSTREAM_REPO} ${TARGET_BRANCH}-external-fixes)" ]; then
     git pull ${UPSTREAM_REPO} ${TARGET_BRANCH}-external-fixes
-- 
2.39.2

