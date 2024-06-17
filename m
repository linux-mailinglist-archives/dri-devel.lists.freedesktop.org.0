Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20C5E90BF86
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2024 01:09:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDF5910E1BC;
	Mon, 17 Jun 2024 23:09:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="M4uK4b3A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5B0010E1BC
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 23:09:49 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-52c8c0d73d3so5197247e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 16:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718665788; x=1719270588; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=XTBpYs+rHA9ZGRXubRjFNJr2hj3dD85kNn0beF2XoaQ=;
 b=M4uK4b3A8ahys6PfQH//lLX3L0gXlAlnk1hc6mqIpsC7Uy8dA+9aRVx5m04aRo6x0U
 USk7n3SCAByNgsmvnxs3hZeX0mXp8nGip0bPeX6os3J5LQIb+NbSIObfGz+7ipySQQvP
 3FIwT0EFrVwXpsrV3XqmC92wV9ZR51WuWZ77nsq425jIX3sRu3k46/vVU4VrSpdwMmOy
 Z85T2qir+tWfk59TPLBvyxq6pdHrchOmrpjaEux9gDj9WlzMYmebveHldZdIjVIl8NKZ
 RDE4+Eo9RjgiTDHSci4cD+mYVihwD8t+yIpXz9W3OVvaE5WQAWGZtjp3wt+ZkGo50VuK
 A8ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718665788; x=1719270588;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XTBpYs+rHA9ZGRXubRjFNJr2hj3dD85kNn0beF2XoaQ=;
 b=OPQGD1CceyIelE6pE0pqwX2kobyOa60tKBqSiQiagv+lYo96ZBSUy7j3DW8d7KJKqv
 +zccKYuOjNkWF3cqi4d7GebTQElsr36UBNbmOySpy05ncC3jRJ+0/2Ci6jpKS3YX82d4
 zbNtyf0V4gnSdKDo6G31HDl3P30PZCrVNIkauS1kIhALBJShICsikxDh99rEqCzOZvMp
 PUKsJX+MaEs9cVWAmbWENFSrD+7XXAOcn+BOPUZdMG27ibwCmpzlh2yt36RsqE0VLdbh
 CvaCQ0IiMPK/4kNY0eNleeeavm+qcSRmq/XfOCROZy9f0P5ygUx650Y5NUaDo8TmaYab
 Zzgg==
X-Gm-Message-State: AOJu0YzRd+SYFp2BEuw2a8ZHmKsCdnY3SbetD61Hx4b+YOYOtgAmdJX/
 GsKFsnvCgpKyNPLRanw2PSag8u4rJECN+kKbHTH8uTejcy7Vq7JOWi9fDXc49JA=
X-Google-Smtp-Source: AGHT+IHTs0fDZAR1ej9emSR23TPH1XNYZwIBJEMQjpG8ZC6EL1ncHYC1rF1ka09GwUmaY8K9cohTjQ==
X-Received: by 2002:a19:5e13:0:b0:52c:9d68:7443 with SMTP id
 2adb3069b0e04-52ca6e56429mr5823534e87.1.1718665787866; 
 Mon, 17 Jun 2024 16:09:47 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52ca2887f0asm1397246e87.265.2024.06.17.16.09.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jun 2024 16:09:47 -0700 (PDT)
Date: Tue, 18 Jun 2024 02:09:45 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, Rob Clark <robdclark@chromium.org>,
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 1/5] drm/msm/adreno: Split up giant device table
Message-ID: <wylta64t7tje2ezvcc5joyayd5rdghyxzvjbukibqeujljcnvo@ivob3zlbw3we>
References: <20240617225127.23476-1-robdclark@gmail.com>
 <20240617225127.23476-2-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240617225127.23476-2-robdclark@gmail.com>
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

On Mon, Jun 17, 2024 at 03:51:11PM GMT, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Split into a separate table per generation, in preparation to move each
> gen's device table to it's own file.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/adreno/adreno_device.c | 67 +++++++++++++++++-----
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h    | 10 ++++
>  2 files changed, 63 insertions(+), 14 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
