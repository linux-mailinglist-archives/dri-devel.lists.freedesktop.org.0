Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8E8D2733B3
	for <lists+dri-devel@lfdr.de>; Mon, 21 Sep 2020 22:39:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 073FC6E07D;
	Mon, 21 Sep 2020 20:39:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4116C6E07D
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Sep 2020 20:39:49 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id 77so8230412lfj.0
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Sep 2020 13:39:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BKFgrSzh3CR2a5kqwdG0SseQYvO/gvpZ2oNSwM7Odnw=;
 b=ivMz11c0DZC4SwrM1y5LllakS0MN4lOSvJmS4Sh2MKocEvZkI4F+h2QsGoDBxwS0wK
 82cUJChPGFy9Im+AFOuIB5JCCTSYqHcPMJ2etVZPnazUKjpv6QlS5TeYa2CvF6mW3Xin
 c20EnhACL33B0kzvOP0rI5lgtNHsXfNmO7A/yY5CKL4ow3nBZcrY2lOmde5S57+eaddb
 OvVg9AP1seDwxc99NMk7f5OH6bWbFyKoBuWdjZOXXGRHmlKg3UwPzH0+GV6ixMbhl/6N
 4PMZHXcKUcYS46JYJTM4yi0hhwkaWI+0PjqOKFD1kwCmSOpZN2xL8JT5QVM3bO9lwuU8
 Xi3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BKFgrSzh3CR2a5kqwdG0SseQYvO/gvpZ2oNSwM7Odnw=;
 b=Vwvq2ZOXC7TdVxmTri31Ca0zt7rTTP1Fe4xRkNyMrMvfdO8INnMMrKOcT+c4g+EZ/X
 FoReW0w9UN5KJe+Pb+KyJUgwtPanuCIe1ikpDlXjzfre+l2ldLa8lT1fvsPMynuYUG9l
 sSZnGX5WOXlumGgg5OtlqB8FrmsXadQ/P+nSqRSnHGkyE3XROSraVbI2jaszu4uccDaH
 d6NIpqxOHQ9iGxH+NQUIGYFLSAf9z/jMZuq1EptaNuSKcdaNuzfHzbs/WVfsZbTHgB8F
 C+0l0Ug+HDVHeuPU3W+KKsOk4ZYavHxZsJKQo+hZDIcUsuKx3Hr8MBmxzJ2R1VBY/CNe
 apGw==
X-Gm-Message-State: AOAM532SFjRJRPFBgHdMq7zUFoN+mDkIboECdoCAq2ysTs0tr4z/hoUZ
 wQV6idjND13wVTKpzEAEawZ6fQoXt1UUVGiEE0mtfQ==
X-Google-Smtp-Source: ABdhPJwYVSHltY3th9CEo3qNJNhITzvPgcncUSbFODbhuE4Z8YRUO0nnLOKCQS36fRdYFem1iOMpkCKvNsOlOBRPJcw=
X-Received: by 2002:a05:6512:370b:: with SMTP id
 z11mr489535lfr.571.1600720787591; 
 Mon, 21 Sep 2020 13:39:47 -0700 (PDT)
MIME-Version: 1.0
References: <20200916132301.2914017-1-yanaijie@huawei.com>
In-Reply-To: <20200916132301.2914017-1-yanaijie@huawei.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 21 Sep 2020 22:39:36 +0200
Message-ID: <CACRpkdZwwkiET_2h3B1rvcfM=SUMaOC8py8c6O6EYHh2Kc-hoA@mail.gmail.com>
Subject: Re: [PATCH v3] drm/panel: samsung: make vint_table static const
To: Jason Yan <yanaijie@huawei.com>
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
Cc: Dave Airlie <airlied@linux.ie>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Hulk Robot <hulkci@huawei.com>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Sep 16, 2020 at 3:22 PM Jason Yan <yanaijie@huawei.com> wrote:

> This eliminates the following sparse warning:
>
> drivers/gpu/drm/panel/panel-samsung-s6e3ha2.c:217:15: warning: symbol
> 'vint_table' was not declared. Should it be static?
>
> While at it, make the table const as it is never modified.
>
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Jason Yan <yanaijie@huawei.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Patch applied to drm-misc-next.

Yours,
Linus Walleij
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
