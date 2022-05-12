Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4599C524FE1
	for <lists+dri-devel@lfdr.de>; Thu, 12 May 2022 16:22:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF28B10FA23;
	Thu, 12 May 2022 14:22:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AE8410FA23
 for <dri-devel@lists.freedesktop.org>; Thu, 12 May 2022 14:22:33 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id p26so9344807lfh.10
 for <dri-devel@lists.freedesktop.org>; Thu, 12 May 2022 07:22:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:cc;
 bh=rPnOfJw0T6UU7cqpzZ+d/TG5zakVBK0RQfAjuTld5dc=;
 b=YZXHaZtN+wM0fntocGWGb1b1EH/wlmqNG9zz7r6nNiH2kTuGiEqXe/N32kDJ2Zo/BJ
 mnz3wtKsE8mQPjpUSr2RnYxmu8H6W0hhfgVhFMs5gM4gGOTN7N9E06ILVUV1fAMC6Q3x
 ch01vrumcL3PpLSBYwrsw/vXASJ/qbK2lGf8I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:cc;
 bh=rPnOfJw0T6UU7cqpzZ+d/TG5zakVBK0RQfAjuTld5dc=;
 b=gvVBj6nIGs+RYJ4iV2ayxsO83cfL9a4jiw87e3qf5+s2w2QEs3yh19Kxdn5edZqT8n
 /UqYRAOzqZQK/0ofh+Z0IvCWEYsEZxcWdlxP4pzXHxr1lVeYqgMdtS9drqFcIVnXGp+f
 ru7BWQ8u5scuEHKtHeyV+ujqJv0iY2z2tbMXUBGdE3CCtCVM73w0ExDNafFx6znt3hWZ
 UWVLGJQ3VUQXuAiZZZ79hv2gOMlkFB1EiUcCmiMCPcK75ZjnGevFW/FTtUNKGzwX31Vx
 7wfX0w30oxnIOjE4jLNyqghPZ3m5fKuY9j9rvzs9h3hKh1Jq997bKm+0cq/y7IdYTP1j
 PakA==
X-Gm-Message-State: AOAM530GcEaPwhNs/uF1qwD2Y5+KoigB7+sAVwdPZ2OE7mYx3BqVVlHh
 2KTw42iNcBjHKPyhbhTiamqI3n9LTd9DUgQu+L5zIQ==
X-Received: by 2002:a05:6512:e87:b0:44a:5117:2b2b with SMTP id
 bi7-20020a0565120e8700b0044a51172b2bmt9449lfb.275.1652365351715; Thu, 12 May
 2022 07:22:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220510182810.1223574-1-markyacoub@chromium.org>
In-Reply-To: <20220510182810.1223574-1-markyacoub@chromium.org>
From: Mark Yacoub <markyacoub@chromium.org>
Date: Thu, 12 May 2022 10:22:21 -0400
Message-ID: <CAJUqKUptOgOOnReSS7Hb0btRokEP2uovQi9meLc=XExDSBx-4w@mail.gmail.com>
Subject: Re: [PATCH] drm: Add a debug message when getting a prop is missing
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 seanpaul@chromium.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, markyacoub@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

friendly ping :)

On Tue, May 10, 2022 at 2:28 PM Mark Yacoub <markyacoub@chromium.org> wrote:
>
> [Why]
> If a connector property is attached but
> drm_atomic_connector_get_property doesn't handle a case for it,
> modeteset will crash with a segfault without.
>
> [How]
> Add a debug message indicating that a connector property is not handled
> when user space is trying to read it.
>
> TEST=modetest
>
> Signed-off-by: Mark Yacoub <markyacoub@chromium.org>
> ---
>  drivers/gpu/drm/drm_atomic_uapi.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
> index acb1ee93d206..36b0f664dd80 100644
> --- a/drivers/gpu/drm/drm_atomic_uapi.c
> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> @@ -884,6 +884,12 @@ drm_atomic_connector_get_property(struct drm_connector *connector,
>                 return connector->funcs->atomic_get_property(connector,
>                                 state, property, val);
>         } else {
> +               // LOG that the kernel is missing handling this property as a case here.
> +               drm_dbg_atomic(
> +                       dev,
> +                       "[CONNECTOR:%d:%s] Get Property [PROP:%d:%s] is not handled\n",
> +                       connector->base.id, connector->name, property->base.id,
> +                       property->name);
>                 return -EINVAL;
>         }
>
> --
> 2.36.0.512.ge40c2bad7a-goog
>
