Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A816AA147EA
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jan 2025 03:08:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D77B10E180;
	Fri, 17 Jan 2025 02:08:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="gQdabyjN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
 [209.85.208.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6E1D89F41
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2025 02:08:51 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-306007227d3so15887951fa.0
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2025 18:08:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737079670; x=1737684470; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=UmNBaJ9flAoGVL3CjStFJ3qiZfXYpirOf7AF7gGIp/8=;
 b=gQdabyjN/RRZDsxm9udp271kyJHrmj4OE5zsCXzOa/m83J9GIJ7Muz7M9uR3cBspHB
 FWwJTEMmgIOJHqFynhKJhZjzD7OjN2Q2W8GRFncrrrip1gYwXt8G7m7u/AfvDalS0kyf
 IfPT+KNs7cktG4vFZ8GHnOo9sux/nUZ0Lt+Gbk3CSGhJmeYI2drWyPeevEcggPhvbhTW
 eRkh2ZWU5fQSv0bdl7ojw+ZCtu2hWy0b1nSYThaQIXNY3UyLPhzUeIIpHjUzaSrMERbg
 tddFFpicPNidHZcb8gWQy8AVDf4U87iFzThCE5xXAUl0GwAuB5qucyGxwtflZlGDd37+
 CF9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737079670; x=1737684470;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UmNBaJ9flAoGVL3CjStFJ3qiZfXYpirOf7AF7gGIp/8=;
 b=bcMIeADw84LGPFlLUIBuolLu+aZufTuD8yzITTUax1ap2EgLOB4UX67yzVJyGD4HUL
 pthx5D4vtWmFkOgFiwfG4GLJeKCFtd4cZNwN/J2gRl9T5M24HoFJTO8tQ1X0JlqoSDeO
 qpS6hI/r+KnltZK6ZmRRuKDQaOfLFa0k6wWX4P2CZ2IBlBfjbcvEdJ3Ho4wzso2ijhgD
 pwCcZqaWZfC3In8MSEJhrG1bButH5xF3bRVZV45wDtpXvfDrHVDaRYjE5E+MkU+/dOT3
 SChdDzDKb2f5pvn9+jKRtdiH8JtLvJY6tsHS5fORZUCFW75FPGW20FrQDWZlZKscESXB
 zs5g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVkns9E+AY7/gSMmtB680aftMlJU/Zg4g5Q1GKqtUR8pEuKLmDU0uI/IO7kNsgZtlyMqyrbwh7SdTk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxoj7J8YtMANDPnO9GHcxlYMz+44NPTbY7NjTsQCKPdCctriKPM
 95GMNwYwZva7C7wgZVx61Qk21s7NV3iZmVxK5ETl2BrDsBe69w1eD1fNOAqp7cA=
X-Gm-Gg: ASbGncvB++CTyw17VKYj5ArxwJXTjvg7I9TlnY7i2qJou33S+hifKLF08BkdE78NY/R
 0JGeYh3yWKqPSbJMr88VdkTz1AoHCV9eitrUO072cIcm/8jaWKTIamErJIO4vl9SQFOu/oFPvER
 qxdRk1+r58DFZ46RaUgm+coGhBZreyhotJeSOrnB8eHl6lmquUJSZpPF7Spbopr6TnTxL9YjtMW
 vqxL9mtkaXHmlTFhELT2AebAQohtMZOMq1FrL9vs/rC6PzdEkEYaO38iFvinmBVKzbpENrLBOFg
 frahid4Uz0yIO40yNg4aHfOGoYq+HgzlqBH7
X-Google-Smtp-Source: AGHT+IE3mDy1UnCtfClC2GekVgCffh6WY4c88pU3oWTVLE5HIlhZvn/lG3F8S5lbrmtMtSxTxX1gaw==
X-Received: by 2002:a2e:be0d:0:b0:304:588a:99e1 with SMTP id
 38308e7fff4ca-3072cb0a4a0mr2949731fa.26.1737079669918; 
 Thu, 16 Jan 2025 18:07:49 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3072a331124sm2083161fa.21.2025.01.16.18.07.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jan 2025 18:07:49 -0800 (PST)
Date: Fri, 17 Jan 2025 04:07:47 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 01/16] drm/msm/dpu: check every pipe per capability
Message-ID: <2mtcnk7sg7zymdbkmucby3q7uwxhb4jde5r3ym5xdwkzjw6jc5@vv6fomz45ltl>
References: <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-0-74749c6eba33@linaro.org>
 <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-1-74749c6eba33@linaro.org>
 <ra4uugpcufctn2j2sosrwxewlwpivsmc6tidadf4kuostv4cq6@ev4di2547lla>
 <CABymUCPc5z+9SLeKy04Rg79B9sZUPUf9osJ6UJMKiv2cTXynxA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABymUCPc5z+9SLeKy04Rg79B9sZUPUf9osJ6UJMKiv2cTXynxA@mail.gmail.com>
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

On Thu, Jan 16, 2025 at 10:38:33PM +0800, Jun Nie wrote:
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> 于2025年1月16日周四 15:44写道：
> 
> >
> > On Thu, Jan 16, 2025 at 03:25:50PM +0800, Jun Nie wrote:
> > > Move requreiment check to routine of every pipe check. As sblk
> > > and pipe_hw_caps of r_pipe are not checked in current implementation.
> >
> How about this version?
>     The capability stored in sblk and pipe_hw_caps is checked only for
>     SSPP of the first pipe in the pair with current implementation. That
>     of the 2nd pipe, r_pipe, is not checked and may violate hardware
>     capability. Move requirement check to dpu_plane_atomic_check_pipe()
>     for the check of every pipe.

... Move SSPP feature checks to dpu_plane_atomic_check_pipe() in order
to verify requirements for every pipe.


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
