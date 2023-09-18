Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FBAB7A47AE
	for <lists+dri-devel@lfdr.de>; Mon, 18 Sep 2023 12:56:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A50B10E00A;
	Mon, 18 Sep 2023 10:56:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com
 [IPv6:2607:f8b0:4864:20::b34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D20810E00A
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Sep 2023 10:56:18 +0000 (UTC)
Received: by mail-yb1-xb34.google.com with SMTP id
 3f1490d57ef6-d81adf0d57fso3376419276.1
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Sep 2023 03:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1695034577; x=1695639377;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=11o+CB6BjJCUVYOY4jdnDbQOvIN+SebUJmbfTwlkwtE=;
 b=FLL1UYj6TO2x/FiRuWGSOEp+6OrBhYMXZJiw4NOVFq+Crqtn30KtyZqcx0donKcLKq
 uj5FQGi3ATd0oV62l/dEMU42yxkY8qgT1oH2fJtXOpJxBlzH3GGTdrt+Aa2r6i4R9LCY
 995s5sE4Bp3moN7Soec6rytoEqndvSIGzuvAw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695034577; x=1695639377;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=11o+CB6BjJCUVYOY4jdnDbQOvIN+SebUJmbfTwlkwtE=;
 b=eTAkwHhapIJ0ca7Ks3QxZD6oxnImxr2XiCKl3ijFz+222M90dVIcx1YxASke8FhPbp
 4g3W+VKDtS+kipHbloIfT/UnYJQ0lNLDoM7TGPDjzaqV9I3xRNEGi4uIr6DuhYaVYam2
 Wp9NQdpLKjVhXDD5wCKLyvnM47/bGC9xYGVhP1Fq/Icb8UsKyuPCkuqVEAKUHiIw9YvC
 8Si9ruPrWxKuCDZa4eINjNkm3TPeccrW4Urpb2MMF3tL/2lpQbCyN7WHRnq6nCdO+/55
 CCvwSEP0rgWDBcSNlHoIAGU4jfEPhdzpyJvpvnr5M01WTGMZ6ICqS0XKDwz9mY3OfYsG
 vKHw==
X-Gm-Message-State: AOJu0YwRLCowTo6TICOlxRSYIVafbwRz8NpyZJjX056O+uQTwpZGN7Fj
 5uEia8idz2dV5vO8bY8hdw27zo61LJ4gqVyxiUvYqA==
X-Google-Smtp-Source: AGHT+IHj//tEaDP2rpkMtgG6MfmFqdVFb8tqHBTpzyrLRMuZlOMd+Hf71J7E0mMkvhm4d+rEwJyLnA==
X-Received: by 2002:a25:24a:0:b0:d78:1133:5488 with SMTP id
 71-20020a25024a000000b00d7811335488mr7911793ybc.5.1695034577590; 
 Mon, 18 Sep 2023 03:56:17 -0700 (PDT)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com.
 [209.85.128.169]) by smtp.gmail.com with ESMTPSA id
 e202-20020a25e7d3000000b00d7b9fab78bfsm2211936ybh.7.2023.09.18.03.56.17
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Sep 2023 03:56:17 -0700 (PDT)
Received: by mail-yw1-f169.google.com with SMTP id
 00721157ae682-59c2ca01f27so19964807b3.2
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Sep 2023 03:56:17 -0700 (PDT)
X-Received: by 2002:a5e:9804:0:b0:780:ce72:ac55 with SMTP id
 s4-20020a5e9804000000b00780ce72ac55mr10973227ioj.10.1695034085996; Mon, 18
 Sep 2023 03:48:05 -0700 (PDT)
MIME-Version: 1.0
References: <20230822132646.9811-1-jason-jh.lin@mediatek.com>
 <5a4a0d12-d16a-0836-f6c5-6e6c2f3a9097@collabora.com>
In-Reply-To: <5a4a0d12-d16a-0836-f6c5-6e6c2f3a9097@collabora.com>
From: Fei Shao <fshao@chromium.org>
Date: Mon, 18 Sep 2023 18:47:28 +0800
X-Gmail-Original-Message-ID: <CAC=S1ng8033sSGNFYr1vYfYfHbdG0Dk_0xai08=uomGO-EN66A@mail.gmail.com>
Message-ID: <CAC=S1ng8033sSGNFYr1vYfYfHbdG0Dk_0xai08=uomGO-EN66A@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: Add spinlock for setting vblank event in
 atomic_begin
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Alexandre Mergnat <amergnat@baylibre.com>,
 "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>, linux-kernel@vger.kernel.org,
 Eugen Hristev <eugen.hristev@collabora.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Jason-ch Chen <jason-ch.chen@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 Johnson Wang <johnson.wang@mediatek.com>, dri-devel@lists.freedesktop.org,
 Shawn Sung <shawn.sung@mediatek.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Angelo,

On Wed, Sep 13, 2023 at 4:35=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 22/08/23 15:26, Jason-JH.Lin ha scritto:
> > Add spinlock protection to avoid race condition on vblank event
> > between mtk_drm_crtc_atomic_begin() and mtk_drm_finish_page_flip().
> >
>
> Hello Jason,
>
> Can you please provide more information about this race condition?
> (check below)
>
> > Fixes: 119f5173628a ("drm/mediatek: Add DRM Driver for Mediatek SoC MT8=
173.")
> > Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> > ---
> >   drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 5 +++++
> >   1 file changed, 5 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/=
mediatek/mtk_drm_crtc.c
> > index d40142842f85..128a672fe3c9 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> > @@ -746,6 +746,9 @@ static void mtk_drm_crtc_atomic_begin(struct drm_cr=
tc *crtc,
> >                                                                        =
 crtc);
> >       struct mtk_crtc_state *mtk_crtc_state =3D to_mtk_crtc_state(crtc_=
state);
> >       struct mtk_drm_crtc *mtk_crtc =3D to_mtk_crtc(crtc);
> > +     unsigned long flags;
> > +
> > +     spin_lock_irqsave(&crtc->dev->event_lock, flags);
> >
> >       if (mtk_crtc->event && mtk_crtc_state->base.event)
> >               DRM_ERROR("new event while there is still a pending event=
\n");
> > @@ -756,6 +759,8 @@ static void mtk_drm_crtc_atomic_begin(struct drm_cr=
tc *crtc,
>
> ...because my suspect is that what creates the race condition in this fun=
ction is
> the unlocked *assignment* to mtk_crtc->event, not the rest.
>
> If I'm right, you don't need to unconditionally spinlock at the beginning=
 of this
> function hence ever-so-slightly improving performance compared to this ve=
rsion.
>
> Can you please try this one and check if this *also* solves the issue?
>
>         if (mtk_crtc_state->base.event) {
>                 mtk_crtc_state->base.event->pipe =3D drm_crtc_index(crtc)=
;
>                 WARN_ON(drm_crtc_vblank_get(crtc) !=3D 0);
>
>                 spin_lock_irqsave(&crtc->dev->event_lock, flags);
>                 mtk_crtc->event =3D mtk_crtc_state->base.event;
>                 spin_lock_irqrestore(&crtc->dev->event_lock, flags);
>
>                 mtk_crtc_state->base.event =3D NULL;
>         }
>
> P.S.: I'd try that myself, but I can't seem to reproduce the issue.

I'm still able to reproduce it so I gave it a try, and this approach
also seems to fix the issue.  :)
FWIW, the way I reproduce that is to toggle the night light mode on
and off repeatedly through the UI panel while playing YouTube videos
on my device.

Jason, can you post a new version with Angelo's suggestion?

Regards,
Fei

>
> Regards,
> Angelo
>
