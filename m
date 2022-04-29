Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D8C9C51585B
	for <lists+dri-devel@lfdr.de>; Sat, 30 Apr 2022 00:26:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C236810E32F;
	Fri, 29 Apr 2022 22:26:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com
 [IPv6:2607:f8b0:4864:20::1136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D704C10E5EA
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Apr 2022 22:26:50 +0000 (UTC)
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-2f83983782fso99272817b3.6
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Apr 2022 15:26:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pliQotq8Gk4OfWddZyGGuFsdsrtR6AKYvqqRL+l3RUc=;
 b=bFnRSfgZI91/epjFThwa37KRZgStacmn8aLzcdue3ISmu/HLUCkthJvSH0ELBA7P8d
 iJy6RB54sTSwzkw+vw6dzh1qX6X2+/tmKI81mczXcyvZPKqYe2SYH4AYd+9o4AzU38hm
 JTyR6p7PAaxqR36uXKL0jt6VqnQyg4YVRkJWkrBQwD3oIX0setUiUatpGWKcSh5QiUHE
 10QqBrdcyqJqpm4AuhkU954bcCNJmI0FhWermmbQuimGeuVpzRmOqUmk4+eCdW311Zkn
 xkF5iDUBqXjJBpP8FN3ooQ7i+3Yn0da/wZohqA8Ik0sLUGFlt3QYlu5qbFmkp78ksILg
 6/5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pliQotq8Gk4OfWddZyGGuFsdsrtR6AKYvqqRL+l3RUc=;
 b=rkuWIWN3pY2pCJDQ/9CC0LyR5/Z6/+xRm1verz9jcUXeITZJTCcKSPbPCZQe8s9Ri/
 dd0MFMJbDGYgLI6Mh1A2zbwWpgJls3o3aZMDwCiOjFpvM8PvtpmauraNJ2DpCxJ+Spz8
 7NLdHsh1Fdrrevo5dt3zDnS3FcXHy3nIfDzLkzH1Xsz3JZri76IDuGiVatuVUJ5lPUEr
 BCtj3mgAUfeCeOEY88X8eAdq07GzL7SQ4MSJ+aUA8yTdlUdLuVfuGhlbe32uQ5AKY1g7
 tvNH7Bf/+NkCAUAybyBD67MhGioh71P8hcJLDUo80ySKhLi9xk2g/J6EHwLSOF2F1yf7
 +vfQ==
X-Gm-Message-State: AOAM533ipP1tTIDbPxVhKRB5rwc0iU7YDekvYJQLBpjbK6/CCqPQulw9
 sAbwnleybXTqhcoMDiHHoXNiHiP4JwdhKTX6MNHqIA==
X-Google-Smtp-Source: ABdhPJx6ljA3beM+YMTLoQqiItsDz4O5n52EnJGVnsbEBGNiPpsDZfD/UKK3z8vfe7NajrynspZCwQ5NN9h2cg8Cyqs=
X-Received: by 2002:a0d:ddc6:0:b0:2f8:a506:a5c0 with SMTP id
 g189-20020a0dddc6000000b002f8a506a5c0mr1638069ywe.140.1651271209997; Fri, 29
 Apr 2022 15:26:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220429085358.1699141-1-jagan@amarulasolutions.com>
 <20220429085358.1699141-2-jagan@amarulasolutions.com>
In-Reply-To: <20220429085358.1699141-2-jagan@amarulasolutions.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 30 Apr 2022 00:26:38 +0200
Message-ID: <CACRpkdYu0tDS5vH0=_Pu0EmRPeD8pxV5WdPb6TrVaj+D7B05tQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] Revert "drm: bridge: mcde_dsi: Switch to
 devm_drm_of_get_bridge"
To: Jagan Teki <jagan@amarulasolutions.com>
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
Cc: Jagan Teki <jagan@edgeble.ai>, linux-amarula@amarulasolutions.com,
 Maxime Ripard <maxime@cerno.tech>, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 29, 2022 at 10:56 AM Jagan Teki <jagan@amarulasolutions.com> wrote:

> From: Jagan Teki <jagan@edgeble.ai>
>
> commit <3d7039e1e649> ("drm: bridge: mcde_dsi: Switch to devm_drm_of_get_bridge")
> switched to devm_drm_of_get_bridge for looking up if child node has panel
> or bridge.
>
> However commit <b089c0a9b14c> ("Revert "drm: of: Lookup if child node
> has panel or bridge") has reverted panel or bridge child node lookup
> from devm_drm_of_get_bridge as it breaks the non-trivial cases the
> first child node might not be a panel or bridge.
>
> So, revert this commit to switch the previous behavior of looking up
> child panel or bridge.
>
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
