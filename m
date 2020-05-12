Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A4EA1CF530
	for <lists+dri-devel@lfdr.de>; Tue, 12 May 2020 15:04:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D93716E913;
	Tue, 12 May 2020 13:04:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe41.google.com (mail-vs1-xe41.google.com
 [IPv6:2607:f8b0:4864:20::e41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 294B36E913
 for <dri-devel@lists.freedesktop.org>; Tue, 12 May 2020 13:04:04 +0000 (UTC)
Received: by mail-vs1-xe41.google.com with SMTP id x136so7771754vsx.2
 for <dri-devel@lists.freedesktop.org>; Tue, 12 May 2020 06:04:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WYYWk5B2Zk3TwldAUzCtTJK0glo/7kNcHTQydLAHm5E=;
 b=cHo71XNftzYCde+bfpfj3O5Me55d/CAF5uoY/3V6E4gXpR2DbAJUqHnB3U2PoAuPXf
 +jvSQcMEWbRTS89iqGm064nmezHp+7/wF5uH3tyUkSc4R5pkcDKPIYbrYDbNaQxOjKxj
 2Xl32Yq45X+snmh1X8CFrneUQu61MsPP5TfmRhdCdlbhcPQ6ZfjEqVDuVwX73I5HcoJz
 arzItnlRTzilZiKhUB/QYi0gSGwCbjQ7vMkte8LXU113pdTcZ4UA3fS2Kz4LKUad4boU
 CqMIy+MiXQhYJI3/cVd4ve/e8vid87Xl86l0Xg8M0kLqwsXVK53thEdrIyKWZi/8X3ZU
 AvrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WYYWk5B2Zk3TwldAUzCtTJK0glo/7kNcHTQydLAHm5E=;
 b=HF7amk9O8YW8tGbqQtLCYvnRd9gXX+pGqmZDYLnLDC0eQ4jawF1X5XQioRvqEp+wnY
 6XLq6KIpy5ub+XDKYDWBES67YZkHxFNib8+PAM+D2xe6El0RzcxMDSQ+Fs/gQ6YepJNo
 cx2pgxZ3U22fU9AF3/5B7fcU/gcTMxpxn5LxHdpxFrB8Mdx1mhWl6kKg4KIEfFY6QRg8
 +BRYR4ooVnY7MedC4F25s5c+s+mBfIlzvGZwk/s4lLLk8TjkGZHyCp3tyC2n55Oq10Qk
 xDfU+iwvG42wXa6UYCRo/adcCdFfciLS1dbHWdV3/Q37S5pJeIXRtwK80XSOZBFx8GEr
 Ay2Q==
X-Gm-Message-State: AGi0PubJRyUs+xX3yRinI9fcqX+ZLZ6vZ4GWwPzjbqqwVdhET1Mp7iFv
 /EDf9FIaF6IIPxGJfgFDAKRxnPIGeyDkB7pxFI3o0fRY
X-Google-Smtp-Source: APiQypJ4NEstWoq9lkMhuVta2nDgCif74eH1N9G3xJwYqz8c5+2f0vuiPACHvfsMZLwR/GXfTW7+fce+ImJb3qkLZhE=
X-Received: by 2002:a67:c482:: with SMTP id d2mr16214320vsk.37.1589288643312; 
 Tue, 12 May 2020 06:04:03 -0700 (PDT)
MIME-Version: 1.0
References: <20200428141459.87624-1-weiyongjun1@huawei.com>
 <CACRpkdZ++vYw8LAiNUv6AXQ0QTh+W9vSL0_w2AR-GNNd=GH7FA@mail.gmail.com>
In-Reply-To: <CACRpkdZ++vYw8LAiNUv6AXQ0QTh+W9vSL0_w2AR-GNNd=GH7FA@mail.gmail.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Tue, 12 May 2020 14:01:24 +0100
Message-ID: <CACvgo51t+LdpRuFw-uXgbstpHMRrgMt3s62mFsyO37OHjuWJNw@mail.gmail.com>
Subject: Re: [PATCH -next] drm/mcde: dsi: Fix return value check in dev_err()
To: Linus Walleij <linus.walleij@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org,
 Wei Yongjun <weiyongjun1@huawei.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi all,

On Tue, 12 May 2020 at 12:49, Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Tue, Apr 28, 2020 at 4:13 PM Wei Yongjun <weiyongjun1@huawei.com> wrote:
>
> > In case of error, the function of_drm_find_bridge() returns NULL pointer
> > not ERR_PTR(). The IS_ERR() test in the return value check should be
> > replaced with NULL test.
> >
> > Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
>
> Patch applied! Thanks Wei, sorry for the long delay.
>
It would be nice if of_drm_find_bridge and of_drm_find_panel were
consistent - either return NULL or an ERR_PTR.
Otherwise the next person using them is likely to get it wrong.

-Emil
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
