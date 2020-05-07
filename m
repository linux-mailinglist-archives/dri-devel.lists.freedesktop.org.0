Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B9E221C9D8A
	for <lists+dri-devel@lfdr.de>; Thu,  7 May 2020 23:39:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5AE26EA6E;
	Thu,  7 May 2020 21:39:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe43.google.com (mail-vs1-xe43.google.com
 [IPv6:2607:f8b0:4864:20::e43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95C5E6EA6E
 for <dri-devel@lists.freedesktop.org>; Thu,  7 May 2020 21:39:29 +0000 (UTC)
Received: by mail-vs1-xe43.google.com with SMTP id s11so4376900vsm.3
 for <dri-devel@lists.freedesktop.org>; Thu, 07 May 2020 14:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=M2REwmdOVymRYBMV7tQ7oOUCRpm+a0YhGPMvLHsCvKk=;
 b=dQ4tCio6irYP1q8bcUw+D4VKuUlm3btWo/5PTC4DAYF8EMw5Nq218WChyhlWlpgQlS
 LbygcAsZM3d8etC+ufLui8iRcw2Yt1L5GRs/b/QZ6rR04xDKfZOl0U6nS2BPJhgsYv9U
 9ac6paiz82cow2WGFoVPucwq70z58Ck4VpjcU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=M2REwmdOVymRYBMV7tQ7oOUCRpm+a0YhGPMvLHsCvKk=;
 b=ibD+x6Gh6gwuyqm8bDs4oI8YJyNJuJLY3zWgd82MvIMqcHejmVMvFTgYnPlXY6fNq0
 oHdI4z0ctZlyIfA83ftSr+XtfWrfy9Blb4IA6YDXj+cgSPRVQuk4OiIPOKyfEmlEhzCq
 J2xG6zROiesupAwJt4+dRLqmj9Dvcaa7EVfTdwCcdIqB7OHjKah9Ehp/vhBT01OrbR/N
 sRiwa6S9UImygb1iPXfCsteZ7i96YQ1i31EnxsdLz74ZBlISkapKLjdco2YhX3NPnb6p
 SfRwMvuIMUbSKEhRicMKHMf3XnkjonF7x6JFv0UfSzArtxiEnO5foUpHxL3ZGINocg/H
 iMfQ==
X-Gm-Message-State: AGi0Pubx5RR7xFcDnrhIK8AWK6MFtVJgq39zc3dHYGkyuo0UrmO+zom7
 v/mXxqXO/MzpTWNlIfX3NNho8Ugdnb8=
X-Google-Smtp-Source: APiQypISknJrEImJ9kzhvb5DZd5TkLCl/QL7oAMZpnVV3UdTdIlLYeyQ/4N5EsINPG1IvQzNY6flNA==
X-Received: by 2002:a67:eb17:: with SMTP id a23mr15085966vso.111.1588887568125; 
 Thu, 07 May 2020 14:39:28 -0700 (PDT)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com.
 [209.85.217.41])
 by smtp.gmail.com with ESMTPSA id u85sm3803335vsu.22.2020.05.07.14.39.27
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 May 2020 14:39:27 -0700 (PDT)
Received: by mail-vs1-f41.google.com with SMTP id x6so4480820vso.1
 for <dri-devel@lists.freedesktop.org>; Thu, 07 May 2020 14:39:27 -0700 (PDT)
X-Received: by 2002:a67:fc46:: with SMTP id p6mr15561029vsq.169.1588887566823; 
 Thu, 07 May 2020 14:39:26 -0700 (PDT)
MIME-Version: 1.0
References: <20200506140208.v2.1.Ibc8eeddcee94984a608d6900b46f9ffde4045da4@changeid>
 <20200506140208.v2.2.I0a2bca02b09c1fcb6b09479b489736d600b3e57f@changeid>
In-Reply-To: <20200506140208.v2.2.I0a2bca02b09c1fcb6b09479b489736d600b3e57f@changeid>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 7 May 2020 14:39:15 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Xp6m_MdnrxGG5S1YyateAkHua7iQ1EU5iftH0kYxTO5A@mail.gmail.com>
Message-ID: <CAD=FV=Xp6m_MdnrxGG5S1YyateAkHua7iQ1EU5iftH0kYxTO5A@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] dt-bindings: drm/bridge: ti-sn65dsi86: Improve the
 yaml validation
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 Sean Paul <seanpaul@chromium.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, May 6, 2020 at 2:03 PM Douglas Anderson <dianders@chromium.org> wrote:
>
> This patch adds the following checks to the yaml:
> - Remapping of the eDP output lanes is now limited to the subset of
>   remappings that the hardware supports.
> - No more additional properties can be added under 'ports'.
>
> This patch fixes the following bugs in the original yaml conversion:
> - Fixed dependency between 'data-lanes' and 'lane-polarities', which
>   was backwards.  Now you can only specify 'lane-polarities' if you
>   specified 'data-lanes'.  I could have sworn I tried this before.
> - We can't remap input lanes in this hardware.
>
> This patch doesn't do, but if someone knew how I'd love to:
> - Make sure if we have both 'lane-polarities' and 'data-lanes' that
>   they have the same number of elements.
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> This patch could be squashed atop the patch adding the yaml [1].  I'm
> sending separately for now to avoid churning the series another time.
>
> [1] https://lore.kernel.org/r/20200430124442.v4.4.Ifcdc4ecb12742a27862744ee1e8753cb95a38a7f@changeid
>
> Changes in v2:
> - ("... Improve the yaml validation") new for v2.
>
>  .../bindings/display/bridge/ti,sn65dsi86.yaml | 74 ++++++++++---------
>  1 file changed, 40 insertions(+), 34 deletions(-)

Please consider this patch abandoned.  Since I had other reasons to
send out a v5 of the original series this is now squashed in.  See:

https://lore.kernel.org/r/20200507143354.v5.4.Ifcdc4ecb12742a27862744ee1e8753cb95a38a7f@changeid

NOTE that patch #1 in this series, AKA ("drm/bridge: ti-sn65dsi86:
Implement lane reordering + polarity") is still sane/valid and still
applies just fine atop my v5 series.

-Doug
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
