Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6916BA069C4
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2025 01:07:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EC0B10E246;
	Thu,  9 Jan 2025 00:07:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="T/6TZzCC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B7F410E246
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jan 2025 00:07:26 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-53ffaaeeb76so406162e87.0
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jan 2025 16:07:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736381184; x=1736985984; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=bpDkH3lxJ4g2GFbV3coZXIbv+IWPbixM4fhCIhYbzhU=;
 b=T/6TZzCCA3/G9x3UrNA4l+QMBjZyV8pSN3ZXO+su5KJ7OpuhIXoAN07IbyTA1wqw+b
 1wVgDzkQEHxe2PnDQlB3icm+g5ZX45Pcg7IxEj0i0XQdw0Np2Udion5On6f3tuDCHBtu
 /mhYLE37TXbBs8pAtbGxsjiU+5utJ6eXDMQVYLZnSTbiXM/40xN/bPNKOf5PmrxWpXLu
 SnyePUGHLFbyEndmtPYwFEzTlgJoHUTNv2mz20f3AxGBAuPnerDxJwSoLreYw3+nvntM
 opEHnf9ioG5WT6ROdLsod4EDhdnIQZKaztFWOnFxlFMpgzKYXx9ZGqSDOhFQcRmrCgbK
 2R9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736381184; x=1736985984;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bpDkH3lxJ4g2GFbV3coZXIbv+IWPbixM4fhCIhYbzhU=;
 b=g2DZArus9x9UmNeZQoVjzShg8/YQHVSiBJLBRZ/+f9lK4ey7q+VB9uycu9COM28Ucd
 90o0QuYJn2/4ruOV1xME5jsCPwBRWj3eUy+cFmyNv9hM5Oe2FzrVqm5CKJ0hJwRMlHiy
 kf/+4nqkeQ2ekVp5SpJgYR71VBDpz80Pw1PxCpZZKSknkVLAD1baaWohkqWYdL0Yqb7y
 I7OVnbom1rYqHBm9e2lIz0AtEXDj2olZh8dv1vJD80sGQZG+Ole/EfeuACIajtQK8ILx
 nAgd5PSgLk5G8efF4ORk4VFAHpfj1n/2SQQ2vq+I3EeBBjG/5EYfZpyKIQrZSNSdQMst
 ijWw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVikSxT26VuOngoFL7Az9aqaTCxD0YI84bWN8S5Z7WxJbyHsmgkx/HTuSwLOrcnV4p5WohTtyrwgJg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyG56QkwgT7iBQvrvuPTy6oMjH7DMykFDYbYEmg+U03ARgTkA9i
 xUjWttgzCQ6xCsibqqfnAAmE0mkPeSG/BmoZ5PWgd7EmQiF00IkEjZzDs6mjNbI=
X-Gm-Gg: ASbGnctbc+i7RjZK8CW939844olTqHXwybdyj7LF8d8O2I06ZFt0uQa1d13oCUh5pLf
 6sRb7/yJS9TdhlOhEtzMGdtECo2JyGoc4AXrICpJ5CbmL4LzdQ1IBWHoEJ9FIPW7evvuDNaVgvy
 RsN4spd7ZpdPyMQ5Q8fHZSPkUr9TZk8MluBVYheANxNiWCA1DMBZ1QWlIRO5YcW5ED5hINjlojP
 v3JFvgnwVj0cbQTGwVvdTaZo07CX5m2dzHmLNTlE2dja4vPEbhF9jMtNY8t9ZwYgc8xmS0wb4iY
 H+74z1gBefl4vVqjFZUseCZ9w2dm12R54gOz
X-Google-Smtp-Source: AGHT+IF/y9uUzQydethAVpmH3oNgkVrcF2saaYHkqvOZukLpQEeojH3C6FDQnmUp2JA4G+6GtEX36w==
X-Received: by 2002:a05:6512:3ba3:b0:53e:2f9d:6a73 with SMTP id
 2adb3069b0e04-542844a8f6amr1336553e87.0.1736381184452; 
 Wed, 08 Jan 2025 16:06:24 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5428beaaaa0sm29573e87.175.2025.01.08.16.06.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2025 16:06:23 -0800 (PST)
Date: Thu, 9 Jan 2025 02:06:20 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, quic_abhinavk@quicinc.com,
 linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] drm/msm/dpu: Drop extraneous return in
 dpu_crtc_reassign_planes()
Message-ID: <5m2t3srguv7vha4e7np2tmd6tm4ajlk2dzc2vruut6krern7vx@ylmjghtj2kbu>
References: <20250108-virtual-planes-fixes-v1-0-420cb36df94a@quicinc.com>
 <20250108-virtual-planes-fixes-v1-2-420cb36df94a@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250108-virtual-planes-fixes-v1-2-420cb36df94a@quicinc.com>
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

On Wed, Jan 08, 2025 at 02:40:48PM -0800, Jessica Zhang wrote:
> Drop extra return at the end of dpu_crtc_reassign_planes()
> 
> Fixes: 774bcfb73176 ("drm/msm/dpu: add support for virtual planes")
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 2 --
>  1 file changed, 2 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
