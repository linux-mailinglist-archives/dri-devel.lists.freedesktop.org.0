Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CA24AC2A91
	for <lists+dri-devel@lfdr.de>; Fri, 23 May 2025 21:47:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF6FA10E867;
	Fri, 23 May 2025 19:47:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Q5aK1sAy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com
 [209.85.166.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B07C710E864;
 Fri, 23 May 2025 19:47:17 +0000 (UTC)
Received: by mail-il1-f173.google.com with SMTP id
 e9e14a558f8ab-3dc73b1bd7aso1579915ab.1; 
 Fri, 23 May 2025 12:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748029637; x=1748634437; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0xTx5Tkcc4tAifmBrsylr4nsmEii+zQ8+Jh8552iEWQ=;
 b=Q5aK1sAye7jDnoUP7XQvk2NRYJ769JgKt8ypx3LYOUfnNNTWIVpuufrooAS6w3DIqk
 oJjhW3Ysny4SnQUd0/ZAd7WASkCtRiz6/wHZwdlVQrh0HGU0bJnI6ZCB3RgmX/2aKmeF
 9w7P3Ty1U6G3UMWURzI8Fd/2bybG12UTS8v2HjyfPstggsdR1xGZk97yDxvtLcnjq5ZC
 6BlvgycCB1cDPATI7MvrBOF3VRUde67Gdw426LIh/d34t6hy3O7uzgYR8DiIwBfoq4sl
 WgdjviYKyZta+TQQCIpCMZBM23tgYXTt+d392f5ftzKfpuvX6pbnY8nPu6NkYUMXfn0J
 sR4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748029637; x=1748634437;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0xTx5Tkcc4tAifmBrsylr4nsmEii+zQ8+Jh8552iEWQ=;
 b=Nqpz1CCWe/O5h51WLrpBSVOKEGOhmzd83NdxUg1QCvjax+dAUORwVjTQ4p8ak01p4o
 U13i3mCLtNsJqwCqS3G87O+JApDKwgSPaVc3XF5Kz0iV34GBiyfIrHXtH1MRJc5Nhq0F
 L760lm7dFkoAQ3iQcmVwcfhF/Oscc9AXAhIECwl7H72TF7uRKcLckIL4D2UxJRDodmo8
 k+m0dFFsNBQYohIUpVEcb4LNN9gxqvqUvDxr67dM2idRwnzXVInrIziKEqCM03b+H1l7
 ZbT5F6dMi+jLrxf9U2zfumaR7FVM5sAf+FFboafVVRvvEAri/GezUePR5Qfh9TZJjY4n
 20Jg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX1v3qaY6qi7gdnOwVGx/VEVY0USIos0GgTJ1rH+IJ6REzQL2/JnIBN+FTo17Nj3AHlNYm6p1DYg3k=@lists.freedesktop.org,
 AJvYcCXs7p9xBtFaRS9RpTmjmQQHiJCh9oyeCUszQu6cSZbPT3kTA2noelLPQNA23+2OTSGittRyoJTr81kV@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyoVJcJNEAHJre+tMeP+levMtxMAE2xEPNdRwB6g4MOtX60Ovlh
 xGV/5ybpheFJLdKKKoK80XU8C6wuQsUCeRvEqLPS4ktF/zJUQYDGAdmqCUhPWop35Dsh4tQgMeP
 +cHM784pB8cKudh/UIdQIteEnnWx9I7o=
X-Gm-Gg: ASbGncu4ZYBXQDNeqdIlSj4D+KQrKXZQLtBgU3uFe12BPsMtZKhqtahCoCSsKzqq9Ps
 CdV/w+dbsOt+jT/NFxEDa61k9gwQFARsa4MS4YUdx0ufI5PunyOaKKyWbbcL+Wx1ZnHio2bI55L
 mkgju80CZjDOfOCKx/fZI+pH8E+VOS09uS1Gql0lKHZ8ySyun5Z0PdadadPoNBo/w=
X-Google-Smtp-Source: AGHT+IFWDje6NNTquxxAPXwoxMyqNzaxL2uF7sc0xx1f98VZW5+HEkKLTmIJ4UiMx/tbe6xDWDKiVZOs4DRHe2tC0YA=
X-Received: by 2002:a05:6602:481a:b0:864:68b0:60b3 with SMTP id
 ca18e2360f4ac-86cbb8c26efmr90424439f.12.1748029636788; Fri, 23 May 2025
 12:47:16 -0700 (PDT)
MIME-Version: 1.0
References: <20250523-maintainers_update-v1-0-0396d439d6af@quicinc.com>
 <20250523-maintainers_update-v1-1-0396d439d6af@quicinc.com>
In-Reply-To: <20250523-maintainers_update-v1-1-0396d439d6af@quicinc.com>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 23 May 2025 12:47:04 -0700
X-Gm-Features: AX0GCFvBY15UeeGYGwIEPRqVrDOITLOCIOYTf9QLT4deGUW6CYNsO2N0tvqvzOo
Message-ID: <CAF6AEGtR5CmrjKkqj82gpdJ8s5FqxGvkiCDNw=ZtcWLf8jbTFA@mail.gmail.com>
Subject: Re: [PATCH 1/2] MAINTAINERS: drop myself as maintainer
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: linux-kernel@vger.kernel.org, jessica.zhang@oss.qualcomm.com, 
 lumag@kernel.org, freedreno@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Fri, May 23, 2025 at 11:27=E2=80=AFAM Abhinav Kumar
<quic_abhinavk@quicinc.com> wrote:
>
> I will no longer regularly work on this platform. Hence will
> step down from maintainer duties.
>
> Also, add Jessica as a reviewer to the MSM DRM subsystem to help
> out with the reviews.
>
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

Acked-by: Rob Clark <robdclark@gmail.com>

> ---
>  MAINTAINERS | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 90b70f37006dbbf3baaee2c7a481e4fa49bfb3f8..3bc0da6f9033be0d5da35210a=
84ba189be4e5c0c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7638,8 +7638,9 @@ F:        include/uapi/drm/msm_drm.h
>
>  DRM DRIVER for Qualcomm display hardware
>  M:     Rob Clark <robdclark@gmail.com>
> -M:     Abhinav Kumar <quic_abhinavk@quicinc.com>
>  M:     Dmitry Baryshkov <lumag@kernel.org>
> +R:     Abhinav Kumar <quic_abhinavk@quicinc.com>
> +R:     Jessica Zhang <jessica.zhang@oss.qualcomm.com>
>  R:     Sean Paul <sean@poorly.run>
>  R:     Marijn Suijten <marijn.suijten@somainline.org>
>  L:     linux-arm-msm@vger.kernel.org
>
> --
> 2.34.1
>
