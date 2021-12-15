Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 693674761BF
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 20:32:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD20C10EC87;
	Wed, 15 Dec 2021 19:32:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7804E10EC87
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 19:32:03 +0000 (UTC)
Received: by mail-ot1-x334.google.com with SMTP id
 h19-20020a9d3e53000000b0056547b797b2so26135784otg.4
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 11:32:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=37iLZzDUpFh5yORXA/4h/zBCNj8hCkym8Zzk5p+f3PE=;
 b=KGFIaQru2Z19Fmrep8ZJB8Ug70QxNjXcSZBC9ySdiB7y0R5J/rUIYeqUE67vFDJqvr
 GB3AUtYVg4qOKdLO7Uy0oyOoy6THle1C/SCD4wAcVXwNfFBKdMQh5qqV2TuB0Q1sLdUI
 dxOmRcUJHEMtJicpaqLlDOLjPr2Dxxzb7QmyE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=37iLZzDUpFh5yORXA/4h/zBCNj8hCkym8Zzk5p+f3PE=;
 b=Jq1y8zjIFO7mk0W54VqV0c1vLgMYLN73niDI3jtS7TWJr5JFKhww2R8DDEl3hoX5SL
 z0xyK1kEsCt7CRAYO2JRDP5GQAnjmgtbeM/UZlieCM71hOAnLpo+9NEYOEhmAm0ZGqH7
 isd6dXs4LekEZ9c72YJE5LjjzoNg+JzGSMaxjInfGFEZNlMyy/QxwIwxqybwIq1lD5+z
 1PXuNv4PzGCBCyZhQTWIH69RIjiSORIeby90F4s5i5XuuCMqP2yvCTlQtJz0g8t6nqoY
 5sFAE8/mTyhRr5mZDgm9X2ogOPKyujZYnLeGheDy3o764ZUy8RPQAXRIoptcDEt034dB
 mu6g==
X-Gm-Message-State: AOAM530qic0nPVYgN4pYIQ9LzyQ7d2cu2OQ9Y9paEnc+YeMT5CFIFST6
 I2/LEVGu+9bu5RlCjXuPIwdesYaacHkOD1OY0tip8Q==
X-Google-Smtp-Source: ABdhPJzehPr4Sd3IcF6mQ4BKkC++SK1JfZHU7wf7hmX1chD30TtsGgjUypAGJhCV+gaGtHafUqQwKCFzsRf7S1FrRLE=
X-Received: by 2002:a9d:2243:: with SMTP id o61mr9964550ota.126.1639596722789; 
 Wed, 15 Dec 2021 11:32:02 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 15 Dec 2021 11:32:02 -0800
MIME-Version: 1.0
In-Reply-To: <20211215160912.2715956-2-dmitry.baryshkov@linaro.org>
References: <20211215160912.2715956-1-dmitry.baryshkov@linaro.org>
 <20211215160912.2715956-2-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Wed, 15 Dec 2021 11:32:02 -0800
Message-ID: <CAE-0n51RCjyj=CW6Nz-Ei7kmAe2t-jKmZ5RbhFNfqDZ9V9gPsg@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/msm/dpu: add dpu_plane_atomic_print_state
To: Abhinav Kumar <abhinavk@codeaurora.org>,
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

Quoting Dmitry Baryshkov (2021-12-15 08:09:12)
> Implement plane's atomic_print_state() callback, printing DPU-specific
> plane state: blending stage, SSPP and multirect mode and index.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Same const comment applies here

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
