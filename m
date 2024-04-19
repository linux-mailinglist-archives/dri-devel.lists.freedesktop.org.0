Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 271AA8AB760
	for <lists+dri-devel@lfdr.de>; Sat, 20 Apr 2024 00:59:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55EB410E646;
	Fri, 19 Apr 2024 22:59:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="rcH3zaFR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B288410E646
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Apr 2024 22:59:21 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-516d6c1e238so3185666e87.2
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Apr 2024 15:59:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713567559; x=1714172359; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Y/pykJ+iNZaZvxsy5yVJ+QnkNtTRNc8ccYnjEfcauKg=;
 b=rcH3zaFRIcRRAIoGYyBPPgJEV9+9lLnNqReqML693loPXZKh5BkooMLx3iGdLUK6km
 c6z08HRUI74tb90hEvB44r0F4YCJyBUt2w7BuNDaLx0lZAGiomb2oEkmPbS8Bhhi6qWZ
 dyLhAMnnS3UBSWMomcl9UskyrPXtLPFPIWBJRsTDtluAFLXWrPtNov069HW6owBuLR2n
 vgQ3aOQ4NTq2H09tnd+LpicUe+zFOIG8QwlOn5tzxtdJ6srCMPILDVRsCQZYeCdINUjv
 B1+wkmfWHkfzppxWuEnvNiB83fWmJc18GHN2cW/GJnAT5lSbJm3g+3QRJqppw2B2iZw3
 L2sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713567559; x=1714172359;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Y/pykJ+iNZaZvxsy5yVJ+QnkNtTRNc8ccYnjEfcauKg=;
 b=j/EYw+NlCFaKoGVlN/K9+SIsSj35DEk/3fpGtqMMk2SYryHG64rPEGvNihYs13EcyJ
 Qq3kavcchwpOpiOeDmOY48Ib5/7V1I+gtdi6Vaxqynl9pIP9IN2v3PnoSIPF8T/NtjDZ
 OMRIxfR/Y3Q0QgTqSpisVXuzrjg537urtJ0SBU2oZ5YsCmVdgVzf6CYVA/HuNy9QECkt
 7lwWQqhB5p+otyqL0NT2lPzdlweqTFWj7YCfnbBI60dl98J8sjHfh+65ycgcpS2xnVpt
 voiYiEqZE+K0YOYgARH7skbQsGe4G6cobp8JmmtE1ofM6lOeDybWPSv8xbm4OUD1AB6A
 /+7Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXiRWwU+kOjnO5LL3pk/9BVbvXnkz6ekmLlsfyrqM6gROixaMwTtv2nQGOIO4/E3SP/Sd/Jw5VdE5Ve7+rmXhFyC+5JrTZnKUZPrn84xJlp
X-Gm-Message-State: AOJu0Yxmbk0h/HFcFsVXAv4vbVUV/ztl77FtuqNDaAB8hkahHFRAtitE
 ddktNN/XjswW5UZl+Mus4czvBDCBJ65oILGRGgbZJ1kyyazumMMjEVUUliIx+O8=
X-Google-Smtp-Source: AGHT+IESWYEtVXjigtQ0L5bOUF7zr3weAYEinceRJ7EB6HeSNIHj7J9wJmp0cfKzhv8mnoUheJDP1A==
X-Received: by 2002:ac2:58cd:0:b0:51a:bdd6:e718 with SMTP id
 u13-20020ac258cd000000b0051abdd6e718mr1877655lfo.31.1713567559098; 
 Fri, 19 Apr 2024 15:59:19 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::8a5])
 by smtp.gmail.com with ESMTPSA id
 s6-20020a197706000000b00518d7c38cb9sm913814lfc.284.2024.04.19.15.59.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Apr 2024 15:59:18 -0700 (PDT)
Date: Sat, 20 Apr 2024 01:59:16 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Marijn Suijten <marijn.suijten@somainline.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Archit Taneja <architt@codeaurora.org>, 
 Chandan Uddaraju <chandanu@codeaurora.org>, Vinod Koul <vkoul@kernel.org>, 
 Sravanthi Kollukuduru <skolluku@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jordan Crouse <jordan@cosmicpenguin.net>, Rajesh Yadav <ryadav@codeaurora.org>,
 Jeykumar Sankaran <jsanka@codeaurora.org>,
 ~postmarketos/upstreaming@lists.sr.ht, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Martin Botka <martin.botka@somainline.org>,
 Jami Kettunen <jami.kettunen@somainline.org>
