Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE15AA55F0A
	for <lists+dri-devel@lfdr.de>; Fri,  7 Mar 2025 04:58:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C03B810EABC;
	Fri,  7 Mar 2025 03:58:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="oKmtfUvq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D298910EABC
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Mar 2025 03:58:09 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-5498c742661so1463560e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Mar 2025 19:58:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741319887; x=1741924687; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=uEBF7q7djaNS5nAjrGOiMY9ClFLfelskzs9woxu33aM=;
 b=oKmtfUvqs0okZkrKAKFUBK7DrLjbx4ronbmq4qAMGDmC2IKCooUj1fgPyHRVj8cvps
 OPRuW3hiiAQaNEBpLVr3SCTQvVL6AsdIrcP7aT/rJFDKz2KXUcKvm5TX+gHhf7NgPh3Y
 BFmkYsn+M/xPInnFN7dUdJe5t1DB4levPLGfJff+e5ecJ7mC81AaZSzn7uGSXQ/w/8g0
 7/DxBCaDLCFimKSUUjdUNHW6MvZZN91O80GcyG7j/SRyXxB5VxUbvBemmyb/SIjcptd4
 3qgYJqncYgx/Y1r2YKAfIqfvy0iEdDj6wjjKDjvWFYvJu8rh5+1kuvkYEaN8HxEMLtSN
 ku/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741319887; x=1741924687;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uEBF7q7djaNS5nAjrGOiMY9ClFLfelskzs9woxu33aM=;
 b=Tml2s8Ep7EEo4PdNZ77K1EwMxDo8l/9nK5dpwS4zlFLHSrNCdC9j0rlMCAgRUCJt0P
 baj9LAgpgazJ9epxHI5gGDw/tb2a2cNJyleMs+iWF6nq4bSb511yuA/PGwsrikaVYM4C
 NxqZNiyPVfBQ9/u0gaZe0hqF5Scc2pkM90lZI0rf4vpz9Qhs1vtt5j1nYCWCs31msrXN
 2xR9y1+eJEBCKTC6kDAyXvyt7lyKsl4DV0R2q8fubzu7Gu9B1Q+/IBjbA5B2bLAFzp5d
 rKjPW0XLJd/wn1uoAegouAKkgJJeGnC9W7NAreE7U0NaKzyqn4nuWWV/0iZcD4SXUmUE
 CkIg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXtroRHyEQkdi8RKRji51xd/UVfvcBJ9S+bre2/ncsZ8qCITz0TUbr/SzhZf4rN9UNDhQPR1j7Fsjc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw9teHpdlBB8t4R/Am7Ou7rtjrm3gG4w8/dgVfyJJFzq+tWfYGM
 0WLvHxpV35Uh6JPkYkOi6aXHsr+CS7HseN8h2aWqQnTiyAfNaOHbd2WsxHgFrio=
X-Gm-Gg: ASbGnctgaUkqLIlPAR2n6keNdik5rmQlMU9ED8UAza3gyQl1gzC1uZfbw7OpsKmfl5B
 ClHys/fj8FIsOOxmjJH1sgOvWGPq3DBorxRiF67/3CFbkkaXKejrmUZgLm7Vpl6RMJDkLRu6WBE
 Ql99Nko9/DnQIF8aTH4va/fN/zcC4/AAj5/UdQn+rQii23lSfEsQtQCQCN5SZytZTCRJO6jQVaa
 3AAG+hjT7F7iK9MstDs1u2shoNmjKq9Eiyl9QK2n4gNerB46Xt/ibeZ+y0VBVJuCYz0/H6tiIJN
 by1IlK2dsLHU4YoZ9E0Ei2Ux4OvUDv4Membw9fAuIIn4ZWovxQsqmuIMU6rUtEm6wyhLDTuwGWS
 BkYGv6mzFAVNU1G/1PeG7VIHq
X-Google-Smtp-Source: AGHT+IGOFCkKLZ1UQh2TRUPs+Eu6QCFBBW9AoVDPv1C752stT+7E5xh4IuWYrNCXRm/wPrkUfsK6hg==
X-Received: by 2002:a05:6512:118a:b0:549:6759:3982 with SMTP id
 2adb3069b0e04-54990eac875mr558887e87.37.1741319887522; 
 Thu, 06 Mar 2025 19:58:07 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5498b0bd0absm365580e87.157.2025.03.06.19.58.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Mar 2025 19:58:06 -0800 (PST)
Date: Fri, 7 Mar 2025 05:58:04 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dpu: Adjust CDM_MUX to support CWB PINGPONG
Message-ID: <7wqtrfc24j7irouintg3h3fh337maziqjxcxcvxuvltdohqc7c@ai6zm6tidqgo>
References: <20250305-cdm-cwb-mux-fix-v1-1-16148ca6e4d2@quicinc.com>
 <vjufkcrkungrwy7w4pxzsac57ilzk2dt3eeypzy6pna2z5ocxg@uf237ixu6kqq>
 <b125d75f-eb71-469b-808e-3078f2f7e266@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b125d75f-eb71-469b-808e-3078f2f7e266@quicinc.com>
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

On Thu, Mar 06, 2025 at 11:33:46AM -0800, Abhinav Kumar wrote:
> 
> 
> On 3/5/2025 10:44 PM, Dmitry Baryshkov wrote:
> > On Wed, Mar 05, 2025 at 07:16:51PM -0800, Jessica Zhang wrote:
> > > Similar to WB_MUX, CDM_MUX also needs to be adjusted to support
> > > dedicated CWB PINGPONGs
> > > 
> > > Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> > > ---
> > >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.c | 4 +++-
> > >   1 file changed, 3 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.c
> > > index ae1534c49ae0..3f88c3641d4a 100644
> > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.c
> > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.c
> > > @@ -214,7 +214,9 @@ static void dpu_hw_cdm_bind_pingpong_blk(struct dpu_hw_cdm *ctx, const enum dpu_
> > >   	mux_cfg = DPU_REG_READ(c, CDM_MUX);
> > >   	mux_cfg &= ~0xf;
> > > -	if (pp)
> > > +	if (pp >= PINGPONG_CWB_0)
> > > +		mux_cfg |= 0xd;
> > 
> > Shouldn't it be 0xb for PINGPONG_CWB_2 and 3?
> > 
> 
> No, this register CDM_MUX can take only 0xd for CWB PPs.
> 
> 0xb is not listed as a valid value at all.

Thanks for the confirmation.


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


> 
> > > +	else if (pp)
> > >   		mux_cfg |= (pp - PINGPONG_0) & 0x7;
> > >   	else
> > >   		mux_cfg |= 0xf;
> > > 
> > > ---
> > > base-commit: 6d3175a72cc07e90f81fb35841048a8a9b5134cb
> > > change-id: 20250305-cdm-cwb-mux-fix-69ed5297d4f7
> > > 
> > > Best regards,
> > > -- 
> > > Jessica Zhang <quic_jesszhan@quicinc.com>
> > > 
> > 
> 

-- 
With best wishes
Dmitry
