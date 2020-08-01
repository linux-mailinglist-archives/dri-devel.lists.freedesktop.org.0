Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 80C7B2352B9
	for <lists+dri-devel@lfdr.de>; Sat,  1 Aug 2020 16:27:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DAD86EB85;
	Sat,  1 Aug 2020 14:27:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EB386EB85
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Aug 2020 14:27:45 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id b30so18281222lfj.12
 for <dri-devel@lists.freedesktop.org>; Sat, 01 Aug 2020 07:27:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AFX3q5UL/Hekj1Owrf1DlrLYV1j+LXmw4rViBH4wBA0=;
 b=m3RvS7W1RMIL7cIUF/3oGEnko2s0QlxcPiKEWwofhtIxpE1+qlBQSh5JhXkMo5E1bj
 tMGKBKPrEnDTY8rkKLiA9xqA6g4RsyuVDoEHdoGGLEC+o8cbU2pO+it0l8ZYhpd+9qVt
 GNcBM4ewwLtLPM7mLA5mtNiloJxl9rxL4480BgpKuW6V6z4NdUgTtlHPCwM5S/8/NTXh
 ro5xhj5HGhSRljkaCuLbwrXTAxhQ2NxEt9HyAGGgAMONfWfD/eoWNh0mQjQJGac2ki4p
 ZL8UwPAd45dsSpy9e1NrQ/fcthLHkik0/YAtDL5jZuS9BrpxcIZRxGPfRhlVJgWa9PGw
 fDMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AFX3q5UL/Hekj1Owrf1DlrLYV1j+LXmw4rViBH4wBA0=;
 b=sGNDFTJSY3SjC74oTaSTiRn+T01hP0rrPf/P29k8g4WB9hFvcYpGKwVvpJ74r7n6hZ
 bhyV1nkrNu1FOVEgTdBaAMFpV6gbmcU7hiOnPVdPgla08dSoWSqxWBVfMA6U/tMw6hQZ
 FTbtOuPDMeBf20T8Zerp0Ti6b89WsUmULzN9rFSMsIyJJEKqQF0gJxywIp/a8lF2r9AK
 FTfLOPmImJ4pRCulS96WTVd5GCBmXPf8I2eBJCbAYlST86TmBTovc0rMjEe8OYW+GW/m
 v0igTi2T3i37uDNRk5p/6ASE0TGtQgFg1r4dv5nS7wiSDa80fixHmMdOSVrCflDCGPPg
 zLRA==
X-Gm-Message-State: AOAM532Izp2kNhtk4JcXrVj5+Lae2RBgeZqeJAO7ZcLyAPeLwk+OXu3d
 e1ipWXidLIzJRCCpAIAu1zLAR35YFx8oorcHMdK3ZQ==
X-Google-Smtp-Source: ABdhPJyCsygFe37NY/t6SmyWsmcsVwZV/zyocjXdCnPbtYirvRY3A/8Zv0rdYuwoHTtlhA5YN9mBudELMfm1uUYdesU=
X-Received: by 2002:ac2:5e26:: with SMTP id o6mr4425871lfg.194.1596292063603; 
 Sat, 01 Aug 2020 07:27:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200801120216.8488-1-bernard@vivo.com>
In-Reply-To: <20200801120216.8488-1-bernard@vivo.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 1 Aug 2020 16:27:32 +0200
Message-ID: <CACRpkdasUurLu_zvUQ7jwyGDsGhFqeDA9oJ0qsTHVOXx0NT2rQ@mail.gmail.com>
Subject: Re: [PATCH] drm/panel: remove return value of function drm_panel_add
To: Bernard Zhao <bernard@vivo.com>
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
Cc: opensource.kernel@vivo.com,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Stefan Mavrodiev <stefan@olimex.com>, David Airlie <airlied@linux.ie>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Jerry Han <hanxu5@huaqin.corp-partner.google.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Robert Chiras <robert.chiras@nxp.com>,
 Sam Ravnborg <sam@ravnborg.org>, Icenowy Zheng <icenowy@aosc.io>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Aug 1, 2020 at 2:02 PM Bernard Zhao <bernard@vivo.com> wrote:

> The function "int drm_panel_add(struct drm_panel *panel)"
> always returns 0, this return value is meaningless.
> Also, there is no need to check return value which calls
> "drm_panel_add and", error branch code will never run.
>
> Signed-off-by: Bernard Zhao <bernard@vivo.com>

Makes sense.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
