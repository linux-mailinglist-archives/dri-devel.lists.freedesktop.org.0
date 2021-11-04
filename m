Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6C79445189
	for <lists+dri-devel@lfdr.de>; Thu,  4 Nov 2021 11:20:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE3746E3A0;
	Thu,  4 Nov 2021 10:20:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 739B26E3A0
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Nov 2021 10:20:33 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id o14so6438984plg.5
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Nov 2021 03:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+iI+yFGltrW+06mguQHc9k6iWJ/LtyIDZvg2aS6FlbI=;
 b=vByyAndzTW6mzuIoNib020TqkRvaFsT8d9tTW9wo5B95xp3j1s2++/Ub4aok4aNpFw
 phr/qS7k2KdIrM2YVaJbBRYgaDHKUWrNWWY3079+PabzfES4VqYGHMW8zysSvWCbvpcg
 g9i7kxZm71akabWh4xqkojc6H6lDdcV+3Pw7mrk0yaWtXFWqOnFz5x+WfJ4d/lKkFQ9D
 PNm/5kwDHG3Eb1UxzrXaiHFziTtFuss9nGh+rxwLhryqdEksLGZ2OlWd1WcZiIVezvwL
 y2vPBvRfNyMs7fjZG0x16qS6UGku5uMYmXJxJclSFZnmFVR//rmbv6ocAGDd3g9Z5KUi
 nGhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+iI+yFGltrW+06mguQHc9k6iWJ/LtyIDZvg2aS6FlbI=;
 b=8Fogv1sobBvPqcfy0ASPgjr2/cmhyLC/oteGagnazAul1hS5Dk2BC28Wha6y5o70x4
 rsgRlGVg6iOsOgObxB3RNjhvow/VCjycTRdLRbuCqXFXwXj0LirOfkQM9tdUby41o7Kj
 Aqg8GhWYCnl6h/hVpdll8+XM0rXM+WeQu46U3+DCBDDsjCZMJgbMinPvlsjGB2j/xqHF
 pzdOGztKoKDwKCuCZHDgz/Xf8UbrdZooqJMhzz5nXya9lQlXC0kipxDANWsxnDix5NlU
 3RZ6xf/REMq3yE3S+1hgLsvMdZXUGzl6EKiqEfoda9Dota2P8uM2XEVu/kvHWhNr3Po/
 rz6A==
X-Gm-Message-State: AOAM532p7MvPLfRyg1BT/Ti/vIlR1YE+aMu+zN9TdPH/GdcscJvwdKJ8
 dvkwnp7Rh3mp0akFL9i97FDL62PPF4exaERINP30iA==
X-Google-Smtp-Source: ABdhPJw6qviQc/jm3Zx+oWk3YXSxKea6cIuLJPDMQLXoCm9GAH1sbwWu+GdEcoHT4o51yjXS8/3lk1/uvwaZIVqdcuA=
X-Received: by 2002:a17:902:d505:b0:141:f5f7:848e with SMTP id
 b5-20020a170902d50500b00141f5f7848emr22312139plg.72.1636021232689; Thu, 04
 Nov 2021 03:20:32 -0700 (PDT)
MIME-Version: 1.0
References: <20211104033331.2634341-1-xji@analogixsemi.com>
In-Reply-To: <20211104033331.2634341-1-xji@analogixsemi.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Thu, 4 Nov 2021 11:20:21 +0100
Message-ID: <CAG3jFyuKEdbCptFHSSeGRwyDF_D844NAJXhUdcsiaFC2WvUTeA@mail.gmail.com>
Subject: Re: [PATCH v12 0/4] Add MIPI rx DPI support
To: Xin Ji <xji@analogixsemi.com>
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
Cc: drinkcat@google.com, pihsun@chromium.org, jonas@kwiboo.se, airlied@linux.ie,
 bliang@analogixsemi.com, dri-devel@lists.freedesktop.org,
 narmstrong@baylibre.com, linux-kernel@vger.kernel.org,
 jernej.skrabec@gmail.com, a.hajda@samsung.com,
 laurent.pinchart@ideasonboard.com, hsinyi@chromium.org, tzungbi@google.com,
 sam@ravnborg.org, qwen@analogixsemi.com, dan.carpenter@oracle.com,
 maxime@cerno.tech
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hey Xin,

Applied to drm-misc-next.

The way this series was submitted to the mailing list is not correct
and is breaking a lot of tooling. It seems like you used git
send-email, but the individual patches of the series are not connected
properly and both b4 and the patchwork tools are not able to handle
this series properly.

Please try to use git send-email along the lines of this:
git send-email -$NBR_PATCHES_IN_SERIES -v$VERSION_OF_SERIES --annotate --to=....


Rob.
