Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10F4D97E242
	for <lists+dri-devel@lfdr.de>; Sun, 22 Sep 2024 17:19:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19C6710E221;
	Sun, 22 Sep 2024 15:19:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="VbPaXzVO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
 [209.85.208.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E211910E221
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Sep 2024 15:19:45 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-2f7502f09fdso28936841fa.1
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Sep 2024 08:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1727018384; x=1727623184; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=RktBA3rNO4z2AO05Xh3kFckysmGXNwk87bFssLv38Ro=;
 b=VbPaXzVOllGSnkNTuNVo+Jw7N7XKsErPQjYqxkopLrl0gkMRJ18pnMhEy4sVvBHBjj
 nfDG8R4ULPFtmxh+QAZFfRabW8upwxLJAmFGTblvj9GxrLe87NM3oR6Tt7Pas7xByNbw
 sZEU1934spYQhvCVGuAqfWSsCfm1dQtVa4AW4OkBR/79KJbeOHn6gZOBncmFvIchhhnP
 9Toe6tvZQDF4bJUKdvYZWu08RbQCOEakiTU3YowfhVoUih+TTUfwursebQWBG2V3t3Qb
 INKPcYFKisbWqEjzLSCOGPuO7LZ8mI1AxNHylNall8sJCt8gXG/1iNACPKYACPjaqO4z
 m9pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727018384; x=1727623184;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RktBA3rNO4z2AO05Xh3kFckysmGXNwk87bFssLv38Ro=;
 b=sMfhpbLXD68v8m0Cm4iH16wWxyA2+8od1wWWaoE/HUxbh44z7DnsWT9Wi8ulkHUwsw
 ALhyZuk13/OzRvAIkk0dCwLsmO4AZ70LnwFJanQy2vXkOxwim+3mWownoW4G9/Fm6uAu
 BWkVfRI+K1bcA3Q6ylvXYzuEjchfye8MagAHP5Dl/qlreYHL7b9evptk9HBUodQ2P3CY
 npR4YGMc6JcarLSHsSSeu/v3e9FPaHzbgBw5g1sOJlpxSMJ7l5Z8Yj3tL9Q9pRGrVd0f
 OGHo0CksNH0PsiVZVO6+YJBbxyhxfd3xw+E1Yatz1Jt0KUWpw/hBPt3qGYFMOG12lZsy
 LgKw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVR1/VzIy7O6kAyMNyqI8ffXG3LDCrBP54C5o1/ZZtw5dr14AEdt4RlFmaBxaTB+G9ol3cCj/Q+oQM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzaAmgHV2negQE1TX6W+kHj3U+G4NJMlAvXAUp7y/ORE91rorVI
 5RlsKG7ehaVUFhRsU3Z4f16n+t3tek/RwG+58zSp6DtPMj0VW1paxpPkvjBwnTo=
X-Google-Smtp-Source: AGHT+IHnNtiqWjktBGUle4eCFNr5wK0JsNwjJa7o4m+/PgU3WQQqvcCEojUHrKK7NDjwkt8b8W2oew==
X-Received: by 2002:a2e:be22:0:b0:2f7:6371:6c5a with SMTP id
 38308e7fff4ca-2f7cb36441dmr31172151fa.16.1727018383980; 
 Sun, 22 Sep 2024 08:19:43 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2f79d2e1eebsm26415461fa.16.2024.09.22.08.19.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Sep 2024 08:19:42 -0700 (PDT)
Date: Sun, 22 Sep 2024 18:19:41 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: He Lugang <helugang@uniontech.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 3/3] drm/i2c/tda9950: use devm_add_action_or_reset() helper
Message-ID: <qa2aeclqxevg2xc73fme2u27sq3atulwf5jmujyfk4vudux7u2@arcr3kqp2vvu>
References: <FBFE856A095C6232+20240907071305.1663440-1-helugang@uniontech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <FBFE856A095C6232+20240907071305.1663440-1-helugang@uniontech.com>
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

On Sat, Sep 07, 2024 at 03:13:05PM GMT, He Lugang wrote:
> Use devm_add_action_or_reset() to release resources in case of failure,
> because the cleanup function will be automatically called.
> 
> Signed-off-by: He Lugang <helugang@uniontech.com>
> ---
>  drivers/gpu/drm/i2c/tda9950.c | 12 +++---------
>  1 file changed, 3 insertions(+), 9 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
