Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACF23855CF8
	for <lists+dri-devel@lfdr.de>; Thu, 15 Feb 2024 09:55:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CC9C10E104;
	Thu, 15 Feb 2024 08:55:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="K9+ZUGr5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com
 [209.85.219.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E94A10E046
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Feb 2024 08:55:46 +0000 (UTC)
Received: by mail-yb1-f177.google.com with SMTP id
 3f1490d57ef6-dc25e12cc63so1474717276.0
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Feb 2024 00:55:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707987346; x=1708592146; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=A6CQ+IRO32lNLtjlKEcSjvtD+crehBuMoEtTj27QIp4=;
 b=K9+ZUGr5NRAuUO8uoJRHayDi3AXqJxS/p16RnHoa9CLZngtqE881skyPFIeCPGa4k9
 +YG0ZLoJQbHbC9bx1GiXaxnXwlX/jxGpQqIwqq7oZ59xgR62xYVmbXMd5CXIahC6CjP0
 FHbOqnBdd4xdArnorI2s63TAwtzNLThzoODYIg/30KrQOWUXPnNzCdNNc1EN7HsvBKO7
 8qCU4tK4KD5mzx2MjHERXySrtNZFZi+0NVsY7My2DhJFiay7RmZOsn44eNTE6x93YDXq
 GHpaeC9ZxjLax+S/haUxyO9XJfpO5hSaIatwCVx/Wqc144hQ2UV8e3RMxohNAk5BT1Ic
 Md6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707987346; x=1708592146;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=A6CQ+IRO32lNLtjlKEcSjvtD+crehBuMoEtTj27QIp4=;
 b=dA7slMJc7DyUG9f+C4pijFkv4IbQOroK2IUNFgYofw3aDL9b6lfrj3kLGN9vxBxSjG
 df7xOxIoT7oWoWonidIFVtatEz3WPwQhQMbRCYLYRA1421jlsDhDhkJ/4wE1WsZIunKm
 H98h81Kytog0NyalD2VLy7vwm5S7TsYNdAlW1kxPBL8XU+dR2Uw5vvIF1y6TBYbCF1wm
 byPx4ZTmMKm+43FLVCCs2wmY2T7rOZuW+7+ux2n4KfwpfBIwkQ7zofsbgMvQ37qJzs9r
 EIWPDPZaXbTzL/MRmJpEdVQbaLR61Di4n1Coq9YQXFx3taB03YNF/A8DUXHwzArsMYWO
 6A0A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUmWA+7OIYV5dxXEj28w2pFpzNjOEAi3HDNWX4wCCkjvTgz3K0MsUyewIPtPxogpuCYga0F46xHE5TCcXrpV2P+m9+I7j/ix8xhQ6C826IJ
X-Gm-Message-State: AOJu0YwvJSRNYxwb79SAktjV6p9OzvAViugxoMn8KIpsEaaMFZxCbgnG
 3wrrCRacNiRkT4nSHHAzYV88ofOguwblm01g/aekdRl+VI0FD+lnuAVZj1S8GB34iP3Y7XqqWPd
 8tfTqJhHlfuTQRXw1usniwahv49fgpSUamgTWsw==
X-Google-Smtp-Source: AGHT+IE4lbTZKhBywpPpsira5YbX/aKUOSR2Y7bKcNEGDTo00brA9daDt/YyPAL9VY6ak8GFW08RebDPlLnamXNKJ9Q=
X-Received: by 2002:a25:3c87:0:b0:dcb:b072:82d8 with SMTP id
 j129-20020a253c87000000b00dcbb07282d8mr3327167yba.15.1707987345897; Thu, 15
 Feb 2024 00:55:45 -0800 (PST)
MIME-Version: 1.0
References: <20240214180347.1399-1-quic_parellan@quicinc.com>
 <20240214180347.1399-18-quic_parellan@quicinc.com>
In-Reply-To: <20240214180347.1399-18-quic_parellan@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 15 Feb 2024 10:55:36 +0200
Message-ID: <CAA8EJppidULwO=PG7t9iZbSeK3v_=W_92s9sVyJ5Do0W9ja3Sg@mail.gmail.com>
Subject: Re: [PATCH v3 17/19] drm/msm/dpu: modify timing engine programming
 for YUV420 over DP
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

On Wed, 14 Feb 2024 at 20:04, Paloma Arellano <quic_parellan@quicinc.com> wrote:
>
> Adjust the encoder timing engine setup programming in the case of video
> mode for YUV420 over DP to accommodate CDM.
>
> Changes in v3:
>         - Move drm_display_mode's hskew division to another patch
>         - Minor cleanup
>
> Changes in v2:
>         - Move timing engine programming to this patch
>
> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
