Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AE3593D2D86
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jul 2021 22:16:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5878C6ED16;
	Thu, 22 Jul 2021 20:16:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [IPv6:2607:f8b0:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E8A16ECA1
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jul 2021 20:16:46 +0000 (UTC)
Received: by mail-oi1-x22b.google.com with SMTP id e11so7916052oii.9
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jul 2021 13:16:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=lGBGDn+lOFNngvvH3L1P75ECn+Xc69iUtWDhuizhmRk=;
 b=WBVq6pEiIdZU+GzhLnjTWPaJtocMzNL82BgTggr5nUPLGGS8R8sX+BOMVEApmfkRw9
 8Y56V3g4r4I8SqKRkOSNP4326oh1kzb+1PuACxmp6HoAfAsgtrdlAJ556GV92PT7exzL
 McADJKZB9Lb+pcbQrmy4bQpGWLhDQQptnnwPY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=lGBGDn+lOFNngvvH3L1P75ECn+Xc69iUtWDhuizhmRk=;
 b=PIk8ncmdy0yXai549lx6AVQdqyH4K0EF88H/fHbVzelv1jDjnBERstlzAEwjSBPbwh
 /3eQGBcJgi6JYb487eezC1dK56b/Gc4waUNuqzuuUyV8TOaHFByOi2AvroIUxLl41Chn
 YcR63QWEr+scdXT2AhdfEbao/YYJ/VAU1x98eyPc69KIJ/Kl3RQH7hEMkpW+eNh04Nrn
 IID+ds42qPqPHqhfKlOYK2Ps6y+L5UU91K2WMwXrROH24s4im4xj6SqRK1CvHUQswNqk
 bM2/V5gut5TWUNalKvqEv6zvMyWr4RK8GWVPpjj8OgYzrnF6j4lcCP/109NVBmFVnfe3
 H2fQ==
X-Gm-Message-State: AOAM532vqwkXYdQJ+m0SCGR+XcigViVH+CfA+skj9DFlL0R4XmHdXua6
 XZITvil0A6REFSSjTyP+9ZN78/iWbG1BY05nTOMwAQ==
X-Google-Smtp-Source: ABdhPJxjTaEbkRrBN/FqiRS6clBxB0FcklPeiI3sKW/kjDjrRLw/EbOnNhQjT9Uf5BJl9SFEVjqPUChYPfrbRGjQLhI=
X-Received: by 2002:a05:6808:114a:: with SMTP id
 u10mr1175746oiu.19.1626985005662; 
 Thu, 22 Jul 2021 13:16:45 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 22 Jul 2021 20:16:45 +0000
MIME-Version: 1.0
In-Reply-To: <20210722024434.3313167-1-bjorn.andersson@linaro.org>
References: <20210722024434.3313167-1-bjorn.andersson@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Thu, 22 Jul 2021 20:16:45 +0000
Message-ID: <CAE-0n50iOP5K8Q79ShmLowWErxMFRdYZRg=hDszYn8O4OJaz6A@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dp: Initialize the INTF_CONFIG register
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>, 
 David Airlie <airlied@linux.ie>, Kuogee Hsieh <khsieh@codeaurora.org>, 
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
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
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Tanmay Shah <tanmay@codeaurora.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>, Guenter Roeck <groeck@chromium.org>,
 Vara Reddy <varar@codeaurora.org>, freedreno@lists.freedesktop.org,
 Chandan Uddaraju <chandanu@codeaurora.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Bjorn Andersson (2021-07-21 19:44:34)
> Some bootloaders set the widebus enable bit in the INTF_CONFIG register,
> but configuration of widebus isn't yet supported ensure that the
> register has a known value, with widebus disabled.
>
> Fixes: c943b4948b58 ("drm/msm/dp: add displayPort driver support")
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
