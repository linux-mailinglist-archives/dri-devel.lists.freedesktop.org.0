Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 515EDA2E309
	for <lists+dri-devel@lfdr.de>; Mon, 10 Feb 2025 05:16:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FD2410E154;
	Mon, 10 Feb 2025 04:15:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="oQfztohP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 260DE10E154
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2025 04:15:56 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-30762598511so39190191fa.0
 for <dri-devel@lists.freedesktop.org>; Sun, 09 Feb 2025 20:15:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739160954; x=1739765754; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=QwzLE0GCgihiIk+dFJwQ0ALU3Kl1sVby5kLip594Ikg=;
 b=oQfztohPcjQqcLL5Ht8t0OIeDDyM9LYSd9eEffTwkhP1hEfSQsfn6OShXEtZmihdHB
 8auB/XetwMBydW1kbsD6+NKsFv5ym7dvi+K0rvbNVn1c+t7/B5UIVvlvD6NTIQBV9w33
 0IAR+4f3Ahsg/RcUbxN8lZB+uOMO7onSd4cAozVwmutMnZDfOjOCeAlD8Y2NYRk/UcuU
 S7//x+aRuLmmnVbLZaWu08GwxJ2hW7t6pBuE7fig+1ujrwYLIu53hIvyRfIuPPelTRss
 cY4kcoqL0AiK1GluY/eQVDCoPus37hubPz4NHv5b5KVsonc1z0gWnKujn1UO3GHdaf75
 6dZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739160954; x=1739765754;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QwzLE0GCgihiIk+dFJwQ0ALU3Kl1sVby5kLip594Ikg=;
 b=HaAXJx7LMgm1D74Gd4RHijuRWdsttGO47GPHlxZurPsDAgfpXYtOO7W24R7S9ezr/z
 IuYm1Ta0gHLTlQRIOGcFugdGgWCL7KKcpovkCwhPVRjRuDv2ZR9GW/7pz2A0WrrV9elh
 9+fqPUpgvQYSD5oZyyO2lc6fZQeM5MQwBwssXslLBnCvaKWij4hIdl9nDsI53slzv26s
 B4qLP+KOpPgEKUshLSzBjUg2CsyUDdS6JTMIDcKG6FTD7+Ca5XlopJJghX/g/68n0oWD
 Yc7zwo8Q/hBGwm0ltNgjDMi90EQ6oS2gsOWFv3gwAKGn/JCGXopW67ahe29W+4hhdOHO
 R/uw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVMYwpoQ3aBxqsLu1MAP6sODzf+PyM8p09jvh3rh2fNxsvWHmB110W1NocXSVoUaubKAw2tKPcAto8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwFKVDddrB1UEmsw1WJ1u+YgFHMYe8jc1IE6wA3qEG2hlkQOOCS
 d83OvqPLTWI6NWHn8zg9/D2eTOX2SeFLzMETJUIYW1ADHoHdGAKBV909IPrkm3k=
X-Gm-Gg: ASbGncsXd9bqcua500KSWAvJJoN4LDXHRljs+O4LtS2YuT4O1plCb2mEDRWTRo2PT3X
 YcY2pL74p9JEqKrFPpDdy9KgbR7jLvJbAFSF346aoQDG5vPlQ7VO88q9euBSR7Ex+7PRHWS9EPE
 vDPFILbTrfv0moVQ2WXfJxILr+Xc3JJ4z1mdBjokuFZZHClv9C2LKJwZrliXZSv7pu2w+sQhpdD
 7LdLMBpKv7L7pUZFSXagqhkhWAaV2c/EtQ6HyT1ROiUyzK+g4qyoGZXJb0dyPrGdXXHKzzjMs3t
 KC3Cw4zYBN40mGB5as3bx8S8vDxZMUvOL1Y6dzYbCfqCbwpgXQTjdtjatBWsdPBceCWIk/4=
X-Google-Smtp-Source: AGHT+IF5U6ArPZ8cE6ddrQjBGFIlwz3f3qJFMYvqashpqs6GvurvVMofzsRTGb31NHrx7zoqyP9jzQ==
X-Received: by 2002:a2e:3502:0:b0:308:e54d:6195 with SMTP id
 38308e7fff4ca-308e54d63b4mr13706111fa.24.1739160954311; 
 Sun, 09 Feb 2025 20:15:54 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-307de190915sm11354891fa.40.2025.02.09.20.15.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Feb 2025 20:15:53 -0800 (PST)
Date: Mon, 10 Feb 2025 06:15:51 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Ethan Carter Edwards <ethan@ethancedwards.com>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2] drm/msm/dpu: Fix uninitialized variable
Message-ID: <koye2ppygjsns56xxpdirz5s64kblqjhw264rmfqzlxsx5mzwo@u5t7m2vktfag>
References: <20250209-dpu-v2-1-114dfd4ebefd@ethancedwards.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250209-dpu-v2-1-114dfd4ebefd@ethancedwards.com>
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

On Sun, Feb 09, 2025 at 10:51:54PM -0500, Ethan Carter Edwards wrote:
> There is a possibility for an uninitialized *ret* variable to be
> returned in some code paths.
> 
> Fix this by initializing *ret* to 0.
> 
> Addresses-Coverity-ID: 1642546 ("Uninitialized scalar variable")
> Fixes: 774bcfb731765d ("drm/msm/dpu: add support for virtual planes")
> Signed-off-by: Ethan Carter Edwards <ethan@ethancedwards.com>
> ---
> Changes in v2:
> - Return explicit 0 when no error occurs
> - Add hardening mailing lists
> - Link to v1: https://lore.kernel.org/r/20250209-dpu-v1-1-0db666884f70@ethancedwards.com
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
