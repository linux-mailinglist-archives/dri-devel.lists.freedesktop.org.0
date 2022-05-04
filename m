Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DC6D51A62D
	for <lists+dri-devel@lfdr.de>; Wed,  4 May 2022 18:51:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACEC010FB71;
	Wed,  4 May 2022 16:50:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com
 [IPv6:2607:f8b0:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6938E10FB71;
 Wed,  4 May 2022 16:50:57 +0000 (UTC)
Received: by mail-oi1-x235.google.com with SMTP id n24so1730348oie.12;
 Wed, 04 May 2022 09:50:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rvTXB6edqfwGb9f3bN3lxER+CZs3NZn7TH176hxBXpU=;
 b=GNkCyoM+2e4VqyMeqAc6XDOIxo0acxXYnk0dvAoJMPXyjP7p1m5zCyN90OcqJlXSck
 wZbTJkwymZHdtUYtwYPwYXitIPHJvI3+KKMBThvHXowotIJJqvUyLGlEtBQS6EGDJSqg
 akLvOapKIygSbXMhAxwWN8ElOWAEWKtApcYnD+shBZzZCNEsdWBeXJn4Mg8LPeJYb+Je
 pVC3qPogL7oI3b/LcXQPOW8LzKllbFkQf2j2qaXbnTQilekkCR1aZK1urQn0feg/X55F
 uCxWIRPFnuZqjyO3PENDCApQTQh2vQObTB2LpLb3Ky8bWZyZ3Z1j7XPph+hcBZ+4di6X
 NcYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rvTXB6edqfwGb9f3bN3lxER+CZs3NZn7TH176hxBXpU=;
 b=xx0ZK5Q7Yg2Vh05RWQu+sMhBOJa7jEVMOlkbCrKX+WesCycbGGiyeoOYLYI4XuEGA+
 cn2yZfNt5mASCC1izJr6t0TWK3UHskuXxyPbi2bgL6QG8g+ynfv6Cf3fCnuYHqo5LO51
 FpGj3+OABz1os4d6+BXwjiNBblonBsLNFDRIN0ytytjt/SbndWbPPh4x7j6b760y/j3D
 IJODFDaKblFTqA+DfxhKj9wsbppeBydORUTr05eSURn2ROajY+q83hTTK/EUYKc6+7Hc
 z+tXsljrcrKmPd6dlwygbLZdVKvss9j3TvfU9tckPCNUkSRFEq6bA0WsCq21UamlQLYQ
 0D3w==
X-Gm-Message-State: AOAM532+StHja9/FUfEC+nen14Dn1ebtVykpX/MnAouZZRdj35Lho7Cs
 GhNFPr5AnduYHLb7YAe0Wcr+THjbR9fLanZhMfM=
X-Google-Smtp-Source: ABdhPJx4uwTlYsNe6HOusG/FP32seSoyAomH/gOW9LREI0kBv0/w+BK2TeJNhGUSvDhu8ccCCy8qixJrqoJxH06nAKo=
X-Received: by 2002:a05:6808:178d:b0:326:3fe9:7f03 with SMTP id
 bg13-20020a056808178d00b003263fe97f03mr175940oib.200.1651683056728; Wed, 04
 May 2022 09:50:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220504134833.1672728-1-alexander.deucher@amd.com>
 <f48a0482-7be9-29d5-b179-e572dfac11fa@redhat.com>
In-Reply-To: <f48a0482-7be9-29d5-b179-e572dfac11fa@redhat.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 4 May 2022 12:50:45 -0400
Message-ID: <CADnq5_Mp7EnBUgXaT=-5ndWMW9svpsDbTypj+DdehOXsEAw_4w@mail.gmail.com>
Subject: Re: [PATCH 1/2] Revert "drm/amdgpu: disable runpm if we are the
 primary adapter"
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 "open list:EFIFB FRAMEBUFFER DRIVER" <linux-fbdev@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 4, 2022 at 12:46 PM Javier Martinez Canillas
<javierm@redhat.com> wrote:
>
> Hello Alex,
>
> On 5/4/22 15:48, Alex Deucher wrote:
> > This reverts commit b95dc06af3e683d6b7ddbbae178b2b2a21ee8b2b.
> >
> > This workaround is no longer necessary.  We have a better workaround
> > in commit f95af4a9236695 ("drm/amdgpu: don't runtime suspend if there are displays attached (v3)").
> >
>
> I would write this line instead as:
>
> in commit f95af4a9236695 ("drm/amdgpu: don't runtime suspend if there are
> displays attached (v3)").

When you do it that way checkpatch and some maintainers complain about
splitting up a commit line across multiple lines.

Alex


>
> > Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> > ---
>
> The patch looks good to me.
>
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
>
> --
> Best regards,
>
> Javier Martinez Canillas
> Linux Engineering
> Red Hat
>
