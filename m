Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F4EB9F87D8
	for <lists+dri-devel@lfdr.de>; Thu, 19 Dec 2024 23:28:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DECA10EE03;
	Thu, 19 Dec 2024 22:28:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Gr0GAhjO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B346010EE03
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2024 22:28:20 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2ffd6b7d77aso15539901fa.0
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2024 14:28:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734647299; x=1735252099; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=qq6TLQjKymtoXQuAu5gsaufR4Ph+rQRffBYS4657Z1s=;
 b=Gr0GAhjOWPOG3+jNgthfWWJZ2HsJceJjoC3D0YLhIh6P55kQkki2flL5xUTj3AdM8m
 97JS1Xu0rv+UYOPGL9he2pXWnfTuKmNVsZDGfzHbqML5Luhxj2G+Y9AmH9aB9BZsuifn
 RwnZRRajqDVz6TKYCrOzoYkAvc+J0OItOA9m51aUUttxf2RpA+8Iy928cpeh0w0h75kv
 myt3Oy/doLg61B2ikHfEn/xRXs8S6FY4Y8g9zZDxXtPV4iGJuYrHqLnyNULNDiZuTb9f
 1hVO3Piob4pKpC6qEI8B4QFl5SFn5A0wk5OdS7ovs2H0aC+KIBZpS2aDMobrkQZM1s5O
 liCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734647299; x=1735252099;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qq6TLQjKymtoXQuAu5gsaufR4Ph+rQRffBYS4657Z1s=;
 b=nDMTJ9E7VUpAOCOPDWU3aenvPEJywhYcRCfdoOE1w1PcHP1DtNL+C7Nq/RlbH5sS7K
 sUfn+QBnqieBw8DT3bcuZ1kxTbKpyjmpumkgRRjMLRzd/vQTHQN8z1USqm2ZsdUA8MLJ
 SnWi14+MpQAKkGPOaEa+DBUvKAdnX3w48CFwbcsgxPfYvBWdQu/GO9avOMi7OAPaw6C4
 7Lpr0E1uyESHSRHhY/sE4sV9BSvNio7PyVOgM5BFV4MIFwLeZ09w/KTHop7R/ZvpGXRE
 JfO3GK3bNvTciyGx6YzVVHoq0gRQtnkqY890t9jKb/WMpd7N+ZmYipAl0RHekhIRsLzJ
 Nkzw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWF4RdiQRvWE4T+7+2IAVJ4uLsCUHDocUOfIgGY7qessYRAo4uVpzvNkLg5iS0I0MKNY2AeXVKyVvQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyokAt1zrStWOP1RPVJ8fNOCgsEasDbCoA9FqBsW6CPmqIVDeDb
 Z0PQ8a/1BpSSodeJ5GiPQseea8ZA7jNLYzXAZYHKI/ZarlKGDpcGmUCuMiQmwdM=
X-Gm-Gg: ASbGncuu2srRlIqNwJb8JAqvH7FMa3+R340urnu2IbE2/VljrhLkbdWBfMagZ8R+Op9
 CfS+7urzoaMgfTkqGOccn4tf5peG6R/oCYr9RwZIHVVPR+sYeFdKE3+i8aKKpZfZxMHVaB/hXTN
 XTtn6/90N6bcH4gacn323vsdRZattEfyHeKY0g3wwJv9BlRk78L4pjCpmC7E94sff3h4H205UPz
 uIoxPTOwCw4Ddz6R8mVcfLA3KtMqth21LBqmJoKtfQr15lPEg5IPN4ZyQxJkWQIgSFxKZNQK7e2
 GTHw4uLMiJU0PvJYLeXtWMSOPeFFm+NVf5ze
X-Google-Smtp-Source: AGHT+IEw43tUBJRchCl8MuOYQW8rqwep01JG2Y96KkYtjaNzl6mBKUMCux0sBcGmrJiKrqRwBmyENg==
X-Received: by 2002:a05:6512:318e:b0:540:2fd2:6c87 with SMTP id
 2adb3069b0e04-54229533e65mr94118e87.16.1734647299006; 
 Thu, 19 Dec 2024 14:28:19 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-542238217d0sm288222e87.212.2024.12.19.14.28.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Dec 2024 14:28:17 -0800 (PST)
Date: Fri, 20 Dec 2024 00:28:15 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 09/15] drm/msm/dpu: split PIPES_PER_STAGE definition
 per plane and mixer
Message-ID: <oqlzulxq2mtgxopmhirp5ftj7k5hmsga72xpbsj47dx2vlxazt@mv62qtxvfmbs>
References: <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-0-92c7c0a228e3@linaro.org>
 <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-9-92c7c0a228e3@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-9-92c7c0a228e3@linaro.org>
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

On Thu, Dec 19, 2024 at 03:49:27PM +0800, Jun Nie wrote:
> Split PIPES_PER_STAGE definition per plane and mixer pair. Because
> there are more than 2 pipes in quad pipe case, while 2 pipes at most
> per mixer pair. A stage struct serve a mixer pair, so pipes per
> plane is split out as PIPES_PER_PLANE.

I can barely understand this. The patch itself LGTM.

> 
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    |  4 ++--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h |  1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   | 18 +++++++++---------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h   |  4 ++--
>  4 files changed, 14 insertions(+), 13 deletions(-)
> 

-- 
With best wishes
Dmitry
