Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2B0096D8D4
	for <lists+dri-devel@lfdr.de>; Thu,  5 Sep 2024 14:40:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EDAB10E889;
	Thu,  5 Sep 2024 12:40:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="nhVcv5ug";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com
 [209.85.128.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2350B10E88A
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Sep 2024 12:40:28 +0000 (UTC)
Received: by mail-yw1-f170.google.com with SMTP id
 00721157ae682-6d5893cd721so6369647b3.0
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Sep 2024 05:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725540027; x=1726144827; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=cAsWnhIXMINBCA2LD6vZLoTkLzPunHo5mBHMYdvy5yQ=;
 b=nhVcv5ughuNkDAPQOnDmixPZCMQ0qmCTw8MD/x+AZUPUsiIe73Fp1Qa2BPybssylN2
 QwwsJNh0b/5EKFw1UG2EVKG8MJZwjSBstGGFEjaI0wKtksUMzdddSly/Aw/srpWd+nbP
 6Y1rI8cVnLQwQHOKtIfdjA6FJTHiDZAe/oEolANoG23fEJqCcw2jMrIa56pgMhl5Upbi
 jDz+JPgB8kmTDNCmdNiPONUYitV6U7QkKy6a4myaCECl9r7wZFfs8oslIFFflw4dgezq
 iF7jkA+E4EPL61ObCa7pZiDTs/lJMSIrGejkyrO3T3G1T9R8BTYXweSwCsZLpvX460cb
 GGjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725540027; x=1726144827;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cAsWnhIXMINBCA2LD6vZLoTkLzPunHo5mBHMYdvy5yQ=;
 b=Ukk8Dn1jrgPMjS1oi8BqLag3EPqo9tI/EQ4bYLY5P1t2Fa738dIJMxJoN7pUpm+CF7
 Lkn0I1AT3RHUFiGTJbvbdX+pkUCRgtFTs5G0T155IA9pzJnmn+48tRH5O93nohgsmhi0
 jKf2zF9XblDbhThjZhhb43AxAZt4d9S4nC1XYvXmopkUxlGVFgjReBFaGtqhsYZ9i4Py
 rc8Nlfjo4kGVjlPNCGdkBCUfBGiGWPxwS09EGEYF2x83cLA38vdW9no532b/A915Eh1S
 Idiz2TtaPhuiGKP7Y5FkG5stiqsXNq8QkD3/godswbPwSV+nJ9xvy6YwvL+Jj9kxL/YQ
 dGew==
X-Forwarded-Encrypted: i=1;
 AJvYcCU2mnfDm14VMwBn+NRHJsi60oZzHD9UbkO/yY/hhM7qPbcmUiCU+ODpLY5aZ2oeQL5nsC/BmWoldzM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyPYxnMwqqADUZicFtaANHUbdQbVh7m6Q6kF1wVhpOJFB9HKg05
 x6ObLXb1x0ZPt3SvdvUjoDkWxwPpm8LMmq5534i4zNfkOelTlP+ct8w8QR0A7J97xZajsFidD3Z
 9yYKyg9HJ8rvnS1J4cRobA/jxytlgGrp67qEtDA==
X-Google-Smtp-Source: AGHT+IFIWLL0YlxXEHzETETRS/4fXk/TAU6J/4Fvm95WECnhr++irvMb/d6wkqFe1PbO8tUu5xvRXYLr+luqmfEBPLA=
X-Received: by 2002:a05:690c:6481:b0:6d5:7b2f:60a0 with SMTP id
 00721157ae682-6d57b2f64f8mr207770997b3.34.1725540026953; Thu, 05 Sep 2024
 05:40:26 -0700 (PDT)
MIME-Version: 1.0
References: <20240905-fix-dsc-helpers-v1-0-3ae4b5900f89@linaro.org>
 <172552245933.2905944.14392896379200688443.b4-ty@kernel.org>
In-Reply-To: <172552245933.2905944.14392896379200688443.b4-ty@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 5 Sep 2024 15:40:15 +0300
Message-ID: <CAA8EJprBwTH8R9-b68g-U6yA-FN6z_pt4YComNCj-xvXwvzcCA@mail.gmail.com>
Subject: Re: [PATCH 0/2] drm: add two missing DRM_DISPLAY_DSC_HELPER selects
To: Maxime Ripard <mripard@kernel.org>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, 
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, intel-xe@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 kernel test robot <lkp@intel.com>
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

On Thu, 5 Sept 2024 at 10:48, Maxime Ripard <mripard@kernel.org> wrote:
>
> On Thu, 05 Sep 2024 06:08:20 +0300, Dmitry Baryshkov wrote:
> > Add two selects for DRM_DISPLAY_DSC_HELPER which got missed in the
> > original commit ca097d4d94d8 ("drm/display: split DSC helpers from DP
> > helpers") and were later reported by LKP.
> >
> >
>
> Applied to misc/kernel.git (drm-misc-next).

Thanks!


-- 
With best wishes
Dmitry
