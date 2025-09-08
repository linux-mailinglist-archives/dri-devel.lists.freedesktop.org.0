Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 938EDB49AC5
	for <lists+dri-devel@lfdr.de>; Mon,  8 Sep 2025 22:13:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CCE410E5C5;
	Mon,  8 Sep 2025 20:13:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="wqew6vJD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D385110E5C5
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Sep 2025 20:13:32 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-45de6415102so12284975e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Sep 2025 13:13:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1757362411; x=1757967211; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=TjQF8MEPMgDzmscFxLHUpNxl27btwEAppQf99DQwIiY=;
 b=wqew6vJDnsqSt+lYGHfrG9qBxpJKbL3H6WLom4s0CCfMaj0F8T/XfkSjPrvy9wX3xz
 zjTp2OmOV5b7nmjk1+yt9BM48mX5aNrp9cUWMjB4s7mSkEg8r1NaSTqlehWXKyPIXVlp
 hnF1WbzvBracCECqFR6GnavdUKY2duUQqi+sgHX987O9N8iD3I7TuEjvy7c38Ve1mvQ5
 a73FYpTJCiDkU2mBReULXYq+gIAhrltXMXlcON0KH1CLiE+PWe1p+Xf9VnQaiW2cTwMz
 n8pkAD6HltEkeQiZ6BaqmSQfH16gw9pPTbAU8eAWVVoAW9m+2e0XA+mD8HBvhH/7MLnQ
 wuyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757362411; x=1757967211;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TjQF8MEPMgDzmscFxLHUpNxl27btwEAppQf99DQwIiY=;
 b=mZKRxGP3RxIAQonP4OEqW87qntKldgPrsOLGens2B2d6mcDbM1QtTpGteJTP6hSMeb
 w+jnbs0NtFQNM5vzTS9wlFQ0RbY9s6hGfFbxJGO/SWScKvaIX5ZxNboMC0MIUOoJE/kd
 L5nuNC/9bC3LigzpPVwh0XVal+CR199E0bbtfgUilYNxVqwSVMEjxJN6JNbB1NOBcjZo
 ZrrcD5pRVEiGuiwf3EfboGRNQYT1ScjkAGFo48QoOzMVNq2xxJGTYK5cL9H2UoZwyDC6
 M5O7J3F30jTk9yckLqoy5Cqa3FHg99sqSvhdkiHj2AcG2GsKtG1ZmWIZ9IxTBaMM3AjA
 hskw==
X-Gm-Message-State: AOJu0YypqpBVs3KoCZ22sXhhr0EkJ7RLGAC/okTGJYFcbQQF+u8dvc77
 WnDl69GxsGO+1vfDWUzJZRf3pRTxIfAnQuOtmcNTtkBiSLRwYsdYN3jCGP4ruXkGUYk=
X-Gm-Gg: ASbGnctIpKnDXf3wMmreNNahXwBv2ioLQRsXx/jwd9fo2K8SPxUf64PhvXDRnUycS8L
 AzwMSMmI2s9mrbrpvABIBomX6uUmrpOijcrBh+Xmzs8Nj1LYOs377Mb3ZuB7Phv9TUFuOgavhvS
 cW7TCzGya7rxYbQkKHoYP5Lw+QoTudeagQzGpNV20eXv28T+dF44lfJjuBn6dN1gIT0vYCfM7fY
 1mrdyKw52QCeDL/cEa0wALOgZjq4oIi18XfV/ADNfqRPFHuaNdr7+KTE1Bw8oIjuRp67rqwEq12
 eeGbN6vRA/EEca3jJGebBsgOCFrHvhuqJI2g9HeZ4cL2gHHfeXpqCqi/BMzCd04gf1Nm1Wh9Utj
 3JYgDiixriGty5EAXBDU6trgGioI=
