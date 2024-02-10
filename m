Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34C3C8503B1
	for <lists+dri-devel@lfdr.de>; Sat, 10 Feb 2024 10:38:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 385FA10F563;
	Sat, 10 Feb 2024 09:38:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="WgMA75vC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com
 [209.85.219.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C8B010F563
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Feb 2024 09:38:00 +0000 (UTC)
Received: by mail-yb1-f182.google.com with SMTP id
 3f1490d57ef6-dc6cbe1ac75so1409808276.1
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Feb 2024 01:38:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707557879; x=1708162679; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=kyj3Aremed/KUNAD4OBb57Mrn+FOkbsCPQxNdDwPeyo=;
 b=WgMA75vCV4gtHvrNLv2ZYsH4lRbq6HWevjhNGAvM7Pm/qix8x1jvpJpIwk1YzZ7Aze
 24fhQ6d9pbW/hXSjeXIuS5Hoz8Qw/x+Y8y4PQBp/piDo5qLQ5T4uzmG6hURuBNwRT5Ve
 Y9AF0G6ez8cVX6AfJjAwskGhjrkSiS7SNICAB4ckkPa0D+4aWROlozTDZGECZeibWdWd
 RBeGS8V+EyQyD+LH1vInH6ElTn0bsL01eGP4JLK9gcxQ41Df9wtSETZ33ZeZjaLtR4Mb
 0NfUelezPCya1i6eQZYt0OM2JltnWoG8IFfQMHzFGRyaNttaRiRjhmMDg5sTv7wnpqv3
 5jtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707557879; x=1708162679;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kyj3Aremed/KUNAD4OBb57Mrn+FOkbsCPQxNdDwPeyo=;
 b=Cojj5eqlnC4Bil+iq9q/3FXu7obwmHoT2vf7WPTbmhf9uF5osS8vTzXR1/SF32Cthb
 FQD7AiSl1D8TR9qoeaf3QL3A+yp5MgaDPpGi85CJi2C9T1dZVYNE7oDes5INg8sRUsO5
 J+byzrIbTrdhFBGoQ4V6QRPrD491CrhPK/fxHtXvwJ60+SJODRvVRshtImQlcx8htPtQ
 DvN0Ogh0CRpLjbaUdd73kMOFDnoCOtlE4WmY0ceejcIyPZTROJ/rnGCzTu1jaPlZudx+
 ndnm5FD/jB9Atqgci1cdF0gUeRe2dNtiglzpiZrt8QwS0nE4LijH51ytwE6D4kQdFYDm
 ZkPA==
X-Gm-Message-State: AOJu0YwioVjpuXYbfA4Zea5pukk1fmTPBkvbTr1acHSPCj5/YuccC2QA
 QTGN13r6S1vjv9nB7lzBFlUZQO9xPeA9cGWLP6Uf5W64ho6Zn5jUH2kOBWOMKHMDs6FQOLNQ5Zb
 +ubU5z3wxDMVbiFBLsPibeBAS92pxr671lLNwvA==
X-Google-Smtp-Source: AGHT+IFzkw+SzWXsqTHkTtPzsujNkNWObNd/pIokqsm8EQCoFnl3SfEdRL3myAU8AAkxJJuSGr74rCS8KR2nL86w9Nk=
X-Received: by 2002:a25:3623:0:b0:dc6:6d0f:8329 with SMTP id
 d35-20020a253623000000b00dc66d0f8329mr1116788yba.20.1707557879528; Sat, 10
 Feb 2024 01:37:59 -0800 (PST)
MIME-Version: 1.0
References: <20240210015223.24670-1-quic_parellan@quicinc.com>
 <20240210015223.24670-4-quic_parellan@quicinc.com>
In-Reply-To: <20240210015223.24670-4-quic_parellan@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 10 Feb 2024 11:37:48 +0200
Message-ID: <CAA8EJpoDHLcCHPoDj0QF4CWsLtz=B7DDgkaF=s=aew_5JBPkeg@mail.gmail.com>
Subject: Re: [PATCH v2 03/19] drm/msm/dpu: pass mode dimensions instead of fb
 size in CDM setup
To: Paloma Arellano <quic_parellan@quicinc.com>
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, robdclark@gmail.com, seanpaul@chromium.org, 
 swboyd@chromium.org, quic_abhinavk@quicinc.com, quic_jesszhan@quicinc.com, 
 quic_khsieh@quicinc.com, marijn.suijten@somainline.org, 
 neil.armstrong@linaro.org
Content-Type: text/plain; charset="UTF-8"
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

On Sat, 10 Feb 2024 at 03:52, Paloma Arellano <quic_parellan@quicinc.com> wrote:
>
> Modify the output width and height parameters of hw_cdm to utilize the
> physical encoder's data instead of obtaining the information from the
> framebuffer. CDM is to be set up to utilize the actual output data since
> at CDM setup, there is no difference between the two sources.
>
> Changes in v2:
>         - Move the modification of the dimensions for CDM setup to this
>           new patch
>
> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>




-- 
With best wishes
Dmitry
