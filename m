Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BE4D86FDDE
	for <lists+dri-devel@lfdr.de>; Mon,  4 Mar 2024 10:45:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7702910E9A5;
	Mon,  4 Mar 2024 09:45:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="t2z27G+N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com
 [209.85.219.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8F4810E9C4
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Mar 2024 09:45:10 +0000 (UTC)
Received: by mail-yb1-f173.google.com with SMTP id
 3f1490d57ef6-dcbcea9c261so4274388276.3
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Mar 2024 01:45:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709545509; x=1710150309; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=G38jlOOjWdyF5F5/2JhgLPVjp/JQd8aCZTbhP3PI+LQ=;
 b=t2z27G+NTCY7nPON/5ZUQHhwmmcdpZ497ytRkvwjxyNo/lBgHLOUQnoDG2D5E8DHx4
 lU6c8dThvQ393yiekAY/Ak5hXnKJq+6ENGjJR8CGXDrJD56SbVLU/MoqrjKAkllUFcWf
 jdNPbaiKt0u8G5WkSuy/i4oz53yXycmDep5trW/BBdFDZmDdtRsse0CLt2cvu/QPfOry
 /YOg5KWDPPf5g0DII5aeIGN94G5OGDUcWCcksklUaVzdFcwbEVxxE+M92T4uPQdsONqb
 f21iBxGMtKy8Go+8xx/IWWJB9ihkIMcn23DVNjsOeDr893H36nKKTtlJ6spW96YrGAB7
 5IVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709545509; x=1710150309;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=G38jlOOjWdyF5F5/2JhgLPVjp/JQd8aCZTbhP3PI+LQ=;
 b=PBWSmEWBFKjw22PLOTChWwdLArOdWBiOTumMqXo8Fk0aGbXKutLqzwSijrX0VL0Agw
 q5Q7FP1011m6JeuIf0PWB6ewDuQRj88BKTZ7rSP1eZiE7zkVwy8B6tF1bJJ77ArGWTdK
 Un0rkARMI3oTTTE2+HfTzsqgP4VoUtEngC5TtASlf9Mb3GeAxBy61rMBqmuXpmTO4nvd
 HbqirVCaZ2ArxxmPRh2mYqIReLAEpInie2o1ZA2ooLLzsoPzERmyhil+RhZ25P/D6bgs
 iFmA4yhsr8N4rYQkpDRm0GigOuRn2Za5Qk6xCndZSzmi7lTrXOs/SAueKmIk32Uj+2Jk
 4s0A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVu+qC3WWfAY6/Vd6vE8vaiyXYeerMqp45WM5aVH94jvTWgQk+dbVewJwgLLS/NEjP0RTfOp4njAVerrlVnIx4h7sL+jLisMlmAKA44pRzC
X-Gm-Message-State: AOJu0YzILObZ+O8JVdSvcFuiGQY49U0SbOhKFrJF+vWbpdfIvIT6hn6I
 3OjTX14yTbPpCMbgjYqO3TTOTr6l1rWgbMs2FWU7htBRCjcGJiDtM5KgVU4LJz3yLkeKWx4HLfM
 CP57LIG5+0/f+ZzFFyWAU1B198KtgGQJJDPbCCw==
X-Google-Smtp-Source: AGHT+IEB6xVfWdbAxpki5Q7d1ldQdkm96MPwnQOjlKKbuMgTXowcNWPDNc1CazVdJ5aCY6xTSuMxXPchvKcEkvfWLWo=
X-Received: by 2002:a25:6b49:0:b0:dcb:e82c:f7d with SMTP id
 o9-20020a256b49000000b00dcbe82c0f7dmr4198546ybm.41.1709545509594; Mon, 04 Mar
 2024 01:45:09 -0800 (PST)
MIME-Version: 1.0
References: <20240228194730.619204-1-quic_abhinavk@quicinc.com>
In-Reply-To: <20240228194730.619204-1-quic_abhinavk@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 4 Mar 2024 11:44:58 +0200
Message-ID: <CAA8EJpo1O9kDeYt_z9YHAu+nQXJ2XenejOGxm1fjED--brCWgQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/msm/dpu: drop unused dpu_kms from interface
 initialization
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, 
 quic_parellan@quicinc.com, quic_jesszhan@quicinc.com, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
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

On Wed, 28 Feb 2024 at 21:47, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
> dpu_kms seems unused while initializing DSI, HDMI and DP through
> their respective _dpu_kms_initialize_* functions.
>
> Hence lets drop the parameter altogether.
>
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 15 ++++++---------
>  1 file changed, 6 insertions(+), 9 deletions(-)

-- 
With best wishes
Dmitry
