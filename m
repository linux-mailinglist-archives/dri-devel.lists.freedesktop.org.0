Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA7371455ED
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jan 2020 14:31:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2A516E51A;
	Wed, 22 Jan 2020 13:31:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com
 [IPv6:2607:f8b0:4864:20::d44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D12C16E51D
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jan 2020 13:31:33 +0000 (UTC)
Received: by mail-io1-xd44.google.com with SMTP id e7so1958357iof.11
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jan 2020 05:31:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0kYqlmEoukSaPf7T8rn6nUU9S/z/ksz4JSRnjBUf9rg=;
 b=KPdH/yQ7rvLudyU7cIQHwM1k9WKpSHoIAUPxveCFJkHS5tjEzNLA9YZMXQeQZJKGRu
 hO3hreDconTJbOVsS/NuOu24woOX/VvGuIt+Izp06mf6Uc3e/1mIkLh4Fz4kLBfFWOhD
 PyR1sCse71wnNoqyNrLtdItJWJ2A0ghGhpBT66IhYfpvv7ZHOtgiwDqGIr3ihkU3j2NZ
 +a+XxnPMyERHJ7Ll5BH8gAgE4/wyh2sYHf8TjqVWg6BoFasFBXj6mYVVuxfvqA5efIwR
 Dp5STorbRj1dbbcBUjCmZ6gWaNa5x01386eWng8Q/8acqWZTFn2+hMSoHXNrJRXtY++G
 eQJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0kYqlmEoukSaPf7T8rn6nUU9S/z/ksz4JSRnjBUf9rg=;
 b=S3Z/2XwxzmZCMgt+WDi40UU9iqkbdfq2lFFF/xvll92MR4t4CMsXq9VMMJiUPr9NC0
 PfNy2uYpcDSpb/p6vJVjPy2NaiAgII7rC2DouK8GAIPrZ8CxMy0kP/hqiulLxm3Rb8a7
 g70u3C95vniLHBdpr/Sm2ckXmbN739M5MVyJgK13Ld+2ecAYS3bxu+ygTNZVi63lZFFa
 AfPYyUs6ygzYgDJLjDZdaFR7MEDQp4No3Pqf8s60TxTuy3+9G3btVgBvFizQZ3N/VWNk
 I5fhJ4uTBQWXu5Ua64QVzvv+x/80I2dUVvLNvv4ywX4ArKJm/g951xgfh38O/9/a+4Gf
 BYSA==
X-Gm-Message-State: APjAAAX13KsUH3Xcg9yXq5/i++UdQOK14hFE1izgVS79puwsjbbHQtW5
 mGrrY/P1W99dWfkFEEfJzCqKLrfHO7sY6HiG7u/epw==
X-Google-Smtp-Source: APXvYqx1bL8f819xrnO/PkTc3ibd7LkJePXu9T21XvC9xU8ZqAE+tvXDJKGtlLYvbUR/+Wf8k+f07HCiFSAxVGSctj8=
X-Received: by 2002:a5d:8cc4:: with SMTP id k4mr6955781iot.2.1579699893136;
 Wed, 22 Jan 2020 05:31:33 -0800 (PST)
MIME-Version: 1.0
References: <20200115034455.17658-1-pankaj.laxminarayan.bharadiya@intel.com>
 <20200115034455.17658-2-pankaj.laxminarayan.bharadiya@intel.com>
In-Reply-To: <20200115034455.17658-2-pankaj.laxminarayan.bharadiya@intel.com>
From: Sean Paul <sean@poorly.run>
Date: Wed, 22 Jan 2020 08:30:53 -0500
Message-ID: <CAMavQK+aXO5VMAwCu4jBbah6MkubnO+sUxd+av0A_=Ld_A9kzQ@mail.gmail.com>
Subject: Re: [Intel-gfx] [ [PATCH v2 01/10] drm/print: introduce new struct
 drm_device based WARN* macros
To: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
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
Cc: Jani Nikula <jani.nikula@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 sudeep.dutt@intel.com, dri-devel <dri-devel@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 14, 2020 at 10:49 PM Pankaj Bharadiya
<pankaj.laxminarayan.bharadiya@intel.com> wrote:
>
> Add new struct drm_device based WARN* macros. These are modeled after
> the core kernel device based WARN* macros. These would be preferred
> over the regular WARN* macros, where possible.
>
> These macros include device information in the backtrace, so we know
> what device the warnings originate from.
>
> Knowing the device specific information in the backtrace would be
> helpful in development all around.
>
> Signed-off-by: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>

Acked-by: Sean Paul <sean@poorly.run>

> ---
>  include/drm/drm_print.h | 29 +++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
>
> diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
> index 8f99d389792d..894a0b9437e2 100644
> --- a/include/drm/drm_print.h
> +++ b/include/drm/drm_print.h
> @@ -553,4 +553,33 @@ void __drm_err(const char *format, ...);
>  #define DRM_DEBUG_PRIME_RATELIMITED(fmt, ...)                          \
>         DRM_DEV_DEBUG_PRIME_RATELIMITED(NULL, fmt, ##__VA_ARGS__)
>
> +/*
> + * struct drm_device based WARNs
> + *
> + * drm_WARN*() acts like WARN*(), but with the key difference of
> + * using device specific information so that we know from which device
> + * warning is originating from.
> + *
> + * Prefer drm_device based drm_WARN* over regular WARN*
> + */
> +
> +/* Helper for struct drm_device based WARNs */
> +#define drm_WARN(drm, condition, format, arg...)                       \
> +       WARN(condition, "%s %s: " format,                               \
> +                       dev_driver_string((drm)->dev),                  \
> +                       dev_name((drm)->dev), ## arg)
> +
> +#define drm_WARN_ONCE(drm, condition, format, arg...)                  \
> +       WARN_ONCE(condition, "%s %s: " format,                          \
> +                       dev_driver_string((drm)->dev),                  \
> +                       dev_name((drm)->dev), ## arg)
> +
> +#define drm_WARN_ON(drm, x)                                            \
> +       drm_WARN((drm), (x), "%s",                                      \
> +                "drm_WARN_ON(" __stringify(x) ")")
> +
> +#define drm_WARN_ON_ONCE(drm, x)                                       \
> +       drm_WARN_ONCE((drm), (x), "%s",                                 \
> +                     "drm_WARN_ON_ONCE(" __stringify(x) ")")
> +
>  #endif /* DRM_PRINT_H_ */
> --
> 2.23.0
>
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
