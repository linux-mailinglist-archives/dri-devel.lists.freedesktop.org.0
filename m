Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E53229667FA
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2024 19:30:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C39410EAB2;
	Fri, 30 Aug 2024 17:30:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="b1WaNEyt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
 [209.85.208.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4B7110EAB2
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Aug 2024 17:30:28 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id
 38308e7fff4ca-2f50f1d864fso23556701fa.1
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Aug 2024 10:30:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725039027; x=1725643827; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=K7kv16siDwfK3cNtrOwlV7JlLqmUs6I0SGZ377RNGlI=;
 b=b1WaNEytLSb93zrgp5kNGCoVlN6+CfRxVHFDzHQL+/PGrex8/npkqXtpRkDsfAM03U
 spe0oj1t1VumMdoSxKCbrkE7RQRDfztMjbcz5YOANpo7TSKDW3IueFDvxTOGsDCQFXpg
 xwKvQzO3h1O2AY76G+tTPg/mT5lNSW9dWRywzPm5Cc9wJFIzx2hrORtshQAHx9WzCyu3
 U7iN4G9H+PEV4+h9X6coN5aV6uyZ6wQ+xG6IoU+aqOJ9Z1ytkV0dm4zt3xYrzOCOD1U9
 9AKnY+AyJCchvVz8hGflQdYEJe9zFdSLfe6bGj9fWAVqJYeRwqxW9mbZQPgARpLKtnTp
 fySg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725039027; x=1725643827;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=K7kv16siDwfK3cNtrOwlV7JlLqmUs6I0SGZ377RNGlI=;
 b=fXHFxvsWM4ZlhfMsxmi3xWmXQHv2O5PouMYOkFTXx6ZFr6qaoV7uYM4L7b3a2txbuG
 2lqmHSl6y2ZzEXHtn7aRHkO1Y5p8Wb8AM4jEqGpqEh982KxNCwCvTXVg3sWu+2nlTR4F
 DoEhMbgVqaoGGNQSVvppBD82pQDNgyjB0LcJ4lF8fdoTpyw8tTB2HjkERbextOKWx5Re
 Zzh+BCygHvnPNdlru5KZPlgqSzEbTfgh0i04Dnpfwq0qOvJZUaUyngdFwdElGQu4Tddl
 VrmVVoPFc5lqCSjDbHRzSxiIZLnjok4SwkkuaT6p44ORFQ+Zupac4gOorHJe4ypbEN1h
 /cuQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUUEveT5FJw+Z0/9NB2+aawmZc8cK+VGcwKRJ7qGIlSCH5ZMZjNJTwjILYaC2onI/26Ss017FMSOD4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzDWGQK3syE2ajvpnoMuUSsK4djs8RvCMGIC2garKqsCezyWmEm
 wEcpI8S+vM74SuuaFZnhsif+th5lbLo7BtseDXCtgVMcne47W/154SDOwSI20/A=
X-Google-Smtp-Source: AGHT+IED4Psr1BL432CC60H3RvrsjHLW0W4GmeFM8QN3szVFGBfiw71vi/Kp/pEwJCAsMWry57rj4A==
X-Received: by 2002:a2e:4a01:0:b0:2f3:ee44:c6de with SMTP id
 38308e7fff4ca-2f6103f6589mr41983431fa.27.1725039026198; 
 Fri, 30 Aug 2024 10:30:26 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2f614eff4a9sm7634651fa.31.2024.08.30.10.30.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Aug 2024 10:30:25 -0700 (PDT)
Date: Fri, 30 Aug 2024 20:30:24 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, quic_abhinavk@quicinc.com, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, quic_ebharadw@quicinc.com,
 linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Clark <robdclark@chromium.org>
Subject: Re: [PATCH 17/21] drm/msm/dpu: Adjust writeback phys encoder setup
 for CWB
Message-ID: <v24nclowcrwmomhh6rszv4qbz4ydjf55f5llaoltzoh32wf7u6@dpxcmoz7rumr>
References: <20240829-concurrent-wb-v1-0-502b16ae2ebb@quicinc.com>
 <20240829-concurrent-wb-v1-17-502b16ae2ebb@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240829-concurrent-wb-v1-17-502b16ae2ebb@quicinc.com>
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

On Thu, Aug 29, 2024 at 01:48:38PM GMT, Jessica Zhang wrote:
> Adjust QoS remapper, OT limit, and CDP parameters to account for
> concurrent writeback
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
