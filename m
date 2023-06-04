Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 376CB721438
	for <lists+dri-devel@lfdr.de>; Sun,  4 Jun 2023 05:01:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76A5110E099;
	Sun,  4 Jun 2023 03:01:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D72010E099
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Jun 2023 03:01:42 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2b1bdfe51f8so8989981fa.0
 for <dri-devel@lists.freedesktop.org>; Sat, 03 Jun 2023 20:01:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685847700; x=1688439700;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iW8Li2n0rZD7NzpAXirqLsFNZMxHZzT9M5Uh4WLCquk=;
 b=oUuTNwpXCVwN7isRcBeO4rW750QoBBz0forLMpsixuYaTStFVRpB3hTRNR2dpPG6/K
 3jwkHqla4JIKwoS56k8vrxCd3aGjE4w6woxJ35bmU2V2kx6eLncAt/tLdooxUC5IJnMH
 GOx8loJ/JSsv/87umq1Rfm0Xtm+JiCCqZmhLMWvuUH4dDZH37jCzE4A6n90nqukZ8dca
 zzimW/4F7Hd0K2OlVBABitmLZ+FMXRHAEojG95alypaLThfwJfXgwqMFBTUT9Z0wb+Lw
 LZvs4gsd43NFawyP2UWgns+f1GRKRKyPxAfzpxb/K0NJlqBZjquRrbp1Zn4xlsImajF/
 k0XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685847700; x=1688439700;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iW8Li2n0rZD7NzpAXirqLsFNZMxHZzT9M5Uh4WLCquk=;
 b=I98a7pMhRX7W44xXTcsDLB3xC4G7ztoHq9CCGgGWtNv16/g3q+/baDypV9O81xgkW7
 4j3sCRCWQ9oQcCkcdnn+Y6jCSC4AAT130asJg1uVq0ndBNVkjnEvL8KE5Jnf3Ebe1WsA
 eqAMyP9DN68WzROlnBCcM19NZ20h4hveNqCGNUzFnSK/KwkMdPusT1DWv3KY+0Dtd5F+
 JlJCqfCJfHdJcNeQaw8rECbcrIENDK/rjAAzDexSf8Tdc6meAe5Sc4cvsoXhKMygvm1V
 BJkAUU2c3Zdjh3I8na/MGg35fKhzhnutaYmLHzfFzX9+p4eIrVN6N67yrPWvWKxBjs4M
 hqMg==
X-Gm-Message-State: AC+VfDzINwOswk5uo+utUaTZgd1bfkXU0Z+1RZcGx5DvE34lOI3xyN9Q
 1Qbek9cSMUesGGIr1a/o0r/vKg==
X-Google-Smtp-Source: ACHHUZ4gNdjSeZJPzmWovGSc/x4MjDwnYJBgKddZijOqQwsfXwnD9Ek1REVt6tKvEYHFV0jVQdtnow==
X-Received: by 2002:ac2:4f8a:0:b0:4f6:ac9:2eba with SMTP id
 z10-20020ac24f8a000000b004f60ac92ebamr1771664lfs.11.1685847700079; 
 Sat, 03 Jun 2023 20:01:40 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::8a5]) by smtp.gmail.com with ESMTPSA id
 d15-20020ac24c8f000000b004eb4357122bsm653181lfl.259.2023.06.03.20.01.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Jun 2023 20:01:39 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Dan Carpenter <dan.carpenter@linaro.org>
Subject: Re: [PATCH v2] drm/msm/dpu: clean up dpu_kms_get_clk_rate() returns
Date: Sun,  4 Jun 2023 06:01:27 +0300
Message-Id: <168584750429.890410.15848312463141330600.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <28644c5e-950e-41cd-8389-67f37b067bdc@kili.mountain>
References: <28644c5e-950e-41cd-8389-67f37b067bdc@kili.mountain>
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
Cc: Liu Shixin <liushixin2@huawei.com>, Sean Paul <sean@poorly.run>,
 linux-arm-msm@vger.kernel.org, kernel-janitors@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Fri, 26 May 2023 14:51:59 +0300, Dan Carpenter wrote:
> Static analysis tools complain about the -EINVAL error code being
> stored in an unsigned variable.  Let's change this to match
> the clk_get_rate() function which is type unsigned long and returns
> zero on error.
> 
> 

Applied, thanks!

[1/1] drm/msm/dpu: clean up dpu_kms_get_clk_rate() returns
      https://gitlab.freedesktop.org/lumag/msm/-/commit/025e3d97867c

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
