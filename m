Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7923788CAFD
	for <lists+dri-devel@lfdr.de>; Tue, 26 Mar 2024 18:33:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FA5A10E436;
	Tue, 26 Mar 2024 17:33:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="p0D6W/Vy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com
 [209.85.128.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA1E110EF43
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Mar 2024 17:33:35 +0000 (UTC)
Received: by mail-yw1-f176.google.com with SMTP id
 00721157ae682-611248b4805so41891507b3.0
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Mar 2024 10:33:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711474415; x=1712079215; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=XbZMB0HLDo6UlcT3wdFgHAD3bu+yuJSpDvNYyyVm5Bo=;
 b=p0D6W/Vyz4E/o6rEewPQ598Vkm+6sjH6wqxSHptc/k9NMAR2zpqekXGOOhRrbTdEKW
 RhmkqlYmtLqIXw9jS82Ka0eihSEpX0i5tmNiDqSBAmRzFuqipdKuqCTJwxCHhmw6YPlg
 gWH6swIsQsOlsIDRfEl2HVgzHC3W/CfoqLGkLGcFdfGC0ZC++7yEmGdLRQC3CA0kgh38
 sKi6589QW9abnXlHC1F2HecnZxlYJJKzmh3Ly2jcDL8tJoEr645+uuFdmh7Go+2+bvvc
 h/lUtfhROq+N+ERsumdB8yK6hPI4vwbKdQW1pNT4uhlfdHc4VCZAhnn1GVYmEggcou6Z
 RSFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711474415; x=1712079215;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XbZMB0HLDo6UlcT3wdFgHAD3bu+yuJSpDvNYyyVm5Bo=;
 b=a1S2HOgrL0ovmqc4Ovd6aiNwVeVvJ+QI5al/MKvOFSUZke7gJJScQa30srBhkGFUFE
 SAVwHme6Sj6GFydoF6PEj0niNSILx9mFLUkMDfb3Kn3h36a2+9LpA0KmMp2qmXcL4dN3
 7BiqtzZG05wZpe3azkzfdAygvBb8i7BtOier8aWWEltWJ4dfi47k/WUkguFzhkVVMBZi
 KmfFez7F2a9b8O5ic6Oos/TVvtgIm1J3igYN127BOEnCJDC8t5hTNCeW0kBD8l7cghH3
 8XPTK+Ak0x40HAppMdw02u9FpKkg0cpS0GB5DKfyUpqGykNXwcob/so5j2RA/+2z2t6x
 Uz0g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVO2sfkduxwHS81/DpT2ofvJ3NmD5lpGy0Qjv4Z7IbBWXT3fBNRRyi3YdjYI9HHaDFMF1CuFkt/ZlniqLAObcD4Yqnse2r5SgKP3bfMHmOO
X-Gm-Message-State: AOJu0YwoQUZCWFRRevN920A7yQbMNvHA4iD7nKwzOpdO0F+tTdqRuXaz
 idwcy41etGinhOcH6AUrBie+4BSHzXxkAKbujGZU96E9/DTpBpCASRlmXUgybmwxJ7WoguTRSLG
 fbfxPlKie0LQtZzJWUbkaHdInDIGsWg0cUCfzCA==
X-Google-Smtp-Source: AGHT+IEMWwGPSGxVa+7DBZhN3tDl31SG+GYGcvvUKD2ClPTIyhd+KW7hJPpl34yQMv0yUTu8mGIcSU6SoV3jibi+RjM=
X-Received: by 2002:a81:5f55:0:b0:60a:5031:2de9 with SMTP id
 t82-20020a815f55000000b0060a50312de9mr1681149ywb.51.1711474414901; Tue, 26
 Mar 2024 10:33:34 -0700 (PDT)
MIME-Version: 1.0
References: <20240326-msm-dp-cleanup-v1-0-e775556ecec0@quicinc.com>
 <20240326-msm-dp-cleanup-v1-5-e775556ecec0@quicinc.com>
In-Reply-To: <20240326-msm-dp-cleanup-v1-5-e775556ecec0@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 26 Mar 2024 19:33:24 +0200
Message-ID: <CAA8EJpqxxuu+EK3W55EbhiZyGqnB6DGdH7jU5fP--bZpUHSx9A@mail.gmail.com>
Subject: Re: [PATCH 5/6] drm/msm/dp: Use function arguments for timing
 configuration
To: Bjorn Andersson <andersson@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Bjorn Andersson <quic_bjorande@quicinc.com>
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

On Tue, 26 Mar 2024 at 17:06, Bjorn Andersson <andersson@kernel.org> wrote:
>
> From: Bjorn Andersson <quic_bjorande@quicinc.com>
>
> dp_catalog_panel_timing_cfg() takes 4 arguments, which are passed from
> the calling function through members of struct dp_catalog.
>
> No state is maintained other than across this call, so switch to
> function arguments to clean up the code.
>
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_catalog.c | 14 ++++++--------
>  drivers/gpu/drm/msm/dp/dp_catalog.h |  7 ++-----
>  drivers/gpu/drm/msm/dp/dp_panel.c   | 14 +++++++++-----
>  3 files changed, 17 insertions(+), 18 deletions(-)
>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
