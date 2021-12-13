Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E64794722A4
	for <lists+dri-devel@lfdr.de>; Mon, 13 Dec 2021 09:28:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20FD810E3C6;
	Mon, 13 Dec 2021 08:28:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2281E10E3C6
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Dec 2021 08:27:57 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id e3so50055836edu.4
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Dec 2021 00:27:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PAWeJlnTqwjNV3BwnSZNcQftWkC3yAuu8AHSfA/SrAg=;
 b=U0jZSorMI36Ga1706J3PTD5rSEq9Monps/A0SHMDzkMmb0435PXXRXMe/EjdKjQOGk
 hDSDZjdyMUsIzY8/di2H6ki8mdHCOZ5YNkogBhuq8hoOluCqLlExAdVzTBTZ4nE4VgJ7
 c860wS6N9de2LQ9Rpi6hoG6oY8+d+t6+XOMd4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PAWeJlnTqwjNV3BwnSZNcQftWkC3yAuu8AHSfA/SrAg=;
 b=Kdw9lBqCyyL4w7Olh+XJi3MbhUwQn4JveFs+WmZFPcuoo4VskAefYTE3rvcKWXzZ9h
 SbllRJoD0pYCvIuNbwwKBSd01ogFAWrLfc/FTItaMZctRbv6duw8qk897dpj1DeUwl+X
 yo2m8Tp8UNeLShE36Ye8JRQPPniayBGw9tSVCwtcmmSp3rK0Id5fGgh9f+D+prDn+6XF
 rA7P3NYtys/LybsYutIkX7mFNyoD8bEdoks+lNoVPg+uHn3YlJgFFbJKpJz9Vax2dKv0
 8q4Wpy7biXe5ukjpE4arJaMhtdfRQyQ6MD89RUlp2IUVcqvyT2t7xjhWdPpmtR2Qg/pm
 RLLg==
X-Gm-Message-State: AOAM533hd5svWdOgyBrvkPJafb6P+QFVTckAwarzPW6F2HAEPMD0DstN
 rNAhPIszLEH50YntO64/NYCdP9uUy0qTUIAd2Rzqhg==
X-Google-Smtp-Source: ABdhPJy96nmH+kTQAclKfKtc7u0ceJxvYcOCpQ1Qgpu7anM//esBMF4LhFPm2Ci5ogKbxY25m3qw488+Q22IrzwDi3E=
X-Received: by 2002:a17:906:52cf:: with SMTP id
 w15mr42967031ejn.122.1639384076032; 
 Mon, 13 Dec 2021 00:27:56 -0800 (PST)
MIME-Version: 1.0
References: <20211210191922.2367979-1-jagan@amarulasolutions.com>
 <20211210191922.2367979-2-jagan@amarulasolutions.com>
 <13b4724d-2257-84bf-5d2a-28fe8884819a@intel.com>
In-Reply-To: <13b4724d-2257-84bf-5d2a-28fe8884819a@intel.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Mon, 13 Dec 2021 13:57:45 +0530
Message-ID: <CAMty3ZCjBshHUbsHtgeptgEWhqBQvMes5N6Dn1czW0kdDinSAg@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] drm: exynos: dsi: Check panel for panel helpers
To: Andrzej Hajda <andrzej.hajda@intel.com>
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
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 linux-amarula@amarulasolutions.com, dri-devel@lists.freedesktop.org,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Sam Ravnborg <sam@ravnborg.org>, Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Andrzej,

On Mon, Dec 13, 2021 at 1:44 PM Andrzej Hajda <andrzej.hajda@intel.com> wrote:
>
>
> On 10.12.2021 20:19, Jagan Teki wrote:
> > Trigger the panel operation helpers only if host found the panel.
> >
> > Add check.
> >
> > Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
>
>
> Both helpers handle already "NULL panels", so these checks are redundant.

Got it. Please look at v3 if you have time.

Thanks,
Jagan.
