Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86A96A3624F
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2025 16:54:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE72710ECFB;
	Fri, 14 Feb 2025 15:53:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Gu/r7Zts";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7899310ECFC
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 15:53:58 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-543e4bbcd86so2260320e87.1
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 07:53:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739548437; x=1740153237; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=HS3uecu9TMJRaOEOUKVJiydyZFBfgEQCXWB2WvE0/0A=;
 b=Gu/r7ZtsLDI/dWxVqUBAd7L3oEquvQXuPA1hULXUw4Qvqul/gTQATeGqNUBF9KvxXp
 Fv55mrskM0zs64djQH8o4BsWvfKPYuzGidxpb/Wi4O9POiuXtla43CYx/XPw978yGVim
 LXuyH3mRFApUwaeaAbYq5HbA7cxNegm6Bg/1HGEOsRReg+M+NYvqZJaA+DgLUR+5fH6q
 z0mGM2Xb1uuRBeQ572VuNVlVqLyEPt0D9VnM/+nvipMjeGn5pVQGrRGCB7KOll8aNWEm
 BHL5bQkZtUUA9eJzAhPxciwohR5jDNQzPgYr2K8J/JlCfUi5bTg5zpnA8VBTKex113/K
 fx1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739548437; x=1740153237;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HS3uecu9TMJRaOEOUKVJiydyZFBfgEQCXWB2WvE0/0A=;
 b=G8noWH0FFKWErPQBNbaCMK+41Hbax5o/tOGxAsmwoyvSoV26eypIQls8LWQZdaQ8yP
 fYc2kKiu9kUCm2Ksnnw5Z49CQa2CEX7tuaQsPaPVeYkNMOVYTjw3qq/89jULNXpF/meC
 TonUDGrs+LDT7E+3ALAOY3JbjeZHbLD72LFav3OL37hmDIbdDpQkLSq0TSZLgBMtbSb0
 rdteu/CoOqqk9nrrwCxrSysmL8p+aynTT4EWvoP297eF6wQ5/CfqbvWN0r4MhAWYYl4m
 B+OFaJN1hEGUxVFzmdiDd5fwnQYt3+C1HCyixW70yJaqFIYgCdR11cFf8ZYEWzb0qnR8
 z1zw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUmNhdCd3gkcHnXXtM8eNmkviSCzlM7kE1WJPlaP/6DyHr3LCDizt/dgeGYOmPekIvxbJFO5DcDAMU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxAkZCOrR1tpOIs796xsPvFJ4cjj0wCPbhrg/p9gs9k3STqbSH5
 YJAugeboiMeMzfeQMLt15b+Pgacry3Gjayvb5+zGPmGtzItctxUgFkEMToiob7A=
X-Gm-Gg: ASbGncsxqnqyALQztliBrh8sPmadzUuavFm2e9G2wwyGSXBjP7WFjaSC22e4TFaFlN+
 M+jjYfrWFXUuA6Q6FUqXhmNGSkG0FZBNpx2mfwzABlI1vO827QXUU95rjipU1E47XIbhU2xEPLa
 /QC1FzvnvkYQqQacntkYnmXrTEq1zXN9mcQ92/ytJW0Rhe7LVyBaW9DPSVxClExOFdUWUynxNdZ
 SXRL4tYXsw2RJg6XrGOQvhdSwXm3g793hawWqO7S9lwpsevDzizMJ2nzq6zCIUtV4iyfHUvsmMu
 NOlOjVbFPc6MpfW+chVfS1bV3UaQIKxfAifUAtoe2bislaZx6qL720ussyre8/Ai6s0r3nk=
X-Google-Smtp-Source: AGHT+IFktQPbauJ0wmVAOA4Ond5xWCTpVxR1gtGYr0ljgsIR7j0dZM8PNLyip+zKlVCTBnd9Mquj6w==
X-Received: by 2002:a05:6512:230d:b0:543:e406:6363 with SMTP id
 2adb3069b0e04-545180e5dd9mr4710520e87.3.1739548436771; 
 Fri, 14 Feb 2025 07:53:56 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5451f0834desm566000e87.37.2025.02.14.07.53.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Feb 2025 07:53:55 -0800 (PST)
Date: Fri, 14 Feb 2025 17:53:53 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] drm/msm/dsi: Drop redundant NULL-ifying of clocks
 on error paths
Message-ID: <e4u52y7mvalcqncjwpwavmw3xevp7pgdshp75rjmk7sddmhg4z@5m2fmm4qzuaz>
References: <20250214-drm-msm-cleanups-v2-0-1bec50f37dc1@linaro.org>
 <20250214-drm-msm-cleanups-v2-1-1bec50f37dc1@linaro.org>
 <aarbydttw4zexzkorcr4yb4swscw3crn65u6eactutpfgpnt4y@fg4zyd45xwln>
 <a0391156-8d37-4595-a490-2b828170ab65@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a0391156-8d37-4595-a490-2b828170ab65@linaro.org>
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

On Fri, Feb 14, 2025 at 04:28:45PM +0100, Krzysztof Kozlowski wrote:
> On 14/02/2025 16:22, Dmitry Baryshkov wrote:
> > On Fri, Feb 14, 2025 at 02:17:44PM +0100, Krzysztof Kozlowski wrote:
> >> dsi_clk_init(), which gets the clocks, is called only through platform
> >> driver probe and its failure is a failure of the probe.  Therefore
> >> NULL-ifying specific clocks is pointless and redundant - the PTR_ERR
> >> value stored there won't be used/dereferenced afterwards.  What's more,
> >> variant-specific clock init calls like dsi_clk_init_6g_v2() are not
> >> doing this cleanup.  Dropping redundant code allows later to make this a
> >> bit simpler.
> >>
> >> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> >> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> >> ---
> >>  drivers/gpu/drm/msm/dsi/dsi_host.c | 3 ---
> >>  1 file changed, 3 deletions(-)
> >>
> > 
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > 
> 
> 
> Thanks for reviews. Both you and Abhinav reviewed, so I assume this will
> be applied by Rob?

I will pick it up once Abhinav posts msm-fixes

-- 
With best wishes
Dmitry
