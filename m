Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E74906D0083
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 12:02:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4EAE10ED95;
	Thu, 30 Mar 2023 10:02:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com
 [IPv6:2607:f8b0:4864:20::1129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B7F910ED95
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 10:02:00 +0000 (UTC)
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-544787916d9so344149567b3.13
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 03:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680170519;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=8iTlDRktk7xPf3zd3cdhXI99KacYIZjktSgd38eWGh4=;
 b=VBUDvaY+gQMis+XrqLFcoRH9kL39smZkNiSqzBsf6noF9V3KOhTIHKgXpbkSBuk6e/
 Exemc3VKrlJFmzUriNDOL+l4iNhEPk92A5pJDPNJoPC6QtDrBua09JY6BN6WyrD3hl3Y
 cYVlJZd04rFvdBe5lCttihIXzt/il9BFiwl2Qcw804KmZGfwqtOSR0ox3PAtfph+7Q36
 FsVGVuJUEQ/weeOvJlbfd+rYLz0GzAL/zb/ysE8sThC99ioc4oBmHMB1yvl8bUFhEbv4
 JOqywAsh4E+UFMi65bJK9JXFuFOZHypMdSi48ruY6IV5TN3h29TC2v2G5hAc23oufQg8
 xXTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680170519;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8iTlDRktk7xPf3zd3cdhXI99KacYIZjktSgd38eWGh4=;
 b=uFKmuvqsZNQdTKjK+tEYYudK2w9k/vP4ihy4qkBVTCYKDGWWVuJQXaaH6UEo/RURyu
 iTEvl/6NX5mVapGzSJkrluxRcdUMecKRK9ASuQdwOsutr5KjOE+w64U2B+fh0YyLf+eM
 ItQKePaiGaj8Qanxghmh/Efmo9tHYmf7ustm6A+rtVB2+gaR7fBY3J3pyJEZYMW8ldlh
 xBTAmN4mZwLmEurbKTza4nYNqHxvxIlGVSu1h7n+dVh92XsIQgZQVH1/0oatreJzzf22
 idCF6LIAElZEWQ4AWUmBDwqkC45kvnJIoEswB093nXk2kQBEmZOAEUK05SFa9eIHK7PF
 qPig==
X-Gm-Message-State: AAQBX9evVyyERn9LJjoXnEp0JO76UpxyfccDcxMgBHaAzLpK/mDVpLEl
 wJeOPk41TicNeLw7uXf4qjM0lrU5E/dBmc9PqLP3FUckQM7O9o183M4=
X-Google-Smtp-Source: AKy350YsrGQ5f85kNh7qDhc8gU+uPe2w56kbUSbAgFRAHEIfvV4RYH3ZsM8gUtI2flmvhIgLAG6NcUHhA8RaF92lwu4=
X-Received: by 2002:a81:ae4f:0:b0:545:ed8e:f4f6 with SMTP id
 g15-20020a81ae4f000000b00545ed8ef4f6mr7079275ywk.5.1680170519380; Thu, 30 Mar
 2023 03:01:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230330074150.7637-1-tzimmermann@suse.de>
 <20230330074150.7637-5-tzimmermann@suse.de>
In-Reply-To: <20230330074150.7637-5-tzimmermann@suse.de>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 30 Mar 2023 13:01:48 +0300
Message-ID: <CAA8EJpqpsoDDE2RvPHmQM=YDFFxHPW2YENNZzL8We78aQo_NPA@mail.gmail.com>
Subject: Re: [PATCH 4/6] drm/msm: Remove fbdev from struct msm_drm_private
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
> The DRM device stores a pointer to the fbdev helper. Remove struct
> msm_drm_private.fbdev, which contains the same value. No functional
> changes.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/msm/msm_debugfs.c | 5 ++---
>  drivers/gpu/drm/msm/msm_drv.c     | 4 ++--
>  drivers/gpu/drm/msm/msm_drv.h     | 2 --
>  drivers/gpu/drm/msm/msm_fbdev.c   | 8 ++------
>  4 files changed, 6 insertions(+), 13 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
