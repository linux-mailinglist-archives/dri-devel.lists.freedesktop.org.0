Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D8FD233FEC
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jul 2020 09:21:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A21856E9EA;
	Fri, 31 Jul 2020 07:21:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E81386E9EA
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jul 2020 07:21:50 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id d6so16619140ejr.5
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jul 2020 00:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Q+wgF+A41fHE0qyuzyev6ggC9UX3UHueqdJil8s4P20=;
 b=jv8tGYaTgWbD2Rprqk3AArwOe0GTj0RkDTDlCwTr07KBbZl5/RrwnfUT5r9SDIUv6H
 O7d8MMQAtHuiLN6+wUJUfvfk3hJmOe/0aryF4GOXKdHIHZBdQzD9/zoIZ0pS1WqJfEFP
 sTF3rDdA+qRi7v8qinV/1o6TMXEchHXmci8BVVNdI/Vf6ABHv6TG3XcjxpwCgyuSRZRI
 63agJupDCkZZDXd4/P4BB1dF9OrGHRDhvBuBC0g+f626ibneSTDr8SngItYNkQ3CtqMJ
 1eI12OXEizuyTedBNM98O8FwLQ/2qqzZ/TsTzS8vDwZjGb9XokZqnhacBOSVaHSaX8kE
 DaRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Q+wgF+A41fHE0qyuzyev6ggC9UX3UHueqdJil8s4P20=;
 b=HohvxyOXawJXwXt2CdGL9NkrXf/+LY6489zQCud1jsXhhLH7EIzwDZbIe4N0386aVm
 0COKj3JtJnEXZjPT+zS0K93nyRh+S8Nn8IYhhUBEMRrLz5I+13EF16W5bGmrqGPeT/Zh
 XmV+4Nek69MnMdK+hspIi/m6L88iCKs4nae/v350o6L8dQkGwqSYQptH9ltgVohmgnT1
 J+TM+gTV2rtIIJeGS/l+W9ph2aEI5+r64Aqd2JhVu8PE8t8wnM8s7bykxj/B/pTqg8eg
 M0hSBEzTBWAqMfjpwvdBRKyS05O/htoFT/dAh5RMzS96U4AkZLU9VRyWvavxngT5KE1n
 shdg==
X-Gm-Message-State: AOAM532Jcwhfv+AK+9x4hCl1ZUIhmcsXfktEpnrvRYvtuPW1PKcvkxwF
 kyMvItekbNM4MthioaXy6lNKwDIiDwA9TyPzBj8=
X-Google-Smtp-Source: ABdhPJwmYB/XGI5FlP+L5WZbAOulnzMRfBv9yfB3EuOAfi01mHQYbwyNTSMBfLVcqTxXp6V7Sq5++ujBZaQMNzr9hD0=
X-Received: by 2002:a17:906:8782:: with SMTP id
 za2mr2645848ejb.419.1596180109555; 
 Fri, 31 Jul 2020 00:21:49 -0700 (PDT)
MIME-Version: 1.0
References: <20200731040520.3701599-1-airlied@gmail.com>
 <20200731040520.3701599-27-airlied@gmail.com>
 <43f848a2-579a-873f-4271-7bff0968888b@suse.de>
In-Reply-To: <43f848a2-579a-873f-4271-7bff0968888b@suse.de>
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 31 Jul 2020 17:21:38 +1000
Message-ID: <CAPM=9twAMwKsx_nSYz5tSFAb=Pp0m_SVWt+rewMk3RFVoUM4+A@mail.gmail.com>
Subject: Re: [PATCH 26/49] drm/ttm: add wrapper to get manager from bdev.
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, Roland Scheidegger <sroland@vmware.com>,
 "Koenig, Christian" <christian.koenig@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 31 Jul 2020 at 17:14, Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
> Hi
>
> Am 31.07.20 um 06:04 schrieb Dave Airlie:
> > From: Dave Airlie <airlied@redhat.com>
> >
> > This will allow different abstractions later.
>
> You should consider moving this patch to the beginning of the series, so
> that patches 1 to 25 can benefit from it.

I did consider it, but I'd have to move all the follow on patches as
well, and it got messy in rebase land, and I started introducing
errors, so I left it alone, and it's not necessary until the patch
that changes it's definition anyways.

Dave.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
