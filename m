Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B60C30D708
	for <lists+dri-devel@lfdr.de>; Wed,  3 Feb 2021 11:09:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE2606E442;
	Wed,  3 Feb 2021 10:09:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x92b.google.com (mail-ua1-x92b.google.com
 [IPv6:2607:f8b0:4864:20::92b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D364D6E442
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Feb 2021 10:09:06 +0000 (UTC)
Received: by mail-ua1-x92b.google.com with SMTP id 20so387247uat.12
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Feb 2021 02:09:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8UwqsER9BCh5drVbM36Ifh+yW1OPJ5L0bJFCfv7FbAI=;
 b=kWq3/2auFwzEW73Grxb214gWP2GW+zbi8LDy56hriSnYaXBEIsUFBcMxICfDREZ8Fv
 Y+STxa2N3jTvlu9bMgAXNyl+0tB6XaAVPsFWc5R3USuj6bfIxd0subzgBlwcXAgjk2db
 41ratQ+hFLpxKwoqadvC2X6urV+t/pTUbqtVlsIJWbxJz9htTPsa463AlzIhGNurUT06
 qkuME60dUI3LDII2z309Gy8XOjjnnsESfd3qz28SB20rpqNKRC8v+I+xoUKk5Ht/iTpv
 bskwl4L2w4jw3UdS3qJUfgjrdzbqy7wI9SKvZodnFzJHJB9tvT9GusCDlSlG3o1Wpp+b
 y2zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8UwqsER9BCh5drVbM36Ifh+yW1OPJ5L0bJFCfv7FbAI=;
 b=uJN6d7czbuS1LWACZOmf+9rrDic0CTtqOOEEM/yHUpU46cf/H1qMapOTHLyBe99yon
 xM2KN93d0N4Oazocq8BTeyIdLQsQno9mRaEXKWwr9FySrmrq9+32jOaueZtlMSEMzpcG
 kk8kR2lJcApwmMPE/haHnrEqJ8qd4IyylZXlsVE2oK15WuFTUa94F7YFAv73jFJ3Ol3Q
 1YnDO2sJ/GzCjpjxdG8mGUeLmDIjaKf94ETOf+8vEh/UOgC0jrhouieVcNQ5JZKhwoub
 YSFQDpFYwoVCbrYf16a+5VySQsV9Fa92GLq0EuL2S68CHykO+dizDN1D01k82ZGCo3MS
 dIoQ==
X-Gm-Message-State: AOAM530K19n8k239RKiwATfCwKkhCVlsgqbzjxuYBT98bpnwwHgousnn
 zpiWWO0T76pU9lJ7x66f8eOiu30YliKso7z+C+c1n4N+2teKTA==
X-Google-Smtp-Source: ABdhPJwAovpF4QN+uTDVsrHFvsvDBiDJml+FTXjMW/PF3fqVoHx9/ws4pSmtHsGQw0+Bh1dvEaQTzqmicQeyN/ToQho=
X-Received: by 2002:ab0:160f:: with SMTP id k15mr1240780uae.69.1612346946093; 
 Wed, 03 Feb 2021 02:09:06 -0800 (PST)
MIME-Version: 1.0
References: <20210202224704.2794318-1-emil.l.velikov@gmail.com>
 <CABjik9dde-HCWBsfwxjD+jTKaoy-YxDeSObmH7X5rSzNHoA_qA@mail.gmail.com>
 <CACvgo53wJ2XrLRBy4ysOBfU5TFo7nBwDS_CyrPkB1rotJXW5Nw@mail.gmail.com>
 <KZZVYm0Qza351oOJ53ZX0pUcEa6NRh2sJJiq5OR2IjRlmJsdCZXRusR3ZuiiL5dqUgpR_STva8ySdYIJAUnSHVkU5HnNLzC68pNSEcuYdcA=@emersion.fr>
 <1eXnpBNSePW1qsq6q5BR3IEa6Q4DGeWBmJ23QArM9eGt12sN9W2Mhpk2OkUwZj-fhRjAtf9XNne5vxJ-7_JjPl549Ml3wxwMo0hhKsojL_4=@emersion.fr>
In-Reply-To: <1eXnpBNSePW1qsq6q5BR3IEa6Q4DGeWBmJ23QArM9eGt12sN9W2Mhpk2OkUwZj-fhRjAtf9XNne5vxJ-7_JjPl549Ml3wxwMo0hhKsojL_4=@emersion.fr>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Wed, 3 Feb 2021 10:08:54 +0000
Message-ID: <CACvgo53_f83NFhCkzDx5ydE+H0KdEYKx6Mgdk+-z1hZE8piM7Q@mail.gmail.com>
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

On Wed, 3 Feb 2021 at 09:27, Simon Ser <contact@emersion.fr> wrote:
>
> On Wednesday, February 3rd, 2021 at 1:56 AM, Emil Velikov emil.l.velikov@gmail.com wrote:
>
> > As summed in the commit message the burden is only applicable when all
> > of the following are set:
> >  - non-linux
> >  - force DRM_FOURCC_STANDALONE
> >  - c99 -pedantic
>
> Oh, and FWIW, this is not a theoretical situation at all. All of these
> conditions happen to be true on my compositor. It has FreeBSD CI,
> -Werror, and will use DRM_FOURCC_STANDALONE when available.

There are ways to disable [1] or silence [2] this - are you
intentionally ignoring them?
Or the goal here is to 'fix' the kernel for a very uncommon non-linux use-case?

-Emil

[1] pragma GCC diagnostic warning "-Wpedantic"
[2] pragma GCC diagnostic ignored or -std=c11
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
