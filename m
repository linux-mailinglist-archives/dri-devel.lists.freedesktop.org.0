Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79B2463EACD
	for <lists+dri-devel@lfdr.de>; Thu,  1 Dec 2022 09:06:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99E6610E554;
	Thu,  1 Dec 2022 08:06:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com
 [IPv6:2607:f8b0:4864:20::b2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66EA410E526
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Dec 2022 01:49:26 +0000 (UTC)
Received: by mail-yb1-xb2d.google.com with SMTP id z192so266779yba.0
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Nov 2022 17:49:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ASlF8P8Cjkv5aBNg3NNVj0Sbno4BP6bRyvkitAAUHtw=;
 b=Yuio867pzsacBPROxPCWBAv2+4qJ5sKTgpsELTI3ERVE/woS/iqrhDdziy5L+emNY6
 TwlQOWhoLNYDe5OCwlEuxw9eoF9WJ82f3AGwXb32J1YmI7eEn9QJWBfdSXWuFxNuLhL+
 XztGqqn+9MDcOeFU1+CzTxDh2J2QRYQ731E6/pd0fSr9qTlca63zNWa6lLJs8/LkMB5c
 wWPDoeuax/0SXF9+FoQ0vlXXfOZ2F1GvkfMgusoOORUPQbDeD2odlyOQ8AS4TnmeFZGz
 xhc7l0XYssiszMAToVQSt0M9Ak0oLDJSGaVoXJJr27Jotvpjuq4OgQshs/qIHYnL21DG
 Otqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ASlF8P8Cjkv5aBNg3NNVj0Sbno4BP6bRyvkitAAUHtw=;
 b=FnFZD/SkuD6FSJd0JnA/a+DlJSXNnUSgThS6glMIes0TIF6rVe+uJVFiWJnY3Ge4KQ
 nWbpVmO4QAqtWTrfBaIK1aHwIuHsdUVghIiYWi/J5WNha1Gj8M/X77/dl6kCq6brjo/i
 8FH9zPit/UIWSutp9ooJzV/3j1KMssGNYxTQpc8taOki9wzz9uXxjlz5KgRTAKUMSRhN
 jO8eBheaL325OW72RNh/n8m8Fwbo+K/vPLzmLN7BEIk2WXyS6VWe1HllDQZE0NIZeUFk
 nvctIxc77NNH0zRdH3l/b2h0T4REgGtJwiXTnzPp+3IecWHKKCz1FjJIQDDp/s+Xo0O2
 J78g==
X-Gm-Message-State: ANoB5pmXSFRM6yjqdNA/mln6zRFvStnDyGN2BPTu06Uz1J4fsFVrgWpj
 uGtdGWVCwk9lwIJ4+T9irwYX2W1B0pUH+DPV3uE=
X-Google-Smtp-Source: AA0mqf7m930pENVDkd5XVVZzHpy7ijyk/f5n3TgDwvPUU0zxtEEIVoFHXoJCU6CJMStuzeyTSQzgy1IDXlCbcabAntw=
X-Received: by 2002:a25:b948:0:b0:6de:6c1:922e with SMTP id
 s8-20020a25b948000000b006de06c1922emr62074536ybm.0.1669859365431; Wed, 30 Nov
 2022 17:49:25 -0800 (PST)
MIME-Version: 1.0
References: <20221129084329.92345-1-zys.zljxml@gmail.com>
 <Y4dhMhPswo5Y7DuU@corigine.com>
In-Reply-To: <Y4dhMhPswo5Y7DuU@corigine.com>
From: Katrin Jo <zys.zljxml@gmail.com>
Date: Thu, 1 Dec 2022 09:49:04 +0800
Message-ID: <CAOaDN_RHiNvBcNy75VDubkD05LKmzRFymCo08QqBgwS8vrpCTQ@mail.gmail.com>
Subject: Re: [PATCH] net: tun: Remove redundant null checks before kfree
To: Simon Horman <simon.horman@corigine.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Thu, 01 Dec 2022 08:06:25 +0000
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
Cc: Yushan Zhou <katrinzhou@tencent.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 edumazet@google.com, Thierry Reding <thierry.reding@gmail.com>,
 linux-tegra@vger.kernel.org, kuba@kernel.org, pabeni@redhat.com,
 davem@davemloft.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 30, 2022 at 9:57 PM Simon Horman <simon.horman@corigine.com> wr=
ote:
>
> + Thierry Reding, linux-tegra, dri-devel
>
> On Tue, Nov 29, 2022 at 04:43:29PM +0800, zys.zljxml@gmail.com wrote:
> > From: Yushan Zhou <katrinzhou@tencent.com>
> >
> > Fix the following coccicheck warning:
> > ./drivers/gpu/host1x/fence.c:97:2-7: WARNING:
> > NULL check before some freeing functions is not needed.
> >
> > Signed-off-by: Yushan Zhou <katrinzhou@tencent.com>
>
> Hi,
>
> the change in the patch looks good to me.
> However, it does not appear to be a networking patch,
> so I think you have sent it to the wrong place.
>
> With reference to:
>
> $ ./scripts/get_maintainer.pl drivers/gpu/host1x/fence.c
> Thierry Reding <thierry.reding@gmail.com> (supporter:DRM DRIVERS FOR NVID=
IA TEGRA)
> David Airlie <airlied@gmail.com> (maintainer:DRM DRIVERS)
> Daniel Vetter <daniel@ffwll.ch> (maintainer:DRM DRIVERS)
> Sumit Semwal <sumit.semwal@linaro.org> (maintainer:DMA BUFFER SHARING FRA=
MEWORK)
> "Christian K=C3=B6nig" <christian.koenig@amd.com> (maintainer:DMA BUFFER =
SHARING FRAMEWORK)
> dri-devel@lists.freedesktop.org (open list:DRM DRIVERS FOR NVIDIA TEGRA)
> linux-tegra@vger.kernel.org (open list:DRM DRIVERS FOR NVIDIA TEGRA)
> linux-kernel@vger.kernel.org (open list)
> linux-media@vger.kernel.org (open list:DMA BUFFER SHARING FRAMEWORK)
> linaro-mm-sig@lists.linaro.org (moderated list:DMA BUFFER SHARING FRAMEWO=
RK)
>
> And https://lore.kernel.org/dri-devel/39c44dce203112a8dfe279e8e2c4ad164e3=
cf5e5.1666275461.git.robin.murphy@arm.com/
>
> I would suggest that the patch subject should be:
>
>  [PATCH] gpu: host1x: Remove redundant null check before kfree
>
> And you should send it:
>
>   To: Thierry Reding <thierry.reding@gmail.com>
>   Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
>
> > ---
> >  drivers/gpu/host1x/fence.c | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/host1x/fence.c b/drivers/gpu/host1x/fence.c
> > index ecab72882192..05b36bfc8b74 100644
> > --- a/drivers/gpu/host1x/fence.c
> > +++ b/drivers/gpu/host1x/fence.c
> > @@ -93,8 +93,7 @@ static void host1x_syncpt_fence_release(struct dma_fe=
nce *f)
> >  {
> >         struct host1x_syncpt_fence *sf =3D to_host1x_fence(f);
> >
> > -       if (sf->waiter)
> > -               kfree(sf->waiter);
> > +       kfree(sf->waiter);
> >
> >         dma_fence_free(f);
> >  }
> > --
> > 2.27.0
> >

Apologies for the mistake... I'll resend it to the correct place.
Thanks for your reminder, anyway.

Best,
Katrin
