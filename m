Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21A2399EA17
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2024 14:42:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9299310E57B;
	Tue, 15 Oct 2024 12:42:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="nD8Vf6xT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com
 [209.85.208.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E45910E57D
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2024 12:42:43 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id
 38308e7fff4ca-2fb388e64b0so34464811fa.0
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2024 05:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1728996161; x=1729600961; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=XHzRYFNnfJVncBBpgR8dVgaov8GBCzN7kXiTdUtfWag=;
 b=nD8Vf6xTNWQUTljWJm0wIvgd7VpesTDObdthTeu83t1BFfk5aGCym7mObG/t79+3h6
 rgRRzk8+Ht+UETr5CA9+xykBVm632GAZzz7rh7vkhSZY4Tmy391JmaTermVJmhrcezEQ
 iBY246UIk6anPbND4c9JTuE+IQU7bOkQA7VPh1spXlOOhg5UlEYY70FaPWyIhAJ4OnzI
 SEhKI0FABFCubA1c8bLhka6/Axv2sz06/il3btw3FOULSw5FeA5xXE5B3icHqyJjWOr6
 y7fOfzSXrg2Qwcs2IVwuA+t1nacKDGaiTT48VrD4v3qnbcpAYlXEbIsZx8Pa+aRGyYGe
 L4Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728996161; x=1729600961;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XHzRYFNnfJVncBBpgR8dVgaov8GBCzN7kXiTdUtfWag=;
 b=JGyzuWKaz07T2xHeJ2kqGoLChxvkFeasrgHvpRbv966AJFz5iH9YSS6E1FuLFCwzyk
 95k0fbzCevhf5eNFX6Aipw0k56IaU8vGKG/09uxkCM4uOPKGyHpGiwOYG27U97K5NDPP
 jF0NFydML8BmwNrRsIWxp9bgtTWa9mmlFblp1VoAiVzaOYvTGCyckjN5e+D2pflwVCKM
 nE0t3/2CKMgF/OIZjAlRRp1UZCEYuGaUbgS62nywuNJkgUwVmASPz04pCSa7nGGugR5f
 GNVfEpnvlIM7a9awj99IiQufIjc0Wrcq+LXYWvOIx/xzDzd/yRfkyMU0kxdbuBPv9nMZ
 edkw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXM7uFDxpicYQMpn40fjweuJJy8HTh0iK6KuVlDCCYg8N1KzG9ycXCpJzymkB8TKLFc/8l6O6rR+L8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxAzQlbrT3USZbT59eChqgbT6JnmzCk+AwZvFngCjGCQ4WcaEKE
 vAlG1cnW4BFrd1qwSG6QSCwIyr6Bdfr0YzqEwdLDFi0sGELiWgtpN1TSx08MrVg=
X-Google-Smtp-Source: AGHT+IEV43mu0PNLzC2rOlLLQ1oDj5meAK/97CNJwbn6N2i56zKqE1Z4tFDL+BwSeHdxi9g6tO9F6g==
X-Received: by 2002:a2e:bea2:0:b0:2fb:4a63:92c0 with SMTP id
 38308e7fff4ca-2fb4a63cf63mr33684261fa.14.1728996161537; 
 Tue, 15 Oct 2024 05:42:41 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2fb5d135901sm1409991fa.66.2024.10.15.05.42.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Oct 2024 05:42:40 -0700 (PDT)
Date: Tue, 15 Oct 2024 15:42:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, quic_abhinavk@quicinc.com,
 Rob Clark <robdclark@chromium.org>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/msm/dpu: don't always activate merge_3d block
Message-ID: <mfmupuz3nksvkujqu55xo6bpa2wkzzlfz4frdayspgkdkmeedr@mjh2yq7qs33y>
References: <20241011-merge3d-fix-v2-1-2082470f573c@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241011-merge3d-fix-v2-1-2082470f573c@quicinc.com>
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

On Fri, Oct 11, 2024 at 10:25:13AM -0700, Jessica Zhang wrote:
> Only enable the merge_3d block for the video phys encoder when the 3d
> blend mode is not *_NONE since there is no need to activate the merge_3d
> block for cases where merge_3d is not needed.
> 
> Fixes: 3e79527a33a8 ("drm/msm/dpu: enable merge_3d support on sm8150/sm8250")
> Suggested-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
> Changes in v2:
> - Added more detailed commit message
> - Link to v1: https://lore.kernel.org/r/20241009-merge3d-fix-v1-1-0d0b6f5c244e@quicinc.com
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
