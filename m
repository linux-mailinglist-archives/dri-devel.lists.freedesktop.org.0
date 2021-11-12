Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA3FC44E411
	for <lists+dri-devel@lfdr.de>; Fri, 12 Nov 2021 10:40:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1804C6EBFB;
	Fri, 12 Nov 2021 09:40:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAB956EB91
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Nov 2021 09:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636710009;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ChwqGEU71MP3pmS3G7ZC9yqmE+mk5CmpL7Ob1CpxwBs=;
 b=K7mcknVHjc9p+Wz0WqMcwTGIwINAFGeh4ztwk1Ea1TrXdeYV4DERcZ5/MgVxeW+8b14wpA
 MNV2QSWqjaXMO2WOKX87jCjTjg8Z6dpDDgH4/1ODBB7giRjK/FibORJTmnR/FgerM8ZGnH
 ykZ+9L+AnhWuimm4Pq5f85OxlqOHQu4=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-399-oeRmpP55MFy8HPyNJkb8gg-1; Fri, 12 Nov 2021 04:40:08 -0500
X-MC-Unique: oeRmpP55MFy8HPyNJkb8gg-1
Received: by mail-ed1-f69.google.com with SMTP id
 w12-20020a056402268c00b003e2ab5a3370so7814315edd.0
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Nov 2021 01:40:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ChwqGEU71MP3pmS3G7ZC9yqmE+mk5CmpL7Ob1CpxwBs=;
 b=TegSL0pQIBY6l8BSpgEuneaxqvVNWsoF1Xtaas8Zj8/pYxjpQdO96jMx6nZ6NarP4i
 9kWxH1Zg5MUIlYPxhSY9YAM7rOKZmhc3wiy7ttb2DtOI+FQHI+1nzyPlIZ83pdMHdvE2
 A0NajsFIxaPExiVT5pc7uattKvhPiRGH057RGQ/vIBNj4pI32gdo63i3tA7cT2kIKEOz
 8AVv/zfGhWPI9QkXAuymtqZZlWavepuWR3f0mIox65dGRzHSskCihIxNlB33trazZyI1
 BT3DrrNObCQGaTI70Ga17Rb6NxOJYN8dUo33RmFgP5DF+uJGg6gpxXR5NJu9g76orHmj
 x/Sg==
X-Gm-Message-State: AOAM532CO0oksqqqDJwDu5lewKTdFKUgA+QpxPBPXcZVS3BjZop5BiM4
 JrUd/nJTiPLatoOnx0TCVddXckVxYR7DGw8/aFD7UMDETj41XksCxChNairLSXDK8ozM4aw8vCu
 X22sE+MOod4R/SMNx0ru36aL5X2pmlNL2eBckjGQ9dTc8
X-Received: by 2002:a50:d741:: with SMTP id i1mr7357796edj.37.1636710006981;
 Fri, 12 Nov 2021 01:40:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzeg1NEvHBbn632kiGcktiP/iHbgoMjBkpWDIyE8LgbJYWl3t9EL9C71Fq9I/TftxPLG6bqhHKfEWZTro2IicM=
X-Received: by 2002:a50:d741:: with SMTP id i1mr7357756edj.37.1636710006784;
 Fri, 12 Nov 2021 01:40:06 -0800 (PST)
MIME-Version: 1.0
References: <20211108140648.795268-1-javierm@redhat.com>
 <a8d93a19-c7e6-f651-a1cb-9e2742383c73@suse.de>
 <20211112105641.25a4e1a7@eldfell>
In-Reply-To: <20211112105641.25a4e1a7@eldfell>
From: Javier Martinez Canillas <javierm@redhat.com>
Date: Fri, 12 Nov 2021 10:39:56 +0100
Message-ID: <CAFOAJEd6wNDF93Z1Y6-62pnRzth9Fg4+56+jqCe2qmHk-adR1w@mail.gmail.com>
Subject: Re: [PATCH v4 0/6] Cleanups for the nomodeset kernel command line
 parameter logic
To: Pekka Paalanen <ppaalanen@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=fmartine@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: Jani Nikula <jani.nikula@intel.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Peter Robinson <pbrobinson@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Pekka,

On 11/12/21 09:56, Pekka Paalanen wrote:

[snip]

>
> Hi,
>
> these ideas make sense to me, so FWIW,
>
> Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>
>

Thanks.

> There is one nitpick I'd like to ask about:
>
> +bool drm_get_modeset(void)
> +{
> +     return !drm_nomodeset;
> +}
> +EXPORT_SYMBOL(drm_get_modeset);
>
> Doesn't "get" have a special meaning in the kernel land, like "take a
> strong reference on an object and return it"?

That's a very good point.

> As this is just returning bool without changing anything, the usual
> word to use is "is". Since this function is also used at most once per
> driver, which is rarely, it could have a long and descriptive name.
>
> For example:
>
> bool drm_is_modeset_driver_allowed(void);
>

Yeah, naming is hard. Jani also mentioned that he didn't like this
function name, so I don't mind to re-spin the series only for that.

> - "drm" is the namespace
> - "is" implies it is a read-only boolean inspection
> - "modeset" is the feature being checked
> - "driver" implies it is supposed gate driver loading or
>   initialization, rather than modesets after drivers have loaded
> - "allowed" says it is asking about general policy rather than what a
>   driver does
>

I believe that name is more verbose than needed. But don't have a
strong opinion and could use it if others agree.

> Just a bikeshed, I'll leave it to actual kernel devs to say if this
> would be more appropriate or worth it.
>

I think is worth it and better to do it now before the patches land, but
we could wait for others to chime in.

Best regards,
--
Javier Martinez Canillas
Linux Engineering
Red Hat