X-Google-Smtp-Source: AGHT+IH2S6DZLgcA6WbZUS5d4fwJF/p74eh++HiSAyF/xlOaTTIERGEw/RW4yG1aDpRZ66hion534Q==
X-Received: by 2002:a05:600c:3112:b0:45b:47e1:ef67 with SMTP id
 5b1f17b1804b1-45ddded3dfemr74710845e9.34.1757362411306; 
 Mon, 08 Sep 2025 13:13:31 -0700 (PDT)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-45dd2304e16sm204349345e9.7.2025.09.08.13.13.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Sep 2025 13:13:30 -0700 (PDT)
Date: Mon, 8 Sep 2025 23:13:27 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Lizhi Hou <lizhi.hou@amd.com>
Cc: dri-devel@lists.freedesktop.org
Subject: Re: [bug report] accel/amdxdna: Add ioctl DRM_IOCTL_AMDXDNA_GET_ARRAY
Message-ID: <aL845xEFWNzq4_2A@stanley.mountain>
References: <aL56ZCLyl3tLQM1e@stanley.mountain>
 <3a4cf9a7-d2ec-2c4d-fb9b-5beac251e86f@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3a4cf9a7-d2ec-2c4d-fb9b-5beac251e86f@amd.com>
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

On Mon, Sep 08, 2025 at 11:19:33AM -0700, Lizhi Hou wrote:
> 
> On 9/7/25 23:40, Dan Carpenter wrote:
> > Hello Lizhi Hou,
> > 
> > Commit 2f509fe6a42c ("accel/amdxdna: Add ioctl
> > DRM_IOCTL_AMDXDNA_GET_ARRAY") from Sep 2, 2025 (linux-next), leads to
> > the following (UNPUBLISHED) Smatch static checker warning:
> > 
> > 	drivers/accel/amdxdna/aie2_pci.c:904 aie2_query_ctx_status_array()
> > 	warn: potential user controlled sizeof overflow
> > 	'args->num_element * args->element_size' '1-u32max(user) * 1-u32max(user)'
> > 
> > drivers/accel/amdxdna/aie2_pci.c
> >      891 static int aie2_query_ctx_status_array(struct amdxdna_client *client,
> >      892                                        struct amdxdna_drm_get_array *args)
> >      893 {
> >      894         struct amdxdna_drm_get_array array_args;
> >      895         struct amdxdna_dev *xdna = client->xdna;
> >      896         struct amdxdna_client *tmp_client;
> >      897         int ret;
> >      898
> >      899         drm_WARN_ON(&xdna->ddev, !mutex_is_locked(&xdna->dev_lock));
> >      900
> >      901         array_args.element_size = min(args->element_size,
> >      902                                       sizeof(struct amdxdna_drm_hwctx_entry));
> > 
> > Instead of min() here we should just return -EINVAL if they are !=.
> 
> The request element_size from runtime tools can be smaller or bigger than
> sizeof(struct amdxdna_drm_hwctx_entry).
> 
> If element_size is smaller, element_size bytes will be copied to user space.
> 
> If it is bigger, sizeof(struct amdxdna_drm_hwctx_entry) bytes will be
> copied.
> 
> And the actual element size and number of element will be returned to
> userspace.
> 

This is a new API.  We should be strict about what kind of inputs we
allow so that if we want to in the future we can change it without
breaking things.

Supplying a larger value is not useful at all.  We should return -EINVAL
for that.

I'm guessing userspace already takes advantage of passing a smaller
value but it's not documented why this is required.  My guess is that
maybe at times at times we just want the ->context_id or something?
Maybe the first three members of the struct?

> > 
> > 
> >      903         array_args.buffer = args->buffer;
> > --> 904         array_args.num_element = args->num_element * args->element_size /
> >                                           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > These are both u32 values controlled by the user so this is an integer
> > overflow bug.  Security bug.
> 
> This will not cause an issue. array_args.num_element is considered as user
> control as well.

That's true.

> 
> If it is too big, the actual number of active hwctx will be returned.
> 
> It is better to put a reasonable limitation. I would add a check
> (args->num_element < 1K && args->element_size < 4K). Will this fix the
> smatch warning?
> 

Yes.  Anything which prevents an integer oveflow is sufficient.  Thanks!

regards,
dan carpenter

