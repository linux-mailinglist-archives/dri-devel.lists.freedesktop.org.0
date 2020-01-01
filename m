Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F55E12E032
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jan 2020 19:49:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12F4889C85;
	Wed,  1 Jan 2020 18:48:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74F6B89C69
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jan 2020 18:48:53 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id p17so4036895wmb.0
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Jan 2020 10:48:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=B/sd6xhXXpuwJBp+kaINuvIW2l7yFRLjwKn3IBy/+os=;
 b=GwN9qvf4LyBDGZZaZWrXzo6BOFPnDtlajbeoG1UTE/0he02g17nC+ZaXG/VeP3MqEz
 dSVkwPOfAYxs8uDYJHPuzA3nlQRybla75ewusneNntG9ESChtMM8YiHh4d8sJuDmOKr9
 //vRsoHz+djvkDj9oGpkaNBFNdGRVjmZNFC20=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=B/sd6xhXXpuwJBp+kaINuvIW2l7yFRLjwKn3IBy/+os=;
 b=f4WGQcBcGRClqlnFI+e5Qk3GpMgluNHc2qHYLfsLm/CfZNWdCm1kBDwDFuQmVQTa8k
 EUVmWCa7s0wd0+4w/bk4baHuQA7PajKTsZMDdbUNo3VqPGpcnH/Cs9ars8HH1OuTHrCt
 6FEm7NTvs4RUykPYoUps870hM3eNOLTcqWNRAjEDNGloCLdriozU3Rzhs3+znpJ7Pv+y
 e+JI2HHMKEbtd59sgeX7W5NrmCclwcBovvxnavJcJXF7W56Zn1O8FEEhp405hVMEkgPL
 ApwHfzuLT7X/V7/kSl4IKJhTSHUsnCbBc3S+h+BVhXFdY/t4NmGiGayetPT2IiBtrt6V
 yjJw==
X-Gm-Message-State: APjAAAVo8DV5VJ3/xN0NDvqYyGNH3kLywtWdKNZUmh6ZXV8YJ9LC2Ckv
 smHLLXEEbNgUNpvV+VWTgQs/CA==
X-Google-Smtp-Source: APXvYqyW3tBV/7q+H7o4VFXihIgDTuFVkq5L4vmpPa6c4No7kXIJpZyFMbaLSpsRpDkVeJBAjJmRqw==
X-Received: by 2002:a1c:7406:: with SMTP id p6mr10380009wmc.82.1577904532065; 
 Wed, 01 Jan 2020 10:48:52 -0800 (PST)
Received: from dvetter-linux.ger.corp.intel.com ([194.230.159.125])
 by smtp.gmail.com with ESMTPSA id h17sm56232629wrs.18.2020.01.01.10.48.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jan 2020 10:48:51 -0800 (PST)
Date: Wed, 1 Jan 2020 19:48:43 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Wambui Karuga <wambui.karugax@gmail.com>
Subject: Re: [PATCH] drm/nouveau: remove set but unused variable.
Message-ID: <20200101184843.GA3856@dvetter-linux.ger.corp.intel.com>
Mail-Followup-To: Wambui Karuga <wambui.karugax@gmail.com>,
 bskeggs@redhat.com, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20191231205607.1005-1-wambui.karugax@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191231205607.1005-1-wambui.karugax@gmail.com>
X-Operating-System: Linux dvetter-linux.ger.corp.intel.com
 5.2.11-200.fc30.x86_64 
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
Cc: airlied@linux.ie, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 bskeggs@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 31, 2019 at 11:56:07PM +0300, Wambui Karuga wrote:
> The local variable `pclks` is defined and set but not used and can
> therefore be removed.
> Issue found by coccinelle.
> 
> Signed-off-by: Wambui Karuga <wambui.karugax@gmail.com>
> ---
>  drivers/gpu/drm/nouveau/dispnv04/arb.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/dispnv04/arb.c b/drivers/gpu/drm/nouveau/dispnv04/arb.c
> index 362495535e69..f607a04d262d 100644
> --- a/drivers/gpu/drm/nouveau/dispnv04/arb.c
> +++ b/drivers/gpu/drm/nouveau/dispnv04/arb.c
> @@ -54,7 +54,7 @@ static void
>  nv04_calc_arb(struct nv_fifo_info *fifo, struct nv_sim_state *arb)
>  {
>  	int pagemiss, cas, width, bpp;
> -	int nvclks, mclks, pclks, crtpagemiss;
> +	int nvclks, mclks, crtpagemiss;

Hm, reading the code (just from how stuff is named) I wonder whether the
original idea was that the calculation for us_p should us pclks, not
nvclks, but given that this code is as old as the initial nouveau merge
probably not a good idea to touch it. Plus I guess not many with a vintage
nv04 in working condition around to even test stuff ...

Ben, what should we do here?
-Daniel

>  	int found, mclk_extra, mclk_loop, cbs, m1, p1;
>  	int mclk_freq, pclk_freq, nvclk_freq;
>  	int us_m, us_n, us_p, crtc_drain_rate;
> @@ -69,7 +69,6 @@ nv04_calc_arb(struct nv_fifo_info *fifo, struct nv_sim_state *arb)
>  	bpp = arb->bpp;
>  	cbs = 128;
>  
> -	pclks = 2;
>  	nvclks = 10;
>  	mclks = 13 + cas;
>  	mclk_extra = 3;
> -- 
> 2.17.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
