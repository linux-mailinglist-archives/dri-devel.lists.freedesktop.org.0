Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0EB4471B98
	for <lists+dri-devel@lfdr.de>; Sun, 12 Dec 2021 17:31:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA62610E7BE;
	Sun, 12 Dec 2021 16:31:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA48F89FC9;
 Sun, 12 Dec 2021 16:31:29 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id a37so19452606ljq.13;
 Sun, 12 Dec 2021 08:31:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=eQdIOft1oYAqdZXW3N3vDzYovCItAhD3mQzWFf5HB24=;
 b=YqfScbKsBHI/NoNETMQ7U1DyexFNvL5oLjAkvyPEiJf3PsvdarLnzxjzdZpkaDaNeG
 lMB9pU8AG4esjWdSlKefZ3TpGzn49P9RfUSRVFmTi8Q3DXaDO418ikSiLH6MoanIzQXb
 Kg5iDQuubTDuzlZqYCI5JvHLUf3k2Fdr98Rasfk5LwQCmMXVYTWrwvioDJ7bSrCMVYUh
 1DndqasTcZymXSD63dFqKOFzFtNsIgEruJLgPkeaWjV9X3a+aKku9xLxMX2ogL+iH3tD
 BxWfcodoon6nSMUML20aQKaCvTeuBJr7uLeC9G5camZ9IcpOnAlDSFwu+F4D81ygIDVm
 LsGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=eQdIOft1oYAqdZXW3N3vDzYovCItAhD3mQzWFf5HB24=;
 b=4pkOn/h86HhRdYscMDOUnMmxx5RKliVz9B9MOX9UxSFCgaLH52SC8oKG+HgXGad3OK
 xleBwxHO1J8UpzlwFcDpAHodlvaSKDXyEDyISMoapFlgcy5UGN57xnhAq+AlycKCT0e7
 e0P5Voxvk/ROzme627v54JSyx26U2D4kzFiXx6qnGUJ2Fs7cj5GuLX3accJAMmVTnFgX
 BGazHMM0dJbmV2X/c8IvgZTdE0wad0jQ7I9geXHOySNKZD1JXgkR1uBPxazOkfYy52bM
 ZKFba22uDJQpxQt8ZGOwCjKSKDmthQDOqFG+0Nr8L/1Awp1AckKpwexFI5A2wdzHJ3AP
 O2eg==
X-Gm-Message-State: AOAM5304fdMcYTkP1+yOrvmxUwqd9EhUURX5iYUsrh1Ob4Ia+QqU5BBE
 87TM/Q2kZWR3kirPoWldbQlrkaf4C3BKM+y5aEY=
X-Google-Smtp-Source: ABdhPJxNRTqbYOnypQev6NPLw5f5F4aKudoYQj4wp9j9KozfyEV/1ORfo6k4+6He4jzgVAnFlMjKpw==
X-Received: by 2002:a2e:7819:: with SMTP id t25mr24793253ljc.374.1639326688211; 
 Sun, 12 Dec 2021 08:31:28 -0800 (PST)
Received: from trashcan (public-nat-10.vpngate.v4.open.ad.jp. [219.100.37.242])
 by smtp.gmail.com with ESMTPSA id b14sm1090934lfs.174.2021.12.12.08.31.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Dec 2021 08:31:27 -0800 (PST)
Date: Sun, 12 Dec 2021 15:57:09 +0000
From: Vladimir Lypak <vladimir.lypak@gmail.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH] drm/msm/a5xx: Add support for Adreno 506 GPU
Message-ID: <YbYbmXGKIACRT+wO@trashcan>
References: <20211022114349.102552-1-vladimir.lypak@gmail.com>
 <YXL16V17upehvUwt@ripper>
 <8ee2b4d4-44f3-6d03-b674-613b5b04a754@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8ee2b4d4-44f3-6d03-b674-613b5b04a754@linaro.org>
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
Cc: Iskren Chernev <iskren.chernev@gmail.com>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Konrad Dybcio <konrad.dybcio@somainline.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>, dri-devel@lists.freedesktop.org,
 Jordan Crouse <jordan@cosmicpenguin.net>, freedreno@lists.freedesktop.org,
 "Kristian H. Kristensen" <hoegsberg@google.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Dec 03, 2021 at 09:51:10PM +0300, Dmitry Baryshkov wrote:
> On 22/10/2021 20:33, Bjorn Andersson wrote:
> > On Fri 22 Oct 04:43 PDT 2021, Vladimir Lypak wrote:
> > 
> > > This GPU is found on SoCs such as MSM8953(650MHz), SDM450(600MHz),
> > > SDM632(725MHz).
> > > 
> > > Signed-off-by: Vladimir Lypak <vladimir.lypak@gmail.com>
> > > ---
> > >   drivers/gpu/drm/msm/adreno/a5xx_gpu.c      | 34 ++++++++++++++--------
> > >   drivers/gpu/drm/msm/adreno/adreno_device.c | 18 ++++++++++++
> > >   drivers/gpu/drm/msm/adreno/adreno_gpu.h    |  5 ++++
> > >   3 files changed, 45 insertions(+), 12 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> > > index 5e2750eb3810..249a0d8bc673 100644
> > > --- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> > > +++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> > > @@ -441,7 +441,7 @@ void a5xx_set_hwcg(struct msm_gpu *gpu, bool state)
> > >   	const struct adreno_five_hwcg_regs *regs;
> > >   	unsigned int i, sz;
> > > -	if (adreno_is_a508(adreno_gpu)) {
> > > +	if (adreno_is_a506(adreno_gpu) || adreno_is_a508(adreno_gpu)) {
> > >   		regs = a50x_hwcg;
> > >   		sz = ARRAY_SIZE(a50x_hwcg);
> > >   	} else if (adreno_is_a509(adreno_gpu) || adreno_is_a512(adreno_gpu)) {
> > > @@ -485,7 +485,7 @@ static int a5xx_me_init(struct msm_gpu *gpu)
> > >   	OUT_RING(ring, 0x00000000);
> > >   	/* Specify workarounds for various microcode issues */
> > > -	if (adreno_is_a530(adreno_gpu)) {
> > > +	if (adreno_is_a506(adreno_gpu) || adreno_is_a530(adreno_gpu)) {
> > >   		/* Workaround for token end syncs
> > >   		 * Force a WFI after every direct-render 3D mode draw and every
> > >   		 * 2D mode 3 draw
> > > @@ -620,8 +620,17 @@ static int a5xx_ucode_init(struct msm_gpu *gpu)
> > >   static int a5xx_zap_shader_resume(struct msm_gpu *gpu)
> > >   {
> > > +	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
> > >   	int ret;
> > > +	/*
> > > +	 * Adreno 506,508,512 have CPZ Retention feature and
> > > +	 * don't need to resume zap shader
> > > +	 */
> > > +	if (adreno_is_a506(adreno_gpu) || adreno_is_a508(adreno_gpu) ||
> > > +	    adreno_is_a512(adreno_gpu))
> > > +		return 0;
> > 
> > Afaict all other changes in the patch adds a506 support, but this hunk
> > changes a508 and a512 behavior.
> > 
> > I'm not saying that the change is wrong, but this hunk deserves to be in
> > it's own patch - so that if there's any impact on those other versions
> > it can be tracked down to that specific patch.
> 
> Vladimir, any plans to submit v2? This comment requests splitting the patch
> in two.
> 
> 
> -- 
> With best wishes
> Dmitry

Hello, Dmitry!
Sorry for delay. Yes, i'm going to submit v2 soon.

Thanks
Vladimir
