Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D82852881F
	for <lists+dri-devel@lfdr.de>; Mon, 16 May 2022 17:11:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBC12112191;
	Mon, 16 May 2022 15:11:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4455112191
 for <dri-devel@lists.freedesktop.org>; Mon, 16 May 2022 15:11:10 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id j4so26362219lfh.8
 for <dri-devel@lists.freedesktop.org>; Mon, 16 May 2022 08:11:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:cc;
 bh=ThtkhJjqmQfv2SviiAcmC8uKNvCTv+1Qfs3YExwXtrM=;
 b=AjpSNO+RwZkxk9UOYfbwCpYPaJePlh7oHjbLSRFeUi0zmB2xOIMXi5ZBJr625RCOqW
 RrV6ZMvjzumxfNzEYF65DfpGotjDd8oumRdmgUF4U0J6XGJDF7nl3AeCsxY67vKsk1v1
 Msru0Wty4qi5jhQCtr68vZDSjdPBoa0gPTL/k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:cc;
 bh=ThtkhJjqmQfv2SviiAcmC8uKNvCTv+1Qfs3YExwXtrM=;
 b=JLmCP6tzf7pX4N6cipSB3UI45HQJ1ROhGBByLan+NX/hqTlvjZ9XFTfmkYkPfo5w3z
 AlI7DfeVN9KbHt86oAqGIAcVsF1MhZBQbYa3tKIdw63OQz/rKPJ2+Ea1ukSsB+8frV/N
 vVM4H74EvNlDcqlWqTbZc/lgc+1KYAXMjDFC2vTR/iGfvlI+/NiVq2gFmQCsH/Mw8Fff
 xa7Teg74XbzZgYo3RIhGi1U2PUjXG83FWx2mQYwX1cbCSxodRa92dhXZuPhGIEE8F8HT
 SzeUYI4nYLD6yEkjHNxBtF9ph5rCEhF3/cSkLJke0LbrXJKSlT1zWIbyiKawYmLypJkR
 f1SQ==
X-Gm-Message-State: AOAM530dZiHpUBikGbmBanl/QXDmHkRra1BCe2xQv4cbgBllSF2yTVbo
 DJMeUnZxQe2ZorQsmkQlcDo2X2CcClG1MdKLr854UA==
X-Received: by 2002:ac2:4475:0:b0:473:f03c:a041 with SMTP id
 y21-20020ac24475000000b00473f03ca041mt3948438lfl.192.1652713868087; Mon, 16
 May 2022 08:11:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220510182810.1223574-1-markyacoub@chromium.org>
In-Reply-To: <20220510182810.1223574-1-markyacoub@chromium.org>
From: Mark Yacoub <markyacoub@chromium.org>
Date: Mon, 16 May 2022 11:10:57 -0400
Message-ID: <CAJUqKUp2OGxexZDncNZu9NAsScWtFaZqGKzBt8yf0JFzSLvaWA@mail.gmail.com>
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

friendly ping :))

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
