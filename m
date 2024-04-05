Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54EDA89A2D5
	for <lists+dri-devel@lfdr.de>; Fri,  5 Apr 2024 18:47:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5E3A10E685;
	Fri,  5 Apr 2024 16:47:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="OCYzMNuR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F1A2112C29
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Apr 2024 16:47:00 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-516cbf3fd3dso2664193e87.2
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Apr 2024 09:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712335618; x=1712940418; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=zjZDXXK2zwXeuxbCY+k8mNYZHEoQ+bEUvt9cCenwnEg=;
 b=OCYzMNuRFfXPIKsBQVBjBhpW0LDkrvoDc3JQOxZr4PiT+gBYGXRsg9mo8gN6/vrBIE
 C0e5Fci843G6VQVdBBWkHizwBcXHbR/2cJxnEVBnjDlpMK8WHvNXkMYhOZuUMsOqXHMN
 GB593VDME7GPbPQ3VJ9FgAH1SHu16cHtnEI+Rjkt4DQ26vpXGUR0n6iswW6U8qcfGlkX
 Vj20NLUt4JhFd8eJ6F3j3KWaqFzayfUCl8x5Jd4LFIAT20ZjUWm2sYI3jrlKYXgCnjuN
 sbzvM7HZW/VyNUh7iI1K7XwBw63CyBXwoYcAM+WcJ7GU7HHf4ENwzQyKXTLsNOU4P8tP
 ZQ4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712335618; x=1712940418;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zjZDXXK2zwXeuxbCY+k8mNYZHEoQ+bEUvt9cCenwnEg=;
 b=RQGQhWbjDfKls93mHZ2ZKz8aI7DWgAxt3voyGHVM7jUuVWlYSV6+xqOrmnbO0wcF6I
 oZPcRLId5xSsCSQ3kcjkn5ctVTbjcwECa6BHmtjjqm9O01sDSXM1BaZ+vEfUyu0QlrMv
 e8GvNUonJ5hTpf61L+UdLYH9o7TQ4JpJHVFt6+L1IriPbAvszsOEJl+7VxQ9bR0sw/eC
 7/cwnNkfOxkpGMXVbyuEs4dye2I2wZ3zBjXglM/uVbMPZi1ciMemuPhpzGQdgQJ0B+4z
 qC39Cb95sb51bpUxtPJ7lc383J6smDISHVHZvWVUpWmgphffwiUJu2bj9xaqmY6VzT/U
 ACMQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXAaThM0SU0tyuyXET5vhyVh+GCL7+/kEXWNsz2e7dJo+ndJozcfkEG8I7LVNSF2OwFq52hJn39j8MRIOR0COGq66iUvfkg5xtWRVHO56p8
X-Gm-Message-State: AOJu0YzvD9wgf9mAYpNOfl/uhJCdFzX2U1+BhvETlYGoip+RlfI5XMTy
 V5z0bKubuVetKyg/o2YN1OT4gZwxkK9RTN83rBOpQr8EGuQTGQJBy1ytsI3CMQI=
X-Google-Smtp-Source: AGHT+IFufXZNeav0WseEY6nRjlxRZCZWJPm4KsDfy/VrMhHziMpaWAR1CqPIEOMNojFKUGoxkwK9tw==
X-Received: by 2002:a05:6512:224d:b0:515:ab92:6a82 with SMTP id
 i13-20020a056512224d00b00515ab926a82mr1791982lfu.17.1712335618108; 
 Fri, 05 Apr 2024 09:46:58 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzyjmhyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a00e:a300::227])
 by smtp.gmail.com with ESMTPSA id
 r14-20020ac25f8e000000b00515c8ff6f52sm231480lfe.229.2024.04.05.09.46.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Apr 2024 09:46:57 -0700 (PDT)
Date: Fri, 5 Apr 2024 19:46:56 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 Helen Koike <helen.koike@collabora.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm: ci: fix the xfails for apq8016
Message-ID: <oakh6gccuho2zq6aaaydq4hucz2ueuayo6qpq73uaw7ljt4gu7@haz3kdjjy7hp>
References: <20240401204859.24223-1-quic_abhinavk@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240401204859.24223-1-quic_abhinavk@quicinc.com>
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

On Mon, Apr 01, 2024 at 01:48:58PM -0700, Abhinav Kumar wrote:
> After IGT migrating to dynamic sub-tests, the pipe prefixes
> in the expected fails list are incorrect. Lets drop those
> to accurately match the expected fails.
> 
> In addition, update the xfails list to match the current passing
> list. This should have ideally failed in the CI run because some
> tests were marked as fail even though they passed but due to the
> mismatch in test names, the matching didn't correctly work and was
> resulting in those failures not being seen.
> 
> Here is the passing pipeline for apq8016 with this change:
> 
> https://gitlab.freedesktop.org/drm/msm/-/jobs/57050562
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/ci/xfails/msm-apq8016-fails.txt | 13 +------------
>  1 file changed, 1 insertion(+), 12 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
