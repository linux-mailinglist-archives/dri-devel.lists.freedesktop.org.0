Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86A257704DA
	for <lists+dri-devel@lfdr.de>; Fri,  4 Aug 2023 17:33:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9096910E72A;
	Fri,  4 Aug 2023 15:33:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1DC510E729
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Aug 2023 15:33:25 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-4fe28e4671dso3909677e87.0
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Aug 2023 08:33:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691163204; x=1691768004;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ct+HhFSf3JuuA0pS4qW/YHF3pCVOsmudw0iO0Dt49tI=;
 b=O+O0DdJB7gDBLNjPG25N+i5iYBocWpOSXo1e9KKSn+uIzN4wAkWVfWxNpAQshTubR9
 hIsogftgGgdnA573RdL2yI/56LIDgGsrEFwi/idXWw91cGDCG9kdxQ1qOVF88OmOfRBz
 ebA+TEDovyrAC24Acvnr78RW5R3lvnA73XPnz7TaA+MHOBaQF6KsdxZrqF1aYIZH2RM5
 DzPjNzVL+YCdXTSwKiAecoe6klmEvqqyJYM6+wUuOJ9I+TwV+ST5yg0s4DJhWyi0g1Ez
 vDrRPQ4GcQr2jAsH5tXyi003crAiyZfRiJv7wFvJTWzS+i/xLVQUa2A9jvEDarwGe6Tp
 PDKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691163204; x=1691768004;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ct+HhFSf3JuuA0pS4qW/YHF3pCVOsmudw0iO0Dt49tI=;
 b=jHPVOc7CeqeQSyKN2XeoA1KsfkG2ZLndeZuRcnfi2auON5SSjBw+u+0Xc7IJLujYYq
 jSf0GhgybZ8gH3Ei74EGNycS5NP93xHFfBAL2jGwpOJiBTCPr5BWhLCTk2m0x5qGdSZP
 0lucRrHaxxA/S691+IAeO8hTdkqc+LJb0nV/NN9DjyLSwiHUEj4NYod3L91tVjU+c8uh
 4HlhUporI/utluN32FvipCP1jkke0iNYymba34ToGSmpTvZXTQlT7Q+vOlotL1Rt+SBJ
 6ApX0/FZVRr4Y7QQ/u3ISgEbhDlmkIzxNyQ3RgM53te8hfWLbhs6GSddZWo86HtSY8eu
 X6VQ==
X-Gm-Message-State: AOJu0YyMuld2czUu0PsDDqKDVWbf2/JvcP7t1QP2Hm95xA6dI+fgDi/w
 rlHeNbVOQg7QGCguwOqAbVnIBA==
X-Google-Smtp-Source: AGHT+IHEKmz6wgZTpApnn2eeHnpWC8wifjJXIPan0+O+hTJlVADjPVgOzrAW4CFWVh8fXkk9hmfB9w==
X-Received: by 2002:a19:4f5e:0:b0:4fe:89f:cbad with SMTP id
 a30-20020a194f5e000000b004fe089fcbadmr1431945lfk.51.1691163203868; 
 Fri, 04 Aug 2023 08:33:23 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 w12-20020a05651204cc00b004f873ca4139sm411874lfq.71.2023.08.04.08.33.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Aug 2023 08:33:23 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: robdclark@gmail.com,
	Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Subject: Re: [PATCH] drm/msm/dpu: clean up some inconsistent indenting
Date: Fri,  4 Aug 2023 18:33:18 +0300
Message-Id: <169116308155.148471.3951374224625324432.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230804075746.77435-1-jiapeng.chong@linux.alibaba.com>
References: <20230804075746.77435-1-jiapeng.chong@linux.alibaba.com>
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
Cc: freedreno@lists.freedesktop.org, sean@poorly.run,
 Abaci Robot <abaci@linux.alibaba.com>, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, marijn.suijten@somainline.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Fri, 04 Aug 2023 15:57:46 +0800, Jiapeng Chong wrote:
> No functional modification involved.
> 
> drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c:183 dpu_core_perf_crtc_check() warn: inconsistent indenting.
> 
> 

Applied, thanks!

[1/1] drm/msm/dpu: clean up some inconsistent indenting
      https://gitlab.freedesktop.org/lumag/msm/-/commit/b0fe70105056

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
