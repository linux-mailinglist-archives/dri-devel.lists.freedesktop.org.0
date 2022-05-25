Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CBBD534435
	for <lists+dri-devel@lfdr.de>; Wed, 25 May 2022 21:32:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC92010E8A9;
	Wed, 25 May 2022 19:32:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3EA810E8A9
 for <dri-devel@lists.freedesktop.org>; Wed, 25 May 2022 19:32:09 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id v9so16320812lja.12
 for <dri-devel@lists.freedesktop.org>; Wed, 25 May 2022 12:32:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IXpMztYYQ4QZ9paEgJt5rRwpPLlTYoXUEY6IN7/4Tdk=;
 b=L63c3kKfgx55scShDVzSSAPCzICZQAZucMDNkhmBLt3lpZYOHYjf6IFRvwThwwt9dA
 ie9veIzlpx17gDEzfrVFbn+zYKskDt/oQ3BMpBjBhuuYOVlYQ3cFKTreuZM+JnBRr6HW
 skhh+1FHVlmsiheMk/UCl695mgAoZhpwDYKnE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IXpMztYYQ4QZ9paEgJt5rRwpPLlTYoXUEY6IN7/4Tdk=;
 b=7U93CfWeaXnxCCxs2SDuW3XAIXHfDNu9KdXj74xjShMyB9XVbQARO2dHMUEmhlomea
 VSzJ/lVza3au0gcW9CjtTV9DHtnZXJ1Fm5K9K4bKV//oE09i2LeIybAuIkHWfZOKaXYG
 WmBuhY1dJE5AOcCwhU/SbE62vwi4DGF7frXrHbLrDXsGqItHkXVJj1wlb31RutWOxAN3
 qhbEII76VrLUlELy/OlcB2flbuj/SAE+VgJs9Ox82Yw+XRfgdYCzv/Extg9k3LtdM1hO
 yOgtQkHTpk7cjLoLDStbjcQRoDT0nTLBAae6+62zRBNXUM3qWl24KrDvCbuqgo1CAOHv
 F94Q==
X-Gm-Message-State: AOAM531P1JuA4/mwA1wIsYv4slagrZ4mtlxCxMAQ9hEqmDNFhvPU18DZ
 cIpH0BysM8CNcx7r1FJKzZGKCULmF2eTf92kA8Dvdg==
X-Google-Smtp-Source: ABdhPJw63GO2rMlLpUIsGQM6a+RdR8psyKqxOHHdsC3RKlmgYTGSOaxPN5E4fm1KlFc6ZWn9mdLDCpmJFxinVFIW7wY=
X-Received: by 2002:a2e:a911:0:b0:24f:41c7:81d7 with SMTP id
 j17-20020a2ea911000000b0024f41c781d7mr20398702ljq.309.1653507128026; Wed, 25
 May 2022 12:32:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220510190823.1552920-1-markyacoub@chromium.org>
 <878rr0fvcs.fsf@intel.com>
In-Reply-To: <878rr0fvcs.fsf@intel.com>
From: Mark Yacoub <markyacoub@chromium.org>
Date: Wed, 25 May 2022 15:31:57 -0400
Message-ID: <CAJUqKUpk4=oOYUmEAqEK2q_+xNiLfpvixPMXiC8sDu1pkwUyfQ@mail.gmail.com>
Subject: Re: [PATCH] drm: Create support for Write-Only property blob
To: Jani Nikula <jani.nikula@linux.intel.com>
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
 dri-devel@lists.freedesktop.org, seanpaul@chromium.org,
 Thomas Zimmermann <tzimmermann@suse.de>, markyacoub@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jani, thanks for your review. I got all the user space
implementation ready to see it in context.

libdrm patch to wrap this functionality:
https://www.spinics.net/lists/dri-devel/msg347318.html

Chromium user space implementation making direct use of the new prop flag:
crrev.com/c/3655850
The first call made to such functionality is in
https://chromium-review.googlesource.com/c/chromium/src/+/3655850/2/ui/display/manager/content_protection_key_manager.cc#137
where the call stack flows to the libdrm wrapper call at
https://chromium-review.googlesource.com/c/chromium/src/+/3655850/2/ui/ozone/platform/drm/gpu/drm_display.cc#203

I also wrote an IGT test to verify the intended behavior:
https://patchwork.freedesktop.org/patch/487331/?series=104373&rev=1

