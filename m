Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 86714474FFE
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 02:03:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E07C10E1E5;
	Wed, 15 Dec 2021 01:02:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com
 [IPv6:2607:f8b0:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8919D10E1D3
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 01:02:55 +0000 (UTC)
Received: by mail-oi1-x233.google.com with SMTP id n66so29498534oia.9
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Dec 2021 17:02:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uw6bN6d4TEpZ4w8TTcuB+Vquo3dAMeEaia/fJgaxXHs=;
 b=SACGvHfj5YdxBygMuhuGG+TiirG1OgYendw09HPlxdJBYSZtfYEj+mqWeJb0iunRuA
 QfIrvHdKjVwAYWnM9T9wOc409ulqh6XeAgE6qfUdYFVBSW+t0KISMR17JY8NzngiK6B0
 f427tIdUCy0F04lppByT6bj7C8BX39k3rlzSYFj337Sbusq70XyqPRdzcV5ndUdhcxLU
 QlbTETEsMrXSOEPVK8+BnNKnjjpcGAPfGZqx5oyThCJOLL07DQR617qX8po3pP7YEZqG
 yan2StqmxmjQkTwtEU93K4rs28Bznd8yZ8e2IoGyN/z/F9DBtJ3FuIUHGaQO/lmuAUte
 nPQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uw6bN6d4TEpZ4w8TTcuB+Vquo3dAMeEaia/fJgaxXHs=;
 b=K8u/iB74OxtQkBo/I6HUgZNtZgLx9+Ry9PSTkGpj7MdOCbhSaoWwfcGr2sULO0TZlA
 YEd5G/I2H//36JojfnOfbnqIQS1j/PryH9u6fDzZ2cyGULhHyPaTHPXXhInfmcmDTpWe
 a6ZIq9Kf63T+uvq+gN1t8wXaGt5cvZ8MS8tV4mWNfSZD4BdvVLdhD4t9SQ98QSiP+bWw
 S4p2AzItJq+UQpMWTlSjHJ4K0S06FVDJq1802c2NYv/gBEPzfL3qOVj6ZANLVyWWGCFf
 WA6RRoYRZpuIWb3LAMt3yZMK3Skca76/PX/0tft7Wa9N7XEoXpECrqbl16QFvaPmaIIk
 yIXw==
X-Gm-Message-State: AOAM533tXQLl1NldP7TF0yqSGtHWSpWGc12NRF41BA26TBmCIJYx28+X
 YJoK8QaF2UMHtrIYlvkPJrwn8G8BJxpHgyzfDuGCuw==
X-Google-Smtp-Source: ABdhPJzOAvpi3w1v48JflBnBVLjgIFqMwloypvvyPKwd3U/6VNHLw2B2yHodWXAdIWQxrvvexiygjlv+LBDb09azMPI=
X-Received: by 2002:a05:6808:60e:: with SMTP id
 y14mr6839185oih.162.1639530174761; 
 Tue, 14 Dec 2021 17:02:54 -0800 (PST)
MIME-Version: 1.0
References: <20211215010008.2545520-1-javierm@redhat.com>
 <20211215010008.2545520-22-javierm@redhat.com>
In-Reply-To: <20211215010008.2545520-22-javierm@redhat.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 15 Dec 2021 02:02:43 +0100
Message-ID: <CACRpkdaFvQOSZmo4t7uTGo8m2yKDS4_h0-CpKW5KSFv=WDcWtQ@mail.gmail.com>
Subject: Re: [PATCH 21/60] drm/mcde: Add support for the nomodeset kernel
 parameter
To: Javier Martinez Canillas <javierm@redhat.com>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Dec 15, 2021 at 2:01 AM Javier Martinez Canillas
<javierm@redhat.com> wrote:

> According to disable Documentation/admin-guide/kernel-parameters.txt, this
> parameter can be used to disable kernel modesetting.
>
> DRM drivers will not perform display-mode changes or accelerated rendering
> and only the systewm system framebuffer will be available if it was set-up.
>
> But only a few DRM drivers currently check for nomodeset, make this driver
> to also support the command line parameter.
>
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
