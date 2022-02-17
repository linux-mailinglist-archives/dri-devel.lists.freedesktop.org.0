Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E40704BA7F0
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 19:15:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C62910E681;
	Thu, 17 Feb 2022 18:15:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com
 [IPv6:2607:f8b0:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 194AD10E662
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 18:15:33 +0000 (UTC)
Received: by mail-oi1-x22d.google.com with SMTP id ay7so477149oib.8
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 10:15:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LTdIi3omDeTFcEkX2muEvJCXzPVhzD5HrTufMm86oCI=;
 b=GSF0k4x3nPfJK+/zPABl1ZAtXgahSz7RYjSchmHk2bwKgMZF5sdY/KYcg/py1eNnBe
 oEo3hUU91BQ1QHyDl373gmhqHHBjrTt9ZV5zZygLW6ey4BEwP95BsALmYbV8Kh5EVbFc
 w1TQQXbpwAs3Hy1K0135JbMIuaz6JajLOnm94=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LTdIi3omDeTFcEkX2muEvJCXzPVhzD5HrTufMm86oCI=;
 b=wJ9BDwbxYj5EsRZwAq7sf1MzEb3ADaA3tY880256ybBdVzV7WkiNpCXdtpBznvY2qQ
 z+e31hHRdoxQDkiioXSDUPbed3j2yZ8Iicrzu8LlYG4qy3RrqTnCFnT4x8VRtDTUpyQ0
 Ot7TAPVxfYx3Quywl66W5+hhuZ4n6z1q6uRQx/YbmfVJalWfKjnbXpW5V7EtFC1rkBTu
 lig/q1Notge9EKbVyf5FLomKSAyTmtkQeX9aOFn+bp9hUc6wP0gIr2+f8Tgfr7rYBuD5
 jJ7dxJA/pbNwKHYa1YbwVnCngEQMuC1XNfA+7EN9jHF5+ArJcKjlrNHMDoLKUXMakmCm
 jhsQ==
X-Gm-Message-State: AOAM5306moHVB6Ucl5RtK8ElBICmoweSMNL81Uv9fBA5iU2oYlYIEcyP
 ahG5XyV+akrTteNLk63E4jpVjTV5RNbO1F/A9GMcYg==
X-Google-Smtp-Source: ABdhPJwkxr5ZAmKTEKFykke3Ix79Qf2hnC81K9ByuxjeKLO3pwvMOeqjqSCvpYhX5BtFRIoe/uhR/8Emp2+x6q8Z+oc=
X-Received: by 2002:a05:6808:1b0c:b0:2d2:fcfc:46a8 with SMTP id
 bx12-20020a0568081b0c00b002d2fcfc46a8mr1666869oib.278.1645121732284; Thu, 17
 Feb 2022 10:15:32 -0800 (PST)
MIME-Version: 1.0
References: <20220209224507.874751-1-jordan.l.justen@intel.com>
 <20220209224507.874751-4-jordan.l.justen@intel.com>
In-Reply-To: <20220209224507.874751-4-jordan.l.justen@intel.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Thu, 17 Feb 2022 19:15:21 +0100
Message-ID: <CAKMK7uEMLiMMkLgZgtGtE_1jBH4Rq4+g=9m_mh_jzL6dfH1x7g@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] drm/i915/uapi: Add struct
 drm_i915_query_hwconfig_blob_item
To: Jordan Justen <jordan.l.justen@intel.com>
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 Jon Bloomfield <jon.bloomfield@intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 9, 2022 at 11:45 PM Jordan Justen <jordan.l.justen@intel.com> wrote:
>
> Also, document DRM_I915_QUERY_HWCONFIG_BLOB with this struct.
>
> v3:
>  * Add various changes suggested by Tvrtko
>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Signed-off-by: Jordan Justen <jordan.l.justen@intel.com>
> Acked-by: Jon Bloomfield <jon.bloomfield@intel.com>

Please check with make htmldocs that the output works&looks good (you
mix up DOC: and struct sections, so that part wont work for sure).
With that addressed:

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  include/uapi/drm/i915_drm.h | 35 +++++++++++++++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
>
> diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
> index 069d2fadfbd9..8279515ae2ce 100644
> --- a/include/uapi/drm/i915_drm.h
> +++ b/include/uapi/drm/i915_drm.h
> @@ -3276,6 +3276,41 @@ struct drm_i915_gem_create_ext_protected_content {
>         __u32 flags;
>  };
>
> +/**
> + * DOC: GuC HWCONFIG blob uAPI
> + *
> + * The GuC produces a blob with information about the current device.
> + * i915 reads this blob from GuC and makes it available via this uAPI.
> + *
> + * The returned blob is a sequence of items of variable length
> + * described by struct drm_i915_query_hwconfig_blob_item. The
> + * drm_i915_query_hwconfig_blob_item length field gives the length of
> + * the drm_i915_query_hwconfig_blob_item data[] array. The length is
> + * the number of u32 items in the data[] array, and *not* the number
> + * of bytes.
> + *
> + * The key and length fields are required, so the minimum item size is
> + * 2 x u32, or 8 bytes, when the length field is 0. If the length
> + * field is 1, then the item's size is 12 bytes.
> + *
> + * The overall blob returned by DRM_I915_QUERY_HWCONFIG_BLOB will end
> + * at the same location as the end of the final
> + * drm_i915_query_hwconfig_blob_item. In other words, walking through
> + * the individual items is guaranteed to eventually arrive at the
> + * exact end of the entire blob.
> + *
> + * The meaning of the key field and the data values are documented in
> + * the Programmer's Reference Manual.
> + */
> +struct drm_i915_query_hwconfig_blob_item {
> +       /** @key: Enum which defines how to interpret @data values. */
> +       __u32 key;
> +       /** @length: The number of u32 values in the @data array. */
> +       __u32 length;
> +       /** @key: Array of values with meaning defined by @key */
> +       __u32 data[];
> +};
> +
>  /* ID of the protected content session managed by i915 when PXP is active */
>  #define I915_PROTECTED_CONTENT_DEFAULT_SESSION 0xf
>
> --
> 2.34.1
>


-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
