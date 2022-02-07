Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 042374AC833
	for <lists+dri-devel@lfdr.de>; Mon,  7 Feb 2022 19:07:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A701410E380;
	Mon,  7 Feb 2022 18:07:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08E2E10E380
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Feb 2022 18:07:27 +0000 (UTC)
Received: by mail-pl1-x62e.google.com with SMTP id w1so2179741plb.6
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Feb 2022 10:07:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=swzHcE97EWJ7OExA0+SF5lfM55/faQZ/BsbJXPEANiw=;
 b=MoSpV+TDFejXNP/Ru5fVM0SnMAN0DIm2kwXFm48S1LyBGlYC8t7HeQMscFm1zsWKQn
 LpH1a8Ceo5svFDSSBvWLZyXXBK5hWFI1e0bMw9aoSoNP091uQXy4jKDDVPQ8zzdy4kTO
 vNU0JJWzHeu+nYrPtKLuHZkE5v57Ieo59KtoZZOkO8nqlH7D3tuJrwruQ1WmxCdYr8b+
 mS3G9zI1iy4tVs4geSWQiWA+O4nPVV0g7NESnSJXLQTbD/1+EwL5hVgDVzYn5vo2tui0
 DOtaACCrVWjRx4hjwXqeJJsiZRaXGKcmNkorCZv8sYmQuEtVwqN6kmXXsedGZaJhSUML
 hwnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=swzHcE97EWJ7OExA0+SF5lfM55/faQZ/BsbJXPEANiw=;
 b=GwDx9C9g1V/dLR1uQ3qN9HKslYNdOAwOSUK4x4DXY7ip2ytBpItx7Rmo82CZ4DuSAp
 5v6LCkLh9REw60Z6J51Uc+WIjemtOIJI65gj9zdV9v6sW1EQNd2HYqh4RVws0IqTgAu7
 Uuce6AbOXmDwuUCH4lX+rtvFbEILgD4MVnOAGVMMLhQ9ITz+34nJ/4vYkUaf8zIRZG1I
 W1BZbwEo+LnMPWeYk3Nfce6Ni0AEim9n6bNPkmA/igeWi5TiuOPx0kF8xzrSZ5IMYKpP
 hBhHQu3Sh1+2oVj831Sj0ZO6s1Kfpo4F++B+avyXUBlRCy94yW229yEramKbQ7QWTn4H
 Gq0Q==
X-Gm-Message-State: AOAM530bs147hfQIbQNkQDWiRL8WjrrofJrmuG2ZsRauAgIJxKjX7drE
 VhAE8QcZTSZiD2eMc6iyoF1Yb9dthZreDNnZ1r8Z5Q==
X-Google-Smtp-Source: ABdhPJx4L9GwMqW7kHzYSw+H+7f8cha8zj7Ump2Ad5KV1U7ph3nV5BrC1hW9mlWB88S/6f/XzTuS/DAVPh+cVgIoKzs=
X-Received: by 2002:a17:90a:348f:: with SMTP id
 p15mr106049pjb.173.1644257246368; 
 Mon, 07 Feb 2022 10:07:26 -0800 (PST)
MIME-Version: 1.0
References: <20220207113307.346281-1-hdegoede@redhat.com>
In-Reply-To: <20220207113307.346281-1-hdegoede@redhat.com>
From: Rajat Jain <rajatja@google.com>
Date: Mon, 7 Feb 2022 10:06:50 -0800
Message-ID: <CACK8Z6HnOU9W6BUnBeN2c3oFKvxaTaXdOXSR7hsNR8EAxdyaTw@mail.gmail.com>
Subject: Re: [PATCH] drm/privacy-screen: Fix sphinx warning
To: Hans de Goede <hdegoede@redhat.com>
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In case it matters...

On Mon, Feb 7, 2022 at 3:33 AM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Fix the following warning from "make htmldocs":
>
> drivers/gpu/drm/drm_privacy_screen.c:392:
>   warning: Function parameter or member 'data' not described in
>   'drm_privacy_screen_register'
>
> Fixes: 30598d925d46 ("drm/privacy_screen: Add drvdata in drm_privacy_screen")
> Cc: Rajat Jain <rajatja@google.com>
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Acked-by: Rajat Jain <rajatja@google.com>

Thanks Hans for taking care of this for me.

Best Regards,

Rajat


> ---
>  drivers/gpu/drm/drm_privacy_screen.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/drm_privacy_screen.c b/drivers/gpu/drm/drm_privacy_screen.c
> index 03b149cc455b..45c080134488 100644
> --- a/drivers/gpu/drm/drm_privacy_screen.c
> +++ b/drivers/gpu/drm/drm_privacy_screen.c
> @@ -379,6 +379,7 @@ static void drm_privacy_screen_device_release(struct device *dev)
>   * drm_privacy_screen_register - register a privacy-screen
>   * @parent: parent-device for the privacy-screen
>   * @ops: &struct drm_privacy_screen_ops pointer with ops for the privacy-screen
> + * @data: Private data owned by the privacy screen provider
>   *
>   * Create and register a privacy-screen.
>   *
> --
> 2.33.1
>
