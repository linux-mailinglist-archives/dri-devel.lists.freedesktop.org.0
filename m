Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C23137EBE25
	for <lists+dri-devel@lfdr.de>; Wed, 15 Nov 2023 08:33:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5FE510E4FC;
	Wed, 15 Nov 2023 07:33:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com
 [IPv6:2607:f8b0:4864:20::112f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A89A910E4F9
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Nov 2023 07:33:32 +0000 (UTC)
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-5a7fb84f6ceso67465627b3.1
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Nov 2023 23:33:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700033611; x=1700638411; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=3FOA8cwIAyYlR65wDteBKmBM81DRgXu6MSA3Hl45V4Y=;
 b=cHEcbbjL/EyjPbJ5REzdg3LRNuyy7KZpZfHMxSFPW0cRJ++st/lJBRNQ0djgW99NKV
 ykRUUDfrzozjeKD4j+ibwOr2DY414hm8WJMhctJoKJpkv3FjRUp9qzBGY3r9nWJbxbu5
 f2g2YczTi6LkPbVlSEnIcPnjy5y68CyJq4IiZN0I5vuZc2+gZtAQ3u0TMcuU9+DcWTjd
 FdXJXhINEn4lELPQ4ScdjZUG/L78bZvOREzFSdwwJ3iiTuskWsskZe9/3FjFTd9JU06a
 /1n47nU5Dk3BRVy8cdkL2/J+W1AMZZ3WpEtRBRnPRkffo2ExUo2hxzi3uHr/2jeZ7JsS
 yJFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700033611; x=1700638411;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3FOA8cwIAyYlR65wDteBKmBM81DRgXu6MSA3Hl45V4Y=;
 b=USk66vnSlxuvJ2xQj58H5iTR37lSS4xC5AV2bQdvh295EkPccseuXAOZDL3De8rXel
 1XGrQ8WqwWAgC3Ztb+WoWOciZa0z/ocTJh9anKwGOgSEuX8fEvWuOOZ84CCFSlzh2+pG
 q6bsKlYd/NHhFeTiZOaI70C6cQpE1I7qc1CtpLlj9SNYjO15ylq5g6RfaNRtF/pX+ZJ4
 thAMyoEDEfujVWTFetNChivwo7sFyKTa/BtVIh0X5fw25GPvGnn/dYCFliIiELWAaK6t
 C6DMMWo4AWX4CVTZRIW9MwxtHKD0wmktGC8XFqpoWxphL4+aZVxaBAk6vmGpF+TXC2HF
 e+jg==
X-Gm-Message-State: AOJu0YyV4TD7cdzb++Exu3MZaTaCDdACvJNq2Q+2vhNrBPZ5cQQqTm9P
 Zwha1jkO/XLPGx/z4bwxPUN/Adg3BZkuGwcd0QMCLA==
X-Google-Smtp-Source: AGHT+IGaoOYs+bd3ICE+icrHuNJQ+wn0eLONRAaiZI9vHUtjmK/ZBgnbAWkr+eRFLcDJ4ik1mFWd/zZtJNuRPE2VUow=
X-Received: by 2002:a0d:cac3:0:b0:5a8:187d:d5d5 with SMTP id
 m186-20020a0dcac3000000b005a8187dd5d5mr10457931ywd.35.1700033611715; Tue, 14
 Nov 2023 23:33:31 -0800 (PST)
MIME-Version: 1.0
References: <20231114225857.19702-1-jonathan@marek.ca>
 <20231114225857.19702-4-jonathan@marek.ca>
In-Reply-To: <20231114225857.19702-4-jonathan@marek.ca>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 15 Nov 2023 09:33:20 +0200
Message-ID: <CAA8EJpoXF+DtVxNwK1Lr6WVzTgoGGKybzeOQ384RYyT71Zdksw@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] drm/msm/dsi: set VIDEO_COMPRESSION_MODE_CTRL_WC
 (fix video mode DSC)
To: Jonathan Marek <jonathan@marek.ca>
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
Cc: Vinod Koul <vkoul@kernel.org>, freedreno@lists.freedesktop.org,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Jiasheng Jiang <jiasheng@iscas.ac.cn>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 15 Nov 2023 at 01:00, Jonathan Marek <jonathan@marek.ca> wrote:
>
> Video mode DSC won't work if this field is not set correctly. Set it to fix
> video mode DSC (for slice_per_pkt==1 cases at least).
>
> Fixes: 08802f515c3 ("drm/msm/dsi: Add support for DSC configuration")
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
>  drivers/gpu/drm/msm/dsi/dsi_host.c | 3 +++
>  1 file changed, 3 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

--
With best wishes
Dmitry
