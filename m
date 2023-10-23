Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A14507D41C0
	for <lists+dri-devel@lfdr.de>; Mon, 23 Oct 2023 23:33:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D709010E277;
	Mon, 23 Oct 2023 21:32:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com
 [IPv6:2607:f8b0:4864:20::1132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7147810E273
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Oct 2023 21:32:48 +0000 (UTC)
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-5a7d532da4bso38317617b3.2
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Oct 2023 14:32:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698096767; x=1698701567; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=cAPG5X3G8RZvxrGs3yB3EPh3Ju7K2BQAKtX7arIVOK4=;
 b=AIZOnbWxYSnskJ5lBvR/G1zDj1Gzm26SqVBpEWXywQtU0mlXnFJCvMytnVoClYmpUs
 4qCjCbdnzz5yKFTj312S/1Ylxor7O4ShyQNoAdOpgMzjbhuhRO5pk024GcGROZLXwTCd
 XyVB6oDIZiCUMO+Ip3jN342J14OZo1jmBr7j2QZYb0ib29MenCL0rges0C9lXenG/ysK
 LtsUjC/kN31w418xemD79Pm0gG6/4vn7BmhqzhdKzfMLepxODLGN4LPvoPgSjN1Ampir
 SKy6RFEkL8XoLAe84ag6oQgW0RR1DRHpSkZV/ixVSHf3c2q635UQFe1lpbroLnGpS+3G
 RTBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698096767; x=1698701567;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cAPG5X3G8RZvxrGs3yB3EPh3Ju7K2BQAKtX7arIVOK4=;
 b=L7EROqUNPKh4EI/4w/my89TqISkz3W+rIS5Ajj2Xt7//lgWUdA4H2OjecGr8kKXWDU
 1Pn8YUmv4fTi9moAibO0tV+gHVqUSj/mLGwV2yML0VB5dVyo/MHvqb9pw/LIOnteErkK
 99dJT5nqsxr9Mbg98SmbM+ghNAbqwx9rbPrM/FhdsqZwrg07clTdpfnZbP6QLbgDKM9P
 OS4LY3Ss13jPHDyzFhyYfAiZveSu/S5sRpdqaGVWR9bmhOcb5t6bQeafcHlqbiDq6mEr
 nTvmvr2Bu3AC8hGB110DYS2gaNcvYXWlhSdljOh2jKXPCC9TgCd1pIWXgrQEw/k4Ghdw
 9fYw==
X-Gm-Message-State: AOJu0YyDXSDkUoXZWw6aju+1fpYGix3d5KJEqKmOcmbqYZbIWRY5AggA
 usRaukivSHSEplG39wNyzHMzAjn4EYT6ayMiUSojWg==
X-Google-Smtp-Source: AGHT+IGz7s6Mpy1gXE+WVodg+X6uBk6TSZ8dKNNZGKWxbNse/kI/1RQQpq/V7gEdO+s7IAOh7FQ1Ua972FWFcMyJjRM=
X-Received: by 2002:a0d:e254:0:b0:586:a684:e7ba with SMTP id
 l81-20020a0de254000000b00586a684e7bamr10817324ywe.39.1698096767422; Mon, 23
 Oct 2023 14:32:47 -0700 (PDT)
MIME-Version: 1.0
References: <20231023203629.198109-1-contact@emersion.fr>
In-Reply-To: <20231023203629.198109-1-contact@emersion.fr>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 24 Oct 2023 00:32:36 +0300
Message-ID: <CAA8EJpqrxudWOzk61eJMX8aJRwodcdRD+r4aMGJXsqO-fqrutQ@mail.gmail.com>
Subject: Re: [PATCH] drm/doc: describe PATH format for DP MST
To: Simon Ser <contact@emersion.fr>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Pekka Paalanen <pekka.paalanen@collabora.com>, dri-devel@lists.freedesktop.org,
 wayland-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 23 Oct 2023 at 23:37, Simon Ser <contact@emersion.fr> wrote:
>
> This is already uAPI, xserver parses it. It's useful to document
> since user-space might want to lookup the parent connector.
>
> Additionally, people (me included) have misunderstood the PATH
> property for being stable across reboots, but since a KMS object
> ID is baked in there that's not the case. So PATH shouldn't be
> used as-is in config files and such.
>
> Signed-off-by: Simon Ser <contact@emersion.fr>
> Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>  drivers/gpu/drm/drm_connector.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
> index c3725086f413..392bec1355a3 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -1198,6 +1198,11 @@ static const u32 dp_colorspaces =
>   *     drm_connector_set_path_property(), in the case of DP MST with the
>   *     path property the MST manager created. Userspace cannot change this
>   *     property.
> + *
> + *     In the case of DP MST, the property has the format
> + *     ``mst:<parent>-<ports>`` where ``<parent>`` is the KMS object ID of the
> + *     parent connector and ``<ports>`` is a hyphen-separated list of DP MST
> + *     port numbers. Note, KMS object IDs are not stable across reboots.

Nit:  maybe `... is not guaranteed to be stable...'

>   * TILE:
>   *     Connector tile group property to indicate how a set of DRM connector
>   *     compose together into one logical screen. This is used by both high-res
> --
> 2.42.0
>
>


-- 
With best wishes
Dmitry
