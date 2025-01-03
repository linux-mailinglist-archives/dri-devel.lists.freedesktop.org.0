Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE34CA0102A
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jan 2025 23:17:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2491010E964;
	Fri,  3 Jan 2025 22:17:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="utFYCfpT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
 [209.85.208.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4209210E964
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jan 2025 22:17:48 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-3047818ac17so109536621fa.3
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Jan 2025 14:17:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1735942606; x=1736547406; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=e0YmzsZClR47sjY7FgBQccHos8iPm+c8e4iFYZXrCJw=;
 b=utFYCfpTXoh04FkZMaxW6O23YZivbPClaaNUiMtIp77PeqsnZLvLeu0pvdDuGMmNMr
 etJPeSorEZLB7IYr17uT75bzs9tG0jvPokWcoouLGAWLQJuHGdqiklNgGwdIouIvPVKM
 aa0i4LyPzBtfiQneMK27HeQSZCVLxe3Kbw7Wktduxx2VDELRnlAJPGE13wXHVXlCuWre
 NE6hl+ss2G2znSXu3f/jvnUXNbo47DETfxI0720L7G6gE2UokwQGeiuyw2h6Bhw7wdi/
 1MtDMF4XgRobpMUeJkbRD7jEU7IszeJB83vzDcY39dOuQrzRj1Vn30STbgIWxc+O/r8+
 chHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735942606; x=1736547406;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=e0YmzsZClR47sjY7FgBQccHos8iPm+c8e4iFYZXrCJw=;
 b=VaJI10pccIlVkLylCk0woRfNuPcFD31WbDs/RaabeKaTYeF1zHIxr4En/RD8a0wl7c
 CfOsat/qqnVMphfIcN8yDtF/B8UPmDUN1tOMLFJk4p62wAwwgwUcTsaRZJ8t54YtbOHq
 ammdKCj+qwYU4riN6KF4Uw9SiMuIfwhEddGWGh6/TFlMQBv5OzGVXc70cgL1rgAjnNZA
 FTvq8Un2ncS3a3fYzPIjiZ5EGBE/kRH2ssXFUNBX+g6GmzKaJcEXvCGCQ/9gYkp85KHA
 Wc14QRNx/Q3gp9Wxq2Ia8X33VPdA3/eRDgcABVz3BO8ETdRKEiW2Bz9ayXaM8tUGknnl
 vAsg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVBw/7aPJ/fSXtZjvy1F5buTsqEao+4VbzAZbmHkNedMvtAaQLk9hRj/KzduzqPveyFysa1vLYoTpY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyViiHw2pISJ2h2QtLAGnEWJXHdpdxw/TngRN0IV5tBc/OVYp1N
 ROpKAOC+IuQ8x1kGh/LBfxP1uTJaeFEQYrVlyJ6JMR2u9jeEz5AYlat/QOwcXhc=
X-Gm-Gg: ASbGncvN5HM2AEKwc703bT9AXc/J3rQjJmjqS29xKOKt8u4zfZSXplhjXmFhbpGjjHB
 hsZfOWBheCF2BjN1vCyGB8CSp8+Kim+WjL2F/b55vF+O1INLX1nT8TNobjeX3+u4qGISTjQiQFj
 0qfMr0DBkLvix7ZDKGzuOwLYFgBnI/jxIImvnJlo0eTG0ZTcq0kQVr30IRHxeXiIZJgwaPJrTFz
 iQCRdwA/3VjW/d584qwfMhUXCR4VFNCK8CtiZ3p3aQOQFHmMRKGCMGzNtCn+98z8NXq+iPUtKNf
 rAtkp32cSm/f5TH0L56qXXP3GYJ1yhM8wjmP
X-Google-Smtp-Source: AGHT+IG2GoKKZOl7k69bHkPKyuHLpjcDZEE0m5cEbCQPuM7M5EkPKT1nPN22Q/7iM1x6VCI188Y6zg==
X-Received: by 2002:a2e:a78a:0:b0:2ff:e7c3:9e2e with SMTP id
 38308e7fff4ca-3046855277cmr165509051fa.17.1735942605848; 
 Fri, 03 Jan 2025 14:16:45 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3045ad99c8csm50832791fa.29.2025.01.03.14.16.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jan 2025 14:16:44 -0800 (PST)
Date: Sat, 4 Jan 2025 00:16:42 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Kuan-Wei Chiu <visitorckw@gmail.com>
Cc: Yu-Chun Lin <eleanor15x@gmail.com>, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
 ruanjinjie@huawei.com, jserv@ccns.ncku.edu.tw, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] drm/tests: helpers: Fix compile wrarning
Message-ID: <oukgrncfkmq27ocpdjmp7kfvlm7rtu4czhxjzfsltemxyfoxtj@lhkaewyzjtev>
References: <20250103161758.1097313-1-eleanor15x@gmail.com>
 <rpeh5mcy4xumebqojfoevvfar5dw4jmvuwt3btjklr4gohqhfs@fjqt6nbcpf4k>
 <Z3haGne8A0sJHnFF@visitorckw-System-Product-Name>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z3haGne8A0sJHnFF@visitorckw-System-Product-Name>
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

On Sat, Jan 04, 2025 at 05:43:54AM +0800, Kuan-Wei Chiu wrote:
> Hi Dmitry,
> 
> On Fri, Jan 03, 2025 at 08:14:20PM +0200, Dmitry Baryshkov wrote:
> > On Sat, Jan 04, 2025 at 12:17:58AM +0800, Yu-Chun Lin wrote:
> > > Delete one line break to make the format correct, resolving the
> > > following warning during a W=1 build:
> > > 
> > > >> drivers/gpu/drm/tests/drm_kunit_helpers.c:324: warning: bad line: for a KUnit test
> > > 
> > > Reported-by: kernel test robot <lkp@intel.com>
> > > Closes: https://lore.kernel.org/oe-kbuild-all/202501032001.O6WY1VCW-lkp@intel.com/
> > > Reviewed-by: Kuan-Wei Chiu <visitorckw@gmail.com>
> > 
> > Reviewed where?
> > 
> Yu-Chun is a newcomer looking to contribute to Linux and asked for my
> help. As suggested in the last section of [1], she asked me to review
> her patch privately before sending it to the public mailing list and
> include my Reviewed-by tag. This improves patch quality and reduces
> the maintainer's workload by minimizing potential issues.

Good, thanks for the explanation. It's perfectly fine, just wanted to be
sure that this is what actually happened.

> 
> Although I'm not a DRM developer, I have been contributing to Linux for
> some time and wanted to provide support.
> 
> [1]: Documentation/process/researcher-guidelines.rst
> 
> > > Tested-by: Kuan-Wei Chiu <visitorckw@gmail.com>
> > > Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
> > > ---
> > >  drivers/gpu/drm/tests/drm_kunit_helpers.c | 3 +--
> > >  1 file changed, 1 insertion(+), 2 deletions(-)
> > > 
> > 
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >
> Thanks for your review!
> 
> Regards,
> Kuan-Wei

-- 
With best wishes
Dmitry
