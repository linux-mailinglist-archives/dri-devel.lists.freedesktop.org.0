Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 148B1568DEB
	for <lists+dri-devel@lfdr.de>; Wed,  6 Jul 2022 17:46:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A09F11A60E;
	Wed,  6 Jul 2022 15:46:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9786111A60E
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Jul 2022 15:46:40 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id e40so19818362eda.2
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Jul 2022 08:46:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ArRN4vS4WYW+UtwDVjBQYC/h4Qpd9mKoSxm/dzHairI=;
 b=YNHJF3tZQJmC1EOhWUuvBhdzyOOfUsgXwnl6A41GdSylj/q8oVNeC+uxHedNpTMhL4
 4jDkvSi1ok7oL7zW7TWR/b8oSxoMmbyaLBY8kLBbVjJ1nMzAAnLOFhljvdZ0zSFIgQGv
 hjlUiAolFD8Ftc9ta1v86i1gHs3S7Y2DhGo+xRzXf6Awp5tc09rWb0XzkJgzaa3lh6Xs
 9cZhWOcARl5wiKfsaFHoBYxeoVf1Yt7VrO6D4l+LBaLAtmQKsLlF50Bh8LifyrH6bXWM
 cRUv5/bXV4DpG07PGZbqphIoNudeoOn0WZWMGhNicse2p9cFAbjBb5cIH3vkfganXhc/
 bjIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ArRN4vS4WYW+UtwDVjBQYC/h4Qpd9mKoSxm/dzHairI=;
 b=Q7FoeO4rdcdzUgPfUK5c6XLKj26zC0oxkTS2bC9LAgT3UWDoIPwiQ7mHZV8BHQ9Mfj
 jEtjwWvF2oQZUYZiCEeGOSqhL5xPacc+1cjLJ7oN3vW5Lpg+/yxCRoNsUPWMeN+jDsb9
 84Di24kcUA+9yYIuzlyJUmZO8K4CS3YfNprLhIXljkov/JNDRcPFz/hWnwA3xKp2PZfY
 pwFvEtg+/7RDXsgItcK0iMX2zG1wchHtAbhd0vtJKiyZhVuq0RQUb+Dp1GxBsItdZQud
 kk6H7F6eXqOoIzIAfiXPgn9+kWZmzCnnG5EE/1Q08S1nmP8Tv/gc9w5fW2I4AfYR1qIc
 t6hg==
X-Gm-Message-State: AJIora8HYpBA5YKSNBTtV/Bnn8sHFdGGJjr9ISSZkFiDnoKccwof94zt
 XOGf7iuqAaf2iyWTBIoWTFSryPT2HBpqgL5KoKY=
X-Google-Smtp-Source: AGRyM1t9mV36ZGcyklfBPmx0k1p5IWGVDwhcEUPZu7CLUml/Uv87cpi4zXtiKznLR5ejct/uBVvXSE8mtn3iVtfOReI=
X-Received: by 2002:aa7:cd64:0:b0:43a:4d43:7077 with SMTP id
 ca4-20020aa7cd64000000b0043a4d437077mr24358556edb.302.1657122399092; Wed, 06
 Jul 2022 08:46:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220411221536.283312-1-dmitry.osipenko@collabora.com>
 <a78343c8-2a6d-b223-4219-6b6b0a4fcb1f@arm.com>
 <CAK4VdL2hCEoshWZbCh5mkHuS6wYMiPFR3v4MWTnrEKM9zyv6Mw@mail.gmail.com>
 <ef88ec2c-77b5-fa0d-49d1-fdd2451713b7@collabora.com>
 <573fae0d-c9ab-98b0-c6f1-5b0d4e52dd01@amd.com>
 <a33ab7b9-738f-db91-f6ba-78a9641365e8@amd.com>
 <b05f9861-1966-72f5-132b-aebb4b6e0c6b@collabora.com>
 <107fe968-8311-0511-cc31-22feb994a6d7@collabora.com>
 <3e07a8d0-2cbc-8f3e-8f9f-5b73fb82028b@amd.com>
In-Reply-To: <3e07a8d0-2cbc-8f3e-8f9f-5b73fb82028b@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 6 Jul 2022 11:46:27 -0400
Message-ID: <CADnq5_MMmeWkiMxjYfrG7pip8BEkbkRc8ADUDLEi++kRF76sqg@mail.gmail.com>
Subject: Re: [PATCH v1] drm/scheduler: Don't kill jobs in interrupt context
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Dmitry Osipenko <digetx@gmail.com>, Erico Nunes <nunes.erico@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 6, 2022 at 9:49 AM Andrey Grodzovsky
<andrey.grodzovsky@amd.com> wrote:
>
> On 2022-07-06 03:07, Dmitry Osipenko wrote:
>
> > Hello Andrey,
> >
> > On 5/17/22 17:48, Dmitry Osipenko wrote:
> >> On 5/17/22 17:13, Andrey Grodzovsky wrote:
> >>> Done.
> >>>
> >>> Andrey
> >> Awesome, thank you!
> >>
> > Given that this drm-scheduler issue needs to be fixed in the 5.19-RC and
> > earlier, shouldn't it be in the drm-fixes and not in drm-next?
>
>
> I pushed it into drm-misc from where it got into drm-next. I don't have
> permission for drm-fixes.

The -fixes branch of drm-misc.

Alex


>
> Andrey
>
>
> >
