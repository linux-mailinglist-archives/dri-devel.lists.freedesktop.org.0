Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AC139F241B
	for <lists+dri-devel@lfdr.de>; Sun, 15 Dec 2024 14:11:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B212410E381;
	Sun, 15 Dec 2024 13:10:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="uCzPSGk5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 317E010E21F
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Dec 2024 13:10:57 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-53e3a37ae07so3485372e87.3
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Dec 2024 05:10:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734268255; x=1734873055; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+cnbx6Y9yMJBvsPZY055b2Z+E7Q3d8VBnIiflj19jBI=;
 b=uCzPSGk58kI+3Ba2bJE33D8zsjL/oIXNKDhZ8Hlh7QcQv+yLzKSnnVaaPHb+UsBTZS
 5REurEwLxLjPfr4+K3Dxt6N/f8A4eYTBvY/q8xzKK826a7yJLe2cWFBvbRpKQ00HbtAn
 uAhridAmV7dwpS2NI6g2QZ1stIbceodiXV4q9xe/RsgULjAFNPckWLTOLogINF7c8iXr
 UlotXV+sHXfsVLBh1AEzRA2n2OK+mbKb89HBin/9aO4PLTSFxWz+aoItkchvs4OqL5k3
 1VHiOfW1VewtGel66zZb2AaArzwoFfeUcyOgIroRjRG3sG5b0zJKk92khR47VfjPpJHf
 uw8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734268255; x=1734873055;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+cnbx6Y9yMJBvsPZY055b2Z+E7Q3d8VBnIiflj19jBI=;
 b=JDW5G7Tc16DcQD8fZEwq3O3GvP5DnHhCRwDVfdnx/mDYv460MEXxUG+BwSWdBUNKVV
 pCyrK5xrXv5trCJRbxWdaVYCaa62j54z5YUzfg36ReGNcq1VytYp313kntah8JQFw7/f
 bXiezD51PMe5B8QOA1YDCewQqLtE39T2gZEpG2tWU2aQzGoUpRvA2AHeKT+jEQkV2jyO
 KgBA/O+L7Mzl5g8Qu+nuJ2Ex4rQjSXyAshNyIECqbkDDcCDcOMgYO0nTGxkarytLztz5
 McHt7bVRdvolM/9rYgRU/gX87B10zy+XFnJEa2RoG2iFTq9hmw/rT2p0DlBmeRPG9lQG
 B2bQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUm5qIK0GvTcRAYT+GjyRJwD5yolMFUahx10HpqoY8/l9C9IP0t1ZyeD266/K7tc028eSvM8BSczGU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxtd8CPFC1PCjdqh7Ymf3YSmcfLTb9ULejele+7ihHoPSjBGn2r
 vL1oFK+XNuINyL1DmPaesYa3nmHdDAGdIIxg6VUbT4dKdZkPrlfKlJCHiQ3s/AQ=
X-Gm-Gg: ASbGncuAHMaGxqFQpXz/1U/TTrNLKMREfjogYtT1J78isoAuRRjVwodAY5ZKKledqNX
 4lJG6/8ny4+RpEkVXFB+b8rbuE+kcnG9TK5FVwx+jc1riVFPmiqeuHI/X1dTi0rDsEqkPXAxhN4
 /SZvthO/XYrr+W9U2BUDOC/h/JFOvpzr70chjedkxKPLOSXWgXJ9XujkN/GpsTkGI37pnj0NRMj
 95PO7kUE/4l3f0OsxJhFpdMYBSxE6Xkt6AVnB1NfD8c030kCzjFNVSKI/Mi5d7MLFumqUrc
X-Google-Smtp-Source: AGHT+IHTw20hSoY1t2S8hQDm6sAR/6CNjVdyRnyImaVn8xVxpAXP6KiR+1x/jnjFYeOmyB9D3YqAAg==
X-Received: by 2002:a05:6512:3195:b0:53e:395c:688e with SMTP id
 2adb3069b0e04-5408badcf28mr2596428e87.10.1734268255530; 
 Sun, 15 Dec 2024 05:10:55 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.90])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54120c00262sm496316e87.138.2024.12.15.05.10.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Dec 2024 05:10:54 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: quic_abhinavk@quicinc.com, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dpu: Add VBIF to DPU snapshot
Date: Sun, 15 Dec 2024 15:10:43 +0200
Message-Id: <173426667309.2196979.11608285674325095814.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241122-vbif-snapshot-v1-1-6e8fedd16fdf@quicinc.com>
References: <20241122-vbif-snapshot-v1-1-6e8fedd16fdf@quicinc.com>
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


On Fri, 22 Nov 2024 15:09:10 -0800, Jessica Zhang wrote:
> Add VBIF registers to the DPU snapshot to help with debugging.
> 
> 

Applied, thanks!

[1/1] drm/msm/dpu: Add VBIF to DPU snapshot
      https://gitlab.freedesktop.org/lumag/msm/-/commit/1a40bb31fcf1

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
