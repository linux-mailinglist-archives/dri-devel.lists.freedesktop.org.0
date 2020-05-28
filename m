Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48DDD1E6F62
	for <lists+dri-devel@lfdr.de>; Fri, 29 May 2020 00:46:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 183926E226;
	Thu, 28 May 2020 22:46:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9D0A6E22F
 for <dri-devel@lists.freedesktop.org>; Thu, 28 May 2020 22:20:20 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id 5so219465pjd.0
 for <dri-devel@lists.freedesktop.org>; Thu, 28 May 2020 15:20:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:cc:to:date:message-id:user-agent;
 bh=NIrmsov8fCmRXlFvg/QT7vVocTnt+ne2gI6KC0HBK0s=;
 b=afY0mSX4ecEhor/wnhCdYO9il2Qtq7+n+SMWBVmU+POSzCk+3OpQZWwmv7EVvRA818
 1/xOb28Rt8SImGKI/oRgohVUXOtsGfffbAFwMcGZYFHDW8aYoSNHechWOLGk5al4qV7z
 vSI8HsqGIo6mCTOjm919fK1nnMI69ZuEw3k30=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:cc:to:date:message-id
 :user-agent;
 bh=NIrmsov8fCmRXlFvg/QT7vVocTnt+ne2gI6KC0HBK0s=;
 b=HJskwEXuYHPYes2zCDjH0UllxsG5a0t2gd8i4WwtamV90xAY3NNo+hy55kkUYAoHxp
 GecHnadm434Gpkl6qFLx1lmlCM5zaLqIOK5KdVbs4x9anJKd/xn8iGtP14+7tmlzUfg9
 gG6WNOxJrnFQQxAdZac8iTzpKB7bhzkeetEZBpgCa5v4nX67zCNMnslnhSDlfXRymSqp
 W4PwpXOXNuj09LeecOURu+uPpebQNMDxhjje3hxE1Vg+UK9j09lO4vzVBVmrbnjuKqYw
 5kyRpu7R/cHW029TI1+VbpNcJfj1a5Q3aHpe4JGqlG+0CNLhObGzPU8qyPTE+hqAhCq6
 Yyvg==
X-Gm-Message-State: AOAM533AHIuepLqkPP4uZsQKP5/errvla/j5MsWD6QIHe/5VGAzomo0p
 QhShYSDjmt7NHuDqCFIGn+TQjg==
X-Google-Smtp-Source: ABdhPJzUwecS9O4N+0Q5MiuUxbCuwmR873e50Cqr3EvQobTbxJBzbn00SvqWBzMofBCP1ZKG8DsPNQ==
X-Received: by 2002:a17:902:a604:: with SMTP id
 u4mr5665326plq.196.1590704420073; 
 Thu, 28 May 2020 15:20:20 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
 by smtp.gmail.com with ESMTPSA id v1sm6539323pjn.9.2020.05.28.15.20.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 May 2020 15:20:19 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1590655103-21568-1-git-send-email-mkrishn@codeaurora.org>
References: <1590655103-21568-1-git-send-email-mkrishn@codeaurora.org>
Subject: Re: [v1] drm/msm: add shutdown support for display platform_driver
From: Stephen Boyd <swboyd@chromium.org>
To: Krishna Manikandan <mkrishn@codeaurora.org>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org
Date: Thu, 28 May 2020 15:20:18 -0700
Message-ID: <159070441846.69627.1650074507855844615@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
X-Mailman-Approved-At: Thu, 28 May 2020 22:46:32 +0000
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
Cc: Krishna Manikandan <mkrishn@codeaurora.org>, linux-kernel@vger.kernel.org,
 seanpaul@chromium.org, kalyan_t@codeaurora.org, hoegsberg@chromium.org,
 mka@chromium.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Krishna Manikandan (2020-05-28 01:38:23)
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index e4b750b..7a8953f 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -1322,6 +1322,18 @@ static int msm_pdev_remove(struct platform_device *pdev)
>         return 0;
>  }
>  
> +static void msm_pdev_shutdown(struct platform_device *pdev)
> +{
> +       struct drm_device *drm = platform_get_drvdata(pdev);
> +
> +       if (!drm) {
> +               DRM_ERROR("Invalid drm device node\n");
> +               return;
> +       }

When would this ever happen? Please drop this useless check.

> +
> +       drm_atomic_helper_shutdown(drm);
> +}
> +
>  static const struct of_device_id dt_match[] = {
>         { .compatible = "qcom,mdp4", .data = (void *)KMS_MDP4 },
>         { .compatible = "qcom,mdss", .data = (void *)KMS_MDP5 },
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
