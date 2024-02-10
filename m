Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 676C08503AB
	for <lists+dri-devel@lfdr.de>; Sat, 10 Feb 2024 10:35:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF04010F077;
	Sat, 10 Feb 2024 09:35:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="bNf6kIw4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com
 [209.85.128.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC13B10F130
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Feb 2024 09:35:04 +0000 (UTC)
Received: by mail-yw1-f181.google.com with SMTP id
 00721157ae682-6049b3deee8so16299567b3.1
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Feb 2024 01:35:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707557703; x=1708162503; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=dEpHd/d4KaHqvCzlSHGoz778Kld92fS7hyAQuFB4M60=;
 b=bNf6kIw46Y+rnpZ3bw/juaCVIxOADDS5KrHFBGYJYnMxzx+r0MCp4oTJb18dpGDXvj
 megjU+ZEAXKhosgYZS7qSuJY+4sVmawIDJ1ITUqwLE/rPJgjQXkAOUJbqDZJtRS7A+sR
 ZKFLCN2Qto+zXgEjnQCDyU8yNN8qAyZ7u1mjEDoOA9RkqScCCH1ZWWiOjyvgDekxsmZs
 DGV7/Z3X3NjH+PCEP+DhrQaLHsHGWTMEodropIty+yz6hglCpWRsm/eMgO9fqhc72Z0A
 JZU/OkUm06wkmpisi2PyfxXP9xsaJkJa/fI3lpPGoKdBUmMFCEEhezE1717gjUcwDrvh
 uv2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707557703; x=1708162503;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dEpHd/d4KaHqvCzlSHGoz778Kld92fS7hyAQuFB4M60=;
 b=F1okr/u+GxVcRQ7qhNJTPaS5f4ckxZzu5whAmEhXLjfQZypHgTYRHnMfEeJ/gUkLjs
 E/lVGqQtsJbdUypxsM7YsDrKul/nRuX1xlf/YOnr5pEy7K8uTo0KtMcTG2mpQRdyOna6
 oyTnHz1VibGi3sgQDwW29b9ZaPepEGCHq7Q4n1B0lqQKU00fIiZGtwU/ohXk8S57jgAj
 s6mH6zYYCnxT+CcHa+h4R55XV0WnUK+4/9kNO5I3l2WwnhIkWoC/TQtCxsUpSK4vnCp6
 EFsMJnwoy3pLs4dcFPoUJWUD2Eh9dncc4t+9HmmTzBnaDsdOX8DrcH/h3suZMg8misJR
 bJ0w==
X-Gm-Message-State: AOJu0YxdCkZwXJcmSeaK6FKvfoL7Mr8qVktoddzydJgb9rHXfL9LIWET
 cAN8gnXTUlPnrzCfSC/8hgHI4pO9EZ1yt5ogKVy9xw+RYOpJ6CIWLDo66HoHMJwv88Q5KsfQAOm
 U4EYpe2PMZpR+VmoQcUidshgoUpvFZPQwlAURWw==
X-Google-Smtp-Source: AGHT+IHZINcqoh7VJSls55En0G8Ld122qNvqzCK+iubyY4zv7d+eyNOxvYn9XnVZowiNLIt/ZRqq4EI0fwYNf0FbWfI=
X-Received: by 2002:a0d:d102:0:b0:5ff:bb43:2a69 with SMTP id
 t2-20020a0dd102000000b005ffbb432a69mr1472175ywd.40.1707557703603; Sat, 10 Feb
 2024 01:35:03 -0800 (PST)
MIME-Version: 1.0
References: <20240210015223.24670-1-quic_parellan@quicinc.com>
 <20240210015223.24670-2-quic_parellan@quicinc.com>
In-Reply-To: <20240210015223.24670-2-quic_parellan@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 10 Feb 2024 11:34:52 +0200
Message-ID: <CAA8EJpq9cnS5_ghL=8V8TU7do2i_-+TQEHUxcSzWdOUO7wHa3w@mail.gmail.com>
Subject: Re: [PATCH v2 01/19] drm/msm/dpu: allow certain formats for CDM for DP
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
> CDM block supports formats other than H1V2 for DP. Since we are now
> adding support for CDM over DP, relax the checks to allow all other
> formats for DP other than H1V2.
>
> Changes in v2:
>         - Add fixes tag
>         - Move patch to top of series
>
> Fixes: 0afac0ba6024 ("drm/msm/dpu: add dpu_hw_cdm abstraction for CDM block")
> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
