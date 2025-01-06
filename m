Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71D2FA0211D
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jan 2025 09:50:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4259710E5C5;
	Mon,  6 Jan 2025 08:50:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="MxC0XZx6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E32C10E5C0
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jan 2025 08:50:15 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id
 a640c23a62f3a-aa676e4f36cso163939766b.2
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Jan 2025 00:50:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736153354; x=1736758154; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=MPpDYH069+mLjs5dlTYIpCA8LfABO5kO0Ny/8N1lhyI=;
 b=MxC0XZx6vvaamSM/ygBf5CGlEFo5sKaVsnBVCTI2myuq6KOVYBfXKG3jheON2dJCAI
 jdkwRHkeBq/lO18B1qn8IXRoDBo8aqgSOatrWDa0359a90NFJ5BQuMWf+q2h0aiH22N/
 3bV/k9witG6fOtmmiso2obrVHxAqrDDQkG9d0iwW40BuikUzB2yhhHVxxDTYYU2qbph7
 IhvGYvkIY4FTc+YD8X4E8eOW2ex7sxIELKAQKk4313S/FdcNL2tAzCvgSGwoMnTMeijH
 hw+YJZ3ZJTOGkZztLGu6LBOIfAS2Z62JHxcR5G8Lylx2Yd0+BhR3nN8RN5Rr4CZyHfPu
 dvBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736153354; x=1736758154;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MPpDYH069+mLjs5dlTYIpCA8LfABO5kO0Ny/8N1lhyI=;
 b=I4i1xu8FTr4FJ79/ti2NcbsWorhbR75NOCGmjMOQums4le+6RBMWwiaEn7mAkmXJu6
 RiQlaq9miP9YTrQjVkzxKCTXQmR2oNf9AY1PySULNhMYymRmT4eXZ3mkBoNA2u0gXn/c
 zDnfvM9XF8VkA5B4Pr7id/RN58UBCit63Mp/zHOLr3Hgctlc9NoZlO8mxDG9nL8fP3m2
 t/OrvJ5AcR9RZUUbIzMZ+NbsoB0pgVn/33zH/H9wGuuooNn/INHPBiWGi2/FdXejwbsJ
 kzHk2sY/soRViOuNHRI4Q+ccwGbPExlOy7LBNaIr7VdLwJ/5xHL0qKUscBvTAzfpEQLR
 94QQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXlnr2E3+pIHW0VQzwyFKVeurHEiH2Ma2gDx50JIgZ7MOCZcDyhRI8gANWie7gn++RQK55Nq7e4VWc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyjuOZikQJfEXW2XIV80QX2YV47We8JzwuuSCqFITCPBlsi1G4w
 kpKTr3FOsU5iwifdfl1phlPUT4BTs7yAOQu99wwes1YXppzbGrZR7BIZVoQmyaM=
X-Gm-Gg: ASbGncuTOu8k6fa7AVv58Dlt0PGWQJrvivDecZxnpyiadgtl31K0jbxNjOKpq6cHH3Y
 1uFtsLVbwB8HbneHb0A/kOU5X5HJyjeGVuHA6HUya41x1RmJREY0oBzwTbgET5bfhIaDikv6rLu
 DpF21CdnIo0SjblAK7wBhg3/Ovohyzs/f9ofIUJUrSttKAYsaLdhba6aAtCXop43yKWob2fJNyG
 RZjqy+TJiamZcYpo+7qxa8xHUDUKb9xd/mVTUmWfBWDCJ+7ISeCHU+IW1bNEbV0NsilxzID
X-Google-Smtp-Source: AGHT+IFjMVJDC2pUOc/2UmfzGQilpfciPMIJtnCCIHibu6sgvl6484mJOSWCipkTs5ubhvfGq4Pvcw==
X-Received: by 2002:a17:906:f5aa:b0:aa6:6792:8bce with SMTP id
 a640c23a62f3a-aac27430f12mr1975175966b.3.1736153353609; 
 Mon, 06 Jan 2025 00:49:13 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.165])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aac0e82f1d2sm2222112466b.11.2025.01.06.00.49.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jan 2025 00:49:13 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 0/4] drm/msm/dsi: Minor cleanups
Date: Mon, 06 Jan 2025 09:49:03 +0100
Message-Id: <20250106-drm-msm-cleanups-v1-0-271ff1c00795@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAP+Ye2cC/x3MQQqAIBBA0avErBvQohZdJVqYjjWQJg5FIN09a
 fkW/xcQykwCU1Mg083CZ6zQbQN2N3EjZFcNneoGpdWILgcMEtAeZOKVBJ0z1mtv+9UMULOUyfP
 zL+flfT+zZw1pYgAAAA==
X-Change-ID: 20250106-drm-msm-cleanups-ddacf1fc3ba5
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=669;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=jJ0wJpIPs8hLuHKhmqokUten+IFN/Sb20GIBd4RQIqo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBne5kBW0Mgbz44xhCZqTLkM3ZzGvvWdyDivUDtT
 DyxwFWSdjyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ3uZAQAKCRDBN2bmhouD
 14HHD/9SIqdiE2MxGLRuE4kcCfJEtxho69Z44obXWV+ZOsfkBPNIzPLD3jrsh6GSCu9xIwtgiKm
 XplBofIsm4/I84hhQXLCsJgWFVtAzLwk73azOEvdVBiM1DVKXXFfwBnLlPVU+vdnnUGlbaxlQXP
 yCT/DsSRd+v7gZcNyK4Pdv9abQhnhY3vSmwD50oKYsH2DlED/vBdtM8Dt8yG0gS+pCm2/CyCbjY
 jvHwun1yUSr7Pzha7k9sgz29lP9dqH/3AlbJiJTlRLVwnVCm7dfnBKAKHaqHC5vgIcAPN9D7wjN
 qr0pzAg5c1YOZk7A782ewZklGIYewiIkzQvuA5E5dKibI3ZQaafx08/ucCqxhEHMc4x9WKVrzqU
 6TM+r7SW8g21ydp+ZZam2/dT+AsqPtWU4i+7MYIZOa21FKxG0UiUBICbadEoDPNbtFuKlzqTKWK
 abDn3p5gtrfQ+IHXRdRbX+qVCNItURI+hJxKRoBTjOtwuLEN5tQi+ZQf12FEuYSUxbwHjitabeB
 MSneU/pUNjrw04rlwF9tlxl1Mjdjj+5JQTugBd3iVdzEZ85TO+eFnJ1LnFnEe6mOe6tyeUA5NtJ
 jVqip4WCFThrpuO2DwSO0GdsVl9LJdrc7lAQ4CDD7uY8IMW3Cmx7v/qs+cz0lz+eRKVCW1WHRxF
 wNqEa376oYlK6vw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
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

Few minor improvements/cleanups why browsing the code.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (4):
      drm/msm/dsi: Drop redundant NULL-ifying of clocks on error paths
      drm/msm/dsi: Simplify with dev_err_probe()
      drm/msm/dsi: Minor whitespace and style cleanup
      drm/msm/dsi: Drop unnecessary -ENOMEM message

 drivers/gpu/drm/msm/dsi/dsi_host.c | 158 ++++++++++++++++---------------------
 1 file changed, 68 insertions(+), 90 deletions(-)
---
base-commit: 8155b4ef3466f0e289e8fcc9e6e62f3f4dceeac2
change-id: 20250106-drm-msm-cleanups-ddacf1fc3ba5

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

