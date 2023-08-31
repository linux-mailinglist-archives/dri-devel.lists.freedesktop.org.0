Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E9CE278E3D1
	for <lists+dri-devel@lfdr.de>; Thu, 31 Aug 2023 02:15:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A0C510E16D;
	Thu, 31 Aug 2023 00:15:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com
 [IPv6:2607:f8b0:4864:20::1134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52CC210E63B
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Aug 2023 00:15:19 +0000 (UTC)
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-5922b96c5fcso4096397b3.0
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Aug 2023 17:15:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693440918; x=1694045718; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=OyQ3QNWscfTpdGqgBgms3LPZL8sWGyfgTmegeYl8UhY=;
 b=lmzW/u1wRFD0HgVZzWLHw+exLVgUvZJuLAgRhY4vd5rlbHDPlym6Cot4jela4Lzyai
 fY8BbhFcrQJ6niPkzkQhD6h40MhyrwihYzHyP38gqz7kEtjLwDLpCYdvAVm/Kxda2TMk
 JV/VofehvXV0dr1TX579STEe3x8Ew3OB2Z4lZocpyqjM5zVKSeP54C/YTjZ7GGQnpM+Z
 LzFjqIPIzL9c6JE4AQ6M/xmc/+Xx2y/Dtdc/JlLcrCPlE71JkHWDdGyObLdfLWmWE4gh
 1RMc/PJcIMkYVeKzXk5+nCeuAXj12J5hiQv5TpqzGezm3OzD4jHUUjaKRcefx6lAxbLP
 quGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693440918; x=1694045718;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OyQ3QNWscfTpdGqgBgms3LPZL8sWGyfgTmegeYl8UhY=;
 b=BXTYvtHb7JEj2sWkYTMGehHPKq1XTbNc9WReiFylEyYQ2SkBSFDM5evjQMqGi+RSxh
 T1dalJWj/ajUZBspcDICFU8WZEZBufLeGOBmE2KHuoR2F/yCWZq+Rqk5yfJWTMrrOcLM
 RYIiWQb2yRzGdgCC9RanN2S/5dGOWoO5EIQH/M1vMTUliMpmKZBydwSIqqc/b0hNQbGQ
 IcbAil3duDxOzKf9n9F4ltxmSN5Std+QV4RXo5GmgXRaOhNSf+CaAfLYwWDAqAienver
 yIRivVUSMnyXT6GQPoYO5exJm5FvCoeJnoQCOd944B1c0vKmfDnXez5LyFKL1wHXh5Le
 Qwiw==
X-Gm-Message-State: AOJu0YzGVjM0njbAc1DnbdhnzMzVZVz1v7FUa1EZQ0q3JV0mxUlQxDMR
 weY1IRvfUu+cPoULU1SFQ9AbTqWAC+roBfakRH7LDA==
X-Google-Smtp-Source: AGHT+IEUgQBvI0sgINcVEP1+dB/cEnSbvMnPVtijtfAwJ3hr2IQuJhXns221D7jxzg+csWS71CBxDjIx0awK1xuN964=
X-Received: by 2002:a25:db42:0:b0:c60:982f:680c with SMTP id
 g63-20020a25db42000000b00c60982f680cmr3449214ybf.63.1693440918412; Wed, 30
 Aug 2023 17:15:18 -0700 (PDT)
MIME-Version: 1.0
References: <20230830224910.8091-1-quic_abhinavk@quicinc.com>
 <20230830224910.8091-13-quic_abhinavk@quicinc.com>
In-Reply-To: <20230830224910.8091-13-quic_abhinavk@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 31 Aug 2023 03:15:07 +0300
Message-ID: <CAA8EJppJe-tvfFT7fO5c_Fyv1aAtniVcAk5wdWpp8FPwwki9Rg@mail.gmail.com>
Subject: Re: [PATCH 12/16] drm/msm/dpu: plug-in the cdm related bits to
 writeback setup
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 quic_khsieh@quicinc.com, quic_parellan@quicinc.com, quic_jesszhan@quicinc.com,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 31 Aug 2023 at 01:50, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
> To setup and enable CDM block for the writeback pipeline, lets
> add the pieces together to set the active bits and the flush
> bits for the CDM block.
>
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)


-- 
With best wishes
Dmitry
