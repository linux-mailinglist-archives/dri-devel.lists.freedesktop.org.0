Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4075AA47493
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2025 05:37:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5DA410EA2A;
	Thu, 27 Feb 2025 04:37:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ThkD3SFC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BC9310EA2B
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2025 04:37:45 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-54529e15643so1499873e87.1
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2025 20:37:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740631064; x=1741235864; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GYRdSFJ0y3J8w0/MIT9m/pNCngOvo9+w+cz68lIRPZQ=;
 b=ThkD3SFCW2anG7KXWamjpn8j531cN1eDsemSN/x0iXhdofkjFf0BdagfbZ6wXFfnaA
 ejzsYqblCurKp9A/dhP4SZMmwpnntpwC+fVUvrwekDNoNjSep+/hdAY3rneFCRdFyAub
 LdRz/apCrRql07buCbz9FxDBtiIU1I/gPtncZGTFAGSoVEuwCk4t/+/UInOfLdanVBWh
 pRiP+8nsj38m4F+zStutwibqqoQZ09tC5GLnlPzE68zmm93DXTcTkh7ye3Mb7i1zc7Fx
 Ow4rmgwem1jk9OvXF9nTn6bSTfZS/miG1XhAyjOTt0a9OwpBSqXRQ8J/XtxCgCnvQWAQ
 9adw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740631064; x=1741235864;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GYRdSFJ0y3J8w0/MIT9m/pNCngOvo9+w+cz68lIRPZQ=;
 b=g1wb251RxskcwT4nZ35KFYDfiIgGL4u/BPdK2iv6SQ3rJV8f3whqnXWsMK1RTOQGLT
 mP98mJgNDFQXVKIoMkkcGy/RZuOa6KbOZ9ByiL5ypZ+hQar03NvM+gOAiWJ2wasR+Y/K
 cG4iwt6qcWpqgqQ4CWUh3leaMvFjYI+XpUDArQnwzoizmpUY2YzP6s6dAQcHp6Yv4Gk4
 l+GEblY8ZFyxB7jsbfSjkmUC78WYwHy9Cnm8wCJij8aWHiWNLIC72LTpSVEL1hW4aRBE
 otuXN0JD+kPqACrrscpTaudlEhXdLOoVqpPD6LG+I2qq5sVmRx0G94raRAmBcQVUTa48
 MNWw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUUMAJkemxHMZjXRx+9Yyini1CfB9Z+nD+fXrSfUbBDDQFbwZ++hcc36Ol2zm0551M4vygToXYFIyk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx0glIbedUsxVeENrYZ0ZnT+UoBtDmRc2NaELErroNCh984KsJw
 Ntj40UzxfbjLBxbWg7mA3ADNH6a3/FH7LDGhL5eX+Bwbk9sB/nG4tugMBiD8uqA=
X-Gm-Gg: ASbGncsexNng/jU1my1BMe6AeayolWj/thjKy7M3arRaEZZNpUmOJbQUlDdWjNAss7w
 nJHPXV5x752weDgPgPvXPllvvapHlyn/AcvWB+vw/35a4G1dx5nyNh1UkU56ci4N6k6uZ/dLzxa
 kRmKOeeTWKNO6TOMdLdEUweqVFpbSDIaKYm1uz170o5u6PXiG+8ULWSLoS3lUJpMjB5rrHCcRja
 PaCFH0Pw7FlDZ5ETEfr5IVYIg7kExiZJGw9OokMsh7AfIDjEYcaKjI7xFvm+YrbHeinl76tcX3E
 l1PcXVNgky7tD+xYjA72wHFhbPnMPHZ3YSZsu2eorA==
X-Google-Smtp-Source: AGHT+IHInNYeeu7RJnY0u41TSawSb/sSqGvIZ8wxvnotJqXxQ14P4JT9/11iwOVMUCOL38JGxUNb9Q==
X-Received: by 2002:a05:6512:3054:b0:545:5d:a5c7 with SMTP id
 2adb3069b0e04-5494330bedcmr587647e87.21.1740631063830; 
 Wed, 26 Feb 2025 20:37:43 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.90])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-549443ccf45sm63485e87.229.2025.02.26.20.37.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Feb 2025 20:37:42 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: robdclark@gmail.com, quic_abhinavk@quicinc.com, sean@poorly.run,
 marijn.suijten@somainline.org, airlied@gmail.com, simona@ffwll.ch,
 jonathan@marek.ca, quic_jesszhan@quicinc.com, konradybcio@kernel.org,
 Haoxiang Li <haoxiang_li2024@163.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dsi: Add check for devm_kstrdup()
Date: Thu, 27 Feb 2025 06:37:24 +0200
Message-Id: <174063096227.3733075.13590017200932514746.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250219040712.2598161-1-haoxiang_li2024@163.com>
References: <20250219040712.2598161-1-haoxiang_li2024@163.com>
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


On Wed, 19 Feb 2025 12:07:12 +0800, Haoxiang Li wrote:
> Add check for the return value of devm_kstrdup() in
> dsi_host_parse_dt() to catch potential exception.
> 
> 

Applied, thanks!

[1/1] drm/msm/dsi: Add check for devm_kstrdup()
      https://gitlab.freedesktop.org/lumag/msm/-/commit/52b3f0e118b1

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
