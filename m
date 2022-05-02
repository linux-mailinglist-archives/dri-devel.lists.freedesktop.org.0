Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF637517877
	for <lists+dri-devel@lfdr.de>; Mon,  2 May 2022 22:45:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B7A010E3BD;
	Mon,  2 May 2022 20:45:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x33.google.com (mail-oa1-x33.google.com
 [IPv6:2001:4860:4864:20::33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5CD210E5BE
 for <dri-devel@lists.freedesktop.org>; Mon,  2 May 2022 20:45:45 +0000 (UTC)
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-ed8a3962f8so5346066fac.4
 for <dri-devel@lists.freedesktop.org>; Mon, 02 May 2022 13:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=fihLXW+NVco1n2KLk1cRhGyHTF2MpnicbRd7YNgBCc8=;
 b=VMqO4vknzSGkmO3JauysvgHiitb0nyAUU/z8Wt91FgV//JFURVbUInKN2wizFBanSY
 R62egkUXbtY8Bs6HuC46H6MfGihxj/LzqhBbAVQ9IytYiWC1dwXb2O9AFEgxl7Hg5GFG
 3MJM7O/6PT9VIsAbfxD6cHZiiLZTWZ1MwgNgI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=fihLXW+NVco1n2KLk1cRhGyHTF2MpnicbRd7YNgBCc8=;
 b=oWoqMBr58fV4SIh1OcRI7anLRr3yK0iQahvgLmi54cNy1FuJeb9JhS2IaifIpgPivy
 pOkdkRSmOgOtGsZ/i1+JXvB0mUJuQt2LO5GZ39lPY+J2po4zi0/1FF902aPrhOV0MMnS
 /0pMyoDJDtV1vreqt2iHFsXyRv10hybpb9vHMnLrxzn62sxKGcM+XUr1lq/pXCpVh8UH
 /kQM6L+zaqnLIfVra+/Hp9qxkuiHANfabLga29xcrLyMAVXlFTPIRQCUvx2nyH8fTwsD
 y36cFZ4A5XbV7ZMl3dLCCgMslWRQIPVXbTWVLJGp/8Xb9DF11//rawjmCVsjNYjBrYoZ
 CtFw==
X-Gm-Message-State: AOAM531mrT4RQU0FFAsiR2D+NFzF1ByncOYwsOnwR65MTmBxUukjEDca
 na1VGKYItD9W208oaybrtmH1zKW6u9KHqD7cFbO/5x2EV/c=
X-Google-Smtp-Source: ABdhPJxCyZCBCI5TnWaYizB9SAj5o5xcSvfY9MCiWwXyKXV8wXqH7q+yt2TaurGnrXPzWY32EJ/pmKS7xPLcEdoM73I=
X-Received: by 2002:a05:6870:40c1:b0:ed:9a12:3f95 with SMTP id
 l1-20020a05687040c100b000ed9a123f95mr406707oal.193.1651524345048; Mon, 02 May
 2022 13:45:45 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 2 May 2022 13:45:44 -0700
MIME-Version: 1.0
In-Reply-To: <1651469981-21469-1-git-send-email-quic_abhinavk@quicinc.com>
References: <1651469981-21469-1-git-send-email-quic_abhinavk@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Mon, 2 May 2022 13:45:44 -0700
Message-ID: <CAE-0n526pBHnVZYYksDiRtYr7E=BtMB1VectX-ew8msLNWXh1w@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dpu: add missing break statement for
 update_pending_flush_wb()
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, freedreno@lists.freedesktop.org
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
Cc: dri-devel@lists.freedesktop.org, seanpaul@chromium.org,
 dmitry.baryshkov@linaro.org, quic_jesszhan@quicinc.com,
 quic_aravindh@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Abhinav Kumar (2022-05-01 22:39:41)
> Add missing break statement for dpu_hw_ctl_update_pending_flush_wb().
> Otherwise this leads to below build warning.
>
> drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c:273:2:
> warning: unannotated fall-through between switch labels
>            default:
>            ^
> drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c:273:2:
> note: insert 'break;' to avoid fall-through
>            default:
>            ^
>            break;
> 1 warning generated.
>
> Fixes: 2e0086d8c61d ("drm/msm/dpu: add changes to support writeback in hw_ctl")

What commit is this?

> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---

Patch contents look sane

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
