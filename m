Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B578A198C1
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jan 2025 19:45:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53A6310E73E;
	Wed, 22 Jan 2025 18:45:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="oeVTrARS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93D5410E73E
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jan 2025 18:45:09 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-5401e6efffcso105650e87.3
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jan 2025 10:45:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737571448; x=1738176248; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=EUgHEQvD1kwE2u4wD1OjgHGNz901+pm9SiPReBHmq0k=;
 b=oeVTrARSm8Z/uvCWD3nfSzADzcI4VlI7eBu5YfRBgx9EV8jgpiHvXK1eWpWZN8UsLx
 2Aoqm8P77o8/2njQlZS+cYzdYH6jSdzzMuHpGhhyj05eUI3ZYyyZKqvyan25bHwcLZTy
 R1m9923H2xjuyNlxyzKYMArXTp+5gANhRKIljwQUppqCKhD0Jz8RPaCxMv6C8wrLwZdl
 MEGk2YmDBoe/03g9vYAI0sdetrnV4frvK0TR1XwqSszIxMXEVT2K4v+wmFiA6ZMtDxeM
 2dRTqN3751NxpOcg53r7A38cKH78aGte/PTBAxnwifUT7Q/wGbXW0TUPDxqsVH4Md590
 4puA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737571448; x=1738176248;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EUgHEQvD1kwE2u4wD1OjgHGNz901+pm9SiPReBHmq0k=;
 b=oOlXSyrSEuIjjOdQEXq2GzqhderBvL/+qo+1oMOdt2FkqyBmEgPm2akgP28kV5vPp9
 JbJPYp+f35My/2JlfmXHqZXY4aM6FsB1Fd5sJSkBsefAaoF5zgpY50KbDPsvCFkVJgno
 6OFKKjzNQhULiOqWAtT2Y6btv9na/mobQhqkbmwGsluPIpKgJWB9dngW+qINSJDq+M+f
 LQwc/IAH4zhrpidq7IV5P8R84f2SRv0M6Ov0dhY36LLqSZwyVHWwz7ozDiGjd/a61CgS
 FITo+ugzlSafDJcoy6dIChFCwORy9zxPLI1uevNpIP8RJfzEosiqB2RSgTes0zWU49n5
 5GsA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWqPjAmViRaI7HMlDC0QLw70evX1x54vT2QP2GcRQlra5FTclFnoDqa5UDjdiQGjNJ9Asw/wW//dZ8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx6sN/j27WjlMVqNhapkFMymGSV2RxqmpEkKetZPVGvrf323IrV
 j/33zON+cTD5XlMvKm/QMu9AinWZYPmMZJtUTvl+eLOGWaJuu/zdUQW0HqYheuw=
X-Gm-Gg: ASbGncvGOi8LNlWI+T4RHNagv8G4tI/jWw4kJXd0vdstCa7N9AhQ388wETIn7sCJKxU
 rjwSoBYTkl/rxRws4ufNAkE0jNlVaMcFJLfcUYGIw1gLA84e2WALOW+UbzcT21d8xlI6dkzbli0
 U1VDkWJyjWU27spLBxzJqJThrx9TeMebDzelGMr8TMreUVSfKfRv29i+Bb6QWF3bWpDaIKNgXjc
 IZGUKLoiQIo8HWUZThNcq48eSycedgquQogVAfWv1YnCV/EgugmFD/Nj73OhTfveUrxCGtUVRiE
 mWxyYDZRUT7n266NxwQFj9MHDXcUQy77CXh40WL6+j8JWFY/Sw==
X-Google-Smtp-Source: AGHT+IHMuKyIPqrIK1IC1oXzTkFTwuVuxFfR+V2buzAGSQuYz6439CoiOvQ3yyfJTt2r4jUPkmIBJw==
X-Received: by 2002:ac2:5611:0:b0:53f:f074:801c with SMTP id
 2adb3069b0e04-5439c2830e9mr7436905e87.41.1737571447759; 
 Wed, 22 Jan 2025 10:44:07 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-543bb0e6feasm452237e87.12.2025.01.22.10.44.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jan 2025 10:44:06 -0800 (PST)
Date: Wed, 22 Jan 2025 20:44:03 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Marijn Suijten <marijn.suijten@somainline.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, ~postmarketos/upstreaming@lists.sr.ht, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Martin Botka <martin.botka@somainline.org>,
 Jami Kettunen <jami.kettunen@somainline.org>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
Subject: Re: [PATCH v2] drm/msm/dpu: Fall back to a single DSC encoder
 (1:1:1) on small SoCs
Message-ID: <kzmxf6r5kiyh2pr6hdzlwi3gwrlh3g257zlrpk4p5s66rhofio@qm2lbenuc2gw>
References: <20250122-dpu-111-topology-v2-1-505e95964af9@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250122-dpu-111-topology-v2-1-505e95964af9@somainline.org>
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

On Wed, Jan 22, 2025 at 05:23:44PM +0100, Marijn Suijten wrote:
> Some SoCs such as SC7280 (used in the Fairphone 5) have only a single
> DSC "hard slice" encoder.  The current hardcoded use of 2:2:1 topology
> (2 LM and 2 DSC for a single interface) make it impossible to use
> Display Stream Compression panels with mainline, which is exactly what's
> installed on the Fairphone 5.
> 
> By loosening the hardcoded `num_dsc = 2` to fall back to `num_dsc =
> 1` when the catalog only contains one entry, we can trivially support
> this phone and unblock further panel enablement on mainline.  A few
> more supporting changes in this patch ensure hardcoded constants of 2
> DSC encoders are replaced to count or read back the actual number of
> DSC hardware blocks that are enabled for the given virtual encoder.
> Likewise DSC_MODE_SPLIT_PANEL can no longer be unconditionally enabled.
> 
> Cc: Luca Weiss <luca.weiss@fairphone.com>
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
> Note that this doesn't paint the full picture in case there are SoCs
> with more DSC hardware blocks, but when multiple virtual encoders
> have already allocated most of them.  My initial plan was to code
> ahead for dynamically tracking and reallocating these blocks in RM, if
> some virtual encoder could potentially be using too many DSC encoders
> which, while "power optimal", may not be able to support the number of
> requested displays/interfaces.  Such a solution would automatically
> ensure DSCmerge is *not* used when there are not enough hardware blocks
> available in the first place.
> ---
> Changes in v2:
> - Fairphone is one word, lowercase the P from phone (Luca);
> - Skip unnecessary if (dpu_enc->dsc) check and always count the number
>   of non-NULL dpu_enc->hw_dsc[i] instead (Dmitry);
> - Revert irrelevant whitespace cleanup in DSC comment, even if
>   worthless enough to send separately (Dmitry);
> - Drop dsc_common_mode=0 initialization and move existing 0-assignment
>   from a random place in the function down to where this variable is
>   actually being updated (Dmitry);
> - Link to v1: https://lore.kernel.org/r/20250121-dpu-111-topology-v1-1-d01987205c53@somainline.org
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 47 +++++++++++++++--------------
>  1 file changed, 25 insertions(+), 22 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
