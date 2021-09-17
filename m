Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E22B40F09A
	for <lists+dri-devel@lfdr.de>; Fri, 17 Sep 2021 05:54:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C82426EB51;
	Fri, 17 Sep 2021 03:54:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com
 [IPv6:2607:f8b0:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CC1B6EB51
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Sep 2021 03:54:31 +0000 (UTC)
Received: by mail-oi1-x234.google.com with SMTP id n27so12237261oij.0
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Sep 2021 20:54:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=Z2XZ+ejIq8gAO03IprEPqdCwXRdO4jg+APIYrokV1Ew=;
 b=Rp3rJu9n89T3K7fmu6SfCo1sN0C2kzBXotX3/AHB1rVwR61CApN5AJQnffzqEdrGZa
 QuNT6a3cQziXs7y6ZcFZciqSM5sr+buMhOIKWiDZF5/4+TnYqo4ChqsVNHYtTPrySMiN
 OQDxBfP2g600GDx4NeR9QHxbSAXLc+xB7qZ18=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=Z2XZ+ejIq8gAO03IprEPqdCwXRdO4jg+APIYrokV1Ew=;
 b=GdV9JAex9DZYn56uMjbZdBkW+wts3UZrX8+fGt5km3wiLn2hy3Sy2XRsCD2OKH1HwE
 bxxK9L8fUP20i46QCvpVi2Qha/w4zDUJefZXOOYnsvKslxEiJuw5/85zdPAzEXUtK94I
 LsqxQMPwSeEjvbCE4wJgi+3c3DCwFDiiJ1NQObBifhY4dXuZJOU2glHB4k1FyhLNCHLg
 P3cHS8zhgFt0BbRz45oyCyoGQXRLHLPEsRdAZosaCQ/W9fI5owGQ2hsa1mpKF1/BdwAc
 uXY52oHjBPnr7WoC9JhDHGUv8fqQo57Av7RyVKKt1FyyUXNgG47NWoflxl5L1FbpXcj1
 QlWg==
X-Gm-Message-State: AOAM5304iucbCzq20oyMVRi1mbGrCRw7LTpx6BHBUxDY22g/zQDAzYGT
 YN4lbnvMSeYpBPzMRvJbqL1xMRmgpMDoIPL7GPSmcQ==
X-Google-Smtp-Source: ABdhPJzIXD5SaZh+FXg6/yC/JnECSczMBKqtkOdgIhgZufWgdBqAqD2dAboj1EodrmE90IHtcOhantUU8qDNKURFel4=
X-Received: by 2002:aca:2310:: with SMTP id e16mr2471632oie.64.1631850870446; 
 Thu, 16 Sep 2021 20:54:30 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 16 Sep 2021 20:54:30 -0700
MIME-Version: 1.0
In-Reply-To: <20210915203834.1439-9-sean@poorly.run>
References: <20210915203834.1439-1-sean@poorly.run>
 <20210915203834.1439-9-sean@poorly.run>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Thu, 16 Sep 2021 20:54:30 -0700
Message-ID: <CAE-0n50Yh+e_jgZ=H=YFV--ojYqqoDJTeqv6iz6vdSWhx6JJLg@mail.gmail.com>
Subject: Re: [PATCH v2 08/13] drm/msm/dpu_kms: Re-order dpu includes
To: Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Cc: Sean Paul <seanpaul@chromium.org>, Rob Clark <robdclark@gmail.com>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org
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

Quoting Sean Paul (2021-09-15 13:38:27)
> From: Sean Paul <seanpaul@chromium.org>
>
> Make includes alphabetical in dpu_kms.c
>
> Signed-off-by: Sean Paul <seanpaul@chromium.org>
> Link: https://patchwork.freedesktop.org/patch/msgid/20210913175747.47456-9-sean@poorly.run #v1
>
> Changes in v2:
> -None
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
