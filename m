Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 762223D2D80
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jul 2021 22:16:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4BED6ECAF;
	Thu, 22 Jul 2021 20:16:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [IPv6:2607:f8b0:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED3FC6ECCB
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jul 2021 20:16:26 +0000 (UTC)
Received: by mail-ot1-x32b.google.com with SMTP id
 42-20020a9d012d0000b02904b98d90c82cso1685986otu.5
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jul 2021 13:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=xXB6CY1/hyqIZ/vyf1haNoHbt4KWUoYy6vvZAmH1D+w=;
 b=oFGsQ0TKjSPUvmDJ+Ww7NKCOnlaH9mPPhQ8V1uT5yAbwlHkzi7XKHOwbKCdjsDCiFx
 yq1IJgMOZiLe6uDTqRaVUXxdZCoQJu8ag7Ir6ZFU8nUwgn7Znd4ZLaNh5xPaNp+azumy
 J/HSCBwivCGfPaDdx08xhc/6xnh7lVWGgPxdw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=xXB6CY1/hyqIZ/vyf1haNoHbt4KWUoYy6vvZAmH1D+w=;
 b=MMZ+ALKgMxctBkSTKqTiitgrXQ6YqFI22apdG0FDZI9werHcjDJkHUBMvJzHOiVHo4
 Ia8wbSysVH7WgKQ6iU3g6EchZxaNh5VayTEAoZz/bkoaUS5bf4L4dPJAi8SnYdJdA7E8
 n2dttVf/uWD5BDf+LGkan7rpecT7S3B8sADcOwOQqYGwPqsrgZSwMKOdF6C7IDrNxllP
 QA9A3vITWrErdobIrz44z1f80e4QnLOVYJ3zs00qjvuz5r4dRs1z67jeDpqJFw4oTD5/
 TW0c+2XkOt3XVAmBFu0mzulVgjJMSaPHCyu0/F+MiXYRZKPSG6Zwn+q8Lji5SiQL9VYh
 tCtQ==
X-Gm-Message-State: AOAM530WABbZiACIofN5Nh7BuRfujgMLU6QyxGeKEbVg2+s2qOocCor4
 VHk/S3Ci2ZCLBYjGI20vFKWHCfdwd5oTsy444BZy1A==
X-Google-Smtp-Source: ABdhPJx9tD8Po38Bpw7rs+mj+04e7lSnkyOtBucxpHE2LeWBu5SLBnaseuHcQzXabjdCy3cHqU3feQ+K8Kq30uLlLb0=
X-Received: by 2002:a9d:650e:: with SMTP id i14mr984428otl.233.1626984986325; 
 Thu, 22 Jul 2021 13:16:26 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 22 Jul 2021 20:16:25 +0000
MIME-Version: 1.0
In-Reply-To: <20210722024227.3313096-6-bjorn.andersson@linaro.org>
References: <20210722024227.3313096-1-bjorn.andersson@linaro.org>
 <20210722024227.3313096-6-bjorn.andersson@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Thu, 22 Jul 2021 20:16:25 +0000
Message-ID: <CAE-0n51ftru=ap2PvKiXDTVoQGA1drzU-C29b_KXTN=r=uC78w@mail.gmail.com>
Subject: Re: [PATCH 5/5] drm/msm/dp: Allow sub-regions to be specified in DT
To: Abhinav Kumar <abhinavk@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, 
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Rob Clark <robdclark@gmail.com>, 
 Rob Herring <robh+dt@kernel.org>, Sean Paul <sean@poorly.run>
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Kuogee Hsieh <khsieh@codeaurora.org>, Tanmay Shah <tanmay@codeaurora.org>,
 freedreno@lists.freedesktop.org, Chandan Uddaraju <chandanu@codeaurora.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Bjorn Andersson (2021-07-21 19:42:27)
> Not all platforms has P0 at an offset of 0x1000 from the base address,
> so add support for specifying each sub-region in DT. The code falls back
> to the predefined offsets in the case that only a single reg is
> specified, in order to support existing DT.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