Subject: Re: [PATCH 2/7] drm/msm/dsi: Pass bonded-DSI hdisplay/2 to DSC
 timing configuration
Message-ID: <omnlm4e6yq5u2iurxld5gwo7rma4jpfmmhvpzsddjz5aensumc@ffsolnsblmyx>
References: <20240417-drm-msm-initial-dualpipe-dsc-fixes-v1-0-78ae3ee9a697@somainline.org>
 <20240417-drm-msm-initial-dualpipe-dsc-fixes-v1-2-78ae3ee9a697@somainline.org>
 <CAA8EJpq-1QwoM2hEyegpfKnVH+qrswjmTd_hpYs9d9B7gikHjg@mail.gmail.com>
 <7fqwkryeumkt7zxsec6va7ys22nfs3tr4rrcz323extdz3f6zv@w4uu2lk4uh7v>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7fqwkryeumkt7zxsec6va7ys22nfs3tr4rrcz323extdz3f6zv@w4uu2lk4uh7v>
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

On Sat, Apr 20, 2024 at 12:18:39AM +0200, Marijn Suijten wrote:
> On 2024-04-17 14:58:25, Dmitry Baryshkov wrote:
> > On Wed, 17 Apr 2024 at 02:57, Marijn Suijten
> > <marijn.suijten@somainline.org> wrote:
> > >
> > > When configuring the timing of DSI hosts (interfaces) in
> > > dsi_timing_setup() all values written to registers are taking bonded
> > > DSI into account by dividing the original mode width by 2 (half the
> > > data is sent over each of the two DSI hosts), but the full width
> > > instead of the interface width is passed as hdisplay parameter to
> > > dsi_update_dsc_timing().
> > >
> > > Currently only msm_dsc_get_slices_per_intf() is called within
> > > dsi_update_dsc_timing() with the `hdisplay` argument which clearly
> > > documents that it wants the width of a single interface (which, again,
> > > in bonded DSI mode is half the total width of the mode).  Thus pass the
> > > bonded-mode-adjusted hdisplay parameter into dsi_update_dsc_timing()
> > > otherwise all values written to registers by this function (i.e. the
> > > number of slices per interface or packet, and derived from this the EOL
> > > byte number) are twice too large.
> > >
> > > Inversely the panel driver is expected to only set the slice width and
> > > number of slices for half the panel, i.e. what will be sent by each
> > > host individually, rather than fixing that up like hdisplay here.
> > >
> > > Fixes: 08802f515c3c ("drm/msm/dsi: Add support for DSC configuration")
> > > Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> > > ---
> > >  drivers/gpu/drm/msm/dsi/dsi_host.c | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> Thanks, it seems this patch has already been picked up for 6.10 [1] to test at
> least, but I'd advise you to drop it until I resend it in v2, as it no longer
> performs as written in the title.

Ok, dropping.

> 
> When I wrote this patch in in June 2023, commit efcbd6f9cdeb ("drm/msm/
> dsi: Enable widebus for DSI") from August 2023 wasn't there yet.  That patch
> updates hdisplay (because it is unused after that point) with the number
> of compressed bytes to be sent over each interface, which is effectively
> hdisplay (based on slice_count * slice_width, so as explained in the commit
> message that corresponds to half the panel width), divided by a compression
> ratio of 3 or 6 depending on widebus, thus passing a way too low value into
> dsi_update_dsc_timing().
> 
> As a result this patch regresses the DSC panel on my SM8150 Sony Xperia 1, and
> likely also explains why it was quite hard to get the porches "just right" on
> the Xperia 1 III with its dual-DSI dual-DSC 4k@120Hz panel (that these patches
> are specifically for).
> 
> I'm still thinking of how to best fix that: probably introducing a new separate
> local variable, though dsi_update_dsc_timing() only uses it to calculate
> the number of slices per interface, which again as written in the commit
> description, is currently required to already be for one interface (in other
> words, the Xperia 1 with only a single intf sets slice_count=2, but the Xperia 1
> III with 2 bonded DSI interfaces sets slice_count=1).  Which means that this is
> always equivalent to slice_per_intf = dsc->slice_count.
> 
> Let me know which approach is preferred.
> 
> - Marijn
> 
> [1]: https://gitlab.freedesktop.org/drm/msm/-/merge_requests/110

-- 
With best wishes
Dmitry
