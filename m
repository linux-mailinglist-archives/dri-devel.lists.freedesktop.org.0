Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AC749FC24E
	for <lists+dri-devel@lfdr.de>; Tue, 24 Dec 2024 21:42:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2AE910E220;
	Tue, 24 Dec 2024 20:42:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="mQ6DQdYS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F3B510E220
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Dec 2024 20:42:09 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-540254357c8so5436113e87.1
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Dec 2024 12:42:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1735072867; x=1735677667; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=013fQ6OlJ/C1u33CS05E3QkAEu35dZhHmucAOsh3zcE=;
 b=mQ6DQdYSL1jgnrHJ0c0H/GDeUZ65sWRBawLl988EbKa4Gvw+K8ptzfeVyCpU66ZNyQ
 n0FGHtlEsWGdsH6RCFhTj2Thrl+FlDLSWkGzj+xgik3KyRrGE1UBdJcr+lEhGj07kDH0
 5KQ8bMOvRrV5COyUT3RT3ic+HggcTo08Oaj0DnKrMlSVhhmJH6prXDOzR7k05oCr87jk
 xJw61cxhJo5RLRv58ebvhZyBfY+lnLhBvq9hBNjQDvm8W8wZKPpEER0qPF5KtgkL0oE+
 glNHxrkzzAMIBet6+G9PzAOAxtPcCeF+DE8OcyFpsUSxQnlYCgwBRyXo2H9dxjXKO3Xq
 rSTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735072867; x=1735677667;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=013fQ6OlJ/C1u33CS05E3QkAEu35dZhHmucAOsh3zcE=;
 b=EPZ0qIbKKxkzTIjTHZ8/DJADEQp+3HUjFUxVf08VhThHJo97Ocj0BStk+xQxdbfXKa
 Vgf1gm2DyXXkzt8IwwaYteF7iCY3AwlVfA9dQI42hOKwC15STaPNuqgbTEB15wkRwB4s
 5TUJwky/rBOhtMZ097BPMDO8h65pyoC93AskTZ03zhgGLGUrdg8UNW0U2++5PHeyap3h
 V/zNX40EHMjkrFLi7PEDANrfh//B8MHqND2IqeaBCmEfnkfR4yqQjjTMM22+IXQgejFo
 zlvEj347svXti/zMu7OawiGUnI3rLU73u9cD2vmDznKpqWA+goLQNlR3L/bHOekFH/6d
 PXYQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUUYw2r0HyGsDbQ2+3ET6HIfbJLHg5HkFnDZQhIKpa0/4hlB+qjGOOfgs/qNZJYlpqT0D0nIxLgzM8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzpLNCob6ZS81ny67B49xlnm9eqSAw1APs4vJUMK6JUDfskEDKm
 jxzujabq4cEMs/1lbLRmqTWm/nwyzLxYJLSAUgH3jOPQ1MvLw2lIVWbAF+0rPDQ=
X-Gm-Gg: ASbGncuhlPZmNHtHlkf+jHVSpIibY5zdKfxxxIsdxGFowixZUlSB27u3q5tNvK9pgcF
 WtvpcPaTaFMM88PD7/mgI8khjlYrtLYNR4S35nDQphlsg+/LzMk6z2NH0hIWJL4q1L+cHw9t6qM
 eANkU6K5vmM55kmzlz93XoDhvUwD8RxAYCEfIK1PrLi5/asvErh+T0iKCbcWHMHC6mzkMkwHZ3y
 3EiqK8uwqZ9Zr9NTXJl8hDg5ei2iD5uvtm0F9bcxSsJj0/feC8HjC931M93p/wcMc1Qmwhg
X-Google-Smtp-Source: AGHT+IH5+6vfwjy4BTw9YCLzcbedK1FJ6WQCRricdTAApVBK2Uzvp8laNd8QmgHwa+lXbQ8/PXrF7w==
X-Received: by 2002:a05:6512:ba6:b0:540:2122:fae9 with SMTP id
 2adb3069b0e04-54229582051mr5745971e87.46.1735072867393; 
 Tue, 24 Dec 2024 12:41:07 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.90])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3045ad9bbdesm17808361fa.44.2024.12.24.12.41.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Dec 2024 12:41:05 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Arnd Bergmann <arnd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jinjie Ruan <ruanjinjie@huawei.com>,
 =?UTF-8?q?Barnab=C3=A1s=20Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm: fix -Wformat-security warnings
Date: Tue, 24 Dec 2024 22:40:58 +0200
Message-Id: <173507275852.561903.13981702571183938186.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241216083319.1838449-1-arnd@kernel.org>
References: <20241216083319.1838449-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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


On Mon, 16 Dec 2024 09:33:13 +0100, Arnd Bergmann wrote:
> Passing a variable string as a printf style format is potentially
> dangerous that -Wformat-security can warn about if enabled. A new
> instance just got added:
> 
> drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c: In function 'dpu_kms_mdp_snapshot':
> drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c:1046:49: error: format not a string literal and no format arguments [-Werror=format-security]
>  1046 |                                             vbif->name);
>       |                                             ~~~~^~~~~~
> 
> [...]

Applied, thanks!

[1/1] drm/msm: fix -Wformat-security warnings
      https://gitlab.freedesktop.org/lumag/msm/-/commit/49c2e01be19c

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
