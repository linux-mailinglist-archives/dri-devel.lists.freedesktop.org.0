Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 826656D0012
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 11:46:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88A8010E14F;
	Thu, 30 Mar 2023 09:46:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com
 [IPv6:2607:f8b0:4864:20::b34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6756310E14F
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 09:46:19 +0000 (UTC)
Received: by mail-yb1-xb34.google.com with SMTP id cf7so22733096ybb.5
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 02:46:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680169578;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Xmf4KluG7S4v5uDGa2+BLs6ltj4TZB+1o0aJASQSOQw=;
 b=vVb5l1v4m4wjbO8U7AUqqFUk1Gu/g0kfn9LLEJKhee21SD8fNp5cFCodGYSDNFcCqf
 gpoh1hYchAtQb9hq+7kNFWLuPhTkb0U5ga9SjY6XVjSCIBA7Fe61TNa6cTCZVRHKq6pz
 TWLBudl5ztNNAYyg5w/Yzj3k4ZLG5FrEB2NggP187wWW+ewZszJ6X821CTlEKaiERCR+
 DKYBCjfSKArSwUlRS/0zxryZc1G0i83F+vbZLv9MH2jeHNZC1RtR/LxR4mdQBQhiSI0A
 SFAK6V9MBXNBvf2Th3XA7+U9/8FkOdQTWtWURDBKk+xn/Zb62kSHHQogy/Zgg1UTD+j2
 Kcvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680169578;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Xmf4KluG7S4v5uDGa2+BLs6ltj4TZB+1o0aJASQSOQw=;
 b=uq2Ht2mrgQHXSzEDTLg/LgxgJL4ZPm07LQXUJ00UqGp0Gx1axf/wCujPBDr2e7h8Bj
 1OPCMelDhYbd32rZGxTKCU+nlIMQRvaHLxYw5XhoC7+TjD/AThDy7YPX6A+ePz17TdlC
 CMqyt1ubtkD5jqWe6wLAsTVYinTc8Uo6sbBqjUjD6CNTKkUwVDYOZw7aYocesfSwMz2P
 ooQnV3ktHWEwueW+BvFRa2yMNcXYUBb2OGjIvt5umKS5u4GlfnLesf1vUjx0Dki3YMDk
 68RxFqNIX6jU5/nsBiQfuSD+HRYFCb0KtXzfo1YQcefJ+T3RqL21h1/BA32pf6nv05XI
 YUoA==
X-Gm-Message-State: AAQBX9cvB2npqo0p/4h9w19BbKikR6J6Bvw3SMcEHfcXxKt7moRz7zma
 WfXXyoG46HxMkBDNt9EjOsRet63hlWpYTW5Id11XvA==
X-Google-Smtp-Source: AKy350b25TKNX7LWY6kffjMjteju8c3Wk+7BpFOOlJ9BIgRcXEmR4R10+7PyamjASoryl8edb19Ysr4/N8lgH/tLRUQ=
X-Received: by 2002:a05:6902:1201:b0:b6c:4d60:1bd6 with SMTP id
 s1-20020a056902120100b00b6c4d601bd6mr15558336ybu.9.1680169578520; Thu, 30 Mar
 2023 02:46:18 -0700 (PDT)
MIME-Version: 1.0
References: <20230330074150.7637-1-tzimmermann@suse.de>
In-Reply-To: <20230330074150.7637-1-tzimmermann@suse.de>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 30 Mar 2023 12:46:07 +0300
Message-ID: <CAA8EJppVCKojseqV8CSpMh2Drqsk0jtH9Mza2PQq9LtN-2Ue1w@mail.gmail.com>
Subject: Re: [PATCH 0/6] drm/msm: Convert fbdev to DRM client
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: freedreno@lists.freedesktop.org, sean@poorly.run, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, javierm@redhat.com,
 linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 30 Mar 2023 at 10:41, Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
> Convert msm' fbdev code to struct drm_client. Replaces the current
> ad-hoc integration. The conversion includes a number of cleanups. As
> with most other drivers' fbdev emulation, fbdev in msm is now just
> another DRM client that runs after the DRM device has been registered.
>
> Once all drivers' fbdev emulation has been converted to struct drm_client,
> we can attempt to add additional in-kernel clients. A DRM-based dmesg
> log or a bootsplash are commonly mentioned. DRM can then switch easily
> among the existing clients if/when required.
>
> I did the conversion from similar experience with other drivers. But I
> don't have the hardware to test this. Any testing is welcome.

Thank you for your patches! It was on my to do list for quite a while,
but nobody had time to work on it.

>
> Thomas Zimmermann (6):
>   drm/msm: Clear aperture ownership outside of fbdev code
>   drm/msm: Remove fb from struct msm_fbdev
>   drm/msm: Remove struct msm_fbdev
>   drm/msm: Remove fbdev from struct msm_drm_private
>   drm/msm: Initialize fbdev DRM client
>   drm/msm: Implement fbdev emulation as in-kernel client
>
>  drivers/gpu/drm/msm/msm_debugfs.c |   6 +-
>  drivers/gpu/drm/msm/msm_drv.c     |  21 ++--
>  drivers/gpu/drm/msm/msm_drv.h     |  12 ++-
>  drivers/gpu/drm/msm/msm_fbdev.c   | 168 ++++++++++++++++++------------
>  4 files changed, 118 insertions(+), 89 deletions(-)
>
> --
> 2.40.0
>


-- 
With best wishes
Dmitry
