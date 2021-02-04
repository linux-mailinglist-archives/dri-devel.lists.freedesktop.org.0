Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ED93330EE63
	for <lists+dri-devel@lfdr.de>; Thu,  4 Feb 2021 09:32:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E56B26ECF3;
	Thu,  4 Feb 2021 08:32:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BC916EC70
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Feb 2021 04:25:46 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id s5so2402215edw.8
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Feb 2021 20:25:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lagfreegames.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=S9JgVVonCln8uIXH+gF52+MA8LqevrPhWl5pAfSjKo8=;
 b=bTYtfHRJ8GcJuZT+1NqMwCQqVUDwi6OXzsTuuU4Y7JcvT3I1x6Q0+5Cbdz6n2FjD/L
 k3aYPCdOJQziSXWcEDd3wFR9ACBzDdsTgjA/jAIZMi7d0oiCwhQ9eBDEC2mVXVjq7oXV
 rgJgawZW78FpkhOv7koEqyI48L/UtgEgSjZCeBNfwMNs7OI+vXpMDf4qc+KRcsCLVaCA
 lr6SgOHjuDKErWlHy/CZtamhqVlb0gSGWQjWNyvbSc0DXbBBlj0g8bWsQ6NWXRE0WsJF
 5XaH1MSJNjKCDoKPrD9eihJjKx9LicIkcG2lyonkAnPq2gxc4fffyiG0l6kjgoWDF93J
 XUBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=S9JgVVonCln8uIXH+gF52+MA8LqevrPhWl5pAfSjKo8=;
 b=d1bxg+guIeWykSSYrG30Ki/MM6MSbNmC1chYc1uTUtttvVowDELP/qk+gfSND7D8bp
 QAbqMNhpjEGgNNibV2Vhk3DWqm3Rm0ICtiOL29M8e+WqmoICKZGrmEMhn9TY2ihV017+
 YyOYoBWxge8QlN5S18m9mpgFNB3W7Tw80sQygmtLxK2DCwpNwLeKuYwazZTN9nF5Iicl
 tzbspq8/u0mtvM5hszhRlOPdYKV23zA9Bv8V8zylt5I698N4o5KUoW/bcqnnO5Gc/Ryt
 fpyFG6Z+lkP8/zMDkuzDHkz9fWnYvLiambUG5RfO7AJijmf9e+aO7DwRvZaHraeg1ZG0
 85tQ==
X-Gm-Message-State: AOAM531A577QjGwFnDYoZDJui6R1FktZvqtyVt5A0oW/IbLj50xV7+tQ
 TQRaCDLk0qvP+BA4PILf6KOtoNAvyHaBGYF3KUOnJg==
X-Google-Smtp-Source: ABdhPJzobErNygbIKV1pdbDt4RgMjnpWztVG8vpOalEZHhftWhrf0nU1WxEfytzavFgYCkT7hopOs/rFzBK6l2SvKSY=
X-Received: by 2002:a05:6402:1383:: with SMTP id
 b3mr6059437edv.131.1612412744955; 
 Wed, 03 Feb 2021 20:25:44 -0800 (PST)
MIME-Version: 1.0
References: <20210202224704.2794318-1-emil.l.velikov@gmail.com>
 <CABjik9dde-HCWBsfwxjD+jTKaoy-YxDeSObmH7X5rSzNHoA_qA@mail.gmail.com>
 <CACvgo53wJ2XrLRBy4ysOBfU5TFo7nBwDS_CyrPkB1rotJXW5Nw@mail.gmail.com>
 <KZZVYm0Qza351oOJ53ZX0pUcEa6NRh2sJJiq5OR2IjRlmJsdCZXRusR3ZuiiL5dqUgpR_STva8ySdYIJAUnSHVkU5HnNLzC68pNSEcuYdcA=@emersion.fr>
 <1eXnpBNSePW1qsq6q5BR3IEa6Q4DGeWBmJ23QArM9eGt12sN9W2Mhpk2OkUwZj-fhRjAtf9XNne5vxJ-7_JjPl549Ml3wxwMo0hhKsojL_4=@emersion.fr>
 <CACvgo53_f83NFhCkzDx5ydE+H0KdEYKx6Mgdk+-z1hZE8piM7Q@mail.gmail.com>
 <_L67Dl3bTZirFqSulhWUeN215npWnjsPyUzg7Rb-2iffHxMbZ1-H6ex7R14gdkDqZfpRw9xLoiol8m5WtPKuJxiBN_FcnailoQHvW02qNI0=@emersion.fr>
 <CACvgo51PDiXPQ=gfChZw2LQmg=NmvshTqw5F3HgkV_9vGYs=5w@mail.gmail.com>
 <N0eVw6YLfc6v63pbpbmd1GPURTahNkBdrWWuwvJNYtXTryToehQecES5PSEqhZvm9yDhH6VLVw4wnSj1Ba3JXINtwZ6tWQXAgokAP32oIA0=@emersion.fr>
 <CACvgo51nJLrcuAAH=RGxCY9Cf-ZGvgPqzdrKj8ODuhbL+eTWjw@mail.gmail.com>
 <3YZGYeCokyp-fEABJS4acHkPKfFBiHtsL3lM8fRBI-ma8q--4afeisOnhmHURa5iF8AVHpUdw2E7fKCe5bug9PX4j8HJ4btFWDdWepXftBY=@emersion.fr>
 <CABjik9dViqkQYixtfhZ+bNJjGWPcF=xCg4ptU3OjYeW-Xy42+g@mail.gmail.com>
In-Reply-To: <CABjik9dViqkQYixtfhZ+bNJjGWPcF=xCg4ptU3OjYeW-Xy42+g@mail.gmail.com>
From: James Park <james.park@lagfreegames.com>
Date: Wed, 3 Feb 2021 20:25:33 -0800
Message-ID: <CABjik9eKuJSevHfEqVPERUQ2tJEpubNoUB+_L+nP0rfOs+gSZQ@mail.gmail.com>
Subject: Re: [PATCH] drm/fourcc: introduce DRM_FOURCC_STANDALONE guard
To: Simon Ser <contact@emersion.fr>
X-Mailman-Approved-At: Thu, 04 Feb 2021 08:32:37 +0000
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
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 3, 2021 at 8:24 PM James Park <james.park@lagfreegames.com> wrote:
>
> Apologies for anything I've said so far that has been harsh. I'd like
> this discussion to be civil.
>
> I'm not sure if Simon is still on board with a patch given his thumbs
> up to Erik's comment on the Mesa merge request (which I responded to),
> but I would also like to know why adding another header file is
> problematic. I would prefer to keep the definitions deduplicated and
> make the code robust even for edge cases unless there's a good reason
> not to. Avoiding an extra file doesn't seem like a good enough reason
> to me, but I also don't have to maintain codebases that rely on these
> headers, so maybe there's something I'm overlooking.
>
> Thanks,
> James
>
> On Wed, Feb 3, 2021 at 6:21 AM Simon Ser <contact@emersion.fr> wrote:
> >
> > On Wednesday, February 3rd, 2021 at 3:13 PM, Emil Velikov <emil.l.velikov@gmail.com> wrote:
> >
> > > As said before, there are multiple ways to handle this without
> > > introducing yet another UAPI header. I don't see why you're dismissing
> > > all of them, can you elaborate?
> >
> > Because I hate it when I have to adjust my compiler flags because of
> > some third-party header.
> >
> > Can you explain what were the past issues with introducing a new
> > header?

And sorry for top-posting. Gmail habits.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
