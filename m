Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4461876B32
	for <lists+dri-devel@lfdr.de>; Fri,  8 Mar 2024 20:27:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BB80113975;
	Fri,  8 Mar 2024 19:27:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="hmgP+wg4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com
 [209.85.210.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26F05113975
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Mar 2024 19:27:12 +0000 (UTC)
Received: by mail-ot1-f50.google.com with SMTP id
 46e09a7af769-6e4e8be9c85so1273804a34.3
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Mar 2024 11:27:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1709926031; x=1710530831;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jXnvICRLW55e5QZKhdr3I+R6SijOyLEgFcbGwwnR6cU=;
 b=hmgP+wg4ArW//gvV4xuBDtWquzwTYgFv5LX7lVYYHCgPMYHUxpOR6bZJdK9zFGisu7
 k8B2SUMPzpPYYmu9fBkc8XblxoemHiM7Yv4CcJlz0hVwkfEEyR9PHgc4lIO1xzCF3TOr
 N9Unf/zkSEyVuHROgSr/pTfhJPh2DYPzMMJBw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709926031; x=1710530831;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jXnvICRLW55e5QZKhdr3I+R6SijOyLEgFcbGwwnR6cU=;
 b=Wv+B7usCMhd9mOS8aaDwMky7QJkmIxgj8P/a3yYW2aaLvCyTLNPyLEtx8IkB0tdnSx
 vdQAb85Gmbavi1aXkTVbVPetXvWYNrm3OLlSwZ1lJo2htzQIvb9jrZ6JYfLH6hjQV0TE
 4eETb167CSP9rtqYQ0H+FqLXSRfyFbkZWIAH8o8Dyn8nIqbXKZvMRhoSK2+LeQXs//OA
 qGyWjYFZg77G/OiD/k4Ab7B8pbCLMyBo4cNvWrQndKrTSrnHdyDR1E76NcWi/bQCVyZv
 NDlI7Bm84eKCdQOJhKQ5sO5MTTsm4ATnwsDLGL6+w7ZgeyN1O1Z6DEB3FMZNdruO6WTG
 vU0w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWI388C1bi8uZs0iEFJCHavEQYjzQUVM3wIFZRu9DWNGDojLpREmD9PiJyLG+46z8Zy4QxiveLbSK/yZKIZQUx+L34c4oTMZs6RzFam3pKY
X-Gm-Message-State: AOJu0YzyH3BqJlpQCn7Ayt9hDKXBmCQ4wthOrw+WZY/oZOO/t1kYCCow
 fJOgVngrT7IHFkw0pmuSrM6Iac5mJh4sgjFDsmkKXKW39ogOX9DuIj/0i5efDYaVWIVKZDNpoZ9
 z6QMnTW6bCLYw2nA4fxySTZ9MZ4d+4Gqf3OxN
X-Google-Smtp-Source: AGHT+IHmJ73jVY79eXpNqwiPYZUcyVadGKAGRX0v7t36s1qBJT5asJhL74zysAc8l8NcjH3TYQI4pBDICuxAwPrSWz4=
X-Received: by 2002:a05:6830:1510:b0:6e4:a1a1:8d78 with SMTP id
 k16-20020a056830151000b006e4a1a18d78mr13033330otp.2.1709926030873; Fri, 08
 Mar 2024 11:27:10 -0800 (PST)
MIME-Version: 1.0
References: <20240307230653.1807557-1-hsinyi@chromium.org>
 <20240307230653.1807557-3-hsinyi@chromium.org>
 <87jzmduoy8.fsf@intel.com>
In-Reply-To: <87jzmduoy8.fsf@intel.com>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Fri, 8 Mar 2024 11:26:45 -0800
Message-ID: <CAJMQK-gy2BW8ySbBfUmKn=rVEyEyzLgMtAu0kS7vc8H=e5ayzw@mail.gmail.com>
Subject: Re: [PATCH v6 2/5] drm/edid: Add a function to match EDID with
 identity
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Douglas Anderson <dianders@chromium.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Mar 8, 2024 at 12:07=E2=80=AFAM Jani Nikula <jani.nikula@linux.inte=
l.com> wrote:
>
> On Thu, 07 Mar 2024, Hsin-Yi Wang <hsinyi@chromium.org> wrote:
> > Create a type drm_edid_ident as the identity of an EDID. Currently it
> > contains panel id and monitor name.
> >
> > Create a function that can match a given EDID and an identity:
> > 1. Reject if the panel id doesn't match.
> > 2. If name is not null in identity, try to match it in the detailed tim=
ing
> >    blocks. Note that some panel vendors put the monitor name after
> >    EDID_DETAIL_MONITOR_STRING.
> >
> > Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
>
> Reviewed-by: Jani Nikula <jani.nikula@intel.com>
>
> The series seems good to go. Thanks Hsin-Yi and Douglas for the
> constructive collaboration! I believe the end result is better now.
>

Thanks for everyone's suggestions to make it better.

> Thanks,
> Jani.
>
> --
> Jani Nikula, Intel
