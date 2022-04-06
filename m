Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 896A24F62A9
	for <lists+dri-devel@lfdr.de>; Wed,  6 Apr 2022 17:09:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3163E10E1E9;
	Wed,  6 Apr 2022 15:09:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2e.google.com (mail-oa1-x2e.google.com
 [IPv6:2001:4860:4864:20::2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75BEF10E1E9
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Apr 2022 15:09:46 +0000 (UTC)
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-ddfa38f1c1so3178493fac.11
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Apr 2022 08:09:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=W+SggYf9ZzUodZE2aDeDsbfyv++1hsGS8AoCuhA4ZeY=;
 b=TABFHoDlD/pgPUkRr6Aj4RRrjDFDoyvY0P1V47KSIdKeldIqaeYv98NU2YIRxtdyXW
 ze/Dug8d8CJPMjX5RsVxT5gY81U0sQiwOb/E6NSCYeq1AIgO6w7SJ1zp+JUUeiPsKno/
 xxlsN2DRS4pK3QoqoH+UD9z91re79FgU/vmSk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=W+SggYf9ZzUodZE2aDeDsbfyv++1hsGS8AoCuhA4ZeY=;
 b=qe3/Qiq0t0i9Y569u/YrR4XI8jxLQzBtsFPLEc1xoh2kCWc6aNBBUrxOtE8MCM4KXB
 TaPaGbCDrOsgGxYo5rHS7GOwZNCo4UOH8d5WlFVK2Pr7/ljUoxnuhE9huv0WUDnVAxsL
 8DwD9ADXfd8tpgUekqKa4DUU14DrhMzhQehnveNz1dlssgumiCjl2p8Q5jF33HvvoS26
 JxmpNwsAZlhtNTZUnpZMkOd/pRl51JhUXqxVWpLRqV/aXy2DM6NT2sT5Cay9aNtwa0iy
 FgW9586Yq3aJnIn9r+JBAIVTq9Ece8kpFOle/wLOdHQM6EFeboYGuuga1okJKew/PxC+
 g7JQ==
X-Gm-Message-State: AOAM530htY0JHkG83eCXXLU5qc+y6GxH+h59RrssN8NHIy8KbGngJeAf
 mCVBioaZaCSRcwCb8YJAygyROC8OJiSmAYhpVEfaUA==
X-Google-Smtp-Source: ABdhPJyiriWb9lM7r6nEGyokGF5E6v8arQe+jgv787NGJAGxQR/U6cRpfcBrI1g3T3RShG5DwchbWml9Jseu+Ya+YfA=
X-Received: by 2002:a05:6870:558e:b0:e1:db7c:26aa with SMTP id
 n14-20020a056870558e00b000e1db7c26aamr4119396oao.63.1649257785731; Wed, 06
 Apr 2022 08:09:45 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 6 Apr 2022 08:09:45 -0700
MIME-Version: 1.0
In-Reply-To: <20220406100556.479706-1-dmitry.baryshkov@linaro.org>
References: <20220406100556.479706-1-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Wed, 6 Apr 2022 08:09:45 -0700
Message-ID: <CAE-0n52jMGWFFv3pRE2ZvY_+s1xGk09WXsqJsc1uR2buRZ0s3A@mail.gmail.com>
Subject: Re: [PATCH v2] drm/msm: remove unused plane_property field from
 msm_drm_private
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2022-04-06 03:05:56)
> Remove unused field plane_property from struct msm_drm_private. Also
> drop the enum msm_mdp_plane_property which also becomes unused.
>
> Fixes: 7d36db0be3b9 ("drm/msm/mdp5: switch to standard zpos property")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
