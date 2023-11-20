Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CA177F0D6F
	for <lists+dri-devel@lfdr.de>; Mon, 20 Nov 2023 09:24:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CC8810E388;
	Mon, 20 Nov 2023 08:24:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EE8E10E37D
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Nov 2023 08:24:48 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-40853c639abso13902015e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Nov 2023 00:24:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700468686; x=1701073486; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=LiwLz7rgORSXU5ZDowGagc2wpV+uTLoI4pnI3SOTIak=;
 b=aBgM2CXGGYAyyiC/86W6lA4q7BUo7uqJRH7OG9UdQLbWAYWGRVOueG3PnqGDUumfAT
 ZX20PptvwatP/c7s0b7WEQ1m5XFuF4cJYhVZNIAKzfnuiorG+u9B0dseH/56seIQGzrJ
 eJzuP/c76lmJ360ZSPjJhIUkPsriqQ3VG+UibGX3nM1x8xyO2rxnI4/gNznyO6OktHyh
 lzCfUKBejU/pOmxmH7INs20WeP6tHiIA3nRx3TkmxnGSyxFnsSyH37trSlUO1ljdFmww
 0+gMOOOTPKTb45FuWXwcITRKKqtSUv4mzBle43FS9zUunUI81E4cSXrBBa0qkgtj2A2a
 7G1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700468686; x=1701073486;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LiwLz7rgORSXU5ZDowGagc2wpV+uTLoI4pnI3SOTIak=;
 b=qODUr+GzbeMqSnURN0P9exHid+1CF7k31juf3wWV5PiRCBIb8bX/wh2I04hI7VnTmK
 kfVWrKTy2BJN6kjQSibUDUwxS8TMK0FEpPvOosRGGdrgLP+ld7ZSzxBSxsSaaM8ExUbW
 kiU7rpX0QQiYFUP6HBqrcqJVG+VNz0hUEWO111v72fYnyxLXI4KAj1eQ0lX6SFMsPlHs
 iV+uAzkbCkFgPQMktxNaBz/ETeh1Oo8iXSi2qi5/7PXd38aYiR3u6Ug938rxXs1GMulr
 YikvXMAjWK9FbI7W0Jy2RPId9gX3lKs1Jt9AYi7EmJSLqxFwhb6UFN8dHZlhrXrCAcwp
 t91Q==
X-Gm-Message-State: AOJu0YzaQ2phuPd2CWpJ4eXAMZYEuVlDeo/RG5QU5rVuPt2NZmaeTtyo
 I2j8fuSNS9QTgIFc2zlnA1kpxA==
X-Google-Smtp-Source: AGHT+IFLuFWYBRvyWcbXSNal7y2L0gxiFMY6jL/MShNjQA43ddXnWWdRUS33btuzM+seVvagiGyBaw==
X-Received: by 2002:a05:600c:3504:b0:409:5a4e:512b with SMTP id
 h4-20020a05600c350400b004095a4e512bmr5583059wmq.18.1700468686642; 
 Mon, 20 Nov 2023 00:24:46 -0800 (PST)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 bg3-20020a05600c3c8300b004077219aed5sm17387903wmb.6.2023.11.20.00.24.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Nov 2023 00:24:46 -0800 (PST)
Date: Mon, 20 Nov 2023 03:24:43 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [Freedreno] [PATCH v2] drm/msm: remove unnecessary NULL check
Message-ID: <23209856-0459-49bc-99d0-cab66e1c098a@suswa.mountain>
References: <ZSj+6/J6YsoSpLak@kadam>
 <095b7283-3555-cc38-a73e-83efec8a9bf8@quicinc.com>
 <62943ca3-26ac-8712-2caa-102dc98f099c@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <62943ca3-26ac-8712-2caa-102dc98f099c@quicinc.com>
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
Cc: Su Hui <suhui@nfschina.com>, freedreno@lists.freedesktop.org,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 16, 2023 at 01:05:52PM -0800, Abhinav Kumar wrote:
> 
> 
> On 11/1/2023 12:23 PM, Abhinav Kumar wrote:
> > 
> > 
> > On 10/13/2023 1:25 AM, Dan Carpenter wrote:
> > > This NULL check was required when it was added, but we shuffled the code
> > > around and now it's not.? The inconsistent NULL checking triggers a
> > > Smatch warning:
> > > 
> > > ???? drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c:847 mdp5_init() warn:
> > > ???? variable dereferenced before check 'mdp5_kms' (see line 782)
> > > 
> > > Fixes: 1f50db2f3e1e ("drm/msm/mdp5: move resource allocation to the
> > > _probe function"
> 
> A small error here. Its missing the closing brace for the Fixes tag.
> Checkpatch cries without it.
> 

Sorry.  I must have accidentally deleted it after I ran checkpatch.

> I have fixed it while applying.

Thanks!

regards,
dan carpenter

