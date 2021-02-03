Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 883D430DC5F
	for <lists+dri-devel@lfdr.de>; Wed,  3 Feb 2021 15:13:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A64F96EAD3;
	Wed,  3 Feb 2021 14:13:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x932.google.com (mail-ua1-x932.google.com
 [IPv6:2607:f8b0:4864:20::932])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C98996EAD3
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Feb 2021 14:13:42 +0000 (UTC)
Received: by mail-ua1-x932.google.com with SMTP id g5so8338076uak.10
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Feb 2021 06:13:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DHnGGmND97bo+DHppnFMe5t0nKKekhRblgWwhJMeRdQ=;
 b=C4OZfR+vPkcZ4Gu+Q1uxq9vxZhSxh1v2NEMzOvgBCCRu7XQ41Kb4J9Gl/pvQ8nNWQ5
 DSXWeGaHd98yimOauPEmg1KMuTyC/FuBRQP1EAiMGSkgcts4Yq8LMZE3/7X/x4NUXOxY
 khiVYyav0r4+LoDPhe+b42T09XGjCM3kl60QFdsmhQcxqjhm9jMFEy08ImQm+H2cohx3
 2h2XpSGV41YXw2QG5wDzB8IsRyikRaL96lhiYLdCdmh+n22BdPOrM9ds00dBR/lDlC9l
 Ve/3DLP3t5Xj8i3hc+loZQp+Kttha31mt5M0Uz3x7Vi8CCtKqnYpUrPRazK5cERML8GI
 XYkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DHnGGmND97bo+DHppnFMe5t0nKKekhRblgWwhJMeRdQ=;
 b=M7x4o/zfy0aBjlTHuhcm9OoRezNoDxoCGsfWY1wRqOdf+n07WZYBwwpKakYNm2ffot
 cuFV6GZxpacbyiKiUQBixkTTnFYh894HssY1PkUWfzmrFr+2lZfih5uTTP7vGfrlW1yk
 s+EzrUkyQ9yfo55nm67kWh29cmhQ9OdxJtN2uLJln1QhzOOtVgakQZw4VHx3vW0sUqLn
 rZ0kmV/wA3smYxiawF14sbr+LS4bN5Ukkr5C681qS23b0dixZTwzcXtIXtFjTI2xNRXg
 N3JhFF4OnDQFfBC57KT7hHEjZe7OGfc56CSEgGj6ru96DlZlFKsx2Xw7fjeg++2nx4DE
 7HTw==
X-Gm-Message-State: AOAM533SUCDMSbec3eHM9QUZ9FwaqWOQA5c9h7K2c5U+muqa964dJvaH
 VMXRqlUxeZVT/nhBmbibxHpq18m45qeYUogjpPIhA9I4K5s=
X-Google-Smtp-Source: ABdhPJyou2Iijd4g+sBzGYZa8GpFDCxcnR9LZkgTNiUz8xWanRhNU+lj3+81NfT2Cc+QsPIqgEtE8inI+ozfhSFULTo=
X-Received: by 2002:a9f:35a1:: with SMTP id t30mr1739856uad.106.1612361621981; 
 Wed, 03 Feb 2021 06:13:41 -0800 (PST)
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
In-Reply-To: <N0eVw6YLfc6v63pbpbmd1GPURTahNkBdrWWuwvJNYtXTryToehQecES5PSEqhZvm9yDhH6VLVw4wnSj1Ba3JXINtwZ6tWQXAgokAP32oIA0=@emersion.fr>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Wed, 3 Feb 2021 14:13:30 +0000
Message-ID: <CACvgo51nJLrcuAAH=RGxCY9Cf-ZGvgPqzdrKj8ODuhbL+eTWjw@mail.gmail.com>
Subject: Re: [PATCH] drm/fourcc: introduce DRM_FOURCC_STANDALONE guard
To: Simon Ser <contact@emersion.fr>
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
 dri-devel <dri-devel@lists.freedesktop.org>,
 James Park <james.park@lagfreegames.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 3 Feb 2021 at 13:47, Simon Ser <contact@emersion.fr> wrote:
>
> On Wednesday, February 3rd, 2021 at 12:03 PM, Emil Velikov <emil.l.velikov@gmail.com> wrote:
>
> > No issue then, great. Let's merge this trivial solution and move on to
> > other things.
>
> Just because one compositor isn't affected isn't an excuse for the
> kernel to force its users to use a specific C standard.

As said before, there are multiple ways to handle this _without_
introducing yet another UAPI header. I don't see why you're dismissing
all of them, can you elaborate?

Thanks
Emil
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
