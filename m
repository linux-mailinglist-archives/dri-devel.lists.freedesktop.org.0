Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E45C8A008D
	for <lists+dri-devel@lfdr.de>; Wed, 10 Apr 2024 21:26:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 098E710E670;
	Wed, 10 Apr 2024 19:26:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Hy4QR/cu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0C1C10E670
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Apr 2024 19:26:41 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-516d0161e13so8186424e87.3
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Apr 2024 12:26:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712777200; x=1713382000; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Oql17Fqd5Jg6+8RYI68vlFWWGpYVeFoSsC2gYOuJOyU=;
 b=Hy4QR/cu9FsCe768+qRjt3Od39MyQMxdyZN2vx/4d8kNt4gmC78i/9fP3YeERoMYAd
 04msozfy0OahBfkQM3zfKz5aNbbvLVCVBx6fUBWp3ScUa4npnkAfhvPPdXtjFtR5EhB1
 hmgMBJig4IAitEQiJ0GYRA0jPTl6I0qDuyUrvUU7PxvdXLujR5qpTxAgOk/uDCynEjbF
 U9twt4Aie5cVgBC/N1ojQF5ARlvgfDFVN9T1J9r7A/WwHoTVnnvTeWfBsrUucqi+BG4D
 w5qiKoNyiuc7ucsBflS7mlP9CpTGhjI7vfIH+PNjHaIhvW8UolCvVKeoEaOIgxDal5gG
 3JPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712777200; x=1713382000;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Oql17Fqd5Jg6+8RYI68vlFWWGpYVeFoSsC2gYOuJOyU=;
 b=i3F1jhQFXayn/Q/87xOrOwgKl0RbKxAYunU3OMpCW1RNW/fPGeW+e66SUp7oykS4+4
 UnF/7q7/Vpe31xpmmPTB/ynI/KLUejby8kITVaJtuZyc2K/UM77fC0ZX7maky94RT3nT
 fsVlBLFoeWPalb6l+61WExJVv1p7sp36g5bdZpU6zA363JGlc594vCIC0m5c//yNp1P1
 AnLw6SrFzV9VtVsJdVt9dXyPhoKs7P2lBY5Hh2pQ6TwyHSQKvfReVglB1lOACiJIEil2
 g6pk4HPluLUidaBCrAGDkd16ycg558+7o67i0FkprIZo16xIppunHoDvZZ9a6cH590/A
 Qt2g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWdCaHXGLTGWeAkZUuxUSssZVnRaTjrHpVtYWPp0GWC13lEfuww5CUbYf+JKin0KsYokr20zdGhvx79Q5WE3ZRLsQEPn4dEh35CBqGleY6J
X-Gm-Message-State: AOJu0YwaSYQRWBZWB2mZ5JhO/5jX9HSmhSSdY8D4sj1CtWdhWqrv6P8s
 vANq8U7ct8MyVJKuVilXkL8UWPRDuCS4PkvBtUhQm3U8smjMh0wyWdEJazKchAI=
X-Google-Smtp-Source: AGHT+IEJyevAVtPCLcTaJGYyYSGZelO6kzFGO1RxVTJJabuGr3OAqPR7yMBG4cD0OBvbeQOjPS5GUQ==
X-Received: by 2002:a19:e00f:0:b0:513:ec32:aa81 with SMTP id
 x15-20020a19e00f000000b00513ec32aa81mr2418754lfg.13.1712777199719; 
 Wed, 10 Apr 2024 12:26:39 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
 by smtp.gmail.com with ESMTPSA id
 x27-20020ac259db000000b00516b061e091sm1924951lfn.4.2024.04.10.12.26.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Apr 2024 12:26:39 -0700 (PDT)
Date: Wed, 10 Apr 2024 22:26:37 +0300
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
Subject: Re: [PATCH 4/6] drm/msm/adreno: Implement SMEM-based speed bin
Message-ID: <33qyr6cfruczllvavvwtbkyuqxmtao4bya4j32zhjx6ni27c6d@rxjehsw54l32>
References: <20240405-topic-smem_speedbin-v1-0-ce2b864251b1@linaro.org>
 <20240405-topic-smem_speedbin-v1-4-ce2b864251b1@linaro.org>
 <scvwfj44z3wpp7phvesfwjuv5awtlkwby2vvrpaq4i5fircrt3@i3ebya4iymf3>
 <730d6b9e-d6b4-41fd-bef3-b1fa6e914a35@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <730d6b9e-d6b4-41fd-bef3-b1fa6e914a35@linaro.org>
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

On Wed, Apr 10, 2024 at 01:42:33PM +0200, Konrad Dybcio wrote:
> 
> 
> On 4/6/24 05:23, Dmitry Baryshkov wrote:
> > On Fri, Apr 05, 2024 at 10:41:32AM +0200, Konrad Dybcio wrote:
> > > On recent (SM8550+) Snapdragon platforms, the GPU speed bin data is
> > > abstracted through SMEM, instead of being directly available in a fuse.
> > > 
> > > Add support for SMEM-based speed binning, which includes getting
> > > "feature code" and "product code" from said source and parsing them
> > > to form something that lets us match OPPs against.
> > > 
> > > Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> > > ---
> 
> [...]
> 
> > 
> > > +	}
> > > +
> > > +	ret = qcom_smem_get_product_code(&pcode);
> > > +	if (ret) {
> > > +		dev_err(dev, "Couldn't get product code from SMEM!\n");
> > > +		return ret;
> > > +	}
> > > +
> > > +	/* Don't consider fcode for external feature codes */
> > > +	if (fcode <= SOCINFO_FC_EXT_RESERVE)
> > > +		fcode = SOCINFO_FC_UNKNOWN;
> > > +
> > > +	*speedbin = FIELD_PREP(ADRENO_SKU_ID_PCODE, pcode) |
> > > +		    FIELD_PREP(ADRENO_SKU_ID_FCODE, fcode);
> > 
> > What about just asking the qcom_smem for the 'gpu_bin' and hiding gory
> > details there? It almost feels that handling raw PCODE / FCODE here is
> > too low-level and a subject to change depending on the socinfo format.
> 
> No, the FCODE & PCODE can be interpreted differently across consumers.

That's why I wrote about asking for 'gpu_bin'.

> 
> > 
> > > +
> > > +	return ret;
> > >   }
> > >   int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
> > > @@ -1098,9 +1129,9 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
> > >   			devm_pm_opp_set_clkname(dev, "core");
> > >   	}
> > > -	if (adreno_read_speedbin(dev, &speedbin) || !speedbin)
> > > +	if (adreno_read_speedbin(adreno_gpu, dev, &speedbin) || !speedbin)
> > >   		speedbin = 0xffff;
> > > -	adreno_gpu->speedbin = (uint16_t) (0xffff & speedbin);
> > 
> > the &= 0xffff should probably go to the adreno_read_speedbin / nvmem
> > case. WDYT?
> 
> Ok, I can keep it, though realistically if this ever does anything
> useful, it likely means the dt is wrong

Yes, but if DT is wrong, we should probably fail in a sensible way. I
just wanted to point out that previously we had this &0xffff, while your
patch silently removes it.

-- 
With best wishes
Dmitry
