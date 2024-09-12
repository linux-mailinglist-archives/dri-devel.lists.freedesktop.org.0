Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81A03976D6B
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2024 17:15:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DF1E10EBCA;
	Thu, 12 Sep 2024 15:15:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="MprH+yHp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com
 [209.85.208.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 924CE10EBC3
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2024 15:15:45 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id
 38308e7fff4ca-2f75c205e4aso13467851fa.0
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2024 08:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1726154144; x=1726758944; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=TPI6G/S5031LI8BZfD5KQZOQrwoKDAX7R4Xz8VDkK7A=;
 b=MprH+yHpQzM2oFLs+EduxnrZrVTaLQI8Mg6Fx2sMRRqGy07C71KWClP6YxoRBdmZb/
 qhB88DY1AtSW07a7uf/MlNRREYclhSLAkQM+H8L78gxg567oRgW8WqMmyO4vGgbthLpT
 TaTptWEtgUSLSdVW7MpvX52B1oYdLlJYF+Eq6HLC2eY9VOSS9oluM3f5UaEZqn37cptp
 5RgPYfX/I5qYWOIOvdlW8XOhd1zvTibt2Kqa39ipwmQWCIg1pKtwr53ec2I3vHOdKdcH
 2uMv9zZaF/h4l1Uajee0HRpPZgCrFSXdeXW0KspSL2IkVcgVRV3x6t3NcArzYN7UdfoY
 iCWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726154144; x=1726758944;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TPI6G/S5031LI8BZfD5KQZOQrwoKDAX7R4Xz8VDkK7A=;
 b=EVCDcgtrfV3acs8HTUYy7ZfrZxC7t1OhSxPCd7uO5bj9uva6hAW5wqFVP17ySvBKCx
 M9t84plAKh8usk81PfXhZw6si73F7Ke7gigyum1dN4dm/mTFAQBAca/f7iX06I9wgDiW
 AkUUrkQB4A0UZXHP+lgKGjLLpJx7WHhxQSB9F8ihomaol3u065BQCT4yP7C16RJXUnIX
 9kva6c63GCc4SHOcHt1+sVzsYuEP+z88/VsbLksNBrg5z14a24dNQymhs9gt2ChqdHZm
 v2eVbxWnOTt6VUc3cg8cOU4Y76nAa7ZQZmsOXcHgsaqESmXR3JJieUv93I8wQkNryvvQ
 qpBQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVXsMxxlafPpTIUe5Fp4HcxrM49Kq7S00tZzXdJUCvxyFFc2fFCMD2fPzSjUu5jxbfS9jK4skCvljo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwnbSdlgx2h1KgIeiyyIbJqVEI90NNrETRJp8XK8MALd5vxG/lh
 xndLAjA+roF53WOa2k5uHQYWDfhNSPbq/YethrWGYZ9m3bbF0oHyWnL/ZSqXVOw=
X-Google-Smtp-Source: AGHT+IEq3+0QP1kTu16Ee8cKa/6tDbQAbGkULUNu0YLqrcV48CRN+wczhR73Rl5UaQW8a6CDxJLzNg==
X-Received: by 2002:a05:651c:b0c:b0:2f3:f193:d2d0 with SMTP id
 38308e7fff4ca-2f787f2dacfmr18360581fa.33.1726154142906; 
 Thu, 12 Sep 2024 08:15:42 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2f75c0b2138sm18952261fa.137.2024.09.12.08.15.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Sep 2024 08:15:42 -0700 (PDT)
Date: Thu, 12 Sep 2024 18:15:40 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Colin Ian King <colin.i.king@gmail.com>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] drm/msm8998: make const arrays ratio_list and
 band_list static
Message-ID: <fbgqvfhansee6zklmziht7igpebsbwt7xdfzqdq4qwkjbff2p3@cb43iqi4oxxx>
References: <20240912151037.592477-1-colin.i.king@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240912151037.592477-1-colin.i.king@gmail.com>
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

On Thu, Sep 12, 2024 at 04:10:37PM GMT, Colin Ian King wrote:
> Don't populate the const read-only arrays ratio_list and band_list on the
> stack at run time, instead make them static.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>  drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
