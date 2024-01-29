Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 308F584097A
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jan 2024 16:16:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 851171129A1;
	Mon, 29 Jan 2024 15:16:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com
 [209.85.219.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A02010F79A
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jan 2024 15:16:18 +0000 (UTC)
Received: by mail-yb1-f173.google.com with SMTP id
 3f1490d57ef6-dc238cb1b17so3234537276.0
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jan 2024 07:16:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706541317; x=1707146117; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=19g3oA8IiRUGTXPpvDGJllhbr2rfvg3/xxxfKuMshKI=;
 b=zxUWwnsJZUD+Zm0PFdSj4dnjQVMR9uJ3wRZCCMOcHO4lFqP2zWMycpEbsQnC4wcJJF
 pI+y+RH/F+Tnj952bgJqULYDl+aE7CLU/ug/3QP+n/3W1ab3j6KEvVx6A8Gt7bgHogfs
 XG3pnLBCwICRuoRvRuWbYDNXg6A7ZrX1arXv5BQ2+9N6GLZaMCP6UGXghfyVseRadd/b
 ABp3zs0yg1CegRzhtqTuCXI5QJPfNT4kgEaDzsI2vgWOanJhf8I8YJj5de6Isdv2wefL
 D4Eb6boEMiHBuMizWXTBhTmlrL4XZ44DiCfgFjotR7jPBJqWv5+VjKYPtzm0ipKXF6hT
 KK7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706541317; x=1707146117;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=19g3oA8IiRUGTXPpvDGJllhbr2rfvg3/xxxfKuMshKI=;
 b=VYm1t6cs/VXkE4b1iwJlE/d2SiHlIJtcHGwrPExVoMrzdtnU6Dv556FjuJ2ESUCeiu
 gR4ZqcUwNj4NHdM5WAlm6RQYdFiy7fMI/TA+4bZLI5li/tzyeSGqby8bt4v3c7Eddu/Q
 q/Ra4PJ55IXeuG4+ynpU3rWmALS7h8eKLdnPuR3sfJNzA7kprOo3tofR9LqaBUggiS6T
 MGn0VDN62vlJ7OnH03QIsCkrx93YMuvg5imVURu+VmTfD6NfGnnw8UpjXJqLolAK6Wvb
 4L8ED841LWC8MPVkJ2VLTDvn+UR1ic3OhZaI30s85sAx26NvT/K/20b8qu1s5Oqef2zd
 qKRA==
X-Gm-Message-State: AOJu0Yzs9wEecRpqNllKsEW4BWxzCcOqvUmtI3H/0C/EEv6dBDvCBJyV
 7Ew4P6bQ3mFRMCB232c6uwxxiPh3U/UgRpixiTVH2yKHtOE10C86HGCdHE92uFLEO9Xdwx0NqC/
 q7NrP+X0ghAQK6iKRn1vqQ2lwbylIVzVZU6tbFg==
X-Google-Smtp-Source: AGHT+IFydtOcrIJRlNoXpg56zZ7tHX71n5y4JJpZgFrLYNKvhBr3oibPkEQ4p09wGzgkORErJGWYlBptWzGE6KVbIJ8=
X-Received: by 2002:a25:ec0a:0:b0:dc2:52f4:2356 with SMTP id
 j10-20020a25ec0a000000b00dc252f42356mr3387101ybh.119.1706541317649; Mon, 29
 Jan 2024 07:15:17 -0800 (PST)
MIME-Version: 1.0
References: <20240129-x1e80100-display-v1-0-0d9eb8254df0@linaro.org>
 <20240129-x1e80100-display-v1-5-0d9eb8254df0@linaro.org>
In-Reply-To: <20240129-x1e80100-display-v1-5-0d9eb8254df0@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 29 Jan 2024 17:15:06 +0200
Message-ID: <CAA8EJpp_S4Ug8WoiQ5f3hEESTy9_u1wOo-ETMD2Tky1_OQH0kg@mail.gmail.com>
Subject: Re: [PATCH 5/5] drm/msm/dpu: Add X1E80100 support
To: Abel Vesa <abel.vesa@linaro.org>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, David Airlie <airlied@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Maxime Ripard <mripard@kernel.org>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 29 Jan 2024 at 15:19, Abel Vesa <abel.vesa@linaro.org> wrote:
>
> Add definitions for the display hardware used on the Qualcomm X1E80100
> platform.
>
> Co-developed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  .../drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h   | 449 +++++++++++++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |   2 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   1 +
>  4 files changed, 453 insertions(+)
>


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
