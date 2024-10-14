Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0CCF99C0DE
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2024 09:13:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C1D010E393;
	Mon, 14 Oct 2024 07:13:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ysPdC7Yi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5185910E393
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2024 07:13:24 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-539f6fede4dso542129e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2024 00:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1728890002; x=1729494802; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=0cthvJbNHIUuZVAOfCaJNB5q9EvmZX6lNdstcrG6zo4=;
 b=ysPdC7Yi91nae0eMihFOsCi+tauJwc1y0xsJuwt2JhnsSNos2lVIAdL26wUI4Ozg97
 Zfuhg77aBzXuU+tT3wSHZWBRzwiO0ZdsD1ZdoS/X+yFibbRXjr1NrDs6X7sOmwTNHzO/
 /gMbc6O6ASzxkcq47SBqhyouueR9Pr4R7R4i8RyvTTDLNXAZFWTewagMXudN67okcKDz
 /lgZp+/Aa59zq2pgBmJIphKFLVC3AbnDiNIPIKItLDHB6GlTGth4xHvqyJ+sG/te6JRH
 uDGD1G7CPy3brVT5QV2WsVG6X7OY6Rj8DLggkstkXTBWCwetzOeeOINbjgrbLQE9GZyB
 LXOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728890002; x=1729494802;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0cthvJbNHIUuZVAOfCaJNB5q9EvmZX6lNdstcrG6zo4=;
 b=UvhKzfgenZBw+yTmeuoR9JxVOI3P2Jjb9eGj/GgvuLjxC44EF5LsQA9N8l0FzeAEiY
 MYpMaagbXY8mZE6O89IRQp89nILQLv/gjbl/rmpSJGRQceH8Uy5zOuv/PG4O7LcfNsh+
 isqVHSnjx9SQsVKv4F5VUuFyK496QJ+F9/UT7BRezJev7nnnCaaiLHNfZTHfwdhEqAuP
 I4Q5Pq4fTTRd/yQS4qayfxDhlk/t9xOec7Wa7Ccdk45XVjoN9GrOWo0cOlBVLgM6+xxM
 UMvyCt52NjF1QBtCi2hH/rSxvWP+Wt2yhSzwIQdoL9eTFCbwMsfF5G1QgWKF1SJ5KCkq
 BBeg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX8mohQD5e6V4EEpwUgl0/e49yDZrXVp9C29fSvvTs2j301bYQy5C4JsoDk6F8ap12PkxK35HGllK4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyGUQQuKO9u2SPYVJY2FvOHY+ogAKsm3Yhvd1PZ3lmRf9V9MZtx
 dasKr2UCmiZ9RmwqLex1fyhezE7SIHRuBK8a2e3L/bnGsJ5UMsZu7VNtIcy/gf4G2xbqKWns93b
 erfg=
X-Google-Smtp-Source: AGHT+IEBN6UgXvC/JiYyQZMKU0lBe2gQnD6YwBDWWDisNaW1eInShMqX2HIrW1+nlG/NKSGaVJphGw==
X-Received: by 2002:ac2:4c4e:0:b0:535:d4e6:14e2 with SMTP id
 2adb3069b0e04-539da4fb618mr4542670e87.36.1728890002303; 
 Mon, 14 Oct 2024 00:13:22 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-539d69405e9sm1224978e87.280.2024.10.14.00.13.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Oct 2024 00:13:20 -0700 (PDT)
Date: Mon, 14 Oct 2024 10:13:19 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Rob Clark <robdclark@chromium.org>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/msm/dpu: don't always activate merge_3d block
Message-ID: <pahfbstxa6snym7bem456npsp6bdekjqhnjcsrlpbfn77hkrut@uviaesubwz2a>
References: <20241011-merge3d-fix-v2-1-2082470f573c@quicinc.com>
 <kah73euzauizsxvcrgmfsatshfe4pytgb7xe5iprtajg7abhsv@l7jdcxza5gd2>
 <0ca707a4-bd5f-4a31-a424-f466afa08e0d@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0ca707a4-bd5f-4a31-a424-f466afa08e0d@quicinc.com>
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

On Sun, Oct 13, 2024 at 07:37:20PM -0700, Abhinav Kumar wrote:
> Hi Dmitry
> 
> On 10/13/2024 5:20 PM, Dmitry Baryshkov wrote:
> > On Fri, Oct 11, 2024 at 10:25:13AM -0700, Jessica Zhang wrote:
> > > Only enable the merge_3d block for the video phys encoder when the 3d
> > > blend mode is not *_NONE since there is no need to activate the merge_3d
> > > block for cases where merge_3d is not needed.
> > > 
> > > Fixes: 3e79527a33a8 ("drm/msm/dpu: enable merge_3d support on sm8150/sm8250")
> > > Suggested-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > > Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> > > ---
> > > Changes in v2:
> > > - Added more detailed commit message
> > > - Link to v1: https://lore.kernel.org/r/20241009-merge3d-fix-v1-1-0d0b6f5c244e@quicinc.com
> > > ---
> > >   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 2 +-
> > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > LGTM now. Please clarify, is there any dependency between this patch and
> > [1]
> > 
> 
> No dependency as such. Both are tackling similar issues though. One for
> video mode and the other for writeback thats all. Namely:
> 
> 1) We should not be enabling merge_3d block if two LMs are not being used as
> that block needs to be enabled only to merge two streams. If its always
> enabled, its incorrect programming because as per the docs its mentioned "if
> required". Even if thats not causing issues, I would prefer not to enable it
> always due to the "if required" clause and also we dont need to enable a
> hardware sub-block unnecessarily.
> 
> 2) We should be flushing the merge_3d only if its active like Jessica wrote
> in the commit message of [1]. Otherwise, the flush bit will never be taken
> by hardware leading to the false timeout errors.
> 
> It has been sent as two patches as one is for video mode and the other for
> writeback and for writeback it includes both (1) and (2) together in the
> same patch.

I think it's better to handle (1) in a single patch (both for video and
WB) and (2) in another patch. This way it becomes more obvious that WB
had two different independent issues issues.

> 
> I thought this separation is fine, if we need to squash it, let me know.
> 
> Thanks
> 
> Abhinav
> 
> > [1] https://lore.kernel.org/dri-devel/20241009-mode3d-fix-v1-1-c0258354fadc@quicinc.com/
> > 
> > > 
> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> > > index ba8878d21cf0e1945a393cca806cb64f03b16640..c5e27eeaff0423a69fad98122ffef7e041fbc68e 100644
> > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> > > @@ -302,7 +302,7 @@ static void dpu_encoder_phys_vid_setup_timing_engine(
> > >   	intf_cfg.stream_sel = 0; /* Don't care value for video mode */
> > >   	intf_cfg.mode_3d = dpu_encoder_helper_get_3d_blend_mode(phys_enc);
> > >   	intf_cfg.dsc = dpu_encoder_helper_get_dsc(phys_enc);
> > > -	if (phys_enc->hw_pp->merge_3d)
> > > +	if (intf_cfg.mode_3d && phys_enc->hw_pp->merge_3d)
> > >   		intf_cfg.merge_3d = phys_enc->hw_pp->merge_3d->idx;
> > >   	spin_lock_irqsave(phys_enc->enc_spinlock, lock_flags);
> > > 
> > > ---
> > > base-commit: a20a91fb1bfac5d05ec5bcf9afe0c9363f6c8c93
> > > change-id: 20240828-merge3d-fix-1a8d005e3277
> > > 
> > > Best regards,
> > > -- 
> > > Jessica Zhang <quic_jesszhan@quicinc.com>
> > > 
> > 

-- 
With best wishes
Dmitry
