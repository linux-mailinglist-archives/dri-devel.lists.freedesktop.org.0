Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 33623336950
	for <lists+dri-devel@lfdr.de>; Thu, 11 Mar 2021 01:58:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8345F6E3F2;
	Thu, 11 Mar 2021 00:57:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73FA06E3F2
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Mar 2021 00:57:55 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id e20so183731ljn.6
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Mar 2021 16:57:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vSj/dwULrjxVufnDrQsDcLS09iDx+d6/UwmJlnNd/VY=;
 b=cwcp1C80AvtIfL9vAGM+afRexbxSMIx/F8UzcDXUXvAjbsHZ9BVODU2ilVUdcFhSWU
 +I6YUwMMB7/R6WlWEBNvImQPhH0nfFqhk4yzz5CsfxD/ASFQqfV/3HPVEs3K/Fcw4Zzu
 7O4uEdZAcCZrTCQRwxbwNsdHC0vKGF1NIrr/iXZTKDXGLGQhsNQ1lTWgm589PmPHZFq0
 uIuROkxkRmPOk2CQKNvgbK0gfoLbbvxrJEi7j3fIvlss06sPhpN4mOs1U0VbHxyrAU8T
 2puFwQYR0JaB9Gmi/fgryrhzashcruX9FP0JVtx/JBwBkNOzixksH+yXU6owoamCJTch
 KAoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vSj/dwULrjxVufnDrQsDcLS09iDx+d6/UwmJlnNd/VY=;
 b=ln79YxSCdHEksNltStnuaVwzrj4o3b+cC4f4IYyYSOQSp05gCiDiunJFmxfFN1AyfD
 2kXa0qpvatigurb3zNw1KuC81vh/JkEFu7+7WAZkpH1cOnshy+/YDkzFwcbdM3Wxx9DM
 gkCGTD+55QYbrHBpXyXuVZ54aQNy/aWBfAl25MLrf9nMf2nM3Re60Mda7Weiivvf58uo
 7YJqKoBrtgzjtRiNaGF+XgEAGt2Q7OoXSkjhnQk3sZm/DbuwQzWmAQYHMVNFuWMqX/RD
 FNuG/TG0EFWMpkc+yG40NZDA70Ao1T1OO6/qhowSYpNrsXIhvu7vuWa9Tq6K697477g0
 Kw6g==
X-Gm-Message-State: AOAM532Qnj99W1eU4GNxfaZr6mY8DbAWh1jMmOvQQUyRloPaEpgGUFQ+
 JyPfP9luo8ymEoXrbD1wJQwLvVT4dOiQHMdMk8jXpQ==
X-Google-Smtp-Source: ABdhPJysK0fExuH+11P9BQ/mtsfyGAM+Hu/0JEYndG2PKhUbYZml/8qS4OKjWWklTW1wK9sNp3uwaa/aE7+sFct5t8g=
X-Received: by 2002:a2e:700a:: with SMTP id l10mr3331922ljc.368.1615424273882; 
 Wed, 10 Mar 2021 16:57:53 -0800 (PST)
MIME-Version: 1.0
References: <20210115224420.1635017-1-dianders@chromium.org>
 <CACRpkdYUs2W3b_u8YrmYwq_kcUCf0DhZ-o2o6O2EmU5rdtv=BA@mail.gmail.com>
 <CAD=FV=WDVAj+OcVXaTJRUu8tvdDzySW0KOfiGqZHi5YvP42BTA@mail.gmail.com>
In-Reply-To: <CAD=FV=WDVAj+OcVXaTJRUu8tvdDzySW0KOfiGqZHi5YvP42BTA@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 11 Mar 2021 01:57:43 +0100
Message-ID: <CACRpkda1Ast1cqNfVJ_u6zs8610DWSQGykPt4yBw+mFZFrUPSg@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] drm/panel-simple: Patches for N116BCA-EA1
To: Doug Anderson <dianders@chromium.org>
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
Cc: Rob Clark <robdclark@chromium.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Stephen Boyd <swboyd@chromium.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 11, 2021 at 12:47 AM Doug Anderson <dianders@chromium.org> wrote:

> I guess what I'd say in summary is:
>
> * If you object to the retries in simple panel, I still hope the rest
> of the series can land.
>
> * If somehow this panel gets out into real users hands and we find
> that the retries are necessary and people still don't want the retries
> in simple panel, I can fork a special panel driver just for it then.

I'm fine with the retries, if it is needed outside of the "simple" (hm)
panel driver then we can certainly factor it out as a helper or
library.

I looked at the patches at lore.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
I see also Stephen has reviewed some patches.

Tell me if you need me to also apply them to drm-misc.
(I guess yes?)

Yours,
Linus Walleij
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