Let me know if I would need to update the commit message with any of
the aforementioned context.

Thanks!
-Mark Yacoub

On Tue, May 17, 2022 at 3:53 AM Jani Nikula <jani.nikula@linux.intel.com> wrote:
>
> On Tue, 10 May 2022, Mark Yacoub <markyacoub@chromium.org> wrote:
> > [Why]
> > User space might need to inject data into the kernel without allowing it
> > to be read again by any user space.
> > An example of where this is particularly useful is secret keys fetched
> > by user space and injected into the kernel to enable content protection.
>
> I think we're going to need more than an example in the commit
> message. See Documentation/gpu/drm-uapi.rst.
>
> BR,
> Jani.
>
>
> >
> > [How]
> > Create a DRM_MODE_CREATE_BLOB_WRITE_ONLY flag used by user space to
> > create a blob and mark the blob as write only.
> > On reading back the blob, data will be not be copied if it's a write
> > only blob
> >
> > Signed-off-by: Mark Yacoub <markyacoub@chromium.org>
> >
> > ---
> >  drivers/gpu/drm/drm_property.c | 3 ++-
> >  include/drm/drm_property.h     | 2 ++
> >  include/uapi/drm/drm_mode.h    | 6 ++++++
> >  3 files changed, 10 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/drm_property.c b/drivers/gpu/drm/drm_property.c
> > index dfec479830e4..afedf7109d00 100644
> > --- a/drivers/gpu/drm/drm_property.c
> > +++ b/drivers/gpu/drm/drm_property.c
> > @@ -765,7 +765,7 @@ int drm_mode_getblob_ioctl(struct drm_device *dev,
> >       if (!blob)
> >               return -ENOENT;
> >
> > -     if (out_resp->length == blob->length) {
> > +     if (out_resp->length == blob->length && !blob->is_write_only) {
> >               if (copy_to_user(u64_to_user_ptr(out_resp->data),
> >                                blob->data,
> >                                blob->length)) {
> > @@ -800,6 +800,7 @@ int drm_mode_createblob_ioctl(struct drm_device *dev,
> >               ret = -EFAULT;
> >               goto out_blob;
> >       }
> > +     blob->is_write_only = out_resp->flags & DRM_MODE_CREATE_BLOB_WRITE_ONLY;
> >
> >       /* Dropping the lock between create_blob and our access here is safe
> >        * as only the same file_priv can remove the blob; at this point, it is
> > diff --git a/include/drm/drm_property.h b/include/drm/drm_property.h
> > index 65bc9710a470..700782f021b9 100644
> > --- a/include/drm/drm_property.h
> > +++ b/include/drm/drm_property.h
> > @@ -205,6 +205,7 @@ struct drm_property {
> >   *   &drm_mode_config.property_blob_list.
> >   * @head_file: entry on the per-file blob list in &drm_file.blobs list.
> >   * @length: size of the blob in bytes, invariant over the lifetime of the object
> > + * @is_write_only: user space can't read the blob data.
> >   * @data: actual data, embedded at the end of this structure
> >   *
> >   * Blobs are used to store bigger values than what fits directly into the 64
> > @@ -219,6 +220,7 @@ struct drm_property_blob {
> >       struct list_head head_global;
> >       struct list_head head_file;
> >       size_t length;
> > +     bool is_write_only;
> >       void *data;
> >  };
> >
> > diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
> > index 0a0d56a6158e..de192d3813e9 100644
> > --- a/include/uapi/drm/drm_mode.h
> > +++ b/include/uapi/drm/drm_mode.h
> > @@ -1107,6 +1107,9 @@ struct drm_format_modifier {
> >       __u64 modifier;
> >  };
> >
> > +#define DRM_MODE_CREATE_BLOB_WRITE_ONLY                                        \
> > +     (1 << 0) /* data of the blob can't be read by user space */
> > +
> >  /**
> >   * struct drm_mode_create_blob - Create New blob property
> >   *
> > @@ -1120,6 +1123,9 @@ struct drm_mode_create_blob {
> >       __u32 length;
> >       /** @blob_id: Return: new property ID. */
> >       __u32 blob_id;
> > +     /** Flags for special handling. */
> > +     __u32 flags;
> > +     __u32 pad;
> >  };
> >
> >  /**
>
> --
> Jani Nikula, Intel Open Source Graphics Center
