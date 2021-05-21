Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 64C0F38D22B
	for <lists+dri-devel@lfdr.de>; Sat, 22 May 2021 01:59:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D26EF89291;
	Fri, 21 May 2021 23:59:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3E2D89291
 for <dri-devel@lists.freedesktop.org>; Fri, 21 May 2021 23:59:06 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id r5so32064162lfr.5
 for <dri-devel@lists.freedesktop.org>; Fri, 21 May 2021 16:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UtXaKDenXBySBK0TfM1EMxAQDLRh841VvpXVRiiVUvc=;
 b=l/ZBIV0LxJZKphPyhbyW43OOU2yp8xZ92a5Ah11vgrwE8V8smW7rWuS0b4CVNI/whn
 Ovbq60mhXh8w6Z6p9gATsdO7r086OqjMXO6BdNHDrAl9evq9wat/RHOP8ZFdSiiv5mVA
 zhkDw3Qqrv0BEmjFhfXKAlbbtRdED4qvKB/4r/pXxjUZPErzux0GtNgbEJ6MCljLCw/I
 EbGfShiLKn2RNF5OjGAanJ78bcRaWHVox8gmK1VXNU1sfjnHcFIzXz4Z9yWIWPVfAXcG
 5QwjBeelSC2ozzMeSooNil84e083oO6ax4eezdSBi1H/NB6d0HepZH2SeqYQIh+CNUZN
 yfvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UtXaKDenXBySBK0TfM1EMxAQDLRh841VvpXVRiiVUvc=;
 b=HJDfROs27mgr5txCFT8AwOe4hU2CY4bVoVw6oNV4DdtpIn94Afj3pBkJpJs6HM8mmy
 MR+NrIxh5BtPPM4B8Xk1tEaLBREs6j7OrcyIKfUz/7NH4TSwWegIrf1XdtlQJC2v4Dio
 MokbY+ZKkQkYgTt1BJBXQlmaeQlcXrc2LpMwcLxawcV5zwOSib/r8fca26YxryZ3MkNq
 YGmmzfHFGejgFnxOwPuw8agk9if9pVBzvz1FiNfg8OHDzrse/TIpV3qATCfze7Ihkc1X
 W08uBHc5MerrezN2SqXL9Zt9yt7gjj9pAqvn2W4l/t9B8sVgMO/dBoRS4vVPpGgNGI75
 6OOA==
X-Gm-Message-State: AOAM530TJCxJt4jKN4ZxKf8a1dkN7rR7I966uieS7Fsts0p4tzf4nXlL
 skoJVUJLWRP7WLB0iP0VNl64O5VpHS7ESdibu3tB8g==
X-Google-Smtp-Source: ABdhPJwJgkbKclxwsHe3oXlbInX45ZV/GZHryMWwxDkpvhVp+UFyq9qP8eUx2aDrz0H4RyPMsRi+jJlPUbA6mPlSHOA=
X-Received: by 2002:a05:6512:49b:: with SMTP id
 v27mr3814112lfq.29.1621641545404; 
 Fri, 21 May 2021 16:59:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210511091344.4508-1-thunder.leizhen@huawei.com>
In-Reply-To: <20210511091344.4508-1-thunder.leizhen@huawei.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 22 May 2021 01:58:54 +0200
Message-ID: <CACRpkdYP8se7UrjztePqNdcStccY9u2er--Bwa49yZZr1XnbTQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] drm/mcde: Remove redundant error printing in
 mcde_dsi_probe()
To: Zhen Lei <thunder.leizhen@huawei.com>
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
Cc: David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 11, 2021 at 11:14 AM Zhen Lei <thunder.leizhen@huawei.com> wrote:

> When devm_ioremap_resource() fails, a clear enough error message will be
> printed by its subfunction __devm_ioremap_resource(). The error
> information contains the device name, failure cause, and possibly resource
> information.
>
> Therefore, remove the error printing here to simplify code and reduce the
> binary size.
>
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>

Patch applied to the DRM misc tree.

Yours,
Linus Walleij
