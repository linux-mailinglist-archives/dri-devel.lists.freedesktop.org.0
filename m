Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B15F858E39
	for <lists+dri-devel@lfdr.de>; Sat, 17 Feb 2024 09:59:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0FE310E6A5;
	Sat, 17 Feb 2024 08:59:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="QAOqGgZZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com
 [209.85.128.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1E5610E6FD
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Feb 2024 08:59:49 +0000 (UTC)
Received: by mail-yw1-f173.google.com with SMTP id
 00721157ae682-6081bc96387so31007b3.0
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Feb 2024 00:59:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708160389; x=1708765189; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=K/ZRZyeQ+BpWdfJxshc7GD1plCDJLSP0ycmcd9yewl0=;
 b=QAOqGgZZZjuy/2Asl274Zkz1Vwwoy28fHPVOTgyroSnO0L/cveqjOI4YtFGcKjS0rR
 Yd5rqWQttDInigUPsKosrKXY3ADtrGF2c1yQHzVqYzggaVgy3QZZhVRvicQeckI3jQjL
 JqZt3rTed9W+QpQmYpSyoroU5B6iEmL0/YoTmCYRiB04CVWn3OjVAFfmzatAytIFuKOD
 RvZHN+K02I1W+7M4dYrxA+GGTlPx1do+3t9pj5djtkXvWdjTPiT9GkLf11FJpkMgvmbn
 vxLiKoWrSPelHQ5p4lMNXznKl+nuDwwso+nDoVr98+/Atomvf54bsYhj5NzrtVxPOXMf
 72MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708160389; x=1708765189;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=K/ZRZyeQ+BpWdfJxshc7GD1plCDJLSP0ycmcd9yewl0=;
 b=Nk7/MKHYl9s9UcXTvNJFWDikMzR84HYEpIWjqbzfrvzCL6YZMINn9/xlF2wt0FZ+UV
 BBSqRpXjOCbh7IJeuMSCE3ryXaLLtPNAYnRrKrAeemaGwZj7c95mybrC7DecPTDaTGcB
 XUkk1ij3cav1RbCh0W707rm0YyY3q2kWPq5NdlsAJViZSPEfdMe+Vrwoyf1ifKPV4Ym6
 1RQMapbR/El0TtQgGkP2nCMS29o60qLSsM8YLMFT2IGnEKh5tglPEaf88HPd3AyVuiei
 +ey3kZDJfQyVXiJ0J/48wZSsFyf0BAnoTGq21J32UcHBYp5qRUu5RL+YYYYbR6mvP1qb
 4h/g==
X-Forwarded-Encrypted: i=1;
 AJvYcCX1+IkfyH5Fc5/ntar0cDMho4WDF35rLKLL4V+SrcdQ+CE70hTf+d4jWCppBXsN2I1Rv91hgjo+Qtdo1GtE+VBPFTjwr92qCiXP4aEztw9G
X-Gm-Message-State: AOJu0YwJFCtozs6VmshfFe40u52q1fTgo6YcSuTnY2jEpc/NFwFMzJvQ
 RgNycb9j/SGZuCISevZhfxbYFRUpRbqIWImA4e95jl6SZpI3AWfd/VsX9woa8HIsXbEgsHhqkrZ
 5W0Qa2Fkz7sHZ9PpicPcyBiscxA4h6KyEjEyKuw==
X-Google-Smtp-Source: AGHT+IGdwuSGCA9darDzqXB4fL8BkiAUsbyieawOf4PytWpH89WcZTmfZO9MQDVKE6s6cePMEyqXbgxt3K9F/atI6Ns=
X-Received: by 2002:a81:5748:0:b0:607:b864:530a with SMTP id
 l69-20020a815748000000b00607b864530amr7030556ywb.36.1708160388853; Sat, 17
 Feb 2024 00:59:48 -0800 (PST)
MIME-Version: 1.0
References: <20240216230228.26713-1-quic_parellan@quicinc.com>
 <20240216230228.26713-16-quic_parellan@quicinc.com>
In-Reply-To: <20240216230228.26713-16-quic_parellan@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 17 Feb 2024 10:59:38 +0200
Message-ID: <CAA8EJpqiC-sEb371Re9Pyv01=UBT_NxZNd9wu54DUxZTNmePuQ@mail.gmail.com>
Subject: Re: [PATCH v4 15/19] drm/msm/dp: enable SDP and SDE periph flush
 update
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

On Sat, 17 Feb 2024 at 01:03, Paloma Arellano <quic_parellan@quicinc.com> wrote:
>
> DP controller can be setup to operate in either SDP update flush mode or
> peripheral flush mode based on the DP controller hardware version.
>
> Starting in DP v1.2, the hardware documents require the use of
> peripheral flush mode for SDP packets such as PPS OR VSC SDP packets.
>
> In-line with this guidance, lets program the DP controller to use
> peripheral flush mode starting DP v1.2
>
> Changes in v4:
>         - Clear up that DP_MAINLINK_CTRL_FLUSH_MODE register requires
>           the use of bits [24:23]
>         - Modify macros DP_MAINLINK_FLUSH_MODE_UPDATE_SDP and
>           DP_MAINLINK_FLUSH_MODE_SDP_PERIPH_UPDATE to explicitly set
>           their values in the bits of DP_MAINLINK_CTRL_FLUSH_MODE_MASK
>
> Changes in v3:
>         - Clear up that the DP_MAINLINK_FLUSH_MODE_SDE_PERIPH_UPDATE
>           macro is setting bits [24:23] to a value of 3
>
> Changes in v2:
>         - Use the original dp_catalog_hw_revision() function to
>           correctly check the DP HW version
>
> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_catalog.c | 17 +++++++++++++++++
>  drivers/gpu/drm/msm/dp/dp_catalog.h |  1 +
>  drivers/gpu/drm/msm/dp/dp_ctrl.c    |  1 +
>  drivers/gpu/drm/msm/dp/dp_reg.h     |  6 ++++++
>  4 files changed, 25 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
