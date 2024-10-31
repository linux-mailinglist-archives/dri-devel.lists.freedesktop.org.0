Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8E179B83B2
	for <lists+dri-devel@lfdr.de>; Thu, 31 Oct 2024 20:53:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2656D10E91D;
	Thu, 31 Oct 2024 19:53:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="nlGdy50F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEC5710E91B
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Oct 2024 19:53:20 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-2fb5fa911aaso20141221fa.2
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Oct 2024 12:53:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730404399; x=1731009199; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=FfLXMCQQFkBg7dASFcVMaYIBkwL01Sjg2kKn5PFIJT4=;
 b=nlGdy50FdDUJc6uuDdniQPiJcPiEV1IjTwOoL+vbHHwOOVAbWIAWhmTCnm5ntVmwRy
 lDksX4GGkAHdTfhyTVrmDPBZkjg8nW3ZibKeUUYOkWrjcTTi6YWPt3oqSJ6+qiUsKL0e
 +GQCZOyX6aX+NlMxgQlKkaKAmJgyfcdVKx94GtQtgsPzaSzMyyz4ymn+TDPXFGnPQmbO
 vxu8czmFOYqSRTpcF0n5l3PwMgRGlFmRqUe628AZh0ZBM9JyXdvf9LH3S1/Ys2cF8B8D
 Bge8yTaQNPix8eixRkcQbdL0NvVj7brmm5nI8GR6SF/BZdIvn2/TE0P4orflNhac7ATD
 Z2FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730404399; x=1731009199;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FfLXMCQQFkBg7dASFcVMaYIBkwL01Sjg2kKn5PFIJT4=;
 b=A3694yGYWt8o7brlWXvTB+mT2aCKopyhAxfyrTHZrdy/nF20rVEp9kvIsgf0RVCHRP
 5J4q2Ab2cjITsuVELclRZEf7cXlbQghvIIU72KSNrJH3fJDkJcGz8CMbG/PnifOdo2UO
 P1bEKx96v9vfdEzS/spLT80HGsbB7zWuQYCW5AzRjYrqeDbov30cxwfsXBGAqkio7W6Y
 3+NYZjOn1hpF21bz0NH/aMjwQScY+ieJEPHHIefXZW/e4q2OxEgLcCLLnTNFzZ2ZLIe4
 YgBxNwiKErmhnuyGF304UTy/iaL+inmhrRU+riFElop5pZV7kxKIaVYWD4nAJIxJKiKr
 J9hw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUKlkZYckySYIKklCLe61K75ITgy/1dhSQdyaF184WB0PRbFnzyTu4GHZopFVcOa5K7SXoaagfc7qM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwOyieAqOs4E/gXUrhafl7AiJ4UyI9x+9YWzG6cQj+sYWNzOl1r
 UxOHNg0WflG12YYeGwROgC78d9QbocIJ9EXoeLmzfmPZCN15SoGbwtop+uPM3n0=
X-Google-Smtp-Source: AGHT+IFbIDigm0flj16NCCbZnnareTFGiMJU9B1xBShOIW2PD8XpTBELPIlnMY8x52kyuov0Cc5GyA==
X-Received: by 2002:a05:6512:3e0d:b0:539:f10b:ff97 with SMTP id
 2adb3069b0e04-53d65e16242mr1025066e87.49.1730404398459; 
 Thu, 31 Oct 2024 12:53:18 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53c7bdcbcf6sm306468e87.194.2024.10.31.12.53.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Oct 2024 12:53:17 -0700 (PDT)
Date: Thu, 31 Oct 2024 21:53:14 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>, 
 Simona Vetter <simona.vetter@ffwll.ch>, quic_ebharadw@quicinc.com,
 linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Clark <robdclark@chromium.org>,
 Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v3 05/23] drm/msm/dpu: move resource allocation to CRTC
Message-ID: <33b25qy73byvz35djhduq4r4kksqtvels2fty6ikxkawox33u5@udv6j6buxnj2>
References: <20241016-concurrent-wb-v3-0-a33cf9b93835@quicinc.com>
 <20241016-concurrent-wb-v3-5-a33cf9b93835@quicinc.com>
 <3afded46-7aef-4444-9b61-b97f71d0e5fc@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3afded46-7aef-4444-9b61-b97f71d0e5fc@quicinc.com>
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

On Thu, Oct 31, 2024 at 12:37:03PM -0700, Abhinav Kumar wrote:
> 
> 
> On 10/16/2024 6:21 PM, Jessica Zhang wrote:
> > From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > 
> > All resource allocation is centered around the LMs. Then other blocks
> > (except DSCs) are allocated basing on the LMs that was selected, and LM
> > powers up the CRTC rather than the encoder.
> > 
> > Moreover if at some point the driver supports encoder cloning,
> > allocating resources from the encoder will be incorrect, as all clones
> > will have different encoder IDs, while LMs are to be shared by these
> > encoders.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > [quic_abhinavk@quicinc.com: Refactored resource allocation for CDM]
> > Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > [quic_jesszhan@quicinc.com: Changed to grabbing exising global state]
> > Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    |  86 ++++++++++++
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 201 +++++++++++-----------------
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  19 +++
> >   3 files changed, 183 insertions(+), 123 deletions(-)
> > 
> 
> <Snip>
> 
> > -	/* See dpu_encoder_get_topology, we only support 2:2:1 topology */
> > +	/* We only support 2 DSC mode (with 2 LM and 1 INTF) */
> >   	if (dpu_enc->dsc)
> > -		num_dsc = 2;
> > +		topology->num_dsc += 2;
> > -	return (num_dsc > 0) && (num_dsc > intf_count);
> > -}
> 
> I dont recall the context of replacing num_dsc = 2 with num_dsc += 2
> and its not documented.
> 
> <Snip>
> 
> > +	/* We only support 2 DSC mode (with 2 LM and 1 INTF) */
> > +	if (dpu_enc->dsc)
> > +		num_dsc += 2;
> > -	return topology;
> > +	return (num_dsc > 0) && (num_dsc > num_intf);
> >   }
> 
> Same here
> 
> This should not break anything with current code. We could land it the way
> it is as this was the version which was last tested and post a follow up if
> this was not right. Something to be documented though, hope this note serves
> that purpose. Rest of the change LGTM,

As this is supposed to be a refactor, I'll land it as num_dsc = 2 and
let Jessica fix it in the followup patches. I think it's better this
way.

> 
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

-- 
With best wishes
Dmitry
