Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B12725EFEBC
	for <lists+dri-devel@lfdr.de>; Thu, 29 Sep 2022 22:39:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC7A310E128;
	Thu, 29 Sep 2022 20:39:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2c.google.com (mail-oa1-x2c.google.com
 [IPv6:2001:4860:4864:20::2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37C4810E128;
 Thu, 29 Sep 2022 20:39:02 +0000 (UTC)
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-131de9fddbaso2154839fac.5; 
 Thu, 29 Sep 2022 13:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=L6Jq2GQtVcQkjuptcsbFOufJYwxSeo/fK5+jPP+A2VU=;
 b=JdfcTXWoV3REgo2PZFYu+nhYhqFVHxKK/6/twg5bDlveZjOh0z6T6zjeYAKV2YVyfc
 YHbaJvQBClzHyDXMnbguYYMP8H81nU46mdM/fm+a/7HZEuoinjuOAXpeUa+IrfP70djn
 /MbgF8qBkX9tjcxUnlYjD/J23szs31h+zPkVzkdoMHuz/DYZbjbYL9aP9QVywW4fjiNo
 7eGCyKfBHC6Oc1tjKFpkTju4XPYLeVck2RzTGHOPZhM/Kbhm4cks4WsaFyJ0JHODTDF9
 JpO7+riyK8T15B++osfN0cGH+pGiwHBaIw8SGdHzqUat7HnPVKYUk5Ng5MxfbPZtMKEr
 x92g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=L6Jq2GQtVcQkjuptcsbFOufJYwxSeo/fK5+jPP+A2VU=;
 b=Kw/Eso3W4Y/1RNoLhp0OUfggfj23cDmrK4FNKSXobBg9NjFV16yypBUW+cEGkjqrwh
 MXCByubiIeR/NmgZ77wusp/egttd0zfqRgUTrqesUKFhqc61qVF4iaYRZMU7ayldDwm2
 6UaRaCkxS4km1pwEAZcbFWCL+Z5SypZxUxRaFfctY4UAkYs7RN3Jl1bWZo6UoKoDd3E9
 +LX7IOUvXpWvWNmgS6bWpAg8ACJp6aa85LEOX+pS8td8X4IITLQo+RfmwSxSWCzHbuZE
 DMyKVUxtU+dXBMD2ZMHUe6UKjTNL3tdOxth7jcRYaV41PCJoLMH6S++L1WWQthHMD1F4
 fPbg==
X-Gm-Message-State: ACrzQf1/Rb8Ab8EBCMspDexFxHwYUv2kcIDnZ7CMUVq7BuDXagBDV1cJ
 7nMJAOgR1ga9f3l2u2ZqGvD3ilUWRY7Qfy9u3gA=
X-Google-Smtp-Source: AMsMyM7tHG8MLEPAAC1oq+pOtaq8q9LCvdpsiOuBH5gC7p5A8Fc21TRp39srBqNjD9CRCr/b6Fq2r+vkwI+mI5j7i/U=
X-Received: by 2002:a05:6870:14cf:b0:12d:392b:1d9b with SMTP id
 l15-20020a05687014cf00b0012d392b1d9bmr2853008oab.38.1664483941436; Thu, 29
 Sep 2022 13:39:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220929093022.2428520-1-yangyingliang@huawei.com>
 <6504933c-048d-310a-1651-58528f868bdb@quicinc.com>
In-Reply-To: <6504933c-048d-310a-1651-58528f868bdb@quicinc.com>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 29 Sep 2022 13:38:58 -0700
Message-ID: <CAF6AEGvKFF+xrz0y39d0YU9+0empuMCqq2zF3Qtrjkk_oyxdUw@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH -next] drm/msm/msm_gem_shrinker: fix compile
 error in can_block()
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
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
Cc: freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Yang Yingliang <yangyingliang@huawei.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Sep 29, 2022 at 4:51 AM Akhil P Oommen <quic_akhilpo@quicinc.com> w=
rote:
>
> On 9/29/2022 3:00 PM, Yang Yingliang wrote:
> > I got the compile error:
> >
> >    drivers/gpu/drm/msm/msm_gem_shrinker.c: In function =E2=80=98can_blo=
ck=E2=80=99:
> >    drivers/gpu/drm/msm/msm_gem_shrinker.c:29:21: error: =E2=80=98__GFP_=
ATOMIC=E2=80=99 undeclared (first use in this function); did you mean =E2=
=80=98GFP_ATOMIC=E2=80=99?
> >      if (sc->gfp_mask & __GFP_ATOMIC)
> >                         ^~~~~~~~~~~~
> >                         GFP_ATOMIC
> >    drivers/gpu/drm/msm/msm_gem_shrinker.c:29:21: note: each undeclared =
identifier is reported only once for each function it appears in
> >
> > __GFP_ATOMIC is dropped by commit 6708fe6bec50 ("mm: discard __GFP_ATOM=
IC").
> > Use __GFP_HIGH instead.
> >
> > Fixes: 025d27239a2f ("drm/msm/gem: Evict active GEM objects when necess=
ary")
> > Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> > ---
> >   drivers/gpu/drm/msm/msm_gem_shrinker.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/msm/msm_gem_shrinker.c b/drivers/gpu/drm/m=
sm/msm_gem_shrinker.c
> > index 58e0513be5f4..6a0de6cdb82b 100644
> > --- a/drivers/gpu/drm/msm/msm_gem_shrinker.c
> > +++ b/drivers/gpu/drm/msm/msm_gem_shrinker.c
> > @@ -26,7 +26,7 @@ static bool can_swap(void)
> >
> >   static bool can_block(struct shrink_control *sc)
> >   {
> > -     if (sc->gfp_mask & __GFP_ATOMIC)
> > +     if (sc->gfp_mask & __GFP_HIGH)
> >               return false;
> >       return current_is_kswapd() || (sc->gfp_mask & __GFP_RECLAIM);
> >   }
>
> Reviewed-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
>

Somehow the original patch didn't show up in my inbox, but I've sent this:

https://patchwork.freedesktop.org/series/109255/

I guess __GFP_HIGH could also be used to detect GFP_ATOMIC, but
checking that direct reclaim is ok seems safer (ie. it should always
be safe to sleep in that case)

BR,
-R

>
> -Akhil.
