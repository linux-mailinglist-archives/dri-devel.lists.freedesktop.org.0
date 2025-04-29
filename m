Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E28CAA03C0
	for <lists+dri-devel@lfdr.de>; Tue, 29 Apr 2025 08:52:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6045410E2E3;
	Tue, 29 Apr 2025 06:52:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="omZEAMMF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0259610E2E1
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Apr 2025 06:52:05 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id
 4fb4d7f45d1cf-5f6214f189bso10880305a12.2
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Apr 2025 23:52:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1745909524; x=1746514324; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=V3SRrGXA1KOeX3Qp91hES8MKpl0kNS1RThpoZDWoOdY=;
 b=omZEAMMFNd5qE2reYyEjswvyiZv+MKxzcvRKl108UN8MMT1Hhnfz25kmrjmCaaFYEn
 isf/AX+wexJW4lNT0Nl2tSV4ufHklNuUFT3EKf+Wn4OiXC4DdZ7Fpq5mEHVuLOnQMZGK
 8RljRDdhXeko9G7KTtX7HC8aUs4FV5wslmoprpOKqrUHcUJQnTEtGiG5+VQkAT8cr5bg
 wpinN3tbZ/GHPfdq73D7JDCHnj95sxI10CBNnrWpdD4lbFBKT9S3gLyUeAvDupOGxHYm
 LvL/wN7rLcwAybhUgo4+MeitXe2MhEH0/glbySIps3yjdP7mUcSFcLPv1UZSNr+XufUd
 VxaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745909524; x=1746514324;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=V3SRrGXA1KOeX3Qp91hES8MKpl0kNS1RThpoZDWoOdY=;
 b=akMwCQjapncDfMwgKwcTiFdoywaEscPp5uywwBsqRP6Ax2wKz+urTuHMHG56Iijtis
 yNMxXqIv37IY8V73ImAADHimFYDuF41UYf5TyH2udOx4g7/q451jqnxotypehZNNXdRF
 2aWTD5TB0Q2YSx0hErHxs3MN9xqr0Grw3rkXiOtigyxrwOQssFAjggEXRrNO7pw20iW2
 EsZMzamE5qzHKjxFEpURKCCbQj+kmizNl5yBvrZF9ST7I2tzv846jADMd68kLnu9x1Tt
 FoqBBSAP933hYHYIpSKaTsr8LqpOO5U+kF/dxZpPS9QOlCjFYCaScZ++j0ExfqEobw6W
 CPtw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUVz7KGm9+ivdO/JwPNKi4zfYk7c6pImxFphqORXJhm/5EY8acOGbnMbEnZFVbta2yTkukMBzJQJVE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwTvm+dDpqRDuoG04W0Vxt954GOQyAL9VMDZucggxy3atqMERkU
 +/wyQMTvqLAvGbiiwjFOc5yckBc7Ckys1D7OIJ+deyJiWEOEZkcFaX4EU1EjxE4=
X-Gm-Gg: ASbGncsVHUP1TDXxStGbLyJuXqJI2zAJwbTz4Raix9fZqCBwidNZCKX92xW5xMgyKBS
 MB1mm5XENCcVqh43CZo8mAL5YBuLKmekDMN8a84QI9eKhan4YRn2UuEvK9Dcizf4g2QkofXYiwQ
 HBYUSN1dp9kPiIUQENPAw9PwQYU8rIk18W4UnOITVqiewjPLd4kJVKaXR2iJ+sjN/iKdEEVwkkh
 IlGDJZR7vBEe1z3b4TJhLoO0tQc+5ePF0It+JENcD2sFuNOr+8tEBk/FhJuWZR/T92FidY6VFY9
 zDZCW4Gm5YBnpUHnkyUircaJO212lU2jS5Rdiw==
X-Google-Smtp-Source: AGHT+IE5A3qZWFdKlz6u8IXcMu/YWdgZDamp5pMVUAdRD0eLvFFABY5HqL1f0Ebisd5cUwFYaxMYbw==
X-Received: by 2002:a05:6402:2707:b0:5f6:c5e3:faa5 with SMTP id
 4fb4d7f45d1cf-5f83b2561f8mr1335517a12.23.1745909524457; 
 Mon, 28 Apr 2025 23:52:04 -0700 (PDT)
Received: from linaro.org ([62.231.96.41]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5f701400565sm7082545a12.26.2025.04.28.23.52.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Apr 2025 23:52:03 -0700 (PDT)
Date: Tue, 29 Apr 2025 09:52:02 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Cc: Johan Hovold <johan@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dmitry.baryshkov@oss.qualcomm.com, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 laurentiu.tudor1@dell.com
Subject: Re: drm/msm/dp: Introduce link training per-segment for LTTPRs
Message-ID: <aBB3ElgEoCF6yYNY@linaro.org>
References: <20250417021349.148911-1-alex.vinarskis@gmail.com>
 <aA8yFI2Bvm-lFJTl@hovoldconsulting.com>
 <CAMcHhXpmii=Rc9YVeKXaB17mYv0piSFs02K=0r8kWe5tQGk7eA@mail.gmail.com>
 <aA94yOjsayZHNDpx@hovoldconsulting.com>
 <aA+N8YHX0DZ6h9Uj@linaro.org>
 <CAMcHhXpG-1AP7qP6bAfFcdxtDxsC+_3TYFqwByp5pkFiRYvmJQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMcHhXpG-1AP7qP6bAfFcdxtDxsC+_3TYFqwByp5pkFiRYvmJQ@mail.gmail.com>
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

On 25-04-28 20:23:45, Aleksandrs Vinarskis wrote:
> On Mon, 28 Apr 2025 at 16:17, Abel Vesa <abel.vesa@linaro.org> wrote:
> >
> > The change itself makes sense though and I think makes sense to be marked as a fix.
> 
> Just to confirm, you mean to mark as fix only the 1st patch, correct?
> Since it's obvious now that the currently present partial LTTPR
> support did not break anything that used to work.

Well, the way I see it, the LTTPR support is broken on some specific
docks, even if it works in most cases. And since this fix improves
the already working cases and fixes broken ones, yes, add the Fixes tag
to the 1st patch only.

I'd even send that first patch separately to ease the merging, but that's
probably just me.

> 
> Thanks,
> Alex
> 

Abel
