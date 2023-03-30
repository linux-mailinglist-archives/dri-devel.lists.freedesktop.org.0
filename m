Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B07756D0052
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 11:56:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0E7410ED80;
	Thu, 30 Mar 2023 09:56:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com
 [IPv6:2607:f8b0:4864:20::112b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D30A10ED7C
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 09:56:48 +0000 (UTC)
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-544787916d9so343942767b3.13
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 02:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680170207;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=RXazreuoSDNeY14GjG+L3kKUROFu/LX0XUCtalocMnM=;
 b=Q27wJUEvJTyPvijXy+9qg1b3N1bi8JzO7oBIfxk43L/4mnJwqi/DQ50YoHV2gP1SDn
 WEd8g0psLeqgsmxk4wmJ506yCMopC9oxoNHr/yJeTRSnOa5NSmEUYINlF4is9SmdOmAA
 7aWOLwf7v7Et1hre2bG6Fywp6w2Sh3mz+fIO1JeeZVfUN0IHkgES173p1Xa4Zs0aIyM/
 mI8+yq+TP5kEACBYVL6kJOPNI+2l6H0RhqP6WUfUhMuRS6u4cDI5a45NjYvDg7Z/RoiG
 HAtZUPLscJeS0jJeyZsHzX9SAsgYm2BsLYwnd2QCySEr1kUfoj86djdEfTSd/6hb6csa
 WCGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680170207;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RXazreuoSDNeY14GjG+L3kKUROFu/LX0XUCtalocMnM=;
 b=4m4/ZWAQHiYJWTesQtu29MidhSY6vMuY+i660HzAuSypRsdW9vF0jEsIbstw+mvPTr
 WWR77o9H5ar8cGVJ5FFRFK5uzOxJ3p1KMBRLQLzCQywVzDz+QiP7MuX2a8maZacCLFFh
 DX/fcZvHqNzLdA8DLdZk8DtSmLRjq4/6buf6WLLYZTbKctAslEydqas2abMBOwtMP6xg
 P9gEUz7BxMpEVo2NLkhyVijtYtsgHHIpR6IxokJBYY7suxxb9RrWH/xz+jEZ+9nTGyqi
 RXiVDl7bktuXL/0WoaH9YynIF+ZeA4aTzyImkjn/WfQLEampGOVVo1HFTCO4G1XQeDnD
 EsMw==
X-Gm-Message-State: AAQBX9fDlcg5GENXmCQK/GNdxWWoDtmJs3H66DGRyzpbKm0iriioX6qu
 +MMu4SMaAqsroHfL0rbxgkKXpBJbvRzuawLgg8knTw==
X-Google-Smtp-Source: AKy350bqExKE8rYdpf9ZxL1xQIW0Uc8JA5RZ+3QA/9kw/Ho7amY2K61SplWlLgJTuBESzGdhksCO0/Iw2lTRgROvVEI=
X-Received: by 2002:a81:4520:0:b0:541:85d2:af21 with SMTP id
 s32-20020a814520000000b0054185d2af21mr11299150ywa.5.1680170207528; Thu, 30
 Mar 2023 02:56:47 -0700 (PDT)
MIME-Version: 1.0
References: <20230330074150.7637-1-tzimmermann@suse.de>
 <20230330074150.7637-3-tzimmermann@suse.de>
In-Reply-To: <20230330074150.7637-3-tzimmermann@suse.de>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 30 Mar 2023 12:56:36 +0300
Message-ID: <CAA8EJppyFcwyVqB715rtQLu1642fa3i7GhKobgGyjQKG5vsG6A@mail.gmail.com>
Subject: Re: [PATCH 2/6] drm/msm: Remove fb from struct msm_fbdev
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
> Fbdev's struct fb_helper stores a pointer to the framebuffer. Remove
> struct msm_fbdev.fb, which contains thre same value. No functional
> changes.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/msm/msm_fbdev.c | 32 +++++++++++++-------------------
>  1 file changed, 13 insertions(+), 19 deletions(-)


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
