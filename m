Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD5E9A4AA27
	for <lists+dri-devel@lfdr.de>; Sat,  1 Mar 2025 11:04:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7069910E177;
	Sat,  1 Mar 2025 10:04:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="a2qDSn29";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3808D10E177
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Mar 2025 10:04:03 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-54838cd334cso3347856e87.1
 for <dri-devel@lists.freedesktop.org>; Sat, 01 Mar 2025 02:04:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740823441; x=1741428241; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=76ANipvR3P/jVIpgRlnkUUgAgrkLoL0o+K6EABpA1ek=;
 b=a2qDSn29rH2X6Wt+k+gglsFRJzVZeem/3CkWWmQl9n1tlEWddVVCtWPe4x73WI4G2B
 WqJWFSVltv0yxG1rar7Es18xRWmLRW4CWDCaifa+CI+5o7lDO930VV0p9ObjIw3jYNgd
 0QIoP/MsmKmeiNQEJT09qRRC8B6eP+Uh5qdcRC8arLbPCyAv9mor/lXeo/ryrrfLXW5F
 1zTZ2YjmL2DvZ+/NHp4WtGCmemn0JX0pq3dfvcaZgPq2hGSS1ibxAHBkDE1Z5yKiDsua
 gD+uvfNg2NJaOo30XCeVoBilrLqJ4HHsdW3ChiqMzccgTNZEtFaZxHgeH7Zn8GK89FVs
 lYjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740823441; x=1741428241;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=76ANipvR3P/jVIpgRlnkUUgAgrkLoL0o+K6EABpA1ek=;
 b=u6rf62EU9SaTOV+y+j6g3myOY44N5IUDJGs/tIv08TZ/ej9KIN+mGfNp2Hfey1YkmQ
 iV3HdN7Tl2DFpitWVozb87j3FihVU1i9/e3ZgtTt7f8qJ9Bn7tPpW4JBeV+YixyZ10IC
 YgzsFyvwoOUKGll7GntRd3aHye8i3M+HCcO9G27U5/cB6gPAxaSf1/GvrVhpCV6G9+k+
 45mdITe2dWX7trX0KSwVRfBl9vevu6WuGy6Krd8Z+qyrVWhcChGly2GDv0I+1QnHiOXD
 jGbqsjf+B8kox3EZ0Li7Vxk9ZI8fzlPG0Df15V9JEwA+mw1Vzv2jEBPAvz5OIA8Ml0z9
 9zBg==
X-Gm-Message-State: AOJu0YzTbm+IYWR3RkbyRrahUJpDZ8lWDVTlyq62TbUdCVY2fzRdNymi
 pGjmWl4Fxob7q0oZW3ipCMq0ognnUlI1h4p/nkTyhc7B61BK1Pt+ZKxdfzkov88=
X-Gm-Gg: ASbGncuQcwQMXeaQE6gjr3Aey8fUp1eaV+JuGLj5NCdRCSuVlphHYIt2n2IKlDuK/bq
 +2tOjUVG1X4zKd9HrV6PttHVyAH6cWlAMELutPcWSR3PBdMkW8WOvFqaLJ06i32HhZNORLLWBx3
 yna6rRA5ccjJA2UfUDzaCAEawSl1sFSDHRUDq3ydXck0axTe9UelZ6l4a5f/wYDCDUaVYZaM+wK
 tNh1o7r0K+M8Tz+CfULjS/3Z4HuN4xQEYVrqO61rhjbEdbRb2AJEgI3K7WS/7YP7Nb7f08LBBvA
 yQ3DG7yc5nATl34HrXiMoHkMZODUYVayD9lpgc+CIlCJpP2RWBP1eWDTktbR0q3Xgjj1l1PJigU
 AKXf0lM63Imz9
X-Google-Smtp-Source: AGHT+IFuYzubuDyf6X5ei2oE/n7MHEB/XJ+jimftn4XgARTj9v/mjL84XjfF68VTOLYEok0MXR5YaA==
X-Received: by 2002:a05:6512:3f1d:b0:545:aa5:d44a with SMTP id
 2adb3069b0e04-5494c33304bmr2297080e87.42.1740823441381; 
 Sat, 01 Mar 2025 02:04:01 -0800 (PST)
Received: from eriador.lan (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00::7a1]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5494f8bdde9sm463722e87.148.2025.03.01.02.03.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Mar 2025 02:04:00 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: p.zabel@pengutronix.de, airlied@gmail.com, simona@ffwll.ch, deller@gmx.de,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, linux@treblig.org
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/7] gpu: ipu-v3: Remove unused functions
Date: Sat,  1 Mar 2025 12:03:57 +0200
Message-ID: <174082343297.2941786.11452976094065423321.b4-ty@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20241226022752.219399-1-linux@treblig.org>
References: <20241226022752.219399-1-linux@treblig.org>
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

On Thu, 26 Dec 2024 02:27:45 +0000, linux@treblig.org wrote:
> From: "Dr. David Alan Gilbert" <linux@treblig.org>
> 
> Hi,
>   This set removes a bunch of functions in ipu-v3 that
> have been unused for a long time (since 2012-2017).
> 
>   No changes to functions are made, just full deletions.
> 
> [...]

Applied to drm-misc-next, thanks!

[1/7] gpu: ipu-v3: ipu-ic: Remove unused ipu_ic_task_graphics_init
      commit: 16e3bf497fb2d379f3d461fa0c85d14de0a3d183
[2/7] gpu: ipu-v3: Remove unused ipu_rot_mode_to_degrees
      commit: a52ba18c254c0a3819e632e6371554f1c6f5bd16
[3/7] gpu: ipu-v3: Remove unused ipu_idmac_channel_busy
      commit: 4f9c64e95c3510f4a5192bd401de5611c1dd5637
[4/7] gpu: ipu-v3: Remove unused ipu_image_convert_* functions
      commit: 96e9d754b35e87a5be2de7dce3c810ffdd769c84
[5/7] gpu: ipu-v3: Remove unused ipu_vdi_unsetup
      commit: 27985c86e283e1e5ac8a9809f189f03643a6f5f2
[6/7] gpu: ipu-v3: ipu-csi: Remove unused functions
      commit: c687c3147d5de801ed835b077802b68fe85d8a3d
[7/7] gpu: ipu-v3 ipu-cpmem: Remove unused functions
      commit: 2800028d5bdee8e9a3cda2fec782dadc32225d8d

Best regards,
-- 
With best wishes
Dmitry

