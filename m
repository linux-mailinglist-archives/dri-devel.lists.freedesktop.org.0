Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A237A5430D
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 07:48:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA67710E901;
	Thu,  6 Mar 2025 06:48:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="jjqS4fwT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BA9F10E903
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Mar 2025 06:48:25 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-54954fa61c8so378759e87.1
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Mar 2025 22:48:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741243703; x=1741848503; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=g1tgevcrO1W0sGqnA4Y17aruM3TaIseJYV5OzYAAywA=;
 b=jjqS4fwTSX2USyTYdBWxxqI4wsoVVBLeC/bbyh//YM4orWlgKQq6iU2d0CUNLJHvUF
 ncTg3oX0s8UYp6iGGBIA1ywQce+9q6ISpDfRlmAeHhvqiRJF8iqc+VFmto4E3uMepZBP
 vb4YGawLLo4nOI8Fsi74Uxlcme1t5mBC3Ofnf5mVXO28H8cxRV1gk2/gTp0AcDyoEjZm
 sRFlbWZdtof1HsRwnxYzH/V1qXdtaX3bAlOys8nAMeBhOUzkV7BDChemrBj3hihT/leW
 M/kxPJc49Ie9oNxnIam0PNj0K/qKi/o3ft3S23Kod4Kum7B+K6bY5sb8SmsFlkkTJJms
 9+/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741243703; x=1741848503;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=g1tgevcrO1W0sGqnA4Y17aruM3TaIseJYV5OzYAAywA=;
 b=Gl0Sdv5pq9jcbxZ4Q9Z3AzkrDxruA3YYuVoGamAKNjPqWGt5OckbJrU+04UnDudH5F
 rf0tXCgq+mbvonC2nrE5F1bzqI+3nsHtSizX9WfScoduhehU4mwE0UeNE697ezfjTiDZ
 NCTbJbXL27W2pCm0UCsMtuxs/LvvsAlgury6G7UEDhorTdLfH/ycPTfmO21AaOkpRh4u
 TzOUGzlUaR8tEzS8B66Vdbb8GinOAgBM/gGivtj22AaRhP/OLeRn9tLH8sIgHBeokm0p
 mrClwiroD89yTHBPM1Xn1ZEmL9oteC/UMH54shbmHWmJn4aJhDhlH01olLjtpoIo7Fpo
 dbWg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVlPVG8qHF15p72dEZMCzYgdIOBVCWLA7/JmeUwGqzMmC1WaLJeVxQqdKkhmwoHANtXesy7d+4esyg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzljkCpXVmfwwftD6UsnHLZbBnFURH/auHso2KtSSEeDtmTBFB2
 Tldve5tzV1forL3XfmhTNDpKjFYqDuaxOqkvLIue4wLW3weKsmi7JNFOYe/ktxI=
X-Gm-Gg: ASbGncuyTyiadQjDfxgiF/JeKalokaUOLnvgsEPsV1nBRamN01qVNjXbdbumO0IkFMs
 oYbG6sbTY1yPGGWOZfbcNY20nFPeQq6yBWz/ufPbGc9TFzQrEkYJgmEVb03h9GjdSXajOrVbDKM
 0+cL5woCxIF122mPIdD0sh+rdOelpWWMqHFwvWNwO8T5KOXLFyFbJDlJ3oNDdQe5jWTdKv6w5F6
 S4Z+amlksZanuG0tZHMM+4NtTclX3VyAvBiHr1RrRRBbbxipyVeDhf9vSC4QU4a4gnAONias36V
 +z9U5yQT+gmEzuxatUtepxlfYFAEnPhp7f/QDnaD55HrAJ0z77e8CFOxjln2YYsJ0MQ719+yCG2
 fa/FVlyUlU9xc0cud44Qtb70e
X-Google-Smtp-Source: AGHT+IH0hkV0iX6P252sfEzSP5tCD+8r0VAB5ZE45IACRvNYvn/oK9vSvfMyEF7y7x1OJNcNv0ajeQ==
X-Received: by 2002:a05:6512:234f:b0:545:2550:7d67 with SMTP id
 2adb3069b0e04-5497d376d53mr2072687e87.36.1741243703464; 
 Wed, 05 Mar 2025 22:48:23 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5498ae46137sm84341e87.9.2025.03.05.22.48.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Mar 2025 22:48:22 -0800 (PST)
Date: Thu, 6 Mar 2025 08:48:19 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dpu: Clear perf params before calculating bw
Message-ID: <mzkarsq7qljikfe3ef3hhasouee6hjmf4goqxmgbh2l4nsap7g@tachus6mob2y>
References: <20250305-perf-calc-fix-v1-1-d57f356caf59@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250305-perf-calc-fix-v1-1-d57f356caf59@quicinc.com>
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

On Wed, Mar 05, 2025 at 07:46:44PM -0800, Jessica Zhang wrote:
> To prevent incorrect BW calculation, zero out dpu_core_perf_params
> before it is passed into dpu_core_perf_aggregate().
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
