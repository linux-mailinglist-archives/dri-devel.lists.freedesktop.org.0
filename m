Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7656B543E43
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jun 2022 23:10:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6965D112540;
	Wed,  8 Jun 2022 21:10:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 343FA112530
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jun 2022 21:10:12 +0000 (UTC)
Received: by mail-oi1-x229.google.com with SMTP id s124so11536522oia.0
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jun 2022 14:10:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=2AFwAFesfJ4813UotVRGN6T66bp496uOfNq86ymBnjA=;
 b=Gu0/kTCh4WF7PyZCMnOHmzT3iAFEwlVhUJhGNoJdNbZE6+tFQJicbmp10gzqauCk3y
 uHU+cJKTumIz0V8SpZCt5rBDD67LC2pT0/sLmt2RrKXKqacIOnXxceFW5JJq6XwxD/w7
 ue3hBYKlmbApXuK/gPZqvA1rLO8yj8JGgGeOA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=2AFwAFesfJ4813UotVRGN6T66bp496uOfNq86ymBnjA=;
 b=vfhAn4yvG4ms7njJS83JAZfhvbTCw+RQfZRGuBR2sT5zf4b8FujfQC5Dqtpo5C0zr+
 4VwmyP1pOZ1Pd0b6PjNF9cX+GB9rR1/Vcd+cZ2puIWz6gdDO6gAcW4Q654uzoelrcu6i
 cIcmmQBLXzDuWqe3NKfvZGDssRdlnTidvq3HPXjAm9pRFCV0W9mbXY+C53cj9l4MbuOV
 vo7KzUZVgmO1+Ez6pklh9ck0tn2WSqY8d/2Ka9cLYxQLfJ2tS6UUCF4grqsNLPBUYScE
 EItegwzhadX00gji6YGYZij3OtCK0G5ZYCclBQmZetaHIBYz1pVGUG0vfj5bpwubVWIE
 6jvg==
X-Gm-Message-State: AOAM532sNaIh7+0Qev/v8Mzk4T98jZOCDOa8GizaHNMzzxRCyC2HqBKm
 sk8ShTZ/8DJJEGkbYoRr0tfa0GtdVP+i9OmQnFjcmQ==
X-Google-Smtp-Source: ABdhPJxKEq+tHe/ctYG0XvwejZ/+4vC0XmkKWJtg4R6rUo3ggfFWaBqCfsX9oHlenFRTIHyh+lWXxP75QwiRkBs4cLA=
X-Received: by 2002:a05:6808:1703:b0:32e:851e:7f81 with SMTP id
 bc3-20020a056808170300b0032e851e7f81mr3590005oib.63.1654722611424; Wed, 08
 Jun 2022 14:10:11 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 8 Jun 2022 14:10:11 -0700
MIME-Version: 1.0
In-Reply-To: <20220608094816.2898692-3-hsinyi@chromium.org>
References: <20220608094816.2898692-1-hsinyi@chromium.org>
 <20220608094816.2898692-3-hsinyi@chromium.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Wed, 8 Jun 2022 14:10:10 -0700
Message-ID: <CAE-0n533NL8j2Fy8pe0yY4hdvF5pxxj8i9v=csqXx+S-1hM53w@mail.gmail.com>
Subject: Re: [PATCH v6 2/8] drm/panel: boe-tv101wum-nl6: Implement
 .get_orientation callback
To: Douglas Anderson <dianders@chromium.org>,
 Hans de Goede <hdegoede@redhat.com>, 
 Hsin-Yi Wang <hsinyi@chromium.org>, Sam Ravnborg <sam@ravnborg.org>
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
Cc: Rob Clark <robdclark@chromium.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Hsin-Yi Wang (2022-06-08 02:48:10)
> To return the orientation property to drm/kms driver.
>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
