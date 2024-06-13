Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8F3290785B
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2024 18:34:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFB9010E0C8;
	Thu, 13 Jun 2024 16:34:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="A2LB5mqe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22C2D10EAEE
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 16:34:01 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-2ec002caf3eso19590111fa.1
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 09:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718296439; x=1718901239; darn=lists.freedesktop.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=zHgrY4xIc9CPVKKUbUHFPFlrW7UpxJwbiRlbNkc9MGM=;
 b=A2LB5mqeNjTPyz1ri4MtE1hQlAzuEot/ooB03EJ+VLPde98qMPbLkPpjqR371Ur5wK
 IkQxXV4Hbm0PiNvT5A016r1zQV34QyJDNhC5HpvQ/ouddS8qUzFkvfUUzAf4Q36pO42U
 ec0eUfQ9ralDSz3k1NpRnjvE2Jh3FRJbWLefnBIuW0nY6kJb33kGNc1AfRS5VOSCfifF
 v58EfLO/dytZu7lcf3wSBq2tv9aScqUSZ6JRbM4hioFo3eUpHDRhzTBWMfc2wgUhlxBB
 Z3ffRMrobAlk+cMQ2Kaj2ghzzhz1fC7QahPnqgMG+jnDvyUZ+lC9bTySrtHOSzu3ToXB
 bSDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718296439; x=1718901239;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zHgrY4xIc9CPVKKUbUHFPFlrW7UpxJwbiRlbNkc9MGM=;
 b=hC6tXlQCz4CLkL4e04aMGXJ4nhjfz3B+DfScnXyCfZnkwsWHVP+LoMfNMxDrrQq9uM
 QF8cz4JqtTfGHgKc+MFBi11+TBv6XrFuwE9z1qbtAj9cv/vzq+5pU76d3ulRWksHt2a+
 y4B31LixXOLj/GOxbJqsI4nL+jCEfuC2iUobPDaZfl2bkb9aD3Ygb6vefa07tXj61xel
 yqYxGht9ABoGAhouMCRG6DryVFXqungMq9A09vlkU5a/VH2l3SHrUUDnVpbwOjWUInJ8
 2gkpVCwBRphKP8ky1VnQkhOk64hRo7owukYh1Ncy4WK+DfIe8uJvxsCG/RHUebtV8jmb
 n91g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWEv7H+AnPTEohOBzMSMLHVNe2RfMRT7ke5CwbCZCJZ8S5A1P4438SGMqY0hzUgq83E2KWy8ECmaVHrnXTN3gHXtj3B7vQc4XlV08YWUmXC
X-Gm-Message-State: AOJu0YwV/gzQSq5FLYJzWzviCV95z9X9B4tXq+syq97GZ0YqkdkpHbrd
 74T9JN6QYPf63oQXiJg5xq+eDn9EtfGdgGpT3USBo1m/to4CAm1Mdo7LLAcdLwo=
X-Google-Smtp-Source: AGHT+IHQjwGnyIBB6w17aMs8YaOjxovU+qzoNkHKK0oqzTbPn4+mi5cAWSa9lQLAGg4Hgz05mK53Qw==
X-Received: by 2002:a2e:9943:0:b0:2eb:eb82:4112 with SMTP id
 38308e7fff4ca-2ec0e4826dbmr2994861fa.17.1718296438829; 
 Thu, 13 Jun 2024 09:33:58 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ec05c9ae70sm3005621fa.133.2024.06.13.09.33.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jun 2024 09:33:58 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 13 Jun 2024 19:33:57 +0300
Subject: [PATCH] drm/ci: mark kms_addfb_basic@addfb25-bad-modifier as
 passing on msm
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240613-msm-pass-addfb25-bad-modifier-v1-1-23c556e96c8a@linaro.org>
X-B4-Tracking: v=1; b=H4sIAHQfa2YC/x3MwQqDMAwA0F+RnBdoOxX0V8YObZNqDq3SwBCk/
 77i8V3eDcpVWGEdbqj8E5WjdNjXAHH3ZWMU6gZn3Ghm+8asGU+vip4oBTdh8IT5IEnCFeM420R
 LNC4E6MdZOcn1/J9va3+GH6EdbwAAAA==
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Helen Koike <helen.koike@collabora.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1692;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=9Oy2rhgmMbROnThGOyXo7UyCu8RbyWradi7uQ/YWriE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmax91DGbuj22LlXzjIrZ3rzJ7TcRR5ZnaZlaZv
 xDd47ibag+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZmsfdQAKCRCLPIo+Aiko
 1ZRyCACHj5FwfHDMFnICBk6c9bsSibSfFyyQ7foUfaKd0HdH7hkKubcXTIzpfHkQyAnGxQfjHc/
 aqZ1VduL+GHVFdJBw/CZ8pL8YipTrpHrMGaI+vwxGutamsp21f9+8vZv27yn6BgIXzQtDckQd3+
 fWMKZfI0oNHZAKvea59SaFEqG10Q/9x7+yPwkMOLaLgeWU7i8LZVPLHXZ5BsGHt3sq/r5sFFeZf
 1v1NfNOppwJchUxn+3cWWw+lK/S5VNtwBKGC45xchIr/gIfvtKiqFsAw36C41urnMETEhTVGhD1
 aXUxik06RCS2hjyYgJdOTQSRVkM5GgimG0wIZm1P5MTnxcJq
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

The commit b228501ff183 ("drm/msm: merge dpu format database to MDP
formats") made get_format take modifiers into account. This makes
kms_addfb_basic@addfb25-bad-modifier pass on MDP4 and MDP5 platforms.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/ci/xfails/msm-apq8016-fails.txt | 1 -
 drivers/gpu/drm/ci/xfails/msm-apq8096-fails.txt | 1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/ci/xfails/msm-apq8016-fails.txt b/drivers/gpu/drm/ci/xfails/msm-apq8016-fails.txt
index 3dfbabdf905e..6e7fd1ccd1e3 100644
--- a/drivers/gpu/drm/ci/xfails/msm-apq8016-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/msm-apq8016-fails.txt
@@ -4,7 +4,6 @@ device_reset@unbind-cold-reset-rebind,Fail
 device_reset@unbind-reset-rebind,Fail
 dumb_buffer@invalid-bpp,Fail
 kms_3d,Fail
-kms_addfb_basic@addfb25-bad-modifier,Fail
 kms_cursor_legacy@forked-move,Fail
 kms_cursor_legacy@single-bo,Fail
 kms_cursor_legacy@torture-bo,Fail
diff --git a/drivers/gpu/drm/ci/xfails/msm-apq8096-fails.txt b/drivers/gpu/drm/ci/xfails/msm-apq8096-fails.txt
index 23a5f6f9097f..46ca69ce2ffe 100644
--- a/drivers/gpu/drm/ci/xfails/msm-apq8096-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/msm-apq8096-fails.txt
@@ -4,6 +4,5 @@ device_reset@unbind-cold-reset-rebind,Fail
 device_reset@unbind-reset-rebind,Fail
 dumb_buffer@invalid-bpp,Fail
 kms_3d,Fail
-kms_addfb_basic@addfb25-bad-modifier,Fail
 kms_lease@lease-uevent,Fail
 tools_test@tools_test,Fail

---
base-commit: 6b4468b0c6ba37a16795da567b58dc80bc7fb439
change-id: 20240613-msm-pass-addfb25-bad-modifier-c461fd9c02bb

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

