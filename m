Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66CC6A576A9
	for <lists+dri-devel@lfdr.de>; Sat,  8 Mar 2025 01:15:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7986F10E176;
	Sat,  8 Mar 2025 00:15:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="NC5nAAyE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA2D010E1D6
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Mar 2025 00:14:59 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-549946c5346so1063220e87.2
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Mar 2025 16:14:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741392898; x=1741997698; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=OI+9sOurb7xWpdPzZDCFl9IV8OhNe2U1hJtvoJa6TD4=;
 b=NC5nAAyE7BYFPGDfoC2uPOJGZwPlwdOyWLGbSNqRyA8Jaltqa8xHLzdjJhmK6+4tnA
 iYqpg/j2URPgaSMDhNLEnJUK9SI1jTriBMYARcfmObFQFZnkkKShGb4NjZ8jmwui8mS0
 Mm7k8Iq44hFT2RYCJJKZV98lfsl1gBzWGyFVKfYa8IcW6ZnKoUwp4dlx94fSMwlgHZey
 OeOKxq4+QtvnmxZm0uZVO6yhP6LcJrrQz3e7smchMntuH2bmLtOP//OqImul6MJbmYSq
 31IeghCZ1rdJEBmhDsCiyounADRdgPWaJEokbqTLNT8wu66nGIt9Dbo7YFGe4R2uSJHW
 kuOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741392898; x=1741997698;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OI+9sOurb7xWpdPzZDCFl9IV8OhNe2U1hJtvoJa6TD4=;
 b=RNebxjsFFffdfSygIbukcT3Idcc/SOhHTIpdUXXx/TJuuptQAqGyBWdotYnNvrJowG
 inb5OTpBYNhjrXn5NbncY7g2CY7OyYaDe0Ua323vFZ4MnF2wdeFDkwjoSbaDWV+Y16Zb
 EYytAN8sP/UJRpigX/+yHNmiyEhaVSw1Hv+XAeSUkg3G79k8ZgKKJdRnRbedlEQufbir
 cHn78C+l+ccdSFoPw17aa7zEz3zpPZrKNhNVmkouw1hIinaUSQIS6b3MaeRvnPG8jpwR
 q6BbXXgv8TcvUQJMnFL1MkYlx2102FZPLmII+jA7/xVUPTdH4YoSPTYGl6SHyCjzHRfU
 XHgA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV75/rEfzkTXMU7TYAmlFwr1VzKPVdHNyVYjNDmQXg5MJsiVvdMjCtETe0xC3ER128S8EbiCn6x4UQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyxHJIZBynmcwpPTD3TqfPVEhegwDfK3SUr8jkbvvvakBErAQuc
 sryML+UAOgENHstvAsLZW7o+byMGmhu9IncFqrvxJg5CsQWf/SBAul9r9B1LAIE=
X-Gm-Gg: ASbGnctNNGkzcO2jAaJgfEjehz786fncX2JyGH8rD0I9UaC/xzwfWeegvpErkn+AJ67
 f3aK8gULSfcOk6AGZYQgMSdYJiOYdOi6tqIFW8WDs6EwIigTSy1uutBPF1iOIjAh2n0dPGPD/yx
 CU33HaXEyYpziRnxMbYYdIL+MeCJtnboC3llhpzcLRny7UVRPWLGXAq/yI61EL7WT2uptYRpFO8
 UIgR8amQIV05R6osf88ZDBT9bCMTdUiHZtol2XEyuWXt9mWIvhLtIWJgLymahvtjZh4BWQbIsax
 9hqWvy+0BjqvKEw4X3Jho6y+BGIbTHYZ7BrX8XT0oAvotFBKfeklE8iAWIDxehNCRPLD0VXH68a
 XtKLecE8A7Z1L/tKs13OQ8Ktr
X-Google-Smtp-Source: AGHT+IFbuhinx1qF4on+W3zSP7LNgSQf0IHtNKaQVFWJQ8VobeRY0aVJ73nWM+CnKCUkmpRbt4NgHA==
X-Received: by 2002:a05:6512:118a:b0:549:5b54:2c77 with SMTP id
 2adb3069b0e04-54990eaa9e3mr1876943e87.32.1741392897791; 
 Fri, 07 Mar 2025 16:14:57 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5498b0bd5b5sm651008e87.158.2025.03.07.16.14.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Mar 2025 16:14:56 -0800 (PST)
Date: Sat, 8 Mar 2025 02:14:54 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] drm/msm/dpu: Fix uninitialized variable in
 dpu_crtc_kickoff_clone_mode()
Message-ID: <vvg6cvpjtcekulvjrovxhjpsd2loh7ath4eu3nya2dffoabgvw@mtcmctbmpble>
References: <f8ba03dc-0f90-4781-8d54-c16b3251ecb1@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f8ba03dc-0f90-4781-8d54-c16b3251ecb1@stanley.mountain>
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

On Fri, Mar 07, 2025 at 12:29:39PM +0300, Dan Carpenter wrote:
> After the loop there is a check for whether "wb_encoder" has been set
> to non-NULL, however it was never set to NULL.  Initialize it to NULL.
> 
> Fixes: ad06972d5365 ("drm/msm/dpu: Reorder encoder kickoff for CWB")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
