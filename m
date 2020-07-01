Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DA87210551
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jul 2020 09:49:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 400C86E5D4;
	Wed,  1 Jul 2020 07:49:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05C186E5D4
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jul 2020 07:49:22 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id e4so25806879ljn.4
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Jul 2020 00:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=++uGLkdCf/60V7s9CDFLkDgLRpplORGsi+7jDmsg2a0=;
 b=VcehAVisE+6s2+bxMOyJUI3XZCbK9Yqe1A5IAZ74+sXsRGf1//4lTfVXvEi90+ymhA
 XLDA13LVc8yKXBNVrkEwfLG38vrVl1zaJNskU0H4dYNHnlcBml2CT/zODmOcu/Kbg13G
 RN3JWAi4jsyLj0x2pb0JFbZCYjDCTT4oAmZ8FcZVyHnnjv7/arqZaE9Kvh9DM91qcZPu
 b3CEEVEndnTMHN+ovKIZIzL1NDs+cjioV2ZLizrNYhkE86rMVj22ZPag9Wsw8pWFdHJY
 RrNoEe2rMSRtz5HlSpgVjr76KN+8Be6U5GeXpjcCqYwVyGCaaguHqJjxsOWLHgRyYg01
 8ktw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=++uGLkdCf/60V7s9CDFLkDgLRpplORGsi+7jDmsg2a0=;
 b=pOTaQWkZcO8i9lxMqC9OXzvtHbia9mj9PR1+YcGxOPEegUfRKeMgQMrsTewhPTogMs
 CkxL7McQY87gUknhTIqNufM765lLtrttnic678HbdCFBGnHcYe/tV2eNn7Zuk0af6dmh
 SiVis8sJjBniKt8xUKuyca1FnLEmRys6RKPmw7avC0hYb9/JmHQnRdqQANewTaInvz3D
 8SoBh+X63dkjKf5LcJC5iCCHV25uvIXSsqviolSitX69VUz1lhI7mzqZXZHeOWzc2tXl
 PfdH+fOnpv8xhqjubv9KZR80dFCouHW0Q1ABzjmU16/mOtxHYS6/mBALM9FTIACmFNiF
 Brog==
X-Gm-Message-State: AOAM530RhxGg37dUYruGDlCxEEVEo2sn9Ljs8wTEeqzYSdCs8JddUzAu
 GZANlg+CV4X2cagkMERVyFF7wKjtJdoBwOjreyVuQhhqPVk=
X-Google-Smtp-Source: ABdhPJw1FRf3UGjIm8Aw/1ssXYvNABKPHlodmDoTYJBWduHQRMKFH+GUhry8/4a3iTFlum0ADTfAg+Z+9PH8e1iUju4=
X-Received: by 2002:a05:651c:284:: with SMTP id
 b4mr1764447ljo.283.1593589761445; 
 Wed, 01 Jul 2020 00:49:21 -0700 (PDT)
MIME-Version: 1.0
References: <20200626005601.241022-1-megous@megous.com>
 <20200626005601.241022-8-megous@megous.com>
In-Reply-To: <20200626005601.241022-8-megous@megous.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 1 Jul 2020 09:49:10 +0200
Message-ID: <CACRpkdZN2rEB9gSQiBiB5Fu8tUUt=DCfF3dpfOBTsUbCc7HUgw@mail.gmail.com>
Subject: Re: [PATCH v5 07/13] drm/panel: st7703: Move code specific to jh057n
 closer together
To: Ondrej Jirman <megous@megous.com>
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
Cc: "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Purism Kernel Team <kernel@puri.sm>,
 Samuel Holland <samuel@sholland.org>, David Airlie <airlied@linux.ie>,
 =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>, Bhushan Shah <bshah@kde.org>,
 Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Martijn Braam <martijn@brixit.nl>, linux-sunxi <linux-sunxi@googlegroups.com>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Luca Weiss <luca@z3ntu.xyz>, Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Icenowy Zheng <icenowy@aosc.io>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 26, 2020 at 2:56 AM Ondrej Jirman <megous@megous.com> wrote:

> It's better than having it spread around the driver.
>
> Signed-off-by: Ondrej Jirman <megous@megous.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
