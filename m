Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A953A32418
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2025 11:58:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7613C89F41;
	Wed, 12 Feb 2025 10:58:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="N2p/a31+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7638789F41
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2025 10:58:17 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-5439a6179a7so702349e87.1
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2025 02:58:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739357896; x=1739962696; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=tFCRTI+uxekbKaB7VjoVJZp4kloQ9ULA619mLaD9fcs=;
 b=N2p/a31+/jAXo//0tcN2akcWyG7dqPkVBeDZt/hIfeXvRi1Ui4Q6VXIOKI8XtYpqYb
 BYzasXAyX0iEEON9NdrCersh+H1uG4tBj/HoIlWC+PdUzJaQIrhOmSA6VGCMJCkVQZDq
 hDD5C1iMj8MQQmsDYZjpzkrdyOxQENDSqXFxaFW+LUzKK7iMGhwiPdxH9scoEUu+PTXP
 tpnh7YAjLDPKSabcSvSC931pu3DgJK6croonwW61ns5iuKib7y2M7jCE9XiEoMhiyWz1
 xTsTiI4tM2GLBtpvrdCbvd0FQSBh1WwA3lLzJsfm6Idq1uwDw7rj909FFtH75V+fpzBK
 /RiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739357896; x=1739962696;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tFCRTI+uxekbKaB7VjoVJZp4kloQ9ULA619mLaD9fcs=;
 b=r5sJbWfTPD6VVQYHTK27BymYq2nPIdGqwQbjrLpZPtA4EmWtOwgw9gppZurxadXe/K
 DUfVzWSNK4hLmhv8GQIw/HpnUlIKoxmSQMUFRGtgzR/Hkf1WAMK3mEefzbRTo9mJgHXu
 oKWaqEOtL+HIrvs0TGLhLGvNDj3UdMXjnoiYQW/MTcV4zYuRA7ZnBaF350CRVVrxKbHg
 O2qDEzWonFP6RuRR9Lri8/ft2kq/xK9XI8n9PYnj5nR7gh+vwKATdu7zoIpl0ALzDLeQ
 CKvkjPobtDP26pFGbZXnl68QevhVm83MFl+BQyKwA/pdiVmBurFy8/W1OKYi/6BoXLWY
 tKIQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUNxBCNLAmqMvIndwOkzN0zw3E90e1tqxxM4UxXR+kxnNAzYcIyaWIulRdpJpH/o9gbTnWxicjKu40=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx3CBwdw3a/glQybxTXP6Fsb2mWJrk6ra2O5SjNlZOaLXv9o69M
 hG9OJ3EfFJegDnduEkJABnEHv6zahKT2qppECAOVkI17VewnBIgUgJDXzyGWaW4=
X-Gm-Gg: ASbGncu9wE101LWm2rorbNPl1etHj46eDrne9Ddnzp0W+IWZafnNm1tMKqX99JjssWb
 DZ+ujIOYMuVzRm4Gi8kcEStsvQQK48PPylnUgYfLou7AtjpsOM9TMrOWfGyCdPsZwmlE/gM/tDP
 zmBBz+XwUogpgKHbzSQXtwfm4jhpC76lRi8PC+fV4Aqs60QEzsQBBEeNr889PzPO0Z66zLJm1Dv
 zaEIbt8hXA0ogU3x8MM1ppRGESp9Gygw4ZxrYDYKHfk5gBbMY3jGyvDdGn4ATW1UUqzZJUXrgyi
 e+C6BcDmiHe4566Cnj52lgJ3pkrLXlzZoWRGbMlR8NhdeenWptn+TcxehsgQFZk9Ol8kdt8=
X-Google-Smtp-Source: AGHT+IGUpJ0IHuG1bctt41bVvHPQ/W3w8vStlenWEjKpIntH94rgVWmcXj9gpbKua89+PLGTI1w42A==
X-Received: by 2002:a05:6512:b08:b0:545:240:55ba with SMTP id
 2adb3069b0e04-5451809a3bamr822239e87.26.1739357895751; 
 Wed, 12 Feb 2025 02:58:15 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5450cfff106sm894926e87.99.2025.02.12.02.58.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Feb 2025 02:58:15 -0800 (PST)
Date: Wed, 12 Feb 2025 12:58:13 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, quic_abhinavk@quicinc.com,
 linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dpu: Disable dither in phys encoder cleanup
Message-ID: <hb42tamaguzgoxbsqxqyvhwvsegcbqxwtcmdwlnrx4hqcityfj@dqa2seg5bt2a>
References: <20250211-dither-disable-v1-1-ac2cb455f6b9@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250211-dither-disable-v1-1-ac2cb455f6b9@quicinc.com>
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

On Tue, Feb 11, 2025 at 07:59:19PM -0800, Jessica Zhang wrote:
> Disable pingpong dither in dpu_encoder_helper_phys_cleanup().
> 
> This avoids the issue where an encoder unknowingly uses dither after
> reserving a pingpong block that was previously bound to an encoder that
> had enabled dither.
> 
> Reported-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Closes: https://lore.kernel.org/all/jr7zbj5w7iq4apg3gofuvcwf4r2swzqjk7sshwcdjll4mn6ctt@l2n3qfpujg3q/
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
> This was tested on SC7180 Trogdor by pulling in the concurrent writeback
> series [1] and running the IGT kms_writeback@writeback_check_output
> subtest.
> 
> [1] https://patchwork.freedesktop.org/series/144083/
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 3 +++
>  1 file changed, 3 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
