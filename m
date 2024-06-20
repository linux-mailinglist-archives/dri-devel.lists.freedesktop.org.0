Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C4F2910568
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2024 15:09:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B262410E9D2;
	Thu, 20 Jun 2024 13:09:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ge6vd5Nl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com
 [209.85.161.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06A7E10E9D9
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 13:08:58 +0000 (UTC)
Received: by mail-oo1-f53.google.com with SMTP id
 006d021491bc7-5b53bb4bebaso432150eaf.0
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 06:08:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718888938; x=1719493738; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=3rkNtw9YPMCGiaNrE2wpOjWh2PZ5/d2L88aMo+GCsZk=;
 b=ge6vd5NlhFkaBiAQAlsvFqlXRb7Lp5b5DkCiUTNPElkKu+LaLW1f5ecPoGHaJ/4dHc
 0+9pWQ+TMwsHm+XZOf/wjoVitBkKmxoEsrcJjW5zrB/9fXut36PJBJCUcLn3i7E1m6rl
 rHhpIfTzM9NB9mpmpISSdC++jc2BCEGTuz0AbqBHSSsEUHeOY4nUWw3/0zR1/z0bEoBW
 +h4lqt3/mA+wNEbIjF3IdWKUmIvsCwU2+nNG9BPxTtU7Chxpf0S+EVRLUFGTiM1O9hvT
 fsJ/eej2jAqp+tSIt1qZ+TPt/44ir1cvYu9Eeok0SSg+sIP/z5XmPqLAxhks6YBMIBzR
 ueOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718888938; x=1719493738;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3rkNtw9YPMCGiaNrE2wpOjWh2PZ5/d2L88aMo+GCsZk=;
 b=IfB5SV7ZPgAte31iCbvzbEA1HXzbVFpaRwD3+RHqeXNJuDBaLRridnqWt6vxrwb1v/
 UOkEh8dDuOyu3PtsL6uMap5ODFQOtJPxT/wAX4pCEbEV475QaAmk194sbHPNhiMWHDHC
 QLTM17SrOu7+S1SlszRfNPjB6FFv4Y1mT75NgPk+RKhvn13N5y7V6dj0FQepLSuMhYW5
 fGAD+nj+Z8wuMuEE67EOvGIGiZa2kPLRWX89C5diNkzpXBXPaChjnbuhuuRuaIbYtXrn
 3NcTz6DwlsMwFT8cCEsaxc2u99W2WLKzblaOhMY0T/oEi0mIItZ7Vw+N99959FUH1VX0
 ZM0Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXNflK5m9cu8m2tPyPV9r6KETAdDWW08/OgRe4GwvwdrFEqYNqoF1qwJ0JSVKxhfoW/OCS4S9vplniC2ZOHfNZAf8/AfSg2bXqj+OwBoQre
X-Gm-Message-State: AOJu0YyBw7WSKVNnFvE9kO8J7J/ok9zv/S2fXH9PycR6XhWYhRBC+ItR
 acgRzxI2q4HAW8QTJyUiepwQ9I3ESWHslIqkiGE46hJt97hFQpVyCfA+RCFTuxKxNO3vUw9c78r
 zNyzVoO53OLAXmcrJ27yTBjqj8ndiKpo2rhmPgQ==
X-Google-Smtp-Source: AGHT+IF/yD+0GZN6cAxps+FA6XiCIOAiMvgRzsPW3OFiThohVo42Hf9KaLzzZhArPsljy8CiIl3TpYiqk9Wxxenp9Vg=
X-Received: by 2002:a05:6358:8096:b0:199:432b:821b with SMTP id
 e5c5f4694b2df-1a1fd49a301mr606688455d.17.1718888935830; Thu, 20 Jun 2024
 06:08:55 -0700 (PDT)
MIME-Version: 1.0
References: <20240619212743.3193985-1-quic_abhinavk@quicinc.com>
In-Reply-To: <20240619212743.3193985-1-quic_abhinavk@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 20 Jun 2024 16:08:44 +0300
Message-ID: <CAA8EJpowTONWNQH+Sqe1w1eL85Ty4tw8_Qkc1yToQu9s17Tokw@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dpu: protect ctl ops calls with validity checks
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, 
 quic_jesszhan@quicinc.com, dan.carpenter@linaro.org, 
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

On Thu, 20 Jun 2024 at 00:27, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
> dpu_encoder_helper_phys_cleanup() calls the ctl ops without checking if
> the ops are assigned causing discrepancy between its callers where the
> checks are performed and the API itself which does not.
>
> Two approaches can be taken: either drop the checks even in the caller
> OR add the checks even in dpu_encoder_helper_phys_cleanup().
>
> Adopt the latter approach as ctl ops are assigned revision based so may not
> be always assigned.

NAK, these calls are always assigned. Please make sure that they are
documented as required and drop offending checks.

>
> Fixes: d7d0e73f7de3 ("drm/msm/dpu: introduce the dpu_encoder_phys_* for writeback")
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/all/464fbd84-0d1c-43c3-a40b-31656ac06456@moroto.mountain/T/
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 708657598cce..7f7e6d4e974b 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -2180,9 +2180,12 @@ void dpu_encoder_helper_phys_cleanup(struct dpu_encoder_phys *phys_enc)
>         if (ctl->ops.reset_intf_cfg)
>                 ctl->ops.reset_intf_cfg(ctl, &intf_cfg);
>
> -       ctl->ops.trigger_flush(ctl);
> -       ctl->ops.trigger_start(ctl);
> -       ctl->ops.clear_pending_flush(ctl);
> +       if (ctl->ops.trigger_flush)
> +               ctl->ops.trigger_flush(ctl);
> +       if (ctl->ops.trigger_start)
> +               ctl->ops.trigger_start(ctl);
> +       if (ctl->ops.clear_pending_flush)
> +               ctl->ops.clear_pending_flush(ctl);
>  }
>
>  void dpu_encoder_helper_phys_setup_cdm(struct dpu_encoder_phys *phys_enc,
> --
> 2.44.0
>


-- 
With best wishes
Dmitry
