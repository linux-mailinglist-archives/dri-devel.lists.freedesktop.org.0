Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8761E626321
	for <lists+dri-devel@lfdr.de>; Fri, 11 Nov 2022 21:44:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B36210E049;
	Fri, 11 Nov 2022 20:44:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BD2B10E049
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Nov 2022 20:44:36 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id v27so9214577eda.1
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Nov 2022 12:44:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=NnLqisDFGKGyEcOivxewv5QdcxXzGz5YXiWHVm2gs7Q=;
 b=jR2w8l/5qKL+O2Vvh57BDW7q1LHOcBDLQI+WmEiDLEw+ZYD0o/H9jLuNB/UBnBIqHL
 qrprw4ujpYS8N0i8zKaDbjhsyAuAwObSkeEB5FXAcHT4+OvwPNhzZV7SXieYcttnpP+g
 h/qeHb81Bubu/MGUENEVonrJL2iwTB1LfSxCs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NnLqisDFGKGyEcOivxewv5QdcxXzGz5YXiWHVm2gs7Q=;
 b=v6igrqxcFbKr8osxxQf/V5FKTbnHMcedjGpgC9UbS9I8LkEXgxBMXH5oneDf3KJYnx
 MERVOZ9rlUMb1SPau5eMHd7mXQsLSBn+KVwEreU5pLB1cvoulvHGARBlNNHSLpVeIYsi
 +14qm7rfSOvowFWJW4TiQ05A3xQdnNEPDAHi8oqEsn1dpJWmC/p3pNqM0oBVT7mK1hNR
 AFL8YTI8uhxZECkwewKqduYVtvlHAwRNQg/DDSSarmKd1Lc7p67aOXfEFY0NZm7vNDQh
 FxFGyPOi+zE4oy3EYx7mh9y9N/2H/ewLw8HNro+rhQ7k5Zl49b+qGDRpiifjGdDx2UN4
 +JCQ==
X-Gm-Message-State: ANoB5pm99+lZJorbATf1rXVurZtvR6k+tqpntJa6rGlEkJPR4C6Ko628
 JNrVOuhowRGuFeNZkvh1bRJ13U+aUjps2t19
X-Google-Smtp-Source: AA0mqf5xbx8cxXcFFrgMQHHmElR4rhuz3fmE1l5GCtdnKGw0pbzAeFbNtnjrHdCsJdYZhpr+fJOLgA==
X-Received: by 2002:a50:baed:0:b0:461:46c7:53aa with SMTP id
 x100-20020a50baed000000b0046146c753aamr3011554ede.165.1668199474531; 
 Fri, 11 Nov 2022 12:44:34 -0800 (PST)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com.
 [209.85.128.51]) by smtp.gmail.com with ESMTPSA id
 b3-20020a170906728300b007a559542fcfsm1247922ejl.70.2022.11.11.12.44.33
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Nov 2022 12:44:33 -0800 (PST)
Received: by mail-wm1-f51.google.com with SMTP id o30so3549308wms.2
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Nov 2022 12:44:33 -0800 (PST)
X-Received: by 2002:a7b:c459:0:b0:3cf:8e70:f34f with SMTP id
 l25-20020a7bc459000000b003cf8e70f34fmr2325334wmi.93.1668199472638; Fri, 11
 Nov 2022 12:44:32 -0800 (PST)
MIME-Version: 1.0
References: <20221110145102.1.I51639dc112bbbe27259df6bdad56dbabd655d91a@changeid>
In-Reply-To: <20221110145102.1.I51639dc112bbbe27259df6bdad56dbabd655d91a@changeid>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 11 Nov 2022 12:44:20 -0800
X-Gmail-Original-Message-ID: <CAD=FV=V6HAwvKskWvggxx8J3y_PkiisPzY5YzMV8BMTb3oSxpg@mail.gmail.com>
Message-ID: <CAD=FV=V6HAwvKskWvggxx8J3y_PkiisPzY5YzMV8BMTb3oSxpg@mail.gmail.com>
Subject: Re: [PATCH] drm/panel-edp: Use ktime_get_boottime for delays
To: Drew Davenport <ddavenport@chromium.org>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, Nov 10, 2022 at 1:51 PM Drew Davenport <ddavenport@chromium.org> wrote:
>
> ktime_get is based on CLOCK_MONOTONIC which stops on suspend. On
> suspend, the time that the panel was powerd off is recorded with
> ktime_get, and on resume this time is compared to the current ktime_get
> time to determine if the driver should wait for the panel to power down
> completely before re-enabling it.
>
> Because we're using ktime_get, this delay doesn't account for the time
> that the device is suspended, during which the power down delay may have
> already elapsed.
>
> Change to use ktime_get_boottime throughout, which uses CLOCK_BOOTTIME
> which does not stop when suspended. This ensures that the resume path
> will not be delayed if the power off delay has already been met while
> the device is suspended.
>
> Signed-off-by: Drew Davenport <ddavenport@chromium.org>
>
> ---
>
>  drivers/gpu/drm/panel/panel-edp.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Nice!

Reviewed-by: Douglas Anderson <dianders@chromium.org>

My plan will be to land this to drm-misc-next early next week (Tuesday
maybe?) unless someone has any objections.

BTW: any chance you'd be willing to post against two similar drivers:
panel-simple.c and panel-samsung-atna33xc20.c? They have nearly the
same code (and, yes, these drivers are purposely copies since there
was overall consensus that having one giant panel driver to handle all
possible panels was getting far too confusing)

-Doug
