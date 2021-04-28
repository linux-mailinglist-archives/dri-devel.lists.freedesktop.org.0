Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1268B36D903
	for <lists+dri-devel@lfdr.de>; Wed, 28 Apr 2021 15:59:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41F436E2C0;
	Wed, 28 Apr 2021 13:59:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 111196EB44
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Apr 2021 13:59:05 +0000 (UTC)
Received: by mail-oi1-x22e.google.com with SMTP id z7so10911059oix.9
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Apr 2021 06:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=hkp8JPyq7iKOdx3agaKyk/nZwtc1iq2iKAqgAsmLo9o=;
 b=zkOrRMTj8vr++X/SyozrLDvCSxZvoFs44VJYVqI5/yijoEx0jC6XQpJZiFruyQT8Ah
 6QKKhJ8ox2SRg/T/O6428Iz9lC44qlHr5PTIyvx7Y0K6m4DdRNsnwT2TrdwUuPPwsHkC
 SMXZZmQSUTWS5HjM9vExRNvBxPArcV06t05tGm7WNcPMAsRy+1stb3wY9oxw4oGNIn4y
 rFkc+1MdwDxPW5Qcgve6MZ3GfZpErllMTncvT63GhchY9NGtmkE5ldrVoWKH9VCp0P0I
 e0vQgrWKC2b8ZCPWg4z+StCfsmb5JGE861cc6Hn3OlR1ENpJ8/+sGdHi98MrEuDuhXbm
 MVzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=hkp8JPyq7iKOdx3agaKyk/nZwtc1iq2iKAqgAsmLo9o=;
 b=gZoKuOYE7PkFZ5RP4Kr5Ut/ac8ud1Jsl8cAP0nQsTraj4h10LqFfDsGyREl6DzB7AZ
 fsxkn1kpK13JkmMe1B9jRNGk7RP8zCd1JTywTgAhu/4G7EMOXbgTqCoLv61ruBZCXnw1
 7YMldzsLfBvCG8R6FgE4kQ8Jw3oIxjpKE3yal1k/nrFr4bnxqLXzffJOc5PMP15UskXk
 H5Ddynhn1fz+Vnv+Q8fmJ7A1xAl9ILTeKiTiQvrXdb8KozU/IAonPXAWhwhfWjVyBN/d
 gq1JK6L1c7ptETHi7x1bo5Ibib+myyhG9QJ453Z8+015xNKq+JduCLT6lcBUmktJyUDL
 mIlw==
X-Gm-Message-State: AOAM531lxS4mBggllmoqD+ZHiTw2EKNWvNWk6UGsUYptZs4ytJjglsfa
 xNBiTA5yUnsyZ1RHyxZ1EkJFdg==
X-Google-Smtp-Source: ABdhPJyvGFX8lyxoyrN/Yr95YZIBqU4KcCqXVw71nLljBeqX2mob8YGKbLikMcFtRl/YDjTPxSs9oA==
X-Received: by 2002:aca:4157:: with SMTP id o84mr2920512oia.65.1619618344263; 
 Wed, 28 Apr 2021 06:59:04 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id i9sm11330otr.19.2021.04.28.06.59.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Apr 2021 06:59:03 -0700 (PDT)
Date: Wed, 28 Apr 2021 08:59:01 -0500
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v2 3/4] drm/msm: get rid of msm_iomap_size
Message-ID: <20210428135901.GK1908499@yoga>
References: <20210427001828.2375555-1-dmitry.baryshkov@linaro.org>
 <20210427001828.2375555-4-dmitry.baryshkov@linaro.org>
 <20210428024755.GJ1908499@yoga>
 <80622cc2-5585-abaa-42e0-cc6969ed6ae3@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <80622cc2-5585-abaa-42e0-cc6969ed6ae3@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, Jonathan Marek <jonathan@marek.ca>,
 Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <abhinavk@codeaurora.org>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed 28 Apr 08:41 CDT 2021, Dmitry Baryshkov wrote:

> On 28/04/2021 05:47, Bjorn Andersson wrote:
> > On Mon 26 Apr 19:18 CDT 2021, Dmitry Baryshkov wrote:
> > [..]
> > > diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> > > index 92fe844b517b..be578fc4e54f 100644
> > > --- a/drivers/gpu/drm/msm/msm_drv.c
> > > +++ b/drivers/gpu/drm/msm/msm_drv.c
> > > @@ -124,7 +124,7 @@ struct clk *msm_clk_get(struct platform_device *pdev, const char *name)
> > >   }
> > >   static void __iomem *_msm_ioremap(struct platform_device *pdev, const char *name,
> > > -				  const char *dbgname, bool quiet)
> > > +				  const char *dbgname, bool quiet, phys_addr_t *psize)
> > 
> > size_t sounds like a better fit for psize...
> 
> I was trying to select between size_t and phys_addr_t, settling on the
> latter one because it is used for resource size.
> 

I always thought resource_size_t was an alias for size_t, now I know :)

That said, I still think that size_t (in line with resource_size_t)
gives a better hint about what the parameter represents...

Regards,
Bjorn
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
