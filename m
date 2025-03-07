Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20E87A55F05
	for <lists+dri-devel@lfdr.de>; Fri,  7 Mar 2025 04:54:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71D1910EA55;
	Fri,  7 Mar 2025 03:54:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ADN4WTb4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AEBE10EA8B
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Mar 2025 03:54:31 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-30ba563a6d1so30164981fa.1
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Mar 2025 19:54:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741319670; x=1741924470; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=m+OWx/yorY2+66tlAZHZ/irBDPLHhMdijI7doxLhFUI=;
 b=ADN4WTb4buD1/9aD6jPiMqhokkb1QNa0ihNM6uqbxN8oMwvl8p9h/zBVTlflbEqJSS
 V7RJzEmcXPS9mTYr6PC6nmcwOW/lhHVmWk5+s6f3aMus5shfhqDIHNzc/Y5auJR1sOeu
 LwkxOWb766kEVSbdsPFNm4gEq1JHhxY3MssWqyc/2Yhcgc6kLH2enVyWo5KCbcUG6fhC
 LFB0mWPJpGsiOgLr5RFqGTRSHVFuT2R9zfLgr+PWt4OAIMurOxgrufQOM2MBJ3zp8Iue
 ZyTpKkaptIf9Q4GyzmWZGdvJiR9J/qPGVGxbVL3TuPbLWgJ0hoK4ryte+mL4zCDwfWD9
 tomw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741319670; x=1741924470;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=m+OWx/yorY2+66tlAZHZ/irBDPLHhMdijI7doxLhFUI=;
 b=vJmledt/qq4JSPy4QMukZfRSbQgADF4n1eIJivFndUqzoWsYEdqyTXKUdYe0HmNJSW
 cD2F1M4jXqVjvQ+k1ukTlsgHqUXgq4/C8O3XYSgDaZ4Ohh9dKpQnAeiXLnXN+6A7mPNp
 /SQdRN/BSb+1P7iGN1XW8naJrvmPw7k5unkzaoHU6Z25mPkPGCAc4oJF2PfRC018/ngE
 gtsPv0BnKPYWd3QBG93BFang+Ku/nZmRnrzdj8S12jKGbv4Dvx38ts6KixVuf5B4vZY8
 +57hbRK7XULSP4vNuasxTRx/4G7ONvLhlBIH07tiwiVQ7RBQhxZOcNd6EylxL/255ePX
 wXSQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUny3/Ld0FNLgrKLKWV4qWNPxwk5eu7DgQNArbiSv4PYCAEGphg8i+q0Izp/UiNg5VX1U7pVSPN0hE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwgokW/xH2pqamZ0WHRCXUSM0ouN4vrI3zkw3X+I01Mx64CklMy
 1fPYrcmNUEZpvQggwktXaFxYogREDtFG85V3FPCCQE9WGxaji+Sib8XNlrAu8CY=
X-Gm-Gg: ASbGncsKrnmc0gNrJ5GuV64dHOdZpvcf66J38j+AL+J5o3eIo3UVLrSQwseEaRUB5/7
 OmpVvLb6cLI601o9um1vmC+ZxKwgttFTVSx1k2TK2lo3fPQ5txpf2XMIjcYKNPrQHwqCWCwDIwJ
 h7NagokR0TN47xffnS8fS015DFYhBuxBP6YooSwHk9GnDmlDhU48wmBV5QuMBn3S8CqFNcbnFbp
 178G/oJrmQpys4KU4pe4D9EZJwWXU6zOcyB7PlQd7UgQUGt2eI/dRassaZ5TsoJLs/oemKcG94F
 +zZrFtwclx/5koR/rEUx2jKUZCl3iwPelIL/uAg4bl0X1LHADR7pxYvGf2l5KTbcDWsSEkDXAca
 C0Bj2awqhuGuI/qMvJaITHC4P
X-Google-Smtp-Source: AGHT+IEJgFAZPzs4rQ+GVKleLSPBx3Zx5gP9AGl5+VtS3eJ/TazNnZBeAYAWo60NeSqqg8te1ly9lQ==
X-Received: by 2002:a05:6512:ac8:b0:549:8999:8bc6 with SMTP id
 2adb3069b0e04-549903f6a22mr675684e87.6.1741319669653; 
 Thu, 06 Mar 2025 19:54:29 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5498ae4623asm358766e87.49.2025.03.06.19.54.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Mar 2025 19:54:29 -0800 (PST)
Date: Fri, 7 Mar 2025 05:54:26 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Cc: robdclark@gmail.com, quic_abhinavk@quicinc.com, sean@poorly.run, 
 marijn.suijten@somainline.org, airlied@gmail.com, simona@ffwll.ch, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Abaci Robot <abaci@linux.alibaba.com>
Subject: Re: [PATCH -next] drm/msm/dpu: Remove duplicate dpu_hw_cwb.h header
Message-ID: <wnqsl5clvbk3gdqlvnomsmif2zuzeuxzhmirz6wexr4ifn2e6k@yxd5fhty3vkc>
References: <20250307015030.86282-1-jiapeng.chong@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250307015030.86282-1-jiapeng.chong@linux.alibaba.com>
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

On Fri, Mar 07, 2025 at 09:50:30AM +0800, Jiapeng Chong wrote:
> ./drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c: dpu_hw_cwb.h is included more than once.
> 
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=19239
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 1 -
>  1 file changed, 1 deletion(-)
> 

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/r/202503070155.TuUngwD3-lkp@intel.com/


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
