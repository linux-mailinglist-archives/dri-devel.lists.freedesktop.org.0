Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F0AC352881D
	for <lists+dri-devel@lfdr.de>; Mon, 16 May 2022 17:11:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB0571120F6;
	Mon, 16 May 2022 15:11:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FFF811218D
 for <dri-devel@lists.freedesktop.org>; Mon, 16 May 2022 15:10:59 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id 4so18505596ljw.11
 for <dri-devel@lists.freedesktop.org>; Mon, 16 May 2022 08:10:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:cc;
 bh=I6V1S0+Ubt23S/fwZR+LgVaPvZqetjpsa3a8fOpRjX4=;
 b=f1SK0jcc+OeDOC8PPLG5ClBeeAkO62gvr8Eq3RI2ZTOXjogKMWL69gT2x9855jS/JF
 PWqjkoSrKChyGSIImOnjgcUYwVHDHH3EihM4tAm3O1N+iUIeiRKBURilv1YOWFqONnmM
 Upur3CRBYUAsJpu9YTUpE8COBZa4iUi4ISqFQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:cc;
 bh=I6V1S0+Ubt23S/fwZR+LgVaPvZqetjpsa3a8fOpRjX4=;
 b=ATzoAevHAFOpja4SueCRBygr7Xr/jQXWVSjDnCKSBIQyQjBg2KbwgxKyYM7Wj1T6X1
 4GQPDYTG2/AjeqdPWaWZn9k3rjn7fl9mxbzWdFLq8psUzpCEpPhJmyooMGSCKTnYxfWQ
 35R/PE5SaoiqfboInw09prU7UmCqNOugiL2wik/nj4wG/mCZD4cbBBV8o/wNqXEnzqWp
 iuuNcom/qEw161jEvRUrlSaG51uXat7ug/iWZ0GIc3Xd6XIwYP1bGj3EJmcEPwe8zuHc
 8KWwaJ7OJGKaAtshccdsbaLdMWa8C+I7hpG3YMX2LxMBhoLsaEqlCXzPLDp2K6mv0zLf
 Tyww==
X-Gm-Message-State: AOAM530afuDPsiu/uRmHMawC589L/1bVEmm/Vcz3Fg4usbRthi/2T2S8
 BrPea3B5uUMX0IfFQBoqYiLvYGN/d9A9QzGi1/K0yQ==
X-Received: by 2002:a05:651c:158b:b0:250:a056:7e48 with SMTP id
 h11-20020a05651c158b00b00250a0567e48mt4435923ljq.64.1652713857732; Mon, 16
 May 2022 08:10:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220510190823.1552920-1-markyacoub@chromium.org>
In-Reply-To: <20220510190823.1552920-1-markyacoub@chromium.org>
From: Mark Yacoub <markyacoub@chromium.org>
Date: Mon, 16 May 2022 11:10:46 -0400
Message-ID: <CAJUqKUr0sp5hEu=L+80pQ-Ba963WY6-G24dbob+KA5f+dhEypA@mail.gmail.com>
Subject: Re: [PATCH] drm: Create support for Write-Only property blob
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

On Tue, May 10, 2022 at 3:08 PM Mark Yacoub <markyacoub@chromium.org> wrote:
>
> [Why]
> User space might need to inject data into the kernel without allowing it
> to be read again by any user space.
> An example of where this is particularly useful is secret keys fetched
> by user space and injected into the kernel to enable content protection.
>
> [How]
> Create a DRM_MODE_CREATE_BLOB_WRITE_ONLY flag used by user space to
> create a blob and mark the blob as write only.
> On reading back the blob, data will be not be copied if it's a write
> only blob
>
> Signed-off-by: Mark Yacoub <markyacoub@chromium.org>
>
> ---
>  drivers/gpu/drm/drm_property.c | 3 ++-
>  include/drm/drm_property.h     | 2 ++
>  include/uapi/drm/drm_mode.h    | 6 ++++++
>  3 files changed, 10 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/drm_property.c b/drivers/gpu/drm/drm_property.c
> index dfec479830e4..afedf7109d00 100644
> --- a/drivers/gpu/drm/drm_property.c
> +++ b/drivers/gpu/drm/drm_property.c
> @@ -765,7 +765,7 @@ int drm_mode_getblob_ioctl(struct drm_device *dev,
>         if (!blob)
>                 return -ENOENT;
>
> -       if (out_resp->length == blob->length) {
> +       if (out_resp->length == blob->length && !blob->is_write_only) {
>                 if (copy_to_user(u64_to_user_ptr(out_resp->data),
>                                  blob->data,
>                                  blob->length)) {
> @@ -800,6 +800,7 @@ int drm_mode_createblob_ioctl(struct drm_device *dev,
>                 ret = -EFAULT;
>                 goto out_blob;
>         }
> +       blob->is_write_only = out_resp->flags & DRM_MODE_CREATE_BLOB_WRITE_ONLY;
>
>         /* Dropping the lock between create_blob and our access here is safe
>          * as only the same file_priv can remove the blob; at this point, it is
> diff --git a/include/drm/drm_property.h b/include/drm/drm_property.h
> index 65bc9710a470..700782f021b9 100644
> --- a/include/drm/drm_property.h
> +++ b/include/drm/drm_property.h
> @@ -205,6 +205,7 @@ struct drm_property {
>   *     &drm_mode_config.property_blob_list.
>   * @head_file: entry on the per-file blob list in &drm_file.blobs list.
>   * @length: size of the blob in bytes, invariant over the lifetime of the object
> + * @is_write_only: user space can't read the blob data.
>   * @data: actual data, embedded at the end of this structure
>   *
>   * Blobs are used to store bigger values than what fits directly into the 64
> @@ -219,6 +220,7 @@ struct drm_property_blob {
>         struct list_head head_global;
>         struct list_head head_file;
>         size_t length;
> +       bool is_write_only;
>         void *data;
>  };
>
> diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
> index 0a0d56a6158e..de192d3813e9 100644
> --- a/include/uapi/drm/drm_mode.h
> +++ b/include/uapi/drm/drm_mode.h
> @@ -1107,6 +1107,9 @@ struct drm_format_modifier {
>         __u64 modifier;
>  };
>
> +#define DRM_MODE_CREATE_BLOB_WRITE_ONLY                                        \
> +       (1 << 0) /* data of the blob can't be read by user space */
> +
>  /**
>   * struct drm_mode_create_blob - Create New blob property
>   *
> @@ -1120,6 +1123,9 @@ struct drm_mode_create_blob {
>         __u32 length;
>         /** @blob_id: Return: new property ID. */
>         __u32 blob_id;
> +       /** Flags for special handling. */
> +       __u32 flags;
> +       __u32 pad;
>  };
>
>  /**
> --
> 2.36.0.512.ge40c2bad7a-goog
>
