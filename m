Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 343548667FE
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 03:12:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F20E010E5D6;
	Mon, 26 Feb 2024 02:11:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="A1jLrBdf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64DE210E5C8
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 02:11:56 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-512d6bcd696so2349313e87.1
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Feb 2024 18:11:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708913514; x=1709518314; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=w3E7dzOhxFiHb1JCqkhJvLIWTzxr8XDqqA0WBoNbgeo=;
 b=A1jLrBdfwH2raknYcMwszUNjbi++m8tRI1gHFOXZf6ytcCu4WU8mdB2J0K8Qx2BGQ2
 vZp6sX920hYYUYxShaGBTQTLew6v14Sqjv3UdilV3XQQvBCO6d56Ua/3r7eSm4xep05R
 2MNYGmyR6fZj1sa9bzvaL8pgs2vDeBrdkXi+3D9gIDZ1TnF05eB9VquJXyAfcei5JVSQ
 fOLdqRgFSXg4G40KjP2yQEQLXQzJfpaA1x74H7nHfI4imcL/KxrjmLcNLDjPb95HX/Uh
 YCVpUIPHeQorIpmZ6BB9EKgbVzochwACKmDYsRzWpddEMU1zSK7AcNkxAWTRpkw623hI
 Z3eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708913514; x=1709518314;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=w3E7dzOhxFiHb1JCqkhJvLIWTzxr8XDqqA0WBoNbgeo=;
 b=QGQ7b57CFfvjW2dgP/gj//bYAzgTLO7Ki/NjbLcy0+Inr52W8odCP4KCeo+dbrIJch
 IHPJanHJF5SdcZA2Bp6wD7K97DPbR12xP2h+YFT1gvjyUaFsdQjuaybHaxgc0FlCDTmz
 67gU0wcnVlozJ+1lMDfj4vMexTiPiOqL/nfjx/95UQUGrzyTFOxyMbZtdF2ZQ2/Rwnqi
 hiMA2v+B3y2b8Jfi6TficBOqpQQ2kJyXR9pgW1XE2qCkQerJA8jmnx+8VObgKFJOxwUb
 wd0Pkp23IZI6WSTBpUrZ1v15ZxJdY27nNWCr3zHkyHBC8YD2AaclOoUyrsaSArU6QjnL
 Ryyw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUAvrjVDPSCwMvmpPW0/apNtwc7VggHEdwfjhtXuHBbcTWQA6kpOb4N3hfuK0lPSNsGkOi8eh6poTwP7uarsq5KtH4KmSCW4YZo+UhIzjLI
X-Gm-Message-State: AOJu0YwBqkqoPqnMaSY6s9bOQISN2l4Dra+zF2cjT+jFa7Ojh4QLV3ir
 s+vyhnP+YwiDtHWJr1vyV58ydJjvSqsZe6zhPSJsbiL6s2BFuVgKcV1muc5sBLE=
X-Google-Smtp-Source: AGHT+IELdSvsYandsvUg2/9kXl+Uxy6kAqgjNUnscBWDJrEMCJeiyutSYFowciKyHufpcYsErIDaEQ==
X-Received: by 2002:a05:6512:2007:b0:512:b43d:6694 with SMTP id
 a7-20020a056512200700b00512b43d6694mr1524362lfb.32.1708913514398; 
 Sun, 25 Feb 2024 18:11:54 -0800 (PST)
Received: from umbar.lan (dzyjmhybhls-s--zn36gy-3.rev.dnainternet.fi.
 [2001:14ba:a00e:a300:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 m11-20020a056512358b00b00512e39ce472sm676176lfr.175.2024.02.25.18.11.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Feb 2024 18:11:53 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 26 Feb 2024 04:11:44 +0200
Subject: [PATCH RFC 08/12] drm/msm/headergen: don't output full file paths
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240226-fd-xml-shipped-v1-8-86bb6c3346d2@linaro.org>
References: <20240226-fd-xml-shipped-v1-0-86bb6c3346d2@linaro.org>
In-Reply-To: <20240226-fd-xml-shipped-v1-0-86bb6c3346d2@linaro.org>
To: Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-kbuild@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1228;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=cdm61gYGUySsFxPZ5ngtMYEu8AnIiXIGfprwz9M15j0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl2/NhT7+nEsdNbK4/t6/GWM4DvV+yrpaxToNms
 1msEgdr7MCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZdvzYQAKCRCLPIo+Aiko
 1e7GB/46EXHrORsKwaZpnKqF3lwzDU5kEbixRHeZy/SKsQys8wDF7msZstYUfIfros0SjXuGoJK
 Dnkg92e8E+Aa/GXa3/qWfkJyBPoeSogz78JZvkb5iGhuQtwqjBVXd4S6bt84CSWqyCuN2Hn4OwR
 JSEJKGu4AKK7xgMekhm4rGTlO71vF5cFSaJGR9gWtV4JncK9yEV/nWYgAp5kMd/v1/Cm85zBGaT
 DWhIM/JBGe7S+XnNITrRCrsy/HwgjSwFvTr7eKH1wb9+z16h/UIbqVWk08eguBjp14TwL41ILeY
 BFsjSb0hpnYqVsm//J92J5mLTKGYUaI9/tOZHzQ65jM/CN/1
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

In order to reduce noise, include just the file name into the generated
file headers.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/headergen2/headergen2.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/headergen2/headergen2.c b/drivers/gpu/drm/msm/headergen2/headergen2.c
index d5a3eb7562ee..2e5c4593d865 100644
--- a/drivers/gpu/drm/msm/headergen2/headergen2.c
+++ b/drivers/gpu/drm/msm/headergen2/headergen2.c
@@ -377,13 +377,14 @@ static void printhead(struct fout f, struct rnndb *db) {
 		"The rules-ng-ng source files this header was generated from are:\n");
 	unsigned maxlen = 0;
 	for(i = 0; i < db->filesnum; ++i) {
-		unsigned len = strlen(db->files[i]);
+		unsigned len = strlen(basename(db->files[i]));
 		if(len > maxlen)
 			maxlen = len;
 	}
 	for(i = 0; i < db->filesnum; ++i) {
-		unsigned len = strlen(db->files[i]);
-		fprintf(f.file, "- %s%*s ", db->files[i], maxlen - len, "");
+		char *name = basename(db->files[i]);
+		unsigned len = strlen(name);
+		fprintf(f.file, "- %s%*s ", name, maxlen - len, "");
 		print_file_info(f.file, db->files[i]);
 	}
 	fprintf(f.file,

-- 
2.39.2

