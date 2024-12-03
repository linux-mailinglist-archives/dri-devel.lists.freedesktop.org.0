Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C1179E2136
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2024 16:09:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFF0410E22B;
	Tue,  3 Dec 2024 15:09:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Cg84JMa+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
 [209.85.208.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0143210EA55
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2024 15:09:14 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-2ffb3cbcbe4so60869181fa.0
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Dec 2024 07:09:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733238553; x=1733843353; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=W8QM3peqYBpltbi1DIHb+zoz79Kj1Hf/KKrtdC4QJc4=;
 b=Cg84JMa+gA/TaXz7U1zmiwmsYdbMJkzZ++bhjxyC+XLkWHyni2CdcUKWWL5nVqWk3O
 GCZRYLKWPHtHFCEflCfAZPvLKTuwCjRLIkZX/Hrk6pFdd2u4WwLnFrJlJLmKMMGQsvWk
 XktqrtMrpzRIf1knI46N9iktukuu1CDlxdp4BEEh1xO7iOvFjRYPIJDSf/mifm6ylpdh
 vBy5UZ0xQUIqS2LrJdkcJSezSnYcP+3X05Km9MvmGZtirK6//tXjmR1pjMT3ZZnX1361
 PlztWGOd3/DmgimQ4LXmYYhkq4ej5CLhDsG41M+gwagg5fvgxouyfhb/sY/ZnUPT8zYA
 P37g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733238553; x=1733843353;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W8QM3peqYBpltbi1DIHb+zoz79Kj1Hf/KKrtdC4QJc4=;
 b=GczHp/js41bmbZ3aFpol7bbQMDXSXQRedwzyjNFjN53vZ475c5ReE9VaFG42+XJ3df
 tJqejovZlqLDrLIH1wiFukfo58T3yKVMoAtI0rSxWqwt5j+4iPJFsZDMUJ2uZnXrE3Sg
 Gj2eLOcDmH/y+xsoEXQyc1GhBJCdOF0gmB2K/DANuj2GfhY2qnHEAAZ8RzPHvH8mfF/9
 fvge76H5r2aqVqedn0g101NYxTRI9HWi8QLocFE2V1K7VUcsq8eJrhU6cVfIJf40Yyzo
 F0GLJkKc0Z0dE+kq1SGzJLVJ1Bod7quesH8hgYEF72fdxnCfq10xtMgvUu13Cx9sNiz6
 3pzw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWQDpHb/u/iyOCgxcM3Rcku4HrMCLUdJSXS5qZctzb4qxxW/ajkLQup+mIGj07QnWOW1oojQnrb5XU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw2KeMw8B9sLLS8FCFVAGG9SarxzxfxElUJmvOBbwHKc3yXff4o
 x4mAbpVNqHAg0UapP7hb+VXHI2Igx/pUs2RKLeO+97gsVjagZqy7s8zcqmkC4DM=
X-Gm-Gg: ASbGncsTJMceIuhObdlS1BLJ5Tpwi7pWQbkPhiIJOz2A8M3Bz5iGUtAIzq6Bzy91JCK
 7cpBQ66KJGs52fuUKyGRGdGMrJFXfwi9lx6MrOP8go5tiMHYuw+dnQjM4OpFFsm0Y/x2tQCyp+D
 W6G8cXyTLC20weA/Rdc0DvBAd3PmGNwqf7q1h/HFK2bAjD7jdjLoEo3EN7Pr5NLGIkMDrhGg8bJ
 lXOyaTfnVBmqD9QJV3Imi7qxTeSSZIOKkiezrvI0a2hP2dP32+0xXCMEcaHXQCINQ9lZTNem77E
 NesSIG8v0zw1LKS6wdN4REf3sJxPFg==
X-Google-Smtp-Source: AGHT+IEjlfUflJI02ZJGU+Y+a8G3HUQsKv6NYL+aTiOcebMKzBeRoE8K/ZaRgeCLnat3VtUDppoaYQ==
X-Received: by 2002:a05:6512:31ca:b0:53e:1b79:ada3 with SMTP id
 2adb3069b0e04-53e1b79aea5mr687508e87.6.1733238551539; 
 Tue, 03 Dec 2024 07:09:11 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53df646f08csm1852548e87.164.2024.12.03.07.09.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Dec 2024 07:09:10 -0800 (PST)
Date: Tue, 3 Dec 2024 17:09:08 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Stephen Boyd <swboyd@chromium.org>, 
 Kuogee Hsieh <quic_khsieh@quicinc.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: Re: [PATCH 2/3] drm/msm/dp: do not touch the MMSS_DP_INTF_CONFIG for
 tpg
Message-ID: <fieuuhtisu6ztpuzks32rvnjdfnusywmmcyj2oz7rg36ablo6l@thq5p2xha6jx>
References: <20241202-tpg-v1-0-0fd6b518b914@quicinc.com>
 <20241202-tpg-v1-2-0fd6b518b914@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241202-tpg-v1-2-0fd6b518b914@quicinc.com>
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

On Mon, Dec 02, 2024 at 12:41:59PM -0800, Abhinav Kumar wrote:
> MMSS_DP_INTF_CONFIG has already been setup by the main datapath
> for DP to account for widebus to be used/unused etc.
> 
> In current implementation, TPG only switches the DP controller
> to use the main datapath stream OR use the test pattern but expects
> the rest of the controller to be already setup.
> 
> Keeping the same behavior intact, drop the clearing of MMSS_DP_INTF_CONFIG
> from the msm_dp_catalog_panel_tpg_enable() API.
> 
> Fixes: 757a2f36ab09 ("drm/msm/dp: enable widebus feature for display port")
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_catalog.c | 1 -
>  1 file changed, 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
