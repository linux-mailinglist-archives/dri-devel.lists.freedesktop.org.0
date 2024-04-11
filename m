Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 979428A1FF7
	for <lists+dri-devel@lfdr.de>; Thu, 11 Apr 2024 22:15:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 296FD10F324;
	Thu, 11 Apr 2024 20:15:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="cAmvNoCO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB05A10F327
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Apr 2024 20:15:37 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-2d88a869ce6so1901551fa.3
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Apr 2024 13:15:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712866536; x=1713471336; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ONM6qGXwZNOSTTCELomosW3dBjUNpoKKkgP2gKgU2NU=;
 b=cAmvNoCOzHCud9hCr8BikUixtAplDpQDDKUTi1IuVuZ5kDIHg4Aj+f0uTcKZoxq/eR
 oOTgNXhY0XaGep6pAOzABmW1x0W/6sjUyekVyh72c5rEM2cFpfWVnAFna2smiMGrbXGn
 nPsiY+YEZN+mPDXrFFjPs09qKXNF1wxXUWVyJzR2i2MznWp/NPsUqjRiEWHH9tT4/1sv
 bYSAttWM/WkPfUe3A/s23o4efHFD5yayGt9mHSYGk4EwdljOSW6wzMmfqnQDgAaCirSH
 zBtuwDqRpJL3SUrDsAaWaCgFatB/uUt95qgCujGcwL48vOHSLvW+ElmTPwJ5YQdXF8Jy
 AY3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712866536; x=1713471336;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ONM6qGXwZNOSTTCELomosW3dBjUNpoKKkgP2gKgU2NU=;
 b=YcEjJtz2XxAxdKWkPszFfVjXMk/W9VGTD4vCcq2O9tAd1t4PdDlEvpWlcVfGI0os5u
 KvbS/+sAepmIBGuxz5WpY17jrqn56zsLqPnPX/83XZ/bzksC03pqHnbYCMNt2mKHS6G2
 3TqPpjxfNT+qNid0wqaIHOUQyfscAg5sjlPc3NiP+57HjIq1gEeJYyOmtxQl+G0c34I4
 APgG7ws8n3zzbjmzkMI3gJLZ26DB7JXgioEif6NYqP/21Jx1wcz2gp7r4WXIviCGGZDq
 66i+K+bHkvKo2gnLURthlAAxp0icLx/5pFQVCxrQLWY0CpvyZlOMV6qI/Osom1tURLzU
 nt3A==
X-Forwarded-Encrypted: i=1;
 AJvYcCV6B2QL+9wOJULblhsyBiCSq5tKe8L1ih5UcD9Zca2IzA7gMJy77xsP2bRbKYInkO3qUOm6XbipSRaXYrnWiyUQqAq4rvH+l1dH4Fn+7qSn
X-Gm-Message-State: AOJu0YzXviVq9L/zTzIgfbVenkG1ldWhHfRYsouY+A+1OSmQo9wP0X4I
 yI3tlVuyVoLnsV8pORyFcj3upQNixXs4mtR3oJU5q6aqXZ13V6RRHk/hHzphrms=
X-Google-Smtp-Source: AGHT+IGdsNyIbOa4XLU2eXBzW61Cn7sodgybJ2C0I8mwkFnwb0pHkGP0/sxnafUxIWM79J9A5u/+RQ==
X-Received: by 2002:a05:651c:104d:b0:2d8:dd28:8748 with SMTP id
 x13-20020a05651c104d00b002d8dd288748mr503632ljm.1.1712866535697; 
 Thu, 11 Apr 2024 13:15:35 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
 by smtp.gmail.com with ESMTPSA id
 e8-20020a2e8ec8000000b002d860a40f9dsm302300ljl.136.2024.04.11.13.15.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Apr 2024 13:15:35 -0700 (PDT)
Date: Thu, 11 Apr 2024 23:15:33 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <quic_bjorande@quicinc.com>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm: Drop msm_read/writel
Message-ID: <jpy7kei47tqbkoqzwz56ibxi4bexecxja3kb4tvqaxub4warix@wu7ita3nrjjz>
References: <20240410-topic-msm_rw-v1-1-e1fede9ffaba@linaro.org>
 <bwhfcobfkddhw2jdj6orvtbejap6ast7njahkbggj6lpelibqi@ae7357lpepmf>
 <ZhgBWv5BjDvQbWWi@hu-bjorande-lv.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZhgBWv5BjDvQbWWi@hu-bjorande-lv.qualcomm.com>
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

On Thu, Apr 11, 2024 at 08:27:22AM -0700, Bjorn Andersson wrote:
> On Thu, Apr 11, 2024 at 04:31:41AM +0300, Dmitry Baryshkov wrote:
> > On Wed, Apr 10, 2024 at 11:52:52PM +0200, Konrad Dybcio wrote:
> [..]
> > > diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> > > index e4275d3ad581..5a5dc3faa971 100644
> > > --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> > > +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> > > @@ -12,10 +12,10 @@
> > >  
> > >  #include "dsi.h"
> > >  
> > > -#define dsi_phy_read(offset) msm_readl((offset))
> > > -#define dsi_phy_write(offset, data) msm_writel((data), (offset))
> > > -#define dsi_phy_write_udelay(offset, data, delay_us) { msm_writel((data), (offset)); udelay(delay_us); }
> > > -#define dsi_phy_write_ndelay(offset, data, delay_ns) { msm_writel((data), (offset)); ndelay(delay_ns); }
> > > +#define dsi_phy_read(offset) readl((offset))
> > > +#define dsi_phy_write(offset, data) writel((data), (offset))
> > > +#define dsi_phy_write_udelay(offset, data, delay_us) { writel((data), (offset)); udelay(delay_us); }
> > > +#define dsi_phy_write_ndelay(offset, data, delay_ns) { writel((data), (offset)); ndelay(delay_ns); }
> > 
> > What about also inlining these wrappers?
> > 
> 
> But that should be done in a separate commit, no?

Yesm of course.

> 
> PS. Too much scrolling to find your comments, please trim your replies.

Ack. I'm probably too used to GMail and Thunderbird extension which
collapses quotes.

> 
> Thanks,
> Bjorn

-- 
With best wishes
Dmitry
