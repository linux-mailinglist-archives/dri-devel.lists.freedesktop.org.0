Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F33A74EF223
	for <lists+dri-devel@lfdr.de>; Fri,  1 Apr 2022 16:53:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BE9D10E427;
	Fri,  1 Apr 2022 14:53:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52ED210E427
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Apr 2022 14:53:20 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id r13so6394319ejd.5
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Apr 2022 07:53:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Da7KJynBHqeOsfV7PF4dRVYQJiDDKv6l/8mUJ+3zlj4=;
 b=AFe3JxnY/m4Pgc9Z+14UgMCNooesh1wSpyQGHjyHOpb7VDmSVqKxwyNE9PRglzUvga
 Op0KXsftBx5NXNgmjjz8c/ePRRVzwx7kINO8ebFydSCDiWXKUwXaS7PyoLRWsFyttgZu
 fuWzUVDxy2agBVlhFu0VOZydIx5owpizaNxFI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Da7KJynBHqeOsfV7PF4dRVYQJiDDKv6l/8mUJ+3zlj4=;
 b=oOn0r14rr0Q6LvElR0kxLAQnXYZAMJheyrhnf/RhRSg2a8TRdHZthQ+W6pWOANJRtj
 qGGbXk3d2jBEcgcrj5VFFqmdnI1QUj6zAlb4qSBjylJBBCI5YsBbfso4uYxoRSXdP0fE
 42ieLADyx/jjzNfilsFSUZQ1mEn866cU4pD26CSaweOtkuqLkJ9XyJTS4Pv5zH8kPs5p
 qRadxnFXUQ8bwqxTVdkW2klqmk9RB18fT9O43v589JwZ18oMWlZJfHFS07FeHE4NPBuI
 BhZwKt9BaJikI5nckHvvOzx7gUZog43xqqmre+TeR08lHjjiqhVxlMcGSMu+Q0aTwE9N
 Fucg==
X-Gm-Message-State: AOAM530uOpEfUuILUuFehXtKfiDdK02Klr2xddUV2HT4PZ5E3pyZiFFF
 2ZJdMeWhlOu52mWydXM+j8tk1tS5OrUU3IZoknKaQQ==
X-Google-Smtp-Source: ABdhPJysrN5kQe7nGYTe0lt5Knhw4K9GqGpcmQ0vs06/hnboEO8fdefvSFWcHQ4xVSJac37D8ZltxxaJaz7p8jJYuwc=
X-Received: by 2002:a17:907:6ea1:b0:6d6:f910:5141 with SMTP id
 sh33-20020a1709076ea100b006d6f9105141mr146961ejc.123.1648824798860; Fri, 01
 Apr 2022 07:53:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220401113317.7033-1-marex@denx.de>
In-Reply-To: <20220401113317.7033-1-marex@denx.de>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Fri, 1 Apr 2022 20:23:08 +0530
Message-ID: <CAMty3ZDw_GBxdFB45_e7rCRwn0HmP8xyrQ_h2JO0xpYNF2CrCw@mail.gmail.com>
Subject: Re: [PATCH] drm: bridge: icn6211: Drop I2C module owner assignment
To: Marek Vasut <marex@denx.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>,
 robert.foss@linaro.org, dri-devel@lists.freedesktop.org,
 Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 1, 2022 at 5:03 PM Marek Vasut <marex@denx.de> wrote:
>
> The module owner = THIS_MODULE is set by I2C core, drop duplicate assignment.
>
> Fixes: 8dde6f7452a1 ("drm: bridge: icn6211: Add I2C configuration support")
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Jagan Teki <jagan@amarulasolutions.com>
> Cc: Maxime Ripard <maxime@cerno.tech>
> Cc: Robert Foss <robert.foss@linaro.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> To: dri-devel@lists.freedesktop.org
> ---

Reviewed-by: Jagan Teki <jagan@amarulasolutions.com>
