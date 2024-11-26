Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 824C19D9721
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2024 13:18:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E08AE10E199;
	Tue, 26 Nov 2024 12:17:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="dRlevlLB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2920510E84F
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Nov 2024 12:17:58 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-53ded167ae3so521425e87.0
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Nov 2024 04:17:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732623476; x=1733228276; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=zIiJZ55i8NdMGDjfrOdk3DfZs/tLxD9oconoLO+oq+A=;
 b=dRlevlLBBNBXUBf2Bx/Os3BDeap5tilDAh7Tk3tGWwyybeaVRJe2Gl3L7g9cBJWPVq
 Edf6HcPP1WEQxg/NxxkkPC1gOYKHkvu6cof3ixTRnoi0LhjA/COcPmyJ8ccwtPkqrMwa
 Io0S/YcFuif4ZKuQl0l1UXEWG4ZpM93b8iPu2tP30QPPTEabEwxqclnw4yG36rCmD/Mh
 fctv00NF0ql/SlPDBvnRtvhbTdjyybCqEUoIyu6YE6KauPdfoYomayB1haHM8mnZDiTF
 lFi5xUPZl7kASTDVUmk0sllo9e/wHn/K9kNPXqhS6rjkagGIbI22kHvRgeEyqGTUYU/l
 33HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732623476; x=1733228276;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zIiJZ55i8NdMGDjfrOdk3DfZs/tLxD9oconoLO+oq+A=;
 b=VgZ51cTZx94ofqLNE7K1yV0qsCQ0WWrw7+EUlaD5djn/6i5ut/El9OwF0CYfhoW81l
 iVzrKQwh6f07BGUr2tmT1KcbPx161y7NSKChex8EsAhWBZEHOcaKQYFZ3SmHSkszO7SQ
 lheCU4vBTQwXSVT1Ie3k5HA2HvEFbu3cHBtPsGP3hZ2Q6Uc1EkaT3ckfGRF32klZcwj4
 tAkyM4BV9VRH/5ItqW96hMG0jxWKc8HcbKHJ9RlfzGBpFZDXj16G1mQbzAvQX/+U3CI4
 tYEoNRwyYUVwiKJ/JHkiD/UsBxKY/euE32x/eysDyPdQupJb6E5Xe53ZobUxotxJg0i+
 WQ8g==
X-Forwarded-Encrypted: i=1;
 AJvYcCU/GMNirWJfivWH6PP4ddQiFKlLll9rhSULjsJLCYQi+eamRT7zus/zCgerkmlQBemuKAsleMcg/hE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwVP7IhjlUGa/eduAY7peJ3lRlbsaR5Paiz6ZGNYRlt9YeH4P/3
 5V1Xtw0OUFu3h9TOo9gaRwiOXvrXFEeYW/kOLl3FcgJgA+AXYzNM7G2Ndvu7D4o=
X-Gm-Gg: ASbGnctDg83bJhXQwRgB5v+hbTJaZjsKkdLTSt8cYzC+8xN0hsBJjENvHgBzisB5iTr
 wnq8aG9jDcQ/Tvfc+F9qu/gX1I+fiiEfhWaff9FFs49DG6pfXy6Ci1lkaRJdTlQpfiUoVZfsNEY
 RRn2oCfcZrJpjLtvyfzVjwNCXND4G197nTwN5mEMvS/XUoFWU7TJAviiJfZ6i01FgKwY4q8aV4J
 BpVBGtSkQqgchDGAVRBMZYHe5blzqKo4Ox/tbfwV/cxVi0lMZhfLgnW99XI4tEuDmDu567Z9MHE
 RbU/eDZ1zk3TaBAZdFYI4AL4nWYFXw==
X-Google-Smtp-Source: AGHT+IGNnMnzJzSH4csFVqMWLKW+PYj2pG4i5xQYfHjEXv1hvwV2rJVchkFPFu5thqmIhO3VCJ0s5A==
X-Received: by 2002:a05:6512:3c84:b0:53b:1526:3a63 with SMTP id
 2adb3069b0e04-53dd39b564bmr7770105e87.56.1732623475913; 
 Tue, 26 Nov 2024 04:17:55 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53dd68c64c7sm1790045e87.114.2024.11.26.04.17.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Nov 2024 04:17:54 -0800 (PST)
Date: Tue, 26 Nov 2024 14:17:51 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 Connor Abbott <cwabbott0@gmail.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Subject: Re: [PATCH v2 1/3] drm/msm/mdss: define bitfields for the
 UBWC_STATIC register
Message-ID: <bclvvuo3i4icx5kraqsvmpdtokx46pnjmdhliz2mhsmdm256vm@rbkwhkhjvjtc>
References: <20241123-msm-mdss-ubwc-v2-0-41344bc6ef9c@linaro.org>
 <20241123-msm-mdss-ubwc-v2-1-41344bc6ef9c@linaro.org>
 <784a7813-b024-452e-8d7e-8cbaea761bcd@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <784a7813-b024-452e-8d7e-8cbaea761bcd@quicinc.com>
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

On Mon, Nov 25, 2024 at 06:03:52PM -0800, Abhinav Kumar wrote:
> 
> 
> On 11/22/2024 9:44 PM, Dmitry Baryshkov wrote:
> > Rather than hand-coding UBWC_STATIC value calculation, define
> > corresponding bitfields and use them to setup the register value.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/msm_mdss.c                 | 38 +++++++++++++++-----------
> >   drivers/gpu/drm/msm/msm_mdss.h                 |  3 +-
> >   drivers/gpu/drm/msm/registers/display/mdss.xml | 11 +++++++-
> >   3 files changed, 34 insertions(+), 18 deletions(-)
> > 
> 
> <snip>
> 
> > diff --git a/drivers/gpu/drm/msm/registers/display/mdss.xml b/drivers/gpu/drm/msm/registers/display/mdss.xml
> > index ac85caf1575c7908bcf68f0249da38dccf4f07b6..b6f93984928522a35a782cbad9de006eac225725 100644
> > --- a/drivers/gpu/drm/msm/registers/display/mdss.xml
> > +++ b/drivers/gpu/drm/msm/registers/display/mdss.xml
> > @@ -21,7 +21,16 @@ xsi:schemaLocation="https://gitlab.freedesktop.org/freedreno/ rules-fd.xsd">
> >   	<reg32 offset="0x00058" name="UBWC_DEC_HW_VERSION"/>
> > -	<reg32 offset="0x00144" name="UBWC_STATIC"/>
> > +	<reg32 offset="0x00144" name="UBWC_STATIC">
> > +		<bitfield name="UBWC_SWIZZLE" low="0" high="2"/>
> > +		<bitfield name="UBWC_BANK_SPREAD" pos="3"/>
> > +		<!-- high=5 for UBWC < 4.0 -->
> > +		<bitfield name="HIGHEST_BANK_BIT" low="4" high="6"/>
> > +		<bitfield name="UBWC_MIN_ACC_LEN" pos="8"/>
> 
> MIN_ACC_LEN OR MALSIZE has 2 bits , bits 8 and 9.
> 
> But bit 9 is unused today. Hence we were using it as a 1 or 0 today.
> 
> Its unused on all the chipsets I checked. Do you want to continue using the
> same way or correct this?

Let's correct it. I will send next iteration.

-- 
With best wishes
Dmitry
