Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 398C99DB8AE
	for <lists+dri-devel@lfdr.de>; Thu, 28 Nov 2024 14:30:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F77B10E26F;
	Thu, 28 Nov 2024 13:30:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="LfZh7tK4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 774D110E26D
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Nov 2024 13:30:16 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-53de880c77eso966041e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Nov 2024 05:30:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732800614; x=1733405414; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=yCjaLIoqKd3bBOokmeosaZwBTg8Xdv4t4ZzkEjKsEdE=;
 b=LfZh7tK4aqIOojmhtZd++ImVWw1VQ81zEIdKl5zDZkcl6NYJemDjtSTwtDwAh7JK1B
 1dz8QIntbNYmu1f/sA8KXmGqsT9mhiplEAKHDelecRnRtMQ8ST+Qcf0AfYGt3UuB1q6h
 rMpRE02r3SlGEYjP0jlMHqb/leyjhl9AQeA3rUlelp61hqEZiL/rbVUjnQGgQXFoBgUw
 nMmj56qjvmI/hwikbB/gwaws1bnzu841TJWMkaxpWwIWkkhOw5W3W7J2l8OLFkBdEUO1
 W6Qh1yEDmigu+cPT0N0TGP6EU6PAvBYc5JifZXZgF1cF9MTvrtBeSYyHGVskWF2E/YHP
 qYhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732800614; x=1733405414;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yCjaLIoqKd3bBOokmeosaZwBTg8Xdv4t4ZzkEjKsEdE=;
 b=qQAnAU2pns+pBILX3AFzJcteyLeZ9C/2Ww8D56Rq7KE4SNTZiMxkDUMuQOI3fGDNtT
 yOhtZU0e2uZBjVpG22e2wBgmzZ3MoIjblt2j9kILTbafcqz2WFXbXT/Qey7uDg1CtFkg
 Nkqdx6pX1HjeetsOGCtABpO631KjYAqMMpHTzb5b9AOiJBGcL3Wh95EoXfo4V+jT/ugA
 5XHnlOe2dtruyBY2EZHRQnvWUoK3xzqi8cV6aydJFt7P9u4lIhoFyzSduq10vnsuumkm
 /HZh8DzU3qMXCqHzKMDBgevlduEPdtpddhN251yqyFwPq6h3J6wK4hj+V+dMRPpTd40z
 3zgw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX8849C9qM3x+Skig5vHIVnOqqWuWAm/MgRwk2C84Mb6fWmw5uHFx+FYq3repb0OciinEzP4yyZkjw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxGtBvLSVhfUsFfq1hKMGySOfMnmVRIdOAiSe9brIXDMHN2ZYFn
 2k56NeHaCKjkYLDhEFEU9g1TwRLKzSk1wV7Ho+bTk/138E3h2ufUcIxGdUOUF1E=
X-Gm-Gg: ASbGncu/6QesvCTjJrnn6OJ7jJuVsAZCbMZ39oV7S7KJ6dX7M9YWxDjxCKoebVsR/L9
 nYGYsG72BQ00tZLYuvWDqJ7w62/EDQTUchC9LMTr+smlypCNAC6xxkVhcAreg19+Aam9HHRCBn9
 ZlC32IcY7D1DOTOIpTmWSGoA8BcD4D2jo+KYEU0Ks4hH0+jxd1Dmh5zkBVZCsYN/9YEE7axHNfm
 RdHrPkxR0sl8IFQGHiKAqlTBRqe0f+KTqltCqzHtpmUnVw3Oh5MDIiXps3OnTiWlv4zC97ME4Z3
 TOOSJWcxcqFY68N4E2FDgAhAAlblFA==
X-Google-Smtp-Source: AGHT+IExPmce5P4ZT632z2IC0da+T/+lWJvFnMY6sShZcO7cz0kH9x97oQAlFQTrdXw86Rylra8OBQ==
X-Received: by 2002:a05:6512:238a:b0:53d:cb7e:2251 with SMTP id
 2adb3069b0e04-53df010471fmr3419369e87.36.1732800614564; 
 Thu, 28 Nov 2024 05:30:14 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53df64310d2sm178615e87.48.2024.11.28.05.30.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Nov 2024 05:30:13 -0800 (PST)
Date: Thu, 28 Nov 2024 15:30:10 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Bjorn Andersson <andersson@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Akhil P Oommen <quic_akhilpo@quicinc.com>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 5/7] drm/msm: adreno: enable GMU bandwidth for A740
 and A750
Message-ID: <lseuso7qmbgtt36jrpzipip2e5m6r4wbi4ixxss5mi6ssi3thx@dzt5tlsjbyu7>
References: <20241128-topic-sm8x50-gpu-bw-vote-v3-0-81d60c10fb73@linaro.org>
 <20241128-topic-sm8x50-gpu-bw-vote-v3-5-81d60c10fb73@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241128-topic-sm8x50-gpu-bw-vote-v3-5-81d60c10fb73@linaro.org>
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

On Thu, Nov 28, 2024 at 11:25:45AM +0100, Neil Armstrong wrote:
> Now all the DDR bandwidth voting via the GPU Management Unit (GMU)
> is in place, declare the Bus Control Modules (BCMs) and the
> corresponding parameters in the GPU info struct and add the
> GMU_BW_VOTE feature bit to enable it.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
