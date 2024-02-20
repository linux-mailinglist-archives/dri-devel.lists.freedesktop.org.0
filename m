Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E68C85C218
	for <lists+dri-devel@lfdr.de>; Tue, 20 Feb 2024 18:12:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4613210E56D;
	Tue, 20 Feb 2024 17:12:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="PCxuIIM3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8062210E56D
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Feb 2024 17:12:19 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-512be9194b7so2072969e87.1
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Feb 2024 09:12:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708449137; x=1709053937; darn=lists.freedesktop.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=TGyEb9tL97pZ41i0EqJWHQnAWHv94eJvvrEZG1SYwN4=;
 b=PCxuIIM3Rx9wvMgYVJgSTusUCIhUOaK31H5+rms15upvmOa8UWrG2LdNqmHfhr9S0C
 j50Z3IzrYcT7Z52SXcKWDglTG4soDpw0tP5mO7HNKmKoPWWlts10/lT4m+btHvWz8fzV
 csPG3efDyrlReCOUNcJFMImJxfF2STxHbI5Q0JGYGSwtohgRYHZIx821DcVxwC+bXtm/
 r74sUiKuuDNJhZdOYF0Eezir8TVE4fsdJx13N6Rl9Ua5jzVohV0a4WeE2gwO3vxvxxv8
 pBJZJ4mk2aCenbuXzSOIdJW7tIC4MjvKaCCz1YGqp98V+6oyUU7sqzezYgTzP/NBW5vy
 6hFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708449137; x=1709053937;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TGyEb9tL97pZ41i0EqJWHQnAWHv94eJvvrEZG1SYwN4=;
 b=b7gIGsZru+d7wwzMldQEvuDrC+nj2j1OuajhAHU2mhVbI7I/sWxaPvb1ClHJ/X42aD
 JFTbz/dHoMylZFx7V9b1/LpQL0WUK7/qDc5bysKED8uL1YHvUX8T8rOzfHUYlAbMjWZB
 hh5y845mEaVrpbj959Gioj2KqYoPVrj6BU55hyhBUHOWbkVX/p9h4DUMZV0q5QLBg5YZ
 KCrCm0H4XM2tH1iIwodbk1tVUdN/8EGlt1zcmil918kr1dB92MMfAMeW9J7d4Ml6bpYb
 Dix1FUuXed8DuEIwxuc6lcdrFYFZj7TvicHrpYwKTKIrpWPYw9PUYdY64DnCiwGFLCs6
 /G6g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWBveIwntQnc2vj6x1alZfFalYlGuF8fwlFpDrBbUuR5swvYhDbKmG2IyKrfQFd+gbGm4EhA1Ic36xa4bMY7npZc8+r5+vAicQQaFWlw5uQ
X-Gm-Message-State: AOJu0YwQgWS/vOLOX3txZsftfVVEwupCFwzdqeccqSf2ekUVnooGZlE4
 WYvtmJpp4oF1Fb7Bxiopx/ia6v4o1tjTltMPV2SxK5uCGgI+dRjC6RO8Ixgxubw=
X-Google-Smtp-Source: AGHT+IHo+GK9ZXl9LYc2lAxVTvWicxEOUKQReV4nK7xoVkyUuUfNwOLUZWdQgB6teQ4vznlTC4n3Hg==
X-Received: by 2002:a05:6512:e9e:b0:512:bdca:bb5d with SMTP id
 bi30-20020a0565120e9e00b00512bdcabb5dmr3907542lfb.4.1708449137216; 
 Tue, 20 Feb 2024 09:12:17 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (dzyjmhyyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a00e:a300::8a5])
 by smtp.gmail.com with ESMTPSA id
 b8-20020ac25628000000b00512c8d9c8a0sm240802lff.113.2024.02.20.09.12.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Feb 2024 09:12:16 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 20 Feb 2024 19:12:10 +0200
Subject: [PATCH] drm/msm/a6xx: specify UBWC config for sc7180
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240220-fd-sc7180-explicit-ubwc-v1-1-611a58091724@linaro.org>
X-B4-Tracking: v=1; b=H4sIAGrd1GUC/x3MSQqAMAxA0atI1gZibXG4irjQmmpAVFonEO9uc
 fkW/z8Q2AsHqJMHPJ8SZF0isjQBO3XLyChDNChSmpQidAMGW2QlId/bLFZ2PPrLoqbK5K4zptI
 FxHrz7OT+z037vh92pKZiaQAAAA==
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Connor Abbott <cwabbott0@gmail.com>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 Leonard Lausen <leonard@lausen.nl>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1745;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=BnIHUEr8mYm7RtcY6EIoREgODeHWv+l5ytTt0UKBG8g=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl1N1wx/mMxixCVwdRRTD/ucyIwKcwBbXBvC30g
 rD2Iyw2+UWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZdTdcAAKCRCLPIo+Aiko
 1T8iB/4w9oI2xjlbk3C6OJx+Kq76dR5a36rY2818UsGabyH8zrIrLvQ1reO94havjNuL5TOlL9k
 Rh0xKkeO8Vy/cgIVyYC9pKJ6CU0d7SXKzXfPFHsrwbBKyolMMLm99NXX6ex+FtU+ZtFcLArMikx
 XcqrbDFKFhSBGFg1KIQjIq8ydqS6XByYClfWwKkbAPcvxe+kAdjM2eXWj+IF0APg+FQSPMHoZhp
 2luSTFnVRuoOAH94mr9JC8svyYMjlDEGPX2x4kT/jvcZx/b6f2j8f4e9ytgCVVdV9/yM78Ja3Dd
 QZiKQZqgP2vFyRjC9uKtqFF2Cv7oqev6Fbh6jJodA9JRdkhK
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

Historically the Adreno driver has not been updating memory
configuration registers on a618 (SC7180 platform) implying that the
default configuration is fine. After the rework performed in the commit
8814455a0e54 ("drm/msm: Refactor UBWC config setting") the function
a6xx_calc_ubwc_config() still contained this shortcut and did not
calculate UBWC configuration. However the function which now actually
updates hardware registers, a6xx_set_ubwc_config(), doesn't contain such
check.

Rather than adding the check to a6xx_set_ubwc_config(), fill in the
UBWC config for a618 (based on readings from SC7180).

Reported-by: Leonard Lausen <leonard@lausen.nl>
Link: https://gitlab.freedesktop.org/drm/msm/-/issues/49
Fixes: 8814455a0e54 ("drm/msm: Refactor UBWC config setting")
Cc: Connor Abbott <cwabbott0@gmail.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index c9c55e2ea584..dc80e5940f51 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1292,9 +1292,8 @@ static void a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
 		gpu->ubwc_config.ubwc_mode = 1;
 	}
 
-	/* a618 is using the hw default values */
 	if (adreno_is_a618(gpu))
-		return;
+		gpu->ubwc_config.highest_bank_bit = 14;
 
 	if (adreno_is_a619_holi(gpu))
 		gpu->ubwc_config.highest_bank_bit = 13;

---
base-commit: 41c177cf354126a22443b5c80cec9fdd313e67e1
change-id: 20240220-fd-sc7180-explicit-ubwc-40953fa55947

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

