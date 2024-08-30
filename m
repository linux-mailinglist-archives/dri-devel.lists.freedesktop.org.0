Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 995039667F7
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2024 19:29:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 836CC10EAB0;
	Fri, 30 Aug 2024 17:29:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="p9m4Sa52";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A311A10EAB2
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Aug 2024 17:29:48 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-5334adf7249so2842252e87.3
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Aug 2024 10:29:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725038987; x=1725643787; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=gKq8Bys/USH6KZ1qBw1qwYVQ6z8sgBRiOI37jtuxbtw=;
 b=p9m4Sa52K/mFzYacUrkpoSVXLgtQIisS21b0VlN6DN61TNlUvntzoo8Xspodb469qM
 +8hamXvnPXxsn4UI9fibaL855o1wPhJL+EY6e8yYHZJdBvAu3r7Be3iNt0amJLW2NeqM
 KoaI9i/lXUxYhY9bUwU0ZSpWR04rZS/MGF9HZOgfU5DrLfpjIm1zfhgz0taD28528bdr
 8mi95iL4+YD+rKC2YS9nj8VEZYD0kXjV2aauGQwoYC/CIAtRQ7V18wgVt/FO5i3hxQIo
 57Pvm0MsB0dnazzhZUXVMP0VwWyu1qzZQ9nBBUyyx7pyHY6mAw9wXF/yF2Di7j9hYC0V
 n7tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725038987; x=1725643787;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gKq8Bys/USH6KZ1qBw1qwYVQ6z8sgBRiOI37jtuxbtw=;
 b=w5mQawcwKwmSjniMM7J488ny0LEBwSK3c6NH+HkRO1JkE4QvQ5sPbgyo6v8Vogn/l2
 GfOs8HqypmQrN0ek/nnSmXvF6OSHGvec36OBT9ckv2BCvyqXYz86deXEmPhS9dMDwDsw
 rPyVOv0XJvFgo9P5JAYWZFfTHvSpuMPWwkLFjBoJRjE1GjxITrCpMhJJYSh4mC18exLz
 LQCshDKD/VMDtq6YKtEFYjKK0srJ7ZKaEjbmezPxaryJRhge1YBNp2q2S/Xn5kMjPMeg
 L+75+VMwVV31k6n2u5f+NGl++k8jhJEpq6k2hTXTFEwU3wCWBsJ8xrLEeEIbyPvBSJP4
 vw/Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWC3HqhMmHBETNYOCQcQ95k3TnEnXvPWM9NxjDvHxMop1QWlDcN4fsM2NlBZxUAO4TLYptQzBo+XXc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz19w9tpsp0WQs6hliZwcSnsyhUcWroRKtXW+yvRkjY4fuU2KWr
 ow8OI22eN4tIpPAm58L7Oxym/wj2k90lX797e5IwGrXhpKLmhG4PEM0NRZKA8zA=
X-Google-Smtp-Source: AGHT+IHxxcADvc+QZ/22lw1wDm/AXNztt8D4qol0EtkLRXo6WdtzvIw9t2cOGwGJz4GOWOGI05INZA==
X-Received: by 2002:a05:6512:2344:b0:533:48c9:754d with SMTP id
 2adb3069b0e04-53546b41e00mr2294513e87.34.1725038986104; 
 Fri, 30 Aug 2024 10:29:46 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5354079babdsm693823e87.50.2024.08.30.10.29.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Aug 2024 10:29:45 -0700 (PDT)
Date: Fri, 30 Aug 2024 20:29:44 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, quic_abhinavk@quicinc.com, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, quic_ebharadw@quicinc.com,
 linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Clark <robdclark@chromium.org>
Subject: Re: [PATCH 16/21] drm/msm/dpu: Program hw_ctl to support CWB
Message-ID: <vsg4izby2zjcdtkwteti6by7sl5rwddzqw32yhnevhobgmy6cg@hx6n7tthwj5l>
References: <20240829-concurrent-wb-v1-0-502b16ae2ebb@quicinc.com>
 <20240829-concurrent-wb-v1-16-502b16ae2ebb@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240829-concurrent-wb-v1-16-502b16ae2ebb@quicinc.com>
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

On Thu, Aug 29, 2024 at 01:48:37PM GMT, Jessica Zhang wrote:
> Add support for configuring the CWB pending flush and active bits

Details are appreciated.

Other than that:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        |  8 +++++-
>  .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c    | 13 ++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c         | 30 +++++++++++++++++++++-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h         | 14 +++++++++-
>  4 files changed, 62 insertions(+), 3 deletions(-)
> 
-- 
With best wishes
Dmitry
