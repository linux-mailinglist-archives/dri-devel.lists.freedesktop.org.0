Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D515E8A9832
	for <lists+dri-devel@lfdr.de>; Thu, 18 Apr 2024 13:06:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83216113B96;
	Thu, 18 Apr 2024 11:06:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="F2iKNetT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1B6010FBF3
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Apr 2024 11:06:15 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-516ef30b16eso834856e87.3
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Apr 2024 04:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713438374; x=1714043174; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=QoJVv2RWvbhhnx6gOF70bQ+Hht7rDXtw9zkh1pmPgSE=;
 b=F2iKNetT8fG60BmVE3cb9cSxfD3YihfPPOKVrj09wKQ8LHmsu9IkIgZI0kpR2CziHK
 KPuNDgYYjV19J1UElBG784Fo0a+MkLPMgaw83ohWvJKliDI4wcJAmdU3nsDrVVLLEJbn
 k4yizQKbGihqSeGeTReaVw/uDRTLhDBJ20N3tlhnzK/C85EGhn7p1e2i6jCDG+pkP8jL
 5hE2WkdZTv3DWm1qDBnuqUFYohBkvtmIZEPNy3wYbTCUX6K6AnwwkVGZJvUzJrqRpMPy
 afSkZgXQXB8JBdFZMUA89tgfY4YYrnEs3mvjNHVwJZrE9mNHJw0b4jL9f1Fcrw+UorW9
 URbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713438374; x=1714043174;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QoJVv2RWvbhhnx6gOF70bQ+Hht7rDXtw9zkh1pmPgSE=;
 b=BuGat80j8dueQDvyBrqTPsOkxp2yrs+bhPUxTbGVfB1TvDiggcOKKPzl72BtoMsvpR
 7avoLG/QU08r4ev/ofM7NhI+QXfrA+gsw8OZpujzyC0SxjARfbbnsrFSA430+bBplMN9
 OiM21DgJ/vGBbuYtLs5TWlciR4IEcH0M8PW2iJtDhO1PcetF5JNUXYhiDMj+jToKRN4z
 zZ/D1KvlWjDlaFdgJPRuMe3wrp+2sGdB3BviYP/fOIulZ1/RZMFEX4+ME6AzEG1wk6MX
 vXlNAWNc0LejTiJk8hFubNkeAyBrYurt6Ka/X7pQTmG1K7cCJtcq8dLjnUFi9qtVdx5W
 zA6A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWrPB21SKTngQjpi3r0GDEvTwlEN8+IsNCdBvwvtOzFiZf/wXBxAw3fpzzTfnQIFZZIZCUQ6RZxkY6+dUczHLs7cRS1Gpe7J1dscWRT+GOT
X-Gm-Message-State: AOJu0YxoKjV8/8miRaNvgQEWOQeFEYqiYPFMt47bF+Ls9Y3S633Gtm2B
 JQEjSsXiP2ytMY0hCjyCbttNcRCUJ5xtPMXEAizpnwRgWeWJiyTBAtDVKCC/iLA=
X-Google-Smtp-Source: AGHT+IHgHUXxxgO0WITTWXYfqenB1WfhObEW5gekCSgDerJnKgE92t/J5oVbQQuVVqEzZHGbF9DmSg==
X-Received: by 2002:ac2:4e44:0:b0:519:591d:45da with SMTP id
 f4-20020ac24e44000000b00519591d45damr1140132lfr.18.1713438373824; 
 Thu, 18 Apr 2024 04:06:13 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
 by smtp.gmail.com with ESMTPSA id
 r1-20020ac25a41000000b00516c1fa74e3sm194631lfn.207.2024.04.18.04.06.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Apr 2024 04:06:13 -0700 (PDT)
Date: Thu, 18 Apr 2024 14:06:11 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 2/7] soc: qcom: smem: Add a feature code getter
Message-ID: <s7mfapok2tvrp5vfm7dkrmyb7htgfucuuvry4shsl7vrxj7e6y@nosu2a7axjxo>
References: <20240404-topic-smem_speedbin-v2-0-c84f820b7e5b@linaro.org>
 <20240404-topic-smem_speedbin-v2-2-c84f820b7e5b@linaro.org>
 <mg6ojmzl3snj3k6fuyi6opkbdovs7xna6sn65pjh52ii4yy7u6@ny2spvjjbfpu>
 <89eccb1f-c527-4820-a084-7fc4ad3f0ab4@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <89eccb1f-c527-4820-a084-7fc4ad3f0ab4@linaro.org>
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

On Thu, Apr 18, 2024 at 11:53:31AM +0200, Konrad Dybcio wrote:
> On 18.04.2024 1:39 AM, Dmitry Baryshkov wrote:
> > On Wed, Apr 17, 2024 at 10:02:54PM +0200, Konrad Dybcio wrote:
> >> Recent (SM8550+ ish) Qualcomm SoCs have a new mechanism for precisely
> >> identifying the specific SKU and the precise speed bin (in the general
> >> meaning of this word, anyway): a pair of values called Product Code
> >> and Feature Code.
> >>
> >> Based on this information, we can deduce the available frequencies for
> >> things such as Adreno. In the case of Adreno specifically, Pcode is
> >> useless for non-prototype SoCs.
> >>
> >> Introduce a getter for the feature code and export it.
> >>
> >> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> >> ---
> 
> [...]
> 
> >> +/* Internal feature codes */
> >> +/* Valid values: 0 <= n <= 0xf */
> >> +#define SOCINFO_FC_Yn(n)		(0xf1 + n)
> >> +#define SOCINFO_FC_INT_MAX		SOCINFO_FC_Yn(0x10)
> > 
> > This is 0x101 rather than 0x100 or 0xff. Is that expected?
> 
> Yes, this is "the first invalid one", similar to ENUMNAME_NUM
> 
> > 
> >> +
> >> +/* Product codes */
> >> +#define SOCINFO_PC_UNKNOWN		0
> >> +#define SOCINFO_PCn(n)			(n + 1)
> >> +#define SOCINFO_PC_RESERVE		(BIT(31) - 1)
> > 
> > This patch works on fcodes, why do we have PCode defines here?
> 
> I decided they're useful to keep.. Didn't want to split them to a separate
> patch for no reason.


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
