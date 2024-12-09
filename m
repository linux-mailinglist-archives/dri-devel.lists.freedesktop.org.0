Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30DAC9EA231
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2024 23:56:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72DAA10E362;
	Mon,  9 Dec 2024 22:56:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Nt8MDA4A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83C7B10E365
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Dec 2024 22:56:37 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-53e3778bffdso3470996e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Dec 2024 14:56:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733784995; x=1734389795; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=k3A1k+Apjq9O2ocS5a9hIgUNttSFxzpyEaBV4mfnunw=;
 b=Nt8MDA4AF3rD76KifKwwMt4wzBq0WUNC70fn3YLlRbuts+hxOfIx/YvR2b3lR1Z2xJ
 MP/OteHUovksNwmInwxMU2aML+dIB/QlkEPGqyElLDsyFxbTGS3VJSEdDuQNBXIKx28J
 +oDxrx1Mc1yj5x2/AuSND60Ez6sdLI3LcKGpshgEVPH2jrcx+mspF7lo7Y8UATb5cXy8
 xRyQE88vE3qTYngvrEDrgYP4g5b5YD3AWVv4fQrT6VrQwuHdW4lLEjRzbfqBA+tOsHq6
 DUOliQfTUGWTgS9MADjbNuAe5/5hSdQR8TsXfCNBjIFrYeuCmrcoqSe90BBzjonucw6e
 8gww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733784995; x=1734389795;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=k3A1k+Apjq9O2ocS5a9hIgUNttSFxzpyEaBV4mfnunw=;
 b=QNUUFbLNseK+L3pIifGTcMUoRxW4dzHiC+lSusjXbHdJ6EMmmduGxOisheCRPkUUuV
 x8LXNy4/xO/J76tENfFKPt0KVDfB4uRxqt3bBwXMQc3pl1B+n7deNkedT1LIH71ULiyX
 O2QUg45vo3nMwu6rqmbijM23i8Q1FOJEe7WfYYr6G4KMv2dsrKqSMfj3zMmgc45hzmc6
 M/8stiwSMKTafH2jNwJwFD/YZoFc/q/iQ5CCGe0oLUkaOFsKkzYEXHpO6O/Kgh+UO+F6
 kbvcvqQicvtVtKiRr9zQC6KbOEGQldRlMvsqn8ipwa7VDnyGYmOp9szolAMWImDn7WRM
 JMow==
X-Forwarded-Encrypted: i=1;
 AJvYcCUAc1lbddpeMHlw7bY6DjjoRG56ZNa2yLuX+7ou7jtW08mzTytF6N7FnrNX7oBmMo9BMb4tHy01vHo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzjRse1Glczc/IVCW5lzCDNXjeSW55rQxpf6RBjE3XlKl/ZApej
 TJ1/dkjsUe0zHy5OLNFd3qhY+RhLgfeBT/gI5xVDrA4F4V09WwnGhp0acOKSrKk=
X-Gm-Gg: ASbGnctQ2eE84l/9T6GqrlV1KexfUAxsbyrBmcn90FCEI0KKrtANouZplMHWsjOlIL0
 Mbm1r8TJusvCjQ8SXLj1On4u5QzNKEzPtDiaiQxC4JhF5UYPTiyU5ujI298wAFzv5GV81fYWQ6B
 JDoevWrfP5eASNnF+IvgRO5i8sgM5t4yvRH00jiJ2vp/UAQsgz9hcgEnSjo0eYv0qcjPtopRpUT
 bmW3s2onWFRUK/mB7CRel6allS7i3qcJEABvIsAvpLcJPRheqJCjplqP0/bJ19vQ6awE2Ex/+Eb
 CUD8kFDzfJy8qH4UsWLZUJxETDB32NPDag==
X-Google-Smtp-Source: AGHT+IHiXsoJOwZjiLBWplafOKbA1GHw3HlIwWuqcon2AqQvv21BwklgIEqY4mWvDfuXx6g/4hQk/g==
X-Received: by 2002:a05:6512:3a8a:b0:540:1b07:e031 with SMTP id
 2adb3069b0e04-540240d9a8bmr1013012e87.24.1733784995434; 
 Mon, 09 Dec 2024 14:56:35 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53e3115cb25sm1144888e87.56.2024.12.09.14.56.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Dec 2024 14:56:34 -0800 (PST)
Date: Tue, 10 Dec 2024 00:56:31 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] drm/msm/dpu: filter out too wide modes if no 3dmux is
 present
Message-ID: <ouufiq72x46hxmatao6xyjbb4qk527pktowqpsutlu63sftwyu@uupkodk5ty4b>
References: <20241209-no_3dmux-v3-1-48aaa555b0d3@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241209-no_3dmux-v3-1-48aaa555b0d3@quicinc.com>
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

On Mon, Dec 09, 2024 at 01:18:36PM -0800, Abhinav Kumar wrote:
> On chipsets such as QCS615, there is no 3dmux present. In such
> a case, a layer exceeding the max_mixer_width cannot be split,
> hence cannot be supported.
> 
> Filter out the modes which exceed the max_mixer_width when there
> is no 3dmux present. Also, add a check in the dpu_crtc_atomic_check()
> to return failure for such modes.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
> Note: this was only compile tested, so its pending validation on QCS615
> ---
> Changes in v3:
> - Move && to previous line
> - Link to v2: https://lore.kernel.org/r/20241209-no_3dmux-v2-1-fcad057eb92e@quicinc.com
> 
> Changes in v2:
> - replace MODE_BAD with MODE_BAD_HVALUE to indicate the failure better
> - Link to v1: https://lore.kernel.org/r/20241206-no_3dmux-v1-1-72ad2677a323@quicinc.com
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
